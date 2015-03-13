<?php

require_once('includes/allitems.php');

$itemset_col[0] = array('itemsetID', 'name_loc'.$_SESSION['locale'], 'item1', 'item2', 'item3', 'item4', 'item5', 'item6', 'item7', 'item8', 'item9', 'item10', 'classes',);
$itemset_col[1] = array('itemsetID', 'name_loc'.$_SESSION['locale'], 'item1', 'item2', 'item3', 'item4', 'item5', 'item6', 'item7', 'item8', 'item9', 'item10', 'spell1', 'spell2', 'spell3', 'spell4', 'spell5', 'spell6', 'spell7', 'spell8', 'skillID', 'bonus1', 'bonus2', 'bonus3', 'bonus4', 'bonus5', 'bonus6', 'bonus7', 'bonus8', 'skilllevel', 'classes');

function itemsetinfo2(&$row)
{
	$itemset = array();
	$itemset['entry'] = $row['itemsetID'];
	$itemset['name'] = $row['name_loc'.$_SESSION['locale']];
	$itemset['minlevel'] = 255;
	$itemset['maxlevel'] = 0;
	$itemset['pieces'] = array();
	for($j=1;$j<=10;$j++)
		if ($row['item'.$j])
		{
			$itemset['pieces'][] = $row['item'.$j];
			$item = array();
			$item = iteminfo($row['item'.$j], 0);
			if ($item['level'] < $itemset['minlevel']) $itemset['minlevel'] = $item['level'];
			if ($item['level'] > $itemset['maxlevel']) $itemset['maxlevel'] = $item['level'];
		}
	if(isset($item))
	{
		$itemset['quality2'] = 7 - $item['quality'];
		if($item['classs']==4)
			$itemset['type'] = $item['subclass'];
	} else {
		$itemset['quality2'] = 7;
	}
	$rclass = array(1 => '1', 2 => '2', 4 => '3', 8 => '4', 16 => '5', 32 => '6', 64 => '7', 128 => '8', 256 => '9', 1024 => '11');

        if ($item['rclass'] > 0){

        $itemset['classes'] = $rclass[$item['rclass']];

        }
	return $itemset;
}

?>