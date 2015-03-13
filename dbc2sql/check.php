<?php
error_reporting(E_ALL); 

include_once('config.php');
include_once('core/fmt.php');
include_once('core/struct.php');
include_once('core/dbsimple/Generic.php'); // including simple conecting for DB
include_once('core/dbc.class.php'); // including simple conecting for DB
define('BASE_BUILD_CLIENT',0);

$DB = DbSimple_Generic::connect($db_config['dbc_dns']);
$DB->setErrorHandler("databaseErrorHandler");
// $DB->setIdentPrefix($db_config['db_prefix']);
$dbc = new DBCparser();

define('URL_START','https://raw.github.com/mangos/mangos/');
define('URL_DBC_FMT','/src/game/DBCfmt.h');
define('URL_UPDATE_FIELDS','/src/game/UpdateFields.h');
define('URL_DBC_STRUCT','/src/game/DBCStructure.h');
$branch = '400';

function getStructFilesGIT($branch, &$output, &$info){
	$url = URL_START.$branch.URL_DBC_FMT;

	$output = '';
	$I = '\\b[A-Z_][A-Z0-9_]*\\b';
	$regex = "^\w{5}\s\w{4}(.*)\[\]=\"(.*)\";$";
	$file = file($url);

	foreach ($file as $line) {
		$line = rtrim($line);
		if (preg_match("#$regex#i", $line, $regs)) {
			$regs[1] = str_replace('Entry','',str_replace('fmt','',trim($regs[1])));
			$output[] = array($regs[1],$regs[2]);
		}
	}
	$info=$url;
}

function get_type($char=null){
	switch($char){
		case FT_INT:	return 'uint32';
		case FT_IND:	return 'uint32';
		case FT_FLOAT:	return 'float';
		case FT_SORT:	return 'sorted';
		case FT_STRING:	return 'string';
		case FT_BYTE:	return 'uint8';
		case FT_LOGIC:	return 'bool';
		case FT_NA:		return 'unknown';
		case FT_NA_BYTE:return 'unknown';
		default:		return 'unknown';
	};
}
function update_dom_xml(){
	global $DBCstruct, $DBCfmt;

	foreach($DBCfmt as $name => $format){
		$struct = $DBCstruct[$name];
		$xml=new DomDocument('1.0','utf-8');
		$file = $xml->createElement('file');
		$xname = $xml->createAttribute('name');
		$value = $xname->appendChild($xml->createTextNode($name));
		$xformat = $xml->createAttribute('format');
		$value = $xformat->appendChild($xml->createTextNode($format));
		for($i=0;$i< strlen($format);$i++){
			$field = $xml->createElement('field');
			$sid = $xml->createAttribute('id');
			$value = $sid->appendChild($xml->createTextNode($i));

			$count = @is_array($struct[$i]) ? $struct[$i][1] : 1;
			$scount = $xml->createAttribute('count');
			$value = $scount->appendChild($xml->createTextNode(($count>1)? $count:1));

			$key = @(is_array($struct[$i]) && $struct[$i][1] == INDEX_PRIMORY_KEY) ? 1 : 0;
			$skey = $xml->createAttribute('key');
			$value = $skey->appendChild($xml->createTextNode($key));

			$type = get_type($format[$i]);
			$stype = $xml->createAttribute('type');
			$value = $stype->appendChild($xml->createTextNode($type));

			$text_name = "unk$i";
			if(isset($struct[$i]) && $struct[$i]!=''){
				$text_name = is_array($struct[$i]) ? $struct[$i][0] : $struct[$i];
			}
			$sname = $xml->createAttribute('name');
			$value = $sname->appendChild($xml->createTextNode($text_name));

			$field->appendChild($sid);
			$field->appendChild($scount);
			$field->appendChild($sname);
			$field->appendChild($stype);
			$field->appendChild($skey);
			$file->appendChild($field);
			if($count>1){
				$i += $count-1;
			}
		}
		$file->appendChild($xname);
		$file->appendChild($xformat);
		$xml->appendChild($file);
		$xml->formatOutput = true;
		$xml->save('xml/'.$name.'.xml');
	}
}

