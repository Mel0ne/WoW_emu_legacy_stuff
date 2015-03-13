--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

-- High Interrorgator Gerstahn
function HIGS_OnCombat(pUnit, Event)
    pUnit:RegisterEvent("ManaBurn", 14000, 0)
    pUnit:RegisterEvent("ShadowShield", 7000, 0)
	pUnit:RegisterEvent("SWPain", 21000, 0)
	pUnit:RegisterEvent("PsychicScream", 28000, 0)
end
 
function ManaBurn(pUnit, Event)
    pUnit:CastSpell(14033)
end
 
function ShadowShield(pUnit, Event)
    Unit:CastSpell(12040)
end

function SWPain(pUnit, Event)
    pUnit:CastSpell(14032)
end

function PsychicScream(Unit, Event)
    pUnit:CastSpell(13704)
end
 
function HIGS_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end
 
function HIGS_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end
 
RegisterUnitEvent(9018, 1, "HIGS_OnCombat")
RegisterUnitEvent(9018, 2, "HIGS_OnLeaveCombat")
RegisterUnitEvent(9018, 4, "HIGS_OnDeath")

--Hurley Blackbreath
function HBB_OnCombat(pUnit, Event)
local chance = math.random(1,2)
	if(chance == 1) then
		pUnit:SendChatMessage(14, 0, "Get away from those kegs!")
	elseif(chance == 2) then
		pUnit:SendChatMessage(12, 0, "You'll pay for that!")
	end
	pUnit:RegisterEvent("Drunkenrage", 7000, 0)
	pUnit:RegisterEvent("FlameBreath", 14000, 0)
end

function FlameBreath(pUnit, Event)
	pUnit:CastSpellOnTarget(9573)
end

function Drunkenrage(pUnit, Event)
	pUnit:CastSpellonTarget(14872)
end

function HBB_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function HBB_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(9537, 1, "HBB_OnCombat")
RegisterUnitEvent(9537, 2, "HBB_OnLeaveCombat")
RegisterUnitEvent(9537, 4, "HBB_OnDeath")

-- Phalanx
function PX_OnCombat(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "Violence! Property damage! None shall pass!!")
	pUnit:RegisterEvent("FireballVolley", 7000, 0)
	pUnit:RegisterEvent("ThunderClap", 14000, 0)
	pUnit:RegisterEvent("MightyBlow", 21000, 0)
end

function FireballVolley(pUnit, Event)
	pUnit:CastSpell(15285)
end

function MightyBlow(pUnit, Event)
	pUnit:FullCastSpellonTarget(14099)
end

function ThunderClap(pUnit, Event)
	pUnit:FullCastSpellonTarget(15588)
end

function PX_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function PX_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(9502, 1, "PX_OnCombat")
RegisterUnitEvent(9502, 2, "PX_OnLeaveCombat")
RegisterUnitEvent(9502, 4, "PX_OnDeath")

-- Plugger Spazzring
function PSR_OnSpawn(pUnit, Event)
local chance = math.random(1,4)
	if(chance == 1) then
		pUnit:SendChatMessage(12, 0, "Drink up! There's more where that came from!")
	elseif(chance == 2) then
		pUnit:SendChatMessage(12, 0, "Enjoy! You won't find better ale anywhere!")
	elseif(chance == 3) then
		pUnit:SendChatMessage(12, 0, "Have you tried the Dark Iron Ale? Its the best!")
	else
		pUnit:SendChatMessage(12, 0, "Try the boar! It's my new recipe!")
	end
end

