<?php
/**
* 0x00 	char[4] always 'WDBC' 
* 0x04 	uint32 	nRecords - number of records in the file 
* 0x08 	uint32 	nFields - number of 4-byte fields per record 
* 0x0C 	uint32 	recordSize = nFields * 4 (not always true!) 
* 0x10 	uint32 	string block size
**/
define('DEF_HEADER_SIZE',20);
if(!defined('INDEX_PRIMORY_KEY')){
	define('INDEX_PRIMORY_KEY',1);
}
define("FT_NA",'x');       // unknown, size 0x4
define("FT_NA_BYTE",'X');  // unknown, size 0x1
define("FT_STRING",'s');   // char*/string, size 0x4
define("FT_FLOAT",'f');    // float, size 0x4
define("FT_IND",'n');      // uint32, size 0x4
define("FT_INT",'i');      // uint32, size 0x4
define("FT_BYTE",'b');     // uint8, size 0x1
define("FT_SORT",'d');     // sorted, size 0x4, sorted by this field, field is not included
define("FT_LOGIC",'l');    // bool/logical, size 0x1

define('DB_TABLE_INFO','_dbc_info_');
define('FILE_FMT','fmt.php');
define('FILE_STRUCT','struct.php');

class DBCparser
{
	private static $_signature = 'WDBC';
	private static $_dir = 'dbc/';

	var $file = null;
	var $name = null;
	var $format = '';
	var $field = null;
	var $header = null;
	var $countRecords = 0;
	var $countFields = 0;
	var $sizeRecord = 0;
	var $sizeString = 0;
	var $formatRecordSize = 0;
	var $isValid = false;
	var $_STR = array(
		'FILE_NOT_EXISTS' => 'Файл <b>%s</b> не найден',
		'INCORRECT_SIGNATURE' => 'Заголовок файла некорректен (%s)',
		'INCORRECT_FORMAT_FILE' => 'Ошибка в формате файла',
		'DIFF_COUNT_FIELDS' => 'fields count diff (dbc: %d, xml: %d)',
		'DIFF_SIZE_RECORDS' => 'Record size diff (dbc: %d, xml: %d)'
	);
	var $error = null;

	function __construct($file=null){
		global $db_config;

		include_once('dbsimple/Generic.php'); // including simple conecting for DB
		$this->DB = DbSimple_Generic::connect($db_config['dbc_dns']);
		$this->DB->setErrorHandler("databaseErrorHandler");
		// $this->DB->setLogger("databaseLogHandler");
		// $this->DB->setIdentPrefix($db_config['db_prefix']);
		$this->initDB();

		if($file == null)
			return;

		if($this->file = fopen(self::$_dir.$file, "rb")){
			$ex = explode('.',$file);
			$this->name = $ex[0];

			$this->dom = new DOMDocument();
			$this->dom->preserveWhiteSpace = false;
			$this->dom->substituteEntities = true;
			$xmlfile = 'xml/'.$this->name.'.xml';
			if(file_exists($xmlfile)){
				$this->dom->Load($xmlfile);
				$this->XML = $this->dom->getElementsByTagName('file')->item(0);
				$this->format = $this->XML->getAttribute('format');
				return;
			}
		}else{
			$this->error = sprintf($this->_STR['FILE_NOT_EXISTS'], $file);
		}
	}

	function _set($filename = null){
		if($filename == null)
			trigger_error(sprintf($this->_STR['FILE_NOT_EXISTS'], $filename), E_USER_ERROR);

		$this->name = $filename;
		if($this->file = fopen(self::$_dir.$this->name.'.dbc', "rb")){
			$row = $this->DB->selectRow("SELECT * FROM ?# WHERE `file`=?",DB_TABLE_INFO,$this->name);
			if(isset($row['format']) && $row['format'] != ''){
				$this->format = $row['format'];
			}
			if(isset($row['size_record']) && $row['size_record'] > 0){ // fix/hack
				$this->sizeRecord = $row['size_record'];
			}
		}else{
			trigger_error(sprintf($this->_STR['FILE_NOT_EXISTS'], $this->name), E_USER_ERROR);
		}
	}

	public function getHeader(){
		$this->header = fread($this->file, DEF_HEADER_SIZE);

		if($h = substr($this->header,0,4) !== self::$_signature){
			$this->error = sprintf($this->_STR['INCORRECT_SIGNATURE'],$h);
			return false;
		}

		$this->countRecords = base_convert(bin2hex(strrev(substr($this->header,4,4))), 16, 10);
		$this->countFields = base_convert(bin2hex(strrev(substr($this->header,8,4))), 16, 10);
		$this->sizeRecord = base_convert(bin2hex(strrev(substr($this->header,12,4))), 16, 10);
		$this->sizeString = base_convert(bin2hex(strrev(substr($this->header,16,4))), 16, 10);
		$this->is_valid = $this->checkSizeOf();

		$this->writeDBCInfo();

		return true;
	}

