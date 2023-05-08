<?php
require_once('includes/allreputation.php');
//  Заготовка Панели Администратора
$smarty->config_load($conf_file, 'admin');

global $page;
$page = array(
	'Mapper' => false,
	'Book' => false,
	'Title' => 'Admin Panel',
	'tab' => 0,
	'type' => 11,
	'typeid' => $event['id'],
	'username' => $_SESSION['username'],
	'path' => path(0, 11)
);
$smarty->assign('page', $page);

// --Передаем данные шаблонизатору--
// Количество MySQL запросов
$smarty->assign('mysql', $DB->getStatistics());
$smarty->assign('reputation', getreputation($page['username']));
// Запускаем шаблонизатор
$smarty->display('admin.tpl');
?>