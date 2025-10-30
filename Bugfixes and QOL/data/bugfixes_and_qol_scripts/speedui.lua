-- Variant 1
local slowButton = Hyperspace.Button()
slowButton:OnInit("statusUI/top_speed_slow", Hyperspace.Point(530, -5))
slowButton.hitbox.x = 8 + slowButton.position.x
slowButton.hitbox.y = 8 + slowButton.position.y
slowButton.hitbox.w = 20
slowButton.hitbox.h = 20
local normButton = Hyperspace.Button()
normButton:OnInit("statusUI/top_speed_normal", Hyperspace.Point(555, -5))
normButton.hitbox.x = 8 + normButton.position.x
normButton.hitbox.y = 8 + normButton.position.y
normButton.hitbox.w = 20
normButton.hitbox.h = 20
local fastButton = Hyperspace.Button()
fastButton:OnInit("statusUI/top_speed_fast", Hyperspace.Point(580, -5))
fastButton.hitbox.x = 8 + fastButton.position.x
fastButton.hitbox.y = 8 + fastButton.position.y
fastButton.hitbox.w = 20
fastButton.hitbox.h = 20

-- Variant 2
local upButton = Hyperspace.Button()
upButton:OnInit("statusUI/top_speed_up", Hyperspace.Point(530, -5))
upButton.hitbox.x = 8 + upButton.position.x
upButton.hitbox.y = 8 + upButton.position.y
upButton.hitbox.w = 20
upButton.hitbox.h = 9
local downButton = Hyperspace.Button()
downButton:OnInit("statusUI/top_speed_down", Hyperspace.Point(530, 6))
downButton.hitbox.x = 8 + downButton.position.x
downButton.hitbox.y = 8 + downButton.position.y
downButton.hitbox.w = 20
downButton.hitbox.h = 9
local pauseButton = Hyperspace.Button()
pauseButton:OnInit("statusUI/top_speed_pause", Hyperspace.Point(580, -5))
pauseButton.hitbox.x = 8 + pauseButton.position.x
pauseButton.hitbox.y = 8 + pauseButton.position.y
pauseButton.hitbox.w = 20
pauseButton.hitbox.h = 20
local playButton = Hyperspace.Button()
playButton:OnInit("statusUI/top_speed_play", Hyperspace.Point(580, -5))
playButton.hitbox.x = 8 + playButton.position.x
playButton.hitbox.y = 8 + playButton.position.y
playButton.hitbox.w = 20
playButton.hitbox.h = 20
local numberImage = {
    image = Hyperspace.Resources:CreateImagePrimitiveString("statusUI/top_speed_number.png", 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1, false),
    x = 555,
    y = -5
}

function initButtonSpeeds()
    if Hyperspace.metaVariables.speedui_setting == 2 then
        if Hyperspace.metaVariables.speedui_speed <= -2 then
            Hyperspace.FPS.speedLevel = -2
            upButton.bActive = true
            downButton.bActive = false
        elseif Hyperspace.metaVariables.speedui_speed >= 99 then
            Hyperspace.FPS.speedLevel = 99
            upButton.bActive = false
            downButton.bActive = true
        else
            Hyperspace.FPS.speedLevel = Hyperspace.metaVariables.speedui_speed
            upButton.bActive = true
            downButton.bActive = true
        end
    else
        Hyperspace.FPS.speedLevel = 0
    end
end
script.on_game_event("START_BEACON", false, initButtonSpeeds)
script.on_init(initButtonSpeeds)

