--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

print("Loaded Blackfathom Deeps")

-- Aku'mai
function Akumai_OnCombat(pUnit, event)
	pUnit:RegisterEvent("FrenziedRage", 7000, 0)
	pUnit:RegisterEvent("PoisonCloud", 14000, 0)
end
 
function FrenziedRage(pUnit, Event)
	pUnit:CastSpell(3490)
	pUnit:RegisterEvent("FrenziedRage", 7000, 0)
end
 
function PoisonCloud(pUnit, Event)
	pUnit:CastSpell(3815)
	pUnit:RegisterEvent("PoisonCloud", 14000, 0)
end
 
function Akumai_OnLeaveCombat(pUnit, event)
	pUnit:RemoveEvents()
end
 
function Akumai_OnDeath(pUnit, event)
	pUnit:RemoveEvents()
end
 
RegisterUnitEvent(4829, 1, "Akumai_OnCombat")
RegisterUnitEvent(4829, 2, "Akumai_OnLeaveCombat")
RegisterUnitEvent(4829, 4, "Akumai_OnDeath")

-- Baron Aquanis
function BaronAquanis_OnCombat(pUnit, event)
	pUnit:RegisterEvent("FrostNova", 7000, 0)
	pUnit:RegisterEvent("Frostbolt", 14000, 0)
end
 
function FrostNova(pUnit, Event)
	pUnit:CastSpell(15531)
	pUnit:RegisterEvent("FrostNova", 7000, 0)
end
 
