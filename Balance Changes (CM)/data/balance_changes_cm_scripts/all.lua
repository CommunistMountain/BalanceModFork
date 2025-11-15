script.on_game_event("BOSS_AUTOMATED", false, function()
    local enemyShipManager = Hyperspace.Global.GetInstance():GetShipManager(1)
    if enemyShipManager:HasAugmentation("SLUG_GEL_SLOW_CM") <= 0 then
        enemyShipManager:AddAugmentation("SLUG_GEL_SLOW_CM")
    end
    for i=0, enemyShipManager.ship.vRoomList:size() - 1 do
        enemyShipManager.oxygenSystem:ModifyRoomOxygen(i, -100)
    end
end)

script.on_internal_event(Defines.InternalEvents.GET_DODGE_FACTOR, function(shipManager, value)
    return Defines.Chain.CONTINUE, value - 2 * shipManager.shieldSystem.shields.power.super.first
end)

script.on_internal_event(Defines.InternalEvents.JUMP_ARRIVE, function(shipManager)
    if shipManager:HasAugmentation("FTL_JUMPER") > 0 then
        local starMap = Hyperspace.Global.GetInstance():GetCApp().world.starMap
        if starMap.currentLoc.visited > 1 then
            shipManager.fuel_count = shipManager.fuel_count + 1
            starMap:ModifyPursuit(-1)
        end
    end   
end)

script.on_internal_event(Defines.InternalEvents.PROJECTILE_FIRE, function(projectile, weapon)
    if weapon.blueprint.name == "BEAM_3" then
        projectile.damage.iDamage = weapon.weaponVisual.boostLevel + 1
    end
end)

script.on_internal_event(Defines.InternalEvents.SHIP_LOOP, function(shipManager)
    if shipManager:HasAugmentation("SLUG_GEL") > 0 then
        if shipManager:HasSystem(7) then
            local sensors = shipManager:GetSystem(7)
            sensors:ClearStatus()
            sensors.bManned = true
            sensors.iActiveManned = 1
        end
        if shipManager:HasSystem(8) then
            local doors = shipManager:GetSystem(8)
            doors.bManned = true
            doors.iActiveManned = 1
        end
    end
end)