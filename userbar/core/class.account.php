<?php
class account
{
	public function __construct($config){
		include_once("core/dbsimple/Generic.php");

		$this->rDB = DbSimple_Generic::connect($config['rdb']);
		$this->rDB->setErrorHandler("databaseErrorHandler");
		$this->rDB->query("SET NAMES ? ",$config['db_encoding']);
	}

	public function getGMAccess(){
		if(@!$this->acctid)
			if($this->isValidAccount())
				return false;
	
		return $this->rDB->selectCell("SELECT `gmlevel` FROM `account_access` WHERE `id`=?d ",$this->acctid);
	}
	
	public function getRealmName($realmID=false,$numchars=false){
		return $this->rDB->selectCell("
			SELECT 
				`name` 
			FROM 
				`realmlist` r
					LEFT JOIN `realmcharacters` rc ON r.id=rc.realmid
			WHERE 
				rc.acctid=?d 
				{ && r.id = ?d }
				{ && rc.numchars > ?d }
			ORDER BY r.id ASC
			",$this->acctid,($realmID)? $realmID : DBSIMPLE_SKIP,($numchars)? 0 : DBSIMPLE_SKIP);
	}

}

?>
