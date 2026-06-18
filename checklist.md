<ol>
    <li>TODO review all ship reactor levels, as well as exceptions to system norms.</li>
    <li>TODO test that Reverse Ion field resist causes an ion projectile to pass through unaffected through a Zoltan Shield (it should just fizzle on hit and do nothing)</li>
    <li>TODO test that pulsars are absorbed by Zoltan Shield regardless of if there's a shield system installed.</li>
    <li>TODO test that Ion Stunner pierce does not affect shields (should completely pass by 1 layer of shields without affecting Shield room). Also test Ion Stunner and Heavy Ion's effects against Reverse Ion augment. ALSO: test whether multiple ion stunner hits refresh stun duration or stack? should refresh not stack. ALSO: check Reverse Ion and stun interactions (can ion be blocked but stun still goes through?)</li>
    <li>TODO check if waiting removes supershield from Shield Drone in HS (it should not; and zoltan shield should maintain the previous amount)</li>
    <li>TODO consider moving some bugfixes to balance changes</li>
    <li>TODO summaries for all 3 mods so people know at a glance what they're getting into.</li>
    <li>TODO change text for everything in readme_new that needs it (list them out)</li>
    <li>TODO HS branches. Any gameplay-affecting things should have an associated setting in hyperspace.xml. Then make changes accordingly in my mods (e.g. review rewardScaling). For scaleDRA, check if it's OK to not add the value XML tag, then add value in hyperspace.xml</li>
    <li>EVENTS:</li>
    <ol>
        <li>More events for Lifeform Scanner. Like wherever a Slug is used, LRS, high level sensors, or even more, like people hiding in crates. Actually, some LRS blues should be replaced with Life Scanner if it's against lifeforms</li>
    </ol>
    <li>TODO check all README for more TODOs/future follow ups</li>
</ol>

Low priority:

When selling something with full price not divisible by 2, store a variable (must be reset when starting new run) indicating you have 0.5 scrap, then when you sell such an item again you get scrap rounded up, not down. Implement this in Hyperspace, and add a setting for it, then enable the setting in my balance mod. (If this is truly impossible, ensure all sellables are divisible by 2 in my balance mod)

Fix Distraction Buoys message not saying the correct fleet delay (actual fleet delay is correct)

consider changing enemy reactor amounts (only relevant for plasma storms)

review weapon cooldowns and projectile speeds? should probably arrive in this order: bomb, flak, missile, ion, crystal, laser, beam

Teleport works on own ship

Add graphics changes for these weapons that share the same sprite:
1. All bombs
2. Adv. Flak and Flak I
3. Dual Lasers and Burst Laser I (add a pip to Burst Laser I like II and III?)
4. Heavy Laser I and Heavy Pierce I
5. Hull Laser I and Hull Laser II (Mike made a mod for this)
6. Laser Charger (S) and Laser Charger
7. Leto Missile, Artemis Missile, Artemis Missile (enemy) and Pegasus Missile
8. Hermes Missile, Breach Missile and Hull Missile
    OR if only considering weapons that enemies can use:
1. Small Bomb, Fire Bomb, Ion Bomb, Stun Bomb, Lock Bomb
2. Leto Missile, Artemis Missile (enemy)
3. Hermes Missile, Breach Missile
