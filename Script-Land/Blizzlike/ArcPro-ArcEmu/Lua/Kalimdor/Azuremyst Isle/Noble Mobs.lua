--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

-- Chieftain
function Chieftain_OnCombat(Unit, Event)
	Unit:RegisterEvent("Chieftain_Spellname", 9000, 0)
	Unit:RegisterEvent("Chieftain_enrage", 16000, 1)
end

function Chieftain_Spellname(pUnit, Event)
	pUnit:CastSpellOnTarget(13446, pUnit:GetClosestPlayer())
end

function Chieftain_enrage(pUnit, Event)
	pUnit:CastSpell(18501) 
end

function Chieftain_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

function Chieftain_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(17448, 1, "Chieftain_OnCombat")
RegisterUnitEvent(17448, 2, "Chieftain_OnLeaveCombat")
RegisterUnitEvent(17448, 4, "Chieftain_OnDied")

-- Cookie McWeaksauce
function CookieMcWeaksauce_OnCombat(Unit, Event)
	Unit:RegisterEvent("CookieMcWeaksauce_Shoot", 6000, 0)
end

function CookieMcWeaksauce_Shoot(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(30221, 	pUnit:GetRandomPlayer(0)) 
end

function CookieMcWeaksauce_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CookieMcWeaksauce_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17246, 1, "CookieMcWeaksauce_OnCombat")
RegisterUnitEvent(17246, 2, "CookieMcWeaksauce_OnLeaveCombat")
RegisterUnitEvent(17246, 4, "CookieMcWeaksauce_OnDied")

--[[
    Draenei Survivor says: Everything hurts. Please, make it stop...
    Draenei Survivor says: Huh? What happened? Oh... my head feels like it's going to explode! I'd best get back to the crash site.
    Draenei Survivor says: Huh? What happened? Oh... my head feels like it's going to explode! I'd best get to the crash site.
    Draenei Survivor says: Hunter, you saved me! I owe you a debt that I can never repay. I'll go see if I can help the others.
	Draenei Survivor says: I don't know if I can make it. Please help me...
    Draenei Survivor says: Mage, you saved me! I owe you a debt that I can never repay. I'll go see if I can help the others.
    Draenei Survivor says: Many thanks to you, hunter. I'd best get to the crash site and see how I can help out. Until we meet again.
    Draenei Survivor says: Many thanks to you, mage. I'd best get to the crash site and see how I can help out. Until we meet again.
    Draenei Survivor says: Many thanks to you, paladin. I'd best get to the crash site and see how I can help out. Until we meet again.
    Draenei Survivor says: Many thanks to you, priest. I'd best get to the crash site and see how I can help out. Until we meet again.
    Draenei Survivor says: Many thanks to you, shaman. I'd best get to the crash site and see how I can help out. Until we meet again.
    Draenei Survivor says: Many thanks to you, warrior. I'd best get to the crash site and see how I can help out. Until we meet again.
    Draenei Survivor says: Monk, you saved me! I owe you a debt that I can never repay. I'll go see if I can help the others.
    Draenei Survivor says: Oh no! Where are we? What happened? Look, there's part of the ship!
	Draenei Survivor says: Oh, the pain...
    Draenei Survivor says: Paladin, you saved me! I owe you a debt that I can never repay. I'll go see if I can help the others.
    Draenei Survivor says: Priest, you saved me! I owe you a debt that I can never repay. I'll go see if I can help the others.
    Draenei Survivor says: Shaman, you saved me! I owe you a debt that I can never repay. I'll go see if I can help the others.
    Draenei Survivor says: The last thing I remember is the ship falling and us getting into the pods. I'll go see how I can help. Thank you!
    Draenei Survivor says: The Light be praised! I would have died out here if it weren't for you, hunter! I must get to the ship.
    Draenei Survivor says: The Light be praised! I would have died out here if it weren't for you, mage! I must get to the ship.
    Draenei Survivor says: The Light be praised! I would have died out here if it weren't for you, monk! I must get to the ship.
    Draenei Survivor says: The Light be praised! I would have died out here if it weren't for you, paladin! I must get to the ship.
    Draenei Survivor says: The Light be praised! I would have died out here if it weren't for you, priest! I must get to the ship.
    Draenei Survivor says: The Light be praised! I would have died out here if it weren't for you, shaman! I must get to the ship.
    Draenei Survivor says: The Light be praised! I would have died out here if it weren't for you, warrior! I must get to the ship.
    Draenei Survivor says: Ugh... what is this place? Is that all that's left of the ship over there?
	Draenei Survivor says: Ughhh... I hurt. Can you help me?
    Draenei Survivor says: Warrior, you saved me! I owe you a debt that I can never repay. I'll go see if I can help the others.
    Draenei Survivor says: Where am I? Who are you? Oh no! What happened to the ship?
]]--

