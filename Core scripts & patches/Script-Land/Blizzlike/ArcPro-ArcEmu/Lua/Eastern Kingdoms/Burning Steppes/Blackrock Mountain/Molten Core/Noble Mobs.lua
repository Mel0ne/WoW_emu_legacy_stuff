--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: LUA++, ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

-- Baron Geddon
function BGeddon_OnCombat(Unit,event)
	Unit:CastSpell(19659)
	Unit:RegisterEvent("BGeddon_Inferno", math.random(30000,45000), 0)
	Unit:RegisterEvent("BGeddon_IgniteMana", math.random(22000,35000), 0)
	Unit:RegisterEvent("BGeddon_LivingBomb", math.random(46000,50000), 0)
	Unit:RegisterEvent("BGeddon_Amargeddon", 1000, 0)
end

function BGeddon_OnWipe(Unit,event)
	Unit:RemoveEvents()
end

function BGeddon_OnDied(Unit,event)
	Unit:RemoveEvents()
end

function BGeddon_Inferno(Unit)
	Unit:FullCastSpell(19695)
end

function BGeddon_IgniteMana(Unit)
	Unit:CastSpell(19659)
end

function BGeddon_LivingBombBoom(Unit,event)
	local args=getvars(Unit)
	if(args.livingbombtarget:HasAura(20475) == true) then
		Unit:SpawnCreature(70100, args.livingbombtarget:GetX(), args.livingbombtarget:GetY(), args.livingbombtarget:GetZ(), 90, 14, 0)
		args.livingbombtarget:Unroot()
	end
end

function BGeddon_LivingBomb(Unit)
	setvars(Unit, {livingbombtarget = Unit:GetRandomPlayer(0)})
	local args=getvars(Unit)
	if(args.livingbombtarget ~= nil) then
		Unit:FullCastSpellOnTarget(20475, args.livingbombtarget)
		args.livingbombtarget:Root()
		Unit:RegisterEvent("BGeddon_LivingBombBoom", 7900, 1)
	end
end

function BGeddon_Amargeddon(Unit,event)
	if(Unit:GetHealthPct() == 2) then
		Unit:StopMovement(8000)
		Unit:FullCastSpell(20478)
	end
end

function LivingBomb(Unit, Event)
	Unit:DisableRespawn(1)
	Unit:CastSpell(20476)
	Unit:Despawn(100, 0)
end

RegisterUnitEvent(70100, 18, "LivingBomb")
RegisterUnitEvent(12056, 1, "BGeddon_OnCombat")
RegisterUnitEvent(12056, 2, "BGeddon_OnWipe")
RegisterUnitEvent(12056, 4, "BGeddon_OnDied")

-- Garr
function Garr_OnCombat(Unit,event)
	setvars(Unit, {Garr = Unit})
	local tbl = Unit:GetInRangeFriends()
	local mt = Unit:GetClosestPlayer()
	for k,v in pairs(tbl) do
		if(v:GetEntry() == 12099) then
			if(v:IsCreatureMoving() == false) then
				v:ModifyWalkSpeed(8)
				v:MoveTo(mt:GetX(), mt:GetY(), mt:GetZ(), mt:GetO())
				Unit:RegisterEvent("Garr_Shackles", 21000, 0)
				Unit:RegisterEvent("Garr_AntiMagicPulse", 10000, 0)
			end
		end
	end
end

function Garr_OnWipe(Unit,event)
	if(Unit:IsAlive() == true) then
		Unit:SpawnCreature(12099, 691.497, -508.682, -214.613, 4.97918, 14, 0)
		Unit:SpawnCreature(12099, 698.169, -504.932, -214.626, 5.03141, 14, 0)
		Unit:SpawnCreature(12099, 700.19, -497.552, -214.396, 5.0165, 14, 0)
		Unit:SpawnCreature(12099, 696.475, -490.809, -213.817, 4.74342, 14, 0)
		Unit:SpawnCreature(12099, 689.116, -488.824, -213.552, 4.77706, 14, 0)
		Unit:SpawnCreature(12099, 682.444, -492.575, -213.484, 4.95256, 14, 0)
		Unit:SpawnCreature(12099, 680.378, -499.944, -213.925, 4.92875, 14, 0)
		Unit:SpawnCreature(12099, 684.128, -504.616, -214.439, 5.0414, 14, 0)
		Unit:RemoveEvents()
	else
		Unit:RemoveEvents()
	end
