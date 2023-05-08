--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

-- Akkrilus
function Akkrilus_OnCombat(Unit, Event)
	Unit:RegisterEvent("Akkrilus_FireShieldII", 7000, 0)
	Unit:RegisterEvent("Akkrilus_Immolate", 14000, 0)
end

function Akkrilus_FireShieldII(pUnit, Event) 
	pUnit:CastSpell(184) 
end

function Akkrilus_Immolate(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(1094, pUnit:GetMainTank()) 
end

function Akkrilus_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Akkrilus_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3773, 1, "Akkrilus_OnCombat")
RegisterUnitEvent(3773, 2, "Akkrilus_OnLeaveCombat")
RegisterUnitEvent(3773, 4, "Akkrilus_OnDied")

-- Apothecary Falthis
function ApothecaryFalthis_OnCombat(Unit, Event)
	Unit:RegisterEvent("ApothecaryFalthis_ShadowBolt", 8000, 0)
end

function ApothecaryFalthis_ShadowBolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(20791, pUnit:GetMainTank()) 
end

function ApothecaryFalthis_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function ApothecaryFalthis_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3735, 1, "ApothecaryFalthis_OnCombat")
RegisterUnitEvent(3735, 2, "ApothecaryFalthis_OnLeaveCombat")
RegisterUnitEvent(3735, 4, "ApothecaryFalthis_OnDied")

-- Dal Bloodclaw
function DalBloodclaw_OnCombat(Unit, Event)
	Unit:RegisterEvent("DalBloodclaw_Disarm", 9000, 0)
	Unit:RegisterEvent("DalBloodclaw_Revenge", 6000, 0)
end

function DalBloodclaw_Disarm(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6713, pUnit:GetMainTank()) 
end

function DalBloodclaw_Revenge(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(12170, pUnit:GetMainTank()) 
end

function DalBloodclaw_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DalBloodclaw_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3987, 1, "DalBloodclaw_OnCombat")
RegisterUnitEvent(3987, 2, "DalBloodclaw_OnLeaveCombat")
RegisterUnitEvent(3987, 4, "DalBloodclaw_OnDied")

--Diathorus the Seeker
function DiathorustheSeeker_OnCombat(Unit, Event)
	Unit:RegisterEvent("DiathorustheSeeker_DrainLife", 8000, 0)
end

