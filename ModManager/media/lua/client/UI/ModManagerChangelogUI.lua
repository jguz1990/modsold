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

require('OptionScreens/ISModsNagPanel')

ModManagerChangelogUI = ISPanelJoypad:derive("ModManagerChangelogUI")

local FONT_HGT_LARGE = getTextManager():getFontHeight(UIFont.Large)
local FONT_HGT_SMALL = getTextManager():getFontHeight(UIFont.Small)

local BUTTON_HGT = math.max(25, FONT_HGT_SMALL + 3 * 2)
local BUTTON_WDH = 100
local DX, DY = 8, 8

function ModManagerChangelogUI:new(modID)
    local screenWidth, screenHeight = getCore():getScreenWidth(), getCore():getScreenHeight()
    local width, height = screenWidth / 3, screenHeight / 2
    local x, y = (screenWidth - width) / 2, (screenHeight - height) / 2
    local o = ISPanelJoypad:new(x, y, width, height)
    setmetatable(o, self)
    self.__index = self
    o.backgroundColor = { r = 0, g = 0, b = 0, a = 1 }
    o.modID = modID
    return o
end

function ModManagerChangelogUI:createChildren()
    ModManager.instance:loadChangelog(self.modID)

    self.richText = ISRichTextPanel:new(
            DX, FONT_HGT_LARGE + DY * 2, self.width - DX, self.height - FONT_HGT_LARGE - BUTTON_HGT - DY * 4
    )
    self.richText.background = false
    self.richText.autosetheight = false
    self.richText.clip = true
    self.richText.marginRight = self.richText.marginLeft
    self:addChild(self.richText)
    self.richText:addScrollBars()

    self.richText:setText(ModManager.instance.changelog)
    self.richText:paginate()

    self.okButton = MMButton:new(
            (self:getWidth() / 2) - BUTTON_WDH / 2, self:getHeight() - BUTTON_HGT - DY, BUTTON_WDH, BUTTON_HGT,
            getText("UI_Ok"), self, self.onOK
    )
    self.okButton.anchorTop = false
    self.okButton.anchorBottom = true
    self.okButton:initialise()
    self.okButton:instantiate()
    --	self.okButton.borderColor = {r=1, g=1, b=1, a=0.1}
    self:addChild(self.okButton)
end

function ModManagerChangelogUI:render()
    ISPanelJoypad.render(self)
    self:drawTextCentre(getText("UI_ModManager_Changelog"), self.width / 2, DY, 1, 1, 1, 1, UIFont.Large)
end

function ModManagerChangelogUI:onGainJoypadFocus(joypadData)
    ISPanelJoypad.onGainJoypadFocus(self, joypadData)
    self:setISButtonForA(self.okButton)
end

function ModManagerChangelogUI:onOK(button, x, y)
    self:setVisible(false)
    self:removeFromUIManager()
    if self.modID == ModManager.ID then
        ModSelector.instance:setVisible(true, self.joyfocus)
    elseif self.modID == ModManager.Server.ID then
        ServerModSelectorBeta.instance:setVisible(true)
    end
    ModManager.instance:onCloseChangelog(self.modID)
end

-- ******************************
-- ISModsNagPanel
-- ******************************

function ISModsNagPanel:onOK(button, x, y)
    self:setVisible(false)
    self:removeFromUIManager()
    ModSelector.instance:setVisible(true, self.joyfocus)
    ModSelector.instance:showChangelog()
end