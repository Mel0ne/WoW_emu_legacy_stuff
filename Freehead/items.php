<?php

// Необходима функция iteminfo
require_once('includes/allitems.php');
require_once('includes/allreputation.php');

$smarty->config_load($conf_file, 'item');

// Разделяем из запроса класс, подкласс и тип вещей
@list($class, $subclass, $type) = extract_values($podrazdel);

$cache_key = cache_key($class, $subclass, $type);

if(!$items = load_cache(ITEM_LISTING, $cache_key))
{
	unset($items);

  // слотове;
   $slots = null;
   if(isset($_REQUEST['sl'])){
       if(is_array($_REQUEST['sl'])){
           $sl = $_REQUEST['sl'];
           foreach($sl as $k=>$v){
               if(is_numeric($v)){
                   $slots[] = $v;
               }
           }
       }
   }
   if(!is_array($slots)){
       if(isset($type)){
           $slots[] = $type;
       }else{
           for($i=0;$i<=28;$i++){
              $slots[] = $i; 
           }
       }
   }
   
   // вид
   $quality = null;
   if(isset($_REQUEST['qu'])){
       
       if(is_array($_REQUEST['qu'])){
           $qu = $_REQUEST['qu'];
           foreach($qu as $q=>$u){
               if(is_numeric($u)){
                   $quality[] = $u;
               }
           }
       }
   }
   
   if(!is_array($quality)){
           for($i=0;$i<=7;$i++){
              $quality[] = $i; 
           }
   }
   $ad = "DESC";
     if(isset($_REQUEST['gb']) && is_numeric($_REQUEST['gb'])){
         
         if($_REQUEST['gb']==1){
             $gb = 'InventoryType';
         }elseif($_REQUEST['gb']==2){
             $gb = 'RequiredLevel';
         }elseif($_REQUEST['gb']==2){
             $gb = 'name';
             $ad = "ASC";
         }else{
             $gb = 'quality';
         }
     }else{
          $gb = 'quality';
     }
    
	// Составляем запрос к БД, выполняющий поиск по заданным классу и подклассу
	$rows = $DB->select('
		SELECT ?#, i.entry, maxcount
			{, l.name_loc?d AS name_loc}
		FROM ?_icons, item_template i
			{LEFT JOIN (locales_item l) ON l.entry=i.entry AND ?d}
		WHERE
			id=displayid
			{ AND class = ? }
			{ AND subclass = ? }
            { AND i.ItemLevel >= ? }
            { AND i.ItemLevel <= ? }
            { AND i.RequiredLevel >= ?}
            { AND i.RequiredLevel <= ?}
            { AND i.name LIKE ? }
            { AND i.InventoryType IN (?a) }
            { AND i.Quality IN ( ?a ) }
            
            ORDER BY i.?# '.$ad.', name
		{ LIMIT ?d }
		',
		$item_cols[2],
		($_SESSION['locale'])? $_SESSION['locale']: DBSIMPLE_SKIP,
		($_SESSION['locale'])? 1: DBSIMPLE_SKIP,
		isset($class) ? $class : DBSIMPLE_SKIP,
		isset($subclass) ? $subclass : DBSIMPLE_SKIP,
        // search
        isset($_REQUEST['minle']) && is_numeric($_REQUEST['minle']) ? $_REQUEST['minle'] : "0",   // min item level
        isset($_REQUEST['maxle']) && is_numeric($_REQUEST['maxle']) ? $_REQUEST['maxle'] : "284", // max item level
        
        isset($_REQUEST['minrl']) && is_numeric($_REQUEST['minrl']) ? $_REQUEST['minrl'] : "0",   // min reuqest level
        isset($_REQUEST['maxrl']) && is_numeric($_REQUEST['maxrl']) ? $_REQUEST['maxrl'] : "80",  // max request level

        isset($_REQUEST['na']) ? "%". strip_tags(str_replace(array('[',']'),array('',''),urldecode($_REQUEST['na']))). "%" : "%%", // search by name
        
        $slots,
        $quality,
        $gb, 
        
		($AoWoWconf['limit']!=0)? $AoWoWconf['limit']: DBSIMPLE_SKIP
	);

	$items = array();
	foreach($rows as $row)
		$items[] = iteminfo2($row);

	save_cache(ITEM_LISTING, $cache_key, $items);
}

if(!$item_tot = load_cache(ITEM_TOT, 'item_tot'))
{
	unset($item_tot);

	// Составляем запрос к БД, выполняющий поиск по заданным классу и подклассу
	$item_tot = $DB->select('
		SELECT COUNT(i.entry) as item_tot
		FROM item_template i
		'
	);
	save_cache(ITEM_TOT, 'item_tot', $item_tot[0]['item_tot']);
}

global $page;
$page = array(
	'Mapper' => false,
	'Book' => false,
	'Title' => $smarty->get_config_vars('Items'),
	'tab' => 0,
	'type' => 0,
	'typeid' => 0,
	'username' => $_SESSION['username'],
	'path' => path(0, 0, $class, $subclass, $type)
);
$smarty->assign('page', $page);

// Статистика выполнения mysql запросов
$smarty->assign('mysql', $DB->getStatistics());
$smarty->assign('reputation', getreputation($page['username']));
$smarty->assign('items', $items);
$smarty->assign('item_tot',(is_array($item_tot) ? $item_tot[0]['item_tot'] : $item_tot));
// Загружаем страницу
$smarty->display('items.tpl');
?>