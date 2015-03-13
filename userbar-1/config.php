<?php

$config = array(
	'rdb'			=> 'mysql://root:root@localhost:3306/realmd',
	'cdb'			=> 'mysql://root:root@localhost:3306/characters',
	'wdb'			=> 'mysql://root:root@localhost:3306/mangos',
	'db_encoding'	=> 'utf8',
	'img_type'		=> 'png',
	'realmid'		=> 1,
	'gmstatus_enable'=> true, // true - отображать статус ГМ, false - ГМы как обычные игроки
	'cache_timeout'	=> 1, // secs
	/**
	*	11723 -> 3.3.3a
	**/
	'buildClient'	=> 11723,
	'lang'			=> 'en', // выбор языка (  en/ru ).
);

$dir = "/userbar/";

function databaseErrorHandler($message, $info) {
	// Если использовалась @, ничего не делать.
	if (!error_reporting()) return;

	print "<table>";
	print "<tr><td><font><b>[SQL Error]</b></font>: $message</td></tr>";
	print "<tr><td><pre>".print_r($info, true)."</div></pre></td></tr>";
	print "</table>";
	exit();
}

?>