function PSR_OnCombat(pUnit, Event)
local chance = math.random(1,7)
	if(chance == 1) then
		pUnit:SendChatMessage(14, 0, "That's it! No more beer until this mess is sorted out!")
	elseif(chance == 2) then
		pUnit:SendChatMessage(14, 0, "That's it! You're going down!")
	elseif(chance == 3) then
		pUnit:SendChatMessage(14, 0, "What are you doing over there?")
	elseif(chance == 4) then
		pUnit:SendChatMessage(14, 0, "No Stealing the goods!")
	elseif(chance == 5) then
		pUnit:SendChatMessage(14, 0, "Hey, my pockets were picked!")
	elseif(chance == 6) then
		pUnit:SendChatMessage(14, 0, "Hey! Stop that!")
	else
		pUnit:SendChatMessage(14, 0, "Hey! Get away from that!")
	end
	pUnit:RegisterEvent("CurseofTongues", 7000, 0)
	pUnit:RegisterEvent("DemonArmor", 14000, 0)
	pUnit:RegisterEvent("ShadowBolt", 21000, 0)
	pUnit:RegisterEvent("Immolate", 28000, 0)
	pUnit:RegisterEvent("Banish", 35000, 0)
end

function CurseofTongues(pUnit, Event)
	pUnit:CastSpellOnTarget(13338)
end

function Banish(pUnit, Event)
	pUnit:FullCastSpellonTarget(8994)
end

function DemonArmor(pUnit, Event)
	pUnit:CastSpell(13787)
end

function Immolate(pUnit, Event)
	pUnit:FullCastSpellonTarget(12742)
end

function ShadowBolt(pUnit, Event)
	pUnit:FullCastSpellonTarget(12739)
end

function PSR_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function PSR_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(9499, 1, "PSR_OnCombat")
RegisterUnitEvent(9499, 2, "PSR_OnLeaveCombat")
RegisterUnitEvent(9499, 4, "PSR_OnDeath")
RegisterUnitEvent(9499, 5, "PSR_OnSpawn")

-- Ribbly Screwspigot
function RScrewp_OnCombat(pUnit, Event)
	pUnit:SendChatMessage(12, 0, "No! Get away from me! Help!!")
	pUnit:RegisterEvent("RScrewp_Hamstring", 7000, 0)
	pUnit:RegisterEvent("RScrewp_Gouge", 14000, 0)
end

function RScrewp_Hamstring(pUnit, Event)
	pUnit:CastSpellOnTarget(9080)
end

function RScrewp_Gouge(pUnit, Event)
	pUnit:CastSpellonTarget(12540)
end

function RScrewp_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function RScrewp_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(9543, 1, "RScrewp_OnCombat")
RegisterUnitEvent(9543, 2, "RScrewp_OnLeaveCombat")
RegisterUnitEvent(9543, 4, "RScrewp_OnDeath")

-- Houndmaster Grebmar
function HoundMGM_OnCombat(pUnit, Event)
	pUnit:SendChatMessage(12, 0, "Ahh, a new chew toy for my dogs!")
    pUnit:RegisterEvent("Bloodlust", 7000, 0)
    pUnit:RegisterEvent("DS", 14000, 0)
	pUnit:RegisterEvent("Pummel", 21000, 0)
end
 
function Bloodlust(pUnit, Event)
    pUnit:FullCastSpell(21049)
end
 
function DS(pUnit, Event)
    pUnit:CastSpell(13730)
end

function Pummel(pUnit, Event)
    pUnit:CastSpellOnTarget(15615)
end
 
function HoundMGM_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end
 
function HoundMGM_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end
 
RegisterUnitEvent(9319, 1, "HoundMGM_OnCombat")
RegisterUnitEvent(9319, 2, "HoundMGM_OnLeaveCombat")
RegisterUnitEvent(9319, 3, "HoundMGM_OnDeath")

-- Lord Roccor
function LordRoccor_OnCombat(pUnit, Event)
    pUnit:RegisterEvent("EarthShock", 7000, 0)
    pUnit:RegisterEvent("FlameShock", 14000, 0)
	pUnit:RegisterEvent("GroundTremor", 21000, 0)
end
 
function EarthShock(pUnit, Event)
    pUnit:FullCastSpellOnTarget(13728)
end
 
function FlameShock(pUnit, Event)
    pUnit:FullCastSpellOnTarget(13729)
