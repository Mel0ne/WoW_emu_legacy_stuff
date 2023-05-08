--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

print ("Failed: Blackrockmountain - Blackrock Spire - Goraluk Anvilcrack")
print ("Failed: Blackrockmountain - Blackrock Spire - Jed Runewatcher")
print ("Failed: Blackrockmountain - Blackrock Spire - Lord Valthalak")
print ("Failed: Blackrockmountain - Blackrock Spire - Solakar Flamewreath")

-- General Drakkisath
function Drakkisath_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Cleave", 7000, 0)
	pUnit:RegisterEvent("Conflagration", 14000, 0)
	pUnit:RegisterEvent("Flamestrike", 21000, 0)
	pUnit:RegisterEvent("Pierce_Armor", 28000, 0)
	pUnit:RegisterEvent("Rage", 35000, 0)
end

function Cleave(pUnit, Event)
	pUnit:CastSpellOnTarget(15284)
end

function Conflagration(pUnit, Event)
	pUnit:CastSpellOnTarget(16805)
end

function Flamestrike(pUnit, Event)
	pUnit:FullCastSpellOnTarget(16419)
end

function Pierce_Armor(pUnit, Event)
	pUnit:CastSpellOnTarget(6016, pUnit:GetRandomPlayer())
end

function Rage(pUnit, Event)
	pUnit:CastSpell(16789)
end

function Drakkisath_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Drakkisath_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(10584, 1, "Drakkisath_OnCombat")
RegisterUnitEvent(10584, 2, "Drakkisath_OnLeaveCombat")
RegisterUnitEvent(10584, 4, "Drakkisath_OnDeath")

-- Pyroguard Emberseer
math.randomseed(os.time());

local blackhand = 10316
local pyroguard = 9816
local encage_pyro = 15281
local encaged_pyro = 15282
local encage = 16045
local altar = 175706
local grow_emberseer = 16049
local emberseer_complete = 16052
local emberseer_lightning = 16078
local door1 = 175244
local door2 = 175153

function Pyroguard_Event(Unit, Event)
        local go =  Unit:GetGameObjectNearestCoords(114.407143, -258.893585, 91.548134, door2)
		if(go ~= nil) then
            go:SetUInt32Value(GAMEOBJECT_FLAGS, GAMEOBJECT_UNCLICKABLE)
        end
        local pyro = Unit:GetCreatureNearestCoords(144.401993, -258.036987, 96.323303, pyroguard)
        if(pyro ~= nil) then
                setvars(pyro,{warlocks = {},plrs = {}})
                local tbl = pyro:GetInRangeFriends()
                local args = getvars(pyro)
                --for i = 1,3 do Create blank entries
                        --args.plrs[i]= 1
                --end
                for k,v in pairs(tbl) do
            if(v~= nil) then
                if(v:GetEntry() == blackhand) then
					table.insert(args.warlocks, v)
                    v:SetUInt32Value(UNIT_FIELD_CHANNEL_OBJECT, pyro:GetGUID())
                    v:SetUInt32Value(UNIT_CHANNEL_SPELL, encage_pyro)
                    v:Root()
                    v:SetCombatCapable(1)
                end
            end
        end
        pyro:SetCombatCapable(1)
        pyro:Root()
        pyro:SetUInt32Value(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_2)
        pyro:SetUInt32Value(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE)
        pyro:CastSpell(encaged_pyro)
    end
end

function Altar_Activate(Unit, Event, pMisc) 
    local pyro = Unit:GetCreatureNearestCoords(144.401993, -258.036987, 96.323303, pyroguard)
    local args = getvars(pyro)
    table.insert(args.plrs, pMisc)
    pMisc:SetUInt32Value(UNIT_FIELD_CHANNEL_OBJECT, Unit:GetGUID())
    pMisc:SetUInt32Value(UNIT_CHANNEL_SPELL, 16532)
    if((table.getn(args.plrs) ~= nil) and (table.getn(args.plrs) >= 1)) then
		for k,v in pairs(args.warlocks) do
			v:SetUInt32Value(UNIT_FIELD_CHANNEL_OBJECT, 0)-- stop channeling
			v:SetUInt32Value(UNIT_CHANNEL_SPELL, 0)
			v:Unroot()
			v:SetCombatCapable(0)
			v:RemoveFlag(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_2)
			v:AttackReaction(args.plrs[math.random(1, table.getn(args.plrs))], 1, 0)
		end
		local pyro = Unit:GetCreatureNearestCoords(144.401993, -258.036987, 96.323303, pyroguard)
		if(pyro ~= nil) then
			pyro:RemoveAura(encaged_pyro)
		end
	end
    Unit:RemoveFromWorld()
    pMisc:SetUInt32Value(UNIT_FIELD_CHANNEL_OBJECT, 0)
    pMisc:SetUInt32Value(UNIT_CHANNEL_SPELL, 0)
