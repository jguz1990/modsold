---
--- This file was originally created by Narrnika.
---

require('ISUI/ISTextEntryBox')
require('ISUI/ISScrollingListBox')

-- **********************************************
-- UITextEntryList
-- **********************************************

UITextEntryList = ISTextEntryBox:derive("UITextEntryList")

function UITextEntryList:new(title, x, y, width, height)
    local o = ISTextEntryBox:new(title, x, y, width, height)
    setmetatable(o, self)
    self.__index = self
    o.maxShowLine = 5
    o.options = {}
    o.isFocused = false
    o.expanded = false
    return o
end

function UITextEntryList:instantiate()
    ISTextEntryBox.instantiate(self)
    self:createChildren()
end

function UITextEntryList:createChildren()
    if UITextEntryList.SharedPopup then
        self.popup = UITextEntryList.SharedPopup
    else
        self.popup = UITextEntryListPopup:new()
        self.popup.drawBorder = true
        self.popup:initialise()
        self.popup:instantiate()
        self.popup:setAlwaysOnTop(true)
        self.popup:setCapture(true)
        UITextEntryList.SharedPopup = self.popup
    end
end

function UITextEntryList:addOption(text, data)
    table.insert(self.options, { text = text, data = data })
end

function UITextEntryList:showPopup()
    self.popup:setFont(self.font, 4)
    self.popup:setTextEntryList(self)
    self.popup:addToUIManager()
end

function UITextEntryList:hidePopup()
    self.popup:removeFromUIManager()
end

function UITextEntryList:prerender()
    local f = self.javaObject:isFocused()
    if f ~= self.isFocused then
        self.isFocused = f
        if f and #self.options > 0 then
            self:showPopup()
        end
    end

    ISTextEntryBox.prerender(self)
end

-- **********************************************
-- UITextEntryListPopup
-- **********************************************

UITextEntryListPopup = ISScrollingListBox:derive("UITextEntryListPopup")

function UITextEntryListPopup:new()
    local o = ISScrollingListBox:new(0, 0, 0, 0)
    setmetatable(o, self)
    self.__index = self
    self.parentTextEntry = nil
    o.backgroundColor = { r = 0, g = 0, b = 0, a = 1 }
    o.borderColor = { r = 1, g = 1, b = 1, a = 0.5 }
    return o
end

function UITextEntryListPopup:setTextEntryList(parent)
    self:clear()

    local options = parent.options
    for _, option in ipairs(options) do
        local title, text = option.text, option.text
        if option.data then
            title = title .. " [" .. tostring(option.data) .. "]"
        end
        self:addItem(title, text)
    end
    self:sort()

    --	self:setHeight(math.min(#options, parent.maxShowLine)*self.itemheight)
    self:setY(parent:getAbsoluteY() + parent:getHeight())
    self:setWidth(parent:getWidth())
    self:setX(parent:getAbsoluteX())

    self:setYScroll(0)
    self.selected = -1
    self.parentTextEntry = parent
end

function UITextEntryListPopup:doDrawItem(y, item, alt)
    local s1, s2 = string.find(string.lower(item.item), string.lower(self.parentTextEntry:getInternalText()), 1, true)
    if s1 ~= nil then
        local text = {
            string.sub(item.text, 0, s1 - 1),
            string.sub(item.text, s1, s2),
            string.sub(item.text, s2 + 1),
        }
        local text_x = {
            3,
            3 + getTextManager():MeasureStringX(self.font, text[1]),
            3 + getTextManager():MeasureStringX(self.font, text[1]) + getTextManager():MeasureStringX(self.font, text[2]),
        }
        local text_y = y + (self.itemheight - self.fontHgt) / 2

        if self:isMouseOver() and not self:isMouseOverScrollBar() and self.mouseoverselected == item.index then
            local textWid = getTextManager():MeasureStringX(self.font, item.text)
            local scrollWid = self:isVScrollBarVisible() and 13 or 0
            if 10 + textWid > self.width - scrollWid then
                self.tooWide = {
                    text = text,
                    text_x = text_x,
                    text_y = text_y,
                    y = y,
                }
            else
                self:drawRect(0, y, self:getWidth(), self.itemheight - 1, 1, 0.3, 0.3, 0.3)
            end
        end

        self:drawText(text[1], text_x[1], text_y, 0.6, 0.6, 0.6, 1, self.font)
        self:drawText(text[2], text_x[2], text_y, 0.95, 0.95, 0.95, 1, self.font)
        self:drawText(text[3], text_x[3], text_y, 0.6, 0.6, 0.6, 1, self.font)

        y = y + self.itemheight
    end

    if item.index == #self.items then
        self:setHeight(math.min(y, self.parentTextEntry.maxShowLine * self.itemheight))
    end
    return y
end

function UITextEntryListPopup:onMouseDown(x, y)
    if not self:isMouseOver() then
        self.parentTextEntry.expanded = false
        self.parentTextEntry:hidePopup()
    end
end

function UITextEntryListPopup:onMouseUp(x, y)
    if not self.parentTextEntry.expanded then
        self.parentTextEntry.expanded = true
        return
    end

    if not self:isMouseOver() then
        self.parentTextEntry.expanded = false
        self.parentTextEntry:hidePopup()
        return
    end

    if self.vscroll then
        self.vscroll.scrolling = false
    end

    local row = self:rowAt(x, y)
    if row > #self.items then
        row = #self.items
    elseif row < 1 then
        row = 1
    end

    self.parentTextEntry:setText(self.items[row].item)
    self.parentTextEntry:onTextChange()
    self.parentTextEntry.expanded = false
    self.parentTextEntry:hidePopup()
end

function UITextEntryListPopup:prerender()
    self.tooWide = nil
    ISScrollingListBox.prerender(self)
end

function UITextEntryListPopup:render()
    ISScrollingListBox.render(self)
    if self.tooWide then
        local item = self.tooWide
        local textWid = getTextManager():MeasureStringX(self.font, item.text[1] .. item.text[2] .. item.text[3])

        self:drawRect(1, item.y, 3 + textWid + 3, self.itemheight - 1, 1, 0.3, 0.3, 0.3)
        self:drawText(item.text[1], item.text_x[1], item.text_y, 0.6, 0.6, 0.6, 1, self.font)
        self:drawText(item.text[2], item.text_x[2], item.text_y, 0.95, 0.95, 0.95, 1, self.font)
        self:drawText(item.text[3], item.text_x[3], item.text_y, 0.6, 0.6, 0.6, 1, self.font)
    end
end
