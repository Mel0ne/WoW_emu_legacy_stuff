<?php

	// Классы
	define('CLASS_WARRIOR',1);
	define('CLASS_PALADIN',2);
	define('CLASS_HUNTER',3);
	define('CLASS_ROGUE',4);
	define('CLASS_PRIEST',5);
	define('CLASS_DEATH_KNIGHT',6);
	define('CLASS_SHAMAN',7);
	define('CLASS_MAGE',8);
	define('CLASS_WARLOCK',9);
	define('CLASS_UNK10',10);
	define('CLASS_DRUID',11);

	// расы
	define('RACE_HUMAN',1);
	define('RACE_ORC',2);
	define('RACE_DWARF',3);
	define('RACE_NIGHT_ELF',4);
	define('RACE_UNDEAD',5);
	define('RACE_TAUREN',6);
	define('RACE_GNOME',7);
	define('RACE_TROLL',8);
	define('RACE_GOBLIN',9); //unused
	define('RACE_BLOOD_ELF',10);
	define('RACE_DRAENEI',11);

	// первичные профессии
	define('SKILL_BLACKSMITHING',164);
	define('SKILL_LEATHERWORKING',165);
	define('SKILL_ALCHEMY',171);
	define('SKILL_HERBALISM',182);
	define('SKILL_MINING',186);
	define('SKILL_TAILORING',197);
	define('SKILL_ENGINEERING',202);
	define('SKILL_ENCHANTING',333);
	define('SKILL_SKINNING',393);
	define('SKILL_JEWELCRAFTING',755);
	define('SKILL_INSCRIPTION',773);

include_once dirname(__FILE__).'/class.account.php';

class character extends account
{
	public static $HORDE = array(RACE_ORC,RACE_UNDEAD,RACE_TAUREN,RACE_TROLL,RACE_BLOOD_ELF);
	public static $ALIANCE = array(RACE_HUMAN,RACE_DWARF,RACE_NIGHT_ELF,RACE_GNOME,RACE_DRAENEI);
	public static $PROFESSIONS = array(SKILL_BLACKSMITHING,SKILL_LEATHERWORKING,SKILL_ALCHEMY,SKILL_HERBALISM,SKILL_MINING,SKILL_TAILORING,SKILL_ENGINEERING,SKILL_ENCHANTING,SKILL_SKINNING,SKILL_JEWELCRAFTING,SKILL_INSCRIPTION);

	var $is_valid = false;

	function __construct(){
		global $config;
		include_once dirname(__FILE__).'/dbsimple/Generic.php';

		$this->cDB = DbSimple_Generic::connect($config['cdb']);
		$this->cDB->setErrorHandler("databaseErrorHandler");
		$this->cDB->query("SET NAMES ? ",$config['db_encoding']);
		$this->rDB = DbSimple_Generic::connect($config['rdb']);
		$this->rDB->setErrorHandler("databaseErrorHandler");
		$this->rDB->query("SET NAMES ? ",$config['db_encoding']);
		$this->wDB = DbSimple_Generic::connect($config['wdb']);
		$this->wDB->setErrorHandler("databaseErrorHandler");
		$this->wDB->query("SET NAMES ? ",$config['db_encoding']);

		if($config['buildClient'] < 11723)
			print "Некорректно настроен конфиг. Неизвесная сборка клиента (".$config['buildClient'].")";
	}

	public function CharacterExists($name){
		if(!$name)
			return false;

		if($row = $this->cDB->selectRow("SELECT `guid`,`name` FROM `characters` WHERE `name`=? ",$name)){
			$this->name = $row['name'];
			$this->guid = $row['guid'];
			unset($row);
			return true;
		}else{
			$this->aborted = "Персонаж не найден";
			return false;
		}
	}

	public function getName(){
		if($this->name = $this->cDB->selectCell("SELECT `name` FROM `characters` WHERE `guid`=?d ",$this->guid))
			return $this->name;
		else{
			$this->aborted = "Персонаж не найден";
			return false;
		}
	}

	public function getAccountId(){
		if(@!$this->guid)
			return false;
		return $this->cDB->selectCell("SELECT `account` FROM `characters` WHERE `guid`=?d ",$this->guid);
	}

	public function getData($fields=false){
		if(!$fields)
			return false;

		$sql = "SELECT ";
		if(is_array($fields)){
			$count = count($fields);$i=0;
			foreach($fields as $key){
				$sql .= "`{$key}`";
				$sql .= ($i==$count-1)? " ":", ";
				$i++;
			}
		}else{
			$sql .= "`{$key}` ";
		}
		$sql .= "FROM `characters` WHERE `guid`=?d";
		$reuslt = is_array($fields)? $this->cDB->selectRow($sql,$this->guid) : $this->cDB->selectCell($sql,$this->guid);

		return $reuslt;
	}

	public function getRace(){
		return $this->cDB->selectCell("SELECT `race` FROM `characters` WHERE `guid`=?d ",$this->guid);
	}

