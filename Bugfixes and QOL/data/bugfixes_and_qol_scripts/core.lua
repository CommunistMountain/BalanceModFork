mods.bugfixes_and_qol = {}
mods.bugfixes_and_qol.INT_MAX = 2147483647
mods.bugfixes_and_qol.INT_MIN = -2147483648
mods.bugfixes_and_qol.blueprintFiles = {
    "data/blueprints.xml",
    "data/dlcBlueprints.xml",
}

function mods.bugfixes_and_qol.child_nodes(node, reversed)
    local child_table = {}
    if node ~= nil then
        if reversed == nil then
            reversed = false
        end
        if not reversed then
            local first_child = node:first_node()
            if first_child ~= nil then
                table.insert(child_table, first_child)
                local next_child = first_child:next_sibling()
                while next_child ~= nil do
                    table.insert(child_table, next_child)
                    next_child = next_child:next_sibling()
                end
            end
        else
            local first_child = node:last_node()
            if first_child ~= nil then
                table.insert(child_table, first_child)
                local next_child = first_child:previous_sibling()
                while next_child ~= nil do
                    table.insert(child_table, next_child)
                    next_child = next_child:previous_sibling()
                end
            end
        end
    end
    return child_table
end

function mods.bugfixes_and_qol.print_object_fields(object, parent_member_name, print_error_messages)
    if print_error_messages == nil then
        print_error_messages = true
    end
    if object ~= nil then
        local object_metatable = getmetatable(object)
        if object_metatable ~= nil then
            local getters = object_metatable[".get"]
            if getters ~= nil then
                parent_member_name = parent_member_name or "" -- if parent_member_name is not provided
                for member_name, getter in pairs(getters) do
                    print(parent_member_name .. "." .. member_name, getter(object))
                    if not string.match(parent_member_name, "." .. member_name) then -- to avoid loops. though this may also eliminate some non-loops
                        --mods.bugfixes_and_qol.print_object_fields(getter(object), parent_member_name .. "." .. member_name) --recursion is buggy for now
                    end
                end
            elseif print_error_messages then
                print("Failed printing Object fields: Object metatable getters is nil.")
            end
        elseif print_error_messages then
            print("Failed printing Object fields: Object metatable is nil.")
        end
    elseif print_error_messages then
        print("Failed printing Object fields: Object is nil.")
    end
end

function mods.bugfixes_and_qol.time_increment(useSpeed)
    if useSpeed == nil then
        useSpeed = true
    end
    if useSpeed then
        return Hyperspace.FPS.SpeedFactor/16
    elseif Hyperspace.FPS.NumFrames ~= 0 then
        return 1/Hyperspace.FPS.NumFrames
    else
        return 0
    end
end

mods.bugfixes_and_qol.systemIds = {}
for i=1, #mods.bugfixes_and_qol.blueprintFiles do
    local doc = RapidXML.xml_document(mods.bugfixes_and_qol.blueprintFiles[i])
    for _, child_node in ipairs(mods.bugfixes_and_qol.child_nodes(doc:first_node("FTL") or doc, true)) do
        if child_node:name() == "systemBlueprint" then
            local system_name = child_node:first_attribute("name"):value()
            mods.bugfixes_and_qol.systemIds[Hyperspace.ShipSystem.NameToSystemId(system_name)] = system_name
        end
    end
end

local all_time_increments = 0
local all_time_fps_increments = 0
local no_pause_time_increments = 0
local no_pause_time_fps_increments = 0

script.on_game_event("START_BEACON", false, function()
    if Hyperspace.App.world.starMap.currentSector.level == 0 then
        Hyperspace.metaVariables.all_time_cm = 0
        all_time_increments = 0
        Hyperspace.metaVariables.all_time_fps_cm = 0
        all_time_fps_increments = 0
        Hyperspace.metaVariables.no_pause_time_cm = 0
        no_pause_time_increments = 0
        Hyperspace.metaVariables.no_pause_time_fps_cm = 0
        no_pause_time_fps_increments = 0
    end
end)

