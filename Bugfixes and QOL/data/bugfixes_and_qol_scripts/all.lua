local all_time_increments = 0
local no_pause_time_increments = 0

local function time_increment_cm()
    if Hyperspace.FPS.speedLevel ~= 0 and Hyperspace.FPS.speedEnabled then
        return Hyperspace.FPS.SpeedFactor/16
    elseif Hyperspace.FPS.NumFrames ~= 0 then
        return 1/Hyperspace.FPS.NumFrames
    else
        return 0
    end
end

script.on_game_event("START_BEACON", false, function()
    if Hyperspace.App.world.starMap.currentSector.level == 0 then
        Hyperspace.metaVariables.all_time_cm = 0
        all_time_increments = 0
        Hyperspace.metaVariables.no_pause_time_cm = 0
        no_pause_time_increments = 0
    end
end)

script.on_render_event(Defines.RenderEvents.FTL_BUTTON, function() end, function()
    all_time_increments = all_time_increments + time_increment_cm()
    if all_time_increments > 1 then
        all_time_increments = all_time_increments - 1
        Hyperspace.metaVariables.all_time_cm = Hyperspace.metaVariables.all_time_cm + 1
    end
end)

script.on_internal_event(Defines.InternalEvents.SHIP_LOOP, function(shipManager)
    if shipManager.iShipId == 0 then -- for all player-specific checks
        no_pause_time_increments = no_pause_time_increments + time_increment_cm()
        if no_pause_time_increments > 1 then
            no_pause_time_increments = no_pause_time_increments - 1
            Hyperspace.metaVariables.no_pause_time_cm = Hyperspace.metaVariables.no_pause_time_cm + 1
        end
        
        local hackingSystem = shipManager.hackingSystem
        if hackingSystem ~= nil and hackingSystem.spendDrone == 1 then
            hackingSystem.spendDrone = 0 -- don't use this method, directly modify drone count
            local partsToUse = 1
            if shipManager:HasAugmentation("HACKING_USE_MORE_PARTS_CM") > 0 and shipManager:HasAugmentation("HACKING_STUN") <= 0 then -- for Balance Changes (CM)
                partsToUse = 2
            end
            if shipManager:GetDroneCount() >= partsToUse then
                shipManager:ModifyDroneCount(-partsToUse)
            else
                hackingSystem:BlowHackingDrone()
            end
        end
    else -- elseif shipManager.iShipId == 1 then -- for all enemy-specific checks
        if shipManager.ship.bDestroyed and shipManager.ship.shipName == "boss_3" then
            local all_minutes = Hyperspace.metaVariables.all_time_cm // 60
            local all_seconds = Hyperspace.metaVariables.all_time_cm % 60 + all_time_increments
            local no_pause_minutes = Hyperspace.metaVariables.no_pause_time_cm // 60
            local no_pause_seconds = Hyperspace.metaVariables.no_pause_time_cm % 60 + no_pause_time_increments
            print(string.format("Time including pauses: %d min %.2f s", all_minutes, all_seconds))
            print(string.format("Time excluding pauses: %d min %.2f s", no_pause_minutes, no_pause_seconds))
        end
    end
end)
