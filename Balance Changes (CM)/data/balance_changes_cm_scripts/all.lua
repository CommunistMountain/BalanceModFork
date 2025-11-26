local lastSector = 0
local getLastSector = false
local vanillaAugs = {"CREW_STIMS", "DRONE_SPEED", "FTL_JUMPER", "NANO_MEDBAY", "ROCK_ARMOR"}
local vanillaAugExtensions = {"CREW_STIMS_EXTENSION_CM", "DRONE_SPEED_EXTENSION_CM", "FTL_JUMPER_EXTENSION_CM", "NANO_MEDBAY_EXTENSION_CM", "ROCK_ARMOR_EXTENSION_CM"}

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
    getLastSector = true
end)

script.on_internal_event(Defines.InternalEvents.GET_DODGE_FACTOR, function(shipManager, value)
    return Defines.Chain.CONTINUE, value - 2 * shipManager.shieldSystem.shields.power.super.first
end)

script.on_internal_event(Defines.InternalEvents.JUMP_ARRIVE, function(shipManager)
    local starMap = Hyperspace.App.world.starMap
    if starMap.currentSector.level > lastSector then
        starMap:ModifyPursuit(math.min(1 - shipManager:HasAugmentation("FLEET_DISTRACTION"), 0))
    
    elseif starMap.currentSector.level == lastSector and shipManager:HasAugmentation("FTL_JUMPER") > 0 then
        if starMap.currentLoc.visited > 1 then
            shipManager.fuel_count = shipManager.fuel_count + 1
            starMap:ModifyPursuit(-1)
        end
    end
    
    lastSector = starMap.currentSector.level
end)

script.on_internal_event(Defines.InternalEvents.PROJECTILE_FIRE, function(projectile, projectileFactory)
    if projectileFactory.blueprint.name == "BEAM_3" then
        projectile.damage.iDamage = projectileFactory.weaponVisual.boostLevel + 1
    end
end)

script.on_internal_event(Defines.InternalEvents.SHIP_LOOP, function(shipManager)
    if getLastSector then
        local currentSector = Hyperspace.App.world.starMap.currentSector
        if currentSector ~= nil then
            lastSector = currentSector.level
            getLastSector = false
        end
    end
    
    if shipManager.iShipId == 0 then -- for player-specific actions
        if shipManager:HasAugmentation("HACKING_USE_MORE_PARTS_CM") <= 0 then
            shipManager:AddAugmentation("HIDDEN HACKING_USE_MORE_PARTS_CM")
        end
    end
    
    for i=1, #vanillaAugs do
        if shipManager:HasAugmentation(vanillaAugExtensions[i]) < shipManager:HasAugmentation(vanillaAugs[i]) then
            shipManager:AddAugmentation("HIDDEN " .. vanillaAugExtensions[i])
        elseif shipManager:HasAugmentation(vanillaAugExtensions[i]) > shipManager:HasAugmentation(vanillaAugs[i]) then
            shipManager:RemoveAugmentation("HIDDEN " .. vanillaAugExtensions[i])
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