end

function GroundTremor(pUnit, Event)
    pUnit:CastSpell(6524)
end
 
function LordRoccor_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end
 
function LordRoccor_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end
 
RegisterUnitEvent(9025, 1, "LordRoccor_OnCombat")
RegisterUnitEvent(9025, 2, "LordRoccor_OnLeaveCombat")
RegisterUnitEvent(9025, 3, "LordRoccor_OnDeath")

-- Ambassador Flamelash
function AFL_OnCombat(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "Your reign of terror ends now! Face your doom mortals!")
	pUnit:RegisterEvent("BurningSpirit", 7000, 0)
end

function BurningSpirit(pUnit, Event)
	pUnit:CastSpell(14744)
end

function AFL_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function AFL_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(9156, 1, "AFL_OnCombat")
RegisterUnitEvent(9156, 2, "AFL_OnLeaveCombat")
RegisterUnitEvent(9156, 4, "AFL_OnDeath")

-- Emperor Dagran Thaurissan
-- TODO: Aggro encounter
function EDT_OnCombat(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "I will crush you into little tiny pieces!")
	pUnit:RegisterEvent("AvatarofFlame", 7000, 0)
	pUnit:RegisterEvent("HandOfThaurissan", 14000, 0)
end

function AvatarofFlame(pUnit,Event)
	pUnit:CastSpell(15636)
end

function HandOfThaurissan(pUnit, Event)
	pUnit:CastSpell(17492)
end

--[[Aggro encounter will go here.

What he say to start aggro: Come to aid the Throne!

What he say after aggro (killing Shadowforge Senate): Thank you for clearing out those foolish senators. Now prepare to meet your doom at the hands of Ragnaros' most powerful servant.
They were just getting in the way anyways.
pUnit:SendChatMessage(14, 0, "They were just getting in the way anyways.")]]

function EDT_OnKilledTarget(pUnit, Event)
local npcsay = math.random(1,3)
	if(npcsay == 1) then
		pUnit:SendChatMessage(14, 0, "Hail to the King, baby!")
	elseif(npcsay == 2) then
		pUnit:SendChatMessage(14, 0, "Is that the best you can do? Do you really expect that you could defeat someone as awe inspiring as me?")
	else
		pUnit:SendChatMessage(14, 0, "Your efforts are utterly pointless, fools! You will never be able to defeat me!")
	end
end

function EDT_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function EDT_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(9019, 1, "EDT_OnCombat")
RegisterUnitEvent(9019, 2, "EDT_OnLeaveCombat")
RegisterUnitEvent(9019, 3, "EDT_OnKilledTarget")
RegisterUnitEvent(9019, 4, "EDT_OnDeath")

-- Magmus
function Magmus_OnCombat(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "Emperor Thaurissan does not wish to be disturbed! Turn back now or face your doom, weak mortals!")
    pUnit:RegisterEvent("FieryBurst", 7000, 0)
    pUnit:RegisterEvent("WarStomp", 14000, 0)
end
 
function FieryBurst(pUnit, Event)
    pUnit:FullCastSpellOnTarget(15668)
end
 
function WarStomp(pUnit, Event)
    pUnit:CastSpell(15593)
end
 
function Magmus_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end
 
function Magmus_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end
 
RegisterUnitEvent(9938, 1, "Magmus_OnCombat")
RegisterUnitEvent(9938, 2, "Magmus_OnLeaveCombat")
RegisterUnitEvent(9938, 4, "Magmus_OnDeath")

-- Princess Moira Bronzebeard
function PMBB_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Heal", 21000, 0)
	pUnit:RegisterEvent("MindBlast", 7000, 0)
	pUnit:RegisterEvent("SWPain", 14000, 0)
	pUnit:RegisterEvent("Renew", 35000, 0)
	pUnit:RegisterEvent("ShadowBolt", 28000, 0)
end
 
function Heal(pUnit, Event)
	pUnit:FullCastSpell(15586)
