<?php

function databaseErrorHandler($message, $info) {
	// Если использовалась @, ничего не делать.
	if (!error_reporting()) return;
	// Выводим подробную информацию об ошибке.
	echo "SQL Error: $message<br><pre>"; 
	print_r($info);
	echo "</pre>";
	exit();
}

function win2uni($string) {
	$string = convert_cyr_string($string,'w','i');
	for ($result='', $i=0; $i<strlen($string); $i++){
		$charcode = ord($string[$i]);
		$result .= ($charcode>175)?"&#".(1040+($charcode-176)).";":$string[$i];
	}

	return $result;
}


function testSocketRealm($host,$port) {
	$s = @fsockopen($host, $port, $ERROR_NO, $ERROR_STR,(float)0.5);
	if($s){@fclose($s);return true;} else return false;
}

function onlineChars() {
	// Игроков играет на данный момент (в игре)
	global $cDB;
	$result = $cDB->selectPage($all_players,"SELECT * FROM `characters` WHERE online<>0");
	$result = $cDB->selectPage($aliance_players,"SELECT * FROM `characters` WHERE online<>0 and `race` IN (1, 3, 4, 7, 11)");
	$result = $cDB->selectPage($horde_players,"SELECT * FROM `characters` WHERE online<>0 and `race` IN (2, 5, 6, 8, 10)");
		
	return array($all_players, $aliance_players, $horde_players);
}

function countChars() {
	// населённость
	global $cDB;
	$result = $cDB->selectCol("SELECT `guid` FROM `characters`");
	$all_players = sizeof($result);
	$result = $cDB->selectCol("SELECT `guid` FROM `characters` WHERE `race` IN (1, 3, 4, 7, 11)");
	$aliance_players = sizeof($result);
	$result = $cDB->selectCol("SELECT `guid` FROM `characters` WHERE `race` IN (2, 5, 6, 8, 10)");
	$horde_players = sizeof($result);
	return array($all_players, $aliance_players, $horde_players);
}

function uptimeServer() {
	global $wDB;
	$result = $wDB->selectRow("SELECT * FROM `uptime` ORDER BY `starttime` DESC");
		
 	$upsince = $result['starttime'];
  	$gettime = (time() - $upsince);
  	$days = floor($gettime/(24 * 3600));
	$gettime = $gettime - $days * (24 * 3600);
	$hours = floor($gettime/3600);
	$gettime = $gettime - $hours * 3600;
  	$minutes = floor($gettime/60);
	$gettime = $gettime - $minutes * 60;
  	$seconds = floor($gettime);

	return array($days, $hours, $minutes, $seconds);
}

function getHexColors($c) {
	$c = preg_replace("/[^a-f0-9]/i", "", $c);
	return array(
		hexdec(substr($c, 0, 2)),
		hexdec(substr($c, 2, 2)),
		hexdec(substr($c, 4, 2))
	);
}

?>