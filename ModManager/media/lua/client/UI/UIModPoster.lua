require("ISUI/ISPanelJoypad")

UIModPoster = ISPanelJoypad:derive("UIModPoster")

-- ***********************
-- UIModPosterWrapper
-- ***********************

UIModPosterWrapper = ISCollapsableWindow:derive("UIModPosterWrapper")
UIModPosterWrapper.__index = UIModPosterWrapper

function UIModPosterWrapper:new(x, y, width, height)
    local o = ISCollapsableWindow:new(x, y, width, height)
    return o
end

function UIModPosterWrapper:setVisible(bVisible)
    if self.javaObject then
        self.javaObject:setVisible(bVisible)
        if not bVisible then
            self.posterUI:destroy()
        end
    end
end

function UIModPosterWrapper:prerender()
    ISCollapsableWindow.prerender(self)
end

function UIModPosterWrapper:render()
    ISCollapsableWindow.render(self)
    --self.posterUI:updateJoypad()
end

function UIModPosterWrapper:close()
    self:setVisible(false)
    self:removeFromUIManager()
end

--function UIModPosterWrapper:isKeyConsumed(key)
--    return key == Keyboard.KEY_ESCAPE
--end
--
--function UIModPosterWrapper:onKeyRelease(key)
--    if key == Keyboard.KEY_ESCAPE then
--        self:close()
--    end
--end

-- ***********************
-- UIModPoster
-- ***********************

function UIModPoster:initialise()
    ISPanelJoypad.initialise(self)
    self.image = ISImage:new(0, 0, self.width, self:getHeight(), self.texture)
    self.image.scaledWidth = self:getWidth()
    self.image.scaledHeight = self.image.scaledWidth * self.proportions
    self.image.prerender = UIModPoster.onPrerenderPoster
    self.image.onMouseDown = UIModPoster.onMouseDownPoster
    self.image.onMouseUp = UIModPoster.onMouseUpPoster
    self.image:initialise()
    self.image:instantiate()
    self:addChild(self.image)

    local btnHeight = getTextManager():getFontFromEnum(UIFont.Small):getLineHeight() + 6
    local btnPaddingBottom = 4
    local x = 10
    local y = self.height - btnPaddingBottom - btnHeight

    local btnWidth = getTextManager():MeasureStringX(UIFont.Small, getText("UI_Close")) + 30
    self.closeBtn = ISButton:new(x, y, btnWidth, btnHeight, getText("UI_Close"), self, UIModPoster.onClick)
    self.closeBtn.internal = "CLOSE"
    self.closeBtn:initialise()
    self.closeBtn:instantiate()
    self.closeBtn.borderColor = { r = 1, g = 1, b = 1, a = 0.4 }
    self:addChild(self.closeBtn)

    x = self.closeBtn.x + self.closeBtn.width + 10
    btnWidth = getTextManager():MeasureStringX(UIFont.Small, "1:1") + 10
    self.scaleBtn = ISButton:new(x, y, btnWidth, btnHeight, "1:1", self, UIModPoster.onClick)
    self.scaleBtn.internal = "SCALE"
    self.scaleBtn:initialise()
    self.scaleBtn:instantiate()
    self.scaleBtn.borderColor = { r = 1, g = 1, b = 1, a = 0.4 }
    self:addChild(self.scaleBtn)
end

function UIModPoster:destroy()
    self:setVisible(false)
    self:removeFromUIManager()
    --if JoypadState.players[self.playerNum + 1] then
    --    setJoypadFocus(self.playerNum, nil)
    --end
end

function UIModPoster:onClick(button)
    if button.internal == "CLOSE" then
        self.wrap:close()
        --if JoypadState.players[self.playerNum + 1] then
        --    setJoypadFocus(self.playerNum, nil)
        --end
    end
    if button.internal == "SCALE" then
        self.image.scaledWidth = self.texture:getWidth()
        self.image.scaledHeight = self.texture:getHeight()
    end
