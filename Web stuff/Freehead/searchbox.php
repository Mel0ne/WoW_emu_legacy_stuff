<?php
require_once('includes/allreputation.php');
$smarty->config_load($conf_file);

global $page;
$page = array(
	'Mapper' => false,
	'Book' => false,
	'Title' => 'Searchbox for your website',
	'tab' => 0,
	'type' => 0,
	'typeid' => 0,
	'username' => $_SESSION['username'],
	'path' => '[0, 30]'
);

$smarty->assign('page', $page);
$smarty->assign('reputation', getreputation($page['username']));
$smarty->display('searchbox.tpl');
?>