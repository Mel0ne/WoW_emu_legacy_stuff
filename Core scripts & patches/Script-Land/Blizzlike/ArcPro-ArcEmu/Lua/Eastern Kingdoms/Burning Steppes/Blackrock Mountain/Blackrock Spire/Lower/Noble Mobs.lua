--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

print ("Failed: Blackrockmountain - Blackrock Spire - Bannok Grimaxe")
print ("Failed: Blackrockmountain - Blackrock Spire - Burning Felguard")
print ("Failed: Blackrockmountain - Blackrock Spire - Crystal Fang")
print ("Failed: Blackrockmountain - Blackrock Spire - Ghok Bashguud")
print ("Failed: Blackrockmountain - Blackrock Spire - Mor Grayhoof")
print ("Failed: Blackrockmountain - Blackrock Spire - Spirestone Battle Lord")
print ("Failed: Blackrockmountain - Blackrock Spire - Spirestone Butcher")
print ("Failed: Blackrockmountain - Blackrock Spire - Spirestone Lord Magus")

-- Gizrul the Slavener
function Gizrul_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Fatal_Bite", 7000, 0)
	pUnit:RegisterEvent("Frenzy", 14000, 0)
	pUnit:RegisterEvent("Infected_Bite", 21000, 0)
end

function Fatal_Bite(pUnit, Event)
	pUnit:CastSpellOnTarget(16495)
end

function Frenzy(pUnit, Event)
	pUnit:CastSpell(8269)
end

function Infected_Bite(pUnit, Event)
	pUnit:CastSpellOnTarget(16128)
end