end

function blackhandwarlock_oncombat(Unit, Event)
    Unit:SetUInt32Value(UNIT_FIELD_FLAGS, 0)
    Unit:RegisterEvent("blackhandwarlock_spells", 10000, 1)
end

function blackhandwarlock_spells(Unit, Event)
	local rand = math.random(1,2)
	local tank = Unit:GetMainTank()
    if(Unit:GetCurrentSpellId() ~= nil) then
        if((rand == 1) and (tank ~= nil)) then
            Unit:FullCastSpellOnTarget(15580, tank)
            Unit:RegisterEvent("blackhandwarlock_spells", 5000, 1)
        elseif(rand == 2) then
            if(math.random(1,3) == 1) then
                Unit:FullCastSpell(encage,tank)
                Unit:RegisterEvent("blackhandwarlock_spells", 10000, 1)
            end
        end
    end
end

function blackhandwarlock_ondeath(Unit, Event)
        Unit:RemoveEvents()
        local args = getvars(Unit)
        for k,v in pairs(args.warlocks) do
        if(v == Unit) then
            table.remove(args.warlocks, k)
        end
    end
    if((table.getn(args.warlocks) ~= nil) and (table.getn(args.warlocks) == 0)) then
        local pyro = Unit:GetCreatureNearestCoords(144.401993, -258.036987, 96.323303, pyroguard)
        if(pyro ~= nil) then
            pyro:SendChatMessage(16, 0, pyro:GetName().." grows stronger!..")
            pyro:AttackReaction(pyro:GetRandomPlayer(0), 1, 0)
        end
    end
end

function PyroGuard_Engaged(Unit, Event)
    Unit:CastSpell(emberseer_lightning)
    Unit:SetFloatValue(OBJECT_FIELD_SCALE_X, (Unit:GetFloatValue(OBJECT_FIELD_SCALE_X))+1)
    Unit:WipeThreatList()
    Unit:RegisterEvent("PyroGuard_Complete", 20000, 1)
end

function PyroGuard_Complete(Unit, Event)
    Unit:CastSpell(emberseer_complete)
    Unit:RegisterEvent("PyroGuard_Attack", 3000, 1)
end

function PyroGuard_Attack(Unit, Event)
    Unit:RemoveEvents()
    Unit:SetUInt32Value(UNIT_FIELD_FLAGS, 0)
    Unit:WipeThreatList()
    Unit:Unroot()
    Unit:SetCombatCapable(0)
    Unit:RegisterEvent("PyroGuard_Spells", 5000, 1)
end

function PyroGuard_OnWipe(Unit, Event)
    Unit:RemoveEvents()
    local args = getvars(Unit)
    for k,v in pairs(args.warlocks) do
		if(v ~= nil) then
			v:RemoveFromWorld()
		end
    end
    Unit:Despawn(0,0)
end

function PyroGuard_Spells(Unit, Event)
    local rand = math.random(1,2)
    if(Unit:GetRandomPlayer(0) ~= nil) then
        if(rand == 1) then
            Unit:FullCastSpell(16079)
        elseif(rand == 2) then
            Unit:FullCastSpellOnTarget(16536, Unit:GetRandomPlayer(0))
        end
    end
    Unit:RegisterEvent("PyroGuard_Spells", 10000, 1)
end

function PyroGuard_Death(Unit, Event)
    local go =  Unit:GetGameObjectNearestCoords(114.407143, -258.893585,91.548134, door2)
    Unit:SpawnCreature(16082, 158.484741, -412.313080, 110.862953, Unit:GetO(), 14, 0)
    if(go ~= nil) then
        go:SetUInt32Value(GAMEOBJECT_STATE, 0)
    end
end

RegisterGameObjectEvent(door1, 4, "Pyroguard_Event")
RegisterGameObjectEvent(altar, 4, "Altar_Activate")
RegisterUnitEvent(blackhand, 1, "blackhandwarlock_oncombat")
RegisterUnitEvent(blackhand, 4, "blackhandwarlock_ondeath")
RegisterUnitEvent(pyroguard, 1, "PyroGuard_Engaged")
RegisterUnitEvent(pyroguard, 4, "PyroGuard_Death")
RegisterUnitEvent(pyroguard, 2, "PyroGuard_OnWipe")

-- The Beast
function Beast_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Berserker_Charge", 7000, 0)
	pUnit:RegisterEvent("Fire_Blast", 14000, 0)
	pUnit:RegisterEvent("Fireball", 21000, 0)
	pUnit:RegisterEvent("Flamebreak", 28000, 0)
	pUnit:RegisterEvent("Immolate", 35000, 0)
	pUnit:RegisterEvent("Summon_Player", 42000, 0)
	pUnit:RegisterEvent("Terrifying_Roar", 49000, 0)
