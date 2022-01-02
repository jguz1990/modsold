---
--- This file was originally created by Narrnika.
---

require('ISUI/ISPanel')

-- **********************************************
-- UIPanelCompact
-- **********************************************

UIPanelCompact = ISPanel:derive("UIPanelCompact")

function UIPanelCompact:new(x, y, width, height)
    local o = ISPanel:new(x, y, width, height)
    setmetatable(o, self)
    self.__index = self
    o.imageExpanded = getTexture("media/ui/ArrowUp.png")
    o.imageCollapsed = getTexture("media/ui/ArrowDown.png")
    o.expanded = false
    o.font = UIFont.Small
    o.text = ""
    return o
end

function UIPanelCompact:createChildren()
    self.popup = UIPanelCompactPopup:new()
    self.popup.parentPanel = self
    self.popup.drawBorder = true
    self.popup:initialise()
    self.popup:instantiate()
    self.popup:setAlwaysOnTop(true)
    self.popup:setCapture(true)
end

function UIPanelCompact:showPopup()
    getSoundManager():playUISound("UIToggleComboBox")
    self.expanded = true
    self.popup:setX(self:getAbsoluteX())
    self.popup:setWidth(self:getWidth())
    self.popup:setY(self:getAbsoluteY() + self:getHeight())
    self.popup:resize()
    self.popup:addToUIManager()
end

function UIPanelCompact:hidePopup()
    getSoundManager():playUISound("UIToggleComboBox")
    self.expanded = false
    self.popup:removeFromUIManager()
end

function UIPanelCompact:onMouseDown(x, y)
    self.sawMouseDown = true
end

function UIPanelCompact:onMouseUp(x, y)
    if self.sawMouseDown then
        self.sawMouseDown = false
        self:showPopup()
    end
end

function UIPanelCompact:onMouseUpOutside(x, y)
    self.sawMouseDown = false
end

function UIPanelCompact:prerender()
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

-- **********************************************
-- UIPanelCompactPopup
-- **********************************************

UIPanelCompactPopup = ISPanel:derive("UIPanelCompactPopup")

function UIPanelCompactPopup:new()
    local o = ISPanel:new(0, 0, 0, 0)
    setmetatable(o, self)
    self.__index = self
    o.backgroundColor = { r = 0, g = 0, b = 0, a = 1 }
    return o
end

function UIPanelCompactPopup:resize()
    self:setHeight(200)
end

function UIPanelCompactPopup:onMouseDown(x, y)
    if not self:isMouseOver() then
        self.parentPanel:hidePopup()
    end
end
