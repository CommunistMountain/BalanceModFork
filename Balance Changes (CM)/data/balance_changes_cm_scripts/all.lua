--[[script.on_render_event(Defines.RenderEvents.SHIP_MANAGER, function() end, function(ship, showInterior, doorControlMode)
    if ship._targetable.hostile == false then
        ret.bShowRoom = true
    return Defines.Chain.CONTINUE, sector, event, bp, ret
end)
--]]

script.on_game_event("BOSS_AUTOMATED", false, function()
    local shipManager = Hyperspace.Global.GetInstance():GetShipManager(1)
    for i=0, shipManager.ship.vRoomList:size() - 1 do
        shipManager.oxygenSystem:ModifyRoomOxygen(i, -100)
    end
end)

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
