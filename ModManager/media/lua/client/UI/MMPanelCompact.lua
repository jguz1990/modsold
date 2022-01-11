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
--- This file is based on ISPanelCompact.lua from NRK Mod Selector by Narrnika and used with his permission.
--- Origin: https://steamcommunity.com/sharedfiles/filedetails/?id=2155197983
---

require('ISUI/ISPanel')

-- ******************************
-- MMPanelCompact
-- ******************************

MMPanelCompact = ISPanel:derive("MMPanelCompact")

function MMPanelCompact:new(x, y, width, height)
    local o = ISPanel:new(x, y, width, height)
    setmetatable(o, self)
    self.__index = self
    o.imageExpanded = getTexture("media/ui/ArrowUp.png")
    o.imageCollapsed = getTexture("media/ui/ArrowDown.png")
    o.enable = true
    o.expanded = false
    o.font = UIFont.Small
    o.text = ""
    return o
end

function MMPanelCompact:createChildren()
    self.popup = MMPanelCompactPopup:new()
    self.popup.parentPanel = self
    self.popup.drawBorder = true
    self.popup:initialise()
    self.popup:instantiate()
    self.popup:setAlwaysOnTop(true)
    self.popup:setCapture(true)
end

function MMPanelCompact:setEnable(enable)
    self.enable = enable
end

function MMPanelCompact:showPopup()
    getSoundManager():playUISound("UIToggleComboBox")
    self.expanded = true
    self.popup:setX(self:getAbsoluteX())
    self.popup:setWidth(self:getWidth())
    self.popup:setY(self:getAbsoluteY() + self:getHeight())
    self.popup:resize()
    self.popup:addToUIManager()
end

function MMPanelCompact:hidePopup()
    getSoundManager():playUISound("UIToggleComboBox")
    self.expanded = false
    self.popup:removeFromUIManager()
end

function MMPanelCompact:onMouseDown(x, y)
    if self.enable then
        self.sawMouseDown = true
    end
end

function MMPanelCompact:onMouseUp(x, y)
    if self.sawMouseDown then
        self.sawMouseDown = false
        self:showPopup()
    end
end

function MMPanelCompact:onMouseUpOutside(x, y)
    self.sawMouseDown = false
end

function MMPanelCompact:prerender()
    local image = self.expanded and self.imageExpanded or self.imageCollapsed
    local c = self:isMouseOver() and 1 or 0.4
    local image_x = self.width - image:getWidthOrig() - 3
    local image_y = self.height / 2 - image:getHeight() / 2

    self:drawRect(
            0, 0, self.width, self.height,
            1, 0, 0, 0
    )
    self:drawRectBorder(
            0, 0, self.width, self.height,
            1, 0.4, 0.4, 0.4
    )
    self:drawTexture(
            image, image_x, image_y,
            1, c, c, c
    )

    self:clampStencilRectToParent(0, 0, image_x - 3, self.height)
    self:drawText(
            self.text,
            10, (self.height - getTextManager():getFontHeight(self.font)) / 2,
            0.9, 0.9, 0.9, 1,
            self.font
    )
    self:clearStencilRect()
end

-- ******************************
-- MMPanelCompactPopup
-- ******************************

MMPanelCompactPopup = ISPanel:derive("MMPanelCompactPopup")

function MMPanelCompactPopup:new()
    local o = ISPanel:new(0, 0, 0, 0)
    setmetatable(o, self)
    self.__index = self
    o.backgroundColor = { r = 0, g = 0, b = 0, a = 1 }
    return o
end

function MMPanelCompactPopup:resize()
    self:setHeight(200)
end

function MMPanelCompactPopup:onMouseDown(x, y)
    if not self:isMouseOver() then
        self.parentPanel:hidePopup()
    end
end
