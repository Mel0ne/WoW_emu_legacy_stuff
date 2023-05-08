<?php
error_reporting(E_ALL); 
include_once("config.php"); // including conecting info

if(isset($_GET['name'])) {

	include_once("core/class.character.php");
	$pl = new character();
	$pl->name = (get_magic_quotes_gpc())? urldecode($_GET["name"]) : urldecode(mysql_escape_string($_GET["name"]));
	if (!$pl->CharacterExists($pl->name)) { exit("Ошибка! Персонаж <b>".$pl->name."</b> не найден!");}

	/**
	* настраивать под себя
	* переменная $dir настраивается в конфиге
	**/
	$url = urldecode("http://".$_SERVER['HTTP_HOST'].$dir.$pl->name.".".$config['img_type']);
	$urlm = urldecode("http://".$_SERVER['HTTP_HOST'].$dir."mini/".$pl->name.".".$config['img_type']);
	$reset = "http://".$_SERVER['HTTP_HOST'].$dir;

?>
<table border="0" width="100%" cellspacing="0" cellpadding="0">
<tr><td>
<div align="center">
<img src="<?="ub.php?name=".$pl->name?>"><br />
<table>
<tr><td width="140px">Ссылка на бар:</td><td><input type="text" style="width:350px;text-align:center" value="<?=$url?>"></td></tr>
<tr><td width="140px">Ссылка в подпись:</td><td><input type="text" style="width:350px;text-align:center" value="<?="[IMG]".$url."[/IMG]"?>"></td></tr>
</table><br />
<img src="<?="ub.php?name=".$pl->name."&mini"?>"><br />
<table>
<tr><td width="140px">Ссылка на минибар:</td><td><input type="text" style="width:350px;text-align:center" value="<?=$urlm?>"></td></tr>
<tr><td width="140px">Ссылка в подпись:</td><td><input type="text" style="width:350px;text-align:center" value="<?="[IMG]".$urlm."[/IMG]"?>"></td></tr>
<tr align="center"><td colspan="2"><br /><input type="submit" value="очистить форму" onclick="javascript:location.href='<?=$reset?>'"></td></tr>
</table>
</div>
</div>
</td></tr></table>
<?php
}else{
?>
<b>Юзербар<sup><font color="red"><b>*</b></font></sup>:</b><br><br>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
<FORM ACTION="index.php" METHOD="GET">
<INPUT name="name" TYPE="text" onfocus="if(this.value!='Введите Ваш ник...')this.value=''" onblur="if(!this.value)this.value='Введите Ваш ник...'" onClick="this.value=''" VALUE="Введите Ваш ник...">
<INPUT TYPE="submit" VALUE="Получить код*">
</FORM>
<br>
<?php } ?>
<HR>
