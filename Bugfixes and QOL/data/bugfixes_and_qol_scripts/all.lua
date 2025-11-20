script.on_internal_event(Defines.InternalEvents.SHIP_LOOP, function(shipManager)
    if shipManager.iShipId == 0 then  -- if-block for all player-specific checks
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
    end
end)
