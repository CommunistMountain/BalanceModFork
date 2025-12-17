-- List of systems to show preview for
mods.bugfixes_and_qol.systemIcons = {}
local systemIcons = mods.bugfixes_and_qol.systemIcons

-- Collect system icons
function mods.bugfixes_and_qol.register_system_icon(name)
    local tex = Hyperspace.Resources:GetImageId("icons/s_"..name.."_overlay.png")
    return Graphics.CSurface.GL_CreateImagePrimitive(tex, 0, 0, 32, 32, 0, Graphics.GL_Color(1, 1, 1, 0.5))
end

for id, sys in pairs(mods.bugfixes_and_qol.systemIds) do
    systemIcons[id] = mods.bugfixes_and_qol.register_system_icon(sys)
end

local roomPreviewTimer = 0

local function render_system_icon(sysTable, roomId, ship)
    local iconOffset = 22

    -- Check if any of the systems in the room are already on the ship.
    for _, sysId in ipairs(sysTable) do
        if ship:HasSystem(sysId) then
            return
        end
    end

    -- Render background
    local sysRoomShape = Hyperspace.ShipGraph.GetShipInfo(ship.iShipId):GetRoomShape(roomId)
    local outlineSize = 2
    Graphics.CSurface.GL_DrawRect(sysRoomShape.x, sysRoomShape.y, sysRoomShape.w, sysRoomShape.h, Graphics.GL_Color(0, 0, 0, 0.3))
    Graphics.CSurface.GL_DrawRectOutline(sysRoomShape.x + outlineSize, sysRoomShape.y + outlineSize, sysRoomShape.w - 2*outlineSize, sysRoomShape.h - 2*outlineSize, Graphics.GL_Color(0.8, 0, 0, 0.5), outlineSize)

    --Determine what room shape this is.
    local roomSize = 1
    if sysRoomShape.w >= 70 and sysRoomShape.h >= 70 then
        roomSize = 4
    elseif sysRoomShape.w >= 70 then
        roomSize = 2
    elseif sysRoomShape.h >= 70 then
        roomSize = 3
    end

    --Work out what the maximum number of icons we can show in this room is
    local maxIcons = roomSize == 2 and 3 or roomSize

    local pages = math.ceil(#sysTable/maxIcons)
    local currentIcons = math.min(#sysTable, maxIcons)

    local iconRenderX = sysRoomShape.x + sysRoomShape.w//2 - 16
    local iconRenderY = sysRoomShape.y + sysRoomShape.h//2 - 16

    -- loop through the systems in the room
    for i, sysId in ipairs(sysTable) do
        local n = ((i-1)%maxIcons + 1)
        local currentPage = math.ceil(i/maxIcons)
        local display = ((math.floor(roomPreviewTimer)%pages) + 1) == currentPage
        if display then
            local iconRenderOffsetX = 0
            local iconRenderOffsetY = 0
            if currentIcons == maxIcons then
                -- 2+ x 1 rooms
                if roomSize == 2 and n == 2 then
                    iconRenderOffsetX = -1 * iconOffset
                elseif roomSize == 2 and n == 3 then
                    iconRenderOffsetX = iconOffset
                -- 1 x 2+ rooms
                elseif roomSize == 3 and n == 2 then
                    iconRenderOffsetY = -1 * iconOffset
                elseif roomSize == 3 and n == 3 then
                    iconRenderOffsetY = iconOffset
                -- 2+ x 2+ rooms
                elseif roomSize == 4 and n == 1 then
                    iconRenderOffsetX = -0.5 * iconOffset
                    iconRenderOffsetY = -0.5 * iconOffset
                elseif roomSize == 4 and n == 2 then
                    iconRenderOffsetX = 0.5 * iconOffset
                    iconRenderOffsetY = -0.5 * iconOffset
                elseif roomSize == 4 and n == 3 then
                    iconRenderOffsetX = -0.5 * iconOffset
                    iconRenderOffsetY = 0.5 * iconOffset
                elseif roomSize == 4 and n == 4 then
                    iconRenderOffsetX = 0.5 * iconOffset
                    iconRenderOffsetY = 0.5 * iconOffset
                end
            elseif currentIcons == maxIcons - 1 then
                -- 2+ x 1 rooms
                if roomSize == 2 and n == 1 then
                    iconRenderOffsetX = -0.5 * iconOffset
                elseif roomSize == 2 and n == 2 then
                    iconRenderOffsetX = 0.5 * iconOffset
                -- 1 x 2+ rooms
                elseif roomSize == 3 and n == 1 then
                    iconRenderOffsetY = -0.5 * iconOffset
                elseif roomSize == 3 and n == 2 then
                    iconRenderOffsetY = 0.5 * iconOffset
                -- 2+ x 2+ rooms
                elseif roomSize == 4 and n == 2 then
                    iconRenderOffsetX = -1 * iconOffset
                elseif roomSize == 4 and n == 3 then
                    iconRenderOffsetX = iconOffset
                end
            elseif currentIcons == maxIcons - 2 and roomSize == 4 then
                -- 2+ x 2+ rooms
                if n == 1 then
                    iconRenderOffsetX = -0.5 * iconOffset
                elseif n == 2 then
                    iconRenderOffsetX = 0.5 * iconOffset
                end
            end
            Graphics.CSurface.GL_PushMatrix()
            Graphics.CSurface.GL_Translate(iconRenderX + iconRenderOffsetX, iconRenderY + iconRenderOffsetY)
            Graphics.CSurface.GL_RenderPrimitive(systemIcons[sysId])
            Graphics.CSurface.GL_PopMatrix()
        end
    end
end

script.on_render_event(Defines.RenderEvents.SHIP_SPARKS, function() end, function(ship)
    if not Hyperspace.App.world.bStartedGame then
        local shipManager = Hyperspace.ships(ship.iShipId)
        local sysInfo = shipManager.myBlueprint.systemInfo
        local roomSystems = {}

        local keys = sysInfo:keys()
        for i=0, keys:size() - 1 do
            local key = keys[i]
            if key ~= 11 then
                if roomSystems[sysInfo[key].location[0]] then
                    table.insert(roomSystems[sysInfo[key].location[0]], key)
                else
                    roomSystems[sysInfo[key].location[0]] = {key}
                end
            end
        end

        roomPreviewTimer = roomPreviewTimer + mods.bugfixes_and_qol.time_increment()
        if roomPreviewTimer > mods.bugfixes_and_qol.INT_MAX then
            roomPreviewTimer = 0
        end
        for roomId, sysTable in pairs(roomSystems) do
            render_system_icon(sysTable, roomId, shipManager)
        end
    end
end)
