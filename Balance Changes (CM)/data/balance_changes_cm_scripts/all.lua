local lastSector = 0
local useAnotherDronePart = false

script.on_game_event("BOSS_AUTOMATED", false, function()
    local enemyShipManager = Hyperspace.Global.GetInstance():GetShipManager(1)
    if enemyShipManager:HasAugmentation("SLUG_GEL_SLOW_CM") <= 0 then
        enemyShipManager:AddAugmentation("SLUG_GEL_SLOW_CM")
    end
    
    for i=0, enemyShipManager.ship.vRoomList:size() - 1 do
        enemyShipManager.oxygenSystem:ModifyRoomOxygen(i, -100)
    end
end)

script.on_init(function()
    local starMap = Hyperspace.Global.GetInstance():GetCApp().world.starMap
    lastSector = starMap.currentSector.level
end)

script.on_internal_event(Defines.InternalEvents.GET_DODGE_FACTOR, function(shipManager, value)
    return Defines.Chain.CONTINUE, value - 2 * shipManager.shieldSystem.shields.power.super.first
end)

script.on_internal_event(Defines.InternalEvents.JUMP_ARRIVE, function(shipManager)
    local starMap = Hyperspace.Global.GetInstance():GetCApp().world.starMap
    if starMap.currentSector.level > lastSector then
        starMap:ModifyPursuit(math.min(1 - shipManager:HasAugmentation("FLEET_DISTRACTION"), 0))
    end
    lastSector = starMap.currentSector.level
    
    if shipManager:HasAugmentation("FTL_JUMPER") > 0 then
        if starMap.currentLoc.visited > 1 then
            shipManager.fuel_count = shipManager.fuel_count + 1
            starMap:ModifyPursuit(-1)
        end
    end
end)

script.on_internal_event(Defines.InternalEvents.PROJECTILE_FIRE, function(projectile, projectileFactory)
    if projectileFactory.blueprint.name == "BEAM_3" then
        projectile.damage.iDamage = projectileFactory.weaponVisual.boostLevel + 1
    end
end)

script.on_internal_event(Defines.InternalEvents.SHIP_LOOP, function(shipManager)
    if shipManager.iShipId == 0 then  -- if-block for all player-specific checks
        if shipManager.hackingSystem ~= nil and shipManager:HasAugmentation("HACKING_STUN") <= 0 then
            if shipManager.hackingSystem.spendDrone == 1 then
                if shipManager:GetDroneCount() >= 2 then
                    useAnotherDronePart = true
                else
                    shipManager.hackingSystem.spendDrone = 0
                    shipManager.hackingSystem:BlowHackingDrone()
                end
            elseif useAnotherDronePart then
                shipManager.hackingSystem.spendDrone = 1
                useAnotherDronePart = false
            end
        end
    end
    
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
