<?php	

$db_config = array(
	'rdb_type'		=> 'mysql',			// type DB
	'rdb_hostname' 	=> 'localhost',		// hostname DB
	'rdb_port'		=> '3306',			// port DB
	'rdb_username'	=> 'root',			// username DB
	'rdb_pass'		=> '',			// user's password DB
	'rdb_db'		=> 'realmd',		// selected DB

	'wdb_type' 		=> 'mysql',
	'wdb_hostname' 	=> 'localhost',
	'wdb_port' 		=> '3306',
	'wdb_username' 	=> 'root',
	'wdb_pass' 		=> '',
	'wdb_db' 		=> 'mangos',

	'cdb_type'		=> 'mysql',			// type DB
	'cdb_hostname' 	=> 'localhost',		// hostname DB
	'cdb_port'		=> '3306',			// port DB
	'cdb_username'	=> 'root',			// username DB
	'cdb_pass'		=> '',			// user's password DB
	'cdb_db'		=> 'characters',	// selected DB

	'db_encoding'	=> 'utf8'			// set encoding DB
);

$rates = array(
	'quest' => 'x1',
	'honor' => 'x1',
	'npc'	=> 'x1',
	'drop'	=> 'x1',
);

$color_on  = "00CC66";
$color_off = "FF0000";

$mainFont = "verdanay.ttf";

$text_color = array(
	'in_block' => 'FFFF00',		// цвет всех надписей в блоках - пойже будет разбит на несколько цветов
	'title_online' => '00CC66',	// цвет верхней надписи / сервер онлайн
	'title_offline'=> 'FF0000',	// цвет верхней надписи / сервер оффлайн/shutdown
	'title_crash'  => 'FFFFFF'	// цвет верхней надписи / сервер оффлайн/crash
);

?>