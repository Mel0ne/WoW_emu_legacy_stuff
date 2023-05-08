<?php

$db_config = array(
	'dbc_dns'		=> 'mysql://root:root@localhost:3306/wow.dbc?charset=utf8',
	// 'db_prefix'		=> 'dbc_',
);

function databaseErrorHandler($message, $info) {
	// Если использовалась @, ничего не делать.
	if (!error_reporting()) return;
	// Выводим подробную информацию об ошибке.
	print "<table class=report>";
	print "<tr><td><font class=red><b>[SQL Error]</b></font>: $message</td></tr>";
	print "<tr><td><pre>".print_r($info, true)."</div></pre></td></tr>";
	print "</table>";
	exit();
}

// $f_log = fopen('logs.xmp','a+');
function databaseLogHandler($db, $sql){
	global $f_log;
	$caller = $db->findLibraryCaller();
	$tip = "at ".@$caller['file'].' line '.@$caller['line'];
	// Печатаем запрос (конечно, Debug_HackerConsole лучше)
	// echo "<xmp title=\"$tip\">"; print_r($sql); echo "</xmp>";
	fwrite($f_log,"<xmp title=\"$tip\">".$sql."</xmp>\r\n");
}
?>