function update_xml(){
	global $DBCstruct, $DBCfmt;
	$_str = "\t<field id=\"%d\" count=\"%d\" name=\"%s\" type=\"%s\" key=\"%d\" />\r\n";

	foreach($DBCfmt as $name => $format){
		$struct = $DBCstruct[$name];
		$fh = fopen('xml/'.$name.'.xml', 'wb');
		fwrite($fh, "<?xml version=\"1.0\" encoding=\"utf-8\"?>\r\n");
		// fwrite($fh, "<!-- \$id: $name.xml ".date('Y-m-d H:i:s')."  SergiK_KilleR $ -->\r\n\r\n");
		fwrite($fh, "<file name=\"$name\" format=\"$format\">\r\n");
		for($i=0;$i<strlen($format);$i++){
			$count = @is_array($struct[$i]) ? $struct[$i][1] : 1;
			$key = @($struct[$i][1] == INDEX_PRIMORY_KEY) ? 1 : 0;
			$type = get_type($format[$i]);
			$field = "unk$i";
			if(isset($struct[$i]) && $struct[$i]!=''){
				$field = is_array($struct[$i]) ? $struct[$i][0] : $struct[$i];
			}
			fprintf($fh,$_str,$i,$count,$field,$type,$key);
			if($count>1){
				$i += $count-1;
			}
		}
		fwrite($fh, "</file>");
	}
}

function getListFiles($dir="dbc/",$type='dbc') {
	$list = array();
	if(!$temp = @scandir($dir))
		return;

	foreach($temp as $f){
		if(strlen($f)>2){
			if(is_file($dir.$f)){
				$filename = explode('.',$f);
				if($filename[1]==$type){
					$list[] = $filename[0];
				}
			}
		}
	}
	return $list;
}

function getListSubdirs($dir="dbc/") {
	$list = array();
	if(!$temp = @scandir($dir))
		return;

	foreach($temp as $f){
		if(strlen($f)>2){
			if(is_dir($dir.$f)){
				$list[] = $f;
			}
		}
	}
	return $list;
}

$f_dbc = getListFiles('dbc/');
$f_xml = getListFiles('xml/','xml');

$res = $DB->selectPage($count,"SELECT `file` FROM `_dbc_info_`");
$db_rows['count'] = $count;
$db_rows['no_format'] = $DB->selectCell("SELECT COUNT(`file`) FROM `_dbc_info_` WHERE `format`=''");
$db_rows['incorrect_length'] = $DB->selectCell("SELECT COUNT(`file`) FROM `_dbc_info_` WHERE LENGTH(`format`) != 0 && LENGTH(`format`) != `columns`");
$t = 0;

foreach($f_dbc as $tmp){
	$dbc->_set($tmp);
	if($dbc->checkSizeOf() === false)
		$t++;
}
$db_rows['incorrect_size'] =  $t;

?>
<pre>
Данные по файлам:
	количество dbc-файлов: <?=count($f_dbc);?> 
	количество xml-файлов: <?=count($f_xml);?> 
Данные по БД:
	количество записей: <?=$db_rows['count'];?> 
	неформатированые записи: <?=$db_rows['no_format'];?> 
	несовпадает длинна: <?=$db_rows['incorrect_length'];?> 
	несовпадает размер строк: <?=$db_rows['incorrect_size'];?> 
</pre>

<div>
	<form method="POST">
		<input type="submit" name="update_info" value="update_info" />
		<input type="submit" name="update_xml" value="update_xml" />
		<input type="submit" name="update_fmt_from_db" value="update_fmt_from_db" />
		<input type="submit" name="update_struct" value="update_struct" />
		<input type="submit" name="listing_dbc" value="listing_dbc" disabled />
		<input type="submit" name="check_struct_files" value="check_struct_files 400" />
	</form>
</div>
<div>
<pre>
<?php
if(isset($_POST['update_info'])){
	foreach($f_dbc as $f){
		$dbc->_set($f);
		$dbc->getHeader();
	}

	$DB->query('TRUNCATE `_dbc_fields_`');
	foreach($f_dbc as $f){
		$fmt = $DBCfmt[$f];
		$struct = $DBCstruct[$f];
		$strlen=strlen($fmt);
		for($i=0;$i<strlen($fmt);$i++){
			$count = (@is_array($struct[$i]) && $struct[$i][1] > 1) ? $struct[$i][1] : '-1';
			$key = @($struct[$i][1] == INDEX_PRIMORY_KEY) ? 1 : 0;
			$type = get_type($fmt[$i]);
			$field = null;
			if(isset($struct[$i]) && $struct[$i]!=''){
				$field = is_array($struct[$i]) ? $struct[$i][0] : $struct[$i];
			}

			$out = array($f,$i,$field,$key,$count,$fmt[$i],$type);
			$DB->query('INSERT INTO `_dbc_fields_` VALUES(?a)',$out);
			if($count>1){
				$i += $count-1;
			}
		}
	}
}
if(isset($_POST['update_xml'])){
	update_xml();
}