	private function getFormatRecord(){
		$this->formatRecordSize = 0;
		$c = strlen($this->format);
		for($i=0;$i<$c;$i++) {
			switch($this->format[$i]){
				case FT_NA:
				case FT_STRING:
				case FT_FLOAT:
				case FT_INT:
				case FT_SORT:
				case FT_IND:
					$this->formatRecordSize += 4;
					break;
				case FT_NA_BYTE:
				case FT_BYTE:
				case FT_LOGIC:
					$this->formatRecordSize += 1;
					break;
				default:
					$this->error = $this->_STR['INCORRECT_FORMAT_FILE'];
					return false;
					break;
			}
		}
		return true;
	}

	public function checkSizeOf(){
		$this->getFormatRecord();

		if($this->formatRecordSize != $this->sizeRecord){
			$this->error = sprintf($this->_STR['DIFF_SIZE_RECORDS'],$this->sizeRecord,$this->formatRecordSize);
			return false;
		}
		return true;
	}

	private function getFields(){
		$this->field = array();
		
		foreach($this->XML->getElementsByTagName('field') as $field){
			$this->field[$field->getAttribute('id')] = array(
				'count' => (int) $field->getAttribute('count'),
				'name' => (string) $field->getAttribute('name'),
				'type' => (string) $field->getAttribute('type'),
				'key' => (int) $field->getAttribute('key')
			);
		}
	}

	private function createTable(){
		if($this->error != '')
			return false;

		if(!$this->countFields)
			return false;

		$sql = "CREATE TABLE ?# (\n";
		$this->getFields(); // return $this->fields

		$collums = 0;
		$ittr = 0;
		$pkey = '';
		for($i=0; $i<$this->countFields; $i++) {
			if($collums>1 && $ittr==$collums){ // reset counters
				$collums = 0;
				$ittr = 0;
			}

			$field 	= $this->field[$i]['name'];
			if($this->field[$i]['key']==INDEX_PRIMORY_KEY) // prymory key
				$pkey = $field;

			if($this->field[$i]['count']>1){
				$collums = $this->field[$i]['count'];
				$temp_f = $field;
			}

			if($collums>1 && $ittr<$collums){
				$ittr++;
				$field = $temp_f."_".$ittr;
			}else{
				$collums = 0;
				$ittr = 0;
			}
			$sql .= "`$field`";
			switch($this->format[$i]){
				case FT_FLOAT:
					$sql .= " FLOAT NOT NULL DEFAULT '0'";
					break;
				case FT_IND:
					$sql .= " INT UNSIGNED NOT NULL DEFAULT '0'";
					break;
				case FT_NA:
				case FT_INT:
					$sql .= " INT NOT NULL DEFAULT '0'";
					break;
				case FT_SORT:
					$sql .= " DOUBLE NOT NULL DEFAULT '0'";
					break;
				case FT_NA_BYTE:
				case FT_LOGIC:
					$sql .= " TINYINT UNSIGNED NOT NULL DEFAULT '0'";
					break;
				case FT_BYTE:
					$sql .= " SMALLINT UNSIGNED NOT NULL DEFAULT '0'";
					break;
				case FT_STRING:
					$sql .= " TEXT NOT NULL";
					break;
				default:
					$this->error = $this->_STR['INCORRECT_FORMAT_FILE'];
					return false;
					break;
			}
			$sql .= ($i+1==$this->countFields)? "\n":",\n";
		}

		
		if($pkey != ''){
			$sql .= ", PRIMARY KEY (`$pkey`)\n";
		}

		$sql .= sprintf(") ENGINE=InnoDB DEFAULT CHARSET=utf8  COMMENT='Export of %s';",$this->name);
		
		$this->DB->query("DROP TABLE IF EXISTS ?#",'dbc_'.$this->name);
		$this->DB->query($sql,'dbc_'.$this->name);

		unset($collums,$ittr,$sql,$field,$temp_f,$pkey,$i);
	}

	public function isValidFormatFile(){
		if($this->isValid) return true;
		if(!$this->getHeader()) return false;
		if(!$this->getFormatRecord()) return false;

		$c = strlen($this->format);
		if ($c != $this->countFields) {
			$this->error = sprintf($this->_STR['DIFF_FIELDS_FORMAT'],$this->countFields,$c);
			return false;
		}

		if (!$this->checkSizeOf()) {
			$this->error = sprintf($this->_STR['DIFF_SIZE_RECORDS'],$this->sizeRecord,$this->formatRecordSize);
			return false;
		}

		$this->isValid = true;
		return true;
	}

