<?php
function getreputation($username)
{
	global $rDB;
	
	$rows = $rDB->select('
		SELECT *
		FROM account_reputation
		WHERE username=?
		ORDER BY id DESC
		',
		$username
	);
	
	foreach($rows as $row)
	{
		$reputation = array();
		$reputation['user'] = $row['username'];
		$reputation['amount'] = $row['reputation'];
		$reputation['action'] = $row['reason'];
		$reputation['date'] = $row['date'];
		$reputation['totalrep'] = $rDB->selectCell('
				SELECT SUM(reputation) 
				FROM account_reputation 
				WHERE username=?
			',
			$username
		);
		$reputation['actions'] = $rDB->selectCell('
				SELECT COUNT(*) 
				FROM account_reputation 
				WHERE username=?
			',
			$username
		);
	}
	
	return $reputation;
}
?>