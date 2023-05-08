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
	);
	var $b_width = 333;
	var $b_height= 83;
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

		$this->data['addon'] = $this->pl->getAddonId();
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

	public function set_expansion(){
		switch($this->data['addon']){
			case ADDON_BC:
				$imgexpansion = ImageCreateFromGIF("static/expansion/bc.gif");
				ImageCopyResampled($this->img, $imgexpansion, 4, 68, 0, 0, 29, 12, ImageSX($imgexpansion), ImageSY($imgexpansion));
				break;
			case ADDON_WLK:
				$imgexpansion = ImageCreateFromGIF("static/expansion/wlk.gif");
				ImageCopyResampled($this->img, $imgexpansion, 4, 68, 0, 0, 48, 12, ImageSX($imgexpansion), ImageSY($imgexpansion));
				break;
			case ADDON_CATACLISM: // не используется пока
				break;
			default:
				break;
		}
	}

	public function mini_userbar($name){
		if($f = $this->checkCache(strtolower($name),true)){
			$this->getCache($f);
			return;
		}

		$this->init($name,'mini'); // $data - массив данных

		$this->img = ImageCreateTrueColor($this->s_width, $this->s_height);

		$black = ImageColorAllocate($this->img, 0, 0, 0);
		ImageFill($this->img, 0, 0, $black);

		$text_r = 255; $text_g = 210; $text_b = 0;
		$s_text_r = 255; $s_text_g = 255; $s_text_b = 255;
		list($text_r, $text_g, $text_b) = $this->getHexColors($this->text_color[0]);
		list($s_text_r, $s_text_g, $s_text_b) = $this->getHexColors($this->text_color[1]);
	
		$textcolor = ImageColorAllocate($this->img, $text_r, $text_g, $text_b);

		list($base_r, $base_g, $base_b) = $this->getHexColors($this->color[0]);
		list($dest_r, $dest_g, $dest_b) = $this->getHexColors($this->getFonBase());

		for($i=0; $i<ImageSY($this->img); $i++) {
			$r = min($base_r + (($dest_r - $base_r) / ImageSY($this->img) * $i) ,255);
			$g = min($base_g + (($dest_g - $base_g) / ImageSY($this->img) * $i) ,255);
			$b = min($base_b + (($dest_b - $base_b) / ImageSY($this->img) * $i) ,255);
			$c = ImageColorAllocate($this->img, $r, $g, $b);
			ImageLine($this->img, 0, $i, ImageSX($this->img), $i, $c);
			ImageColorDeallocate($this->img, $c);
		}

		$gender = $this->data['gender'];
		$race = $this->data['race'];
		$class = $this->data['class'];
		$lvl = $this->data['level'];

		$ramka	= ImageCreateFromGIF(ICON_BORDER_PORTRAIT);
		$gm 	= ImageCreateFromGIF(ICON_GM);
		$r_bar 	= ImageCreateFromGIF(ICON_RIGHT_BAR);
		$active = ImageCreateFromGIF("static/icon-active.gif");

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

		$offset = 0;
		$blacka = ImageColorAllocateAlpha($this->img, 0, 0, 0, 100);
		ImageFilledRectangle($this->img, 0, 0, ImageSX($this->img) - 1, ImageSY($this->img) - 1, $blacka);

		ImageCopyResampled($this->img, $portrait, 8, 8, 0, 0, 64, 64, ImageSX($portrait), ImageSY($portrait));
		ImageCopyResampled($this->img, $ramka, 0, 0, 0, 0, 83, 83, ImageSX($ramka), ImageSY($ramka)); // $ramka
		ImageCopyResampled($this->img, $r_bar, 83, 4, 0, 0, 28, 76, ImageSX($r_bar), ImageSY($r_bar)); // $r_bar

		$this->set_expansion();

		if($this->is_gm){
			ImageCopyResampled($this->img, $gm, 57, 60, 0, 0, 20, 13, ImageSX($gm), ImageSY($gm));
		}else{
			$diff_x = ($this->data['level']>=10)? 61 : 64;
			ImageTTFText($this->img, 8, 0, $diff_x, 70, $textcolor, $this->font['wow'], $this->data['level']);
		}

		//Класс, раса, ранг ПвП
		ImageCopyResampled($this->img, $imgrace, 85, 12, 0, 0, 18, 18, ImageSX($imgrace), ImageSY($imgrace));
		ImageCopyResampled($this->img, $imgclass, 85, 33, 0, 0, 18, 18, ImageSX($imgclass), ImageSY($imgclass));
		ImageCopyResampled($this->img, $active, 85, 33, 0, 0, 18, 18, ImageSX($active), ImageSY($active));

		if($this->data['honor_rank']){
			ImageCopyResampled($this->img, $imgpvp, 85, 54, 0, 0, 18, 18, ImageSX($imgpvp), ImageSY($imgpvp));
		}else{
			ImageCopyResampled($this->img, $imgfraction, 84, 54, 0, 1, 19, 19, ImageSX($imgfraction), ImageSY($imgfraction));
		}

		$this->output(strtolower($this->pl->name), true);
	}

	public function userbar($name){
		if($f = $this->checkCache(strtolower($name), false)){
			$this->getCache($f);
			return;
		}

		$this->init($name,'default'); // -> $data - массив данных
		global $config;

		$this->img = ImageCreateTrueColor($this->b_width, $this->b_height);

		$black = ImageColorAllocate($this->img, 0, 0, 0);
		ImageFill($this->img, 0, 0, $black);

		$text_r = 255; $text_g = 210; $text_b = 0;
		$s_text_r = 255; $s_text_g = 255; $s_text_b = 255;
		list($text_r, $text_g, $text_b) = $this->getHexColors($this->text_color[0]);
		list($s_text_r, $s_text_g, $s_text_b) = $this->getHexColors($this->text_color[1]);
	
		$textcolor = ImageColorAllocate($this->img, $text_r, $text_g, $text_b);
		$secondaryTextColor = ImageColorAllocate($this->img, $s_text_r, $s_text_g, $s_text_b);
	
		list($base_r, $base_g, $base_b) = $this->getHexColors($this->color[0]);
		list($dest_r, $dest_g, $dest_b) = $this->getHexColors($this->getFonBase());

		for($i=0; $i<ImageSY($this->img); $i++) {
			$r = min($base_r + (($dest_r - $base_r) / ImageSY($this->img) * $i) ,255);
			$g = min($base_g + (($dest_g - $base_g) / ImageSY($this->img) * $i) ,255);
			$b = min($base_b + (($dest_b - $base_b) / ImageSY($this->img) * $i) ,255);
			$c = ImageColorAllocate($this->img, $r, $g, $b);
			ImageLine($this->img, 0, $i, ImageSX($this->img), $i, $c);
			ImageColorDeallocate($this->img, $c);
		}

		$gender = $this->data['gender'];
		$race = $this->data['race'];
		$class = $this->data['class'];
		$lvl = $this->data['level'];

		$ramka	= ImageCreateFromGIF(ICON_BORDER_PORTRAIT);
		$realm	= ImageCreateFromGIF(ICON_REALM);
		$gm 	= ImageCreateFromGIF(ICON_GM);
		$r_bar 	= ImageCreateFromGIF(ICON_RIGHT_BAR);
		$achieve= ImageCreateFromPNG(ICON_ACHIEVE);
		$guildmaster = ImageCreateFromGIF(ICON_GUILDMASTER);
		$active = ImageCreateFromGIF("static/icon-active.gif");
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

		ImageCopyResampled($this->img, $portrait, 8, 8, 0, 0, 64, 64, ImageSX($portrait), ImageSY($portrait));
		ImageCopyResampled($this->img, $ramka, 0, 0, 0, 0, 83, 83, ImageSX($ramka), ImageSY($ramka)); // $ramka
		ImageCopyResampled($this->img, $r_bar, 83, 4, 0, 0, 28, 76, ImageSX($r_bar), ImageSY($r_bar)); // $r_bar

		$this->set_expansion();

		if($this->is_gm){
			ImageCopyResampled($this->img, $gm, 57, 60, 0, 0, 20, 13, ImageSX($gm), ImageSY($gm));
		}else{
			$diff_x = ($this->data['level']>=10)? 61 : 64;
			ImageTTFText($this->img, 8, 0, $diff_x, 70, $textcolor, $this->font['wow'], $this->data['level']);
		}

		//Класс, раса, ранг ПвП
		ImageCopyResampled($this->img, $imgrace, 85, 12, 0, 0, 18, 18, ImageSX($imgrace), ImageSY($imgrace));
		ImageCopyResampled($this->img, $imgclass, 85, 33, 0, 0, 18, 18, ImageSX($imgclass), ImageSY($imgclass));
		ImageCopyResampled($this->img, $active, 85, 33, 0, 0, 18, 18, ImageSX($active), ImageSY($active));

		if($this->data['honor_rank'] > 0){
			ImageCopyResampled($this->img, $imgpvp, 85, 54, 0, 0, 18, 18, ImageSX($imgpvp), ImageSY($imgpvp));
		}else{
			ImageCopyResampled($this->img, $imgfraction, 84, 54, 0, 1, 19, 19, ImageSX($imgfraction), ImageSY($imgfraction));
		}

		// цвет линии опыта основан на цвете градиента юзербара 
		$xplinecolor = ImageColorAllocate($this->img, $dest_r, $dest_g, $dest_b); 
		$lineWidth = 220; $y0 = 38; $x0 = 111;
		ImageLine($this->img, $x0, $y0, $x0+$lineWidth, $y0, $textcolor); 
		if($lvl < $this->data['maxlvl']){
			ImageLine($this->img, $x0, $y0, $x0+$lineWidth*$this->data['xp']/$this->data['xp_next'], $y0, $xplinecolor); 
		}

		$this->fontSize = (strlen($this->pl->name)>=10)? 18 : 21;
		$this->font_name = ($this->is_cyrillic($this->pl->name))? $this->font['friztrus'] : $this->font['wow'];
		if($this->pl->inGuild()){
			ImageTTFText($this->img, 9, 0, 114, 52, $textcolor, $this->font['friztrus'], $this->pl->guildNmae);
			if($this->pl->isGuildLeader()){
				ImageCopyResampled($this->img, $guildmaster, 115, 16, 0, 0, 18, 18, ImageSX($guildmaster), ImageSY($guildmaster));
				ImageTTFText($this->img, $this->fontSize, 0, 136, 35, $textcolor, $this->font_name, $this->pl->name);
			}else{
				ImageTTFText($this->img, $this->fontSize, 0, 116, 35, $textcolor, $this->font_name, $this->pl->name);
			}
		}else{
			ImageTTFText($this->img, $this->fontSize, 0, 116, 35, $textcolor, $this->font_name, $this->pl->name);
		}

		$this->pl->acctid = $this->pl->getAccountId();
		$realm_name = $this->pl->getRealmName($config['realmid'],false);
		ImageCopyResampled($this->img, $realm, 115, 64, 0, 0, 16, 16, ImageSX($realm), ImageSY($realm));
		ImageTTFText($this->img, 9, 0, 133, 77, $textcolor, $this->font['friztrus'], $realm_name);

		$honor = $this->data['totalHonorPoints'];
		if($honor > 0){ // show honor
			ImageCopyResampled($this->img, $imghonor, 265, -3, 0, 0, 26, 26, ImageSX($imghonor), ImageSY($imghonor));
			ImageTTFText($this->img, 8, 0, 287, 13, $textcolor, $this->font['wow'], $honor);
		}
		
		if($this->data['achievement']>0){ // show achievement
			ImageCopyResampled($this->img, $achieve, 266, 16, 0, 0, 23, 23, ImageSX($achieve), ImageSY($achieve));
			ImageTTFText($this->img, 8, 0, 289, 32, $textcolor, $this->font['wow'], $this->data['achievement']);
		}

		if(!is_null($this->data['profs'])){
			$count = count($this->data['profs']);
			if($count > 2) $count = 2;
			$textLeft = 270;
			for($i=0; $i<$count; $i++) {
				$value = $this->data['profs'][$i]['value'];
				$skill = $this->data['profs'][$i]['skill'];
				$imgproff = ImageCreateFromGIF(DIR_ICONS_PROFESSION.$skill.'.gif');
				$diff = ($value<10)? 9 : (($value>10 && $value<20)? 7: (($value>20 && $value<100)? 4: 3));
				ImageCopyResampled($this->img, $imgproff, $textLeft+28*$i, 41, 0, 0, 27, 27, ImageSX($imgproff), ImageSY($imgproff));
				ImageTTFText($this->img, 8, 0, $textLeft+(30*$i)+$diff, 75, $textcolor, $this->font['wow'], $value);
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