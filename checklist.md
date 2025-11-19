# Balance Changes (CM)
<ol>
    <li>TODO change text for everything in readme_new that needs it</li>
    <li>WEAPONS:</li>
    <ol>
        <li>Enemy Artemis: Renamed to "Artemis-". (TODO: add to missile lists if it's not in them.)</li>
        <li>Flak Artillery: shield piercing from 0 to 5, damage from 1 to 0, now heals your crew by 150 per projectile. (TODO check if it's enough that it hits a room, or it needs to hit the tile to work. If the former, heal can afford to be less) (TODO 2 find out how to apply heal, maybe need LUA, and remove persDamage since it doesnt work)</li>
        <li>Heavy Crystal 2: Rarity from 5 to 4 (TODO need to set in Sector Data)</li>
        <li>Repair Burst: Now also instantly puts out fires, seals breaches, and sets the room's oxygen amount to 100% (though if it's a room with open external doors, it will become instantly vacuum again). (TODO: test if all these features work. Also check that o2 works against auto and lanius)</li>
        <li>Glaive Beam: Its damage is equal to the number of charges. (todo fix the targeting bug)</li>
    </ol>
    <li>AUGMENTS:</li>
    <ol>
        <li>Almost all ship types now have hidden augments (don't take up slots, but are unsellable) that are now unavailable in stores and random rewards, but can be obtained from events. All other augments are removed from ships, except Long-Ranged Scanners. The consequences of these changes are listed under subpoints:</li>
        <ol>
            <li>Kestrel Cruisers: added hidden Advanced FTL Navigation (which now includes the effects of FTL Jammer and FTL Recharge Booster).</li>
            <li>Engi A, Engi C: added hidden Drone Reactor Booster. Engi B: Drone Reactor Booster is now hidden.</li>
            <ol>
                <li>Engi NPC ships now have Drone Reactor Booster.</li>
                <li>Engi NPC ships no longer have Engi Med-bot Dispersal.</li>
            </ol>
            <li>Fed Cruisers: System limit from 8 to 9. Effectively, Artillery System doesn't take a system slot. (Not an augment, but I'm including it here for the sake of consistency)</li>
            <li>Zoltan Cruisers: Zoltan Shield is now hidden.</li>
            <li>Mantis Cruisers: Mantis Pheromones is now hidden. Mantis Pheromones now includes the effects of Fire Suppression.</li>
            <ol>
                <li>Mantis NPC ships now have the effects of Fire Suppression.</li>
            </ol>
            <li>Slug Cruisers: Slug Repair Gel is now hidden.</li>
            <li>Rock Cruisers: Rock Plating is now hidden. Rock Plating now includes the effects of Explosive Replicator.</li>
            <ol>
                <li>Rock NPC ships now have the effects of Explosive Replicator. (TODO test if NPC can use it)</li>
            </ol>
            <li>Stealth A: Titanium System Casing is now hidden. Stealth B, Stealth C: added hidden Titanium System Casing.</li>
            <li>Crystal Cruisers: Crystal Vengeance is now hidden.</li>
            <ol>
                <li>Crystal NPC ships now have Crystal Vengeance.</li>
            </ol>
            <li>Lanius Cruisers: added hidden Reconstructive Teleport</li>
            <ol>
                <li>Lanius NPC ships now have Reconstructive Teleport.</li>
            </ol>
        </ol>
        <li>Changes for hidden augments:</li>
        <ol>
            <li>All hidden augments now cost 50 (and thus sell for 25 if obtained from an event).</li>
            <li>Crystal Vengeance: fires 2 projectiles instead of 1 (todo test), breach chance from 10% to 100%.</li>
            <li>Drone Reactor Booster: Crew drone speed boost from +25% to +100%, and also gives +20% damage. Combat drones and defense drones shoot 20% faster. (TODO see if it can be applied to all drones, or just a subset. Reference slow's INS+ DRB)</li>
        </ol>
        <li>Added Advanced FTL Navigation 2 to stores and random rewards (TODO add to augment lists if needed) (TODO 2 add this to ESCORT_BEACON blue option like Adv FTL Nav 1)</li>
        <ol>
            <li>NOTE: If you also have Advanced FTL Navigation, it will NOT take the distance between your destination and the nearest visited beacon from that destination. You will need to manually jump to the visted beacon nearest to the destination first.</li>
        </ol>
        <li>Engi Med-bot Dispersal: Now works for your crew on enemy ships. (TODO add to augment lists if needed)</li>
    </ol>
    <li>PLAYER SHIPS (other than augment changes above):</li>
    <ol>
        <li>Rock B: Added an external door to the Backup Battery room. (TODO remember to change floor image)</li>
    </ol>
    <li>NPC SHIPS:</li>
    <ol>
        <li>Engi ships: May now spawn with Anti-Personnel Drones.</li>
        <li>Mantis Fighter and Mantis Interceptor (and pirate versions): Medical systems are now optional instead of guaranteed.</li>
        <li>Slug Interceptor and Slug Scout: Added doors connecting Oxygen and Engines.</li>
        <li>Rock ships: May now spawn with Fire Bombs.</li>
        <li>Rock Assault (Elite): Crew range from 4 to 5.</li>
        <li>Auto-ships: Removed doors.</li>
        <li>Auto-scout and Auto-surveyor: Shields are now guaranteed.</li>
        <li>Flagship (AE versions): Medbay level from 3 to 2, added level 1 Clone Bay in the room to the right of Medbay.</li>
        <li>Flagship (Hard version): In Phase 1, there are extra rooms between each side's 2 Artilleries, connecting all of them, and no room between laser/missile Artilleries and Shields. In Phase 2, the left extra room will be destroyed, but a new room will appear between laser Artillery and Shields. Likewise for the right extra room in Phase 3, so Phase 3 has vanilla Hard's layout.</li>
    </ol>
    <li>EVENTS:</li>
    <ol>
        <li>(TODO more events for Lifeform Scanner just like Twinge. Like wherever a Slug is used, LRS, high level sensors, or even more, like people hiding in crates. Actually, some LRS blues should be replaced with Life Scanner if it's against lifeforms)</li>
        <li>FLAGSHIP_CONSTRUCTION: Defeating the Flagship under construction will give Advanced FTL Navigation (TODO it has to be the custom one with integrated augs).</li>
        <li>QUEST_CREWDEAD_START: Fire Beam and Fire Drone also allow you to pick the Fire Bomb blue option (renamed to simply "Fire") (TODO make a custom req which includes all; Fire Drone will need its own custom req which sees if there's a Drone System.).</li>
        <li>LANIUS_TRADER: TODO figure out values, then transfer to readme_new</li>
        <li>ROCK_CRYSTAL_BEACON: This event may be revisited if you choose not to scrap the ancient device. (TODO use playervariable "unscrapped=true". If it's Rock Home, find the location of this event. Then, every time you visit the event (except waiting at the beacon when out of fuel), if this is true, start this event. Picking the "scrap" option will set the variable to false, via custom event (currently it's renameEvent but maybe it should be a simple event start)) (TODO 2 maybe try to use ON_WAIT lua)</li>
    </ol>
    <li>MISC:</li>
    <ol>
        <li>The name of the FTL window is renamed to "FTL: CM's Balance Mod"</li>
    </ol>
</ol>