end

function UIModPoster:truePrerender()
    ISPanelJoypad.prerender(self)
    self:drawRect(0, 0, self.width, self.height, self.backgroundColor.a, self.backgroundColor.r, self.backgroundColor.g, self.backgroundColor.b)
    self:drawRectBorder(0, 0, self.width, self.height, self.borderColor.a, self.borderColor.r, self.borderColor.g, self.borderColor.b)
end

function UIModPoster:onMouseDownPoster()
    self.parent:onMouseDown()
end

function UIModPoster:onMouseDown()
    self.draggingStartingX = self:getMouseX()
    self.draggingStartingY = self:getMouseY()
    self.dragging = true
end

function UIModPoster:onMouseUpPoster()
    self.parent:onMouseUp()
end

function UIModPoster:onMouseUp()
    self:replacePoster()
    self.dragging = false
    self.draggingStartingX = 0
    self.draggingStartingY = 0
end

function UIModPoster:replacePoster()
    local marginX = self.width / 2
    local marginY = self.height / 2
    if self.image:getX() > marginX then
        self.image:setX(marginX)
    end
    if self.image:getY() > marginY then
        self.image:setY(marginY)
    end
    if self.image.x + self.image.scaledWidth < self:getWidth() - marginX then
        self.image:setX(self:getWidth() - marginX - self.image.scaledWidth)
    end
    if self.image.y + self.image.scaledHeight < self:getHeight() - marginY then
        self.image:setY(self:getHeight() - marginY - self.image.scaledHeight)
    end
end

function UIModPoster:onMouseUpOutside()
    self.dragging = false
    self:replacePoster()
end

function UIModPoster:onMouseWheel(del)
    local xScale = self.image.scaledWidth / self.texture:getWidth()
    local yScale = self.image.scaledHeight / self.texture:getHeight()
    -- limit the zoom to x2
    if xScale > 2 and del < 0 then return true end

    local originalWidth = self.image.scaledWidth
    local originalHeight = self.image.scaledHeight

    local oldCenterX = (self.width / 2 - self.image.javaObject:getX() - (9 * xScale)) / xScale
    local oldCenterY = (self.height / 2 - self.image.javaObject:getY() - (9 * yScale)) / yScale

    self.image.scaledWidth = self.image.scaledWidth + del * -self.zoomingPercent
    self.image.scaledHeight = self.image.scaledWidth * self.proportions
    originalWidth = self.image.scaledWidth - originalWidth
    originalHeight = self.image.scaledHeight - originalHeight
    xScale = self.image.scaledWidth / self.texture:getWidth()
    yScale = self.image.scaledHeight / self.texture:getHeight()
    originalWidth = originalWidth / 2
    originalHeight = originalHeight / 2

    local newCenterXLocal = (self.width + (-2 * oldCenterX - 18) * xScale) / 2
    local newCenterYLocal = (self.height + (-2 * oldCenterY - 18) * yScale) / 2

    local doMove = true
    if self.image.scaledWidth < self.width then
        self.image.scaledWidth = self.width
        self.image.scaledHeight = self.image.scaledWidth * self.proportions
        doMove = false
    end
    if self.image.scaledHeight < self.height then
        self.image.scaledHeight = self.height
        doMove = false
    end
    if doMove then
        self.image:setX(newCenterXLocal)
        self.image:setY(newCenterYLocal)
    else
        self.image:setX(0)
        self.image:setY(0)
    end
    self:replacePoster()
    return true
end

function UIModPoster:onMouseMove(dx, dy)
    if self.dragging then
        self.image:setX(self.image:getX() + dx)
        self.image:setY(self.image:getY() + dy)
        self:replacePoster()
    end
end

function UIModPoster:onMouseMoveOutside(dx, dy)
    if self.dragging then
        self.image:setX(self.image:getX() + dx)
        self.image:setY(self.image:getY() + dy)
        self:replacePoster()
    end
