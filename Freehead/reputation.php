<?php
require_once('includes/allreputation.php');
$smarty->config_load($conf_file, 'reputation');

global $page;
$page = array(
	'Mapper' => false,
	'Book' => false,
	'Title' => $smarty->get_config_vars('reputation'),
	'tab' => 0,
	'type' => 0,
	'typeid' => 0,
	'username' => $_SESSION['username'],
	'path' =>  '[0, 30]'
);

$smarty->assign('page', $page);
// Количество MySQL запросов
$smarty->assign('mysql', $DB->getStatistics());
$smarty->assign('reputation', getreputation($page['username']));
$smarty->display('reputation.tpl');
?>