end
 
function MindBlast(pUnit, Event)
	pUnit:FullCastSpellOnTarget(15587)
end

function SWPain(pUnit, Event)
	pUnit:CastSpellOnTarget(15654)
end

function ShadowBolt(Unit, Event)
	pUnit:FullCastSpellOnTarget(15537)
end

function Renew(Unit, Event)
	pUnit:FullCastSpell(8362)
end
 
function PMBB_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end
 
function PMBB_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end
 
RegisterUnitEvent(8929, 1, "PMBB_OnCombat")
RegisterUnitEvent(8929, 2, "PMBB_OnLeaveCombat")
RegisterUnitEvent(8929, 4, "PMBB_OnDeath")

-- The Seven
-- TODO: have a timer for a wave of each seven.
-- Hate'rel
function HREL_OnGossipTalk(pUnit, player, Event)
	pUnit:SendChatMessage(14, 0, "The death of our flesh marked the birth of our spirit and our sacred task.")
	pUnit:SetFaction(14)
	player:GossipComplete()
end

function HREL_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("HREL_ShadowShield", 7000, 0)
	pUnit:RegisterEvent("HREL_Strike", 14000, 0)
	pUnit:RegisterEvent("HREL_ShadowBolt", 21000, 0)
	pUnit:RegisterEvent("HREL_Flurry", 28000, 0)
end

function HREL_ShadowShield(pUnit, Event)
	pUnit:CastSpell(12040)
end

function HREL_Strike(pUnit, Event)
	pUnit:CastSpellOnTarget(15580)
end

function HREL_ShadowBolt(pUnit, Event)
	pUnit:FullCastSpellOnTarget(15232)
end

function HREL_Flurry(pUnit, Event)
	pUnit:CastSpell(17687)
end

function HREL_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function HREL_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(9034, 1, "HREL_OnCombat")
RegisterUnitEvent(9034, 2, "HREL_OnLeaveCombat")
RegisterUnitEvent(9034, 4, "HREL_OnDeath")
RegisterUnitGossipEvent(9034, 1, "HREL_OnGossipTalk")

-- Anger'rel
function AREL_OnGossipTalk(pUnit, player, Event)
	pUnit:SendChatMessage(12, 0, "Our leader, Doom'rel, has ears for the challenge.")
	pUnit:SetFaction(14)
	player:GossipComplete()
end

function AREL_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("AREL_SunderArmor", 7000, 0)
	pUnit:RegisterEvent("AREL_ShieldBlock", 14000, 0)
	pUnit:RegisterEvent("AREL_Enrage", 21000, 0)
	pUnit:RegisterEvent("AREL_ShieldWall", 28000, 0)
	pUnit:RegisterEvent("AREL_Strike", 35000, 0)
end

function AREL_SunderArmor(pUnit, Event)
	pUnit:CastSpellOnTarget(11971)
end

function AREL_ShieldBlock(pUnit, Event)
	pUnit:CastSpell(12169)
end

function AREL_Enrage(pUnit, Event)
	pUnit:CastSpell(15061)
end

function AREL_ShieldWall(pUnit, Event)
	pUnit:CastSpell(15062)
end

function AREL_Strike(pUnit, Event)
	pUnit:CastSpellOnTarget(15580)
end

function AREL_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function AREL_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(9035, 1, "AREL_OnCombat")
RegisterUnitEvent(9035, 2, "AREL_OnLeaveCombat")
RegisterUnitEvent(9035, 4, "AREL_OnDeath")
RegisterUnitGossipEvent(9035, 1, "AREL_OnGossipTalk")

-- Vile'rel
function VREL_OnGossipTalk(pUnit, player, Event)
	pUnit:SendChatMessage(12, 0, "Our leader, Doom'rel, has ears for the challenge.")
	pUnit:SetFaction(14)
	player:GossipComplete()
end

