local lastSector = 0
local getLastSector = false
local vanillaAugs = {"CREW_STIMS", "DRONE_SPEED", "FTL_JUMPER", "NANO_MEDBAY", "ROCK_ARMOR"}
local vanillaAugExtensions = {"CREW_STIMS_EXTENSION_CM", "DRONE_SPEED_EXTENSION_CM", "FTL_JUMPER_EXTENSION_CM", "NANO_MEDBAY_EXTENSION_CM", "ROCK_ARMOR_EXTENSION_CM"}
local repairDroneRecoveryFix = false
local hyperspaceDoc = RapidXML.xml_document("data/hyperspace.xml")
for _, child_node in ipairs(mods.bugfixes_and_qol.child_nodes(hyperspaceDoc:first_node("FTL") or hyperspaceDoc, true)) do
    if child_node:name() == "repairDroneRecoveryFix" and child_node:first_attribute("enabled"):value() == "true" then
        repairDroneRecoveryFix = true
        break
    end
end

script.on_game_event("BOSS_AUTOMATED", false, function()
    local enemyShipManager = Hyperspace.ships.enemy
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

script.on_internal_event(Defines.InternalEvents.CALCULATE_STAT_PRE, function(crewMember, crewStat, crewDefinition, fAmount, bValue)
    if crewMember.intruder then
        local hackedShipManager = Hyperspace.Global.GetInstance():GetShipManager(1 - crewMember.iShipId)
        local hackerShipManager = Hyperspace.Global.GetInstance():GetShipManager(crewMember.iShipId)
        if hackerShipManager ~= nil and hackerShipManager:HasAugmentation("HACKING_STUN") > 0 then
            for i=0, hackedShipManager.vSystemList:size() - 1 do
                if crewMember.iRoomId == hackedShipManager.vSystemList[i]:GetRoomId() then
                    if hackedShipManager:IsSystemHacked(hackedShipManager.vSystemList[i]:GetId()) == 2 then
                        crewMember.fStunTime = 0
                    end
                    break
                end
            end
        end
    end
    return Defines.Chain.CONTINUE, fAmount, bValue
end)

script.on_internal_event(Defines.InternalEvents.DAMAGE_AREA_HIT, function(targetedShipManager, projectile, pointF, damage, bShipFriendlyFire)
    if projectile ~= nil and projectile.extend.name == "ARTILLERY_FED_C" then
        local roomId = targetedShipManager.ship:GetSelectedRoomId(pointF.x, pointF.y, true)
        for i=0, targetedShipManager.vCrewList:size() - 1 do
            local crewMember = targetedShipManager.vCrewList[i]
            if crewMember.intruder and crewMember.iRoomId == roomId then
                crewMember:DirectModifyHealth(50)
            end
        end
    end
    return Defines.Chain.CONTINUE
end)

script.on_internal_event(Defines.InternalEvents.GET_DODGE_FACTOR, function(shipManager, iValue)
    return Defines.Chain.CONTINUE, iValue - 2 * shipManager.shieldSystem.shields.power.super.first
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

script.on_internal_event(Defines.InternalEvents.JUMP_LEAVE, function(shipManager)
    if shipManager:HasAugmentation("DRONE_RECOVERY_CM") > 0 then
        local recoveredDrones = 0
        local spaceDrones = Hyperspace.App.world.space.drones
        for i=0, spaceDrones:size() - 1 do
            local spaceDrone = spaceDrones[i]
            if spaceDrone.iShipId == shipManager.iShipId and spaceDrone.deployedLastFrame then
                if spaceDrone.type == 0 or (not repairDroneRecoveryFix and spaceDrone.type == 5) or spaceDrone.type == 7 then -- defense, hull repair, shield
                    recoveredDrones = recoveredDrones + 1
                end
            end
        end
        shipManager:ModifyDroneCount(recoveredDrones)
    end
end)

script.on_internal_event(Defines.InternalEvents.PROJECTILE_FIRE, function(projectile, projectileFactory)
    if projectileFactory.blueprint.name == "BEAM_3" then
        projectile.damage.iDamage = projectileFactory.weaponVisual.boostLevel + 1
    end
end)

script.on_internal_event(Defines.InternalEvents.SHIP_LOOP, function(shipManager)
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

script.on_render_event(Defines.RenderEvents.FTL_BUTTON, function() end, function()
    if getLastSector then
        local currentSector = Hyperspace.App.world.starMap.currentSector
        if currentSector ~= nil then
            lastSector = currentSector.level
            getLastSector = false
        end
    end
end)
