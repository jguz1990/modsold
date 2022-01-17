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

require('ISUI/ISPanelJoypad')
require('UI/MMModalDialog')

local ICON_DELETE = getTexture("media/ui/MM_Button_Delete.png")
local ICON_SAVE = getTexture("media/ui/MM_Button_Save.png")

local FONT_HGT_SMALL = getTextManager():getFontHeight(UIFont.Small)

local BUTTON_HGT = math.max(25, FONT_HGT_SMALL + 3 * 2)
local BUTTON_WDH = 100
local DX, DY = 8, 8

-- ******************************
-- MMPanelPresets
-- ******************************

MMPanelPresets = ISPanelJoypad:derive("MMPanelPresets")

function MMPanelPresets:new(x, y, width, height)
    local o = ISPanelJoypad:new(x, y, width, height)
    setmetatable(o, self)
    self.__index = self
    o.background = false
    o.enable = true
    o.validateNameText = nil
    o.validateNameFunc = nil
    return o
end

function MMPanelPresets:createChildren()
    self.presetsLabel = ISLabel:new(DX, 0, BUTTON_HGT, getText("UI_ModManager_Presets_Label"), 1, 1, 1, 1, UIFont.Small, true)
    self:addChild(self.presetsLabel)

    self.presetsComboBox = ISComboBox:new(self.presetsLabel:getRight() + DX, 0, BUTTON_WDH * 2, BUTTON_HGT, self, self.onSelected)
    self.presetsComboBox.openUpwards = true
    self.presetsComboBox.noSelectionText = getText("UI_ModManager_Presets_NoSelection")
    self.presetsComboBox.borderColor = { r = 0.4, g = 0.4, b = 0.4, a = 1 }
    self:addChild(self.presetsComboBox)

    self.saveButton = MMImageButton:new(
            self.presetsComboBox:getRight() + DX, 0, BUTTON_HGT, BUTTON_HGT, self, self.onSavePresetRequest
    )
    self.saveButton:setImage(ICON_SAVE)
    self.saveButton:setPadding(DX, DY)
    self.saveButton.tooltip = getText("UI_ModManager_Button_Save")
    self:addChild(self.saveButton)

    self.delButton = MMImageButton:new(
            self.saveButton:getRight() + DX, 0, BUTTON_HGT, BUTTON_HGT, self, self.onDeletePresetRequest
    )
    self.delButton:setImage(ICON_DELETE)
    self.delButton:setPadding(DX, DY)
    self.delButton:setEnable(false)
    self.delButton.tooltip = getText("UI_ModManager_Button_Delete")
    self:addChild(self.delButton)
end

function MMPanelPresets:setEnable(enable)
    self.presetsComboBox.disabled = not enable
    self.saveButton:setEnable(enable)
end

function MMPanelPresets:updateOptions()
    error("Must override MMPanelPresets.updateOptions")
end

function MMPanelPresets:onSelected()
    local selectedItem = self.presetsComboBox.options[self.presetsComboBox.selected]
    local name, data = selectedItem.text, selectedItem.data

    self.delButton:setEnable(data == "user")

    self:onSelectedAux(name, data)
end

function MMPanelPresets:onSelectedAux(name, data)
    error("Must override MMPanelPresets.onSelectedAux")
end

function MMPanelPresets:onSavePresetRequest()
    local selectedItem = self.presetsComboBox.options[self.presetsComboBox.selected]
    local name = "New"
    if selectedItem and selectedItem.data == "user" then
        name = selectedItem.text
    end

    local modal = ISTextBox:new(
            (getCore():getScreenWidth() / 2) - 140, (getCore():getScreenHeight() / 2) - 90, 280, 180,
            getText("UI_ModManager_Presets_Save_Request"), name, self, self.onSavePreset
    )
    modal.maxChars = 50
    modal.noEmpty = true
    modal.validateTooltipText = self.validateNameText
    modal:initialise()
    modal:setCapture(true)
    modal:setAlwaysOnTop(true)
    modal:setValidateFunction(nil, self.validateNameFunc)
    modal:addToUIManager()
    modal.entry:focus()
end

function MMPanelPresets:onSavePreset(button)
    if button.internal == "OK" then
        local name = button.parent.entry:getText()

        self:onSavePresetAux(name)
        self:updateOptions()

        self.presetsComboBox:select(name)
        self.delButton:setEnable(true)
    end
end

function MMPanelPresets:onSavePresetAux(name)
    error("Must override MMPanelPresets.onSavePresetAux")
end

function MMPanelPresets:onDeletePresetRequest()
    local name = self.presetsComboBox.options[self.presetsComboBox.selected].text
    MMModalDialog.show(
            getText("UI_ModManager_Presets_Delete_Request", name), true, true,
            0, 0, 230, 120, self, self.onDeletePreset
    )
end

function MMPanelPresets:onDeletePreset(button)
    if button.internal == "YES" then
        local name = self.presetsComboBox.options[self.presetsComboBox.selected].text

        self:onDeletePresetAux(name)
        self:updateOptions()
    end
end

function MMPanelPresets:onDeletePresetAux(name)
    error("Must override MMPanelPresets.onDeletePresetAux")
end