<?
ini_set("memory_limit", "2048M");
ini_set("max_execution_time", 900);

include_once("config.php"); // including conecting info
include_once("core/dbc.class.php");

	switch($_POST['action']){
		case 'showData':
			break;
		case 'getInfo':
			$file = $_POST['file'];
			$dbc = new DBCparser($file);
			$dbc->getHeader();
			
			print "<pre style=\"margin-left: 20px;margin-top: 1px;\">записей: ".$dbc->countRecords;
			print "\nполей: ".$dbc->countFields;
			print "\nразмер записей: ".$dbc->sizeRecord;
			print "\nразмер поля string: ".$dbc->sizeString."</pre>";
			break;
		case 'fetchData':
			$file = $_POST['file'];
			$dbc = new DBCparser($file);
			$dbc->writing = true;
			if($dbc->getData())
				print 'OK';
			else
				print $dbc->error;
			break;
		case 'getRows':
			$tbl = strtolower(preg_replace('/(.*).dbc/','dbc_\\1',$_POST['file']));
			$dbc = new DBCparser(strtolower($_POST['file']));
			print $dbc->DB->selectCell("SELECT COUNT(*) FROM ?#",$tbl);
			break;
		case 'truncate':
			$tbl = preg_replace('/(.*).dbc/','dbc_\\1',$_POST['file']);
			$dbc = new DBCparser($_POST['file']);
			print $dbc->DB->query("TRUNCATE ?#",$tbl);
			break;
		case 'support':
			$tbl = preg_replace('/(.*).dbc/','dbc_\\1',$_POST['file']);
			$dbc = new DBCparser($_POST['file']);
			print(!$dbc->isValidFormatFile())? $dbc->error : 'OK';
			break;
		default:
			break;
	}

?>