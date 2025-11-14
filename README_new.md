# Balance Changes (CM)
<ol>
    <li>REWARDS (TODO remember to edit the custom rewards.):</li>
    <ol>
        <li>Scrap Curve: Hard mode base value changed from 15 in sectors 1 and 2, then +6 for each sector after 2, to 15 in sector 1, then +4 for each sector after 1. (Change: 0%/+26.67%/+9.52%/0%/-6.06%/-10.26%/-13.33%/-15.69%).</li>
        <li>Scrap: Low range from 50%-70% of base value to 50%-75%. Medium range from 80%-130% of base value to 75%-130%. (Change: Low +4.17%, Medium -2.38%, Random 0%)</li>
        <li>Fuel: Low range from 1-3 to 2. High range from 3-6 to 4. (Change: Low 0% (more consistent), High -11.11%, Random -5.26%)</li>
        <li>Missiles: Low range from 1-2 to 1-3. Medium range from 2-4 to 3-5. High range from 4-8 to 5-7. (Change: Low +33.33%, Medium +33.33%, High 0% (more consistent), Random +14.29%)</li>
        <li>Drone Parts: Medium range from 1 to 1-2. High range from 1-2 to 2. (Change: Medium +50%, High +33.33%, Random +28.57%)</li>
    </ol>
    <li>STORE:</li>
    <ol>
        <li>Missiles: Cost from 6 to 4. Store stock from 2-6 to 4-8.</li>
        <li>Drone Parts: Cost from 8 to 6. Store stock from 2-4 to 3-5.</li>
        <li>Drone Control: Boarding Drone is now a possible discounted drone that can be packaged with Drone Control.</li>
    </ol>
    <li>SYSTEMS:</li>
    <ol>
        <li>Backup Battery: Cost from 35 to 50. Now includes the effects of Battery Charger.</li>
        <li>Doors: Cost from 60 to 45.</li>
        <li>Sensors: Cost from 40 to 30. Level 3 cost from 40 to 30.</li>
        <li>Pilot: Level 2 cost from 20 to 35.</li>
        <li>Oxygen: Level 3 cost from 50 to 30.</li>
        <li>Engines: Level 4/5/6/7/8 cost from 30/40/60/80/120 to 55/25/20/20/35.</li>
        <li>Hacking: Cost of deploying hacking drone from 1 to 2. Drone will explode if the system is depowered while the drone is mid-flight. (TODO ensure cost increase works for enemies? try editing power tag in dlcBlueprints.xml DRONE_HACKING. Or see https://github.com/FTL-Hyperspace/FTL-Hyperspace/wiki/Lua-Hyperspace-Module hacking int spenddrone)</li>
        <li>Artillery: Level 2/3/4 cost from 30/50/80 to 15/25/50.</li>
    </ol>
    <li>WEAPONS:</li>
    <ol>
        <li>Enemy Artemis: Renamed to "Artemis-". Rarity from 0 to 2 (now available in stores and random rewards), costs 38. (TODO: add to missile lists if it's not in them.)</li>
        <li>Ion Blast 2: Cost from 70 to 60, power requirement from 3 to 2.</li>
        <li>Heavy Ion: Cooldown from 13s to 10s.</li>
        <li>Chain Ion: Cooldown from 14s to 8s.</li>
        <li>Laser Charger: Fire chance from 0% to 10%.</li>
        <li>Laser Charger (S): Cost from 30 to 60 (sell price from 15 to 30). Fire chance from 0% to 10%.</li>
        <li>Basic Laser: Cost from 20 to 30 (sell price from 10 to 15).</li>
        <li>Dual Lasers: Cost from 25 to 60 (sell price from 12 to 30).</li>
        <li>Burst Laser 1: Rarity from 1 to 3.</li>
        <li>Burst Laser 3: Rarity from 4 to 2, cost from 95 to 70, projectiles from 5 to 6, fire chance from 0% to 10%.</li>
        <li>Heavy Laser 1: Rarity from 2 to 4.</li>
        <li>Hull Laser 1: Rarity from 2 to 3, cooldown from 14s to 15s, projectile speed from 75 to 90, fire chance from 0% to 10%, breach chance from 20% to 18%.</li>
        <li>Chain Vulcan: Rarity from 5 to 3, cost from 95 to 80. Starting cooldown from 11.1s to 9.1s, number of shots needed to get to 1.1s cooldown from 5 to 4 (total duration from 35.5s to 24.4s).</li>
        <li>Advanced Flak, Flak 1, Flak 2, Flak Artillery: removed fake projectiles.</li>
        <li>Advanced Flak: Cooldown from 8s to 5s, projectiles from 3 to 2.</li>
        <li>Flak 1: Rarity from 1 to 4, cost from 65 to 80.</li>
        <li>Flak 2: Cost from 80 to 70.</li>
        <li>Flak Artillery: shield piercing from 0 to 5, damage from 1 to 0, now heals your crew by 150 per projectile. (TODO check if it's enough that it hits a room, or it needs to hit the tile to work. If the former, heal can afford to be less) (TODO 2 find out how to apply heal, maybe need LUA, and remove persDamage since it doesnt work)</li>
        <li>Crystal weapons: Cost from 20 to 50.</li>
        <li>Heavy Crystal 2: Rarity from 5 to 4, power requirement from 3 to 2.</li>
        <li>Hull Missile: Cost from 65 to 50, cooldown from 17s to 14s.</li>
        <li>Pegasus Missile: Cooldown from 20s to 16s.</li>
        <li>Breach Missiles: Cost from 65 to 50, cooldown from 22s to 18s, breach chance from 56% to 70%.</li>
        <li>Swarm Missiles: Projectile speed from 45 to 35, stun chance from 0% to 10%.</li>
        <li>Healing Burst: Rarity from 3 to 1, cooldown from 18s to 9s.</li>
        <li>Repair Burst: Rarity from 3 to 1, cooldown from 14s to 4s. Now also instantly puts out fires, seals breaches, and sets the room's oxygen amount to 100% (though if it's a room with open external doors, it will become instantly vacuum again). (TODO: test if all these features work. Also check that o2 works against auto and lanius)</li>
        <li>Breach Bomb 1: Power requirement from 1 to 2, system damage from 1 to 2.</li>
        <li>Fire Bomb: System damage from 0 to 1 (now does damage to supershields because of this), crew damage from 30 to 15.</li>
        <li>Ion Bomb: Cooldown from 22s to 20s.</li>
        <li>Stun Bomb: Cooldown from 17s to 15s.</li>
        <li>Lock Bomb: Cooldown from 15s to 12s.</li>
        <li>Small Bomb: Rarity from 1 to 4, cost from 45 to 70, fire chance from 10% to 0%.</li>
        <li>Mini-Beam: Cost from 20 to 60 (sell price from 10 to 30). Fire chance from 10% to 0%.</li>
        <li>Hull Beam: Cooldown from 14s to 16s.</li>
        <li>Halberd Beam: Rarity from 2 to 4, cost from 65 to 80.</li>
        <li>Glaive Beam: Rarity from 5 to 3, cost from 95 to 75, cooldown from 25s to 24s, split into 8s over 3 charges. Its damage is equal to the number of charges. (todo fix the targeting bug)</li>
        <li>Fire Beam: Cooldown from 20s to 18s, speed from 5 to 7, fire chance from 80% to 90%.</li>
        <li>Anti-Bio Beam: Rarity from 5 to 4.</li>
    </ol>
    <li>DRONES:</li>
    <ol>
        <li>Beam Drone 1, Beam Drone 2: Fire chance from 10% to 0%.</li>
        <li>Combat Drone 2, Beam Drone 2: Rarity from 5 to 4.</li>
        <li>Fire Drone: Power requirement from 3 to 2.</li>
        <li>Defense Drone 1: Rarity from 1 to 3, speed from 5 to 6.</li>
        <li>Defense Drone 2: Cooldown from 0.88s to 0.7s.</li>
        <li>Shield Drones: causes -2% evasion per layer (general change for all supershields), speed from 5 to 8, cooldown per layer changed from 8/10/13/16/20s to 6/8/10/12/14s.</li>
        <li>Hull Repair Drone: Cost from 85 to 40. Power requirement from 2 to 1. Drone Recovery Arm no longer retrieves it if you jump while it is repairing.</li>
        <li>System Repair Drone: Cost from 30 to 20.</li>
        <li>Anti-Personnel Drone: Power requirement from 2 to 1.</li>
        <li>Boarding Drone: Cost from 70 to 30. 1 drone part will be retrieved at the end of combat if it is not destroyed. (todo BOARDER_RECOVERY for all ships. TODO 2 test if it retrieves at the end of fight (correct) or when jumping (wrong))</li>
        <li>Ion Intruder Drone: Cost from 65 to 40. 1 drone part will be retrieved at the end of combat if it is not destroyed.</li>
    </ol>
    <li>AUGMENTS:</li>
    <ol>
        <li>(TODO for all new rarity 0 augments, check that they are not present in any augment list, or if they are, check that it's OK to leave them there. If not, DELETE.)</li>
        <li>Almost all ship types now have hidden augments (don't take up slots, but are unsellable) that are now unavailable in stores and random rewards, but can be obtained from events. All other augments are removed from ships, except Long-Ranged Scanner, and Slug B's new augments. The consequences of these changes are listed under subpoints:</li>
        <ol>
            <li>Kestrel Cruisers: added hidden Advanced FTL Navigation (which now includes the effects of FTL Jammer and FTL Recharge Booster).</li>
            <ol>
                <li>Advanced FTL Navigation: rarity from 3 to 0.</li>
                <li>FTL Jammer: rarity from 3 to 0.</li>
                <li>FTL Recharge Booster: rarity from 2 to 0.</li>
            </ol>
            <li>Engi A, Engi C: added hidden Drone Reactor Booster. Engi B: Drone Reactor Booster is now hidden.</li>
            <ol>
                <li>Engi NPC ships now have Drone Reactor Booster.</li>
                <li>Engi A and Engi NPC ships no longer have Engi Med-bot Dispersal.</li>
                <li>Engi C no longer has Defense Scrambler.</li>
            </ol>
            <li>Fed Cruisers: System limit from 8 to 9. Effectively, Artillery System doesn't take a system slot. (Not an augment, but I'm including it here for the sake of consistency)</li>
            <ol>
                <li>Fed C no longer has Emergency Respirators.</li>
            </ol>
            <li>Zoltan Cruisers: Zoltan Shield is now hidden.</li>
            <li>Mantis Cruisers: Mantis Pheromones is now hidden. Mantis Pheromones now includes the effects of Fire Suppression.</li>
            <ol>
                <li>Mantis NPC ships now have the effects of Fire Suppression.</li>
                <li>Fire Suppression: rarity from 3 to 0.</li>
            </ol>
            <li>Slug Cruisers: Slug Repair Gel is now hidden. Added Backup DNA Bank and Engi Med-bot Dispersal to Slug B.</li>
            <li>Rock Cruisers: Rock Plating is now hidden. Rock Plating now includes the effects of Explosive Replicator.</li>
            <ol>
                <li>Rock NPC ships now have the effects of Explosive Replicator. (TODO test if NPC can use it)</li>
                <li>Explosive Replicator: rarity from 3 to 0.</li>
            </ol>
            <li>Stealth A: Titanium System Casing is now hidden. Stealth B, Stealth C: added hidden Titanium System Casing.</li>
            <li>Crystal Cruisers: Crystal Vengeance is now hidden.</li>
            <ol>
                <li>Crystal NPC ships now have Crystal Vengeance.</li>
            </ol>
            <li>Lanius Cruisers: added hidden Reconstructive Teleport, removed Emergency Respirators.</li>
            <ol>
                <li>Lanius NPC ships now have Reconstructive Teleport.</li>
                <li>Reconstructive Teleport: Rarity from 3 to 0.</li>
            </ol>
        </ol>
        <li>Changes for hidden augments:</li>
        <ol>
            <li>All hidden augments now cost 50 (and thus sell for 25 if obtained from an event).</li>
            <li>Advanced FTL Navigation: Travelling to a previously visited beacon refunds 1 fuel (you still need 1 fuel to make the jump) and delays the Rebel Fleet by 1. (Beacons that are about to be taken over will still have ASB and an Elite upon arrival.)</li>
            <li>Crystal Vengeance: fires 2 projectiles instead of 1 (todo test), breach chance from 10% to 100%.</li>
            <li>Drone Reactor Booster: Crew drone speed boost from +25% to +100%, and also gives +20% damage. Combat drones and defense drones shoot 20% faster. (TODO see if it can be applied to all drones, or just a subset. Reference slow's INS+ DRB)</li>
            <li>Explosive Replicator (component of Rock Plating): Effect chance from 50% to 20%.</li>
            <li>Fire Suppression (component of Mantis Pheromones): Fire extinguishing speed from 83% of Human to 50% of Human.</li>
            <li>Slug Repair Gel: Now prevents Sensors from being disabled by nebula or events (it will still be disabled by hacking). Sensors and Doors behave as though they are always manned.</li>
            <li>Zoltan Shield: causes -2% evasion per layer (general change for all supershields).</li>
        </ol>
        <li>These augments are now stackable. Most of their effects will not change when having multiple, it simply means they will not be immediately converted into 25 scrap when you get a duplicate.</li>
        <ol>
            <li>Backup DNA Bank</li>
            <li>Defense Scrambler</li>
            <li>Distraction Buoys</li>
            <li>Drone Recovery Arm</li>
            <li>Engi Med-bot Dispersal: Heal stacks.</li>
            <li>Hacking Stun (todo ensure drone part reduction doesn't go below 1 when implementing my change)</li>
            <li>Lifeform Scanner</li>
            <li>Long-Ranged Scanners</li>
            <li>Stealth Weapons</li>
            <li>Weapon Pre-Igniter</li>
            <li>Zoltan Shield Bypass</li>
        </ol>
        <li>Added Advanced FTL Navigation 2 to stores and random rewards, which allows you to jump to any beacon, by spending fuel equal to the shortest number of jumps to that beacon. Rarity 3, cost 30. Stackable, but having multiple does not change it's effect. (TODO add to augment lists if needed) (TODO 2 add this to ESCORT_BEACON blue option like Adv FTL Nav 1)</li>
        <ol>
            <li>NOTE: If you also have Advanced FTL Navigation, it will NOT take the distance between your destination and the nearest visited beacon from that destination. You will need to manually jump to the visted beacon nearest to the destination first.</li>
        </ol>
        <li>Automated Reloader: Rarity from 2 to 4, cost from 40 to 60.</li>
        <li>Battery Charger: Rarity from 2 to 0.</li>
        <li>Damaged Stasis Pod: Cost from 30 to 0 (sell price from 15 to 0).</li>
        <li>Distraction Buoys: Cost from 55 to 40.</li>
        <li>Emergency Respirators: damage taken from lack of oxygen from -50% to -80%. Rarity from 2 to 4.</li>
        <li>Engi Med-bot Dispersal: Now works for your crew on enemy ships. Rarity from 0 to 2 (now available in stores and random rewards). Cost from 60 to 40. (TODO add to augment lists if needed)</li>
        <li>Hacking Stun: Now also sets the cost of deploying Hacking drone from 2 back to 1.</li>
        <li>Lifeform Scanner: Rarity from 3 to 1. Cost from 40 to 20.</li>
        <li>Long-Ranged Scanners: Rarity from 1 to 3.</li>
        <li>Repair Arm: Scrap penalty from -15% to -5%.</li>
        <li>Reverse Ion Field: Effect chance from 50% to 100%.</li>
        <li>Scrap Recovery Arm: Rarity from 1 to 3. Scrap bonus from +10% to +15%.</li>
        <li>Zoltan Shield Bypass: Rarity from 3 to 1. Cost from 55 to 40.</li>
    </ol>
    <li>PLAYER SHIPS (other than augment changes above):</li>
    <ol>
        <li>Kestrel A: Crew from 3 Humans to 2 Humans.</li>
        <li>Kestrel B: Removed Doors.</li>
        <li>Kestrel C: Weapons from 1 Dual Lasers and 1 Ion Stunner to 4 Ion Stunners. Weapon Control level from 2 to 4. Reactor from 7 to 8. Sensors level from 2 to 1.</li>
        <li>Engi A: Reactor from 10 to 9.</li>
        <li>Engi B: Engines level from 1 to 2. Pilot level from 1 to 2. Added level 1 Sensors.</li>
        <li>Fed A: Weapon Control level from 3 to 4. Removed Doors.</li>
        <li>Fed B: Missiles from 9 to 14. Reactor from 9 to 8.</li>
        <li>Fed C: Artillery level from 1 to 4.</li>
        <li>Zoltan A: Doors level from 2 to 1. Engines level from 1 to 2.</li>
        <li>Zoltan B: Starts with Long-Ranged Scanners. Starts with no Shields instead of weak Shields (TODO remember to set the level of shields to 2 in files)</li>
        <li>Mantis A: Weapon slots from 3 to 4. Crew from 3 Mantis 1 Engi to 2 Mantis 1 Engi (rearranged crew positions from MMEM to EMM). Added level 1 Sensors.</li>
        <li>Mantis B: Engines level from 1 to 2. Medbay level from 1 to 2. Reactor 11 to 9.</li>
        <li>Slug Cruisers: Doors level from 2 to 1.</li>
        <li>Rock B: Added an external door to the Backup Battery room. (TODO remember to change floor image) Oxygen level from 2 to 1.</li>
        <li>Stealth A: Engines level from 4 to 3, Weapon Control from level 2 to 3, weapon slots from 3 to 4. Weapons from 1 Mini-Beam and 1 Dual Lasers to 1 Mini-Beam and 2 Basic Lasers.</li>
        <li>Stealth B: Weapon slots from 3 to 4. Engines level from 2 to 3.</li>
        <li>Stealth C: Added level 2 Sensors.</li>
        <li>Crystal A: Removed Doors.</li>
        <li>Crystal B: Weapon slots from 4 to 3. Medbay level from 1 to 2.</li>
        <li>Lanius A: Crew from 1 Human 2 Lanius to 1 Lanius. Pilot level from 1 to 2. Engines level from 1 to 2.</li>
        <li>Lanius B: Removed Clone Bay. Teleporter level from 1 to 3. Engines level from 1 to 2. Added level 1 Sensors.</li>
    </ol>
    <li>NPC SHIPS:</li>
    <ol>
        <li>Engi NPC ships: May now spawn with Anti-Personnel Drones.</li>
        <li>Lanius Bomber: Crew range from 3-4 to 3.</li>
        <li>Mantis Fighter and Mantis Interceptor (and pirate versions): Medical systems are now optional instead of guaranteed.</li>
        <li>Slug Interceptor and Slug Scout: Added doors connecting Oxygen and Engines.</li>
        <li>Rock Assault (Elite): Crew range from 4 to 5.</li>
        <li>Auto-ships: Removed doors.</li>
        <li>Auto-scout and Auto-surveyor: Shields are now guaranteed.</li>
        <li>Auto-ships, and Flagship when automated: now able to fix breaches, at about 1/3 of Human. (TODO Custom value version of 0.083 (check that more decimal places than 2 are allowed?). Call it SLUG_GEL_SLOW)</li>
        <li>Flagship: Oxygen is disabled when it becomes automated. (TODO at start of P2 and P3 event (before automated popup) check if the crew is already dead. If so, instantly set the oxygen to 0 with LUA instead of waiting for oxygen to drain)</li>
        <li>Flagship (Non-AE Easy version): Shield layers from 3 to 4, reactor from 40/42/29 to 42/44/31 for each Phase.</li>
        <li>Flagship (Hard version): In Phase 1, there are extra rooms between each side's 2 Artilleries, connecting all of them, and no room between laser/missile Artilleries and Shields. In Phase 2, the left extra room will be destroyed, but a new room will appear between laser Artillery and Shields. Likewise for the right extra room in Phase 3, so Phase 3 has vanilla Hard's layout.</li>
        <li>Flagship (Phase 3): supershield causes -2% evasion per layer (general change for all supershields).</li>
    </ol>
    <li>EVENTS:</li>
    <ol>
        <li>(TODO more events for Lifeform Scanner just like Twinge. Like wherever a Slug is used, LRS, high level sensors, or even more, like people hiding in crates.)</li>
        <li>All sectors have 2 guaranteed stores, except for Sector 1 and Sector 8 which have 1 guaranteed store:</li>
        <ol>
            <li>Sector 1: from 1-2 to 1.</li>
            <li>Non-Sector 1 Civilian, Engi and Crystal Sectors: from 2-3 to 2.</li>
            <li>Mantis, Pirate and non-Sector 8 Rebel Sectors: from 1-2 to 2.</li>
            <li>Slug Sectors: from 0-1 to 0 (in non-nebula).</li>
            <li>Uncharted Nebula Sectors: from 0-1 to 1 (in non-nebula).</li>
        </ol>
        <li>Uncharted Nebula has 2-4 empty beacons (in nebula only), Slug sectors have 1-2 empty beacons in non-nebula and 1-2 in nebula, and all other sectors have 1-2 empty beacons (in non-nebula only).</li>
        <ol>
            <li>Uncharted Nebula sector: empty beacon range from 4 to 2-4.</li>
            <li>Slug sectors: non-nebula empty beacon range from 0-2 to 1-2, nebula empty beacon range from 2-4 to 1-2.</li>
            <li>Mantis and Rock sectors: empty beacon range from 2-3 to 1-2.</li>
            <li>Crystal sector: empty beacon range from 2 to 1-2.</li>
        </ol>
        <li>If the damaged teleporter softlock prevention event happens, you will lose 1 fuel (unless you have 0).</li>
        <li>ASTEROID_DERELICT_SHIP: When you choose to "Grab the stasis chamber", you have a 10% chance getting Ruwen immediately instead of the Stasis Pod.</li>
        <li>AUTO_HACKER: Now disables 1 level of your Shields, instead of half of your Shield levels rounded up.</li>
        <li>CRYSTAL_CACHE: Engines blue option level requirement from 7 to 4.</li>
        <li>FLAGSHIP_CONSTRUCTION: Defeating the Flagship under construction will give Advanced FTL Navigation, and fleet delay from 2 to 1.</li>
        <li>FUEL_FOR_DRONE: Drone parts received from 1-3 to 2-4.</li>
        <li>LANIUS_RESEARCHER_CRAFT: Choosing to craft an augment now always gives Reconstructive Teleport instead of a random AE augment.</li>
        <li>NEBULA_SLUG_FIGHT_UNLOCK: Completing the event chain gives Anti-Bio Beam on top of other rewards.</li>
        <li>QUEST_CREWDEAD_START: Fire Beam and Fire Drone also allow you to pick the Fire Bomb blue option (renamed to simply "Fire") (TODO make a custom req which includes all; Fire Drone will need its own custom req which sees if there's a Drone System.).</li>
        <li>ROCK_CRYSTAL_BEACON: This event may be revisited if you choose not to scrap the ancient device. (TODO use playervariable "unscrapped=true". If it's Rock Home, find the location of this event. Then, every time you visit the event (except waiting at the beacon when out of fuel), if this is true, start this event. Picking the "scrap" option will set the variable to false, via custom event (currently it's renameEvent but maybe it should be a simple event start))</li>
        <li>ROCK_STARSHIP_MINE: Engines blue option level requirement from 5 to 3.</li>
        <li>ROCK_UNLOCK: Completing the event chain gives a Rock crew and Fire Bomb on top of other rewards.</li>
        <li>SELL_DRONES_STATION: Scrap per drone part from 4 to 3.</li>
        <li>SELL_MISSILES_STATION: Scrap per missile from 3 to 2.</li>
        <li>TAVERN_HIRE: Cost ranges from 25-45 and 25-55 to 20-40 for both.</li>
        <li>TRADER_UPGRADES: All cost ranges are now 40%-80% of the normal cost.</li>
        <ol>
            <li>Oxygen: Level 2 from 15-20 to 10-20, level 3 from 25-40 to 12-24.</li>
            <li>Sensors: Level 3 from 35-45 to 12-24.</li>
            <li>Doors: Level 2 from 8-15 to 14-28, level 3 from 25-40 to 20-40.</li>
            <li>Pilot: Level 2 from 8-15 to 14-28, level 3 from 25-40 to 20-40.</li>
            <li>Reactor: From 15-25 for all levels to 12-24/8-16/10-20/12-24/14-28 for levels 1-5/6-10/11-15/16-20/21-25.</li>
        </ol>
        <li>ZOLTAN_BOARDERS: Number of Zoltan boarders from 3-4 to 3.</li>
        <li>ZOLTAN_BOARDERS_MANTIS: Number of Mantis boarders from 2-3 to 2.</li>
        <li>ZOLTAN_PEACE_QUEST: Zoltan Shield outcome: no longer has low scrap autoReward. Envoy outcome: now also gives Zoltan Shield, but no longer has high standard autoReward.</li>
    </ol>
</ol>
