--This is the master list BadKitty uses to tie enchants, idols and trinkets
--to their respective procs and activated buffs (if any).  You can add to 
--it freely without worry.  However, it's probably a good idea to leave 
--your edit in the comments on Curse, so I can add it to later versions.  
--If you have to add it, chances are I just missed it.


--For trinkets and idols, format is:  BadKittyProcList[<item's ID>] = <buff's spell ID>
--Both IDs can be found via thottbot's url. 
--Example, Idol of the Crying Moon's thottbot url is http://thottbot.com/i50456,
--so its item ID is 50456.  Its associated buff is called Agile;
--(http://thottbot.com/s71175).  So its spell id is 71175.

BadKittyProcList = {}

--TRINKETS
BadKittyProcList[50342] = 71401	--Whispering Fanged Skull (N)
BadKittyProcList[50343] = 71401--Whispering Fanged Skull (H)
BadKittyProcList[50198] = 71403	--Needle-Encrusted Scorpion
BadKittyProcList[47881] = 67737 --Vengeance of the Forsaken (H)
BadKittyProcList[48020] = 67737--Vengeance of the Forsaken (N)
BadKittyProcList[44914] = 60065--Anvil of Titans
BadKittyProcList[47214] = 67671--Banner of Victory
BadKittyProcList[45522] = 64790--Blood of the Old God
BadKittyProcList[45609] = 64772--Comet's Trail
BadKittyProcList[49074] = 33648--Coren's Chromium Coaster
BadKittyProcList[46038] = 65024--Dark Matter
BadKittyProcList[44253] = 60229--Darkmoon Card: Greatness (AGI)
BadKittyProcList[42987] = 60229--Darkmoon Card: Greatness (STR lol)
BadKittyProcList[47303] = 67703--Death's Choice (N)
BadKittyProcList[47464] = 67772--Death's Choice (H)
BadKittyProcList[47115] = 67703--Death's Verdict (N)
BadKittyProcList[47131] = 67772--Death's Verdict (N)
BadKittyProcList[44073] = 59821--Frenzyheart Insignia of Fury
BadKittyProcList[44869] = 59821--Frenzyheart Insignia of Fury (thottbot has 2..)
BadKittyProcList[40431] = 60314--Fury of the Five Flights
BadKittyProcList[40256] = 60437--Grim Toll
BadKittyProcList[50355] = 71396--Herkuml War Token
BadKittyProcList[39257] = 60439--Loatheb's Shadow
BadKittyProcList[40531] = 60319--Mark of Norgannon
BadKittyProcList[47734] = 67695--Mark of Supremacy
BadKittyProcList[40684] = 60065--Mirror of Truth
BadKittyProcList[45931] = 65019--Mjolnir Runestone
BadKittyProcList[46086] = 64524--Platinum Disks of Battle
BadKittyProcList[46088] = 64527--Platinum Disks of Swiftness
BadKittyProcList[45286] = 65014--Pyrite Infuser
BadKittyProcList[48722] = 67683--Shard of the Crystal Heart
BadKittyProcList[43573] = 58904--Tears of Bitter Anguish
BadKittyProcList[46312] = 64981--Vanguished Clutches of Yogg-Saron ?
BadKittyProcList[45263] = 64800--Wrathstone
BadKittyProcList[42418] = 56188--Figurine - Emerald Boar
BadKittyProcList[37723] = 60299--Incisor Fragment
BadKittyProcList[45219] = 63250--Jouster's Fury (Horde)
BadKittyProcList[45131] = 63250--Jouster's Fury (Alliance)
BadKittyProcList[37390] = 60302--Meteorite Whetstone
BadKittyProcList[37166] = 60305--Sphere of Red Dragon's Blood
BadKittyProcList[50362] = 71485--Deathbringer's Will (N)
BadKittyProcList[50363] = 71485--[[Deathbringer's Will (H)  NOTE: the spell id for this is incorrect, 
								 but since BadKitty uses spell name to find a buff on the player, it 
								 is identical.  Additionally, special logic is in BadKitty.lua for 
								 this trinket because of its multiple procs.  Do not change this.]]

--IDOLS
BadKittyProcList[50456] = 71175--Idol of the Crying Moon
BadKittyProcList[42588] = 60549--Deadly Gladiator's Idol of Resolve
BadKittyProcList[42589] = 60551--Furious Gladiator's Idol of Resolve
BadKittyProcList[42587] = 60547--Hateful Gladiator's Idol of Resolve
BadKittyProcList[42591] = 60553--Relentless Gladiator's Idol of Resolve
BadKittyProcList[42574] = 60544--Savage Gladiator's Idol of Resolve
BadKittyProcList[51429] = 60555--Wrathful Gladiator's Idol of Resolve
BadKittyProcList[47668] = 67355--Idol of Mutilation
BadKittyProcList[45509] = 64951--Idol of the Corruptor

--Weapon enchants work slightly differently.  Replace the item ID with 
--the enchant ID.  The spell ID for its buff can be found normally.
--To find the enchant ID, equip a MH weapon with the enchant on it, 
--then type /script BadKitty_PukeID() into chat, and BadKitty will print 
--the enchant ID of that enchant to your chat window (typing that when 
--you have Berserking on your MH will print "3789").  WoWWiki also
--has a list of all enchants and their IDs, if you prefer that.

--Note: There's some extra code pertaining to Berserking within BadKitty.lua
--because its buff is named the same as Berserk's buff.  You shouldn't have to
--worry about that though.

--ENCHANTS
BadKittyProcList[3789] = 59620--Berserking   
BadKittyProcList[2673] = 28093--Berserking   
