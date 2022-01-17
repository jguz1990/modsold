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

local FONT_HGT_LARGE = getTextManager():getFontHeight(UIFont.Large)

local DX, DY = 8, 8

ModManagerSettingsUI = ISPanel:derive("ModManagerSettingsUI")

function ModManagerSettingsUI:new()
    local o = ISPanel:new(0, 0, 0, 0)
    setmetatable(o, self)
    self.__index = self
    o.backgroundColor = { r = 0, g = 0, b = 0, a = 1 }
    --o.borderColor = { r = 0.4, g = 0.4, b = 0.4, a = 1 }
    o.manager = ModManager.instance
    return o
end

function ModManagerSettingsUI:initialise()
    ISPanel.initialise(self)
    self:setAlwaysOnTop(true)
    self:setCapture(true)

    local titleLabel = ISLabel:new(
            DX, DY, FONT_HGT_LARGE, getText("UI_ModManager_Settings"), 1, 1, 1, 1, UIFont.Large, true
    )
    self:addChild(titleLabel)

    --local otherLabel = ISLabel:new(
    --        DX, titleLabel:getBottom() + DY * 2, FONT_HGT_MEDIUM, getText("UI_ModManager_Settings_Other"),
    --        1, 1, 1, 1, UIFont.Medium, true
    --)
    --self:addChild(otherLabel)

    self.tickBox = MMTickBox:new(
            DX, titleLabel:getBottom() + DY, 0, 0, nil, ModSelector.instance,
            function(target, optionIndex, optionValue, arg1, arg2, tickBox)
                if optionIndex == 2 then
                    target.getModsButton:setVisible(optionValue)
                end
            end
    )
    self.tickBox:addOption(getText("UI_ModManager_Settings_ShowCustomIcons"), "showCustomModIcons")
    self.tickBox:addOption(getText("UI_ModManager_Settings_ShowGetMods"), "showGetModsButton")
    self.tickBox:addOption(getText("UI_ModManager_Settings_ShowWelcome"), "showNagPanel")
    self.tickBox:setWidthToFit()
    self.tickBox.selected = { true, true, true }
    self:addChild(self.tickBox)

    local w1 = titleLabel.width
    local w2 = self.tickBox.width
    self:setWidth(math.max(w1, w2) + DX * 2)
    self:setHeight(self.tickBox:getBottom() + DY)
    self:setX(getMouseX() - self.width)
    self:setY(getMouseY())
end

function ModManagerSettingsUI:updateSettings()
    self.manager:setTickBoxSelectionFromSettings(self.tickBox, ModManager.SETTINGS_CLIENT)
end

function ModManagerSettingsUI:onMouseDown(x, y)
    if not self:isMouseOver() then
        self.manager:updateSettingsFromTickBox(self.tickBox, ModManager.SETTINGS_CLIENT)
        self.manager:saveSettings()
        self:destroy()
    end
end

function ModManagerSettingsUI:destroy()
    self:setVisible(false)
    self:removeFromUIManager()
end