function DiathorustheSeeker_DrainLife(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(18557, pUnit:GetMainTank()) 
end

function DiathorustheSeeker_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DiathorustheSeeker_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(6072, 1, "DiathorustheSeeker_OnCombat")
RegisterUnitEvent(6072, 2, "DiathorustheSeeker_OnLeaveCombat")
RegisterUnitEvent(6072, 4, "DiathorustheSeeker_OnDied")

-- Dreamstalker
function Dreamstalker_OnCombat(Unit, Event)
	Unit:RegisterEvent("Dreamstalker_CorrosiveAcidBreath", 6000, 0)
	Unit:RegisterEvent("Dreamstalker_Sleep", 14000, 0)
end

function Dreamstalker_CorrosiveAcidBreath(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(20667, pUnit:GetMainTank()) 
end

function Dreamstalker_Sleep(pUnit, Event) 
	pUnit:CastSpell(20669) 
end

function Dreamstalker_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Dreamstalker_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12498, 1, "Dreamstalker_OnCombat")
RegisterUnitEvent(12498, 2, "Dreamstalker_OnLeaveCombat")
RegisterUnitEvent(12498, 4, "Dreamstalker_OnDied")

-- Duriel Moonfire
function DurielMoonfire_OnCombat(Unit, Event)
	Unit:RegisterEvent("DurielMoonfire_Knockdown", 8000, 0)
	Unit:RegisterEvent("DurielMoonfire_PierceArmor", 6000, 0)
end

function DurielMoonfire_Knockdown(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11428, pUnit:GetMainTank()) 
end

function DurielMoonfire_PierceArmor(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(12097, pUnit:GetMainTank()) 
end

function DurielMoonfire_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function DurielMoonfire_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12860, 1, "DurielMoonfire_OnCombat")
RegisterUnitEvent(12860, 2, "DurielMoonfire_OnLeaveCombat")
RegisterUnitEvent(12860, 4, "DurielMoonfire_OnDied")

-- Eckalom
function Eckalom_OnCombat(Unit, Event)
	Unit:RegisterEvent("Eckalom_Freeze", 12000, 0)
	Unit:RegisterEvent("Eckalom_FrostShock", 8000, 0)
end

function Eckalom_Freeze(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(5276, pUnit:GetMainTank()) 
end

function Eckalom_FrostShock(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(21030, pUnit:GetMainTank()) 
end

function Eckalom_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Eckalom_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(10642, 1, "Eckalom_OnCombat")
RegisterUnitEvent(10642, 2, "Eckalom_OnLeaveCombat")
RegisterUnitEvent(10642, 4, "Eckalom_OnDied")

-- Foulweald Ursa
function FoulwealdUrsa_OnCombat(Unit, Event)
	Unit:RegisterEvent("FoulwealdUrsa_Hamstring", 10000, 0)
end

function FoulwealdUrsa_Hamstring(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(9080, pUnit:GetMainTank()) 
end

function FoulwealdUrsa_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function FoulwealdUrsa_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3749, 1, "FoulwealdUrsa_OnCombat")
RegisterUnitEvent(3749, 2, "FoulwealdUrsa_OnLeaveCombat")
RegisterUnitEvent(3749, 4, "FoulwealdUrsa_OnDied")

-- Talen
--[[Talen says: <name>, I am in need of your help once again.
Talen says: These statuettes must hold a hidden compartment....
Talen says: They're locked! NO!!]]

function Talen_onSpawn (pUnit, Event)
	pUnit:Emote(13)
end

function Talen_onCombat (pUnit, Event)
	pUnit:Emote(26)
end

RegisterUnitEvent(3846, 1, "Talen_onCombat")
RegisterUnitEvent(3846, 6, "Talen_onSpawn")

-- Gorgannon
function Gorgannon_OnCombat(Unit, Event)
	Unit:RegisterEvent("Gorgannon_Knockdown", 8000, 0)
	Unit:RegisterEvent("Gorgannon_ShadowBolt", 10000, 0)
end

function Gorgannon_Knockdown(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11428, pUnit:GetMainTank()) 
end

function Gorgannon_ShadowBolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(9613, pUnit:GetMainTank()) 
end

function Gorgannon_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Gorgannon_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17300, 1, "Gorgannon_OnCombat")
RegisterUnitEvent(17300, 2, "Gorgannon_OnLeaveCombat")
RegisterUnitEvent(17300, 4, "Gorgannon_OnDied")

-- Illkrud Magthrull
function IlkrudMagthrull_OnCombat(Unit, Event)
	Unit:RegisterEvent("IlkrudMagthrull_IlkrudsGuardians", 1000, 1)
	Unit:RegisterEvent("IlkrudMagthrull_ShadowBolt", 8000, 0)
end

function IlkrudMagthrull_IlkrudsGuardians(pUnit, Event) 
	pUnit:CastSpell(6487) 
end

function IlkrudMagthrull_ShadowBolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(20791, pUnit:GetMainTank()) 
end

function IlkrudMagthrull_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function IlkrudMagthrull_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3664, 1, "IlkrudMagthrull_OnCombat")
RegisterUnitEvent(3664, 2, "IlkrudMagthrull_OnLeaveCombat")
RegisterUnitEvent(3664, 4, "IlkrudMagthrull_OnDied")

-- Keeper Ordanus
function KeeperOrdanus_OnCombat(Unit, Event)
	Unit:RegisterEvent("KeeperOrdanus_EntanglingRoots", 11000, 0)
	Unit:RegisterEvent("KeeperOrdanus_LightningBolt", 8000, 0)
end

function KeeperOrdanus_EntanglingRoots(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(12747, pUnit:GetMainTank()) 
end

function KeeperOrdanus_LightningBolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(9532, pUnit:GetMainTank()) 
end

function KeeperOrdanus_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function KeeperOrdanus_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(4273, 1, "KeeperOrdanus_OnCombat")
RegisterUnitEvent(4273, 2, "KeeperOrdanus_OnLeaveCombat")
RegisterUnitEvent(4273, 4, "KeeperOrdanus_OnDied")

-- Kerlonian Evershade
function KerlonianEvershade_OnCombat(Unit, Event)
	Unit:RegisterEvent("KerlonianEvershade_BearForm", 1000, 1)
end

function KerlonianEvershade_BearForm(pUnit, Event) 
	pUnit:CastSpell(18309) 
end

function KerlonianEvershade_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function KerlonianEvershade_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(11218, 1, "KerlonianEvershade_OnCombat")
RegisterUnitEvent(11218, 2, "KerlonianEvershade_OnLeaveCombat")
RegisterUnitEvent(11218, 4, "KerlonianEvershade_OnDied")

-- Lady Vespia
function LadyVespia_OnCombat(Unit, Event)
	Unit:RegisterEvent("LadyVespia_AquaJet", 6000, 0)
	Unit:RegisterEvent("LadyVespia_FrostboltVolley", 8000, 0)
end

function LadyVespia_AquaJet(pUnit, Event) 
	pUnit:CastSpell(13586) 
end

function LadyVespia_FrostboltVolley(pUnit, Event) 
	pUnit:CastSpell(8398) 
end

function LadyVespia_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function LadyVespia_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(10559, 1, "LadyVespia_OnCombat")
RegisterUnitEvent(10559, 2, "LadyVespia_OnLeaveCombat")
RegisterUnitEvent(10559, 4, "LadyVespia_OnDied")

-- Mastok Wrilehiss
function MastokWrilehiss_OnCombat(Unit, Event)
	Unit:RegisterEvent("MastokWrilehiss_Cleave", 8000, 0)
	Unit:RegisterEvent("MastokWrilehiss_Enrage", 12000, 0)
	Unit:RegisterEvent("MastokWrilehiss_PiercingHowl", 10000, 0)
end

function MastokWrilehiss_Cleave(pUnit, Event) 
	pUnit:CastSpell(15284) 
end

function MastokWrilehiss_Enrage(pUnit, Event) 
	pUnit:CastSpell(8599) 
end

function MastokWrilehiss_PiercingHowl(pUnit, Event) 
	pUnit:CastSpell(23600) 
end

function MastokWrilehiss_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MastokWrilehiss_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12737, 1, "MastokWrilehiss_OnCombat")
RegisterUnitEvent(12737, 2, "MastokWrilehiss_OnLeaveCombat")
RegisterUnitEvent(12737, 4, "MastokWrilehiss_OnDied")

-- Mavoris Cloudsbreak
function MavorisCloudsbreak_OnCombat(Unit, Event)
	Unit:RegisterEvent("MavorisCloudsbreak_LightningCloud", 10000, 0)
end

function MavorisCloudsbreak_LightningCloud(pUnit, Event) 
	pUnit:CastSpell(6535) 
end

function MavorisCloudsbreak_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function MavorisCloudsbreak_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3942, 1, "MavorisCloudsbreak_OnCombat")
RegisterUnitEvent(3942, 2, "MavorisCloudsbreak_OnLeaveCombat")
RegisterUnitEvent(3942, 4, "MavorisCloudsbreak_OnDied")

-- Mugglefin
function Mugglefin_OnCombat(Unit, Event)
	Unit:RegisterEvent("Mugglefin_VolatileInfection", 12000, 0)
end

function Mugglefin_VolatileInfection(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(3584, pUnit:GetMainTank()) 
end

function Mugglefin_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Mugglefin_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(10643, 1, "Mugglefin_OnCombat")
RegisterUnitEvent(10643, 2, "Mugglefin_OnLeaveCombat")
RegisterUnitEvent(10643, 4, "Mugglefin_OnDied")

-- Oakpaw
function Oakpaw_OnCombat(Unit, Event)
	Unit:RegisterEvent("Oakpaw_Rejuvenation", 8000, 0)
end

function Oakpaw_Rejuvenation(pUnit, Event) 
	pUnit:CastSpell(12160) 
end

function Oakpaw_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Oakpaw_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(10640, 1, "Oakpaw_OnCombat")
RegisterUnitEvent(10640, 2, "Oakpaw_OnLeaveCombat")
RegisterUnitEvent(10640, 4, "Oakpaw_OnDied")

-- Overseer Gorthak
function OverseerGorthak_OnCombat(Unit, Event)
	Unit:RegisterEvent("OverseerGorthak_Cleave", 8000, 0)
	Unit:RegisterEvent("OverseerGorthak_ShieldBash", 6000, 0)
end

function OverseerGorthak_Cleave(pUnit, Event) 
	pUnit:CastSpell(15496) 
end

function OverseerGorthak_ShieldBash(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11972, pUnit:GetMainTank()) 
end

function OverseerGorthak_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function OverseerGorthak_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(17304, 1, "OverseerGorthak_OnCombat")
RegisterUnitEvent(17304, 2, "OverseerGorthak_OnLeaveCombat")
RegisterUnitEvent(17304, 4, "OverseerGorthak_OnDied")

-- Phantim
function Phantim_OnCombat(Unit, Event)
	Unit:RegisterEvent("Phantim_CorrosiveAcidBreath", 8000, 0)
end

function Phantim_CorrosiveAcidBreath(pUnit, Event) 
	pUnit:CastSpell(20667) 
end

function Phantim_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Phantim_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(5314, 1, "Phantim_OnCombat")
RegisterUnitEvent(5314, 2, "Phantim_OnLeaveCombat")
RegisterUnitEvent(5314, 4, "Phantim_OnDied")

-- Prince Raze
function PrinceRaze_OnCombat(Unit, Event)
	Unit:RegisterEvent("PrinceRaze_GiftoftheXavian", 15000, 1)
	Unit:RegisterEvent("PrinceRaze_Fireball", 8000, 0)
	Unit:RegisterEvent("PrinceRaze_FireNova", 6000, 0)
	Unit:RegisterEvent("PrinceRaze_ChargedArcaneBolt", 1000, 1)
end

function PrinceRaze_GiftoftheXavian(pUnit, Event) 
	pUnit:CastSpell(6925) 
end

function PrinceRaze_Fireball(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(9053, pUnit:GetMainTank()) 
end

function PrinceRaze_FireNova(pUnit, Event) 
	pUnit:CastSpell(11969) 
end

function PrinceRaze_ChargedArcaneBolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(16570, pUnit:GetMainTank()) 
end

function PrinceRaze_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function PrinceRaze_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(10647, 1, "PrinceRaze_OnCombat")
RegisterUnitEvent(10647, 2, "PrinceRaze_OnLeaveCombat")
RegisterUnitEvent(10647, 4, "PrinceRaze_OnDied")

-- Raene Wolfrunner
function RaeneWolfrunner_OnCombat(Unit, Event)
	Unit:RegisterEvent("RaeneWolfrunner_Net", 10000, 0)
	Unit:RegisterEvent("RaeneWolfrunner_Shoot", 6000, 0)
	Unit:RegisterEvent("RaeneWolfrunner_Volley", 20000, 0)
	Unit:RegisterEvent("RaeneWolfrunner_Explosive Shot", 12000, 0)
	Unit:RegisterEvent("RaeneWolfrunner_MultiShot", 15000, 0)
end

function RaeneWolfrunner_Net(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6533, pUnit:GetMainTank()) 
end

function RaeneWolfrunner_Shoot(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6660, pUnit:GetMainTank()) 
end

function RaeneWolfrunner_Volley(pUnit, Event) 
	pUnit:CastSpell(22908) 
end

function RaeneWolfrunner_ExplosiveShot(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(15495, pUnit:GetMainTank()) 
end

function RaeneWolfrunner_MultiShot(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(21390, pUnit:GetMainTank()) 
end

function RaeneWolfrunner_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RaeneWolfrunner_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3691, 1, "RaeneWolfrunner_OnCombat")
RegisterUnitEvent(3691, 2, "RaeneWolfrunner_OnLeaveCombat")
RegisterUnitEvent(3691, 4, "RaeneWolfrunner_OnDied")

-- Ran Bloodtooth
function RanBloodtooth_OnCombat(Unit, Event)
	Unit:RegisterEvent("RanBloodtooth_MultiShot", 10000, 0)
	Unit:RegisterEvent("RanBloodtooth_Shoot", 6000, 0)
end

function RanBloodtooth_MultiShot(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(14443, pUnit:GetMainTank()) 
end

function RanBloodtooth_Shoot(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6660, pUnit:GetMainTank()) 
end

function RanBloodtooth_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RanBloodtooth_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3696, 1, "RanBloodtooth_OnCombat")
RegisterUnitEvent(3696, 2, "RanBloodtooth_OnLeaveCombat")
RegisterUnitEvent(3696, 4, "RanBloodtooth_OnDied")

-- Rorgish Jowl
function RorgishJowl_OnCombat(Unit, Event)
	Unit:RegisterEvent("RorgishJowl_Thrash", 5000, 0)
end

function RorgishJowl_Thrash(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(3391, pUnit:GetMainTank()) 
end

function RorgishJowl_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function RorgishJowl_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(10639, 1, "RorgishJowl_OnCombat")
RegisterUnitEvent(10639, 2, "RorgishJowl_OnLeaveCombat")
RegisterUnitEvent(10639, 4, "RorgishJowl_OnDied")

-- Ruuzel
function Ruuzel_OnCombat(Unit, Event)
	Unit:RegisterEvent("Ruuzel_HeroicStrike", 6000, 0)
end

function Ruuzel_HeroicStrike(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(25712, pUnit:GetMainTank()) 
end

function Ruuzel_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Ruuzel_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3943, 1, "Ruuzel_OnCombat")
RegisterUnitEvent(3943, 2, "Ruuzel_OnLeaveCombat")
RegisterUnitEvent(3943, 4, "Ruuzel_OnDied")

-- Shadumbra
function Shadumbra_OnCombat(Unit, Event)
	Unit:RegisterEvent("Shadumbra_Rend", 10000, 0)
end

function Shadumbra_Rend(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(13445, pUnit:GetMainTank()) 
end

function Shadumbra_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Shadumbra_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12677, 1, "Shadumbra_OnCombat")
RegisterUnitEvent(12677, 2, "Shadumbra_OnLeaveCombat")
RegisterUnitEvent(12677, 4, "Shadumbra_OnDied")

-- Sharptalon
function Sharptalon_OnCombat(Unit, Event)
	Unit:RegisterEvent("Sharptalon_PierceArmor", 6000, 0)
end

function Sharptalon_PierceArmor(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(12097, pUnit:GetMainTank()) 
end

function Sharptalon_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Sharptalon_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12676, 1, "Sharptalon_OnCombat")
RegisterUnitEvent(12676, 2, "Sharptalon_OnLeaveCombat")
RegisterUnitEvent(12676, 4, "Sharptalon_OnDied")

-- Taneel Darkwood
function TaneelDarkwood_OnCombat(Unit, Event)
	Unit:RegisterEvent("TaneelDarkwood_Heal", 13000, 0)
	Unit:RegisterEvent("TaneelDarkwood_Renew", 8000, 2)
	Unit:RegisterEvent("TaneelDarkwood_ShadowWordPain", 4000, 1)
end

function TaneelDarkwood_Heal(pUnit, Event) 
	pUnit:CastSpell(6063) 
end

function TaneelDarkwood_Renew(pUnit, Event) 
	pUnit:CastSpell(6077) 
end

function TaneelDarkwood_ShadowWordPain(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(2767, pUnit:GetMainTank()) 
end

function TaneelDarkwood_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TaneelDarkwood_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3940, 1, "TaneelDarkwood_OnCombat")
RegisterUnitEvent(3940, 2, "TaneelDarkwood_OnLeaveCombat")
RegisterUnitEvent(3940, 4, "TaneelDarkwood_OnDied")

--Terrowulf Packlord
function TerrowulfPacklord_OnCombat(Unit, Event)
	Unit:RegisterEvent("TerrowulfPacklord_BattleRoar", 2000, 2)
end

function TerrowulfPacklord_BattleRoar(pUnit, Event) 
	pUnit:CastSpell(6507) 
end

function TerrowulfPacklord_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function TerrowulfPacklord_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3792, 1, "TerrowulfPacklord_OnCombat")
RegisterUnitEvent(3792, 2, "TerrowulfPacklord_OnLeaveCombat")
RegisterUnitEvent(3792, 4, "TerrowulfPacklord_OnDied")

-- Tideress
function Tideress_OnCombat(Unit, Event)
	Unit:RegisterEvent("Tideress_Frostbolt", 7000, 0)
end

function Tideress_Frostbolt(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(9672, pUnit:GetMainTank()) 
end

function Tideress_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Tideress_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12759, 1, "Tideress_OnCombat")
RegisterUnitEvent(12759, 2, "Tideress_OnLeaveCombat")
RegisterUnitEvent(12759, 4, "Tideress_OnDied")

-- Torek
function Torek_OnCombat(Unit, Event)
	Unit:RegisterEvent("Torek_Rend", 8000, 0)
	Unit:RegisterEvent("Torek_Thunderclap", 10000, 0)
end

function Torek_Rend(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(11977, pUnit:GetMainTank()) 
end

function Torek_Thunderclap(pUnit, Event) 
	pUnit:CastSpell(8078) 
end

function Torek_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Torek_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12858, 1, "Torek_OnCombat")
RegisterUnitEvent(12858, 2, "Torek_OnLeaveCombat")
RegisterUnitEvent(12858, 4, "Torek_OnDied")

-- Ursangous
function Ursangous_OnCombat(Unit, Event)
	Unit:RegisterEvent("Ursangous_KnockAway", 8000, 0)
	Unit:RegisterEvent("Ursangous_Rend", 10000, 0)
end

function Ursangous_KnockAway(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(10101, pUnit:GetMainTank()) 
end

function Ursangous_Rend(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(13443, pUnit:GetMainTank()) 
end

function Ursangous_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Ursangous_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12678, 1, "Ursangous_OnCombat")
RegisterUnitEvent(12678, 2, "Ursangous_OnLeaveCombat")
RegisterUnitEvent(12678, 4, "Ursangous_OnDied")

-- Ursollok
function Ursollok_OnCombat(Unit, Event)
	Unit:RegisterEvent("Ursollok_Maul", 5000, 0)
end

function Ursollok_Maul(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(17156, pUnit:GetMainTank()) 
end

function Ursollok_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function Ursollok_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12037, 1, "Ursollok_OnCombat")
RegisterUnitEvent(12037, 2, "Ursollok_OnLeaveCombat")
RegisterUnitEvent(12037, 4, "Ursollok_OnDied")

-- Uthil Mooncall
function UthilMooncall_OnCombat(Unit, Event)
	Unit:RegisterEvent("UthilMooncall_BearForm", 1000, 1)
	Unit:RegisterEvent("UthilMooncall_Maul", 5000, 0)
end

function UthilMooncall_BearForm(pUnit, Event) 
	pUnit:CastSpell(7090) 
end

function UthilMooncall_Maul(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(12161, pUnit:GetMainTank()) 
end

function UthilMooncall_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function UthilMooncall_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(3941, 1, "UthilMooncall_OnCombat")
RegisterUnitEvent(3941, 2, "UthilMooncall_OnLeaveCombat")
RegisterUnitEvent(3941, 4, "UthilMooncall_OnDied")

-- Vorsha the Lasher
function VorshatheLasher_OnCombat(Unit, Event)
	Unit:RegisterEvent("VorshatheLasher_Lash", 6000, 0)
	Unit:RegisterEvent("VorshatheLasher_Thrash", 5000, 0)
end

function VorshatheLasher_Lash(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(6607, pUnit:GetMainTank()) 
end

function VorshatheLasher_Thrash(pUnit, Event) 
	pUnit:FullCastSpellOnTarget(3391, pUnit:GetMainTank()) 
end

function VorshatheLasher_OnLeaveCombat(Unit, Event) 
	Unit:RemoveEvents() 
end

function VorshatheLasher_OnDied(Unit, Event) 
	Unit:RemoveEvents()
end

RegisterUnitEvent(12940, 1, "VorshatheLasher_OnCombat")
RegisterUnitEvent(12940, 2, "VorshatheLasher_OnLeaveCombat")
RegisterUnitEvent(12940, 4, "VorshatheLasher_OnDied")