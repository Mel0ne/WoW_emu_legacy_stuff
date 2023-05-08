--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

-- Antilos
function Antilos_OnCombat(Unit, Event)
	Unit:RegisterEvent("Antilos_Cleave", 8000, 0)
	Unit:RegisterEvent("Antilos_Rend", 10000, 0)
	Unit:RegisterEvent("Antilos_Swoop", 9000, 0)
end

function Antilos_Cleave(pUnit, Event) 
	pUnit:CastSpell(40505) 
end

function Antilos_Rend(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(13445, 	pUnit:GetMainTank()) 
end

function Antilos_Swoop(pUnit, Event) 
	pUnit:CastSpell(5708) 
end

function Antilos_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Antilos_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6648, 1, "Antilos_OnCombat")
RegisterUnitEvent(6648, 2, "Antilos_OnLeaveCombat")
RegisterUnitEvent(6648, 4, "Antilos_OnDied")

-- Avalanchion
function Avalanchion_OnCombat(Unit, Event)
	Unit:RegisterEvent("Avalanchion_Boulder", 6000, 0)
	Unit:RegisterEvent("Avalanchion_GroundTremor", 8000, 0)
	Unit:RegisterEvent("Avalanchion_Trample", 5000, 0)
end

function Avalanchion_Boulder(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(23392, 	pUnit:GetMainTank()) 
end

function Avalanchion_GroundTremor(pUnit, Event) 
	pUnit:CastSpell(6524) 
end

function Avalanchion_Trample(pUnit, Event) 
	pUnit:CastSpell(5568) 
end

function Avalanchion_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Avalanchion_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(14464, 1, "Avalanchion_OnCombat")
RegisterUnitEvent(14464, 2, "Avalanchion_OnLeaveCombat")
RegisterUnitEvent(14464, 4, "Avalanchion_OnDied")

-- Azuregos
function Azuregos_OnCombat(Unit, Event)
	Unit:RegisterEvent("Azuregos_Chill", 35000, 0)
	Unit:RegisterEvent("Azuregos_Cleave", 10000, 0)
	Unit:RegisterEvent("Azuregos_FrostBreath", 15000, 0)
	Unit:RegisterEvent("Azuregos_Manastorm", 12000, 0)
	Unit:RegisterEvent("Azuregos_Reflection", 17000, 0)
end

function Azuregos_Chill(pUnit, Event) 
	pUnit:CastSpell(21098) 
end

function Azuregos_Cleave(pUnit, Event) 
	pUnit:CastSpell(19983) 
end

function Azuregos_FrostBreath(pUnit, Event) 
	pUnit:CastSpell(21099) 
end

function Azuregos_Manastorm(pUnit, Event) 
	pUnit:CastSpell(21097) 
end

function Azuregos_Reflection(pUnit, Event) 
	pUnit:CastSpell(22067) 
end

function Azuregos_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Azuregos_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6109, 1, "Azuregos_OnCombat")
RegisterUnitEvent(6109, 2, "Azuregos_OnLeaveCombat")
RegisterUnitEvent(6109, 4, "Azuregos_OnDied")

-- Caravan Master Tset
function CaravanMasterTset_OnCombat(Unit, Event)
	Unit:RegisterEvent("CaravanMasterTset_Frostbolt", 7000, 0)
end

function CaravanMasterTset_Frostbolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(9672, 	pUnit:GetMainTank()) 
end

function CaravanMasterTset_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function CaravanMasterTset_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(8409, 1, "CaravanMasterTset_OnCombat")
RegisterUnitEvent(8409, 2, "CaravanMasterTset_OnLeaveCombat")
RegisterUnitEvent(8409, 4, "CaravanMasterTset_OnDied")

-- Gatekeeper Rageroar
function GatekeeperRageroar_OnCombat(Unit, Event)
	Unit:RegisterEvent("GatekeeperRageroar_EntanglingRoots", 10000, 0)
end

function GatekeeperRageroar_EntanglingRoots(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(12747, 	pUnit:GetMainTank()) 
end

function GatekeeperRageroar_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function GatekeeperRageroar_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6651, 1, "GatekeeperRageroar_OnCombat")
RegisterUnitEvent(6651, 2, "GatekeeperRageroar_OnLeaveCombat")
RegisterUnitEvent(6651, 4, "GatekeeperRageroar_OnDied")

-- Hetaera
function Hetaera_OnCombat(Unit, Event)
	Unit:RegisterEvent("Hetaera_InfectedBite", 8000, 0)
end

function Hetaera_InfectedBite(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(12542, 	pUnit:GetMainTank()) 
end

function Hetaera_Thrash(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(3391, 	pUnit:GetMainTank()) 
end

function Hetaera_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Hetaera_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6140, 1, "Hetaera_OnCombat")
RegisterUnitEvent(6140, 2, "Hetaera_OnLeaveCombat")
RegisterUnitEvent(6140, 4, "Hetaera_OnDied")

-- Highborne Apparition
function HighborneApparition_OnCombat(Unit, Event)
	Unit:RegisterEvent("HighborneApparition_Fear", 12000, 0)
end

function HighborneApparition_Fear(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(12542, 	pUnit:GetMainTank()) 
end

function HighborneApparition_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function HighborneApparition_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6116, 1, "HighborneApparition_OnCombat")
RegisterUnitEvent(6116, 2, "HighborneApparition_OnLeaveCombat")
RegisterUnitEvent(6116, 4, "HighborneApparition_OnDied")

-- Lady Sesspira
function LadySesspira_OnCombat(Unit, Event)
	Unit:RegisterEvent("LadySesspira_ForkedLightning", 8000, 0)
	Unit:RegisterEvent("LadySesspira_Shoot", 6000, 0)
end

function LadySesspira_ForkedLightning(pUnit, Event) 
	pUnit:CastSpell(20299) 
end

function LadySesspira_Shoot(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6660, 	pUnit:GetMainTank()) 
end

function LadySesspira_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function LadySesspira_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6649, 1, "LadySesspira_OnCombat")
RegisterUnitEvent(6649, 2, "LadySesspira_OnLeaveCombat")
RegisterUnitEvent(6649, 4, "LadySesspira_OnDied")

