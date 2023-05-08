<?php

require_once('includes/game.php');

// TODO: Get Extension from data and not from name :\
function getExtension($str) {
         $i = strrpos($str,".");
         if (!$i) { return ""; }
         $l = strlen($str) - $i;
         $ext = substr($str,$i+1,$l);
         return $ext;
};

function getscreenshots($type, $typeid)
{
	global $DB;
	global $rDB;

	// TODO: AND moderated=1
	$rows = $DB->select('
		SELECT id, username, date, body, width, height
		FROM ?_screenshots
		WHERE type=? AND typeid=? 
		ORDER BY date
		',
		$type, $typeid
	);

	$screenshots = array();

	foreach($rows as $i=>$row)
	{
		$screenshots[$i] = array();
		//$comments[$i] = $rDB->selectRow('SELECT username as user,id as uid, (SELECT gmlevel from account_access where id = uid ) as roles FROM account WHERE id=? LIMIT 1', $row['userid']);
	//	if (!(IsSet($comments[$i]['user'])))
	//		$comments[$i]['user'] = "Anonymous";
		$screenshots[$i]['number'] = $i;
		$screenshots[$i]['user'] = $row['username'];
		$screenshots[$i]['body'] = $row['body'];
		$screenshots[$i]['date'] = $row['date'];
		$screenshots[$i]['width'] = $row['width'];
		$screenshots[$i]['height'] = $row['height'];
		$screenshots[$i]['type'] = $type;
		$screenshots[$i]['typeId'] = $typeid;
		$screenshots[$i]['id'] = $row['id'];
	}

	return $screenshots;
}
function save_whss_cache($type, $typeid, $content)
{
	$file = 'cache/wowhead/wh_ss_'.$type.'_'.$typeid.'.aww';
	file_put_contents($file, $content);
}
function load_whss_cache($type, $typeid)
{
	$data['content'] = @file_get_contents('cache/wowhead/wh_ss_'.$type.'_'.$typeid.'.aww');
	if($data['content']){
	$data['status'] = 'true';}
	else{
		$data = false;
	}
	return $data;
}
function get_wowhead_screenshots($type, $typeid, $mode)
{
	global $DB;
	switch ($mode)
	{
		case 'page':
		if(!$wh_ss = load_whss_cache($type, $typeid)){
			unset($wh_ss);
				$wh_ss['status'] = 'false';}
				break;
		case 'ajax':
			{
				$types = array(1 => "npc", 2 => "object", 3 => "item", 6 => "spell", 5 => "quest", 4 => "itemset", 7 => "zone");
				if (extension_loaded('curl'))
				{
					$ch = curl_init(); // инициализация
					curl_setopt($ch, CURLOPT_URL, "http://www.wowhead.com/$types[$type]=$typeid"); // адрес страницы для скачивания
					curl_setopt($ch, CURLOPT_USERAGENT,
						"Mozilla/5.0 (Windows; U; Windows NT 5.1; en-EN; rv:1.7.12) Gecko/20050919 Firefox/1.0.7"); // каким браузером будем прикидываться
					curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1); // нам нужно вывести загруженную страницу в переменную
					$wh = curl_exec($ch); // скачиваем страницу
					curl_close($ch); // закрываем соединение
					if(preg_match('(lv_screenshots = \[[^\];]*)', $wh, $match))
					{
						$wh = $match[0];
						$wh = str_replace("lv_screenshots = [", "", $wh);
						$wh = str_replace("id:", "wowhead:1,id:", $wh);
					}
					else {
						$wh = null;					
						}
				}
				$wh_ss['content'] = $wh;
				$wh_ss['status'] = 'true';
				save_whss_cache($type, $typeid, $wh_ss['content']);
				unset($wh);
				break;
			}
	}
	return $wh_ss;
}
?>