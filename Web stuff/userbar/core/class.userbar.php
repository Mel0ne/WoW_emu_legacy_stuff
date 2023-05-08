<?php

define('ADDON_BC',1);
define('ADDON_WLK',2);
define('ADDON_CATACLISM',3); // no used

define('IMG_TYPE_JPEG', 'jpg');
define('IMG_TYPE_PNG',  'png');
define('IMG_TYPE_GIF',  'gif');

define('ICON_BORDER_PORTRAIT','static/icon-ramka.gif');
define('ICON_RIGHT_BAR','static/icon-rbar.gif');
define('ICON_BOTTOM_BAR','static/icon-bbar.png');
define('ICON_GUILDMASTER','static/icon-guildmaster.gif');
define('ICON_REALM','static/icon-realm.gif');
define('ICON_ACHIEVE','static/icon-achieve.png');
define('ICON_GM','static/icon-gm.gif');
define('ICON_FRACTION_ALLIANCE','static/icon-fraction-7.png');
define('ICON_FRACTION_HORDE','static/icon-fraction-1.png');
define('ICON_HONOR_ALLIANCE','static/icon-honor-7.png');
define('ICON_HONOR_HORDE','static/icon-honor-1.png');

define('DIR_ICONS_CLASS','static/class/');
define('DIR_ICONS_RACE','static/race/');
define('DIR_ICONS_PVPRANK','static/pvp_rank/');
define('DIR_ICONS_PROFESSION','static/profession/');

define('PLAYER_MAX_LEVEL',80);

define ('UNDER','static/lvlbg_horde.png');
define ('BG_HORDE', 'static/bg_horde.jpg');
define ('BG_ALLIANCE', 'static/bg_alliance.jpg');

define ('BG_HORDE_MINI', 'static/bg_horde_mini.jpg');
define ('BG_ALLIANCE_MINI', 'static/bg_alliance_mini.jpg');

class userbar{

	var $cache_timeout = false;
	var $output_type = false;

	var $img;
	var $color = array(
		'000000',
		array(
			'ColorsA' => '006BFF',
			'ColorsH' => 'FF0000',
			'ColorsGM'=> '00CC66'
		)
	);
	var $text_color = array('FFFF00','FFFFFF');
	var $font = array(
		'wow'		=> 'static/fonts/FrizQuadrataCTT.ttf',
		'friztrus' 	=> 'static/fonts/FritzQuadrataCyrilic.ttf',
		'georgia'	=> 'static/fonts/georgia.ttf',
		'georgia_bold'	=> 'static/fonts/georgia_bold.ttf'
	);
	var $b_width = 468;
	var $b_height= 96;
	var $s_width = 113;
	var $s_height= 83;
	var $is_gm = false;

	function __construct(){
		global $config;

		include_once dirname(__FILE__).'/class.character.php';
		$this->pl = new Character();
		if($this->output_type != $config['img_type'])
			$this->output_type = $config['img_type'];
		if($this->cache_timeout != $config['cache_timeout'])
			$this->cache_timeout = $config['cache_timeout'];
	}

	private function init($name,$type='default'){
		global $config;

		$this->pl->name = $name;

		if (!$this->pl->CharacterExists($this->pl->name)) { exit("Ошибка! Персонаж <b>".$this->pl->name."</b> не найден!");}

		$arr = array('guid','account','name','race','class','gender','level','totalHonorPoints');
		$this->data = $this->pl->getData($arr);

		$this->pl->acctid = $this->data['account'];
		$this->data['fraction'] = $this->pl->getFractionId($this->data['race']);

		$this->data['gmlevel'] = $this->pl->getGMAccess();
		$this->is_gm = ($this->data['gmlevel'] > 0 && $config['gmstatus_enable'] === true)? true:false;

		$this->data['honor_rank'] = $this->pl->getHonorRank($this->data['totalHonorPoints']);

		if($type == 'default'){
			$arr = array('arenaPoints','totalKills','xp');
			$this->data = array_merge($this->data,$this->pl->getData($arr),$this->pl->getXP());
			$this->pl->getAllProfessions();
			$this->data['profs'] = $this->pl->profs;
			$this->data['achievement'] = $this->pl->getAchievement();
		}

		$this->data['maxlvl'] = PLAYER_MAX_LEVEL;
	}

	private function is_cyrillic($string){
		return (preg_match('#[А-Яа-я]#i', $string) === 1)? true : false;
	}