function Gizrul_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Gizrul_OnDied(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(9736, 1, "Gizrul_OnCombat")
RegisterUnitEvent(9736, 2, "Gizrul_OnLeaveCombat")
RegisterUnitEvent(9736, 4, "Gizrul_OnDied")

-- Halycon
function Halycon_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Rend", 7000, 0)
	pUnit:RegisterEvent("Thrash", 14000, 0)
end

function Rend(pUnit, Event)
	pUnit:CastSpellOnTarget(13738)
end

function Thrash(pUnit, Event)
	pUnit:CastSpell(3391)
end

function Halycon_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Halycon_OnDied(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(9736, 1, "Halycon_OnCombat")
RegisterUnitEvent(9736, 2, "Halycon_OnLeaveCombat")
RegisterUnitEvent(9736, 4, "Halycon_OnDied")

-- Highlord Omokk
--[[ Omokk's head, when placed on a [Roughshod Pike], can be used to challenge Urok Doomhowl. ]]--
function HO_OnCombat(pUnit, Event)
local combat = math.random(1,3)
	if(combat == 1) then
		pUnit:SendChatMessage(12, 0, "I'll crush you!")
	elseif(combat == 2) then
		pUnit:SendChatMessage(12, 0, "Me smash! You die!")
	elseif(combat == 3) then
		if(player:GetPlayerRace() == 1) then
			pUnit:SendChatMessage(12, 0, "Raaar!!! Me smash human!")
		elseif(player:GetPlayerRace() == 10) then
			pUnit:SendChatMessage(12, 0, "Raaar!!! Me smash blood elf!")
		else
			if(combat == 1) then
				pUnit:SendChatMessage(12, 0, "I'll crush you!")
			elseif(combat == 2 or 3) then
				pUnit:SendChatMessage(12, 0, "Me smash! You die!")
			end
		end
	end
	pUnit:RegisterEvent("Frenzy", 1100, 0)
	pUnit:RegisterEvent("KnockAway", 3100, 0)
end

function Frenzy(pUnit, Event)
	pUnit:CastSpell(8269)
end

function KnockAway(pUnit, Event)
	pUnit:CastSpellOnTarget(10101)
end

function HO_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function HO_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(9196, 1, "HO_OnCombat")
RegisterUnitEvent(9196, 2, "HO_OnLeaveCombat")
RegisterUnitEvent(9196, 4, "HO_OnDeath")

-- Mother Smolderweb
function MSW_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Crystallize", 7000, 0)
	pUnit:RegisterEvent("MothersMilk", 14000, 0)
	pUnit:RegisterEvent("Summon", 21000, 0)
end

function Crystallize(pUnit, Event)
	pUnit:CastSpellOnTarget(16104)
end

function MothersMilk(pUnit, Event)
	pUnit:FullCastSpellOnTarget(16468)
end

function Summon(pUnit, Event)
	pUnit:CastSpell(16103)
end

function MSW_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function MSW_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(10596, 1, "MSW_OnCombat")
RegisterUnitEvent(10596, 2, "MSW_OnLeaveCombat")
RegisterUnitEvent(10596, 4, "MSW_OnDeath")

-- Overlord Wyrmthalak
function Overlord_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Cleave", 7000, 0)
	pUnit:RegisterEvent("Demoralizing_Shout", 14000, 0)
	pUnit:RegisterEvent("Sweeping_Slam", 21000, 0)
end

function Cleave(pUnit, Event)
	pUnit:CastSpellOnTarget(15284)
end

function Demoralizing_Shout(pUnit, Event)
	pUnit:CastSpell(16244)
end

function Sweeping_Slam(pUnit, Event)
	pUnit:CastSpellOnTarget(12887)
end

function Overlord_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Overlord_OnDied(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(9736, 1, "Overlord_OnCombat")
RegisterUnitEvent(9736, 2, "Overlord_OnLeaveCombat")
RegisterUnitEvent(9736, 4, "Overlord_OnDied")

-- Quartermaster Zigris
function Zigris_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Drink_Healing_Potion", 7000, 0)
	pUnit:RegisterEvent("Hooked_Net", 14000, 0)
	pUnit:RegisterEvent("Shoot", 21000, 0)
	pUnit:RegisterEvent("Stun_Bomb", 28000, 0)
end

function Drink_Healing_Potion(pUnit, Event)
	pUnit:CastSpell(15504)
end

function Hooked_Net(pUnit, Event)
	pUnit:CastSpellOnTarget(15609)
end

function Shoot(pUnit, Event)
	pUnit:CastSpellOnTarget(59146)
end

function Stun_Bomb(pUnit, Event)
	pUnit:FullCastSpellOnTarget(16497)
end

function Zigris_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function Zigris_OnDied(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(9736, 1, "Zigris_OnCombat")
RegisterUnitEvent(9736, 2, "Zigris_OnLeaveCombat")
RegisterUnitEvent(9736, 4, "Zigris_OnDied")

-- Shadow Hunter Vosh'gajin
function SHV_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("CurseOfBlood", 7000, 0)
	pUnit:RegisterEvent("Hex", 14000, 0)
end

function Hex(pUnit, Event)
	if(pUnit:GetRandomPlayer(0) ~= nil) then
		pUnit:CastSpellOnTarget(16097)
	end
end

function CurseofBlood(pUnit, Event)
	pUnit:CastSpellOnTarget(16098)
end

function SHV_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function SHV_OnDeath(pUnit, Event)
	pUnit:removeEvents()
end

RegisterUnitEvent(9236, 1, "SHV_OnCombat")
RegisterUnitEvent(9236, 2, "SHV_OnLeaveCombat")
RegisterUnitEvent(9236, 4, "SHV_OnDeath")

-- Ukrok Doomhowl
function UDH_OnCombat(pUnit, Event)
local npcsay = math.random(1,3)
	if(npcsay == 1) then
		pUnit:SendChatMessage(14, 0, "You have summoned me, fool! Now DIE!")
	elseif(npcsay == 2) then
		pUnit:SendChatMessage(12, 0, "I'll crush you!")
	elseif(npcsay == 3) then
		pUnit:SendChatMessage(12, 0, "Me smash! You Die!")
	end
	pUnit:RegisterEvent("IntimidatingRoar", 7000, 0)
	pUnit:RegisterEvent("Rend", 14000, 0)
	pUnit:RegisterEvent("Strike", 21000, 0)
end

function IntimidatinRoar(pUnit, Event)
	pUnit:CastSpellOnTarget(16508)
end

function Rend(pUnit, Event)
	pUnit:CastSpellOnTarget(16509)
end

function Strike(pUnit, Event)
	pUnit:CastSpellOnTarget(15580)
end

function UDH_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function UDH_OnDeath(pUnit, Event)
	pUnit:removeEvents()
end

RegisterUnitEvent(10584, 1, "UDH_OnCombat")
RegisterUnitEvent(10584, 2, "UDH_OnLeaveCombat")
RegisterUnitEvent(10584, 4, "UDH_OnDeath")

-- War Maste Voone
function WMV_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Cleave", 7000, 0)
	pUnit:RegisterEvent("MortalStrike", 14000, 0)
	pUnit:RegisterEvent("Pummel", 21000, 0)
	pUnit:RegisterEvent("SnapKick", 28000, 0)
	pUnit:RegisterEvent("Thrash", 35000, 0)
	pUnit:RegisterEvent("ThrowAxe", 42000, 0)
	pUnit:RegisterEvent("Uppercut", 49000, 0)
end

function Uppercut(pUnit, Event)
	pUnit:CastSpellOnTarget(10966)
end

function ThrowAxe(pUnit, Event)
	pUnit:FullCastSpellOnTarget(16075)
end

function Trash(pUnit, Event)
	pUnit:CastSpell(3391)
end
function SnapKick(pUnit, Event)
	pUnit:CastSpellOnTarget(15618)
end

function Pummel(pUnit, Event)
	pUnit:CastSpellOnTarget(15615)
end

function MortalStrike(pUnit, Event)
	pUnit:CastSpellOnTarget(16856)
end

function Cleave(pUnit, Event)
	pUnit:CastSpellOnTarget(15284)
end

function WMV_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function WMV_OnDeath(pUnit, Event)
	pUnit:removeEvents()
end

RegisterUnitEvent(9237, 1, "WMV_OnCombat")
RegisterUnitEvent(9237, 2, "WMV_OnLeaveCombat")
RegisterUnitEvent(9237, 4, "WMV_OnDeath")