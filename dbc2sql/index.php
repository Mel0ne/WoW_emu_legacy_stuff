<?php
error_reporting(E_ALL);

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

$dbcList = getListFiles('dbc/','dbc');
$xmlList = getListFiles('xml/','xml');

?>
<!DOCTYPE HTML PUBLIC  
	"-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Language" content="ru">  
	<meta http-equiv="Content-Type" content="text/html; charset=utf8" />
	<link rel="stylesheet" type="text/css" href="css/main.css" />  
	<script type="text/javascript" language="JavaScript" src="js/prototype.js"></script>
	<script type="text/javascript" language="JavaScript" src="js/main.js"></script>
</head>
<body>
<script>
var files = new Array(<? foreach($dbcList as $id => $filename){print "'".$filename.".dbc'";print ($id+1 == count($dbcList))? '':',';}?>);
</script>
<table><tr valign="top"><td>
	<fieldset>
		<legend>DBC Parser</legend>
		<table border="0">
			<tr><td>
				<div style="width:335px">
				<select id="id" onChange="selectFile(this.value);">
				<option value="-1" selected>Выберите файл
				<?php
					$used = 0;
					$id = 0;
					foreach($dbcList as $id => $filename){
						if(!in_array($filename,$xmlList))
							continue;
						$used++;
						$class = ($used%2==0)? "even" : "odd";
						print "<option class=\"$class\" value=\"".$id."\">".$filename.".dbc</option>";
					}
					?>
				</select> [<?php print $used."/".($id+1) ?>] 
				<hr />
				<!--<input type="checkbox" id="writeData" disabled>&nbsp;записать данные в базу<br />-->
				<input type="checkbox" id="support"><b>&nbsp;протестировать структуру файлов</b><br />
				<input type="checkbox" id="truncate"><b>&nbsp;удалить данные из таблиц</b><br />
				<input type="checkbox" id="full">&nbsp;Циклическая обработка всех файлов<br />
				<input type="checkbox" id="full_incorrect" disabled>&nbsp;Циклическая обработка некорректных файлов<br />
				<hr />
				</div>
			</td></tr>
		</table>
		<div align="center">
			<span style="float:left;"><input type="checkbox" id="hide_correct" checked> - hide correct</span>
			<input type="button" value="Выполнить" id="parser">
		</div>
	</fieldset>
</td></tr>
<table>
<div width="100%">
	<div id="error" style="margin: 10px 10px 0px 0px"></div>
	<div id="debag" style="margin: 10px 10px 0px 0px"></div>
	<div id="info" style="margin: 10px 10px 0px 0px"></div>
</div>
</body>
</html>