function Frostbolt(pUnit, Event)
	pUnit:FullCastSpellOnTarget(15043, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("Frostbolt", 14000, 0)
end
 
function BaronAquanis_OnLeaveCombat(pUnit, event)
	pUnit:RemoveEvents()
end
 
function BaronAquanis_OnDeath(pUnit, event)
	pUnit:RemoveEvents()
end
 
RegisterUnitEvent(12876, 1, "BaronAquanis_OnCombat")
RegisterUnitEvent(12876, 2, "BaronAquanis_OnLeaveCombat")
RegisterUnitEvent(12876, 4, "BaronAquanis_OnDeath")

-- Gelihast
function Gelihast_OnCombat(pUnit, event)
	pUnit:RegisterEvent("Net", 7000, 0)
end
 
function Net(pUnit, Event)
	pUnit:FullCastSpellOnTarget(6533, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("Net", 7000, 0)
end
 
function Gelihast_OnLeaveCombat(pUnit, event)
	pUnit:RemoveEvents()
end
 
function Gelihast_OnDeath(pUnit, event)
	pUnit:RemoveEvents()
end
 
RegisterUnitEvent(6243, 1, "Gelihast_OnCombat")
RegisterUnitEvent(6243, 2, "Gelihast_OnLeaveCombat")
RegisterUnitEvent(6243, 4, "Gelihast_OnDeath")

-- Ghamoo-ra
function Ghamoora_OnCombat(pUnit, event)
	pUnit:RegisterEvent("Trample", 7000, 0)
end
 
function Trample(pUnit, Event)
	pUnit:CastSpell(5568)
	pUnit:RegisterEvent("Trample", 7000, 0)
end
 
function Ghamoora_OnLeaveCombat(pUnit, event)
	pUnit:RemoveEvents()
end
 
function Ghamoora_OnDeath(pUnit, event)
	pUnit:RemoveEvents()
end
 
RegisterUnitEvent(4887, 1, "Ghamoora_OnCombat")
RegisterUnitEvent(4887, 2, "Ghamoora_OnLeaveCombat")
RegisterUnitEvent(4887, 4, "Ghamoora_OnDeath")

-- Lady Sarevess
function LadySarevess_OnCombat(pUnit, event)
	pUnit:SendChatMessage(14, 0, "You should not be here! Slay them!")
	pUnit:PlaySoundToSet(5801)
	pUnit:RegisterEvent("ForkedLightning", 7000, 0)
	pUnit:RegisterEvent("Shoot", 14000, 0)
	pUnit:RegisterEvent("Slow", 21000, 0)
end

function ForkedLightning(pUnit, Event)
	pUnit:CastSpell(8435) 
	pUnit:RegisterEvent("ForkedLightning", 7000, 0)
end

function Shoot(pUnit, Event)
 	pUnit:FullCastSpellOnTarget(6660, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("Shoot", 14000, 0)
end

function Slow(pUnit, Event)
  	pUnit:FullCastSpellOnTarget(246, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("Slow", 21000, 0)
end

function LadySarevess_OnLeaveCombat(pUnit, event)
	pUnit:RemoveEvents()
end

function LadySarevess_OnKilledPlayer(pUnit, event)
	pUnit:SendChatMessage(14, 0, "Paltry kill.")
end

function LadySarevess_OnDeath(pUnit, event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(4831, 1, "LadySarevess_OnCombat")
RegisterUnitEvent(4831, 2, "LadySarevess_OnLeaveCombat")
RegisterUnitEvent(4831, 3, "LadySarevess_OnKilledPlayer")
RegisterUnitEvent(4831, 4, "LadySarevess_OnDeath")

-- Lorgus Jett
function LorgusJett_OnCombat(pUnit, event)
	pUnit:RegisterEvent("LightningBolt", 7000, 0)
	pUnit:RegisterEvent("LightningShield", 14000, 0)
end
 
function LightningBolt(pUnit, Event)
	pUnit:FullCastSpellOnTarget(12167, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("LightningBolt", 7000, 0)
end
 
function LightningShield(pUnit, Event)
	pUnit:CastSpell(12550)
	pUnit:RegisterEvent("LightningShield", 14000, 0)
end
 
function LorgusJett_OnLeaveCombat(pUnit, event)
	pUnit:RemoveEvents()
end
 
function LorgusJett_OnDeath(pUnit, event)
	pUnit:RemoveEvents()
end
 
RegisterUnitEvent(12902, 1, "LorgusJett_OnCombat")
RegisterUnitEvent(12902, 2, "LorgusJett_OnLeaveCombat")
RegisterUnitEvent(12902, 4, "LorgusJett_OnDeath")

-- Old Serra'kis
function OldSerra_OnLeaveCombat(pUnit, event)
	pUnit:RemoveEvents()
end

function OldSerra_OnDeath(pUnit, event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(4830, 2, "OldSerra_OnLeaveCombat")
RegisterUnitEvent(4830, 4, "OldSerra_OnDeath")

-- Twilight Lord Kelris
function TwilightLordKelris_OnCombat(pUnit, event)
	pUnit:SendChatMessage(14, 0, "Who dares disturb my meditation?!")
	pUnit:PlaySoundToSet(5802)
	pUnit:RegisterEvent("MindBlast", 7000, 0)
	pUnit:RegisterEvent("Sleep", 14000, 0)
end
 
function MindBlast(pUnit, Event)
	pUnit:FullCastSpellOnTarget(15587, pUnit:GetRandomPlayer(0))
	pUnit:RegisterEvent("MindBlast", 7000, 0)
end
 
function Sleep(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "Sleep...")
	pUnit:PlaySoundToSet(5804)
	pUnit:CastSpell(8399)
	pUnit:RegisterEvent("Sleep", 14000, 0)
end
 
function TwilightLordKelris_OnLeaveCombat(pUnit, event)
	pUnit:RemoveEvents()
end
 
function TwilightLordKelris_OnKilledPlayer(pUnit, event)
	pUnit:SendChatMessage(14, 0, "Dust to dust.")
	pUnit:PlaySoundToSet(5803)
end
 
function TwilightLordKelris_OnDeath(pUnit, event)
	pUnit:RemoveEvents()
end
 
RegisterUnitEvent(4832, 1, "TwilightLordKelris_OnCombat")
RegisterUnitEvent(4832, 2, "TwilightLordKelris_OnLeaveCombat")
RegisterUnitEvent(4832, 3, "TwilightLordKelris_OnKilledPlayer")
RegisterUnitEvent(4832, 4, "TwilightLordKelris_OnDeath")