end

function Berserker_Charge(pUnit, Event)
	pUnit:CastSpellOnTarget(16636)
end

function Fire_Blast(pUnit, Event)
	pUnit:CastSpellOnTarget(16144)
end

function Fireball(pUnit, Event)
	pUnit:FullCastSpellOnTarget(16788)
end

function Flamebreak(pUnit, Event)
	pUnit:CastSpellOnTarget(16785)
end

function Immolate(pUnit, Event)
	pUnit:CastSpellOnTarget(15570)
end

function Summon_Player(pUnit, Event)
	pUnit:CastSpellOnTarget(20477, pUnit:GetRandomPlayer())
end

function Terrifying_Roar(pUnit, Event)
	pUnit:CastSpellOnTarget(14100)
end

function Beast_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Beast_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(10430, 1, "Beast_OnCombat")
RegisterUnitEvent(10430, 2, "Beast_OnLeaveCombat")
RegisterUnitEvent(10430, 4, "Beast_OnDeath")

-- Warcheif Rend Blackhand + Gyth
local rend_blackhand = 10429
local gyth = 10339
local rend_mounts = 16167
local summon_rend = 16328
local nefarius = 10162
local door = 175185
local trigger = 16082
local whelp = 10442
local dragonspawn = 10447
local blackhand_veteran =  10681

function Trigger_OnSpawn(Unit, Event)
	local gythe = Unit:GetCreatureNearestCoords(177.466003, -419.792999, 110.472000, gyth)
	if(gythe ~= nil) then
		gythe:RemoveFromWorld()
	end
	Unit:SetCombatCapable(1)
	Unit:SetUInt32Value(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_SELECTABLE)
	Unit:SetUInt32Value(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_2)
	Unit:Root()
	Unit:RegisterAIUpdateEvent(5000)
end

function Trigger_AIUpdate(Unit, Event)
	if(Unit:HasInRangePlayers() ~= false) then
		local tbl = Unit:GetInRangePlayers()
		local o = Unit:GetO()
		for k,v in pairs(tbl) do
			if (o >= v:GetO()) then
				local rend = Unit:SpawnCreature(rend_blackhand, 156.610214, -444.813477, 121.976494, Unit:GetO(), 14, 0)
				if(rend ~= nil) then
					rend:SetCombatCapable(1)
					rend:SetUInt32Value(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_2)
					rend:Root()
				end
				local nef = Unit:GetCreatureNearestCoords(163.167999, -444.165009, 122.058998, nefarius)
				if(nef ~= nil) then
					nef:SetCombatCapable(1)
					nef:Root()
					nef:SetUInt32Value(UNIT_FIELD_FLAGS, UNIT_FLAG_NOT_ATTACKABLE_2)
					nef:AttackReaction(v, 1, 0);
				end
			break
			end
		end
		Unit:RemoveAIUpdateEvent()
		Unit:RemoveFromWorld()
	else
	end
end

RegisterUnitEvent(trigger, 18, "Trigger_OnSpawn")
RegisterUnitEvent(trigger, 21, "Trigger_AIUpdate")

function Rend_Blackhand_EventStart(Unit, Event)
	Unit:SendChatMessage(14, 0, "Let not even a drop of their blood remain upon the arena floor, my children. Feast on their souls!")
	Unit:RegisterAIUpdateEvent(1000)
	setvars(Unit, {wavecount = 0, spawns = {}})
end