function VREL_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("VREL_Heal", 7000, 0)
	pUnit:RegisterEvent("VREL_PowerWShield", 14000, 0)
	pUnit:RegisterEvent("VREL_PrayerOfHealing", 21000, 0)
	pUnit:RegisterEvent("VREL_MindBlast", 28000, 0)
end

function VREL_Heal(pUnit, Event)
	pUnit:FullCastSpell(15586)
end

function VREL_PowerWShield(pUnit, Event)
	pUnit:CastSpell(11974)
end

function VREL_PrayerOfHealing(pUnit, Event)
	pUnit:FullCastSpell(15585)
end

function VREL_MindBlast(pUnit, Event)
	pUnit:FullCastSpellOnTarget(15587)
end

function VREL_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function VREL_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(9036, 1, "VREL_OnCombat")
RegisterUnitEvent(9036, 2, "VREL_OnLeaveCombat")
RegisterUnitEvent(9036, 4, "VREL_OnDeath")
RegisterUnitGossipEvent(9036, 1, "VREL_OnGossipTalk")

-- Gloom'rel
function GREL_OnGossipTalk(pUnit, player, Event)
	pUnit:SendChatMessage(12, 0, "I am forever denied the touch of stone. I will never again know the glory of shaped iron...")
	pUnit:SetFaction(14)
	player:GossipComplete()
end

function GREL_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("GREL_Rechlessness", 7000, 0)
	pUnit:RegisterEvent("GREL_Cleave", 14000, 0)
	pUnit:RegisterEvent("GREL_Hamstring", 21000, 0)
	pUnit:RegisterEvent("GREL_MortalStrike", 28000, 0)
end

function GREL_Rechlessness(pUnit, Event)
	pUnit:CastSpell(13847)
end

function GREL_Cleave(pUnit, Event)
	pUnit:CastSpell(40504)
end

function GREL_Hamstring(pUnit, Event)
	pUnit:FullCastSpellOnTarget(9080)
end

function GREL_MortalStrike(pUnit, Event)
	pUnit:CastSpellOnTarget(13737)
end

function GREL_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function GREL_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(9037, 1, "VREL_OnCombat")
RegisterUnitEvent(9037, 2, "VREL_OnLeaveCombat")
RegisterUnitEvent(9037, 4, "VREL_OnDeath")
RegisterUnitGossipEvent(9037, 1, "VREL_OnGossipTalk")

-- Seeth'rel
function SREL_OnGossipTalk(pUnit, player, Event)
	pUnit:SendChatMessage(14, 0, "You may not pass. You are not our kin, nor have you issued the challenge.")
	pUnit:SetFaction(14)
	player:GossipComplete()
end

function SREL_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("SREL_FrostArmor", 7000, 0)
	pUnit:RegisterEvent("SREL_ConeOfCold", 14000, 0)
	pUnit:RegisterEvent("SREL_FrostWard", 21000, 0)
	pUnit:RegisterEvent("SREL_Blizzard", 28000, 0)
	pUnit:RegisterEvent("SREL_FrostNova", 35000, 0)
	pUnit:RegisterEvent("SREL_Frostbolt", 42000, 0)
	pUnit:RegisterEvent("SREL_Chilled", 49000, 0)
end

function SREL_FrostArmor(pUnit, Event)
	pUnit:CastSpell(12544)
end

function SREL_ConeOfCold(pUnit, Event)
	pUnit:CastSpellOnTarget(15244)
end

function SREL_FrostWard(pUnit, Event)
	pUnit:CastSpell(15044)
end

function SREL_Blizzard(pUnit, Event)
	pUnit:CastSpellOnTarget(8364)
end

function SREL_FrostNova(pUnit, Event)
	pUnit:CastSpell(12674)
end

function SREL_FrostBolt(pUnit, Event)
	pUnit:FullCastSpellOnTarget(12675)
end

function SREL_Chilled(pUnit, Event)
	pUnit:CastSpellOnTarget(6136)
end

