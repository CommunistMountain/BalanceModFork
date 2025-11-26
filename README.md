# BalanceModFork
3 mods for the game FTL: Faster Than Light: "Bugfixes and QOL" and "Balance Changes". Continuation of Twinge's Balance and Bugfix Mod.

Use the mods with [Slipstream Mod Manager](https://github.com/Vhati/Slipstream-Mod-Manager) or [FTL Mod Manager](https://github.com/afishhh/ftlman). Change the file extension from .zip to .ftl, or change the setting to consider .zip files as mods.

They require the [Hyperspace mod](https://github.com/FTL-Hyperspace/FTL-Hyperspace). Major credit goes to the HS team for making many bugfixes/QOL possible.

If what you see in-game does not match the advertised description, please submit an issue, or contact me on Reddit (CommunistMountain) or Discord (communistmountain, formerly CommunistMountain#0463).

Mod order:
<ol>
    <li>Hyperspace</li>
    <li>Bugfixes and QOL</li>
    <li>Balance Changes (CM) OR Balance Changes (Twinge) (pick 1, not both)</li>
    <li>Other mods</li>
</ol>

# Bugfixes and QOL

## Bugfixes (gameplay)
<ol>
    <li>Hull Missile: Now considered a missile weapon for events.</li>
    <li>Fire Drone: Now considered a combat drone for events.</li>
    <li>AE Weapons: No longer show up in Hidden Crystal Worlds stores.</li>
    <li>Hacking: When you are at 1 drone part and target hacking at the enemy ship while paused, then deploy another drone, the hacking drone will blow up once you resume, preventing it from being used with 0 drone parts.</li>
    <li>hackingIonFix: Prevents ionisation from resetting Hacking cooldown.</li>
    <li>crystalShardFix: Crystal Shards are now considered player projectiles instead of neutral.</li>
    <li>defenseDroneFix: Defense drones no longer have a blind spot (doesn't work at the time of writing, hopefully it will be in the future)</li>
    <li>cloakRenderFix: Cloaking while no crew is on board no longer hides rooms.</li>
    <li>disableDefaultTutorial: HS breaks the tutorial. This replaces it with a custom tutorial (still incomplete at the time of writing though).</li>
    <li>multipleOverCapacity: If you are over capacity on 2+ weapons/drones/augments, multiple Over Capacity boxes will contain all new items, allowing you to pick which ones to leave behind. If you are at a store, you also get the chance to sell what is in the Over Capacity boxes.</li>
    <li>EVENTS:</li>
    <ol>
        <li>ALISON_DEFECTOR: Now unable to tell if the defector is lying or not about wanting to join you.</li>
        <li>CIVILIAN_ASTEROIDS_BEACON, ENGI_STATION_DISTRESS, FEDERATION_PLANET_SIGNAL, REBEL_VS_FEDERATION: Fixed Medium scrap not being awarded along with the crewmember, if the fight is against an Elite Rebel ship.</li>
        <li>CRYSTAL_HUNTER: Fight no longer continues after accepting their surrender offer.</li>
        <li>DISTRESS_STATION_FIRE, LANIUS_BEACON_EATER, PIRATE_SALESMAN: Fixed drone and hacking options not requiring 1 drone part.</li>
        <li>ENGI_SEX, ENGI_VIRUS, LANIUS_AUTO_REBEL, PIRATE_SMUGGLE, REBEL_TRANSPORT, ROCK_LOOTING: Fixed some of their outcomes being Random tier, they are now Medium tier (ENGI_SEX and ENGI_VIRUS) or Low tier (the rest) as intended.</li>
        <li>ENGI_STATION_DISTRESS, PIRATE_CIVILIAN_BEACON, REBEL_VS_FEDERATION, SLUG_DISTRESS_RESCUE, SLUG_DISTRESS_TRICK: Fixed these events not appearing at Distress Beacons on the map.</li>
        <li>ENGI_UNLOCK_1: Now unable to tell the difference between the real and fake ships through minor text differences, or based on when they decide to surrender.</li>
        <li>ESCORT_BEACON and QUEST_ESCORT: extended the conversation when you get the reactor upgrade outcome, so that revisiting the beacon multiple times will not upgrade your reactor again for free.</li>
        <li>MERCHANT_REQUEST: Added missing Lifeform Scanner blue option from the STATION_SICK event as intended.</li>
        <li>ROCK_STARSHIP_MINE: Fixed missile option not requiring 1 missile.</li>
        <li>STORM_BOARDING, STORM_REBEL, STORM_SLUG_FIGHT: These events no longer appear to be at non-nebula beacons on the map in Slug Controlled Nebula and Slug Home Nebula, and will slow the Rebel Fleet appropriately.</li>
        <li>TRADER_UPGRADES_EXCHANGE: You are now prevented from selecting the option to upgrade your reactor if you are at 25 reactor.</li>
        <ol>
            <li>Note for modders: Mods with ships that have reactor limits above 25 will be impacted. Undo/edit this change if necessary.</li>
        </ol>
        <li>AutoReward interactions with free weapon/drone/augment:</li>
        <ol>
            <li>Augment rewards outside autoReward now overwrite autoReward augments, instead of being overwritten by autoReward augments. Fixes events ENGI_UNLOCK_1, ENGI_VIRUS and NEBULA_SLUG_FIGHT_UNLOCK in rare cases.</li>
            <li>Weapon rewards outside autoReward no longer overwrite autoReward drones and augments. Fixes events CRYSTAL_CACHE and DONOR_MANTIS_CHASE in rare cases, and event CRYSTAL_HELP_DIG now gives an augment and high scrap with the free weapon as intended.</li>
            <li>Drone rewards outside autoReward no longer overwrite autoReward weapons and augments. Fixes event ZOLTAN_CREW_STUDY in rare cases.</li>
        </ol>        
        <li>CRYSTAL_CACHE, DISTRESS_INFESTATION, DISTRESS_TRAPPED_MINER, MERCHANT_REQUEST, ROCK_MANTIS_FREIGHTER, STATION_SICK: Fixed certain options having a chance of not consuming resources, if the reward after the choice includes that resource. (I used custom autoRewards for this, ideally HS can fix this in the future so that they aren't required.)</li>
    </ol>
    <li>SHIPS:</li>
    <ol>
        <li>Pirate Mantis Interceptor: Highest sector it can appear from 5 to 6, to match non-pirate version.</li>
        <li>Rebel Disruptor: Hacking max from 1 to 2, to match pirate version.</li>
        <li>Pirate Slug Instigator: Pilot max from 0 (effectively 1) to 3, to match non-pirate version.</li>
    </ol>
    <li>TEXT</li>
    <ol>
        <li>Korean language: now correctly shows the amount of evasion an enemy ship has when hacking Pilot or Engines, and oxygen amount when hacking Oxygen.</li>
    </ol>
</ol>

## QOL (gameplay)
<ol>
    <li>Map: integrated Sleeper Games + MantisManMike's Enhanced Fleet Pursuit mod, showing the Rebel Fleet's position in future jumps. Made it redder for better contrast against very bright white portions of backgrounds, and when the fleet is delayed, better contrast against very dark portions of backgrounds (lines in map_warningcircle.png from 0, 0, 0 at 10% opacity to 137, 58, 56 at 30% opacity).</li>
    <li>Mini-Beam: length from 45 to 47.</li>
    <li>Halberd Beam and Glaive Beam: length from 80 to 82.</li>
    <li>Shifted starting crew to generally better positions. Credit to MantisManMike. Order is Pilot, Engines, Weapons, Shields:</li>
    <ol>
        <li>Kestrel B: Human Human Zoltan Mantis -> HZHM</li>
        <li>Kestrel C: Human Lanius Human -> LHH</li>
        <li>Fed A: Human Mantis Rock Engi -> RMHE</li>
        <li>Fed B: Human Zoltan Slug -> SHZ</li>
        <li>Fed C: Human Zoltan Zoltan Mantis -> ZZMH</li>
        <li>Mantis A: Mantis Mantis Mantis Engi -> MMEM</li>
        <li>Rock C: Rock Rock Crystal -> RCR</li>
        <li>Stealth B: Human Human Zoltan -> HZH</li>
        <li>Stealth C: Human Rock Slug -> SHR</li>
        <li>Crystal A: Human Human Crystal Crystal -> CHCH</li>
    </ol>
    <li>checkCargo: Include cargo weapons/drones for event checks (you still need the relevant system).</li>
    <ol>
        <li>Note for modders: this setting by itself allows weapons/drones to be used in choices without the system. I made custom requirement definitions in hyperspace.xml (I named them MULTIREQ_thing), then changed the requirements in event choices, to check for the system. You need to use these custom requirements, or implement more custom requirements, if you also want to check for the system.</li>
    </ol>
    <li>preIgniteChargers: Charge weapons can enter a fight fully charged if you have a Pre-Igniter.</li>
    <li>showNumericalWeaponCooldown: Shows weapon cooldowns.</li>
    <li>showAllConnections: Shows all connections between beacons on the map.</li>
    <li>Rebel Flagship and Rebel Elites no longer try to escape if you are out of fuel (this mechanic which is meant to avoid stalemates ironically causes an even worse stalemate in the case of these enemies). This also solves a bug where you have no fuel while fighting the Phase 3 RFS, and win when it leaves.</li>
    <li>Added Speed UI from INS+/MV. Credit to JamesTripleQ, slowriderxcorps, Arc, Chrono Vortex (and anyone else that I missed). I have also improved its performance. At the start of each Civilian Sector, there will be an option to toggle which Speed UI variant you want:</li>
    <ol>
        <li>Disabled: Vanilla.</li>
        <li>Enabled Variant 1: There are 3 buttons for selecting preset speeds: 0.125x, 1x and 2x from left to right. You may bind a key to "Toggle Speedhack" in Options -> Configure Keyboard Hotkeys, to toggle between 1x speed and either 0.125x or 2x, whichever you used last (if it's your first time using this, or if you have reset speed to 1x with Variant 2, this won't have any effect).</li>
        <li>Enabled Variant 2: There are 2 buttons for adjusting speed, which range from -2 to 99 (although the actual max depends on certain settings, see note below). -2 = 0.125x, -1 = 0.5x, 0 = 1x, 1 = 1.5x, 2 and above = Number x (I think). Left click changes it by 1, right click changes it by 5. The power button has the same function as the "Toggle Speedhack" hotkey mentioned above, and they can be used interchangeably (white = speed changes enabled, grey = 1x always).</li>
        <li>NOTE: If you enabled the setting for VSync or Frame Limit in-game, or if you have set an FPS limit using an external program, the maximum speed will be dictated by that limit. 30FPS allows for 1x game speed at maximum, 60FPS allows for 2x, etc. So if you cap FPS at 30 to ensure level 1 Hacking can remove 2 shield layers, you will not be able to speed up (although slowing down is fine).</li>
    </ol>
</ol>

## Bugfixes (non-gameplay)
<ol>
    <li>Beam Drone 2, Small Bomb, Hull Beam, Stun Bomb, Ion Charger, Beam Projectiles, Explosions: Fixed animations.</li>
    <li>Ion Intruder Drone: Fixed bad pixels. Credit to Masala.</li>
    <li>Ship Upgrade Menu: Fixed misaligned Accept button base.</li>
    <li>Shifted misaligned crew sprites:</li>
    <ol>
        <li>Crystal: 1 left (except teleport sprites: 1 left, 5 down)</li>
        <li>Engi: 1 left, 1 up</li>
        <li>Lanius: 1 right, 2 up (except clone sprite: 1 left, 2 up)</li>
        <li>Mantis: 1 left (except clone sprite: 1 left, 2 up; and teleport sprites: 1 left, 5 down)</li>
        <li>Rock: 1 left, 1 up (except teleport sprites: 1 left, 3 down)</li>
        <li>Slug: 1 right</li>
    </ol>
    <li>Shifted misaligned shields vertically (more positive = more down) (technically has slight gameplay impact):</li>
    <ol>
        <li>Fed Cruisers: -3 to 0.</li>
        <li>Zoltan B: -13 to -14.</li>
        <li>Mantis Cruisers: -3 to 0.</li>
    </ol>
    <li>Fed Cruisers: Shield visually shorter by 1 pixel horizontally to match the ellipse size defined in the .txt.</li>
    <li>Zoltan, Slug, Rock and Crystal Cruisers: Fixed unsmooth shields.</li>
    <li>Ship floor images now have consistent width around walls and doors, and reveal more of the underlying art.</li>
    <li>Ships with symmetrical hulls, and rooms that don't match the symmetry, have their rooms shifted:</li>
    <ol>
        <li>Kestrel A: 1 down</li>
        <li>Kestrel C: 1 down</li>
        <li>Slug B: 3 up</li>
        <li>Stealth A: 2 up</li>
        <li>Stealth C: 2 up</li>
        <li>Lanius A: 1 up</li>
        <li>Lanius B: 1 up</li>
    </ol>
    <li>playerHpColorFix: HP color now scales according to a 3-third ratio instead of a hardcoded value.</li>
    <li>warningLightPositionFix: Warning lights that appear during a fire or breach are now positioned correctly.</li>
    <li>EVENTS:</li>
    <ol>
        <li>MERCHANT_REQUEST: Added text to an event where an "added quest marker" message has no accompanying text.</li>
        <li>PIRATE_CIVILIAN_BEACON: If you successfully scare off the pirate with the Weapons System blue option, then roll a "standard" autoReward, you will not be shown a preview of it.</li>
    </ol>
    <li>SHIPS:</li>
    <ol>
        <li>BOSS_SCOUT_RESCUE, JELLY, JELLY_UNLOCK1, PIRATE_SLAVER, PIRATE_SMUGGLE, REBEL, SQUAT_TRANSPORT: A generic gotaway message is now displayed if they successfully escape.</li>
    </ol>
    <li>TEXT</li>
    <ol>
        <li>Chinese language: now shows the ranking number for highscore ships.</li>
        <li>Korean language: autofire tooltip now includes hotkey information.</li>
    </ol>
</ol>

## QOL (non-gameplay)
<ol>
    <li>redesignedWeaponTooltips: Shows more information about weapons.</li>
    <li>redesignedDroneTooltips: Shows more information about drones.</li>
    <li>redesignedAugmentTooltips: Shows more information about augments.</li>
    <li>showReactor: Shows starting reactor and max reactor of ships in hangar.</li>
    <li>extraShipInfo: Shows missiles, drone parts, and crew limit of ships in hangar.</li>
    <li>showDummyEquipmentSlots: Show weapon/drone slots below "SYSTEM NOT INSTALLED" message, to show how many slots you would get if you obtain the system.</li>
    <li>renameShipInRun: Enable renaming your ship during a run, via a button beside the name.</li>
    <li>allowRenameInputSpecialCharacters: Allow special characters for names, such as Japanese.</li>
    <li>insertNewlineForMultipleCrewTooltips: Inserts a newline between each unit's description in a tooltip when mousing over a tile where multiple units are fighting.</li>
    <li>TEXT (includes changes for all languages unless otherwise stated):</li>
    <ol>
        <li>Augments Engi Med-bot Dispersal, Fire Suppression, Repair Arm and Slug Repair Gel have numbers that state their effectiveness (1.6 HP/s, 83% of baseline, 2 repairs, 75% of baseline respectively)</li>
        <li>Crystal description: stated Lockdown duration, and cooldown starting from when you use it (12s/50s); stated -50% suffocation damage and -17% firefighting speed.</li>
        <li>Lanius description: stated that oxygen drain is equivalent to a breach, and that it has -15% speed.</li>
        <li>Human description: stated +11% experience gain (they have -10% experience required).</li>
        <li>Rock description: stated +67% firefighting speed.</li>
        <li>Upgraded doors show their Easy/Normal/Hard hit points in brackets, e.g. Blast Doors (12/8/6).</li>
        <li>Added '%' after Engines dodge chance, hacked Pilot/Engines current evasion, and Pilot/Engines manning bonus.</li>
        <li>Added duration, health boost and damage boost to Mind Control level descriptions.</li>
        <li>More information about hacking targets:</li>
        <ol>
            <li>Oxygen: -6%/s</li>
            <li>Medbay: -12.8 HP/s</li>
            <li>Drones and Hacking: 39%/62%/77% chance of destroying the drone in a level 1/2/3 hack</li>
        </ol>
        <li>NPC Zoltan ships are now called Zoltan X instead of Energy X.</li>
        <li>Flagship class now shows game difficulty.</li>
    </ol>
</ol>

## Disabled HS defaults (I will remove them when future versions of HS have them disabled by default)
<ol>
    <li>console: Disabled console.</li>
    <li>dismissSound: The depressurization sound no longer plays when dismissing crew.</li>
    <li>hackingDroneFix: Hacking drones do not explode mid-flight if Hacking system is depowered. (This setting is re-enabled in the Balance mod (or at least, I'm considering at the time of writing).)</li>
    <li>repairDroneRecoveryFix: Drone Recovery Arm is not prevented from retrieving Hull Repair Drones that are still in the process of repairing your hull. (This setting is re-enabled in the Balance mod (or at least, I'm considering at the time of writing).)</li>
    <li>surgeDrones: Drone distribution of Phase 2 Flagship Power Surge is not fixed to 2/2 Combat/Beam Drones on Easy, 3/3 on Normal, 4/3 on Hard. Each drone has a 50% chance of being either.</li>
</ol>

## Bugfixes/QOL for mods (These have no effect on vanilla gameplay)
<ol>
    <li>altLockedMiniships: Prioritises the image with the "_base" postfix for locked miniships.</li>
    <li>oxygenWithoutSystem: Allows oxygen to function without a system.</li>
    <li>shieldWithoutSystem: Allows supershields to work even if no shield declared in a ship's shipBlueprint.</li>
    <li>droneSelectHotkeys: Allows selecting controllable crew drones with their hotkey.</li>
    <li>droneSaveStations: Allows the current stations of controllable crew drones to be saved.</li>
    <li>enemyPreigniterFix: Enemies are able to use the Weapon Pre-Igniter augment if they are defined to spawn with it.</li>
    <li>multiShipFix: Allows multiple ships to be loaded per beacon.</li>
    <li>scaleSlugGel: Slug Gel strength may now be edited by mods (value of 0.25 corresponds to vanilla speed).</li>
    <li>customChoiceColors: Enables coloring choices.</li>
    <li>customTextStyle: Enables coloring text.</li>
    <li>systemNoPurchaseThreshold: Visual fix for high system costs so that they are limited to a certain number of digits (I chose 3), and if it's any higher, the cost is replaced with "--".</li>
</ol>

#Balance Changes (Twinge)
Continued from Twinge's Balance and Bugfix Mod 4.0.2. This starts at 4.0.3 since it is not exactly the same, I fixed some errors in 4.0.2. Importantly, this now uses xml.append files instead of xml files, allowing it to be compatible with more mods. Most Bugfixes/QOL have been moved to the Bugfixes and QOL mod, and those that remain are what I think are not really bugs. (TODO, WIP)

## Gameplay Changes
<ol>
    <li>CREW:</li>
    <ol>
        <li>Human: Cost from 45 to 40.</li>
        <li>Mantis and Rock: Cost from 55 to 50.</li>
        <li>Engi: Rarity in Civilian and Pirate sectors from 2 to 3, rarity in Zoltan sectors from 3 to 2, rarity in Rebel sectors (including The Last Stand) from 2 to 4.</li>
        <li>Zoltan: Cost from 60 to 55.</li>
    </ol>
    <li>SYSTEMS (note that even though some system rarities are changed in the files, I don't think it actually changes anything):</li>
    <ol>
        <li>Artillery: level 2/3/4 cost from 30/50/80 to 20/40/65.</li>
        <li>Cloaking: Cost from 150 to 160, level 3 cost from 50 to 40.</li>
        <li>Doors: Rarity from 1 to 3, cost from 60 to 30, level 2/3 cost from 35/50 to 30/45.</li>
        <li>Drone Control: Rarity from 1 to 3, cost (excluding discounted drone) from 60 to 45, level 4/5/6/7/8 cost from 30/45/60/80/100 to 25/40/50/55/60.</li>
        <li>Engines: level 3/4/5/6/7/8/9 (9 for mods) cost from 15/30/40/60/80/120/150 to 20/35/45/55/65/80/100.</li>
        <li>Medbay: Rarity from 1 to 2, cost from 50 to 40, level 2/3 cost from 35/45 to 25/30.</li>
        <li>Oxygen: level 3/4 (4 for mods) cost from 50/75 to 30/35.</li>
        <li>Pilot: level 2/3 cost from 20/50 to 25/40.</li>
        <li>Sensors: Rarity from 1 to 3, cost from 40 to 35, level 2/3 cost from 25/40 to 20/25.</li>
        <li>Shields: Cost from 125 to 120, level 5/6/7/8 cost from 40/60/80/100 to 35/70/75/95.</li>
        <li>Teleporter: Cost from 90 to 80, level 3 cost from 60 to 40.</li>
    </ol>
    <li>WEAPONS:</li>
    <ol>
        <li>Ion Blast: Rarity from 3 to 2, projectile speed from 30 to 40.</li>
        <li>Ion Blast 2: Cost from 70 to 60, cooldown from 4 to 3.7, projectile speed from 30 to 40.</li>
        <li>Heavy Ion (renamed to Heavy Ion Stunner): Cost from 45 to 40, cooldown from 13s to 12s, stun chance from 20% to 100%, stun duration from 3s to 7s.</li>
        <li>Burst Laser 1: Cost from 50 to 60.</li>
        <li>Burst Laser 2: Cost from 80 to 100.</li>
        <li>Burst Laser 3: Rarity from 4 to 3, cost from 95 to 40, cooldown from 19s to 18s, fire chance from 0% to 10%.</li>
        <li>Heavy Laser 2: Rarity from 4 to 3.</li>
        <li>Heavy Pierce 1: stun chance from 0% to 20%.</li>
        <li>Hull Laser 2: Cost from 75 to 60, projectile speed from 90 to 75, breach chance from 27% to 36%.</li>
        <li>Crystal Burst 1: Cost from 20 to 30.</li>
        <li>Crystal Burst 2: Cost from 20 to 40, cooldown from 17s to 14s.</li>
        <li>Heavy Crystal 1: Cost from 20 to 30, breach chance from 10% to 20%.</li>
        <li>Heavy Crystal 2: Cost from 20 to 50, cooldown from 19s to 17s, shield piercing from 1 to 2, stun chance from 20% to 100%.</li>
        <li>Hermes Missile: Cost from 45 to 30.</li>
        <li>Pegasus Missile: Cost from 60 to 50, cooldown from 20s to 16s.</li>
        <li>Breach Missiles: Cost from 65 to 50, cooldown from 22s to 21s, fire chance from 30% to 0%, breach chance from 56% to 70%, stun chance from 10% to 20%.</li>
        <li>Hull Missiles: Cost from 65 to 40, cooldown from 17s to 14s, breach chance from 27% to 36%, stun chance from 10% to 30%.</li>
        <li>Small Bomb: Cost from 45 to 50.</li>
        <li>Fire Bomb: Rarity from 2 to 3, cost from 50 to 40, cooldown from 15s to 14s.</li>
        <li>Ion Bomb: Cost from 55 to 50, cooldown from 22s to 21s.</li>
        <li>Healing Burst: Rarity from 3 to 4, cost from 40 to 25, cooldown from 18s to 9s.</li>
        <li>Lock Bomb: Cost from 45 to 25, cooldown from 15s to 6s.</li>
        <li>Halberd Beam: Rarity from 2 to 4, cost from 65 to 85, cooldown from 17s to 18s.</li>
        <li>Glaive Beam: Cost from 95 to 80.</li>
        <li>Anti-Bio Beam: Cost from 50 to 40.</li>
        <li>Hull Beam: Cost from 70 to 65.</li>
    </ol>
    <li>DRONES:</li>
    <ol>
        <li>Boarder Drone (player only): power requirement from 3 to 2.</li>
        <li>Defense Drone 1 (player only): cooldown from 1s to 1.4s, projectile speed from 100 to 250.</li>
        <li>Defense Drone 1 (enemy only): cooldown from 1s to 1.4s, projectile speed from 100 to 500.</li>
        <li>Defense Drone 2 (enemy only): cooldown from 0.88s to 0.95s.</li>
    </ol>
    <li>AUGMENTS:</li>
    <ol>
        <li>Crystal Vengeance: Effect chance from 10% to 20%, breach chance from 10% to 100%.</li>
    </ol>
    <li>PLAYER SHIPS:</li>
    <ol>
        <li>Resized all shields except Engi Cruiser's:</li>
        <ol>
            <li>Kestrel: 700x440 -> 666x458</li>
            <li>Fed: 804x506 -> 760x478</li>
            <li>Zoltan: 640x400-> 608x386</li>
            <li>Mantis: 700x440 -> 664x472</li>
            <li>Slug: 654x436 -> 574x450</li>
            <li>Rock: 654x436 -> 604x446</li>
            <li>Stealth: 700x492 -> 680x476</li>
            <li>Lanius: 682x562 -> 628x510</li>
            <li>Crystal: 770x484 -> 680x474</li>
        </ol>
        <li>Repositioned all shields except Engi Cruiser's (values in x, y; higher x = more right, higher y = more down):</li>
        <ol>
            <li>Kestrel A and C: -30 0 -> -23 0</li>
            <li>Kestrel B: -30 0 -> -41 -1</li>
            <li>Fed A and C: -63 0 -> -75 0</li>
            <li>Fed B: -63 0 -> -67 0</li>
            <li>Zoltan A and C: -20 20 -> -15 16</li>
            <li>Zoltan B: -20 -14 -> -21 -18</li>
            <li>Mantis A, B and C: -83 0 -> -70 -1</li>
            <li>Slug A and C: -56 0 -> -69 0</li>
            <li>Slug B: -56 0 -> -48 -3</li>
            <li>Rock A and C: -42 0 -> -29 0</li>
            <li>Rock B: -42 0 -> -30 0</li>
            <li>Stealth A and C: -70 0 -> -73 -2</li>
            <li>Stealth B: -70 0 -> -60 1</li>
            <li>Lanius A: -30 0 -> -15 -1</li>
            <li>Lanius B: -30 0 -> -32 -1</li>
            <li>Crystal A: 22 -40 -> 5 -32</li>
            <li>Crystal B: 22 -40 -> 22 -32</li>
        </ol>
        <li>Shifted 1 door on Slug B.</li>
    </ol>
    <li>NPC SHIPS:</li>
    <ol>
    </ol>
    <li>EVENTS:</li>
    <ol>
    </ol>
</ol>

## Non-Gameplay Changes
<ol>
    <li>WEAPONS:</li>
    <ol>
        <li>Heavy Ion: renamed to Heavy Ion Stunner, graphics replaced to look like a stun weapon (credit to MantisManMike).</li>
        <li>Swarm Missiles: launch sound replaced.</li>
        <li>Glaive Beam: rgb color now 200, 0, 0.</li>
        <li>Fire Beam: rgb color now 245, 65, 0.</li>
        <li>Anti-Bio Beam: rgb color now 110, 255, 0.</li>
    </ol>
    <li>DRONES:</li>
    <ol>
    </ol>
    <li>AUGMENTS:</li>
    <ol>
    </ol>
    <li>PLAYER SHIPS:</li>
    <ol>
    </ol>
    <li>NPC SHIPS:</li>
    <ol>
    </ol>
    <li>EVENTS:</li>
    <ol>
    </ol>
    <li>MISC:</li>
    <ol>
        <li>Text has been added or changed to reflect gameplay changes, add/remove punctuation, or be more inclusive. Note that text changes are in English only.</li>
        <li>Main Menu image replaced to show the mod's name and version number.</li>
    </ol>
</ol>