function args_spawns(Unit, Event)
	local args = getvars(Unit)
	local no = table.getn(args.spawns)
	if(no ~= nil and no == 0 and args.wavecount <= 7) then
		if(args.wavecount == 1) then
			Unit:SendChatMessage(14, 0, "Foolsss... Kill the one in the dress!")
		elseif(args.wavecount == 2) then
			local rend = Unit:GetCreatureNearestCoords(156.610214, -444.813477, 121.976494, rend_blackhand)
			if(rend ~= nil) then
				rend:SendChatMessage(14, 0, "Sire, let me join the fray! I shall tear their spines out with my bare hands!")
			end
		elseif(args.wavecount == 3) then
			Unit:SendChatMessage(14, 0, "Inconceivable!")
		elseif(args.wavecount == 4) then
			Unit:SendChatMessage(14, 0, "Do not force my hand, children! I shall use your hides to line my boots.")
		elseif(args.wavecount == 5) then
			Unit:SendChatMessage(14, 0, "Defilers!")
		elseif(args.wavecount == 6) then
			Unit:SendChatMessage(14, 0, "Your efforts will prove fruitless. None shall stand in our way!")
		end
		setvars(Unit,{wavecount = wavecount+1})
		table.insert(args.spawns,Unit:SpawnCreature(whelp, 200.619995, -416.778015, 110.973999, Unit:GetO(), 14, 0))
		table.insert(args.spawns,Unit:SpawnCreature(whelp, 203.302994, -423.966003, 110.986000, Unit:GetO(), 14, 0))
		table.insert(args.spawns,Unit:SpawnCreature(whelp, 206.553177, -427.854492, 110.905647, Unit:GetO(), 14, 0))
		table.insert(args.spawns,Unit:SpawnCreature(dragonspawn, 203.022995, -421.907990, 110.986000, Unit:GetO(), 14, 0))
		table.insert(args.spawns,Unit:SpawnCreature(dragonspawn, 202.893417, -416.808899, 110.902893, Unit:GetO(), 14, 0))
		table.insert(args.spawns,Unit:SpawnCreature(blackhand_veteran,196.845749, -423.030029, 110.891159, Unit:GetO(), 14, 0))
		local gate = Unit:GetGameObjectNearestCoords(193.743774, -416.726807, 110.892677, door)
		if(gate ~= nil) then
			gate:SetUInt32Value(GAMEOBJECT_STATE, 0)
		end
		RegisterUnitEvent("Rend_GateShut", 3000, 1)
	else
		Unit:SendChatMessage(14, 0, "THIS CANNOT BE!!! Rend, deal with these insects.")
		Unit:SpawnCreature(gyth, 214.0556244, -396.057404, 111.105141, Unit:GetO(), 14, 0)
		if(gate ~= nil) then
			gate:SetUInt32Value(GAMEOBJECT_STATE, 0)
		end
		local rend = Unit:GetCreatureNearestCoords(156.610214, -444.813477, 121.976494, rend_blackhand)
		rend:SendChatMessage(14, 0, "With pleasure...")
		if(rend ~= nil) then
			rend:RemoveFromWorld()
		end
		RegisterUnitEvent("Rend_GateShut", 5000, 1)
	end
end

function Rend_GateShut(Unit, Event)
	local gate = Unit:GetGameObjectNearestCoords(193.743774, -416.726807, 110.892677, door)
	if(gate ~= nil) then
		gate:SetUInt32Value(GAMEOBJECT_STATE, 1)
	end
end

RegisterUnitEvent(nefarius, 1, "Rend_Blackhand_EventStart")
RegisterUnitEvent(nefarius, 21, "args_spawns")

function TrashWaveWp(Unit,event)
	if(Unit:GetEntry() == dragonspawn or blackhand_veteran) then
		Unit:CreateWaypoint(188.250244, -421.017517, 110.880814, 0, 256,0)
	else
		Unit:CreateWaypoint(188.250244,-421.017517, 110.880814, 0, 768,0)
	end
	Unit:MoveToWaypoint(1)
end

function Rend_TrashDied(Unit,event)
	local args = getvars(Unit)
	for k,v in pairs(args.spawns) do
		if(v == Unit) then
			table.remove(args.spawns, k)
		end
	end
end

RegisterUnitEvent(whelp, 4, "Rend_TrashDied")
RegisterUnitEvent(whelp, 18, "TrashWaveWp")
RegisterUnitEvent(dragonspawn, 4, "Rend_TrashDied")
RegisterUnitEvent(dragonspawn, 18, "TrashWaveWp")
RegisterUnitEvent(blackhand_veteran, 4, "Rend_TrashDied")
RegisterUnitEvent(blackhand_veteran, 18, "TrashWaveWp")

function Gyth_Engaged(Unit,event)
	local nef = Unit:GetCreatureNearestCoords(163.167999, -444.165009, 122.058998, nefarius)
	if(nef ~= nil) then
		nef:SendChatMessage(14, 0, "The Warchief shall make quick work of you, mortals. Prepare yourselves!")
	end
	Unit:CastSpell(16167)
	Unit:CreateWaypoint(203.378326, -417.762177, 110.907867, 0, 768, 0)
	Unit:ModifyFlySpeed(12)
end

function Gyth_OnReachWp(Unit,event)
	Unit:DestroyCustomWaypointMap()
	Unit:MoveTo(177.466003, -419.792999, 110.472000, Unit:GetO())
end

function Gyth_OnCombat(Unit,event)
	Unit:RegisterAIUpdateEvent(1000)
	Unit:RegisterEvent()
end

function Gyth_AIUpdate(Unit,event)
	if(Unit:GetHealthPct() <= 20) then
		Unit:RemoveAura(16167)
		Unit:FullCastSpell(16328)
	end
end

RegisterUnitEvent(gyth, 18, "Gyth_Engaged")
RegisterUnitEvent(gyth, 19, "Gyth_OnReachWp")
RegisterUnitEvent(gyth, 1, "Gyth_OnCombat")
RegisterUnitEvent(gyth, 21, "Gyth_AIUpdate")