function SREL_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function SREL_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(9038, 1, "SREL_OnCombat")
RegisterUnitEvent(9038, 2, "SREL_OnLeaveCombat")
RegisterUnitEvent(9038, 4, "SREL_OnDeath")
RegisterUnitGossipEvent(9038, 1, "SREL_OnGossipTalk")

-- Doom'rel
function DOREL_OnGossipTalk(pUnit, player, Event)
	player:PlayerSendChatMessage(1, 0, "Your bondage is at the end, Doom'rel. I challenge you!")
	pUnit:SendChatMessage(12, 0, "You have challenged the Seven, and now you will die!")
	pUnit:SetFaction(14)
	player:GossipComplete()
end

function DOREL_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("DOREL_Banish", 7000, 0)
	pUnit:RegisterEvent("DOREL_CurseOfWeak", 14000, 0)
	pUnit:RegisterEvent("DOREL_DemonArmor", 21000, 0)
	pUnit:RegisterEvent("DOREL_Immolate", 28000, 0)
	pUnit:RegisterEvent("DOREL_ShadowBoltValley", 35000, 0)
	pUnit:RegisterEvent("DOREL_SummonVoidwalkers", 42000, 0)
end

function DOREL_Banish(pUnit, Event)
	pUnit:FullCastSpellOnTarget(8994)
end

function DOREL_CurseOfWeak(pUnit, Event)
	pUnit:CastSpellOnTarget(12493)
end

function DOREL_DemonArmor(pUnit, Event)
	pUnit:CastSpell(13787)
end

function DOREL_Immolate(pUnit, Event)
	pUnit:FullCastSpellOnTarget(12742)
end

function DOREL_ShadowBoltValley(pUnit, Event)
	pUnit:FullCastSpellOnTarget(15245)
end

function DOREL_SummonVoidwalkers(pUnit, Event)
	pUnit:CastSpell(15092)
end

function DOREL_OnLeaveCombat(pUnit, Event)
	pUnit:SendChatMessage(14, 0, "Your challenge has failed!")
	pUnit:RemoveEvents()
end

function DOREL_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(9039, 1, "DOREL_OnCombat")
RegisterUnitEvent(9039, 2, "DOREL_OnLeaveCombat")
RegisterUnitEvent(9039, 4, "DOREL_OnDeath")
RegisterUnitGossipEvent(9039, 1, "DOREL_OnGossipTalk")

-- Dope'rel
function DREL_OnGossipTalk(pUnit, player, Event)
	pUnit:SendChatMessage(12, 0, "Our punishment is also our blessing.")
	pUnit:SetFaction(14)
	player:GossipComplete()
end

function DREL_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("DREL_Backstab", 7000, 0)
	pUnit:RegisterEvent("DREL_Evasion", 14000, 0)
	pUnit:RegisterEvent("DREL_Gouge", 21000, 0)
	pUnit:RegisterEvent("DREL_Rupture", 28000, 0)
	pUnit:RegisterEvent("DREL_SinisterStrike", 35000, 0)
end

function DREL_Backstab(pUnit, Event)
	pUnit:CastSpellOnTarget(15582)
end

function DREL_Evasion(pUnit, Event)
	pUnit:CastSpell(15087)
end

function DREL_Gouge(pUnit, Event)
	pUnit:CastSpellOnTarget(12540)
end

function DREL_Rupture(pUnit, Event)
	pUnit:CastSpellOnTarget(15583)
end

function DREL_SinisterStrike(pUnit, Event)
	pUnit:CastSpellOnTarget(15581)
end

function DREL_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end

function DREL_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end

RegisterUnitEvent(9040, 1, "DREL_OnCombat")
RegisterUnitEvent(9040, 2, "DREL_OnLeaveCombat")
RegisterUnitEvent(9040, 4, "DREL_OnDeath")
RegisterUnitGossipEvent(9040, 1, "DREL_OnGossipTalk")