script.on_init(function()
    if Hyperspace.App.world.starMap.currentSector == nil then -- happens when loading from a save but not when starting a new game
        Hyperspace.App.gui.bPaused = true
    end
end)

script.on_internal_event(Defines.InternalEvents.DAMAGE_AREA, function(targetedShipManager, projectile, pointF, damage, evasion, bShipFriendlyFire)
    if projectile ~= nil and projectile.extend.name == "CRYSTAL_1" then
        local doc = RapidXML.xml_document("data/blueprints.xml")
        for _, child_node in ipairs(mods.bugfixes_and_qol.child_nodes(doc:first_node("FTL") or doc, true)) do
            if child_node:name() == "weaponBlueprint" and child_node:first_attribute("name"):value() == "CRYSTAL_1" then
                local damage_node = child_node:last_node("damage")
                if damage_node ~= nil then
                    damage.iDamage = damage_node:value()
                end
                break
            end
        end
    end
    return Defines.Chain.CONTINUE, evasion, bShipFriendlyFire
end)

script.on_internal_event(Defines.InternalEvents.SHIP_LOOP, function(shipManager)
    if shipManager.iShipId == 0 then -- for all player-specific checks
        no_pause_time_increments = no_pause_time_increments + mods.bugfixes_and_qol.time_increment()
        if no_pause_time_increments > 1 then
            no_pause_time_increments = no_pause_time_increments - 1
            Hyperspace.metaVariables.no_pause_time_cm = Hyperspace.metaVariables.no_pause_time_cm + 1
        end
        no_pause_time_fps_increments = no_pause_time_fps_increments + mods.bugfixes_and_qol.time_increment(false)
        if no_pause_time_fps_increments > 1 then
            no_pause_time_fps_increments = no_pause_time_fps_increments - 1
            Hyperspace.metaVariables.no_pause_time_fps_cm = Hyperspace.metaVariables.no_pause_time_fps_cm + 1
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
            local all_minutes_fps = Hyperspace.metaVariables.all_time_fps_cm // 60
            local all_seconds_fps = Hyperspace.metaVariables.all_time_fps_cm % 60 + all_time_fps_increments
            local no_pause_minutes = Hyperspace.metaVariables.no_pause_time_cm // 60
            local no_pause_seconds = Hyperspace.metaVariables.no_pause_time_cm % 60 + no_pause_time_increments
            local no_pause_minutes_fps = Hyperspace.metaVariables.no_pause_time_fps_cm // 60
            local no_pause_seconds_fps = Hyperspace.metaVariables.no_pause_time_fps_cm % 60 + no_pause_time_fps_increments
            print(string.format("Time with pauses (speed setting-based): %d min %.2f s", all_minutes, all_seconds))
            print(string.format("Time with pauses (FPS-based): %d min %.2f s", all_minutes_fps, all_seconds_fps))
            print(string.format("Time without pauses (speed setting-based): %d min %.2f s", no_pause_minutes, no_pause_seconds))
            print(string.format("Time without pauses (FPS-based): %d min %.2f s", no_pause_minutes_fps, no_pause_seconds_fps))
        end
    end
end)

script.on_render_event(Defines.RenderEvents.FTL_BUTTON, function() end, function()
    all_time_increments = all_time_increments + mods.bugfixes_and_qol.time_increment()
    if all_time_increments > 1 then
        all_time_increments = all_time_increments - 1
        Hyperspace.metaVariables.all_time_cm = Hyperspace.metaVariables.all_time_cm + 1
    end
    all_time_fps_increments = all_time_fps_increments + mods.bugfixes_and_qol.time_increment(false)
    if all_time_fps_increments > 1 then
        all_time_fps_increments = all_time_fps_increments - 1
        Hyperspace.metaVariables.all_time_fps_cm = Hyperspace.metaVariables.all_time_fps_cm + 1
    end
end)
