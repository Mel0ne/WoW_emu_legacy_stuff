<?php

// Необходима функция iteminfo
require_once('includes/game.php');
require_once('includes/allachievements.php');
require_once('includes/allspells.php');
require_once('includes/allquests.php');
require_once('includes/allitems.php');
require_once('includes/allnpcs.php');
require_once('includes/allobjects.php');

// Настраиваем Smarty ;)
$smarty->config_load($conf_file, 'search');

// Строка поиска:

$search = str_replace(array('[',']'),array('',''),urldecode($podrazdel));

$nsearch = '%'.$search.'%';

$smarty->assign('search', $search);


// Подключаемся к ДБ
global $DB;
global $allitems;
global $allspells;

global $npc_cols;
global $spell_cols;

$cache_key = cache_key(md5(strtolower($search)));

// Массив всего найденного

if(!$found = load_cache(SEARCH, $cache_key))
{
	unset($found);

	if (!empty($podrazdel))
	{
	// Ищем вещи:
	if($_SESSION['locale']>0)
	{
		$m = $DB->selectCol('
				SELECT entry
				FROM locales_item
				WHERE name_loc?d LIKE ?
				LIMIT '.$AoWoWconf["limit"].'
			',
			$_SESSION['locale'],
			$nsearch
		);
	}

	$rows = $DB->select('
			SELECT i.?#
				{, l.name_loc?d AS `name_loc`}
			FROM ?_icons a, item_template i
				{LEFT JOIN (locales_item l) ON l.entry=i.entry AND ?d}
			WHERE
				(i.name LIKE ? {OR i.entry IN (?a)})
				AND a.id = i.displayid;
			
		',
		$item_cols[3],
		($m)? $_SESSION['locale']: DBSIMPLE_SKIP,
		($m)? 1: DBSIMPLE_SKIP,
		$nsearch,
		($m)? $m: DBSIMPLE_SKIP
	);
	unset($m);
	$found = array();
	foreach($rows as $row)
		$found['item'][] = iteminfo2($row);

	// Ищем NPC:
	if($_SESSION['locale']>0)
	{
		$m = $DB->selectCol('
				SELECT entry
				FROM locales_creature
				WHERE
					name_loc?d LIKE ?
					OR subname_loc?d LIKE ?
				LIMIT '.$AoWoWconf["limit"].'
			',
			$_SESSION['locale'], $nsearch,
			$_SESSION['locale'], $nsearch
		);
	}
	$rows = $DB->select('
			SELECT ?#, c.entry
				{, l.name_loc?d AS `name_loc`,
				l.subname_loc'.$_SESSION['locale'].' AS `subname_loc`}
			FROM ?_factiontemplate, creature_template c
				{LEFT JOIN (locales_creature l) ON l.entry=c.entry AND ?d}
			WHERE
				(name LIKE ?
				OR subname LIKE ?
				{OR c.entry IN (?a)})
				AND factiontemplateID=faction_A
			LIMIT '.$AoWoWconf["limit"].'
		',
		$npc_cols[0],
		($m)? $_SESSION['locale']: DBSIMPLE_SKIP,
		($m)? 1: DBSIMPLE_SKIP,
		$nsearch, $nsearch,
		($m)? $m: DBSIMPLE_SKIP
	);
	unset($m);
	foreach($rows as $row)
		$found['npc'][] = creatureinfo2($row);


	// Ищем зоны:
	if($_SESSION['locale']>0)
	{
		$m = $DB->selectCol('
				SELECT mapID
				FROM aowow_zones
				WHERE
					name_loc?d LIKE ?
				LIMIT '.$AoWoWconf["limit"].'
			',
			$_SESSION['locale'], $nsearch,
			$_SESSION['locale'], $nsearch
		);
	}
	$rows = $DB->select('
				SELECT z.?#
				{, l.name_loc?d AS `name_loc`}
			FROM aowow_zones z
			LIMIT '.$AoWoWconf["limit"].'
		',

		$zones_cols[0],
		($m)? $_SESSION['locale']: DBSIMPLE_SKIP,
		($m)? 1: DBSIMPLE_SKIP,
		$nsearch, $nsearch,
		($m)? $m: DBSIMPLE_SKIP
	);
	unset($m);
	foreach($rows as $row)
		$found['zone'][] = zoinesinfo2($row);
		
	// Ищем объекты
	if($_SESSION['locale']>0)
	{
		$m = $DB->selectCol('
				SELECT entry
				FROM locales_gameobject
				WHERE
					name_loc?d LIKE ?
				LIMIT '.$AoWoWconf["limit"].'
			',
			$_SESSION['locale'], $nsearch
		);
	}
	$rows = $DB->select('
			SELECT g.?#
				{, l.name_loc?d AS `name_loc`}
			FROM gameobject_template g
				{LEFT JOIN (locales_gameobject l) ON l.entry=g.entry AND ?d}
			WHERE name LIKE ? {OR g.entry IN (?a)}
			LIMIT '.$AoWoWconf["limit"].'
		',
		$object_cols[0],
		($m)? $_SESSION['locale']: DBSIMPLE_SKIP,
		($m)? 1: DBSIMPLE_SKIP,
		$nsearch,
		($m)? $m: DBSIMPLE_SKIP
	);
	unset($m);
	foreach($rows as $row)
		$found['object'][] = objectinfo2($row);

	// Ищем квесты
	if($_SESSION['locale']>0)
	{
		$m = $DB->selectCol('
				SELECT entry
				FROM locales_quest
				WHERE
					Title_loc?d LIKE ?
				LIMIT '.$AoWoWconf["limit"].'
			',
			$_SESSION['locale'], $nsearch
		);
	}
	$rows = $DB->select("
			SELECT *
				{, l.Title_loc?d AS `Title_loc`}
			FROM quest_template q
				{LEFT JOIN (locales_quest l) ON l.entry=q.Id AND ?d}
			WHERE Title LIKE ? {OR q.Id IN (?a)}
			AND q.Title NOT IN ('','----','?????')
			AND q.Title NOT LIKE '<DEPRECATED>%'
			AND q.Title NOT LIKE '<NYI>%'
			AND q.Title NOT LIKE '<nyi>%'
			AND q.Title NOT LIKE '<TEST>%'
			AND q.Title NOT LIKE '<TXT>%'
			AND q.Title NOT LIKE '<UNUSED%'
			LIMIT ".$AoWoWconf['limit']."
		",
		($m)? $_SESSION['locale']: DBSIMPLE_SKIP,
		($m)? 1: DBSIMPLE_SKIP,
		$nsearch,
		($m)? $m: DBSIMPLE_SKIP
	);
	unset($m);
	foreach($rows as $row)
		$found['quest'][] = GetQuestInfo($row, 0xFFFFFF);

	// Ищем наборы вещей
	$rows = $DB->select('
			SELECT *
			FROM ?_itemset
			WHERE name_loc'.$_SESSION['locale'].' LIKE ?
			LIMIT '.$AoWoWconf["limit"].'
		',
		$nsearch
	);
	foreach($rows as $row)
		$found['itemset'][] = itemsetinfo2($row);
		
	// Достижения
	$rows = $DB->select('
			SELECT *
			FROM ?_achievement
			WHERE name_loc'.$_SESSION['locale'].' LIKE ?
			LIMIT '.$AoWoWconf["limit"].'
		',
		$nsearch
	);
	foreach($rows as $row)
		$found['achievement'][] = achievementinfo2($row);

	// Ищем спеллы
	$rows = $DB->select('
			SELECT ?#, spellID
			FROM ?_spell s, ?_spellicons i
			WHERE
				s.spellname_loc'.$_SESSION['locale'].' like ?
				AND i.id = s.spellicon
			LIMIT '.$AoWoWconf["limit"].'
		',
		$spell_cols[2],
		$nsearch
	);
	foreach($rows as $row)
		$found['spell'][] = spellinfo2($row);
	}

	$keys = array_keys($found);

	save_cache(SEARCH, $cache_key, $found);
}
	// Если найден один элемент - перенаправляем на него
	if(count($found) == 1 && count($found[$keys[0]]) == 1)
	{
        $founded = $keys[0] == 'quest' ? "Id" : "entry";
        header("Location: ?".$keys[0].'='.$found[$keys[0]][0][$founded]);
	}
	else
	{
		$smarty->assign('found', $found);

		// Параметры страницы
		$page = array();
		// Номер вкладки меню
		$page['tab'] = 0;
		// Заголовок страницы
		$page['Title'] = $search.' - '.$smarty->get_config_vars('Search');
		$smarty->assign('page', $page);

		$smarty->assign('mysql', $DB->getStatistics());
		$smarty->assign('search', $search);

		$smarty->display('search.tpl');
	}

?>