	private function getHexColors($c) {
		$c = preg_replace("/[^a-f0-9]/i", "", $c);
		return array(
			hexdec(substr($c, 0, 2)),
			hexdec(substr($c, 2, 2)),
			hexdec(substr($c, 4, 2))
		);
	}

	private function checkCache($name,$is_minized=false,$dir='cache/'){
		$list = array();
		$regex = md5($name);
		$regex .= ($is_minized === true) ? '_mini':'';
		if (is_dir($dir)) {
			if ($dh = opendir($dir)){
				while ($file = readdir($dh) !== false){
					if(strlen($file)>4 && preg_match_all("/".$regex."_(\w+).(\w+)/",$file,$matches)){
						$list[] = array((int) $matches[1][0],$matches[2][0]); // array(time, ext);
					}
				}

				if(empty($list))
					return false;

				$count = count($list);
				foreach($list as $f){
					if(time() - $f[0] < $this->cache_timeout){
						return $regex.'_'.$f[0].'.'.$f[1];
					}
					
					if(time() - $f[0] > 3*$this->cache_timeout)
						@unlink('cache/'.$regex.'_'.$f[0].'.'.$f[1]);
				}
				unset($list);
			}
			closedir($dh);
		}
		return false;
	}

	private function getCache($f){
		switch($this->output_type){
			case IMG_TYPE_JPEG:
				header("Content-Type: image/jpeg");
				break;
			case IMG_TYPE_GIF:
				header("Content-Type: image/gif");
				break;
			case IMG_TYPE_PNG:
			default:
				header("Content-Type: image/png");
				break;
		}
		print file_get_contents('cache/'.$f);
	}