script.on_render_event(Defines.RenderEvents.FTL_BUTTON, function() end, function()
    if Hyperspace.metaVariables.speedui_setting == 1 then
        local mousePos = Hyperspace.Mouse.position
        if not Hyperspace.FPS.speedEnabled or Hyperspace.metaVariables.speedui_speed == 0 then
            slowButton.bActive = true
            normButton.bActive = false
            fastButton.bActive = true
        elseif Hyperspace.metaVariables.speedui_speed < 0 then
            slowButton.bActive = false
            normButton.bActive = true
            fastButton.bActive = true
        else -- Hyperspace.metaVariables.speedui_speed > 0 then
            slowButton.bActive = true
            normButton.bActive = true
            fastButton.bActive = false
        end
        slowButton:OnRender()
        slowButton:MouseMove(mousePos.x, mousePos.y, false)
        normButton:OnRender()
        normButton:MouseMove(mousePos.x, mousePos.y, false)
        fastButton:OnRender()
        fastButton:MouseMove(mousePos.x, mousePos.y, false)
    elseif Hyperspace.metaVariables.speedui_setting == 2 then
        local mousePos = Hyperspace.Mouse.position
        upButton:OnRender()
        upButton:MouseMove(mousePos.x, mousePos.y, false)
        downButton:OnRender()
        downButton:MouseMove(mousePos.x, mousePos.y, false)
        if Hyperspace.FPS.speedEnabled then
            pauseButton:OnRender()
            pauseButton:MouseMove(mousePos.x, mousePos.y, false)
        else
            playButton:OnRender()
            playButton:MouseMove(mousePos.x, mousePos.y, false)
        end
        Graphics.CSurface.GL_PushMatrix()
        Graphics.CSurface.GL_Translate(numberImage.x, numberImage.y, 0)
        Graphics.CSurface.GL_RenderPrimitive(numberImage.image)
        Graphics.freetype.easy_printCenter(1, 18, 11, math.floor(Hyperspace.metaVariables.speedui_speed))
        Graphics.CSurface.GL_PopMatrix()
    end
end)

function onClick(change)
    if Hyperspace.metaVariables.speedui_setting == 1 then
        if slowButton.bHover and slowButton.bActive then
            Hyperspace.metaVariables.speedui_speed = -2
            Hyperspace.FPS.speedLevel = -2
            Hyperspace.FPS.speedEnabled = true
            Hyperspace.Sounds:PlaySoundMix("powerDownSystem", -1, false)
        elseif normButton.bHover and normButton.bActive then
            Hyperspace.FPS.speedEnabled = false
            if Hyperspace.metaVariables.speedui_speed < 0 then
                Hyperspace.Sounds:PlaySoundMix("powerUpSystem", -1, false)
            else
                Hyperspace.Sounds:PlaySoundMix("powerDownSystem", -1, false)
            end
        elseif fastButton.bHover and fastButton.bActive then
            Hyperspace.metaVariables.speedui_speed = 2
            Hyperspace.FPS.speedLevel = 2
            Hyperspace.FPS.speedEnabled = true
            Hyperspace.Sounds:PlaySoundMix("powerUpSystem", -1, false)
        end
    elseif Hyperspace.metaVariables.speedui_setting == 2 then
        if upButton.bHover and upButton.bActive then
            Hyperspace.metaVariables.speedui_speed = Hyperspace.metaVariables.speedui_speed + change
            if Hyperspace.metaVariables.speedui_speed >= 99 then
                Hyperspace.metaVariables.speedui_speed = 99
                upButton.bActive = false
            end
            downButton.bActive = true
            Hyperspace.FPS.speedLevel = Hyperspace.metaVariables.speedui_speed
            Hyperspace.Sounds:PlaySoundMix("powerUpSystem", -1, false)
        elseif downButton.bHover and downButton.bActive then
            Hyperspace.metaVariables.speedui_speed = Hyperspace.metaVariables.speedui_speed - change
            if Hyperspace.metaVariables.speedui_speed <= -2 then
                Hyperspace.metaVariables.speedui_speed = -2
                downButton.bActive = false
            end
            upButton.bActive = true
            Hyperspace.FPS.speedLevel = Hyperspace.metaVariables.speedui_speed
            Hyperspace.Sounds:PlaySoundMix("powerDownSystem", -1, false)
        elseif pauseButton.bHover and pauseButton.bActive then
            Hyperspace.FPS.speedEnabled = false
            Hyperspace.Sounds:PlaySoundMix("powerDownSystem", -1, false)
        elseif playButton.bHover and playButton.bActive then
            Hyperspace.FPS.speedEnabled = true
            Hyperspace.Sounds:PlaySoundMix("powerUpSystem", -1, false)
        end
    end
    return Defines.Chain.CONTINUE
end
script.on_internal_event(Defines.InternalEvents.ON_MOUSE_L_BUTTON_DOWN, function(x,y) return onClick(1) end)
script.on_internal_event(Defines.InternalEvents.ON_MOUSE_R_BUTTON_DOWN, function(x,y) return onClick(5) end)
