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
local selectedButton = 2
local ipsButtons = {slowButton, normButton, fastButton}

-- Variant 2
local playButton = Hyperspace.Button()
playButton:OnInit("statusUI/top_speed_play", Hyperspace.Point(580, -5))
playButton.hitbox.x = 8 + playButton.position.x
playButton.hitbox.y = 8 + playButton.position.y
playButton.hitbox.w = 20
playButton.hitbox.h = 20
local pauseButton = Hyperspace.Button()
pauseButton:OnInit("statusUI/top_speed_pause", Hyperspace.Point(580, -5))
pauseButton.hitbox.x = 8 + pauseButton.position.x
pauseButton.hitbox.y = 8 + pauseButton.position.y
pauseButton.hitbox.w = 20
pauseButton.hitbox.h = 20
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
local numberImage = {
    image = Hyperspace.Resources:CreateImagePrimitiveString("statusUI/top_speed_number.png", 0, 0, 0, Graphics.GL_Color(1, 1, 1, 1), 1, false),
    x = 555,
    y = -5
}

script.on_internal_event(Defines.InternalEvents.ON_TICK, function()
    if not Hyperspace.App.world.bStartedGame then return end

    local mousePos = Hyperspace.Mouse.position
    if Hyperspace.metaVariables.speedui_setting == 1 then
        for i, button in ipairs(ipsButtons) do
            button.bActive = (selectedButton ~= i)
            button:MouseMove(mousePos.x, mousePos.y, false)
        end
        selectedButton = (Hyperspace.FPS.speedLevel < 0 and 1) or (Hyperspace.FPS.speedLevel == 0 and 2) or 3
    elseif Hyperspace.metaVariables.speedui_setting == 2 then
        local speedLimit = (Hyperspace.Settings.frameLimit or Hyperspace.Settings.vsync) and 2 or 99
        local currSpeed = Hyperspace.FPS.speedLevel
        if currSpeed > speedLimit then Hyperspace.FPS.speedLevel = speedLimit
        elseif currSpeed < -2 then Hyperspace.FPS.speedLevel = -2 end

        if Hyperspace.FPS.speedEnabled then
            pauseButton:MouseMove(mousePos.x, mousePos.y, false)
            pauseButton.bActive = true
            playButton.bActive = false
        else
            playButton:MouseMove(mousePos.x, mousePos.y, false)
            playButton.bActive = true
            pauseButton.bActive = false
        end

        upButton.bActive = true
        upButton:MouseMove(mousePos.x, mousePos.y, false)
        if currSpeed >= speedLimit then
            upButton.bActive = false
        end

        downButton.bActive = true
        downButton:MouseMove(mousePos.x, mousePos.y, false)
        if currSpeed <= -2 then
            downButton.bActive = false
        end
    end
end)

script.on_render_event(Defines.RenderEvents.FTL_BUTTON, function() end, function()
    if not Hyperspace.App.world.bStartedGame then return end

    if Hyperspace.metaVariables.speedui_setting == 0 then
        Graphics.CSurface.GL_SetColor(Graphics.GL_Color(1, 1, 1, 1))
        Graphics.freetype.easy_printCenter(51, 573, 18, Hyperspace.Text:GetText("ftl_drive"))
    elseif Hyperspace.metaVariables.speedui_setting == 1 then
        for _, button in ipairs(ipsButtons) do button:OnRender() end
    elseif Hyperspace.metaVariables.speedui_setting == 2 then
        local currSpeed = Hyperspace.FPS.speedLevel

        if Hyperspace.FPS.speedEnabled then pauseButton:OnRender()
        else playButton:OnRender() end

        Graphics.CSurface.GL_PushMatrix()
        Graphics.CSurface.GL_Translate(numberImage.x, numberImage.y, 0)
        Graphics.CSurface.GL_RenderPrimitive(numberImage.image)
        Graphics.freetype.easy_printCenter(1, 18, 11, math.floor(currSpeed))
        Graphics.CSurface.GL_PopMatrix()

        upButton:OnRender()
        downButton:OnRender()
    end
end)

