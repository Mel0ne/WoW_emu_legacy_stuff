--[[ ArcPro Speculation License - 
This software is provided as free and open source by the
team of The ArcPro Speculation Team. This script was written and is
protected by the GPL v2. Please give credit where credit
is due, if modifying, redistributing and/or using this 
software. Thank you.
Author: ArcPro Speculation, LUA++
~~End of License... Please Stand By...
-- ArcPro Speculation, January 19, 2011 - 2013. ]]

print ("Failed: Deadwind Pass - Karazhan - Chess Event")
print ("Failed: Deadwind Pass - Karazhan - Prince Tenris Mirkblood")
print ("Failed: Deadwind Pass - Karazhan - Rokad the Ravager")
print ("Failed: Deadwind Pass - Karazhan - Wizard of Oz")

-- Attumen the Huntsman
--[[Attumen the Huntsman yells: Another trophy to add to my collection!
Attumen the Huntsman yells: Come Midnight, let's disperse this petty rabble!
Attumen the Huntsman yells: Cowards! Wretches!
Attumen the Huntsman yells: It was... inevitable.
Attumen the Huntsman yells: Perhaps you would rather test yourselves against a more formidable opponent?!
Attumen the Huntsman yells: Weapons are merely a convenience for a warrior of my skill!
Attumen the Huntsman yells: Who dares attack the steed of the Huntsman?]]
function Huntsman_Mount(Unit, event, miscUnit, misc)
	if((Unit:GetHealthPct(16151) < 25) and (Didthat == 0)) then
		Unit:FullCastSpell(29770)
		Didthat = 1
	else
	end
end

