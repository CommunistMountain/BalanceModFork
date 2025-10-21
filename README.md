# BalanceModFork
2 mods for the game FTL: Faster Than Light: "Bugfixes and QOL" and "Balance Changes". Continuation of Twinge's Balance and Bugfix Mod.

The release has 2 separate mods. Use with [Slipstream Mod Manager](https://github.com/Vhati/Slipstream-Mod-Manager) or [FTL Mod Manager](https://github.com/afishhh/ftlman). Change the file extension from .zip to .ftl, or change the setting to consider .zip files as mods. They require the [Hyperspace mod](https://github.com/FTL-Hyperspace/FTL-Hyperspace) for many features, but it's technically optional. Major credit goes to the HS team for making many bugfixes/QOL possible.

If what you see in-game does not match the advertised description, please submit an issue, or contact me on Reddit (CommunistMountain) or Discord (communistmountain, formerly CommunistMountain#0463).

Mod order:
<ol>
	<li>Hyperspace (technically optional)</li>
	<li>Bugfix and QOL</li>
	<li>Balance Changes</li>
	<li>Other mods</li>
</ol>

# Bugfixes and QOL (non-HS-dependent)

## Bugfixes (gameplay)
<ol>
	<li>Hull Missile: Now considered a missile weapon for events.</li>
	<li>Anti-Ship Fire Drone: Now considered a combat drone for events.</li>
	<li>AE Weapons: No longer show up in Hidden Crystal Worlds stores.</li>
	<li>EVENTS:</li>
	<ol>
		<li>MERCHANT_DELIVER: Added missing Lifeform Scanner blue option from the STATION_SICK event.</li>
		<li>ALISON_DEFECTOR: Now unable to tell if the defector is lying or not about wanting to join you.</li>
		<li>REBEL_ENGI_UNLOCK: Now unable to tell the difference between the real and fake ships through minor text differences, or based on when they decide to surrender.</li>
		<li>CRYSTAL_HUNTER: Fight no longer continues after accepting their surrender offer.</li>
		<li>STORM_SLUG_FIGHT, STORM_REBEL, STORM_BOARDING: These plasma storm events no longer occur outside nebula.</li>
		<li>ESCORT_BEACON and QUEST_ESCORT: extended the conversation when you get the reactor upgrade outcome, so that revisiting the beacon multiple times will not upgrade your reactor again for free. (If an upgrade tag is part of the opening event at a beacon, it will not be cleared, which is an oversight by the developers.)</li>
	</ol>
</ol>

## QOL (gameplay)
<ol>
	<li>map_warningcircle.png and map_warningcircle_point.png: integrated Sleeper Games + MantisManMike's Enhanced Fleet Pursuit mod, showing the Rebel Fleet's position in future jumps.
	<li>Mini-Beam: increased length from 45 to 47, to remove the need for pixel-perfect positioning to maximise damage.
	<li>Advanced Flak, Flak I, Flak II, Flak Artillery: removed fake projectiles.
	<li>Shifted starting crew to generally better positions. Credit to MantisManMike. Order is Pilot, Engines, Weapons, Shields:
	<ol>
		<li>Kestrel B: Human Human Zoltan Mantis -> HZHM
		<li>Kestrel C: Human Lanius Human -> LHH
		<li>Federation A: Human Mantis Rock Engi -> RMHE
		<li>Federation B: Human Zoltan Slug -> SHZ
		<li>Federation C: Human Zoltan Zoltan Mantis -> ZZMH
		<li>Mantis A: Mantis Mantis Mantis Engi -> MMEM
		<li>Rock C: Rock Rock Crystal -> RCR
		<li>Stealth B: Human Human Zoltan -> HZH
		<li>Stealth C: Human Rock Slug -> SHR
		<li>Crystal A: Human Human Crystal Crystal -> CHCH
	</ol>
</ol>

## Bugfixes (non-gameplay)
<ol>
	<li>Anti-Ship Beam Drone II, Small Bomb, Hull Beam, Stun Bomb, Ion Charger, Beam Projectiles, Explosions: Fixed animations.
	<li>Lanius: Fixed bad alignment of sprites. Credit to MantisManMike.
	<li>Crystal, Engi, Human, Mantis, Rock, Zoltan: Fixed bad alignment of sprites in the Clone Bay queue. Credit to MantisManMike.
	<li>Ion Intruder Drone: Fixed bad pixels. Credit to Masala.
	<li>Ship Upgrade Menu: Fixed misaligned Accept button. Credit to MantisManMike.
	<li>EVENTS:
	<ol>
		<li>MERCHANT_INVESTIGATE: An event where a quest marker is added had no accompanying text, causing blank lines at the top of the textbox. Added text to solve this.
	</ol>
	<li>SHIPS:
	<ol>
		<li>BOSS_SCOUT_RESCUE, PIRATE_SLAVER, PIRATE_SMUGGLE, REBEL, SQUAT_TRANSPORT, JELLY, JELLY_UNLOCK1: A generic gotaway message is now displayed if they successfully escape.
	</ol>
</ol>

# Bugfixes and QOL (HS-dependent)

## Bugfixes (gameplay)
<ol>
	<li>hackingIonFix: Prevents ionisation from resetting Hacking cooldown.
	<li>crystalShardFix: Crystal Shards are considered player projectiles and not neutral, so that they will not be targeted by friendly defense drones or block your projectiles.
	<li>defenseDroneFix: Defense drones no longer have a blind spot (doesn't work at the time of writing, hopefully it will be in the future)
	<li>cloakRenderFix: Cloaking while no crew is on board no longer hides rooms.
	<li>disableDefaultTutorial: HS breaks the tutorial. This replaces it with a custom tutorial (still incomplete at the time of writing though).
	<li>multipleOverCapacity: If you are over capacity on 2+ weapons/drones/augments, multiple Over Capacity boxes will contain all new items, allowing you to pick which ones to leave behind. If you are at a store, you also get the chance to sell what is in the Over Capacity boxes.
	<li>EVENTS:
	<ol>
		<li>AutoReward interactions with free weapon/drone/augment:</li>
		<ol>
			<li>Augment rewards outside autoReward now overwrite autoReward augments, instead of being overwritten by autoReward augments. (Fixes events ENGI_UNLOCK and ENGI_VIRUS in rare cases.)
			<li>Weapon rewards outside autoReward no longer overwrite autoReward drones and augments. (Fixes events CRYSTAL_CACHE (in rare cases) and CRYSTAL_HELP_DIG (waiting until the end now gives an augment and high scrap, on top of the free weapon).)
			<li>Drone rewards outside autoReward no longer overwrite autoReward weapons and augments. (Fixes event ZOLTAN_CREW_STUDY in rare cases.)
		</ol>		
		<li>DISTRESS_TRAPPED_MINER, DISTRESS_INFESTATION, STATION_SICK, ROCK_MANTIS_FREIGHTER, CRYSTAL_CACHE: These events have instances of autoReward and item_modify in the same event block, where the autoReward could give the same resource that item_modify is changing. If that happens (2/3 chance), the cost of these events (-1 drone part, or up to -100 fuel) are overwritten by the gain in that resource (although you still need to have at least 1 drone part to pick the drone part choices). Added custom rewards so that autoReward factors in item_modify's costs if certain resources are rolled. Hopefully Hyperspace can fix this bug in future versions without needing custom rewards.
	</ol>
</ol>

## QOL (gameplay)
<ol>
	<li>(Hyperspace adds a magnifying glass at the bottom right of the screen during a run, which can be clicked to show you more info such as weapon cooldowns and beacon connections.)
	<li>checkCargo: Include cargo weapons/drones for event checks.
	<li>preIgniteChargers: Charge weapons can enter a fight fully charged if you have a Pre-Igniter. (The Sven maneuver only brings it to an almost-charged state)
</ol>

## Bugfixes (non-gameplay)
<ol>
	<li>playerHpColorFix: HP color now scales according to a 3-third ratio instead of a hardcoded value.
	<li>warningLightPositionFix: Warning lights that appear during a fire or breach are now positioned correctly.
	<li>shiftotherelementsslightlytotheleftsotheyrealigned: Fixes crew being visually offset.
</ol>

## QOL (non-gameplay)
<ol>
	<li>showReactor: Shows starting reactor and max reactor of ships in hangar.
	<li>extraShipInfo: Shows missiles, drone parts, and crew limit of ships in hangar.
	<li>showDummyEquipmentSlots: Show weapon/drone slots below "SYSTEM NOT INSTALLED" message, to show how many slots you would get if you obtain the system.
	<li>renameShipInRun: Enable renaming your ship during a run, via a button beside the name.
	<li>allowRenameInputSpecialCharacters: Allow special characters for names, such as Japanese.
	<li>insertNewlineForMultipleCrewTooltips: Inserts a newline between each unit's description in a tooltip when mousing over a tile where multiple units are fighting.
	<li>Rebel Flagship and Rebel Elites no longer try to escape if you are out of fuel (this mechanic which is meant to avoid stalemates ironically causes an even worse stalemate in the case of these enemies). This also solves a bug where you have no fuel while fighting the Phase 3 RFS, and win when it leaves (since it doesn't leave now).
</ol>

## Disabled HS defaults (I will remove them when future versions of HS have them disabled by default)
<ol>
	<li>dismissSound: the depressurization sound no longer plays when dismissing crew.
	<li>hackingDroneFix: Hacking drones do not explode mid-flight if Hacking system is depowered. (This setting is re-enabled in the Balance mod (or at least, I'm considering at the time of writing).)
	<li>repairDroneRecoveryFix: Drone Recovery Arm is not prevented from retrieving Hull Repair Drones that are still in the process of repairing your hull. (This setting is re-enabled in the Balance mod (or at least, I'm considering at the time of writing).)
	<li>surgeDrones: Drone distribution of Phase 2 Flagship Power Surge is not fixed to 2/2 Combat/Beam Drones on Easy, 3/3 on Normal, 4/3 on Hard. Each drone has a 50% chance of being either.
</ol>

## Bugfixes/QOL for mods (These have no effect on vanilla gameplay)
<ol>
	<li>altLockedMiniships: Prioritises the image with the "_base" postfix for locked miniships.
	<li>oxygenWithoutSystem: Allows oxygen to function without a system.
	<li>shieldWithoutSystem: Allows supershields to work even if no shield declared in a ship's shipBlueprint.
	<li>droneSelectHotkeys: Allows selecting controllable crew drones with their hotkey.
	<li>droneSaveStations: Allows the current stations of controllable crew drones to be saved.
	<li>enemyPreigniterFix: Enemies are able to use the Weapon Pre-Igniter augment if they are defined to spawn with it.
	<li>artilleryGibMountFix: Artillery weapons with linked gibs will not vanish when the ship explodes.
	<li>multiShipFix: Allows multiple ships to be loaded per beacon.
	<li>scaleSlugGel: Slug Gel strength may now be edited by mods (value of 0.25 corresponds to vanilla speed)
	<li>systemNoPurchaseThreshold: Visual fix for high system costs so that they are limited to a certain number of digits (I chose 3), and if it's any higher, the cost is replaced with "--".
</ol>

# Balance Changes

Coming Soon
