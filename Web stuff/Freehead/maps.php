<?php
require_once('includes/allreputation.php');
$smarty->config_load($conf_file, 'maps');

global $page;
$page = array(
	'Mapper' => true,
	'maps' => true,
	'Book' => false,
	'Title' => $smarty->get_config_vars('Maps'),
	'tab' => 1,
	'type' => 0,
	'typeid' => 0,
	'username' => $_SESSION['username'],
	'path' => '[]'
);
$smarty->assign('page', $page);
$smarty->assign('reputation', getreputation($page['username']));
$smarty->display('maps.tpl');

?>