-- Warder Stilgiss
function FDV_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("FrostArmor", 7000, 0)
	pUnit:RegisterEvent("Chilled", 14000, 0)
	pUnit:RegisterEvent("FrostNova", 21000, 0)
	pUnit:RegisterEvent("FrostWard", 28000, 0)
	pUnit:RegisterEvent("Frostbolt", 35000, 0)
end

function FrostArmor(pUnit, Event)
	pUnit:CastSpell(12544)
end

function Chilled(pUnit, Event)
	pUnit:FullCastSpell(6136)
end

function FrostNova(pUnit, Event)
	pUnit:CastSpell(12674)
end

function FrostWard(pUnit, Event)
	pUnit:FullCastSpell(15044)
end

function Frostbolt(pUnit, Event)
	pUnit:FullCastSpellonTarget(12675)
end

function FDV_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function FDV_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(9041, 1, "FDV_OnCombat")
RegisterUnitEvent(9041, 2, "FDV_OnLeaveCombat")
RegisterUnitEvent(9041, 4, "FDV_OnDeath")

-- Verek
function Verek_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("CurseOfBlood", 7000, 0)
	pUnit:RegisterEvent("Enrage", 14000, 0)
end

function CurseOfBlood(pUnit, Event)
	pUnit:CastSpell(15042)
end

function Enrage(pUnit, Event)
	pUnit:CastSpell(8599)
end

function Verek_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function Verek_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(9042, 1, "Verek_OnCombat")
RegisterUnitEvent(9042, 2, "Verek_OnLeaveCombat")
RegisterUnitEvent(9042, 4, "Verek_OnDeath")

-- Bael'Gar
function BaelGar_OnCombat(pUnit, Event)
    pUnit:RegisterEvent("MagmaSplash", 7000, 0)
    pUnit:RegisterEvent("SummonSpawnofBaelGar", 14000, 0)
end
 
function MagmaSplash(pUnit, Event)
    pUnit:CastSpell(23379)
end
 
function SummonSpawnofBaelGar(pUnit, Event)
    pUnit:CastSpell(13895)
end
 
function BaelGar_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end
 
function BaelGar_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end
 
RegisterUnitEvent(9016, 1, "BaelGar_OnCombat")
RegisterUnitEvent(9016, 2, "BaelGar_OnLeaveCombat")
RegisterUnitEvent(9016, 3, "BaelGar_OnDeath")

-- Fineous Darkvire
function FDV_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("DevotionAura", 7000, 0)
	pUnit:RegisterEvent("HolyLight", 14000, 0)
	pUnit:RegisterEvent("HolyStrike", 21000, 0)
	pUnit:RegisterEvent("SealOfReckoning", 28000, 0)
	pUnit:RegisterEvent("Kick", 35000, 0)
end

function Kick(pUnit, Event)
	pUnit:CastSpellOnTarget(11978)
end

function SealOfReckoning(pUnit, Event)
	pUnit:FullCastSpellOnTarget(15346)
end

function HolyStrike(pUnit, Event)
	pUnit:FullCastSpellonTarget(13953)
end

function HolyLight(pUnit, Event)
	pUnit:FullCastSpellonTarget(15493)
end

function DevotionAura(pUnit, Event)
	pUnit:FullCastSpellonTarget(8258)
end

function FDV_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function FDV_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(9056, 1, "FDV_OnCombat")
RegisterUnitEvent(9056, 2, "FDV_OnLeaveCombat")
RegisterUnitEvent(9056, 4, "FDV_OnDeath")

-- General Angerforge
function GAF_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("Enrage", 7000, 0)
	pUnit:RegisterEvent("Flurry", 14000, 0)
	pUnit:RegisterEvent("SunderArmor", 21000, 0)
end

function Enrage(pUnit, Event)
	if(pUnit:GetHealthPct() >= 30) then
		pUnit:SpawnCreature(8894, pUnit:GetX(), pUnit:GetY(),pUnit:GetZ(), pUnit:GetO(), 14, 300000)
		pUnit:SpawnCreature(8894, pUnit:GetX(), pUnit:GetY(),pUnit:GetZ(), pUnit:GetO(), 14, 300000)
		pUnit:FullCastSpell(15061)
	end
