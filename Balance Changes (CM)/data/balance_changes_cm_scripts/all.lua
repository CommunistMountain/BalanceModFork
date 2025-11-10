script.on_internal_event(Defines.InternalEvents.GET_DODGE_FACTOR, function(ship, value)
    return Defines.Chain.CONTINUE, value - 2 * ship.shieldSystem.shields.power.super.first
end)

script.on_internal_event(Defines.InternalEvents.JUMP_ARRIVE, function(ship)
    if ship:HasAugmentation("FTL_JUMPER") > 0 then
        local starMap = Hyperspace.Global.GetInstance():GetCApp().world.starMap
        if starMap.currentLoc.visited > 1 then
            ship.fuel_count = ship.fuel_count + 1
            starMap:ModifyPursuit(-1)
        end
    end   
end)

script.on_internal_event(Defines.InternalEvents.PROJECTILE_FIRE, function(projectile, weapon)
    if weapon.blueprint.name == "BEAM_3" then
        projectile.damage.iDamage = weapon.weaponVisual.boostLevel + 1
    end
end)
