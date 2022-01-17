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

require('ISUI/ISScrollingListBox')

local FONT_HGT_MEDIUM = getTextManager():getFontHeight(UIFont.Medium)
local FONT_HGT_SMALL = getTextManager():getFontHeight(UIFont.Small)

local BUTTON_HGT = math.max(25, FONT_HGT_SMALL + 3 * 2)
local DX, DY = 8, 8

-- ******************************
-- MMListBox
-- ******************************

MMListBox = ISScrollingListBox:derive("MMListBox")

function MMListBox:new(x, y, width, height)
    local o = ISScrollingListBox:new(x, y, width, height)
    setmetatable(o, self)
    self.__index = self
    o.drawBorder = true
    o.itemheight = math.max(FONT_HGT_MEDIUM + DY * 2, BUTTON_HGT)
    o.buttonColor = { r = 0.3, g = 0.3, b = 0.3, a = 1 }
    o.buttonColorPressed = { r = 0.15, g = 0.15, b = 0.15, a = 1 }
    o.buttonColorBorder = { r = 1, g = 1, b = 1, a = 0.3 }
    o.buttonColorText = { r = 1, g = 1, b = 1, a = 1 }
    o.enable = true
    o.disabledText = nil
    o.emptyText = nil
    --[[
    o.visibleItems = {} or nil -- { itemindex1, itemindex2, ... }
    o.items[index].item.visibleIndex = number or nil -- index in visibleItems
    ]]
    return o
end

function MMListBox:setEmptyText(text)
    self.emptyText = text
end

function MMListBox:setDisabledText(text)
    self.disabledText = text
end

function MMListBox:setEnable(enable)
    self.enable = enable
end

function MMListBox:checkFilter(item)
    return true
end

function MMListBox:updateFilter()
    local visibleItems = {}
    for _, i in ipairs(self.items) do
        local item = i.item
        if self:checkFilter(item) then
            table.insert(visibleItems, i.itemindex)
            item.visibleIndex = #visibleItems
        else
            item.visibleIndex = nil
        end
    end
    self.visibleItems = visibleItems
end

--- Sorting items by an item text ascending or using an argument function.
---@param func function the function to use
function MMListBox:sort(func)
    func = func or function(a, b) return a.text < b.text end
    table.sort(self.items, func)
    for i, item in ipairs(self.items) do
        item.itemindex = i
    end
end

function MMListBox:isEmpty()
    if not self.visibleItems then
        return #self.items == 0
    end
    return #self.items == 0 or #self.visibleItems == 0
end

function MMListBox:getSelectedItem()
    return self.items[self.selected].item
end

function MMListBox:doDrawItem(y, item, alt)
    error("Must override MMListBox.doDrawItem")
    return y
end

function MMListBox:doDrawButton(text, internal, x, y, w, h)
    local selected = self.mouseOverSelected
    local color = { a = 1, r = 0, g = 0, b = 0 }

    if self:getMouseX() > x and self:getMouseX() < x + w and self:getMouseY() > y and self:getMouseY() < y + h then
        if self.pressedButton and self.pressedButton.internal == internal and self.pressedButton.selected == selected then
            color = self.buttonColorPressed
        else
            color = self.buttonColor
        end
        self.mouseOverButton = { internal = internal, selected = selected }
    elseif self.mouseOverButton and self.mouseOverButton.internal == internal and self.mouseOverButton.selected == selected then
        self.mouseOverButton = nil
    end

    self:drawRect(x, y, w, h, color.a, color.r, color.g, color.b)
    self:drawRectBorder(x, y, w, h,
            self.buttonColorBorder.a,
            self.buttonColorBorder.r,
            self.buttonColorBorder.g,
            self.buttonColorBorder.b)
    self:drawTextCentre(text, x + w / 2, y + (BUTTON_HGT - FONT_HGT_SMALL) / 2,
            self.buttonColorText.r, self.buttonColorText.g, self.buttonColorText.b, self.buttonColorText.a,
            UIFont.Small)
end

function MMListBox:updateTooltip()
    ISScrollingListBox.updateTooltip(self)

    if (not self.enable or self.mouseOverButton) and self.tooltipUI and self.tooltipUI:isVisible() then
        self.tooltipUI:setVisible(false)
        self.tooltipUI:removeFromUIManager()
    end
end