-- Magister Hawkhelm
function MagisterHawkhelm_OnCombat(Unit, Event)
	Unit:RegisterEvent("MagisterHawkhelm_Shoot", 6000, 0)
end

function MagisterHawkhelm_Shoot(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6660, 	pUnit:GetMainTank()) 
end

function MagisterHawkhelm_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MagisterHawkhelm_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6647, 1, "MagisterHawkhelm_OnCombat")
RegisterUnitEvent(6647, 2, "MagisterHawkhelm_OnLeaveCombat")
RegisterUnitEvent(6647, 4, "MagisterHawkhelm_OnDied")

-- Magus Rimtori
function MagusRimtori_OnCombat(Unit, Event)
	Unit:RegisterEvent("MagusRimtori_Fireball", 8000, 0)
	Unit:RegisterEvent("MagusRimtori_FrostNova", 10000, 0)
end

function MagusRimtori_Fireball(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(20823, 	pUnit:GetMainTank()) 
end

function MagusRimtori_FrostNova(pUnit, Event) 
	pUnit:CastSpell(11831) 
end

function MagusRimtori_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MagusRimtori_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(8578, 1, "MagusRimtori_OnCombat")
RegisterUnitEvent(8578, 2, "MagusRimtori_OnLeaveCombat")
RegisterUnitEvent(8578, 4, "MagusRimtori_OnDied")

-- Monnos the Elder
function MonnostheElder_OnCombat(Unit, Event)
	Unit:RegisterEvent("MonnostheElder_KnockAway", 8000, 0)
	Unit:RegisterEvent("MonnostheElder_Trample", 5000, 0)
end

function MonnostheElder_KnockAway(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(10101, 	pUnit:GetMainTank()) 
end

function MonnostheElder_Trample(pUnit, Event) 
	pUnit:CastSpell(5568) 
end

function MonnostheElder_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MonnostheElder_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6646, 1, "MonnostheElder_OnCombat")
RegisterUnitEvent(6646, 2, "MonnostheElder_OnLeaveCombat")
RegisterUnitEvent(6646, 4, "MonnostheElder_OnDied")

-- Servant of Arkkoroc
function ServantofArkkoroc_OnCombat(Unit, Event)
	Unit:RegisterEvent("ServantofArkkoroc_Trample", 5000, 0)
end

function ServantofArkkoroc_Trample(pUnit, Event) 
	pUnit:CastSpell(5568) 
end

function ServantofArkkoroc_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ServantofArkkoroc_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6143, 1, "ServantofArkkoroc_OnCombat")
RegisterUnitEvent(6143, 2, "ServantofArkkoroc_OnLeaveCombat")
RegisterUnitEvent(6143, 4, "ServantofArkkoroc_OnDied")

-- The Evalcharr
function TheEvalcharr_OnCombat(Unit, Event)
	Unit:RegisterEvent("TheEvalcharr_Fireball", 8000, 0)
	Unit:RegisterEvent("TheEvalcharr_LightningBreath", 5000, 0)
end

function TheEvalcharr_Fireball(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(21549, 	pUnit:GetMainTank()) 
end

function TheEvalcharr_LightningBreath(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(15797, 	pUnit:GetMainTank()) 
end

function TheEvalcharr_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TheEvalcharr_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(8660, 1, "TheEvalcharr_OnCombat")
RegisterUnitEvent(8660, 2, "TheEvalcharr_OnLeaveCombat")
RegisterUnitEvent(8660, 4, "TheEvalcharr_OnDied")

-- Varothens Ghost
function VarothensGhost_OnCombat(Unit, Event)
	Unit:RegisterEvent("VarothensGhost_CurseofWeakness", 8000, 0)
end

function VarothensGhost_CurseofWeakness(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(21007, 	pUnit:GetMainTank()) 
end

function VarothensGhost_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function VarothensGhost_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6118, 1, "VarothensGhost_OnCombat")
RegisterUnitEvent(6118, 2, "VarothensGhost_OnLeaveCombat")
RegisterUnitEvent(6118, 4, "VarothensGhost_OnDied")

-- Warlord Krellian
function WarlordKrellian_OnCombat(Unit, Event)
	Unit:RegisterEvent("WarlordKrellian_DemoralizingRoar", 8000, 0)
	Unit:RegisterEvent("WarlordKrellian_Strike", 6000, 0)
end

function WarlordKrellian_DemoralizingRoar(pUnit, Event) 
	pUnit:CastSpell(10968) 
end

function WarlordKrellian_Strike(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11976, 	pUnit:GetMainTank()) 
end

function WarlordKrellian_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function WarlordKrellian_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(8408, 1, "WarlordKrellian_OnCombat")
RegisterUnitEvent(8408, 2, "WarlordKrellian_OnLeaveCombat")
RegisterUnitEvent(8408, 4, "WarlordKrellian_OnDied")