	public function getClass(){
		return $this->cDB->selectCell("SELECT `class` FROM `characters` WHERE `guid`=?d ",$this->guid);
	}
	
	public function getGender(){
		return $this->cDB->selectCell("SELECT `gender` FROM `characters` WHERE `guid`=?d ",$this->guid);
	}

	public function getXP(){
		$xp['cur_xp'] = 0;
		$xp['cur_xp'] = $this->cDB->selectCell("SELECT `xp` FROM `characters` WHERE `guid`=?d",$this->guid);
		$xp['sum_cur_xp'] = $xp['cur_xp'] + $this->wDB->selectCell("SELECT SUM(`xp_for_next_level`) FROM `player_xp_for_level` WHERE `lvl`< ?d",$this->getLevel());

		$max_xp = $this->wDB->selectCell("SELECT SUM(`xp_for_next_level`) FROM `player_xp_for_level`");
		if($xp['sum_cur_xp'] >= $max_xp) // если опыта больше чем максимальный уровень, т.е. у персонажа максимальный уровень
			return array('xp' => 0,'xp_next' => 1);
		
		$data = $this->wDB->select("SELECT * FROM `player_xp_for_level`");
		$sum_xp = 0;
		foreach($data as $row){
			if($sum_xp >= $xp['sum_cur_xp']){
				return array('xp' => $xp['cur_xp'],'xp_next' => $row['xp_for_next_level']);
			}
			$sum_xp += $row['xp_for_next_level'];
		}

		return array('xp' => 0,'xp_next' => 1);
	}

	public function getLevel(){
		return $this->cDB->selectCell("SELECT `level` FROM `characters` WHERE `guid`=?d ",$this->guid);
	}

	public function getHonor(){
		return $this->cDB->selectCell("SELECT `totalHonorPoints` FROM `characters` WHERE `guid`=?d",$this->guid);
	}

	public function getHonorRank($honor=false){
	    if ($honor > 0){
			if($honor <= 500) {$rank = 1;}
			else if ($honor < 1000) {$rank = 2;}
			else if ($honor < 1500) {$rank = 3;}
			else if ($honor < 2500) {$rank = 4;}
			else if ($honor < 4500) {$rank = 5;}
			else if ($honor < 6000) {$rank = 6;}
			else if ($honor < 9500) {$rank = 7;}
			else if ($honor < 14000) {$rank = 8;}
			else if ($honor < 20000) {$rank = 9;}
			else if ($honor < 26000) {$rank = 10;}
			else if ($honor < 36000) {$rank = 11;}
			else if ($honor < 48000) {$rank = 12;}
			else if ($honor < 60000) {$rank = 13;}
			else if ($honor < 75000) {$rank = 14;}
			else {$rank = 15;}
		}else $rank = 0;
		unset($honor);

		return $rank;
	}

	public function getKills(){
		return $this->cDB->selectCell("SELECT `totalKills` FROM `characters` WHERE `guid`=?d",$this->guid);
	}

	public function getArenaPoints(){
		return $this->cDB->selectCell("SELECT `arenaPoints` FROM `characters` WHERE `guid`=?d",$this->guid);
	}

	public function getAchievement(){
		$achieve = $this->cDB->selectCell("SELECT COUNT(`achievement`) FROM `character_achievement` WHERE `guid`=?d",$this->guid);
		if(!$achieve) $achieve = 0;
		
		return $achieve;
	}

	public function getFractionId($race=false){
		$race = ($race)? $race : $this->getRace();

		if(in_array($race,self::$HORDE)) 
			return 1;
		elseif(in_array($race,self::$ALIANCE))
			return 7;
		else
			return "Unknown";
	}

	public function getAllProfessions(){
		$exists = false;

		$this->profs = array();
		$skills = $this->cDB->select("SELECT `skill`,`value`,`max` FROM `character_skills` WHERE `guid`=?d",$this->guid);
		foreach($skills as $row){
			if(in_array($row['skill'],self::$PROFESSIONS)) {
				$this->profs[] = $row;
				$exists = true;
			}
		}

		return $exists;
	}

	public function inGuild(){
		$this->guildId = $this->cDB->selectCell("SELECT `guildid` FROM `guild_member` WHERE `guid`=?d",$this->guid);
		if(!$this->guildId)
 			return false;

		$this->guildNmae = $this->cDB->selectCell("SELECT `name` FROM `guild` WHERE guildid=?d ",$this->guildId);
		//$this->guildRank = $this->cDB->selectCell("SELECT `rname` FROM `guild_rank` WHERE guildid=?d &&  rid=?d",$this->guildID,$this->getFieldData(PLAYER_GUILDRANK));
		return true;
	}

	public function isGuildLeader(){
		if(!$this->inGuild())
			return false;

		$result = $this->cDB->selectCell("SELECT `leaderguid` FROM `guild` WHERE `guildid`=?d && `leaderguid`=?d",$this->guildId,$this->guid);
		return !!$result;
	}

	function __destruct(){
	}
};

?>