function MMListBox:render()
    ISScrollingListBox.render(self)

    if not self.enable then
        self:drawRect(1, 1, self.width - 2, self.height - 2, 0.3, 0, 0, 0)
        if self.disabledText then
            self:drawTextCentre(self.disabledText, self.width / 2, self.height / 2, 1, 1, 1, 1, UIFont.Large)
        end
    elseif self.emptyText and self:isEmpty() then
        self:drawTextCentre(self.emptyText, self.width / 2, self.height / 2, 1, 1, 1, 1, UIFont.Medium)
    end
end

function MMListBox:onMouseWheel(del)
    if self.enable then
        ISScrollingListBox.onMouseWheel(self, del)
    end
end

function MMListBox:onMouseMove(dx, dy)
    if self:isMouseOverScrollBar() then
        self.mouseOverButton = nil
        return
    end

    if not self.enable then return end

    self.mouseOverSelected = self:rowAt(self:getMouseX(), self:getMouseY())
    if self.mouseOverButton and self.mouseOverButton.selected ~= self.mouseOverSelected then
        self.mouseOverButton = nil
    end
end

function MMListBox:onMouseMoveOutside(x, y)
    self.mouseOverSelected = -1
    self.mouseOverButton = nil
end

function MMListBox:onMouseDown(x, y)
    --self.keyboardFocus = true
    if not self.enable or self:isEmpty() then return end

    if self.mouseOverButton then
        self.pressedButton = self.mouseOverButton
    else
        ISScrollingListBox.onMouseDown(self, x, y)
    end
end

function MMListBox:onMouseUp(x, y)
    if self.enable
            and self.mouseOverButton and self.pressedButton
            and self.mouseOverButton.internal == self.pressedButton.internal
            and self.mouseOverButton.selected == self.pressedButton.selected then
        getSoundManager():playUISound("UIActivateButton")

        local selectedItem = self.items[self.pressedButton.selected].item
        self:onButtonClick(self.pressedButton, selectedItem)

        self.mouseOverButton = nil
        self.pressedButton = nil
    else
        self.pressedButton = nil
        ISScrollingListBox.onMouseUp(self, x, y)
    end
end

function MMListBox:onMouseUpOutside(x, y)
    self.pressedButton = nil
    --self.keyboardFocus = false
    --ISScrollingListBox.onMouseUpOutside(self, x, y) -- call error "attempted index: onMouseUpOutside of non-table" when "reload lua" and mouse cursor outside the panel
    if self.vscroll then self.vscroll.scrolling = false end
end

function MMListBox:onMouseDoubleClick(x, y)
    if self:isMouseOverScrollBar() then return end

    if not self.enable or self:isEmpty() then return end

    if self.mouseOverButton then
        self.pressedButton = self.mouseOverButton
        return
    end

    local item = self.items[self.selected].item
    self:onItemDoubleClick(item)
end

function MMListBox:onButtonClick(button, item)
end

function MMListBox:onItemDoubleClick(item)
end

function MMListBox:onKeyPressed(key)
    if not self.enable or self:isEmpty() then
        return false
    end

    local visibleIndex = self.items[self.selected].item.visibleIndex
    if key == Keyboard.KEY_UP then
        if visibleIndex ~= nil and visibleIndex > 1 then
            self.selected = self.visibleItems[visibleIndex - 1]
        end
    elseif key == Keyboard.KEY_DOWN then
        if visibleIndex ~= nil and visibleIndex < #self.visibleItems then
            self.selected = self.visibleItems[visibleIndex + 1]
        end
    elseif key == Keyboard.KEY_PRIOR then
        local step = math.floor(self.height / self.itemheight) - 1
        if visibleIndex ~= nil then
            if visibleIndex > step then
                self.selected = self.visibleItems[visibleIndex - step]
            else
                self.selected = self.visibleItems[1]
            end
        end
    elseif key == Keyboard.KEY_NEXT then
        local step = math.floor(self.height / self.itemheight) - 1
        if visibleIndex ~= nil then
            if visibleIndex < #self.visibleItems - step then
                self.selected = self.visibleItems[visibleIndex + step]
            else
                self.selected = self.visibleItems[#self.visibleItems]
            end
        end
    elseif key == Keyboard.KEY_HOME then
        self.selected = self.visibleItems[1]
    elseif key == Keyboard.KEY_END then
        self.selected = self.visibleItems[#self.visibleItems]
    else
        return false
    end
    self:ensureVisible(self.selected)

    return true
end