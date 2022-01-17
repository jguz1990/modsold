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

local ICON_DEFAULT = getTexture("media/ui/MM_Icon_ModDefault.png")

local FONT_HGT_TITLE = getTextManager():getFontHeight(UIFont.Title)
local FONT_HGT_MEDIUM = getTextManager():getFontHeight(UIFont.Medium)
local FONT_HGT_SMALL = getTextManager():getFontHeight(UIFont.Small)

local BUTTON_HGT = math.max(25, FONT_HGT_SMALL + 3 * 2)
local BUTTON_WDH = 100
local BUTTON_WDH2 = 160
local DX, DY = 8, 8

ModLoadOrderUI = ISPanel:derive("ModLoadOrderUI")

function ModLoadOrderUI:new()
    local width, height = ModSelector.instance.width / 2, ModSelector.instance.height
    local x, y = ModSelector.instance.x + width / 2, ModSelector.instance.y
    local o = ISPanel:new(x, y, width, height)
    setmetatable(o, self)
    self.__index = self
    o.borderColor = { r = 0.4, g = 0.4, b = 0.4, a = 1 }
    o.backgroundColor = { r = 0, g = 0, b = 0, a = 0.9 }
    ModLoadOrderUI.instance = o
    return o;
end

function ModLoadOrderUI:initialise()
    ISPanel.initialise(self)
    self:setAlwaysOnTop(true)
    self:setCapture(true)

    self.titleLabel = ISLabel:new(0, DY, FONT_HGT_TITLE, getText("UI_ModManager_LoadOrder"):upper(), 1, 1, 1, 1, UIFont.Title, true)
    self.titleLabel:setX((self.width - self.titleLabel:getWidth()) / 2)
    self:addChild(self.titleLabel)

    self.richText = ISRichTextLayout:new(self.width - DX * 2)
    self.richText:setMargins(DX, DY, DX, DY)
    self.richText:setText(getText("UI_ModManager_LoadOrder_Info"))
    self.richText:paginate()

    local top = self.titleLabel:getBottom() + self.richText:getHeight()
    self.listBox = ISScrollingListBox:new(
            DX, top, self.width - DX - BUTTON_WDH2 - DX * 2, self.height - top - BUTTON_HGT - DY * 2
    )
    self.listBox.itemheight = FONT_HGT_MEDIUM + DY * 2
    self.listBox.selected = 0
    self.listBox.joypadParent = self
    self.listBox.doDrawItem = self.drawData
    self.listBox.drawBorder = true
    self:addChild(self.listBox)

    self.moveUpButton = MMButton:new(
            self.width - DX - BUTTON_WDH2, self.listBox:getY(), BUTTON_WDH2, BUTTON_HGT,
            getText("UI_ModManager_LoadOrder_Button_MoveUp"), self, ModLoadOrderUI.onClick
    )
    self.moveUpButton.internal = "UP"
    self.moveUpButton.anchorTop = false
    self.moveUpButton.anchorBottom = true
    self:addChild(self.moveUpButton)

    self.moveDownButton = MMButton:new(
            self.width - DX - BUTTON_WDH2, self.moveUpButton:getBottom() + DY, BUTTON_WDH2, BUTTON_HGT,
            getText("UI_ModManager_LoadOrder_Button_MoveDown"), self, ModLoadOrderUI.onClick
    )
    self.moveDownButton.internal = "DOWN"
    self.moveDownButton.anchorTop = false
    self.moveDownButton.anchorBottom = true
    self:addChild(self.moveDownButton)

    local cancelButton = MMButton:new(
            DX, self.height - BUTTON_HGT - DY, BUTTON_WDH, BUTTON_HGT,
            getText("UI_ModManager_Button_Cancel"), self, ModLoadOrderUI.onClick
    )
    cancelButton.internal = "CANCEL"
    cancelButton.anchorTop = false
    cancelButton.anchorBottom = true
    self:addChild(cancelButton)

    local okButton = MMButton:new(
            self.width - BUTTON_WDH - DX, self.height - BUTTON_HGT - DY, BUTTON_WDH, BUTTON_HGT,
            getText("UI_Ok"), self, ModLoadOrderUI.onClick
    )
    okButton.internal = "OK"
    okButton.anchorTop = false
    okButton.anchorBottom = true
    self:addChild(okButton)
