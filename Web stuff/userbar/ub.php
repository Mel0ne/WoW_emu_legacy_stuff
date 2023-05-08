<?php
error_reporting(E_ALL);
if(isset($_GET['name'])){
	include_once('config.php');
	include_once('core/class.userbar.php');

	$ub = new userbar();

	$name = (get_magic_quotes_gpc())? urldecode($_GET['name']) : urldecode(mysql_escape_string($_GET['name']));;

	if(isset($_GET['mini']))
		$ub->mini_userbar($name);
	else
		$ub->userbar($name);
}
?>