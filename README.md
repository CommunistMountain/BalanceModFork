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
	<li>Anti-Ship Fire Drone: Now considered a combat drone for events.</li>
	<li>AE Weapons: No longer show up in Hidden Crystal Worlds stores.</li>
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
		<li>ENGI_STATION_DISTRESS, PIRATE_CIVILIAN_BEACON, REBEL_VS_FEDERATION, SLUG_DISTRESS_RESCUE, SLUG_DISTRESS_TRICK: Now appear at Distress Beacons on the map.</li>
		<li>ENGI_UNLOCK_1: Now unable to tell the difference between the real and fake ships through minor text differences, or based on when they decide to surrender.</li>
		<li>ESCORT_BEACON and QUEST_ESCORT: extended the conversation when you get the reactor upgrade outcome, so that revisiting the beacon multiple times will not upgrade your reactor again for free.</li>
		<li>MERCHANT_REQUEST: Added missing Lifeform Scanner blue option from the STATION_SICK event.</li>
		<li>ROCK_STARSHIP_MINE: Fixed missile option not requiring 1 missile.</li>
		<li>STORM_BOARDING, STORM_REBEL, STORM_SLUG_FIGHT: These events no longer appear to be at non-nebula beacons on the map in Slug Controlled Nebula and Slug Home Nebula, and will slow the Rebel fleet appropriately.</li>
		<li>AutoReward interactions with free weapon/drone/augment:</li>
		<ol>
			<li>Augment rewards outside autoReward now overwrite autoReward augments, instead of being overwritten by autoReward augments. Fixes events ENGI_UNLOCK_1, ENGI_VIRUS and NEBULA_SLUG_FIGHT_UNLOCK in rare cases.</li>
			<li>Weapon rewards outside autoReward no longer overwrite autoReward drones and augments. Fixes events CRYSTAL_CACHE and DONOR_MANTIS_CHASE in rare cases, and event CRYSTAL_HELP_DIG now gives an augment and high scrap with the free weapon as intended.</li>
			<li>Drone rewards outside autoReward no longer overwrite autoReward weapons and augments. Fixes event ZOLTAN_CREW_STUDY in rare cases.</li>
		</ol>		
		<li>CRYSTAL_CACHE, DISTRESS_INFESTATION, DISTRESS_TRAPPED_MINER, MERCHANT_REQUEST, ROCK_MANTIS_FREIGHTER, STATION_SICK: Fixed certain options having a chance of not consuming resources, if the reward after the choice includes that resource. (I used a custom autoReward for this, ideally HS can fix this in the future so that they aren't required.)</li>
	</ol>
	<li>SHIPS:</li>
	<ol>
		<li>Pirate Mantis Interceptor (MANTIS_SCOUT_P_DLC): Highest sector it can appear from 5 to 6.</li>
		<li>Rebel Disruptor (REBEL_FAT_DLC): Hacking max from 1 to 2</li>
		<li>Pirate Slug Instigator (JELLY_TRUFFLE_P_DLC): Pilot max from 1 to 3</li>
	</ol>
</ol>

## QOL (gameplay)
<ol>
	<li>Map: integrated Sleeper Games + MantisManMike's Enhanced Fleet Pursuit mod, showing the Rebel Fleet's position in future jumps.</li>
	<li>Mini-Beam: increased length from 45 to 47.</li>
	<li>Advanced Flak, Flak I, Flak II, Flak Artillery: removed fake projectiles.</li>
	<li>Shifted starting crew to generally better positions. Credit to MantisManMike. Order is Pilot, Engines, Weapons, Shields:</li>
	<ol>
		<li>Kestrel B: Human Human Zoltan Mantis -> HZHM</li>
		<li>Kestrel C: Human Lanius Human -> LHH</li>
		<li>Federation A: Human Mantis Rock Engi -> RMHE</li>
		<li>Federation B: Human Zoltan Slug -> SHZ</li>
		<li>Federation C: Human Zoltan Zoltan Mantis -> ZZMH</li>
		<li>Mantis A: Mantis Mantis Mantis Engi -> MMEM</li>
		<li>Rock C: Rock Rock Crystal -> RCR</li>
		<li>Stealth B: Human Human Zoltan -> HZH</li>
		<li>Stealth C: Human Rock Slug -> SHR</li>
		<li>Crystal A: Human Human Crystal Crystal -> CHCH</li>
	</ol>
	<li>(Not a feature of the mod, but HS itself: HS adds a magnifying glass at the bottom right of the screen during a run, which can be clicked to show you more info such as weapon cooldowns and beacon connections.)</li>
	<li>checkCargo: Include cargo weapons/drones for event checks.</li>
	<li>preIgniteChargers: Charge weapons can enter a fight fully charged if you have a Pre-Igniter.</li>
</ol>

## Bugfixes (non-gameplay)
<ol>
	<li>Anti-Ship Beam Drone II, Small Bomb, Hull Beam, Stun Bomb, Ion Charger, Beam Projectiles, Explosions: Fixed animations.</li>
	<li>Ion Intruder Drone: Fixed bad pixels. Credit to Masala.</li>
	<li>Ship Upgrade Menu: Fixed misaligned Accept button base.</li>
	<li>Shifted misaligned crew sprites:</li>
	<ol>
		<li>Crystal: 1 left, 2 up (except clone sprite: 1 left)</li>
		<li>Engi: 1 left, 1 up</li>
		<li>Lanius: 1 right, 2 up (except clone sprite: 1 left, 2 up)</li>
		<li>Mantis: 1 left, 2 up</li>
		<li>Rock: 1 left, 3 up (except clone sprite: 1 left, 1 up)</li>
		<li>Slug: 1 right</li>
	</ol>
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
	<li>shiftotherelementsslightlytotheleftsotheyrealigned: Fixes crew being visually offset.</li>
	<li>EVENTS:</li>
	<ol>
		<li>MERCHANT_REQUEST: Added text to an event where an "added quest marker" message has no accompanying text.</li>
		<li>PIRATE_CIVILIAN_BEACON: If you successfully scare off the pirate with the Weapons System blue option, then roll a "standard" autoReward, you will not be shown a preview of it.</li>
	</ol>
	<li>SHIPS:</li>
	<ol>
		<li>BOSS_SCOUT_RESCUE, JELLY, JELLY_UNLOCK1, PIRATE_SLAVER, PIRATE_SMUGGLE, REBEL, SQUAT_TRANSPORT: A generic gotaway message is now displayed if they successfully escape.</li>
	</ol>
</ol>

## QOL (non-gameplay)
<ol>
	<li>showReactor: Shows starting reactor and max reactor of ships in hangar.</li>
	<li>extraShipInfo: Shows missiles, drone parts, and crew limit of ships in hangar.</li>
	<li>showDummyEquipmentSlots: Show weapon/drone slots below "SYSTEM NOT INSTALLED" message, to show how many slots you would get if you obtain the system.</li>
	<li>renameShipInRun: Enable renaming your ship during a run, via a button beside the name.</li>
	<li>allowRenameInputSpecialCharacters: Allow special characters for names, such as Japanese.</li>
	<li>insertNewlineForMultipleCrewTooltips: Inserts a newline between each unit's description in a tooltip when mousing over a tile where multiple units are fighting.</li>
	<li>Rebel Flagship and Rebel Elites no longer try to escape if you are out of fuel (this mechanic which is meant to avoid stalemates ironically causes an even worse stalemate in the case of these enemies). This also solves a bug where you have no fuel while fighting the Phase 3 RFS, and win when it leaves.</li>
	<li>TEXT (includes changes for all languages unless otherwise stated):</li>
	<ol>
		<li>Crystal Lockdown power mentions the duration and the cooldown (starting from when you use it): (12s/50s)</li>
		<li>Lanius description: stated that oxygen drain is equivalent to a breach, and that it has -15% speed.</li>
		<li>Upgraded doors show their Easy/Normal/Hard hit points in brackets, e.g. Blast Doors (12/8/6).</li>
		<li>Added '%' after Engines dodge chance.</li>
		<li>Added duration, health boost and damage boost to Mind Control level descriptions.</li>
		<li>More information about hacking targets:</li>
		<ol>
			<li>Oxygen: -6%/s</li>
			<li>Medbay: -12.8 HP/s</li>
			<li>Drones and Hacking: 39%/62%/77% chance of destroying the drone in a level 1/2/3 hack</li>
		</ol>
		<li>NPC Zoltan ships are now called Zoltan X instead of Energy X.</li>
	</ol>
</ol>

## Disabled HS defaults (I will remove them when future versions of HS have them disabled by default)
<ol>
	<li>dismissSound: the depressurization sound no longer plays when dismissing crew.</li>
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
	<li>artilleryGibMountFix: Artillery weapons with linked gibs will not vanish when the ship explodes.</li>
	<li>multiShipFix: Allows multiple ships to be loaded per beacon.</li>
	<li>scaleSlugGel: Slug Gel strength may now be edited by mods (value of 0.25 corresponds to vanilla speed)</li>
	<li>systemNoPurchaseThreshold: Visual fix for high system costs so that they are limited to a certain number of digits (I chose 3), and if it's any higher, the cost is replaced with "--".</li>
</ol>

# Balance Changes (CM)
Coming Soon

#Balance Changes (Twinge)
Coming Soon