end

function Garr_OnDied(Unit,event)
	Unit:RemoveEvents()
end

function Garr_Shackles(Unit,event)
	Unit:CastSpell(19496)
end

function Garr_AntiMagicPulse(Unit,event)
	Unit:CastSpell(19492)
end

RegisterUnitEvent(12057,1,"Garr_OnCombat")
RegisterUnitEvent(12057,2,"Garr_OnWipe")
RegisterUnitEvent(12057,4,"Garr_OnDied")

--FIRESWORM
function Firesworm_OnCombat(Unit,event)
	Unit:RegisterEvent("Separation_Anxiety", 2000, 0)
	local tbl = Unit:GetInRangeFriends()
	local mt = Unit:GetClosestPlayer()
	for k,v in pairs(tbl) do
		if(v:GetEntry() == 12099) then
			if(v:IsCreatureMoving() == false) then
				v:ModifyWalkSpeed(8)
				v:MoveTo(mt:GetX(), mt:GetY(), mt:GetZ(), mt:GetO())
			end
		end
	end
	for k,v in pairs(tbl) do
		if(v:GetEntry() == 12057) then
			if(v:IsCreatureMoving() == false) then
				v:ModifyWalkSpeed(8)
				v:MoveTo(mt:GetX(), mt:GetY(), mt:GetZ(), mt:GetO())
			end
		end
	end
end

function Firesworm_OnWipe(Unit,event)
	Unit:RemoveEvents()
	Unit:Despawn(1000, 0)
end

function Firesworm_OnDied(Unit,event)
	Unit:RemoveEvents()
	Unit:CastSpell(19497)
end

function Separation_Anxiety(Unit,event)
	local args = getvars(Unit)
	if(args.Garr ~= nil) then
		local dist = Unit:GetDistance(args.Garr)
		if(dist >= 2500) then
			Unit:CastSpell(23492)
		end
	end
end

RegisterUnitEvent(12099,1,"Firesworm_OnCombat")
RegisterUnitEvent(12099,2,"Firesworm_OnWipe")
RegisterUnitEvent(12099,4,"Firesworm_OnDied")

-- Gehennas
math.randomseed(os.time())

function Gehennas_OnCombat(Unit,event)
	Unit:RegisterEvent("GehennasSpells", 13000, 0)
	local tbl = Unit:GetInRangeFriends()
	local mt = Unit:GetClosestPlayer()
	for k,v in pairs(tbl) do
		if(v:GetEntry() == 11664) then
			v:ModifyWalkSpeed(8)
			v:MoveTo(mt:GetX(), mt:GetY(), mt:GetZ(), mt:GetO())
		end
	end
end

function Gehennas_OnDied(Unit,event)
	Unit:RemoveEvents()
end

function Gehennas_OnWipe(Unit,event)
	if(Unit:IsAlive() == true) then
		Unit:SpawnCreature(11664, 905.372314, -542.778442, -202.930298, 3.989631)
		Unit:SpawnCreature(11664, 890.958008, -539.140015, -203.050995, 5.445430)
		Unit:RemoveEvents()
	else
		Unit:RemoveEvents()
	end
end
	
function GehennasSpells(Unit,event)
	local rand = math.random(1,3)
	local plr = Unit:GetRandomPlayer(0)
	if((rand == 1) and (Unit:GetInRangePlayersCount() > 1)) then
		if(Unit:GetRandomPlayer(0) ~= Unit:GetMainTank()) then
			Unit:FullCastSpellOnTarget(19729, Unit:GetRandomPlayer(0))
		else
			repeat
			until Unit:GetRandomPlayer(0) ~= Unit:GetMainTank()
			Unit:FullCastSpellOnTarget(19729, Unit:GetRandomPlayer(0))
		end
	elseif(rand == 2) and (plr ~= nil) then
		Unit:CastSpellAoF(plr:GetX(),plr:GetY(),plr:GetZ(),19717)
	elseif(rand == 3) then
		Unit:CastSpell(19716)
	end
end

RegisterUnitEvent(12259,1,"Gehennas_OnCombat")
RegisterUnitEvent(12259,2,"Gehennas_OnWipe")
RegisterUnitEvent(12259,4,"Gehennas_OnDied")