function Huntsman_Shadow_Cleave(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(29832, Unit:GetClosestPlayer())
end

function Huntsman_Intangible_Presence(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(29833, Unit:GetClosestPlayer())
end

function Huntsman_Berserker_Charge(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(26561, Unit:GetRandomPlayer())
end

function Huntsman(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Huntsman_Mount", 1000, 1)
	Unit:RegisterEvent("Huntsman_Shadow_Cleave", 8000, 0)
	Unit:RegisterEvent("Huntsman_Intangible_Presence", 30000, 0)
	Unit:RegisterEvent("Huntsman_Berserker_Charge", 600000, 0)
end

function Huntsman_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function Huntsman_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(15550, 1, "Huntsman")
RegisterUnitEvent(15550, 2, "Huntsman_OnLeaveCombat")
RegisterUnitEvent(15550, 4, "Huntsman_OnDeath")

-- Baroness Dorothea Millstipe
--[[Baroness Dorothea Millstipe says: Where has the master gone?
Baroness Dorothea Millstipe says: Why can we not talk to the master?]]

function BaronessDorotheaMillstipe_OnCombat(Unit, Event)
	Unit:RegisterEvent("BaronessDorotheaMillstipe_Pain", 7000, 0)
	Unit:RegisterEvent("BaronessDorotheaMillstipe_MindFlay", 14000, 0)
	Unit:RegisterEvent("BaronessDorotheaMillstipe_ManaBurn", 21000, 0)
	Unit:RegisterEvent("BaronessDorotheaMillstipe_Repeat", 28000, 0)
end

function BaronessDorotheaMillstipe_Pain(pUnit, Event)
	pUnit:FullCastSpellOnTarget(34441, pUnit:GetMainTank())
end

function BaronessDorotheaMillstipe_MindFlay(pUnit, Event)
	if(pUnit:GetRandomPlayer(0) ~= nil) then
		pUnit:FullCastSpellOnTarget(37276, pUnit:GetRandomPlayer(0))
	end
end

function BaronessDorotheaMillstipe_ManaBurn(pUnit, Event)
	if(pUnit:GetRandomPlayer(0) ~= nil) then
		pUnit:FullCastSpellOnTarget(37159, pUnit:GetRandomPlayer(0))
	end
end

function BaronessDorotheaMillstipe_Repeat(Unit, Event)
	Unit:RegisterEvent("BaronessDorotheaMillstipe_Pain", 8000, 0)
	Unit:RegisterEvent("BaronessDorotheaMillstipe_MindFlay", 15000, 0)
	Unit:RegisterEvent("BaronessDorotheaMillstipe_ManaBurn", 20000, 0)
end

function BaronessDorotheaMillstipe_Pain(pUnit, Event)
	pUnit:FullCastSpellOnTarget(34441, pUnit:GetMainTank())
end

function BaronessDorotheaMillstipe_MindFlay(pUnit, Event)
	if(pUnit:GetRandomPlayer(0) ~= nil) then
		pUnit:FullCastSpellOnTarget(37276, pUnit:GetRandomPlayer(0))
	end
end

function BaronessDorotheaMillstipe_ManaBurn(pUnit, Event)
	if(pUnit:GetRandomPlayer(0) ~= nil) then
		pUnit:FullCastSpellOnTarget(37159, pUnit:GetRandomPlayer(0))
	end
end

function BaronessDorotheaMillstipe_OnDied(Unit)
	Unit:RemoveEvents()
end

function BaronessDorotheaMillstipe_OnLeaveCombat(Unit)
	Unit:RemoveEvents()
end

RegisterUnitEvent(19875, 1, "BaronessDorotheaMillstipe_OnCombat")
RegisterUnitEvent(19875, 2, "BaronessDorotheaMillstipe_Repeat")
RegisterUnitEvent(19875, 3, "BaronessDorotheaMillstipe_OnLeaveCombat")
RegisterUnitEvent(19875, 4, "BaronessDorotheaMillstipe_OnDied")

-- Dorothee
-- TODO: Timer (3 seconds before goes into combat) ,enrage when tito is killed,check video when tito is summoned.
function Dorothee_Water_Bolt(Unit, event, miscUnit, misc)
	Unit:ClearThreatList()
	Unit:FullCastSpellOnTarget(31012,Unit:GetRandomPlayer())
end

function Dorothee_Summon_Tito(Unit, event, miscUnit, misc)
	Unit:FullCastSpell(31014)
	Unit:SendChatMessage(14, 0, "Don't let them hurt us Tito! Oh, you won't, will you?")
end

function Dorothee_Fear(Unit, event, miscUnit, misc)
	Unit:SendChatMessage(14, 0, "Tito! Oh Tito, no!")
	Unit:FullCastSpellOnTarget(40453, Unit:GetClosestPlayer())
end

function Dorothee(Unit, event, miscUnit, misc)
	tito = 0
	--combatcap = 0
	--Unit:SetCombatCapable(0)
	Unit:SendChatMessage(14, 0, "Oh Tito, we simply must find a way home! The old wizard could be our only hope! Strawman, Roar, Tinhead, will you - wait... oh golly, look we have visitors!")
	Unit:RegisterEvent("Dorothee_Water_Bolt", 8000, 0)
	Unit:RegisterEvent("Dorothee_Summon_Tito", 10000, 1)
	Unit:RegisterEvent("Dorothee_Fear", 15000, 0)
end

function Dorothee_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function Dorothee_OnDeath(pUnit, Event)
	Unit:SendChatMessage(14, 0, "Oh at last, at last I can go home!")
    pUnit:RemoveEvents()
end

RegisterUnitEvent(17535, 1, "Dorothee")
RegisterUnitEvent(17535, 2, "Dorothee_OnLeaveCombat")
RegisterUnitEvent(17535, 4, "Dorothee_OnDeath")

-- Hyakiss the Lurker
function Hyakiss_Hyakiss_Web(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(29896, Unit:GetClosestPlayer())
end

function Hyakiss_Acidic_Wound(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(40481, Unit:GetClosestPlayer())
end

function Hyakiss(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Hyakiss_Hyakiss_Web", 15000, 0)
	Unit:RegisterEvent("Hyakiss_Acidic_Wound", 25000, 0)
end

function Hyakiss_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function Hyakiss_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(16179, 1, "Hyakiss")
RegisterUnitEvent(16179, 2, "Hyakiss_OnLeaveCombat")
RegisterUnitEvent(16179, 4, "Hyakiss_OnDeath")

-- Julianne
--[[Julianne yells: Come, gentle night; and give me back my Romulo!
Julianne yells: O happy dagger! This is thy sheath; there rust, and let me die!
Julianne yells: Parting is such sweet sorrow.
Julianne yells: Romulo, I come! Oh... this do I drink to thee!
Julianne yells: What devil art thou, that dost torment me thus?]]

function Julianne_Eternal_Affection(Unit, event, miscUnit, misc)
	Unit:FullCastSpell(30878)
end

function Julianne_Powerful_Attraction(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(30889, Unit:GetClosestPlayer())
end

function Julianne_Blinding_Passion(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(30890, Unit:GetClosestPlayer())
end

function Julianne_Devotion(Unit, event, miscUnit, misc)
	Unit:FullCastSpell(30887)
end

function Julianne(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Julianne_Eternal_Affection", 10000, 0)
	Unit:RegisterEvent("Julianne_Powerful_Attraction", 15000, 0)
	Unit:RegisterEvent("Julianne_Blinding_Passion", 20000, 0)
	Unit:RegisterEvent("Julianne_Devotion", 25000, 0)
end

function Julianne_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function Julianne_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(17534, 1, "Julianne")
RegisterUnitEvent(17534, 2, "Julianne_OnLeaveCombat")
RegisterUnitEvent(17534, 4, "Julianne_OnDeath")

-- Kil'rek
function Kilrek_Amplify_Flames(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(30053, Unit:GetClosestPlayer())
end

function Kilrek(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Kilrek_Amplify_Flames", 7000, 0)
end

function Kilrek_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function Kilrek_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(17229, 2, "Kilrek_OnLeaveCombat")
RegisterUnitEvent(17229, 4, "Kilrek_OnDeath")
RegisterUnitEvent(17229, 1, "Kilrek")

-- Maiden of Virtue
--[[Maiden of Virtue yells: Cast out your corrupt thoughts.
Maiden of Virtue yells: Death comes. Will your conscience be clear?
Maiden of Virtue yells: This is for the best.
Maiden of Virtue yells: Your behavior will not be tolerated.
Maiden of Virtue yells: Your impurity must be cleansed.]]

function Maiden_Holy_Fire(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(29522, Unit:GetRandomPlayer())
end

function Maiden_Holy_Wrath(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(32445, Unit:GetClosestPlayer())
end

function Maiden_Repentance(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(29511, Unit:GetClosestPlayer())
end

function Maiden_Holy_Ground(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(29512, Unit:GetClosestPlayer())
end

function Maiden(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Maiden_Holy_Fire", 15000, 0)
	Unit:RegisterEvent("Maiden_Holy_Wrath", 20000, 0)
	Unit:RegisterEvent("Maiden_Repentance", 25000, 0)
	Unit:RegisterEvent("Maiden_Holy_Ground", 30000, 0)
end

function Maiden_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function Maiden_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(16457, 2, "Maiden_OnLeaveCombat")
RegisterUnitEvent(16457, 4, "Maiden_OnDeath")
RegisterUnitEvent(16457, 1, "Maiden")

-- Moroes
--[[Moroes yells: Hm, unannounced visitors. Preparations must be made...
Moroes yells: How terribly clumsy of me.
Moroes yells: Now, where was I? Oh, yes...
Moroes yells: Oh, I've gone and made a mess...
Moroes yells: You rang?
Moroes says: The master has business in the rooms above.
Moroes says: The Master is deep in study.
Moroes says: The master is meeting with his apprentice.
Moroes says: The Master will return from Stormwind soon....]]

function Moroes_Enrage(Unit, event, miscUnit, misc)
	if((Unit:GetHealthPct() < 30) and (Didthat == 0)) then
		Unit:FullCastSpell(44779)
		Didthat = 1
	else
	end
end

function Moroes_Gouge(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(28456, Unit:GetClosestPlayer())
end

function Moroes_Blind(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(34654, Unit:GetClosestPlayer())
end

function Moroes_Vanish(Unit, event, miscUnit, misc)
	Unit:FullCastSpell(41476)
end

function Moroes_Garrote(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(37066, Unit:GetRandomPlayer())
end

function Moroes(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Moroes_Enrage", 1000, 1)
	Unit:RegisterEvent("Moroes_Gouge", 15000, 0)
	Unit:RegisterEvent("Moroes_Blind", 20000, 0)
	Unit:RegisterEvent("Moroes_Vanish", 60000, 0)
	Unit:RegisterEvent("Moroes_Garrote", 75000, 0)
end

function Moroes_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function Moroes_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(15687, 2, "Moroes_OnLeaveCombat")
RegisterUnitEvent(15687, 4, "Moroes_OnDeath")
RegisterUnitEvent(15687, 1, "Moroes")

-- Netherspite
function Netherspite_Portal_PhaseA(Unit, event, miscUnit, misc)
	Unit:SendAreaTriggerMessage("PORTAL PHASE")
	Unit:FullCastSpell(30400)
	Unit:FullCastSpell(30401)
	Unit:FullCastSpell(30402)
end

function Netherspite_Nether_Burn(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(30523, Unit:GetClosestPlayer())
end

function Netherspite_Vode_Zone(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(30533, Unit:GetRandomPlayer())
end

function Netherspite_Banish_Phase(Unit, event, miscUnit, misc)
	Unit:SendAreaTriggerMessage("BANISH PHASE")
	Unit:FullCastSpell(35182)
	Unit:FullCastSpellOnTarget(38524, Unit:GetClosestPlayer())
end

function Netherspite_Portal_PhaseB(Unit, event, miscUnit, misc)
	Unit:SendAreaTriggerMessage("PORTAL PHASE")
	Unit:FullCastSpell(30400)
	Unit:FullCastSpell(30401)
	Unit:FullCastSpell(30402)
end

function Netherspite_Enrage(Unit, event, miscUnit, misc)
	Unit:FullCastSpell(35595)
end

function Netherspite(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Netherspite_Portal_PhaseA", 1000, 1)
	Unit:RegisterEvent("Netherspite_Nether_Burn", 10000, 0)
	Unit:RegisterEvent("Netherspite_Vode_Zone", 20000, 0)
	Unit:RegisterEvent("Netherspite_Banish_Phase", 30000, 0)
	Unit:RegisterEvent("Netherspite_Portal_PhaseB", 60000, 0)
	Unit:RegisterEvent("Netherspite_Enrage", 540000, 0)
end

function Netherspite_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function Netherspite_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(15689, 2, "Netherspite_OnLeaveCombat")
RegisterUnitEvent(15689, 4, "Netherspite_OnDeath")
RegisterUnitEvent(15689, 1, "Netherspite")

--Nightbane
--[[Nightbane yells: Enough! I shall land and crush you myself!
Nightbane yells: Insects! Let me show you my strength up close!
Nightbane yells: Miserable vermin. I shall exterminate you from the air!
Nightbane yells: What fools! I shall bring a quick end to your suffering!
Nightbane yells: You cannot hide from me, mortal!]]

function Nightbane_Cleave(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(42587, Unit:GetClosestPlayer())
end

function Nightbane_Tail_Sweep(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(25653, Unit:GetRandomPlayer())
end

function Nightbane_Bone_Shards(Unit, event, miscUnit, misc)
	Unit:FullCastSpell(17014)
end

function Nightbane_Distracting_Ash(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(30130, Unit:GetRandomPlayer())
end

function Nightbane_Bellowing_Roar(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(37066, Unit:GetClosestPlayer())
end

function Nightbane_Charred_Earth(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(30129, Unit:GetClosestPlayer())
end

function Nightbane_Smoldering_Breath(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(39385, Unit:GetClosestPlayer())
end

function Nightbane(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Nightbane_Cleave", 10000, 0)
	Unit:RegisterEvent("Nightbane_Tail_Sweep", 13000, 0)
	Unit:RegisterEvent("Nightbane_Bone_Shards", 17000, 0)
	Unit:RegisterEvent("Nightbane_Distracting_Ash", 23000, 0)
	Unit:RegisterEvent("Nightbane_Bellowing_Roar", 31000, 0)
	Unit:RegisterEvent("Nightbane_Charred_Earth", 37000, 0)
	Unit:RegisterEvent("Nightbane_Smoldering_Breath", 43000, 0)
end

function Nightbane_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function Nightbane_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(17225, 2, "Nightbane_OnLeaveCombat")
RegisterUnitEvent(17225, 4, "Nightbane_OnDeath")
RegisterUnitEvent(17225, 1, "Nightbane")

-- Prince Malchezaar
--[[Prince Malchezaar yells: All realities, all dimensions are open to me!
Prince Malchezaar yells: How can you hope to stand against such overwhelming power?
Prince Malchezaar yells: I refuse to concede defeat! I am a prince of the Eredar! I... am...
Prince Malchezaar yells: Madness has brought you here to me. I shall be your undoing!
Prince Malchezaar yells: Simple fools! Time is the fire in which you'll burn!
Prince Malchezaar yells: You are but a plaything. Unfit even to amuse.
Prince Malchezaar yells: You face not Malchezaar alone, but the legions I command!
Prince Malchezaar yells: Your greed, your foolishness has brought you to this end.]]

function Malchezaar_Hellfire(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(43465, Unit:GetClosestPlayer())
end

function Malchezaar_Thrash(Unit, event, miscUnit, misc)
	Unit:FullCastSpell(21919)
end

function Malchezaar_Parry(Unit, event, miscUnit, misc)
	Unit:FullCastSpell(13668)
end

function Malchezaar_Sunder_Armor(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(30901, Unit:GetClosestPlayer())
end

function Malchezaar_Cleave(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(39174, Unit:GetClosestPlayer())
end

function Malchezaar_Amplify(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(39095, Unit:GetRandomPlayer())
end


function Malchezaar_Flying_Axes(Unit, event, miscUnit, misc)
	Unit:FullCastSpell(17650)
end

function Malchezaar_Shadow_Word_Pain(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(30854, Unit:GetClosestPlayer())
end

function Malchezaar_Shadow_Word_Pain2(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(30854, Unit:GetRandomPlayer())
end

function Malchezaar_Summon_Infernal(Unit, event, miscUnit, misc)
    Unit:SpawnCreature(17646, -10924.5, -1974.66, 275.522, 0, 18, 180000);
end

function Malchezaar_Enfeeble(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(30843, Unit:GetRandomPlayer())
	Unit:FullCastSpellOnTarget(30843, Unit:GetRandomPlayer())
	Unit:FullCastSpellOnTarget(30843, Unit:GetRandomPlayer())
	Unit:FullCastSpellOnTarget(30843, Unit:GetRandomPlayer())
	Unit:FullCastSpellOnTarget(30843, Unit:GetRandomPlayer())
end

function Malchezaar_Shadow_Nova(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(30852, Unit:GetClosestPlayer())
end

function Malchezaar(Unit, event, miscUnit, misc)
	if((Unit:GetHealthPct() < 100) and (Didthat == 0)) then
		Unit:SendAreaTriggerMessage("PHASE 1")
		Unit:RegisterEvent("Malchezaar_Hellfire", 2000, 0)
		Unit:RegisterEvent("Malchezaar_Shadow_Word_Pain", 25000, 0)
		Unit:RegisterEvent("Malchezaar_Summon_Infernal", 35000, 0)
		Unit:RegisterEvent("Malchezaar_Enfeeble", 45000, 0)
		Unit:RegisterEvent("Malchezaar_Shadow_Nova", 47000, 0)
		Didthat = 1
	else
	end
	if((Unit:GetHealthPct() < 60) and (Didthat == 1)) then
		Unit:SendAreaTriggerMessage("PHASE 2")
		Unit:RegisterEvent("Malchezaar_Hellfire", 2000, 0)
		Unit:RegisterEvent("Malchezaar_Thrash", 5000, 0)
		Unit:RegisterEvent("Malchezaar_Parry", 6000, 0)
		Unit:RegisterEvent("Malchezaar_Sunder_Armor", 7000, 0)
		Unit:RegisterEvent("Malchezaar_Cleave", 8000, 0)
		Unit:RegisterEvent("Malchezaar_Summon_Infernal", 45000, 0)
		Unit:RegisterEvent("Malchezaar_Enfeeble", 46000, 0)
		Unit:RegisterEvent("Malchezaar_Shadow_Nova", 47000, 0)
		Didthat = 2
	else
	end
	if((Unit:GetHealthPct() < 30) and (Didthat == 2)) then
		Unit:SendAreaTriggerMessage("PHASE 3")
		Unit:RegisterEvent("Malchezaar_Hellfire", 2000, 0)
		Unit:RegisterEvent("Malchezaar_Amplify", 10000, 0)
		Unit:RegisterEvent("Malchezaar_Summon_Infernal", 15000, 0)
		Unit:RegisterEvent("Malchezaar_Shadow_Word_Pain2", 25000, 0)
		Unit:RegisterEvent("Malchezaar_Flying_Axes", 17000, 0)
		Unit:RegisterEvent("Malchezaar_Shadow_Nova", 47000, 0)
		Didthat = 3
	else
	end
end

function Malchezaar_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function Malchezaar_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(15690, 2, "Malchezaar_OnLeaveCombat")
RegisterUnitEvent(15690, 4, "Malchezaar_OnDeath")
RegisterUnitEvent(15690, 1, "Malchezaar")

-- Roar
-- TODO: Roar movie to set combatcapable and proper blizzlikeness. Done for now.
function Roar_Frightened_Scream(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(31013, Unit:GetRandomPlayer())
end

function Roar_OnKilledTarget(Unit, event, miscUnit, misc)
	Unit:SendChatMessage(14, 0, "You didn't have to go and do that!")
end

function Roar(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Roar_Frightened_Scream", 10000, 0)
	Unit:SendChatMessage(14, 0, "I'm not afraid a' you! Do you wanna' fight? Huh, do ya'? C'mon! I'll fight ya' with both paws behind my back!")
end

function Roar_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function Roar_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(17546, 1, "Roar")
RegisterUnitEvent(17546, 2, "Roar_OnLeaveCombat")
RegisterUnitEvent(17546, 3, "Roar_OnKilledTarget")
RegisterUnitEvent(17546, 4, "Roar_OnDeath")

-- Romulo
--[[Romulo yells: How well my comfort is revived by this!
Romulo yells: Thou detestable maw, thou womb of death; I enforce thy rotten jaws to open!
Romulo yells: Thou smilest... upon the stroke that... murders me.
Romulo yells: Wilt thou provoke me? Then have at thee, boy!]]

function Romulo_Backward_Lunge(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(30815, Unit:GetRandomPlayer())
end

function Romulo_Deadly_Swathe(Unit, event, miscUnit, misc)
	Unit:FullCastSpell(30817)
end

function Romulo_Daring(Unit, event, miscUnit, misc)
	Unit:FullCastSpell(30841)
end

function Romulo_Poisoned_Thrust(Unit, event, miscUnit, misc)
	Unit:FullCastSpell(30822)
end

function Romulo(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Romulo_Backward_Lunge", 10000, 0)
	Unit:RegisterEvent("Romulo_Deadly_Swathe", 15000, 0)
	Unit:RegisterEvent("Romulo_Daring", 21000, 0)
	Unit:RegisterEvent("Romulo_Poisoned_Thrust", 60000, 0)
end

function Romulo_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function Romulo_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(17533, 1, "Romulo")
RegisterUnitEvent(17533, 2, "Romulo_OnLeaveCombat")
RegisterUnitEvent(17533, 4, "Romulo_OnDeath")

-- Shade of Aran
--[[Shade of Aran yells: At last the nightmare is over...
Shade of Aran yells: Back to the cold dark with you!
Shade of Aran yells: Burn, you hellish fiends!
Shade of Aran yells: I am not some simple jester! I am Nielas Aran!
Shade of Aran yells: I want this nightmare to be over!
Shade of Aran yells: I'll freeze you all!
Shade of Aran yells: I'll not be tortured again!
Shade of Aran yells: I'll show you: this beaten dog still has some teeth!
Shade of Aran yells: Please, no more! My son... he's gone mad!
Shade of Aran yells: Torment me no more!
Shade of Aran yells: Who are you? What do you want? Stay away from me!
Shade of Aran yells: Yes, yes my son is quite powerful... but I have powers of my own!
Shade of Aran says: I'm not finished yet! No, I have a few more tricks up my sleeve...]]

function Aran_Water_Elementals(Unit, event, miscUnit, misc)
	if((Unit:GetHealthPct() < 40) and (Didthat == 0)) then
		Unit:SpawnCreature(21160, -11167.2, -1914.13, 232.009, 0, 18, 96000000);
		Unit:SpawnCreature(21160, -11163.2, -1910.13, 232.009, 0, 18, 96000000);
		Unit:SpawnCreature(21160, -11165.2, -1916.13, 232.009, 0, 18, 96000000);
		Unit:SpawnCreature(21160, -11162.2, -1911.13, 232.009, 0, 18, 96000000);
		Didthat = 1
	else
	end
end

function Aran_Polymorph(Unit, event, miscUnit, misc)
	if((Unit:GetManaPct() < 20) and (Didthat == 1)) then
		Unit:FullCastSpellOnTarget(23603,Unit:GetClosestPlayer())
		Unit:FullCastSpell(32453)
		Didthat = 2
	else
	end
end

function Aran_Fireball(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(20678, Unit:GetClosestPlayer())
end

function Aran_Conterspell(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(29961, Unit:GetClosestPlayer())
end

function Aran_Conflagration(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(23023, Unit:GetClosestPlayer())
end

function Aran_FrostBolt(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(41486, Unit:GetClosestPlayer())
end

function Aran_Chains_Ice(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(29991, Unit:GetClosestPlayer())
end

function Aran_Arcane_Missiles(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(29955, Unit:GetClosestPlayer())
end

function Aran_Flame_Wreath(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(30004, Unit:GetRandomPlayer())
end

function Aran_Circular_Blizzard(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(29952, Unit:GetClosestPlayer())
end

function Aran_Magnetic_Pull(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(29979, Unit:GetClosestPlayer())
end

function Aran_Arcane_Explosion(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(29973, Unit:GetClosestPlayer())
end

function Aran(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Aran_Water_Elementals", 1000, 1)
	Unit:RegisterEvent("Aran_Polymorph", 1000, 1)
	Unit:RegisterEvent("Aran_Fireball", 9000, 0)
	Unit:RegisterEvent("Aran_Conterspell", 13000, 0)
	Unit:RegisterEvent("Aran_Conflagration", 15000, 0)
	Unit:RegisterEvent("Aran_FrostBolt", 17000, 0)
	Unit:RegisterEvent("Aran_Chains_Ice", 20000, 0)
	Unit:RegisterEvent("Aran_Arcane_Missiles", 25000, 0)
	Unit:RegisterEvent("Aran_Flame_Wreath", 30000, 0)
	Unit:RegisterEvent("Aran_Circular_Blizzard", 60000, 0)
	Unit:RegisterEvent("Aran_Magnetic_Pull", 90000, 0)
	Unit:RegisterEvent("Aran_Arcane_Explosion", 91000, 0)
end

function Aran_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function Aran_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(16524, 2, "Aran_OnLeaveCombat")
RegisterUnitEvent(16524, 4, "Aran_OnDeath")
RegisterUnitEvent(16524, 1, "Aran")

-- Shadikith the Glider
function Shadikith_Charge(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(38461, Unit:GetRandomPlayer())
end

function Shadikith_Sonic_Burst(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(39052, Unit:GetClosestPlayer())
end

function Shadikith_Wing_Buffet(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(38110, Unit:GetClosestPlayer())
end

function Shadikith_Knockback(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(37966, Unit:GetRandomPlayer())
end

function Shadikith(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Shadikith_Charge", 10000, 0)
	Unit:RegisterEvent("Shadikith_Sonic_Burst", 17000, 0)
	Unit:RegisterEvent("Shadikith_Wing_Buffet", 27000, 0)
	Unit:RegisterEvent("Shadikith_Knockback", 33000, 0)
end

function Shadikith_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function Shadikith_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(16180, 1, "Shadikith")
RegisterUnitEvent(16180, 2, "Shadikith_OnLeaveCombat")
RegisterUnitEvent(16180, 4, "Shadikith_OnDeath")

-- Strawman
--[[Strawman yells: Don't let them make... a mattress outta' me.
Strawman yells: Now what should I do with you? I simply can't make up my mind.]]

function Strawman_Burning_Straw(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(31075, Unit:GetClosestPlayer())
end

function Strawman_Brain_Bash(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(31046, Unit:GetClosestPlayer())
end

function Strawman_OnEnterCombat(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Strawman_Burning_Straw", 10000, 0)
	Unit:RegisterEvent("Strawman_Brain_Bash", 17000, 0)
end

function Strawman_OnLeaveCombat(Unit, Event)
	Unit:RemoveEvents()
end

function Strawman_OnDied(Unit, Event)
	Unit:RemoveEvents()
end

RegisterUnitEvent(17543, 1, "Strawman_OnEnterCombat")
RegisterUnitEvent(17543, 2, "Strawman_OnLeaveCombat")
RegisterUnitEvent(17543, 4, "Strawman_OnDied")

-- Terestian Illhoof
--[[Terestian Illhoof yells: Ah, you're just in time. The rituals are about to begin!
Terestian Illhoof yells: Come, you dwellers in the dark! Rally to my call!
Terestian Illhoof yells: Gather, my pets... there is plenty for all!
Terestian Illhoof yells: Let this sacrifice serve as testament to my fealty.
Terestian Illhoof yells: My life is yours, oh great one...
Terestian Illhoof yells: Please accept this humble offering, oh great one...
Terestian Illhoof yells: Your blood will anoint my circle!]]

function Terestian_Shadow_Bolt(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(36868, Unit:GetClosestPlayer())
end

function Terestian_Sacrifice(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(30115, Unit:GetRandomPlayer())
end

function Terestian_Kilrek(Unit, event, miscUnit, misc)
	if((Unit:GetHealthPct(17229) < 0) and (Didthat == 0)) then
		Unit:SpawnCreature(17229, -11236.9, -1695.81, 179.237, 0, 18, 96000000)
		Didthat = 1
	else
	end
end

function Terestian_Berserk(Unit, event, miscUnit, misc)
	Unit:FullCastSpell(38110)
end

function Terestian(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Terestian_Shadow_Bolt", 8000, 0)
	Unit:RegisterEvent("Terestian_Sacrifice", 33000, 0)
	Unit:RegisterEvent("Terestian_Kilrek", 45000, 0)
	Unit:RegisterEvent("Terestian_Berserk", 60000, 0)
end

function Terestian_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function Terestian_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(15688, 1, "Terestian")
RegisterUnitEvent(15688, 2, "Terestian_OnLeaveCombat")
RegisterUnitEvent(15688, 4, "Terestian_OnDeath")

--The Big Bad Wolf
--[[The Big Bad Wolf yells: Mmmm... delicious.
The Big Bad Wolf yells: Run away little girl, run away!
The Big Bad Wolf yells: The better to own you with!]]

function Wolf_Burning_Terrifying_Howl(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(8715, Unit:GetClosestPlayer())
end

function Wolf_Wide_Swipe(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(6749, Unit:GetClosestPlayer())
end

function Wolf_Riding_Hood(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(30756, Unit:GetRandomPlayer())
end

function Wolf_OnCombat(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Wolf_Burning_Terrifying_Howl", 25000, 0)
	Unit:RegisterEvent("Wolf_Wide_Swipe", 27000, 0)
	Unit:RegisterEvent("Wolf_Riding_Hood", 35000, 0)
end

function Wolf_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function Wolf_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(17521, 1, "Wolf_OnCombat")
RegisterUnitEvent(17521, 2, "Wolf_OnLeaveCombat")
RegisterUnitEvent(17521, 4, "Wolf_OnDeath")

-- The Crone
--[[The Crone yells: How could you? What a cruel, cruel world...
The Crone yells: It will all be over soon!
The Crone yells: Woe to each and every one of you, my pretties!]]

function Crone_Summon_Cyclone(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(38337, Unit:GetRandomPlayer())
end

function Crone_Chain_Lightning(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(32337, Unit:GetClosestPlayer())
end

function Crone_OnCombat(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Crone_Summon_Cyclone", 10000, 0)
	Unit:RegisterEvent("Crone_Chain_Lightning", 17000, 0)
end

function Crone_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function Crone_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(18168, 1, "Crone_OnCombat")
RegisterUnitEvent(18168, 2, "Crone_OnLeaveCombat")
RegisterUnitEvent(18168, 4, "Crone_OnDeath")

-- The Curator
--[[The Curator yells: Curator is no longer operation-a-l.
The Curator yells: Do not touch the displays.
The Curator yells: Failure to comply will result in offensive action.
The Curator yells: Gallery rules will be strictly enforced.
The Curator yells: The Menagerie is for guests only.
The Curator yells: This Curator is equipped for gallery protection.
The Curator yells: You are not a guest.
The Curator yells: Your request cannot be processed.]]

function Curator_Evocation(Unit, event, miscUnit, misc)
	if((Unit:GetManaPct() < 1) and (Didthat == 0)) then
		Unit:FullCastSpell(30254)
		Didthat = 1
	else
	end
end

function Curator_Enrage(Unit, event, miscUnit, misc)
	if((Unit:GetHealthPct() < 15) and (Didthat == 1)) then
		Unit:FullCastSpell(41447)
		Didthat = 2
	else
	end
end

function Curator_Summon_Astral_Flare(Unit, event, miscUnit, misc)
	Unit:SpawnCreature(17096, -1168.601, 1699.915, 91.477, 0, 18, 96000000);
end

function Curator_Hateful_Bolt(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(30383, Unit:GetRandomPlayer())
end

function Curator_Berserk(Unit, event, miscUnit, misc)
	Unit:FullCastSpell(35595)
end

function Curator_OnCombat(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Curator_Evocation", 1000, 0)
	Unit:RegisterEvent("Curator_Enrage", 1000, 0)
	Unit:RegisterEvent("Curator_Summon_Astral_Flare", 10000, 0)
	Unit:RegisterEvent("Curator_Hateful_Bolt", 27000, 0)
	Unit:RegisterEvent("Curator_Berserk", 72000, 0)
end

function Curator_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function Curator_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(15691, 1, "Curator_OnCombat")
RegisterUnitEvent(15691, 2, "Curator_OnLeaveCombat")
RegisterUnitEvent(15691, 4, "Curator_OnDeath")

-- Tinhead
function Tinhead_Rust(Unit, event, miscUnit, misc)
	if((Unit:GetHealthPct() < 50) and (Didthat == 0)) then
	    Unit:FullCastSpellOnTarget(31086, Unit:GetClosestPlayer())
	    Didthat = 1 
	end
end

function Tinhead_OnDied(Unit, event, miscUnit, misc)
	Unit:SendChatMessage(12, 0, "Back to being an old rust bucket.")
	Unit:RemoveEvents()
end

function Tinhead_Cleave(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(39174, Unit:GetClosestPlayer())
end

function Tinhead_OnCombat(Unit, event, miscUnit, misc)
	Unit:SendChatMessage(12, 0, "I could really use a heart. Say, can I have yours?")
	Unit:RegisterEvent("Tinhead_Rust", 5000, 0)
	Unit:RegisterEvent("Tinhead_Cleave", 10000, 0)
end

function Tinhead_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function Tinhead_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(17547, 1, "Tinhead_OnCombat")
RegisterUnitEvent(17547, 2, "Tinhead_OnLeaveCombat")
RegisterUnitEvent(17547, 4, "Tinhead_OnDeath")

-- Tito
function Tito_Annoying_Yipping(Unit, event, miscUnit, misc)
	Unit:FullCastSpellOnTarget(31015, Unit:GetRandomPlayer())
end

function Tito_OnCombat(Unit, event, miscUnit, misc)
	Unit:RegisterEvent("Tito_Annoying_Yipping", 10000, 0)
end

function Tito_OnLeaveCombat(pUnit, Event)
    pUnit:RemoveEvents()
end

function Tito_OnDeath(pUnit, Event)
    pUnit:RemoveEvents()
end

RegisterUnitEvent(17548, 1, "Tito_OnCombat")
RegisterUnitEvent(17548, 2, "Tito_OnLeaveCombat")
RegisterUnitEvent(17548, 4, "Tito_OnDeath")