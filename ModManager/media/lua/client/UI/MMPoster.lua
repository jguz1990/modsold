---
--- Mod: Mod Manager
--- Workshop: https://steamcommunity.com/sharedfiles/filedetails/?id=2694448564
--- Author: NoctisFalco
--- Profile: https://steamcommunity.com/id/NoctisFalco/
---
--- Redistribution of this mod without explicit permission from the creator is prohibited
--- under any circumstances. This includes, but not limited to, uploading this mod to the Steam Workshop
--- or any other site, distribution as part of another mod or modpack, distribution of modified versions.
---

require('ISUI/ISCollapsableWindow')
require("ISUI/ISPanelJoypad")

MMPoster = ISPanelJoypad:derive("MMPoster")

-- ***********************
-- MMPosterWrapper
-- ***********************

MMPosterWrapper = ISCollapsableWindow:derive("MMPosterWrapper")
MMPosterWrapper.__index = MMPosterWrapper

function MMPosterWrapper:new(x, y, width, height)
    local o = ISCollapsableWindow:new(x, y, width, height)
    return o
end

function MMPosterWrapper:setVisible(bVisible)
    if self.javaObject then
        self.javaObject:setVisible(bVisible)
        if not bVisible then
            self.posterUI:destroy()
        end
    end
end

function MMPosterWrapper:prerender()
    ISCollapsableWindow.prerender(self)
end

function MMPosterWrapper:render()
    ISCollapsableWindow.render(self)
    --self.posterUI:updateJoypad()
end

function MMPosterWrapper:close()
    self:setVisible(false)
    self:removeFromUIManager()
end

-- ***********************
-- MMPoster
-- ***********************

function MMPoster:initialise()
    ISPanelJoypad.initialise(self)
    self.image = ISImage:new(0, 0, self.width, self:getHeight(), self.texture)
    self.image.scaledWidth = self:getWidth()
    self.image.scaledHeight = self.image.scaledWidth * self.proportions
    self.image.prerender = MMPoster.onPrerenderPoster
    self.image.onMouseDown = MMPoster.onMouseDownPoster
    self.image.onMouseUp = MMPoster.onMouseUpPoster
    self.image:initialise()
    self.image:instantiate()
    self:addChild(self.image)

    local btnHeight = getTextManager():getFontFromEnum(UIFont.Small):getLineHeight() + 6
    local btnPaddingBottom = 4
    local x = 10
    local y = self.height - btnPaddingBottom - btnHeight

    local btnWidth = getTextManager():MeasureStringX(UIFont.Small, getText("UI_Close")) + 30
    self.closeBtn = ISButton:new(x, y, btnWidth, btnHeight, getText("UI_Close"), self, MMPoster.onClick)
    self.closeBtn.internal = "CLOSE"
    self.closeBtn:initialise()
    self.closeBtn:instantiate()
    self.closeBtn.borderColor = { r = 1, g = 1, b = 1, a = 0.4 }
    self:addChild(self.closeBtn)

    x = self.closeBtn.x + self.closeBtn.width + 10
    btnWidth = getTextManager():MeasureStringX(UIFont.Small, "1:1") + 10
    self.scaleBtn = ISButton:new(x, y, btnWidth, btnHeight, "1:1", self, MMPoster.onClick)
    self.scaleBtn.internal = "SCALE"
    self.scaleBtn:initialise()
    self.scaleBtn:instantiate()
    self.scaleBtn.borderColor = { r = 1, g = 1, b = 1, a = 0.4 }
    self:addChild(self.scaleBtn)
end

function MMPoster:destroy()
    self:setVisible(false)
    self:removeFromUIManager()
    --if JoypadState.players[self.playerNum + 1] then
    --    setJoypadFocus(self.playerNum, nil)
    --end
end

function MMPoster:onClick(button)
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

function MMPoster:truePrerender()
    ISPanelJoypad.prerender(self)
    self:drawRect(0, 0, self.width, self.height, self.backgroundColor.a, self.backgroundColor.r, self.backgroundColor.g, self.backgroundColor.b)
    self:drawRectBorder(0, 0, self.width, self.height, self.borderColor.a, self.borderColor.r, self.borderColor.g, self.borderColor.b)
end

function MMPoster:onMouseDownPoster()
    self.parent:onMouseDown()
end

function MMPoster:onMouseDown()
    self.draggingStartingX = self:getMouseX()
    self.draggingStartingY = self:getMouseY()
    self.dragging = true
end

function MMPoster:onMouseUpPoster()
    self.parent:onMouseUp()
end

function MMPoster:onMouseUp()
    self:replacePoster()
    self.dragging = false
    self.draggingStartingX = 0
    self.draggingStartingY = 0
end

function MMPoster:replacePoster()
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

function MMPoster:onMouseUpOutside()
    self.dragging = false
    self:replacePoster()
end

function MMPoster:onMouseWheel(del)
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

function MMPoster:onMouseMove(dx, dy)
    if self.dragging then
        self.image:setX(self.image:getX() + dx)
        self.image:setY(self.image:getY() + dy)
        self:replacePoster()
    end
end

function MMPoster:onMouseMoveOutside(dx, dy)
    if self.dragging then
        self.image:setX(self.image:getX() + dx)
        self.image:setY(self.image:getY() + dy)
        self:replacePoster()
    end
end

function MMPoster:noRender()
end

function MMPoster:onPrerenderPoster()
    self.parent:setStencilRect(0, 0, self.parent.width, self.parent.height)
    ISImage.prerender(self)
    self.parent:clearStencilRect()
    self.parent.wrap:repaintStencilRect(0, 0, self.parent.wrap.width, self.parent.wrap.height)
    --if JoypadState.players[self.parent.playerNum + 1] then
    --    local rectY = self.parent.closeBtn:getY() - 4
    --    self.parent:drawRectStatic(0, rectY, self.width, self.height - rectY, 0.75, 0, 0, 0)
    --end
end

function MMPoster:updateJoypad()
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

function MMPoster:onGainJoypadFocus(joypadData)
    ISPanelJoypad.onGainJoypadFocus(self, joypadData)
    self.closeBtn:setJoypadButton(Joypad.Texture.BButton)
    self.scaleBtn:setJoypadButton(Joypad.Texture.XButton)
end

function MMPoster:onJoypadDown(button)
    ISPanelJoypad.onJoypadDown(self, button)
    if button == Joypad.BButton then
        self.closeBtn:forceClick()
    elseif button == Joypad.XButton then
        self.scaleBtn:forceClick()
    end
end

function MMPoster:new(poster)
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