end

function UIModPoster:noRender()
end

function UIModPoster:onPrerenderPoster()
    self.parent:setStencilRect(0, 0, self.parent.width, self.parent.height)
    ISImage.prerender(self)
    self.parent:clearStencilRect()
    self.parent.wrap:repaintStencilRect(0, 0, self.parent.wrap.width, self.parent.wrap.height)
    --if JoypadState.players[self.parent.playerNum + 1] then
    --    local rectY = self.parent.closeBtn:getY() - 4
    --    self.parent:drawRectStatic(0, rectY, self.width, self.height - rectY, 0.75, 0, 0, 0)
    --end
end

function UIModPoster:updateJoypad()
    if self.getJoypadFocus then
        self.getJoypadFocus = false
        if JoypadState.players[self.playerNum + 1] then
            setJoypadFocus(self.playerNum, self)
        end
    end

    self.updateMS = self.updateMS or getTimestampMs()
    local dt = getTimestampMs() - self.updateMS
    self.updateMS = getTimestampMs()

    if self.joyfocus == nil then return end

    self.JPZoomInc = 0
    if isJoypadPressed(self.joyfocus.id, Joypad.LBumper) then
        self.JPZoomInc = dt / 1000 * 10
    end
    if isJoypadPressed(self.joyfocus.id, Joypad.RBumper) then
        self.JPZoomInc = -dt / 1000 * 10
    end
    if self.JPZoomInc ~= 0 then
        self:onMouseWheel(self.JPZoomInc)
    end

    local x = getControllerPovX(self.joyfocus.id)
    local y = getControllerPovY(self.joyfocus.id)
    if x ~= 0 or y ~= 0 then
        local scale = self.image.scaledWidth / self.texture:getWidth()
        local scrollDelta = -dt / 1000 * self.tex:getWidth() * 0.25 / scale
        self.image:setX(self.image:getX() + scrollDelta * x)
        self.image:setY(self.image:getY() + scrollDelta * y)
        self:replacePoster()
    end
end

function UIModPoster:onGainJoypadFocus(joypadData)
    ISPanelJoypad.onGainJoypadFocus(self, joypadData)
    self.closeBtn:setJoypadButton(Joypad.Texture.BButton)
    self.scaleBtn:setJoypadButton(Joypad.Texture.XButton)
end

function UIModPoster:onJoypadDown(button)
    ISPanelJoypad.onJoypadDown(self, button)
    if button == Joypad.BButton then
        self.closeBtn:forceClick()
    elseif button == Joypad.XButton then
        self.scaleBtn:forceClick()
    end
end

function UIModPoster:new(poster)
    local o = ISPanelJoypad:new(0, 0, 0, 0) -- x, y, width, height
    setmetatable(o, self)
    self.__index = self
    o.texture = getTexture(poster)
    o.proportions = o.texture:getHeight() / o.texture:getWidth()

    local width = o.texture:getWidth()
    local height = o.texture:getHeight()
    local availWidth = ModSelector.instance.width
    local availHeight = ModSelector.instance.height
    if width > availWidth then
        width = availWidth
        height = width * o.proportions
    end
    if height > availHeight then
        height = availHeight
        width = height * (1 / o.proportions)
    end

    o.x = (ModSelector.instance:getX() + ModSelector.instance.width - width) / 2
    o.y = (ModSelector.instance:getY() + ModSelector.instance.height - height) / 2
    o:setX(o.x)
    o:setY(o.y)
    o.width = width
    o.height = height
    o.anchorLeft = true
    o.anchorRight = true
    o.anchorTop = true
    o.anchorBottom = true
    o.zooming = false
    o.dragging = false
    o.zoomX = 0
    o.zoomY = 0
    o.zoomingPercent = 100
    o.draggingStartingX = 0
    o.draggingStartingY = 0
    o.JPZoomInc = 0.0
    o.getJoypadFocus = false
    return o
end