end

function Flurry(pUnit, Event)
	pUnit:FullCastSpell(17687)
end

function SunderArmor(pUnit, Event)
	pUnit:FullCastSpellOnTarget(15572)
end

function GAF_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function GAF_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(9033, 1, "GAF_OnCombat")
RegisterUnitEvent(9033, 2, "GAF_OnLeaveCombat")
RegisterUnitEvent(9033, 4, "GAF_OnDeath")

-- Golem Lord Argelmach
function GLA_OnCombat(pUnit, Event)
	pUnit:SendChatMessage(12, 0, "Intruders in the Manufactory? My constructs will destroy you!")
	pUnit:RegisterEvent("LightningShield", 7000, 0)
	pUnit:RegisterEvent("ChainLightning", 14000, 0)
	pUnit:RegisterEvent("Shock", 21000, 0)
end

function LightningShield(pUnit, Event)
	pUnit:CastSpell(15507)
end

function ChainLightning(pUnit, Event)
	pUnit:FullCastSpell(15305)
end

function Shock(pUnit, Event)
	pUnit:FullCastSpellOnTarget(15605)
end

function GLA_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function GLA_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(8983, 1, "GLA_OnCombat")
RegisterUnitEvent(8983, 2, "GLA_OnLeaveCombat")
RegisterUnitEvent(8983, 4, "GLA_OnDeath")

-- Lord Incendius
function LICD_OnCombat(pUnit, Event)
	pUnit:SendChatMessage(12, 0, "I cannot be destroyed! By the will of Ragnaros, I shall be reborn!")
	pUnit:RegisterEvent("CurseotEleLord", 7000, 0)
	pUnit:RegisterEvent("FireStorm", 14000, 0)
	pUnit:RegisterEvent("FieryBurst", 21000, 0)
	pUnit:RegisterEvent("MightyBlow", 28000, 0)
end

function CurseotEleLord(pUnit, Event)
	pUnit:CastSpellOnTarget(26977)
end

function MightyBlow(pUnit, Event)
	pUnit:FullCastSpellOnTarget(14099)
end

function FireStorm(pUnit, Event)
	pUnit:FullCastSpellonTarget(13899)
end

function FieryBurst(pUnit, Event)
	pUnit:FullCastSpellonTarget(13900)
end

function LICD_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function LICD_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(9017, 1, "LICD_OnCombat")
RegisterUnitEvent(9017, 2, "LICD_OnLeaveCombat")
RegisterUnitEvent(9017, 4, "LICD_OnDeath")

-- Pyromancer Loregrain
function PMLG_OnCombat(pUnit, Event)
	pUnit:RegisterEvent("SearingTotems", 7000, 0)
	pUnit:RegisterEvent("FireWard", 14000, 0)
	pUnit:RegisterEvent("MoltenBlast", 21000, 0)
	pUnit:RegisterEvent("FlameShock", 28000, 0)
end
 
function SearingTotems(pUnit, Event)
	pUnit:FullCastSpell(15038)
end
 
function FireWard(pUnit, Event)
	pUnit:FullCastSpell(15041)
end

function MoltenBlast(pUnit, Event)
	pUnit:FullCastSpellOnTarget(15095)
end

function FlameShock(Unit, Event)
	pUnit:CastSpellOnTarget(15616)
end
 
function PMLG_OnLeaveCombat(pUnit, Event)
	pUnit:RemoveEvents()
end
 
function PMLG_OnDeath(pUnit, Event)
	pUnit:RemoveEvents()
end
 
RegisterUnitEvent(9024, 1, "PMLG_OnCombat")
RegisterUnitEvent(9024, 2, "PMLG_OnLeaveCombat")
RegisterUnitEvent(9024, 3, "PMLG_OnDeath")