	public function getData(){
		if(!$this->isValidFormatFile()) return false;

		$this->createTable();
		for ($row = 1; $row <= $this->countRecords; $row++) {
			$this->getRecord($row,$out);
			$this->DB->query("INSERT INTO ?# VALUES(?a)",'dbc_'.$this->name,$out);
			unset($out);
		}

		fclose($this->file);
		return true;
	}

	public function getRecord($row,&$out){
		for ($cell = 1; $cell <= $this->countFields; $cell++) {
			switch ($this->format[$cell-1]) {
				case FT_NA:
				case FT_INT:
				case FT_IND:
					$t = unpack("V", fread($this->file, 4));
					$out[$cell] = $t[1];
					break;
				case FT_SORT:
				case FT_FLOAT:
					$t = unpack("f", fread($this->file, 4));
					$out[$cell] = $t[1];
					break;
				case FT_NA_BYTE:
				case FT_BYTE:
				case FT_LOGIC:
					$t = unpack("C", fread($this->file, 1));
					$out[$cell] = $t[1];
					break;
				case FT_STRING:
					$t = unpack("V", fread($this->file, 4));
					$ptr = $t[1];
					$s = "";
					if ($ptr != 0){
						if ($ptr > $this->sizeString) {
							$out[$cell] = "error: not a string field";
						}else{
							fseek($this->file, 4*5 + $this->sizeRecord*$this->countRecords + $ptr);

							while(($ch = fread($this->file, 1)) != chr(0))
								$s .= $ch;

							fseek($this->file, 4*5 + $this->sizeRecord*($row-1));
							$bytes = 0;
							for ($i = 1; $i <= $cell; $i++) {
								$char = $this->format[$i-1];
								if ($char == 'X' || $char == 'b' || $char == 'l') {
									$bytes += 1;
								} else {
									$bytes += 4;
								}
							}
							fseek($this->file, $bytes, SEEK_CUR);

							$out[$cell] = $s;
						}
					}else $out[$cell] = $s;
					break;
				default:
					break;
			}
		}
	}

	private function initDB(){
		$result = $this->DB->selectRow("ANALYZE TABLE `_dbc_info_`");
		if($result['Msg_type'] == 'Error'){
			$this->DB->query("
				CREATE TABLE `_dbc_info_` (
				  `file` varchar(120) DEFAULT NULL,
				  `format` varchar(80) DEFAULT NULL,
				  `valid` int(10) DEFAULT NULL,
				  `rows` int(11) DEFAULT NULL,
				  `columns` int(11) DEFAULT NULL,
				  `size_record` int(11) DEFAULT NULL,
				  `size_string` int(11) DEFAULT NULL,
				  PRIMARY KEY (`file`)
				) ENGINE=InnoDB DEFAULT CHARSET=utf8
			");
			$this->_initDB_();
		}
		$result = $this->DB->selectRow("ANALYZE TABLE `_dbc_fields_`");
		if($result['Msg_type'] == 'Error'){
			$this->DB->query("
				CREATE TABLE `_dbc_fields_` (
				  `filename` varchar(120) DEFAULT NULL,
				  `id` int(12) DEFAULT NULL,
				  `field` varchar(120) DEFAULT NULL,
				  `isKey` tinyint(11) DEFAULT NULL,
				  `count` int(11) DEFAULT NULL,
				  `type` varchar(120) DEFAULT NULL,
				  `type_string` varchar(120) DEFAULT NULL
				) ENGINE=InnoDB DEFAULT CHARSET=utf8
			");
		}
	}

	private function writeDBCInfo(){
		$this->initDB();

		$res = $this->DB->selectRow("SELECT * FROM ?# WHERE `file`=?",DB_TABLE_INFO,$this->name);
		if(isset($res['file'])){
			$this->DB->query("
				UPDATE ?# SET 
				`valid`=?,
				`rows`=?d,
				`columns`=?d,
				`size_record`=?d,
				`size_string`=?d
				WHERE `file`=?
			",DB_TABLE_INFO,$this->is_valid?1:0,$this->countRecords,$this->countFields,$this->sizeRecord,$this->sizeString,$this->name);
		}else{
			$this->DB->query("
				REPLACE INTO ?# VALUES (?,?,?d,?d,?d,?d,?d)
			",DB_TABLE_INFO,$this->name,$this->format,$this->is_valid?1:0,$this->countRecords,$this->countFields,$this->sizeRecord,$this->sizeString);
		}
		return;
	}

	private function _initDB_(){
		global $DBCfmt;
		if(!isset($DBCfmt)){
			include_once(FILE_FMT);
		}
		foreach($DBCfmt as $k => $v){
			$this->DB->query("INSERT IGNORE INTO ?#(`file`,`format`) VALUES(?,?)",DB_TABLE_INFO,$k,$v);
		}
	}

	function __destruct(){}
}

?>