end

function ModLoadOrderUI:populateList()
    self.listBox:clear()

    local activeMods = ModSelector.instance:getActiveMods()
    local list = activeMods:getMods()
    for i = 0, list:size() - 1 do
        local modInfo = getModInfoByID(list:get(i))
        if modInfo then
            self.listBox:addItem(modInfo:getName(), { modInfo = modInfo })
        end
    end
end

function ModLoadOrderUI:drawData(y, item, alt)
    local h, s = self.itemheight, self:isVScrollBarVisible() and 13 or 0

    -- Check real line visibility
    local localY = self:getYScroll() + y
    if s ~= 0 and (localY < -h or localY > self:getHeight()) then
        return y + h - 1
    end

    if self.selected == item.index then
        self:drawRect(0, y, self:getWidth(), h, 0.3, 0.7, 0.35, 0.15)
    elseif self.mouseoverselected == item.index and not self:isMouseOverScrollBar() then
        self:drawRect(0, y, self:getWidth(), h, 0.95, 0.05, 0.05, 0.05)
    end
    self:drawRectBorder(0, y, self:getWidth(), h, 0.5, self.borderColor.r, self.borderColor.g, self.borderColor.b)

    self:drawTextureScaled(ICON_DEFAULT, DX, y + DY, FONT_HGT_MEDIUM, FONT_HGT_MEDIUM, 1)
    self:drawText(item.text, DX + FONT_HGT_MEDIUM + DX, y + DY, 1, 1, 1, 0.9, UIFont.Medium)

    return y + h - 1
end

function ModLoadOrderUI:prerender()
    self:bringToTop()
    self:updateButtons()

    self:drawRect(0, 0, self.width, self.height, self.backgroundColor.a, self.backgroundColor.r, self.backgroundColor.g, self.backgroundColor.b)
    self:drawRectBorder(0, 0, self.width, self.height, self.borderColor.a, self.borderColor.r, self.borderColor.g, self.borderColor.b)
end

function ModLoadOrderUI:render()
    ISPanel.render(self)
    self.richText:render(DX, self.titleLabel:getBottom(), self)
end

function ModLoadOrderUI:onMouseMoveOutside(dx, dy)
    return true
end

function ModLoadOrderUI:onMouseDownOutside(x, y)
    return true
end

function ModLoadOrderUI:onMouseUpOutside(x, y)
    return true
end

function ModLoadOrderUI:updateButtons()
    self.moveUpButton.enable = true
    self.moveDownButton.enable = true
    if self.listBox.selected == 1 then
        self.moveUpButton.enable = false
    end
    if self.listBox.selected == #self.listBox.items then
        self.moveDownButton.enable = false
    end
end

function ModLoadOrderUI:onClick(button)
    if button.internal == "CANCEL" then
        self:setVisible(false)
        self:removeFromUIManager()
        ModSelector.instance:setVisible(true)
    elseif button.internal == "OK" then
        local activeMods = ModSelector.instance:getActiveMods()
        activeMods:getMods():clear()
        for _, i in ipairs(self.listBox.items) do
            activeMods:getMods():add(i.item.modInfo:getId())
        end
        self:setVisible(false)
        self:removeFromUIManager()
        ModSelector.instance:setVisible(true)
    elseif button.internal == "UP" then
        local selected = self.listBox.selected
        local item = self.listBox.items[selected]
        self.listBox:removeItemByIndex(selected)
        self.listBox:insertItem(selected - 1, item.text, item.item)
        self.listBox.selected = selected - 1
        self.listBox:ensureVisible(self.listBox.selected)
    elseif button.internal == "DOWN" then
        local selected = self.listBox.selected
        local item = self.listBox.items[selected]
        self.listBox:removeItemByIndex(selected)
        self.listBox:insertItem(selected + 1, item.text, item.item)
        self.listBox.selected = selected + 1
        self.listBox:ensureVisible(self.listBox.selected)
    end
end