script.on_internal_event(Defines.InternalEvents.ON_MOUSE_L_BUTTON_DOWN, function(x,y) 
    if Hyperspace.metaVariables.speedui_setting == 1 then
        if slowButton.bHover and slowButton.bActive then
            Hyperspace.FPS.speedEnabled = true
            Hyperspace.FPS.speedLevel = -2
            selectedButton = 1
            Hyperspace.Sounds:PlaySoundMix("powerUpSystem", -1, false)
        end
        if normButton.bHover and normButton.bActive then
            Hyperspace.FPS.speedEnabled = true
            Hyperspace.FPS.speedLevel = 0
            selectedButton = 2
            Hyperspace.Sounds:PlaySoundMix("powerUpSystem", -1, false)
        end
        if fastButton.bHover and fastButton.bActive then
            Hyperspace.FPS.speedEnabled = true
            Hyperspace.FPS.speedLevel = 2
            selectedButton = 3
            Hyperspace.Sounds:PlaySoundMix("powerUpSystem", -1, false)
        end
    elseif Hyperspace.metaVariables.speedui_setting == 2 then
        selectedButton = 0
        if (playButton.bHover and playButton.bActive) or (pauseButton.bHover and pauseButton.bActive) then
            Hyperspace.FPS.speedEnabled = not Hyperspace.FPS.speedEnabled
        elseif upButton.bHover and upButton.bActive then
            Hyperspace.FPS.speedLevel = Hyperspace.FPS.speedLevel + 1
            Hyperspace.Sounds:PlaySoundMix("powerUpSystem", -1, false)
            Hyperspace.metaVariables.speedui_speed = Hyperspace.FPS.speedLevel
        elseif downButton.bHover and downButton.bActive then
            Hyperspace.FPS.speedLevel = Hyperspace.FPS.speedLevel - 1
            Hyperspace.Sounds:PlaySoundMix("powerUpSystem", -1, false)
            Hyperspace.metaVariables.speedui_speed = Hyperspace.FPS.speedLevel
        end
    end
    return Defines.Chain.CONTINUE
end)

script.on_internal_event(Defines.InternalEvents.ON_MOUSE_R_BUTTON_DOWN, function(x,y) 
    if Hyperspace.metaVariables.speedui_setting == 1 then
        if slowButton.bHover and slowButton.bActive then
            Hyperspace.FPS.speedEnabled = true
            Hyperspace.FPS.speedLevel = -2
            selectedButton = 1
            Hyperspace.Sounds:PlaySoundMix("powerUpSystem", -1, false)
        end
        if normButton.bHover and normButton.bActive then
            Hyperspace.FPS.speedEnabled = true
            Hyperspace.FPS.speedLevel = 0
            selectedButton = 2
            Hyperspace.Sounds:PlaySoundMix("powerUpSystem", -1, false)
        end
        if fastButton.bHover and fastButton.bActive then
            Hyperspace.FPS.speedEnabled = true
            Hyperspace.FPS.speedLevel = 2
            selectedButton = 3
            Hyperspace.Sounds:PlaySoundMix("powerUpSystem", -1, false)
        end
    elseif Hyperspace.metaVariables.speedui_setting == 2 then
        selectedButton = 0
        if (playButton.bHover and playButton.bActive) or (pauseButton.bHover and pauseButton.bActive) then
            Hyperspace.FPS.speedEnabled = not Hyperspace.FPS.speedEnabled
        elseif upButton.bHover and upButton.bActive then
            Hyperspace.FPS.speedLevel = Hyperspace.FPS.speedLevel + 5
            Hyperspace.Sounds:PlaySoundMix("powerUpSystem", -1, false)
            Hyperspace.metaVariables.speedui_speed = Hyperspace.FPS.speedLevel
        elseif downButton.bHover and downButton.bActive then
            Hyperspace.FPS.speedLevel = Hyperspace.FPS.speedLevel - 5
            Hyperspace.Sounds:PlaySoundMix("powerUpSystem", -1, false)
            Hyperspace.metaVariables.speedui_speed = Hyperspace.FPS.speedLevel
        end
    end
    return Defines.Chain.CONTINUE
end)

-- Loading back the speed level for variant 2, reset variant 1
script.on_init(function()
    selectedButton = 2
    Hyperspace.FPS.speedLevel = 0
    Hyperspace.FPS.speedEnabled = false
    if Hyperspace.metaVariables.speedui_setting == 2 then
        Hyperspace.FPS.speedLevel = Hyperspace.metaVariables.speedui_speed
    end
end)
