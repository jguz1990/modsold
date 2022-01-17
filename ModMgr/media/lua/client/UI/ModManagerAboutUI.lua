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

local ICON_MOD = getTexture("media/ui/MM_Icon.png")
local ICON_KOFI = getTexture("media/ui/MM_ButtonWide_Kofi.png")
local ICON_PATREON = getTexture("media/ui/MM_ButtonWide_Patreon.png")

local FONT_HGT_MEDIUM = getTextManager():getFontHeight(UIFont.Medium)

local BUTTON_HGT = math.max(30, FONT_HGT_MEDIUM + 3 * 2)
local BUTTON_WDH = BUTTON_HGT * 5
local DX, DY, SP = 16, 16, 8

ModManagerAboutUI = ISPanel:derive("ModManagerAboutUI")

function ModManagerAboutUI:new()
    local o = ISPanel:new(0, 0, 0, 0)
    setmetatable(o, self)
    self.__index = self
    o.backgroundColor = { r = 0.13, g = 0.16, b = 0.22, a = 1 }
    o.borderColor = { r = 0.09, g = 0.12, b = 0.16, a = 1 }
    o.maxWidth = getCore():getScreenWidth() * 0.8
    o.maxHeight = getCore():getScreenHeight() * 0.8
    return o
end

local function getDescription()
    local d = getText("UI_ModManager_Info_ModVersion", ModManager.VERSION) .. " <LINE> "
    d = d .. getText("UI_ModManager_Info_Author") .. " NoctisFalco <LINE> <LINE> "
    d = d .. getText("UI_ModManager_About_Navigation")
    --if getTextOrNull("UI_ModManager_About_Translation") then
    --    -- UI_ModManager_About_Translation = "Translation: username (v1.0.0)"
    --    d = d .. " <LINE> " .. getText("UI_ModManager_About_Translation")
    --end
    return d
end

local function onClick(_, button)
    if button.internal == "KOFI" then
        ModManagerUtils.openUrl("https://ko-fi.com/noctisfalco")
    elseif button.internal == "PATREON" then
        ModManagerUtils.openUrl("https://www.patreon.com/NoctisFalco")
    end
end

function ModManagerAboutUI:initialise()
    ISPanel.initialise(self)
    self:setAlwaysOnTop(true)
    self:setCapture(true)

    local icon = ISImage:new(DX, DY, FONT_HGT_MEDIUM, FONT_HGT_MEDIUM, ICON_MOD)
    icon.scaledWidth = FONT_HGT_MEDIUM
    icon.scaledHeight = FONT_HGT_MEDIUM
    self:addChild(icon)

    local titleLabel = ISLabel:new(icon:getRight() + SP, DY, FONT_HGT_MEDIUM, getText("UI_ModManager"), 1, 1, 1, 1, UIFont.Medium, true)
    self:addChild(titleLabel)

    local richTextMaxWidth = self.maxWidth - DX
    local richText = ISRichTextPanel:new(DX, titleLabel:getBottom() + SP, richTextMaxWidth, 0)
    richText:setMargins(0, 0, DX, 0)
    richText:noBackground()
    richText:initialise()
    richText:setText(getDescription())
    self:addChild(richText)
    richText:paginate()

    local maxLineWidth = 0
    for i, v in ipairs(richText.lines) do
        local lineWidth = richText.lineX[i] + getTextManager():MeasureStringX(richText.defaultFont, v)
        if lineWidth > maxLineWidth then
            maxLineWidth = lineWidth
        end
    end
    richText:setWidth(maxLineWidth + richText.marginLeft + richText.marginRight)
    richText:paginate()

    local btnRowWidth = DX * 2 + BUTTON_WDH * 2 + SP
    if richText:getWidth() > richTextMaxWidth then
        richText:setWidth(richTextMaxWidth)
        richText:paginate()
    elseif richText:getWidth() < btnRowWidth - DX then
        richText:setWidth(btnRowWidth - DX)
        richText:paginate()
    end

    -- FIXME: scroll bar is outside of this window
    local richTextMaxHeight = self.maxHeight - titleLabel:getBottom() - BUTTON_HGT - SP - DY * 2
    if richText:getHeight() > richTextMaxHeight then
        richText.autosetheight = false
        richText:addScrollBars()
        richText:setHeight(richTextMaxHeight)
        richText:paginate()
    end

    local top = titleLabel:getBottom() + richText:getHeight() + DY
    local patreonButton = MMImageButton:new(DX, top + SP, BUTTON_WDH, BUTTON_HGT, self, onClick)
    patreonButton.internal = "PATREON"
    patreonButton:setImage(ICON_PATREON)
    self:addChild(patreonButton)

    local kofiButton = MMImageButton:new(DX + BUTTON_WDH + SP, top + SP, BUTTON_WDH, BUTTON_HGT, self, onClick)
    kofiButton.internal = "KOFI"
    kofiButton:setImage(ICON_KOFI)
    self:addChild(kofiButton)

    self:setWidth(richText:getWidth() + DX)
    self:setHeight(kofiButton:getBottom() + DY)
    self:setX(getMouseX() - self.width)
    self:setY(getMouseY())
end

function ModManagerAboutUI:onMouseDown(x, y)
    if not self:isMouseOver() then
        self:destroy()
    else
        ISPanel.onMouseDown(self, x, y)
    end
end

function ModManagerAboutUI:destroy()
    self:setVisible(false)
    self:removeFromUIManager()
end