DRAENEISURVIVOR = {}
INJUREDDRAENEI = {}

function DRAENEISURVIVOR_OnSpawn(Unit, event, player)
local SurvivorDraeneiChance = math.random(1, 3)
	Unit:RegisterEvent("DRAENEISURVIVOR_Say", 30000, 0)
	if(SurvivorDraeneiChance == 1) then
		pUnit:SetStandState(3)
	elseif(SurvivorDraeneiChance == 2) then
		pUnit:CastSpell(28630)
		pUnit:SetStandState(1)
	elseif(SurvivorDraeneiChance == 3) then
		pUnit:CastSpell(28630)
		pUnit:SetCombatCapable(0)
	end
end

function DRAENEISURVIVOR_OnDied(Unit, event, player)
	Unit:RemoveEvents()
end

function DRAENEISURVIVOR_Say(Unit, event, player)
local chance = math.random(1, 3)
	if(chance == 1) then
		Unit:SendChatMessage(12, 35, "Ughhh... I hurt. Can you help me?" )
	elseif(chance == 2) then
		Unit:SendChatMessage(12, 35, "Oh, the pain...")
	elseif(chance == 3) then
		Unit:SendChatMessage(12, 35, "I don't know if I can make it. Please help me...")
	end
end

RegisterUnitEvent(16483, 18, "DRAENEISURVIVOR_OnSpawn")
RegisterUnitEvent(16483, 4, "DRAENEISURVIVOR_OnDied")

--Injured Draenei 
function INJUREDDRAENEI_OnSpawn(pUnit, event)
InjuredDraeneiChance = math.random(1, 2)
	if(InjuredDraeneiChance == 1) then
		pUnit:SetStandState(3)
	elseif(InjuredDraeneiChance == 2) then
		pUnit:SetStandState(1)
		pUnit:SetCombatCapable(0)
	end
end

function INJUREDDRAENEI_OnDied(Unit, event, player)
	Unit:RemoveEvents()
end

RegisterUnitEvent(16971, 18, "INJUREDDRAENEI_OnSpawn")
RegisterUnitEvent(16971, 4, "INJUREDDRAENEI_OnDied")

-- Hauteur
function Hauteur_OnCombat(Unit, Event)
	Unit:RegisterEvent("Hauteur_Spellname", 12000, 1)
	Unit:RegisterEvent("Hauteur_enrage", 6000, 1)
end

function Hauteur_Spellname(pUnit, Event)
	pUnit:CastSpellOnTarget(8050, pUnit:GetClosestPlayer())
end

function Hauteur_enrage(pUnit, Event)
	pUnit:CastSpell(134) 
end

function Hauteur_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

function Hauteur_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(17206, 1, "Hauteur_OnCombat")
RegisterUnitEvent(17206, 2, "Hauteur_OnLeaveCombat")
RegisterUnitEvent(17206, 4, "Hauteur_OnDied")

-- Surveyor Candress
function SurveyorCandress_OnCombat(Unit, Event)
	Unit:RegisterEvent("SurveyorCandress_Fireball", 8000, 0)
end

function SurveyorCandress_Fireball(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(9487, 	pUnit:GetMainTank()) 
end

function SurveyorCandress_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function SurveyorCandress_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(16522, 1, "SurveyorCandress_OnCombat")
RegisterUnitEvent(16522, 2, "SurveyorCandress_OnLeaveCombat")
RegisterUnitEvent(16522, 4, "SurveyorCandress_OnDied")

-- Warlord Srisstiz
function WarlordSrisstiz_OnCombat(Unit, Event)
	Unit:RegisterEvent("WarlordSrisstiz_WateryStrike", 6000, 0)
end

function WarlordSrisstiz_WateryStrike(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(31275, 	pUnit:GetMainTank()) 
end

function WarlordSrisstiz_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WarlordSrisstiz_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17298, 1, "WarlordSrisstiz_OnCombat")
RegisterUnitEvent(17298, 2, "WarlordSrisstiz_OnLeaveCombat")
RegisterUnitEvent(17298, 4, "WarlordSrisstiz_OnDied")