<?php

require_once('includes/game.php');
require_once('includes/allreputation.php');
$smarty->config_load($conf_file);

switch($_GET['latest'])
{
	case 'comments':
		$comments = array();
		$rows = $DB->select('
			SELECT `id`, `type`, `typeID`, LEFT(`commentbody`, 120) as `preview`, `userID` as `user`, `post_date` as `date`, (NOW()-`post_date`) as `elapsed`
			FROM ?_comments
			WHERE 1
			ORDER BY post_date DESC
			LIMIT 300
		');
		foreach($rows as $i => $row)
		{
			$comments[$i] = array();
			$comments[$i] = $row;
			switch($row['type'])
			{
				case 1: // NPC
					$comments[$i]['subject'] = $DB->selectCell('SELECT name_loc'.$_SESSION['locale'].' FROM locales_creature WHERE entry=?d LIMIT 1', $row['typeID']);
					break;
				case 2: // GO
					$comments[$i]['subject'] = $DB->selectCell('SELECT name_loc'.$_SESSION['locale'].' FROM locales_gameobject WHERE entry=?d LIMIT 1', $row['typeID']);
					break;
				case 3: // Item
					$comments[$i]['subject'] = $DB->selectCell('SELECT name_loc'.$_SESSION['locale'].' FROM locales_item WHERE entry=?d LIMIT 1', $row['typeID']);
					break;
				case 4: // Item Set
					$comments[$i]['subject'] = $DB->selectCell('SELECT name_loc'.$_SESSION['locale'].' FROM ?_itemset WHERE itemsetID=?d LIMIT 1', $row['typeID']);
					break;
				case 5: // Quest
					$comments[$i]['subject'] = $DB->selectCell('SELECT Title_loc'.$_SESSION['locale'].' FROM locales_quest WHERE entry=?d LIMIT 1', $row['typeID']);
					break;
				case 6: // Spell
					$comments[$i]['subject'] = $DB->selectCell('SELECT spellname_loc'.$_SESSION['locale'].' FROM ?_spell WHERE spellID=?d LIMIT 1', $row['typeID']);
					break;
				case 7: // Zone
					$comments[$i]['subject'] = $DB->selectCell('SELECT name_loc'.$_SESSION['locale'].' FROM ?_zones WHERE areatableID=?d LIMIT 1', $row['typeID']);
					break;
				case 8: // Faction
					$comments[$i]['subject'] = $DB->selectCell('SELECT name_loc'.$_SESSION['locale'].' FROM ?_factions WHERE factionID=?d LIMIT 1', $row['typeID']);
					break;
				default:
					$comments[$i]['subject'] = 'Unknown';
					break;;
			}
			$comments[$i]['user'] = $rDB->selectCell('SELECT username FROM account WHERE id=?d LIMIT 1', $row['user']);
			if(empty($comments[$i]['user']))
				$comments[$i]['user'] = 'Anonymous';
			$comments[$i]['rating'] = array_sum($DB->selectCol('SELECT rate FROM ?_comments_rates WHERE commentid=?d', $row['id']));
			$comments[$i]['purged'] = ($comments[$i]['rating'] <= -50)? 1: 0;
			$comments[$i]['deleted'] = 0;
		}
		$smarty->assign('comments', $comments);
		$smarty->display('latest_comments.tpl');
		break;
	case 'screenshots':
		
		$screenshots = array();
		$rows = $DB->select('
			SELECT `id`, `type`, `typeID`, `body`, `username`, `width`, `height`, `date` as `date`, (NOW()-`date`) as `elapsed`
			FROM ?_screenshots
			WHERE 1
			ORDER BY date DESC
			LIMIT 300
		');
		foreach($rows as $i => $row)
		{
			$screenshots[$i] = array();
			$screenshots[$i] = $row;
			$screenshots[$i]['number'] = $i;
			switch($row['type'])
			{
				case 1: // NPC
					$screenshots[$i]['subject'] = $DB->selectCell('SELECT name_loc'.$_SESSION['locale'].' FROM locales_creature WHERE entry=?d LIMIT 1', $row['typeID']);
					break;
				case 2: // GO
					$screenshots[$i]['subject'] = $DB->selectCell('SELECT name_loc'.$_SESSION['locale'].' FROM locales_gameobject WHERE entry=?d LIMIT 1', $row['typeID']);
					break;
				case 3: // Item
					$screenshots[$i]['subject'] = $DB->selectCell('SELECT name_loc'.$_SESSION['locale'].' FROM locales_item WHERE entry=?d LIMIT 1', $row['typeID']);
					break;
				case 4: // Item Set
					$screenshots[$i]['subject'] = $DB->selectCell('SELECT name_loc'.$_SESSION['locale'].' FROM ?_itemset WHERE itemsetID=?d LIMIT 1', $row['typeID']);
					break;
				case 5: // Quest
					$screenshots[$i]['subject'] = $DB->selectCell('SELECT Title_loc'.$_SESSION['locale'].' FROM locales_quest WHERE entry=?d LIMIT 1', $row['typeID']);
					break;
				case 6: // Spell
					$screenshots[$i]['subject'] = $DB->selectCell('SELECT spellname_loc'.$_SESSION['locale'].' FROM ?_spell WHERE spellID=?d LIMIT 1', $row['typeID']);
					break;
				case 7: // Zone
					$screenshots[$i]['subject'] = $DB->selectCell('SELECT name_loc'.$_SESSION['locale'].' FROM ?_zones WHERE areatableID=?d LIMIT 1', $row['typeID']);
					break;
				case 8: // Faction
					$screenshots[$i]['subject'] = $DB->selectCell('SELECT name_loc'.$_SESSION['locale'].' FROM ?_factions WHERE factionID=?d LIMIT 1', $row['typeID']);
					break;
				default:
					$screenshots[$i]['subject'] = 'Unknown';
					break;;
			}
			$screenshots[$i]['user'] = $row['username'];
			$screenshots[$i]['body'] = $row['body'];
			$screenshots[$i]['width'] = $row['width'];
			$screenshots[$i]['height'] = $row['height'];
			$screenshots[$i]['typeId']= $row['typeID'];
			$screenshots[$i]['type']= $row['type'];
			$screenshots[$i]['id']= $row['id'];
			/*$screenshots[$i]['purged'] = ($comments[$i]['rating'] <= -50)? 1: 0;
			$screenshots[$i]['deleted'] = 0;*/
		}
		$smarty->assign('screenshots', $screenshots);
		$smarty->display('latest_screenshots.tpl');
		break;
	default:
		break;
}

global $page;
$page = array(
	'Mapper' => false,
	'Book' => false,
	'Title' => '',
	'tab' => 0,
	'type' => 0,
	'typeid' => 0,
	'username' => $_SESSION['username'],
	'path' => '[0, 30]'
);

$smarty->assign('page', $page);
$smarty->assign('reputation', getreputation($page['username']));
?>