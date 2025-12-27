# Balance Changes (Twinge)
Continued from Twinge's Balance and Bugfix Mod 4.0.2. This starts at 4.0.3 since it is not exactly the same, I fixed some errors in 4.0.2. Importantly, this now uses xml.append files instead of xml files, allowing it to be compatible with more mods. Most Bugfixes/QOL have been moved to the Bugfixes and QOL mod, and those that remain are what I think are not really bugs. (README is WIP, refer to https://www.darktwinge.com/ftl-balance/index.php?title=Main_Page in the meantime)

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
        <li>Mini-Beam: Length from 45 to 47.</li>
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