if(isset($_POST['update_fmt_from_db'])){
	$data = $DB->selectPage($count,"SELECT * FROM `_dbc_info_`");
	$ffmt = fopen('core/fmt.php.ini','wb');
	$str_fmt = "'%s' => '%s'%s // rows: %s, cols: %s\r\n";
	fprintf($ffmt,"<?php\r\n// dbc format v4.0.0\r\n\$DBCfmt = array(\r\n");
	foreach($data as $c => $d){
		$strlen = strlen($d['format']);
		$str_inc = ($c+1 == $count)? '':',';

		if($strlen!=$d['columns']){
			$d['columns'] = $d['columns'].'('.$strlen.')';
			$DB->query("UPDATE `_dbc_info_` SET `valid`=0 WHERE `file`=? ",$d['file']);
		}
		fprintf($ffmt,$str_fmt,$d['file'],$d['format'],$str_inc,$d['rows'],$d['columns']);
	}
	fwrite($ffmt,');');
}

if(isset($_POST['update_struct'])){
	$data = $DB->selectPage($count,"SELECT * FROM `_dbc_info_`");
	$fs = fopen('core/struct.php.ini','wb');
	$str_s = "'%s' => array()%s // rows: %s, cols: %s\r\n";
	fprintf($fs,"<?php\r\n// dbc format v4.0.0\r\n\$DBCstruct = array(\r\n");
	foreach($data as $c => $d){
		$strlen = strlen($d['format']);
		$str_inc = ($c+1 == $count)? '':',';
		if($strlen!=$d['columns']){
			$d['columns'] = $d['columns'].'('.$strlen.')';
			$DB->query("UPDATE `_dbc_info_` SET `valid`=0 WHERE `file`=? ",$d['file']);
		}
		fprintf($fs,$str_s,$d['file'],$str_inc,$d['rows'],$d['columns']);
	}
	fwrite($fs,');');
}

if(isset($_POST['check_struct_files'])){
	getStructFilesGIT($branch,$output,$info);
	$i=0;
	$dom = new DOMDocument();
	$dom->preserveWhiteSpace = false;
	$dom->substituteEntities = true;
	print "URL: ".$info;
	print "<br>Branch: ".$branch."<br>";
	foreach($output as $arr){
		$i++;
		$xmlfile = 'xml/'.$arr[0].'.xml';
		if(file_exists($xmlfile)){
			$dom->Load($xmlfile);
			$tt = $dom->getElementsByTagName('file')->item(0);
			$arr["L"] = $DBCfmt[$arr[0]];
			if($arr["L"]!=$arr[1])
				print_r($arr);
		}else{
		}
	}	
}

if(isset($_POST['dbclayout'])){
	$b_dbc = getListFiles('dbc/','dbc');
	$subdirs = getListSubdirs('dbc/');

	$f_w = fopen("dbclayout.xml",'wb');
	fwrite($f_w, "<?xml version=\"1.0\" encoding=\"utf-8\"?>\r\n");
	fwrite($f_w, "<DBCFilesClient>\r\n");
	fwrite($f_w, "\t<DBCFilesBase build=\"".BASE_BUILD_CLIENT."\">\r\n");
	foreach($b_dbc as $f){
		if(in_array($f,$b_dbc))
			fwrite($f_w, "\t\t<file name=\"$f\"/>\r\n");
	}
	fwrite($f_w, "\t</DBCFilesBase>\r\n");

	if(is_array($subdirs)){
		foreach($subdirs as $sd){
			$p_dbc = getListFiles('dbc/'.$sd,'dbc');
			$diff_dbc = array_diff($p_dbc,$b_dbc);
			if(count($diff_dbc) > 0){
				fwrite($f_w, "\t<DBCFilesPatch build=\"$sd\">\r\n");
				foreach($p_dbc as $f){
					if(!in_array($f,$b_dbc))
						fwrite($f_w, "\t\t<file name=\"$f\"/>\r\n");
				}
				fwrite($f_w, "\t</DBCFilesPatch>\r\n");
			}else{
				fwrite($f_w, "\t<DBCFilesPatch build=\"$sd\"/>\r\n");
			}
		}
	}
	fwrite($f_w, "</DBCFilesClient>");
}
?></pre></div>