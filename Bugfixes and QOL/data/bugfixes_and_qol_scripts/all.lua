script.on_game_event("START_BEACON", false, function()
    if Hyperspace.App.world.starMap.currentSector.level == 0 then
        Hyperspace.metaVariables.all_ticks_cm = 0
        Hyperspace.metaVariables.no_pause_ticks_cm = 0
    end
end)

script.on_render_event(Defines.RenderEvents.FTL_BUTTON, function() end, function()
    Hyperspace.metaVariables.all_ticks_cm = Hyperspace.metaVariables.all_ticks_cm + 1
end)

script.on_internal_event(Defines.InternalEvents.SHIP_LOOP, function(shipManager)
    if shipManager.iShipId == 0 then  -- for all player-specific checks
        Hyperspace.metaVariables.no_pause_ticks_cm = Hyperspace.metaVariables.no_pause_ticks_cm + 1
    
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
            local all_ticks = Hyperspace.metaVariables.all_ticks_cm
            local all_minutes = all_ticks // 1800
            local all_seconds = all_ticks % 1800 / 30
            local no_pause_ticks = Hyperspace.metaVariables.no_pause_ticks_cm
            local no_pause_minutes = no_pause_ticks // 1800
            local no_pause_seconds = no_pause_ticks % 1800 / 30
            print(string.format("Time including pauses: %d min %.2f s (%d ticks)", all_minutes, all_seconds, all_ticks))
            print(string.format("Time excluding pauses: %d min %.2f s (%d ticks)", no_pause_minutes, no_pause_seconds, no_pause_ticks))
        end
    end
end)