function GehennasElites_OnCombat(Unit,event)
		Unit:RegisterEvent("GehennasElitesSpells", math.random(12000, 18000), 0)
		local tbl = Unit:GetInRangeFriends()
		local mt = Unit:GetClosestPlayer()
		for k,v in pairs(tbl) do
			if(v:GetEntry() == 11664) then
				if(v:IsCreatureMoving() == false) then
					v:ModifyWalkSpeed(8)
					v:MoveTo(mt:GetX(), mt:GetY(), mt:GetZ(), mt:GetO())
				end
			end
		end
		for k,v in pairs(tbl) do
			if(v:GetEntry() == 12259) then
				if(v:IsCreatureMoving() == false) then
					v:ModifyWalkSpeed(8)
					v:MoveTo(mt:GetX(), mt:GetY(), mt:GetZ(), mt:GetO())
				end
			end
		end
	Unit:RegisterEvent("GehennasElitesSpells", math.random(12000, 18000), 0)
end

function GehennasElites_OnWipe(Unit,event)
	Unit:RemoveEvents()
	Unit:Despawn(1000, 0)
end

function GehennasElites_OnDied(Unit,event)
	Unit:RemoveEvents()
end

function GehennasElitesSpells(Unit,event)
	local rand = math.random(1,3)
	if(rand == 1) then
		Unit:CastSpell(20277)
	elseif(rand == 2) and (tank ~= nil) then
		Unit:FullCastSpellOnTarget(24317, Unit:GetMainTank())
	elseif(rand == 3) and (tank ~= nil) then
		Unit:FullCastSpellOnTarget(19730, Unit:GetMainTank())
	end
end
	
RegisterUnitEvent(11664, 1, "GehennasElites_OnCombat")
RegisterUnitEvent(11664, 2, "GehennasElites_OnWipe")
RegisterUnitEvent(11664, 4, "GehennasElites_OnDied")

-- Golemagg the Incinerator
function Golemagg_OnCombat(Unit,event)
	setvars(Unit,{Golemagg = Unit, Ragers= {}})
	Unit:RegisterEvent("Golemagg_Trust", 30000, 0)
	Unit:RegisterEvent("Golemagg_PyroBlast", 15000, 0)
	Unit:RegisterEvent("Golemagg_EarthQuake", 1000, 1)
	Unit:RegisterEvent("Golemagg_AttractRager", 1000, 1)
end

function Golemagg_Trust(Unit,event)
	local args = getvars(Unit)
	for k,v in pairs(args.Ragers) do
		if(v ~= nil) then
			v:FullCastSpell(20553)
		end
	end
end

function Golemagg_PyroBlast(Unit,event)
	if(Unit:GetRandomPlayer(0) ~= nil) then
		Unit:FullCastSpellOnTarget(20228, Unit:GetRandomPlayer(0))
	end
end

function Golemagg_EarthQuake(Unit,event)
	if(Unit:GetHealthPct() <= 10) then
		Unit:CastSpell(19798)
	else
		Unit:RegisterEvent("Golemagg_EarthQuake", 500, 1)
	end
end

function Golemagg_AttractRager(Unit,event)
	if(Unit:GetHealthPct() <= 10) then
		local args = getvars(Unit)
		local tbl = Unit:GetInRangePlayers()
		for k,playerUnit in pairs(tbl) do
			for _,RagersUnit in pairs(args.Ragers) do
				if(playerUnit:GetDistance(RagersUnit) <= 20) then
					RagersUnit:ModThreat(playerUnit, 5000)
				end
			end
		end
	end
end

function Golemagg_OnDied(Unit,event)
	Unit:RemoveEvents()
	local args = getvars(Unit)
	if(args.Ragers ~= nil) then
		for k,v in pairs(args.Ragers) do
			v:Kill(v)
		end
	end
end