	private function getFonBase(){
		switch($this->data['fraction']){
			case 1: // Horde
				$color = !$this->is_gm ? $this->color[1]['ColorsH']: $this->color[1]['ColorsGM'];
				break;
			case 7: // Alliance
				$color = !$this->is_gm ? $this->color[1]['ColorsA']: $this->color[1]['ColorsGM'];
				break;
			default:
				$color = $this->color[1]['ColorsGM'];
				break;
		}
		return $color;
	}
	public function mini_userbar($name){
		if($f = $this->checkCache(strtolower($name), false)){
			$this->getCache($f);
			return;
		}

		$this->init($name,'default'); // -> $data - массив данных
		global $config;
// Make image
		if (in_array($this->pl->getRace(), character::$HORDE)){
			$this->img = imagecreatefromjpeg(BG_HORDE_MINI);
		}
		else{
			$this->img = imagecreatefromjpeg(BG_ALLIANCE_MINI);
		} 

		$text_r = 255; $text_g = 255; $text_b = 255;
		$s_text_r = 255; $s_text_g = 255; $s_text_b = 255;
		list($text_r, $text_g, $text_b) = $this->getHexColors($this->text_color[0]);
		list($s_text_r, $s_text_g, $s_text_b) = $this->getHexColors($this->text_color[1]);
		$textcolor = ImageColorAllocate($this->img, $text_r, $text_g, $text_b);
		list($base_r, $base_g, $base_b) = $this->getHexColors($this->color[0]);

		$gender = $this->data['gender'];
		$race = $this->data['race'];
		$class = $this->data['class'];
		$lvl = $this->data['level'];

		$realm	= ImageCreateFromGIF(ICON_REALM);
		$achieve= ImageCreateFromPNG(ICON_ACHIEVE);
		$guildmaster = ImageCreateFromGIF(ICON_GUILDMASTER);
		//определяем вид иконки рассы на баре в зависимости от уровня персонажа
		$portrait = ($lvl<60)? ImageCreateFromGIF("static/portraits/np/$gender-$race-$class.gif") : 
						($lvl<70)? ImageCreateFromGIF("static/portraits/60/$gender-$race-$class.gif") : 
							($lvl<80)? ImageCreateFromGIF("static/portraits/70/$gender-$race-$class.gif") : 
								ImageCreateFromGIF("static/portraits/80/$gender-$race-$class.gif");
	
		$imgclass = ImageCreateFromGIF(DIR_ICONS_CLASS.$class.".gif");
		$imgrace = ImageCreateFromGIF(DIR_ICONS_RACE.$race."-".$gender.".gif");
		if($this->data['honor_rank'])
			$imgpvp = ImageCreateFromPNG(DIR_ICONS_PVPRANK."PvPRank".$this->data['honor_rank'].".png");

		$imgfraction =	($this->data['fraction'] == 1)? ImageCreateFromPNG(ICON_FRACTION_HORDE) : ImageCreateFromPNG(ICON_FRACTION_ALLIANCE);
		$imghonor =	($this->data['fraction'] == 1)? ImageCreateFromPNG(ICON_HONOR_HORDE) : ImageCreateFromPNG(ICON_HONOR_ALLIANCE);

		$offset = 0;
		$blacka = ImageColorAllocateAlpha($this->img, 0, 0, 0, 100);
		ImageFilledRectangle($this->img, 0, 0, ImageSX($this->img) - 1, ImageSY($this->img) - 1, $blacka);

//		ImageCopyResampled($this->img, $portrait, 4, 2, 0, 0, 64, 64, ImageSX($portrait), ImageSY($portrait));


			$diff_x = ($this->data['level']>=10)? 61 : 64;
			$texture = ImageCreateFromPNG(UNDER);
			ImageCopyResampled($this->img, $texture, 0, 0, 0, 0, 37, 37, ImageSX($texture), ImageSY($texture));
// level
			$levelcolor = imagecolorallocate ($this->img, 255, 255, 255);
			ImageTTFText($this->img, 16, 0, 5, 25, $levelcolor, $this->font['georgia_bold'], $this->data['level']);


		//Класс, раса, ранг ПвП
		ImageCopyResampled($this->img, $imgrace, 42, 8, 0, 0, 18, 18, ImageSX($imgrace), ImageSY($imgrace));
		ImageCopyResampled($this->img, $imgclass, 62, 8, 0, 0, 18, 18, ImageSX($imgclass), ImageSY($imgclass));

		if($this->data['honor_rank'] > 0){
			ImageCopyResampled($this->img, $imgpvp, 82, 8, 0, 0, 18, 18, ImageSX($imgpvp), ImageSY($imgpvp));
		}else{
			ImageCopyResampled($this->img, $imgfraction, 82, 8, 0, 1, 19, 19, ImageSX($imgfraction), ImageSY($imgfraction));
		}
		$this->fontSize = (strlen($this->pl->name)>=10)? 18 : 21;
		$this->font_name = ($this->is_cyrillic($this->pl->name))? $this->font['friztrus'] : $this->font['wow'];
		if($this->pl->inGuild()){
			ImageTTFText($this->img, 9, 0, 124, 35, $textcolor, $this->font['georgia'], "<".$this->pl->guildNmae.">");
			if($this->pl->isGuildLeader()){
				ImageCopyResampled($this->img, $guildmaster, 110, 2, 0, 0, 18, 18, ImageSX($guildmaster), ImageSY($guildmaster));
				ImageTTFText($this->img, 14, 0, 136, 18, $textcolor, $this->font['georgia_bold'], $this->pl->name);
			}else{
				ImageTTFText($this->img, 14, 0, 136, 18, $textcolor, $this->font['georgia_bold'], $this->pl->name);
			}
		}else{
			ImageTTFText($this->img, 14, 0, 136, 18, $textcolor, $this->font['georgia_bold'], $this->pl->name);
		}

//		$this->pl->acctid = $this->pl->getAccountId();
// Realm Name
		$realm_name = $this->pl->getRealmName($config['realmid'],false);
		$white = imagecolorallocate($this->img, 241, 241, 241);
		$blue = imagecolorallocate($this->img, 0, 180, 255);	
		ImageCopyResampled($this->img, $realm, 285, 13, 0, 0, 16, 16, ImageSX($realm), ImageSY($realm));
		ImageTTFText($this->img, 9, 0, 350, 25, $white, $this->font['georgia_bold'], $realm_name);
		ImageTTFText($this->img, 9, 0, 302, 25, $blue, $this->font['georgia_bold'], "Realm:");

// Arena, Kills, Honor
//		ImageTTFText($this->img, 9, 0, 378, 15, $white, $this->font['georgia'], "Kills: ".$this->pl->getKills());
//		ImageTTFText($this->img, 9, 0, 378, 30, $white, $this->font['georgia'], "Arena: ".$this->pl->getArenaPoints());
		$this->output(strtolower($this->pl->name),false);
	}
	public function userbar($name){
		if($f = $this->checkCache(strtolower($name), false)){
			$this->getCache($f);
			return;
		}

		$this->init($name,'default'); // -> $data - массив данных
		global $config;
// Make image
		if (in_array($this->pl->getRace(), character::$HORDE)){
			$this->img = imagecreatefromjpeg(BG_HORDE);
		}
		else{
			$this->img = imagecreatefromjpeg(BG_ALLIANCE);
		} 

		$text_r = 255; $text_g = 255; $text_b = 255;
		$s_text_r = 255; $s_text_g = 255; $s_text_b = 255;
		list($text_r, $text_g, $text_b) = $this->getHexColors($this->text_color[0]);
		list($s_text_r, $s_text_g, $s_text_b) = $this->getHexColors($this->text_color[1]);
		$textcolor = ImageColorAllocate($this->img, $text_r, $text_g, $text_b);
		list($base_r, $base_g, $base_b) = $this->getHexColors($this->color[0]);

		$gender = $this->data['gender'];
		$race = $this->data['race'];
		$class = $this->data['class'];
		$lvl = $this->data['level'];

		$realm	= ImageCreateFromGIF(ICON_REALM);
		$achieve= ImageCreateFromPNG(ICON_ACHIEVE);
		$guildmaster = ImageCreateFromGIF(ICON_GUILDMASTER);
		//определяем вид иконки рассы на баре в зависимости от уровня персонажа
		$portrait = ($lvl<60)? ImageCreateFromGIF("static/portraits/np/$gender-$race-$class.gif") : 
						($lvl<70)? ImageCreateFromGIF("static/portraits/60/$gender-$race-$class.gif") : 
							($lvl<80)? ImageCreateFromGIF("static/portraits/70/$gender-$race-$class.gif") : 
								ImageCreateFromGIF("static/portraits/80/$gender-$race-$class.gif");
	
		$imgclass = ImageCreateFromGIF(DIR_ICONS_CLASS.$class.".gif");
		$imgrace = ImageCreateFromGIF(DIR_ICONS_RACE.$race."-".$gender.".gif");
		if($this->data['honor_rank'])
			$imgpvp = ImageCreateFromPNG(DIR_ICONS_PVPRANK."PvPRank".$this->data['honor_rank'].".png");

		$imgfraction =	($this->data['fraction'] == 1)? ImageCreateFromPNG(ICON_FRACTION_HORDE) : ImageCreateFromPNG(ICON_FRACTION_ALLIANCE);
		$imghonor =	($this->data['fraction'] == 1)? ImageCreateFromPNG(ICON_HONOR_HORDE) : ImageCreateFromPNG(ICON_HONOR_ALLIANCE);

		$offset = 0;
		$blacka = ImageColorAllocateAlpha($this->img, 0, 0, 0, 100);
		ImageFilledRectangle($this->img, 0, 0, ImageSX($this->img) - 1, ImageSY($this->img) - 1, $blacka);

		ImageCopyResampled($this->img, $portrait, 4, 2, 0, 0, 64, 64, ImageSX($portrait), ImageSY($portrait));


			$diff_x = ($this->data['level']>=10)? 61 : 64;
			$texture = ImageCreateFromPNG(UNDER);
			ImageCopyResampled($this->img, $texture, 18, 50, 0, 0, 37, 37, ImageSX($texture), ImageSY($texture));
// level
			$levelcolor = imagecolorallocate ($this->img, 255, 255, 255);
			ImageTTFText($this->img, 16, 0, 22, 75, $levelcolor, $this->font['georgia_bold'], $this->data['level']);


		//Класс, раса, ранг ПвП
		ImageCopyResampled($this->img, $imgrace, 72, 2, 0, 0, 18, 18, ImageSX($imgrace), ImageSY($imgrace));
		ImageCopyResampled($this->img, $imgclass, 72, 22, 0, 0, 18, 18, ImageSX($imgclass), ImageSY($imgclass));

		if($this->data['honor_rank'] > 0){
			ImageCopyResampled($this->img, $imgpvp, 72, 45, 0, 0, 18, 18, ImageSX($imgpvp), ImageSY($imgpvp));
		}else{
			ImageCopyResampled($this->img, $imgfraction, 72, 42, 0, 1, 19, 19, ImageSX($imgfraction), ImageSY($imgfraction));
		}

		$lineWidth = 200; $y0 = 45; $x0 = 111;
		ImageLine($this->img, $x0, $y0, $x0+$lineWidth, $y0, $textcolor); 

// Achievement
		if($this->data['achievement']>0){ // show achievement
			ImageCopyResampled($this->img, $achieve, 100, 55, 0, 0, 40, 36, ImageSX($achieve), ImageSY($achieve));
			ImageTTFText($this->img, 15, 0, 139, 80, $textcolor, $this->font['wow'], $this->data['achievement']);
		}
		$this->fontSize = (strlen($this->pl->name)>=10)? 18 : 21;
		$this->font_name = ($this->is_cyrillic($this->pl->name))? $this->font['friztrus'] : $this->font['wow'];
		if($this->pl->inGuild()){
			ImageTTFText($this->img, 9, 0, 114, 35, $textcolor, $this->font['georgia'], "<".$this->pl->guildNmae.">");
			if($this->pl->isGuildLeader()){
				ImageCopyResampled($this->img, $guildmaster, 95, 2, 0, 0, 18, 18, ImageSX($guildmaster), ImageSY($guildmaster));
				ImageTTFText($this->img, 14, 0, 116, 18, $textcolor, $this->font['georgia_bold'], $this->pl->name);
			}else{
				ImageTTFText($this->img, 14, 0, 116, 18, $textcolor, $this->font['georgia_bold'], $this->pl->name);
			}
		}else{
			ImageTTFText($this->img, 14, 0, 116, 18, $textcolor, $this->font['georgia_bold'], $this->pl->name);
		}

//		$this->pl->acctid = $this->pl->getAccountId();
// Realm Name
		$realm_name = $this->pl->getRealmName($config['realmid'],false);
		$white = imagecolorallocate($this->img, 241, 241, 241);
		$blue = imagecolorallocate($this->img, 0, 180, 255);	
		ImageCopyResampled($this->img, $realm, 315, 75, 0, 0, 16, 16, ImageSX($realm), ImageSY($realm));
		ImageTTFText($this->img, 9, 0, 384, 88, $white, $this->font['georgia_bold'], $realm_name);
		ImageTTFText($this->img, 9, 0, 335, 88, $blue, $this->font['georgia_bold'], "Realm:");
// Arena, Kills, Honor
		ImageTTFText($this->img, 9, 0, 378, 15, $white, $this->font['georgia'], "Kills: ".$this->pl->getKills());
		ImageTTFText($this->img, 9, 0, 378, 30, $white, $this->font['georgia'], "Arena: ".$this->pl->getArenaPoints());
		ImageTTFText($this->img, 9, 0, 378, 45, $white, $this->font['georgia'], "Honor: ".$this->pl->getHonor());
		if(!is_null($this->data['profs'])){
			$count = count($this->data['profs']);
			if($count > 2) $count = 2;
			$textLeft = 291;
			for($i=0; $i<$count; $i++) {
				$value = $this->data['profs'][$i]['value'];
				$skill = $this->data['profs'][$i]['skill'];
				$imgproff = ImageCreateFromGIF(DIR_ICONS_PROFESSION.$skill.'.gif');
				$diff = ($value<10)? 9 : (($value>10 && $value<20)? 7: (($value>20 && $value<100)? 4: 3));
				ImageCopyResampled($this->img, $imgproff, 270+48*$i, 5, 0, 0, 27, 27, ImageSX($imgproff), ImageSY($imgproff));
				ImageTTFText($this->img, 8, 0, $textLeft+(50*$i)+$diff, 22, $textcolor, $this->font['wow'], $value);
			}	

		}
		$this->output(strtolower($this->pl->name),false);
	}

	private function output($filename,$is_minized){
		$filename = md5($filename);
		$filename .= ($is_minized)? '_mini_':'_';
		header("Expires: Sun, 1 Jan 2000 12:00:00 GMT");
		header("Last-Modified: " . gmdate("D, d M Y H:i:s") . "GMT");
		header("Content-disposition: inline; filename=$filename");
		header("Cache-Control: no-store, no-cache, must-revalidate");
		header("Cache-Control: post-check=0, pre-check=0", false);
		header("Pragma: no-cache");

		$filename .= time();
		switch($this->output_type){
			case IMG_TYPE_JPEG:
				header("Content-Type: image/jpeg");
				imagejpeg($this->img,'cache/'.$filename.'.jpg');
				imagejpeg($this->img);
				break;
			case IMG_TYPE_GIF:
				header("Content-Type: image/gif");
				imagegif($this->img,'cache/'.$filename.'.gif');
				imagegif($this->img);
				break;
			case IMG_TYPE_PNG:
			default:
				header("Content-Type: image/png");
				imagepng($this->img,'cache/'.$filename.'.png');
				imagepng($this->img);
				break;
		}
		imagedestroy($this->img);
	}

	function __destruct(){
	}
}

?>
