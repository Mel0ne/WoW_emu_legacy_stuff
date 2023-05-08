<?php
define ("MAX_SIZE","1024"); // TODO: Put in config.
require_once('includes/allutil.php');
require_once('includes/allscreenshots.php');

switch($_REQUEST['screenshot'])
{
	case 'add':
		$image=$_FILES['screenshotfile'];
		$url = "account=signin&error=1";

		if(!isset($_SESSION['userid'])) { redirect($url);};

		$url = $types[$type][0].'='.$id.'&error=1#submit-a-screenshot';
		if(!$image['name']){redirect($url);};
		$type	= intval($_GET['type']);
		$id		= intval($_GET['typeid']);
		$url = $types[$type][0].'='.$id.'&error=2#submit-a-screenshot';


		$filename = stripslashes($image['name']);
		$extension = getExtension($filename);
 		$extension = strtolower($extension);
		//$size=filesize($image['tmp_name']);
		$imageCheck = getimagesize($image['tmp_name']);

		if ((($extension != "jpg") && ($extension != "jpeg") && ($extension != "gif") && ($extension != "png")) || ($imageCheck[0] == 0)){redirect($url);};

		$original = imagecreatetruecolor(150,150);
		$thumb = imagecreatetruecolor(150,150); // Lo haremos de un tamaño 150x150

		switch($imageCheck['mime']){
			case "image/jpeg":
			case "image/jpg":
				$original = imagecreatefromjpeg($image['tmp_name']);
				$extension="jpg";
				break;
			case "image/gif":
				$original = imagecreatefromgif($image['tmp_name']);
				$extension="gif";
				break;
			case "image/png":
				$original = imagecreatefrompng($image['tmp_name']);
				$extension="png";
				break;
			default:
				redirect($url);
		}

		$image_name=time().''.$_SESSION["userid"];
		$newname="images/screenshots/normal/".$image_name.".".$extension;
		$newnamethumb="images/screenshots/thumb/".$image_name.".".$extension;

		$ancho = imagesx($original);
		$alto = imagesy($original);

		imagecopyresampled($thumb,$original,0,0,0,0,150,150,$ancho,$alto);

		imagejpeg($thumb,$newnamethumb,90); // 90 es la calidad de compresión

		$url = $types[$type][0].'='.$id.'#screenshots';

		$copied = copy($image['tmp_name'], $newname);
		if ($copied) 
		{
			$insertScreenshot = $DB->query('
				INSERT INTO ?_screenshots (type, typeid, username, body, date, width, height)
				VALUES (?d, ?d, ?, ?, NOW(), ?d, ?d)
			',
			$type,
			$id,
			$_SESSION['username'],
			stripslashes($image_name.'.'.$extension),
			$imageCheck[0],
			$imageCheck[1]
			);
			$currdate = date('Y/m/d');
			$username = $_SESSION['username'];
			$addrep = mysql_query("INSERT INTO account_reputation (username, reputation, reason, date) VALUES ('$username', '5', '5', '$currdate')");
		};
		//screenshotfile
		redirect($url);
		break;
	case 'getwh':
	//sleep(1);
	require_once('includes/allscreenshots.php');
	$ss = get_wowhead_screenshots(intval($_GET['type']), intval($_GET['typeid']), 'ajax');
	$content = $ss['content'];
	echo "wh_screenshots=[$content];lv_screenshots = lv_screenshots.concat(wh_screenshots);ge('tab-screenshots').innerHTML = \"\";ge('tab-screenshots').innerHTML = '<div id=\"lv-screenshots\"></div>';tabsRelated.setTabName(tabsRelated.tabs.length - 1, LANG.tab_screenshots + \" (\"+wh_screenshots.length+\")\"); try{new Listview({template:'screenshot',id:'screenshots', data: lv_screenshots});}catch(err){alert(err.message)};ge('infobox-sticky-ss').innerHTML = \"\";ss_appendSticky();if(tabsRelated.getSelectedTab() != tabsRelated.tabs.length - 1){ge('tab-screenshots').style.display = 'none'};";
	//echo "wh_screenshots=[$content];lv_screenshots = lv_screenshots.concat(wh_screenshots);tabsRelated.setTabName(2, 'lol');ge('tab-screenshots').innerHTML = \"\";ge('tab-screenshots').innerHTML = \"\";ge('tab-screenshots').innerHTML = '<div id=\"lv-screenshots\"></div>'; try{new Listview({template:'screenshot',id:'screenshots', data: lv_screenshots});}catch(err){alert(err.message)};ge('tab-screenshots').style.display = 'none';";
		break;
	default:
		redirect("/");
		break;
}
?>