function Golemagg_OnWipe(Unit,event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(11988, 1, "Golemagg_OnCombat")
RegisterUnitEvent(11988, 2, "Golemagg_OnWipe")
RegisterUnitEvent(11988, 4, "Golemagg_OnDied")

function CoreRager_OnCombat(Unit,event)
	local args = getvars(Unit)
	table.insert(args.Ragers,Unit)
	Unit:RegisterEvent("CoreRager_Mangle", 10000, 0)
	Unit:RegisterEvent("CoreRager_RefuseDeath", 5000, 1)
	setvars(Unit, args); -- still need to write the changes back
end

function CoreRager_OnWipe(Unit,event)
	Unit:RemoveEvents()
end

function CoreRager_OnDied(Unit,event)
	Unit:RemoveEvents()
end

function CoreRager_Mangle(Unit,event)
	if(Unit:GetMainTank() ~= nil) then
		Unit:CastSpellOnTarget(19820, Unit:GetMainTank())
	end
end

function CoreRager_RefuseDeath(Unit,event)
	if(Unit:GetHealthPct() <= 50) then
		local args = getvars(Unit)
		if(args.Golemagg:IsAlive() == true) then
			Unit:Heal(Unit,0,Unit:GetUInt32Value(UNIT_FIELD_MAXHEALTH))
			Unit:SendChatMessage(16, 0, Unit:GetName().."refuses to die while it's master is in trouble.")
		end
	else
		Unit:RegisterEvent("CoreRager_RefuseDeath", 5000, 1)
	end
end

RegisterUnitEvent(11672, 1, "CoreRager_OnCombat")
RegisterUnitEvent(11672, 2, "CoreRager_OnWipe")
RegisterUnitEvent(11672, 4, "CoreRager_OnDied")

-- Lucifron
function Lucifron_OnCombat(Unit,event)
	Unit:RegisterEvent("LucifronSpells", math.random(18000,21000), 0)
	Unit:RegisterEvent("ShadowShock", 7000, 0)
end

function Lucifron_OnDeath(Unit,event)
	Unit:RemoveEvents()
end

function Lucifron_OnWipe(Unit,event)
	Unit:RemoveEvents()
end

function LucifronSpells(Unit,event)
	if(math.random(0,1) < 0.5) then
		Unit:CastSpell(19702)
	else
		Unit:CastSpell(19703)
	end
end

function ShadowShock(Unit,event)
	Unit:FullCastSpellOnTarget(19460, Unit:GetRandomPlayer(0))
end

RegisterUnitEvent(12118, 1, "Lucifron_OnCombat")
RegisterUnitEvent(12118, 4, "Lucifron_OnDeath")
RegisterUnitEvent(12118, 2, "Lucifron_OnWipe")

function LucifronProtector_OnCombat(Unit,event)
	Unit:RegisterEvent("LucifronProtector_Cleave", math.random(12000,16000), 1)
end

function LucifronProtector_Cleave(Unit,event)
	Unit:FullCastSpellOnTarget(39047, Unit:GetMainTank())
	Unit:RegisterEvent("LucifronProtector_Cleave", math.random(12000,16000), 0)
end

function LucifronProtector_OnDied(Unit,event)
	Unit:RemoveEvents()
end

function LucifronProtector_OnWipe(Unit,event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(12119, 1, "LucifronProtector_OnCombat")
RegisterUnitEvent(12119, 2, "LucifronProtector_OnWipe")
RegisterUnitEvent(12119, 4, "LucifronProtector_OnDied")

-- Magmadar
function MagMadar_OnCombat(Unit, Event)
	Unit:RegisterEvent("MagMadarSpells", math.random(7000,10000), 0)
	Unit:RegisterEvent("MagMadarPanic", 30000, 0)
end

function MagMadar_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

function MagMadar_OnWipe(Unit, Event)
	Unit:RemoveEvents()
end

function MagMadarSpells(Unit, Event)
	local rand = math.random(1,3)
	local plr = Unit:GetRandomPlayer(0)
	if(rand == 1) then
		Unit:FullCastSpell(19451)
	elseif(rand == 2) then
		Unit:FullCastSpell(19272)
	elseif((rand == 3) and (plr ~= nil)) then
		Unit:SpawnGameObject(177704, plr:GetX(), plr:GetY(), plr:GetZ(), plr:GetO(),10000)
	end
end

RegisterUnitEvent(11982, 1, "MagMadar_OnCombat")
RegisterUnitEvent(11982, 2, "MagMadar_OnWipe")
RegisterUnitEvent(11982, 4, "MagMadar_OnDied")

function LavaBombActivate(Unit, event, pMiscUnit)
	pMiscUnit:CastSpellOnTarget(19428, pMiscUnit)
end

function MagMadarPanic(Unit)
    local tbl = Unit:GetInRangePlayers()
	for k,v in pairs(tbl) do
		if(Unit:GetDistance(v) <= 30) then
			Unit:FullCastSpellOnTarget(19408, v)
		end
	end
end

RegisterGameObjectEvent(177704, 4, "LavaBombActivate")

-- Majordomo Executus
math.randomseed(os.time());

function Executus_OnCombat(Unit,event, pMisc)
	setvars(Unit,{Executus = Unit, Executus_Guards = {},DeadGuardCount = 0})
	local door = Unit:GetGameObjectNearestCoords(735.972412,-1177.861572,-119.109833,177000)
	if(door ~= nil) then
		door:SetUInt32Value(GAMEOBJECT_STATE, 0)
		door:SetUInt32Value(GAMEOBJECT_FLAGS,33)
	end
	local tbl = Unit:GetInRangeFriends()
	local args = getvars(Unit)
	for k,v in pairs(tbl) do
		if((v:GetEntry() == 11663) or (v:GetEntry() == 11664)) then
			table.insert(args.Executus_Guards,v)
			v:AttackReaction(pMisc,1,0)
		end
	end
	Unit:RegisterEvent("Executus_AoR", 30000, 1)
	Unit:RegisterEvent("Executus_Teleport", 15000, 1)
	Unit:RegisterEvent("Executus_BlastWave", 10000, 1)
	Unit:RegisterEvent("Executus_Shields", 15000, 1)
	Unit:RegsiterEvent("Executus_SubmitCheck", 5000, 1)
end

function Executus_SubmitCheck(Unit,event)
	local args = getvars(Unit)
	local plr = Unit:GetRandomPlayer(0)
	if(args.DeadGuardCount == 9) then
		Unit:SendChatMessage(16, 0, "Majordomo Executus submits.")
		Unit:SetFaction(plr:GetFaction())
		Unit:Root()
		Unit:SetCombatCapable(1)
		Unit:WipeThreatList()
		Unit:SpawnGameObject(179703,Unit:GetX(),Unit:GetY(),Unit:GetZ(),Unit:GetO(),18000)
		Unit:Despawn(10000, 0)
	else
		Unit:RegisterEvent("Executus_SubmitCheck", 5000, 1)
	end
end
			
function Executus_OnWipe(Unit)
	Unit:RemoveEvents()
end

function Executus_OnDied(Unit)
	Unit:RemoveEvents()
end

function Executus_AoR(Unit,event)
	Unit:FullCastSpell(20620)
	Unit:RegisterEvent("Executus_AoR",30000, 1)
end

function  Executus_Teleport(Unit,event)
	local plr  = Unit:GetRandomPlayer(0)
	if((plr ~= nil) and (plr:IsAlive() == true)) then
		Unit:FullCastSpellOnTarget(20534,plr)
		plr:Teleport(Unit:GetMapId(),735.972412,-1177.861572,-119.109833)
	end
	Unit:RegisterEvent("Executus_Teleport",15000, 1)
end

function Executus_BlastWave(Unit,event)
	if(Unit:GetInRangePlayersCount() ~= nil) then
		Unit:FullCastSpell(20229)
	end
	Unit:RegisterEvent("Executus_BlastWave", 10000, 1)
end

function Executus_Shields(Unit,event)
	local args = getvars(Unit)
	if(math.random(0,1) > 0.5) then
		for k,v in pairs(args.Executus_Guards) do
			Unit:FullCastSpellOnTarget(20619, v)
		end
	else
		for k,v in pairs(args.Executus_Guards)  do
			v:FullCastSpellOnTarget(21075, v)
		end
	end
	Unit:RegisterEvent("Executus_Shields", 16000, 1)
end

RegisterUnitEvent(12018, 1, "Executus_OnCombat")
RegisterUnitEvent(12018, 2, "Executus_OnWipe")
RegisterUnitEvent(12018, 4, "Executus_OnDied")
RegisterUnitEvent(12018, 21, "Executus_SubmitCheck")

function FlameHealer_OnCombat(Unit,event)
	local tbl = Unit:GetInRangeFriends()
	for k,v in pairs(tbl) do
		if(v:GetEntry() == 12018) then
			Unit:RegisterEvent("FlameHealer_ShadowBolt", math.random(7000, 8000), 1)
			Unit:RegisterEvent("FlameHealer_GreaterHeal", math.random(10000, 12000), 1)
			break
		end
	end
end

function FlameHealer_OnWipe(Unit,event)
	Unit:RemoveEvents()
end

function FlameHealer_OnDied(Unit,event)
	local changed = false;
	Unit:RemoveEvents()
	local args = getvars(Unit)
	local tbl = Unit:GetInRangeFriends()
	for k,v in pairs(tbl) do
		if(v:GetEntry() == 12018) then
		for k,v in pairs(args.Executus_Guards) do
				if (v == Unit) then
					table.remove(args.Executus_Guards, k)
					changed = true;
				end
			end
		end
	end
	if(changed == true) then 
		setvars(Unit,args); 
	end
end

function FlameHealer_ShadowBolt(Unit,event)
	if(Unit:GetRandomPlayer(0) ~= nil) and (Unit:GetRandomPlayer(0):IsAlive() == true) then
		Unit:StopMovement(500)
		Unit:FullCastSpellOnTarget(21077, Unit:GetRandomPlayer(0))
	end
	Unit:RegisterEvent("FlameHealer_ShadowBolt",  math.random(7000, 8000), 1)
end

function FlameHealer_GreaterHeal(Unit,event)
	local args = getvars(Unit)
	if(args.Executus_Guards ~= nil) then
		local tblend = table.getn(args.Executus_Guards)
		Unit:StopMovement(2500)
		Unit:FullCastSpellOnTarget(29564, args.Executus_Guards[math.random(1, tblend)])
	end
	Unit:RegisterEvent("FlameHealer_GreaterHeal", math.random(10000, 12000), 1)
end

RegisterUnitEvent(11663, 1, "FlameHealer_OnCombat")
RegisterUnitEvent(11663, 2, "FlameHealer_OnWipe")
RegisterUnitEvent(11663, 4, "FlameHealer_OnDied")

function FlameElite_OnCombat(Unit,event)
	local tbl = Unit:GetInRangeFriends()
	for k,v in pairs(tbl) do
		if(v:GetEntry() == 12018) then
			Unit:RegisterEvent("ExecutusFlameElite_Spells", 10000, 0)
			break
		end
	end
end

function FlameElite_OnWipe(Unit,event)
	Unit:RemoveEvents()
end

function FlameElite_OnDead(Unit,event)
	local changed = false;
	Unit:RemoveEvents()
	local args = getvars(Unit)
	local tbl = Unit:GetInRangeFriends()
	for k,v in pairs(tbl) do
		if(v:GetEntry() == 12018) then
			for k,v in pairs(args.Executus_Guards) do
				if(v == Unit) then
					table.remove(args.Executus_Guards,k)
					changed = true;
				end
			end
		end
	end
	if(changed == true) then 
		setvars(Unit,args); 
	end
end

function ExecutusFlameElite_Spells(Unit,event)
	if((Unit:GetRandomPlayer(0) ~= nil) and (Unit:GetRandomPlayer(0):IsAlive() == true)) then
		if(math.random(0,1) > 0.5) then
			Unit:FullCastSpellOnTarget(20623, Unit:GetRandomPlayer(0))
		else
			Unit:FullCastSpell(20229)
		end
	end
end

RegisterUnitEvent(11664, 1, "FlameElite_OnCombat")
RegisterUnitEvent(11664, 2, "FlameElite_OnWipe")
RegisterUnitEvent(11664, 4, "FlameElite_OnDead")

-- Ragnaros
function Agonizing_Flames(Unit, Event)
	Unit:FullCastSpellOnTarget(40932, Unit:GetRandomPlayer(0))
	Unit:FullCastSpellOnTarget(40932, Unit:GetRandomPlayer(0))
	Unit:FullCastSpellOnTarget(40932, Unit:GetRandomPlayer(0))
end

function Agonizing_Armor(Unit, Event)
local ArmorChoice = math.random(1,2)
	if(ArmorChoice == 1) then
		Unit:SendChatMessage(12, 0, "I will make you melt...")
		Unit:FullCastSpellOnTarget(36836, Unit:GetMainTank())
	elseif(ArmorChoice == 2) then
		Unit:SendChatMessage(12, 0, "Feel the Armor disappear!")
		Unit:FullCastSpellOnTarget(36836, Unit:GetMainTank())
	end
end

function Fire_Cone(Unit, Event)
	Unit:FullCastSpellOnTarget(36876, Unit:GetClosestPlayer())
end

function Fire_Debuff(Unit, Event)
	Unit:FullCastSpellOnTarget(38010, Unit:GetClosestPlayer())
	Unit:FullCastSpellOnTarget(38010, Unit:GetClosestPlayer())
	Unit:FullCastSpellOnTarget(38010, Unit:GetClosestPlayer())
end

function Meteor_Slash(Unit, Event)
	Unit:FullCastSpellOnTarget(45150, Unit:GetMainTank())
end

function Combat_Talk(Unit, Event)
local TalkChoice = math.random(1,10)
	if(TalkChoice == 1) then
		Unit:SendChatMessage(12, 0, "I've waited for this chance to strike!")
	elseif(TalkChoice == 2) then
		Unit:SendChatMessage(12, 0, "You can't defeat the god of flames and fire!")
	elseif(TalkChoice == 3) then
		Unit:SendChatMessage(12, 0, "I will never let you win!")
	elseif(TalkChoice == 4) then
		Unit:SendChatMessage(12, 0, "Feel the power of Ragnaros!")
	elseif(TalkChoice == 5) then
		Unit:SendChatMessage(12, 0, "My fires will consume you..")
	elseif(TalkChoice == 6) then
		Unit:SendChatMessage(12, 0, "By Fire be purged!")
	elseif(TalkChoice == 7) then
		Unit:SendChatMessage(12, 0, "Let my Fury rain upon you!")
	elseif(TalkChoice == 8) then
		Unit:SendChatMessage(12, 0, "Ha Ha Ha!")
	elseif(TalkChoice == 9) then
		Unit:SendChatMessage(12, 0, "You are no match for me..")
	elseif(TalkChoice == 10) then
		Unit:SendChatMessage(12, 0, "I will win this battle!")
	end
end

function Rag_OnCombat(Unit, Event)
local CombatChoice = math.random(1,3)
	Unit:RegisterEvent("Combat_Talk", 20000, 0)
	Unit:RegisterEvent("Agonizing_Flames", 20000, 0)
	Unit:RegisterEvent("Agonizing_Armor", 28000, 0)
	Unit:RegisterEvent("Fire_Cone", 28000, 0)
	Unit:RegisterEvent("Fire_Debuff", 25000, 0)
	Unit:RegisterEvent("Meteor_Slash", 60000, 0)
	if(CombatChoice == 1) then
		Unit:SendChatMessage(12, 0, "I've returned stronger than ever before! Ha Ha Ha!")
	elseif(CombatChoice == 2) then
		Unit:SendChatMessage(12, 0, "You should have sealed me while you had the chance!")
	elseif(CombatChoice == 3) then
		Unit:SendChatMessage(12, 0, "Who dares to conquer me?!")
	end
end

function Rag_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Rag_OnKilledTarget(Unit, Event)
local KillTargChoice = math.random(1,3)
	if(KillTargChoice == 1) then
		Unit:SendChatMessage(12, 0, "Feel Eternal Agony!")
	elseif(KillTargChoice == 2) then
		Unit:SendChatMessage(12, 0, "Your body is now made to ashes..")
	elseif(KillTargChoice == 3) then
		Unit:SendChatMessage(12, 0, "Revenge is mine!")
	end
end

function Rag_OnDied(Unit, Event)
	Unit:SendChatMessage(12, 0, "No... NOOO! You will pay for this another time mortals! I will RETUUUUUURN!")
	Unit:RemoveEvents()
end

RegisterUnitEvent(11502, 1, "Rag_OnCombat")
RegisterUnitEvent(11502, 2, "Rag_OnLeaveCombat")
RegisterUnitEvent(11502, 3, "Rag_OnKilledTarget")
RegisterUnitEvent(11502, 4, "Rag_OnDied")

-- Shazzrah
function Shazzrah_OnCombat(Unit,event)
	--Unit:RegisterEvent("Shazzrah_Blink", math.random(43000,45000), 0)
	Unit:RegisterEvent("Shazzrah_CounterSpell", math.random(20000,25000), 0)
	Unit:RegisterEvent("Shazzrah_ArcaneExplosion", math.random(9000,12000),0)
	Unit:RegisterEvent("Shazzrah_MagicGrounding", math.random(20000,30000), 0)
	Unit:RegisterEvent("Shazzrah_Curse", 30000, 0)
end

function Shazzrah_OnWipe(Unit,event)
	Unit:RemoveEvents()
end

function Shazzrah_OnDied(Unit,event)
	Unit:RemoveEvents()
end

function Shazzrah_ArcaneExplosion(Unit,event)
	Unit:FullCastSpell(19712)
end

function Shazzrah_MagicGrounding(Unit,event)
	Unit:CastSpell(19714)
end

function Shazzrah_Curse(Unit,event)
	local tbl = Unit:GetInRangePlayers()
	for k,v in pairs(tbl) do
		if(Unit:GetDistance(v) < 35) then
			Unit:FullCastSpellOnTarget(19713, v)
		end
	end
end

function Shazzrah_CounterSpell(Unit,event)
	Unit:CastSpell(19715)
end

--[[function Shazzrah_Blink(Unit,event)
	local plr = Unit:GetRandomPlayer(0)
	--Unit:SetFacing(plr)
	Unit:CastSpell(21655)
	Unit:Teleport(Unit:GetMapId(), plr:GetX(), plr:GetY(), plr:GetZ())
	Unit:WipeThreatList()
	Unit:ModThreat(Unit:GetRandomPlayer(0), 1000)
	Shazzrah_ArcaneExplosion(Unit,event)
end]]

RegisterUnitEvent(12264, 1, "Shazzrah_OnCombat")
RegisterUnitEvent(12264, 2, "Shazzrah_OnWipe")
RegisterUnitEvent(12264, 4, "Shazzrah_OnDied")

-- Sulfuron Harbinger
function Sulfuron_OnCombat(Unit,event)
	setvars(Unit,{Priests = {}})
	Unit:RegisterEvent("Sulfuron_Spells", 10000, 0)
	Unit:RegisterEvent("Sulfuron_Inspire", 15000, 0)
end

function Sulfuron_OnWipe(Unit,event)
	Unit:RemoveEvents()
	--setvars(Unit,true)
end

function Sulfuron_OnDied(Unit,event)
	Unit:RemoveEvents()
	--setvars(Unit,true)
end

function Sulfuron_Spells(Unit)
	local rand = math.random(1,3)
	if(rand == 1) then
		Unit:CastSpell(19780)
	elseif(rand == 2) then
		Unit:CastSpell(19978)
	elseif(rand == 3)  and (Unit:GetRandomPlayer(0) ~= nil) then
		Unit:CastSpellOnTargeT(19781, Unit:GetRandomPlayer(0))
	end
end

function Sulfuron_Inspire(Unit)
	local args = getvars(Unit)
	table.insert(args.Priests,Unit)
	for k,v in pairs(args.Priests) do
		if(v ~= nil) then
			Unit:CastSpellOnTarget(19779, v)
		end
	end
end

RegisterUnitEvent(12098, 1, "Sulfuron_OnCombat")
RegisterUnitEvent(12098, 2, "Sulfuron_OnWipe")
RegisterUnitEvent(12098, 4, "Sulfuron_OnDied")

function Sulfuron_PriestCombat(Unit,event)
	local args = getvars(Unit)
	table.insert(args.Priests,Unit)
	Unit:RegisterEvent("Sulfuron_PriestSpells", 10000, 0)
	Unit:RegisterEvent("Sulfuron_PriestImmunityCheck", 5000, 0)
	Unit:RegisterEvent("Sulfuron_PriestHeal", 15000, 0)
	setvars(Unit, args);
end

function Sulfuron_PriestWipe(Unit,event)
	Unit:RemoveEvents()
end

function Sulfuron_PriestDied(Unit,event)
	Unit:RemoveEvents()
end

function Sulfuron_PriestSpells(Unit,event)
	local rand = math.random(1,2)
	if((rand == 1) and (Unit:GetRandomPlayer(0) ~= nil)) then
		Unit:CastSpell(23952, Unit:GetRandomPlayer(0))
	elseif((rand == 2) and (Unit:GetRandomPlayer(0) ~= nil)) then
		Unit:CastSpell(20294, Unit:GetRandomPlayer(0))
	end
end

function Sulfuron_PriestImmunityCheck(Unit,event)
	if((Unit:HasAura(1714)== true) or (Unit:HasAura(11719) == true)) then
		Unit:RemoveAura(1714)
		Unit:RemoveAura(11719)
	end
	Unit:CastSpell(6513)
end

function Sulfuron_PriestHeal(Unit)
	local tbl = { Unit:GetInRangeFriends() }
	for k,v in pairs(tbl) do
		if(math.random(0,1) < 0.5) then
			Unit:FullCastSpellOnTarget(36144, v)
		end
		break
	end
end

RegisterUnitEvent(11662, 1, "Sulfuron_PriestCombat")
RegisterUnitEvent(11662, 2, "Sulfuron_PriestWipe")
RegisterUnitEvent(11662, 4, "Sulfuron_PriestDied")