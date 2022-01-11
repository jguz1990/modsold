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
--- This file is based on ModSelector.lua from NRK Mod Selector by Narrnika and used with his permission.
--- Origin: https://steamcommunity.com/sharedfiles/filedetails/?id=2155197983
---

require('luautils')
require('ModManager')
require('ModManagerUtils')
require('UI/MMListBox')
require('UI/MMPanelPresets')

local ICON_DEFAULT = getTexture("media/ui/MM_Icon_ModDefault.png")
local ICON_DEFAULT_GREY = getTexture("media/ui/MM_Icon_ModDefaultGrey.png")
local ICON_MAP = getTexture("media/ui/MM_Icon_ModMap.png")
local ICON_MAP_GREY = getTexture("media/ui/MM_Icon_ModMapGrey.png")
local ICON_ACTIVE = getTexture("media/ui/MM_Icon_StatusActive.png")
local ICON_REQUIRED = getTexture("media/ui/MM_Icon_StatusRequired.png")
local ICON_BROKEN = getTexture("media/ui/icon_broken.png")
local ICON_FAVORITE = getTexture("media/ui/FavoriteStar.png")
local ICON_MINUS = getTexture("media/ui/Moodle_internal_minus_red.png")
local ICON_PLUS = getTexture("media/ui/Moodle_internal_plus_green.png")
local ICON_STEAM = getTexture("media/ui/MM_Icon_LocationSteam.png")
local ICON_FOLDER = getTexture("media/ui/MM_Icon_LocationMods.png")
local ICON_FOLDER_W = getTexture("media/ui/MM_Icon_LocationWorkshop.png")

local FONT_HGT_TITLE = getTextManager():getFontHeight(UIFont.Title)
local FONT_HGT_MEDIUM = getTextManager():getFontHeight(UIFont.Medium)
local FONT_HGT_SMALL = getTextManager():getFontHeight(UIFont.Small)

local BUTTON_HGT = math.max(25, FONT_HGT_SMALL + 3 * 2)
local BUTTON_WDH = 100
local BUTTON_SQ = math.min(48, FONT_HGT_SMALL * 2 + 8)
local DX, DY = 8, 8

ModSelector = ISPanelJoypad:derive("ModSelector")
local ModListBox = MMListBox:derive("ModListBox")
local ModPanelPoster = ISPanelJoypad:derive("ModPanelPoster")
local ModPanelThumbnail = ISPanelJoypad:derive("ModPanelThumbnail")
local ModPanelInfo = ISPanelJoypad:derive("ModPanelInfo")
local ModPanelPresets = MMPanelPresets:derive("ModPanelPresets")

function ModSelector:new(x, y, width, height)
    local o = ISPanelJoypad:new(x, y, width, height)
    ModSelector.instance = o
    setmetatable(o, self)
    self.__index = self
    o.backgroundColor = { r = 0, g = 0, b = 0, a = 0.3 }
    o.borderColor = { r = 1, g = 1, b = 1, a = 0.2 }
    o.anchorLeft = true
    o.anchorRight = false
    o.anchorTop = true
    o.anchorBottom = false
    o.mapGroups = MapGroups.new()
    o.manager = ModManager:new()
    o.counters = {} -- see ModSelector.populateListBox()
    o.ignoreNextTabKey = false -- see ModSelector.onKeyPressed(key) and MMTextEntryList.onOtherKey(key)
    --[[
    o.activeModsCopy = ActiveMods -- copy of initially ActiveMods, see ModSelector:populateListBox()
    o.isNewGame = false/true -- when called from MainScreen.lua or NewGameScreen.lua
    o.loadGameFolder = folder -- when called from LoadGameScreen.lua
    ]]
    return o
end

function ModSelector:create()
    self.backgroundColor = { r = 0, g = 0, b = 0, a = 0.95 }

    local halfW = (self.width - 3 * DX) / 2
    local halfH = (self.height - (FONT_HGT_TITLE + DY * 2 + BUTTON_HGT + DY * 2 + DY)) / 2

    self.titleLabel = ISLabel:new(0, DY, FONT_HGT_TITLE, getText("UI_ModManager"):upper(), 1, 1, 1, 1, UIFont.Title, true)
    self.titleLabel:setX((self.width - self.titleLabel:getWidth()) / 2)
    self:addChild(self.titleLabel)

    self.aboutButton = MMImageButton:new(
            self.width - FONT_HGT_TITLE - DX, self.titleLabel:getY(),
            FONT_HGT_TITLE, FONT_HGT_TITLE, self, self.onButtonClick
    )
    self.aboutButton.internal = "ABOUT"
    self.aboutButton:setImage(getTexture("media/ui/MM_Button_About.png"))
    self.aboutButton:setPadding(DX, DY)
    self:addChild(self.aboutButton)

    self.settingsButton = MMImageButton:new(
            self.aboutButton:getX() - FONT_HGT_TITLE - DX, self.titleLabel:getY(),
            FONT_HGT_TITLE, FONT_HGT_TITLE, self, self.onButtonClick
    )
    self.settingsButton.internal = "SETTINGS"
    self.settingsButton:setImage(getTexture("media/ui/MM_Button_Settings.png"))
    self.settingsButton:setPadding(DX, DY)
    self:addChild(self.settingsButton)

    self.filterPanel = MMPanelFilter:new(DX, FONT_HGT_TITLE + DY * 2, halfW, BUTTON_HGT * 3 + DY * 4)
    self.filterPanel:setSettingsCategory(ModManager.SETTINGS_CLIENT)
    self:addChild(self.filterPanel)

    self.listBox = ModListBox:new(DX, self.filterPanel:getBottom() + DY, halfW, halfH * 2 - self.filterPanel:getHeight())
    self.listBox:setEmptyText(getText("UI_ModManager_List_Empty"))
    self:addChild(self.listBox)

    self.infoPanel = ModPanelInfo:new(halfW + DX * 2, FONT_HGT_TITLE + DY * 2, halfW, halfH * 2 + DY)
    self:addChild(self.infoPanel)
    self.infoPanel:addScrollBars()
    self.infoPanel:setScrollChildren(true)
    self.infoPanel:initialise()

    self.backButton = MMButton:new(
            DX, self.height - (DY + BUTTON_HGT), BUTTON_WDH, BUTTON_HGT,
            getText("UI_ModManager_Button_Back"):upper(), self, self.onBack
    )
    self.backButton:setAnchorTop(false)
    self.backButton:setAnchorBottom(true)
    self.backButton:setWidthToTitle(BUTTON_WDH)
    self:addChild(self.backButton)

    self.acceptButton = MMButton:new(
            self.width - (DX + BUTTON_WDH), self.height - (DY + BUTTON_HGT), BUTTON_WDH, BUTTON_HGT,
            getText("UI_ModManager_Button_Accept"):upper(), self, self.onAccept
    )
    self.acceptButton:setAnchorLeft(false)
    self.acceptButton:setAnchorRight(true)
    self.acceptButton:setAnchorTop(false)
    self.acceptButton:setAnchorBottom(true)
    self.acceptButton:setWidthToTitle(BUTTON_WDH)
    self.acceptButton:setX(self.width - (DX + self.acceptButton:getWidth()))
    self:addChild(self.acceptButton)

    self.mapsOrderButton = MMButton:new(
            self.width - (DX + BUTTON_WDH), self.height - (DY + BUTTON_HGT), BUTTON_WDH, BUTTON_HGT,
            getText("UI_ModManager_Button_MapsOrder"), self, ModSelector.onButtonClick
    )
    self.mapsOrderButton.internal = "MAPS_ORDER"
    self.mapsOrderButton:setAnchorLeft(false)
    self.mapsOrderButton:setAnchorRight(true)
    self.mapsOrderButton:setAnchorTop(false)
    self.mapsOrderButton:setAnchorBottom(true)
    self.mapsOrderButton:setWidthToTitle(BUTTON_WDH)
    self.mapsOrderButton:setX(self.acceptButton:getX() - (DX + self.mapsOrderButton:getWidth()))
    self:addChild(self.mapsOrderButton)

    self.modsOrderButton = MMButton:new(
            self.width - (DX + BUTTON_WDH), self.height - (DY + BUTTON_HGT), BUTTON_WDH, BUTTON_HGT,
            getText("UI_ModManager_LoadOrder"), self, ModSelector.onButtonClick
    )
    self.modsOrderButton.internal = "MODS_ORDER"
    self.modsOrderButton:setAnchorLeft(false)
    self.modsOrderButton:setAnchorRight(true)
    self.modsOrderButton:setAnchorTop(false)
    self.modsOrderButton:setAnchorBottom(true)
    self.modsOrderButton:setWidthToTitle(BUTTON_WDH)
    self.modsOrderButton:setX(self.mapsOrderButton:getX() - (DX + self.modsOrderButton:getWidth()))
    self:addChild(self.modsOrderButton)

    self.serverManagerButton = MMButton:new(
            self.width - (DX + BUTTON_WDH), self.height - (DY + BUTTON_HGT), BUTTON_WDH, BUTTON_HGT,
            getText("UI_ModManager_Button_Server"), self, ModSelector.onButtonClick
    )
    self.serverManagerButton.internal = "SERVER_MANAGER"
    self.serverManagerButton:setAnchorLeft(false)
    self.serverManagerButton:setAnchorRight(true)
    self.serverManagerButton:setAnchorTop(false)
    self.serverManagerButton:setAnchorBottom(true)
    self.serverManagerButton:setWidthToTitle(BUTTON_WDH)
    self.serverManagerButton:setX(self.modsOrderButton:getX() - (DX + self.serverManagerButton:getWidth()))
    self:addChild(self.serverManagerButton)
    if not getActivatedMods():contains("ModManagerServer") then
        self.serverManagerButton:setEnable(false)
        self.serverManagerButton.tooltip = "Coming: When It's Ready (c)"
    end

    self.getModsButton = MMButton:new(
            self.width - (DX + BUTTON_WDH) * 2, self.height - (DY + BUTTON_HGT), BUTTON_WDH, BUTTON_HGT,
            getText("UI_mods_GetModsHere"), self, ModSelector.onButtonClick
    )
    self.getModsButton.internal = "GET_MODS"
    self.getModsButton:setAnchorLeft(false)
    self.getModsButton:setAnchorRight(true)
    self.getModsButton:setAnchorTop(false)
    self.getModsButton:setAnchorBottom(true)
    self.getModsButton:setWidthToTitle(BUTTON_WDH)
    self.getModsButton:setX(self.serverManagerButton:getX() - (DX + self.getModsButton:getWidth()))
    local tooltip_text = getText("UI_mods_Explanation") .. Core.getMyDocumentFolder() .. getFileSeparator() .. "mods" .. getFileSeparator()
    if not getSteamModeActive() then tooltip_text = getText("UI_mods_WorkshopRequiresSteam") .. "\n" .. tooltip_text end
    self.getModsButton.tooltip = tooltip_text
    self:addChild(self.getModsButton)
    if self.manager.settings.client.showGetModsButton ~= nil then
        self.getModsButton:setVisible(self.manager.settings.client.showGetModsButton)
    end

    self.presetsPanel = ModPanelPresets:new(
            self.backButton:getRight() + DX, self.height - (DY + BUTTON_HGT),
            self.getModsButton:getX() - (self.backButton:getRight() + DX * 2), BUTTON_HGT
    )
    self.presetsPanel:setAnchorTop(false)
    self.presetsPanel:setAnchorBottom(true)
    self:addChild(self.presetsPanel)
end

function ModSelector:onResolutionChange(oldW, oldH, newW, newH)
    local halfW = (self.width - 3 * DX) / 2
    local halfH = (self.height - (FONT_HGT_TITLE + DY * 2 + BUTTON_HGT + DY * 2 + DY)) / 2

    self.titleLabel:setX((self.width - self.titleLabel:getWidth()) / 2)
    self.aboutButton:setX(self.width - FONT_HGT_TITLE - DX)
    self.settingsButton:setX(self.aboutButton:getX() - FONT_HGT_TITLE - DX)

    self.filterPanel:setWidth(halfW)
    self.filterPanel:onResolutionChange()

    self.listBox:setWidth(halfW)
    self.listBox.btn.x1 = halfW - self.listBox.btn.w1 - DX
    self.listBox.btn.x2 = self.listBox.btn.x1 + self.listBox.btn.w3 + DX
    self.listBox.btn.x3 = self.listBox.btn.x2 + self.listBox.btn.w3 + DX
    self.listBox:setHeight(halfH * 2 - self.filterPanel:getHeight())

    self.infoPanel:setX(halfW + DX * 2)
    self.infoPanel:setWidth(halfW)
    self.infoPanel:setY(FONT_HGT_TITLE + DY * 2)
    self.infoPanel:setHeight(halfH * 2 + DY)
    self.infoPanel.posterPanel:setWidth(self.infoPanel.width - self.infoPanel.scrollwidth + 1)
    self.infoPanel.posterPanel:setHeight((self.infoPanel.width - self.infoPanel.scrollwidth) * 9 / 16 + 2)
    self.infoPanel.thumbnailPanel:setY(self.infoPanel.posterPanel:getBottom() - 1)
    self.infoPanel.thumbnailPanel:setWidth(self.infoPanel.width - self.infoPanel.scrollwidth + 1)
    self.infoPanel.locationEntry:setWidth(self.infoPanel:getWidth() - (DX + self.infoPanel.scrollwidth) - (self.infoPanel.locationLabel:getRight() + DX))
    self.infoPanel.urlEntry:setWidth(self.infoPanel:getWidth() - (DX + self.infoPanel.scrollwidth) - (self.infoPanel.urlLabel:getRight() + DX))

    self.infoPanel.customTagsButton:setX(self.infoPanel:getRight() - DX - BUTTON_SQ - self.infoPanel.scrollwidth)
    self.infoPanel.customTagsButton:setY(self.infoPanel:getBottom() - DX - BUTTON_SQ - 1)
    self.infoPanel.workshopButton:setY(self.infoPanel:getBottom() - DX - BUTTON_SQ - 1)
    self.infoPanel.urlButton:setY(self.infoPanel:getBottom() - DX - BUTTON_SQ - 1)

    self.presetsPanel:setWidth(self.getModsButton:getX() - (self.backButton:getRight() + DX * 2))

    if self.modLoadOrderUI then
        self.modLoadOrderUI:setVisible(false)
        self.modLoadOrderUI:removeFromUIManager()
        self.modLoadOrderUI = nil
    end
    if self.settingsUI then
        self.settingsUI:setVisible(false)
        self.settingsUI:removeFromUIManager()
        self.settingsUI = nil
    end

    local mms = ServerModSelectorBeta and ServerModSelectorBeta.instance
    if mms and mms.javaObject and instanceof(mms.javaObject, 'UIElement') then
        mms:onResolutionChange(oldW, oldH, newW, newH)
    end
end

function ModSelector:prerender()
    self.mapsOrderButton:setEnable(self.mapConflicts)
    if self.mapsOrderUI and self.mapsOrderUI:isReallyVisible() then
        self.mapsOrderButton.blinkBG = false
        self.mapsOrderButton.tooltip = nil
    else
        self.mapsOrderButton.blinkBG = self.mapConflicts
        self.mapsOrderButton.tooltip = self.mapConflicts and getText("UI_mods_ConflictDetected") or nil
    end

    ISPanelJoypad.prerender(self)
end

-- Called from LoadGameScreen.lua
function ModSelector:setExistingSavefile(folder)
    self.loadGameFolder = folder
    local info = getSaveInfo(folder)
    local activeMods = info.activeMods or ActiveMods.getById("default")
    ActiveMods.getById("currentGame"):copyFrom(activeMods)

    self.loadGameMapName = info.mapName or 'Muldraugh, KY'
end

-- Called from MainScreen.lua, NewGameScreen.lua, LoadGameScreen.lua, Events.OnModsModified
function ModSelector:populateListBox(directories, modsModified)
    -- Needed if called from onModsModified
    local oldItems = {}
    if modsModified then
        for _, i in ipairs(self.listBox.items) do
            local item, modId = i.item, i.item.modInfo:getId()
            oldItems[modId] = {
                isActive = item.isActive,
                isFavorite = item.isFavorite,
                isHidden = item.isHidden
            }
        end
    end

    -- Create items
    self.listBox:clear()
    self.listBox.indexById = {}
    for i, directory in ipairs(directories) do
        local modInfo = getModInfo(directory)
        if modInfo then
            local modId = modInfo:getId()
            -- TODO: check load priority
            if not self.listBox.indexById[modId] then
                self.listBox:addItem(modInfo:getName(), { modInfo = modInfo, indexRecent = self.manager:indexInRecent(modId) })
                self.listBox.indexById[modId] = i
            end
        end
    end

    -- Sort by name and re-index
    self.listBox:sort()
    self.listBox:indexByModId()

    -- Write info to items and calculate
    self.counters = {
        workshop = 0,
        map = 0,
        translated = 0,
        available = 0,
        enabled = 0,
        favorites = 0,
        hidden = 0,
        authors = {}, -- {author1 = count, author2 = count, ...}
        originalTags = {}, -- {tag1 = count, tag2 = count, ...}
        customTags = {}, -- {tag1 = count, tag2 = count, ...}
    }

    self.presetsPanel:updateOptions()

    local favorList = {}
    for _, modId in ipairs(self.manager.presets.mmFavorites) do
        favorList[modId] = true
    end
    local hiddenList = {}
    for _, modId in ipairs(self.manager.presets.mmHidden) do
        hiddenList[modId] = true
    end

    local activeMods = self:getActiveMods()
    if not modsModified then
        -- Save activeMods to revert later if necessary
        self.activeModsCopy = ActiveMods.getById("modManager")
        self.activeModsCopy:copyFrom(activeMods)
    end

    -- Save mods to show a dialog
    local warnBroken, warnFavs, warnHidden = {}, {}, {}

    for _, i in ipairs(self.listBox.items) do
        local item, modId = i.item, i.item.modInfo:getId()

        item.isAvailable = item.modInfo:isAvailable()
        item.isActive = activeMods:isModActive(modId)
        item.isFavorite = favorList[modId] or false
        item.isHidden = hiddenList[modId] or false

        if oldItems[modId] then
            if item.isAvailable then item.isActive = oldItems[modId].isActive end
            item.isFavorite = oldItems[modId].isFavorite
            item.isHidden = oldItems[modId].isHidden
        end

        -- Populate dependents
        self:readRequire(modId)

        if item.isFavorite then
            if not item.isActive and item.isAvailable then
                item.isActive = true
                activeMods:setModActive(modId, true)
                table.insert(warnFavs, modId)
            end
            self.counters.favorites = self.counters.favorites + 1
        end
        if item.isHidden then
            if item.isActive then
                item.isActive = false
                activeMods:setModActive(modId, false)
                table.insert(warnHidden, modId)
            end
            self.counters.hidden = self.counters.hidden + 1
        end
        if item.isActive and not item.isAvailable then
            item.isActive = false
            activeMods:setModActive(modId, false)
            --table.insert(warnBroken, modId)
        end
        if item.isActive then self.counters.enabled = self.counters.enabled + 1 end
        if item.isAvailable then self.counters.available = self.counters.available + 1 end

        if item.modInfo:getWorkshopID() then self.counters.workshop = self.counters.workshop + 1 end

        item.modInfoExtra = self:readInfoExtra(modId)
        if item.modInfoExtra.maps then self.counters.map = self.counters.map + 1 end

        item.modInfoExtra.translated = fileExists(
                i.item.modInfo:getDir() .. string.gsub("/media/lua/shared/Translate/" .. Translator.getLanguage():name(),
                        "/", getFileSeparator())
        )
        if item.modInfoExtra.translated then self.counters.translated = self.counters.translated + 1 end

        for _, tag in ipairs(item.modInfoExtra.tags or {}) do
            self.counters.originalTags[tag] = (self.counters.originalTags[tag] or 0) + 1
        end
        for _, author in ipairs(item.modInfoExtra.authors or {}) do
            self.counters.authors[author] = (self.counters.authors[author] or 0) + 1
        end
    end

    -- Count custom tags
    for _, tags in pairs(self.manager.customTags) do
        for _, tag in ipairs(tags) do
            self.counters.customTags[tag] = (self.counters.customTags[tag] or 0) + 1
        end
    end

    if modsModified then
        -- To force update info panel
        self.infoPanel.item = nil
    end

    self.listBox:updateFilter()
    self.listBox.keyboardFocus = true

    -- Check for map conflicts
    self.mapGroups:createGroups(self:getActiveMods(), false)
    self.mapConflicts = self.mapGroups:checkMapConflicts()

    self:showModsWarning(warnBroken, warnFavs, warnHidden)
end

function ModSelector:readRequire(modId)
    local requires = getModInfoByID(modId):getRequire()
    if requires and not requires:isEmpty() then
        for i = 0, requires:size() - 1 do
            local requiredId = requires:get(i)
            local index = self.listBox.indexById[requiredId]
            if index ~= nil then
                local requiredItem = self.listBox.items[index].item
                if type(requiredItem.dependents) == "table" then
                    table.insert(requiredItem.dependents, modId)
                else
                    requiredItem.dependents = { modId }
                end
            end
        end
    end
end

function ModSelector:readInfoExtra(modId)
    local modInfo = getModInfoByID(modId)
    local modInfoExtra = {}

    -- Mod with maps?
    local mapList = getMapFoldersForMod(modId)
    if mapList ~= nil and mapList:size() > 0 then
        modInfoExtra.maps = {}
        for i = 0, mapList:size() - 1 do
            table.insert(modInfoExtra.maps, mapList:get(i))
        end
    end

    -- Extra data from mod.info
    local file = getModFileReader(modId, "mod.info", false)
    if not file then return modInfoExtra end
    local line = file:readLine()
    while line ~= nil do
        -- Split key and value (by first "=", no luautils.split)
        local sep = string.find(line, "=")
        local key, val = "", ""
        if sep ~= nil then
            key = string.lower(luautils.trim(string.sub(line, 0, sep - 1)))
            val = luautils.trim(string.sub(line, sep + 1))
        end

        -- Don't read default keys: name, poster, description, require, id, pack, tiledef
        -- Reread url without restrictions
        if key == "modversion" then
            modInfoExtra.modVersion = val
        elseif key == "url" then
            modInfoExtra.url = val
        elseif key == "icon" then
            modInfoExtra.icon = getTexture(modInfo:getDir() .. getFileSeparator() .. val)
        elseif key == "tags" then
            val = luautils.split(val, ",")
            for i, j in ipairs(val) do
                val[i] = luautils.trim(j)
            end
            modInfoExtra.tags = #val > 0 and val or modInfoExtra.tags
        elseif key == "authors" then
            val = luautils.split(val, ",")
            for i, j in ipairs(val) do
                val[i] = luautils.trim(j)
            end
            modInfoExtra.authors = #val > 0 and val or modInfoExtra.authors
        end

        line = file:readLine()
    end
    file:close()

    return modInfoExtra
end

function ModSelector:getActiveMods()
    return ActiveMods.getById((self.loadGameFolder or self.isNewGame) and "currentGame" or "default")
end

function ModSelector:doActiveRequest(item, doFavor)
    local indexInVisibleList
    if self.filterPanel.orderBy.selected[2] then
        indexInVisibleList = self.listBox.items[self.listBox.selected].item.visibleIndex
    end

    self:doActive(item, doFavor)
    self.listBox:updateFilter()

    if indexInVisibleList and #self.listBox.visibleItems > 0 then
        self.listBox.selected = self.listBox.visibleItems[indexInVisibleList]
    end

    self.mapGroups:createGroups(self:getActiveMods(), false)
    self.mapConflicts = self.mapGroups:checkMapConflicts()
end

function ModSelector:doActive(item, doFavor)
    if not item.isActive then
        item.isActive = true
        self.counters.enabled = self.counters.enabled + 1
    end
    if doFavor then
        item.isFavorite = true
        self.counters.favorites = self.counters.favorites + 1
    end

    self:getActiveMods():setModActive(item.modInfo:getId(), true)

    local requires = item.modInfo:getRequire()
    if requires and not requires:isEmpty() then
        for i = 0, requires:size() - 1 do
            self:doActive(self.listBox.items[self.listBox.indexById[requires:get(i)]].item, doFavor)
        end
    end
end

function ModSelector:doInactiveRequest(item, doHidden)
    local indexInVisibleList
    if self.filterPanel.orderBy.selected[2] then
        indexInVisibleList = self.listBox.items[self.listBox.selected].item.visibleIndex
    end

    self:doInactive(item, doHidden)
    self.listBox:updateFilter()

    if indexInVisibleList and #self.listBox.visibleItems > 0 then
        self.listBox.selected = self.listBox.visibleItems[indexInVisibleList]
    end

    self.mapGroups:createGroups(self:getActiveMods(), false)
    self.mapConflicts = self.mapGroups:checkMapConflicts()
end

function ModSelector:doInactive(item, doHidden)
    if item.isActive then
        item.isActive = false
        self.counters.enabled = self.counters.enabled - 1
    end
    if item.isFavorite then
        self.counters.favorites = self.counters.favorites - 1
        item.isFavorite = false
    end
    if doHidden then
        self.counters.hidden = self.counters.hidden + 1
        item.isHidden = true
    end

    self:getActiveMods():setModActive(item.modInfo:getId(), false)

    for _, dependentId in ipairs(item.dependents or {}) do
        self:doInactive(self.listBox.items[self.listBox.indexById[dependentId]].item)
    end
end

function ModSelector:doUnhide(item)
    self.counters.hidden = self.counters.hidden - 1
    item.isHidden = false

    self.listBox:updateFilter()
end

function ModSelector:onAccept()
    if self.mapsOrderUI then
        self.mapsOrderUI:removeFromUIManager()
    end
    self:setVisible(false)

    local activeMods = self:getActiveMods()
    -- Remove mod IDs for missing mods from ActiveMods.mods
    activeMods:checkMissingMods()
    -- Remove unused map directories from ActiveMods.mapOrder
    activeMods:checkMissingMaps()

    -- Temporarily store activeMods
    local tempActiveMods = ActiveMods.getById("modManager")
    tempActiveMods:copyFrom(activeMods)

    -- Apply favorites and hidden
    self:applyInternalPresets()

    -- Restore
    activeMods = self:getActiveMods()
    activeMods:copyFrom(tempActiveMods)
    tempActiveMods:clear()

    if self.loadGameFolder then
        local saveFolder = self.loadGameFolder
        self.loadGameFolder = nil
        manipulateSavefile(saveFolder, "WriteModsDotTxt")

        -- Setting 'currentGame' to 'default' in case other places forget to set it
        -- before starting a game (DebugScenarios.lua, etc).
        local defaultMods = ActiveMods.getById("default")
        local currentMods = ActiveMods.getById("currentGame")
        currentMods:copyFrom(defaultMods)

        LoadGameScreen.instance:onSavefileModsChanged(saveFolder)
        LoadGameScreen.instance:setVisible(true, self.joyfocus)

        -- Reset filter
        self.filterPanel:resetFilter()
        return
    end

    if self.isNewGame then
        NewGameScreen.instance:setVisible(true, self.joyfocus)
    else
        saveModsFile()

        -- Setting 'currentGame' to 'default' in case other places forget to set it
        -- before starting a game (DebugScenarios.lua, etc).
        local defaultMods = ActiveMods.getById("default")
        local currentMods = ActiveMods.getById("currentGame")
        currentMods:copyFrom(defaultMods)

        MainScreen.instance.bottomPanel:setVisible(true)
        if self.joyfocus then
            self.joyfocus.focus = MainScreen.instance
            updateJoypadFocus(self.joyfocus)
        end
    end

    if ActiveMods.requiresResetLua(activeMods) then
        if self.isNewGame then
            getCore():ResetLua("currentGame", "NewGameMods")
        else
            getCore():ResetLua("default", "modsChanged")
        end
    else
        -- Reset filter
        self.filterPanel:resetFilter()
    end
end

-- Save favorites and hidden
function ModSelector:applyInternalPresets()
    -- Hidden
    local oldHidden, newHidden = {}, {}
    for _, modId in ipairs(self.manager.presets.mmHidden) do
        oldHidden[modId] = true
    end
    for _, item in ipairs(self.listBox.items) do
        if item.item.isHidden then
            newHidden[item.item.modInfo:getId()] = true
        end
    end

    local addHidden, delHidden = {}, {}
    for modId, _ in pairs(oldHidden) do
        if not newHidden[modId] then table.insert(delHidden, modId) end
    end
    for modId, _ in pairs(newHidden) do
        if not oldHidden[modId] then table.insert(addHidden, modId) end
    end

    -- Favorites
    local oldFavors, newFavors = {}, {}
    for _, modId in ipairs(self.manager.presets.mmFavorites) do
        oldFavors[modId] = true
    end
    for _, item in ipairs(self.listBox.items) do
        if item.item.isFavorite then
            newFavors[item.item.modInfo:getId()] = true
        end
    end

    local addFavors, delFavors = {}, {}
    for modId, _ in pairs(oldFavors) do
        if not newFavors[modId] then table.insert(delFavors, modId) end
    end
    for modId, _ in pairs(newFavors) do
        if not oldFavors[modId] then table.insert(addFavors, modId) end
    end

    -- At least one list has been changed
    if #addFavors + #delFavors + #addHidden + #delHidden > 0 then
        -- Change mods list of saves
        if #addFavors + #addHidden > 0 then
            for _, folder in ipairs(getFullSaveDirectoryTable()) do
                -- Change mods only for other saves
                if folder ~= self.loadGameFolder then
                    local modListChanged = false

                    local info = getSaveInfo(folder)
                    local activeModsInSave = info.activeMods or ActiveMods.getById("default")
                    ActiveMods.getById("currentGame"):copyFrom(activeModsInSave)
                    -- Favorites
                    for _, modId in ipairs(addFavors) do
                        modListChanged = true
                        ActiveMods.getById("currentGame"):setModActive(modId, true)
                    end
                    -- Hidden
                    for _, modId in ipairs(addHidden) do
                        modListChanged = true
                        ActiveMods.getById("currentGame"):setModActive(modId, false)
                    end
                    if modListChanged then
                        manipulateSavefile(folder, "WriteModsDotTxt")
                        LoadGameScreen.instance:onSavefileModsChanged(folder)
                    end
                end
            end
        end

        -- Change global mod list
        if self.isNewGame or self.loadGameFolder then
            for _, modId in ipairs(addFavors) do
                ActiveMods.getById("default"):setModActive(modId, true)
            end
            for _, modId in ipairs(addHidden) do
                ActiveMods.getById("default"):setModActive(modId, false)
            end
            saveModsFile()
        end

        -- Save new favorites list
        self.manager.presets.mmFavorites = {}
        for modId, _ in pairs(newFavors) do
            table.insert(self.manager.presets.mmFavorites, modId)
        end
        table.sort(self.manager.presets.mmFavorites)
        -- Save new hidden list
        self.manager.presets.mmHidden = {}
        for modId, _ in pairs(newHidden) do
            table.insert(self.manager.presets.mmHidden, modId)
        end
        table.sort(self.manager.presets.mmHidden)
        self.manager:savePresets()
    end
end

function ModSelector:onBack()
    self:setVisible(false)
    self.listBox.keyboardFocus = false

    local activeMods = self:getActiveMods()
    activeMods:copyFrom(self.activeModsCopy)
    self.activeModsCopy:clear()

    -- Reset filter
    self.filterPanel:resetFilter()
    -- Reset scroll
    self.listBox:ensureVisible(1)

    -- Back to LoadGameScreen
    if self.loadGameFolder then
        self.loadGameFolder = nil
        LoadGameScreen.instance:setVisible(true, self.joyfocus)
        return
    end

    -- Back to NewGameScreen
    if self.isNewGame then
        self.isNewGame = nil
        NewGameScreen.instance:setVisible(true, self.joyfocus)
        return
    end

    -- Back to MainScreen
    MainScreen.instance.bottomPanel:setVisible(true)
    if self.joyfocus then
        self.joyfocus.focus = MainScreen.instance
        updateJoypadFocus(self.joyfocus)
    end
end

function ModSelector:onButtonClick(button)
    if button.internal == "MAPS_ORDER" then
        self:setVisible(false)
        self.mapsOrderUI = ModOrderUI:new(0, 0, 700, 400)
        self.mapsOrderUI:initialise()
        self.mapsOrderUI:addToUIManager()
    elseif button.internal == "MODS_ORDER" then
        self:setVisible(false)
        if not self.modLoadOrderUI then
            self.modLoadOrderUI = ModLoadOrderUI:new()
            self.modLoadOrderUI:initialise()
        end
        self.modLoadOrderUI:populateList()
        self.modLoadOrderUI:addToUIManager()
        self.modLoadOrderUI:setVisible(true)
    elseif button.internal == "SERVER_MANAGER" then
        if not self.serverSelectorUI then
            self.serverSelectorUI = ServerModSelectorBeta:new()
            self.serverSelectorUI:initialise()
            self.serverSelectorUI:setAnchorRight(true)
            self.serverSelectorUI:setAnchorLeft(true)
            self.serverSelectorUI:setAnchorBottom(true)
            self.serverSelectorUI:setAnchorTop(true)
            self.serverSelectorUI:addToUIManager()
        end
        self.serverSelectorUI:populateListBox(self.listBox.items)
        self.serverSelectorUI:setVisible(true)
        self.serverSelectorUI:bringToTop()
        self:setVisible(false)
    elseif button.internal == "GET_MODS" then
        if getSteamModeActive() then
            if isSteamOverlayEnabled() then
                activateSteamOverlayToWorkshop()
            else
                openUrl("steam://url/SteamWorkshopPage/108600")
            end
        else
            openUrl("http://theindiestone.com/forums/index.php/forum/58-mods/")
        end
    elseif button.internal == "ABOUT" then
        self.aboutUI = ModManagerAboutUI:new()
        self.aboutUI:initialise()
        self.aboutUI:addToUIManager()
    elseif button.internal == "SETTINGS" then
        if not self.settingsUI then
            self.settingsUI = ModManagerSettingsUI:new()
            self.settingsUI:initialise()
        end
        self.settingsUI:updateSettings()
        self.settingsUI:addToUIManager()
        self.settingsUI:setVisible(true)
    end
end

function ModSelector:onGainJoypadFocus(joypadData)
    ISPanelJoypad.onGainJoypadFocus(self, joypadData)
    self:setISButtonForA(self.acceptButton)
    self:setISButtonForB(self.backButton)
    self.hasJoypadFocus = true
    joypadData.focus = self
end

function ModSelector:onJoypadBeforeDeactivate(joypadData)
    self.acceptButton:clearJoypadButton()
    self.backButton:clearJoypadButton()
    self.hasJoypadFocus = false
    -- Focus is on listBox or infoPanel
    self.joyfocus = nil
end

function ModSelector:showModsWarning(warnBroken, warnFavs, warnHidden)
    if #warnBroken + #warnFavs + #warnHidden > 0 then
        local msg = ""
        if #warnBroken > 0 then
            msg = getText("UI_ModManager_Warning_Failed", #warnBroken) .. "\n" .. table.concat(warnBroken, "\n")
        end
        if #warnFavs > 0 then
            if #warnBroken > 0 then msg = msg .. "\n\n" end
            msg = msg .. getText("UI_ModManager_Warning_Favs", #warnFavs) .. "\n" .. table.concat(warnFavs, "\n")
        end
        if #warnHidden > 0 then
            if #warnBroken + #warnFavs > 0 then msg = msg .. "\n\n" end
            msg = msg .. getText("UI_ModManager_Warning_Hidden", #warnHidden) .. "\n" .. table.concat(warnHidden, "\n")
        end
        local modal = MMModalDialog.show(msg, true)
        modal.isCancelable = false
    end
end

function ModSelector:showChangelog()
    if ModManager.instance:isNewVersion(ModManager.ID) then
        local panel = ModManagerChangelogUI:new(ModManager.ID)
        panel:initialise()
        panel:addToUIManager()
        panel:setAlwaysOnTop(true)
        panel:setCapture(true)
    end
end

-- Called from MainScreen.lua, NewGameScreen.lua, LoadGameScreen.lua
function ModSelector.showNagPanel()
    if not getCore():isModsPopupDone() then
        if ModManager.instance.settings.client.showNagPanel ~= false then
            getCore():setModsPopupDone(true)
            ModSelector.instance:setVisible(false)

            local width, height = 650, 400
            local nagPanel = ISModsNagPanel:new(
                    (getCore():getScreenWidth() - width) / 2, (getCore():getScreenHeight() - height) / 2, width, height
            )
            nagPanel:initialise()
            nagPanel:addToUIManager()
            nagPanel:setAlwaysOnTop(true)
            local joypadData = JoypadState.getMainMenuJoypad()
            if joypadData then
                joypadData.focus = nagPanel
                updateJoypadFocus(joypadData)
            end
        else
            getCore():setModsPopupDone(true)
            ModSelector.instance:showChangelog()
        end
    end
end

function ModSelector.onKeyPressed(key)
    local target = ModSelector.instance
    if target == nil or not target:isVisible() then return end

    local listBox = target.listBox
    if listBox == nil or listBox.keyboardFocus ~= true then return end

    if key == Keyboard.KEY_ESCAPE then
        if listBox.modal and listBox.modal:isVisible() then
            if listBox.modal.isCancelable then
                listBox.modal:destroy()
            end
        elseif target.settingsUI and target.settingsUI:isVisible() then
            target.settingsUI:destroy()
        elseif target.aboutUI and target.aboutUI:isVisible() then
            target.aboutUI:destroy()
        else
            target:onBack()
        end
        return
    end

    if listBox:onKeyPressed(key) then
        return
    end

    if key == Keyboard.KEY_TAB then
        if not target.ignoreNextTabKey then
            if target.filterPanel.searchEntryBox.isFocused then
                target.filterPanel.searchEntryBox:unfocus()
            else
                target.filterPanel.searchEntryBox:focus()
            end
        end
        target.ignoreNextTabKey = false
    elseif key == Keyboard.KEY_RETURN or key == Keyboard.KEY_SPACE then
        if not listBox:isEmpty() then
            local item = listBox:getSelectedItem()
            if item.isAvailable then
                if isShiftKeyDown() then
                    if not item.isHidden then
                        if item.isFavorite then
                            listBox.parent:doInactiveRequest(item)
                        else
                            listBox.parent:doActiveRequest(item, true)
                        end
                    end
                elseif isCtrlKeyDown() then
                    if not item.isFavorite then
                        if item.isHidden then
                            listBox.parent:doUnhide(item)
                        else
                            listBox.parent:doInactiveRequest(item, true)
                        end
                    end
                else
                    if not item.isFavorite and not item.isHidden then
                        if item.isActive then
                            listBox.parent:doInactiveRequest(item)
                        else
                            listBox.parent:doActiveRequest(item)
                        end
                    end
                end
                listBox:ensureVisible(listBox.selected)
            end
        end
    end
end

function ModSelector.onModsModified()
    local manager = ModManager.instance
    if manager then
        manager:trackMods()
    end

    local self = ModSelector.instance
    if self and self.listBox and self:isReallyVisible() then
        local index = self.listBox.selected
        self:populateListBox(getModDirectoryTable(), true)
        if self.listBox.items[index] then
            self.listBox.selected = index
        end
    end
end

-- ******************************
-- ModListBox
-- ******************************

function ModListBox:new(x, y, width, height)
    local o = MMListBox:new(x, y, width, height)
    setmetatable(o, self)
    self.__index = self
    o.indexById = {} -- {modId = index, modId = index, ...}
    o.keyboardFocus = false

    o.btn = {}
    o.btn.text1 = getText("UI_ModManager_List_Favorite")
    o.btn.text2 = getText("UI_ModManager_List_Unfavorite")
    o.btn.text3 = getText("UI_ModManager_List_On")
    o.btn.text4 = getText("UI_ModManager_List_Off")
    o.btn.text5 = getText("UI_ModManager_List_Hide")
    o.btn.text6 = getText("UI_ModManager_List_Unhide")
    local w1 = getTextManager():MeasureStringX(UIFont.Small, o.btn.text1)
    local w2 = getTextManager():MeasureStringX(UIFont.Small, o.btn.text2)
    local w3 = getTextManager():MeasureStringX(UIFont.Small, o.btn.text3)
    local w4 = getTextManager():MeasureStringX(UIFont.Small, o.btn.text4)
    local w5 = getTextManager():MeasureStringX(UIFont.Small, o.btn.text5)
    local w6 = getTextManager():MeasureStringX(UIFont.Small, o.btn.text6)
    o.btn.w1 = math.max(math.max(w2, w6) + 2 * DX, (math.max(math.max(w3, w4), math.max(w1, w5)) + 2 * DX) * 3 + 2 * DX)
    o.btn.w3 = (o.btn.w1 - 2 * DX) / 3
    o.btn.x1 = o.width - o.btn.w1 - DX
    o.btn.x2 = o.btn.x1 + o.btn.w3 + DX
    o.btn.x3 = o.btn.x2 + o.btn.w3 + DX
    o.btn.dy = (o.itemheight - BUTTON_HGT) / 2
    --[[
    o.item.item.indexRecent = number -- index, sorted by date added
    o.item.item.modInfo
    o.item.item.modInfoExtra = {}
    o.item.item.isAvailable = true/false
    o.item.item.isActive = true/false
    o.item.item.isFavorite = true/false
    o.item.item.isHidden = true/false
    o.item.item.dependents = {}
    ]]
    return o
end

function ModListBox:checkFilter(item)
    local filter = self.parent.filterPanel
    local modInfo = item.modInfo
    local modInfoExtra = item.modInfoExtra

    -- TickBox filter
    if not filter.locationTickBox.selected[1] and modInfo:getWorkshopID() then return false end
    if not filter.locationTickBox.selected[2] and not modInfo:getWorkshopID() then return false end
    if not filter.mapTickBox.selected[1] and modInfoExtra.maps then return false end
    if not filter.mapTickBox.selected[2] and not modInfoExtra.maps then return false end
    if not filter.translateTickBox.selected[1] and modInfoExtra.translated then return false end
    if not filter.translateTickBox.selected[2] and not modInfoExtra.translated then return false end
    if not filter.availabilityTickBox.selected[1] and item.isAvailable then return false end
    if not filter.availabilityTickBox.selected[2] and not item.isAvailable then return false end
    if not filter.statusTickBox.selected[1] and item.isActive then return false end
    if not filter.statusTickBox.selected[2] and not item.isActive then return false end
    if not filter.favorTickBox.selected[1] and not item.isFavorite and not item.isHidden then return false end
    if not filter.favorTickBox.selected[2] and item.isFavorite then return false end
    if not filter.favorTickBox.selected[3] and item.isHidden then return false end

    -- Search filter
    local keyWord = filter.searchEntryBox:getInternalText() or ""

    local tableForFind = {}
    if filter.searchBy2.selected[1] then
        table.insert(tableForFind, modInfo:getWorkshopID())
    elseif filter.searchBy2.selected[2] then
        for _, map in ipairs(modInfoExtra.maps or {}) do
            table.insert(tableForFind, map)
        end
    elseif filter.searchBy2.selected[3] then
        for _, t in ipairs(modInfoExtra.tags or {}) do
            table.insert(tableForFind, t)
        end
        for _, t in ipairs(self.parent.manager.customTags[modInfo:getId()] or {}) do
            table.insert(tableForFind, t)
        end
    elseif filter.searchBy2.selected[4] then
        for _, author in ipairs(modInfoExtra.authors or {}) do
            table.insert(tableForFind, author)
        end
    else
        if filter.searchBy1.selected[1] then
            table.insert(tableForFind, modInfo:getName())
        end
        if filter.searchBy1.selected[2] then
            table.insert(tableForFind, modInfo:getDescription())
        end
        if filter.searchBy1.selected[3] then
            table.insert(tableForFind, modInfo:getId())
        end
    end

    if filter.searchAs1.selected[1] then
        -- Equals
        if keyWord == "" then return true end
        for _, s in ipairs(tableForFind) do
            if s == keyWord then return true end
        end
    elseif filter.searchAs1.selected[2] then
        -- Contains
        if keyWord == "" then return true end
        for _, s in ipairs(tableForFind) do
            if string.find(string.lower(s), string.lower(keyWord), 1, true) ~= nil then return true end
        end
    elseif filter.searchAs1.selected[3] then
        -- Empty
        if #tableForFind == 0 then return true end
    elseif filter.searchAs2.selected[1] then
        -- notEquals
        if keyWord == "" then return true end
        local notEquals = true
        for _, s in ipairs(tableForFind) do
            if s == keyWord then notEquals = false end
        end
        return notEquals
    elseif filter.searchAs2.selected[2] then
        -- notContains
        if keyWord == "" then return true end
        local notContains = true
        for _, s in ipairs(tableForFind) do
            if string.find(string.lower(s), string.lower(keyWord), 1, true) ~= nil then notContains = false end
        end
        return notContains
    elseif filter.searchAs2.selected[3] then
        -- notEmpty
        if #tableForFind > 0 then return true end
    end

    return false
end

function ModListBox:updateFilter()
    local filter = self.parent.filterPanel
    local sortFunc
    if filter.orderBy.selected[1] then
        -- Order by name, ascending or descending
        if filter.orderAs.selected[1] then
            sortFunc = function(a, b) return a.text < b.text end
        else
            sortFunc = function(a, b) return a.text > b.text end
        end
    elseif filter.orderBy.selected[2] then
        -- Order by enabled (and name asc), ascending or descending
        if filter.orderAs.selected[1] then
            sortFunc = function(a, b)
                if a.item.isActive ~= b.item.isActive then
                    return a.item.isActive and not b.item.isActive
                end
                return a.text < b.text
            end
        else
            sortFunc = function(a, b)
                if a.item.isActive ~= b.item.isActive then
                    return not a.item.isActive and b.item.isActive
                end
                return a.text < b.text
            end
        end
    elseif filter.orderBy.selected[3] then
        -- Order by added, ascending or descending
        if filter.orderAs.selected[1] then
            sortFunc = function(a, b) return a.item.indexRecent > b.item.indexRecent end
        else
            sortFunc = function(a, b) return a.item.indexRecent < b.item.indexRecent end
        end
    end
    -- Sort
    self:sort(sortFunc)
    -- Re-index
    self:indexByModId()

    MMListBox.updateFilter(self)
end

function ModListBox:indexByModId()
    for index, item in ipairs(self.items) do
        self.indexById[item.item.modInfo:getId()] = index
    end
end

function ModListBox:doDrawItem(y, i, alt)
    local index, item = i.index, i.item
    if item.visibleIndex == nil then return y end

    local h, s = self.itemheight, self:isVScrollBarVisible() and 13 or 0

    -- Check real line visibility
    local localY = self:getYScroll() + y
    if s ~= 0 and (localY < -h or localY > self:getHeight()) then
        return y + h - 1
    end

    -- Item bar
    if self.selected == index then
        self:drawRect(0, y, self:getWidth(), h, 0.3, 0.7, 0.35, 0.15)
    elseif self.mouseOverSelected == index and not self:isMouseOverScrollBar() then
        self:drawRect(0, y, self:getWidth(), h, 0.95, 0.05, 0.05, 0.05)
    end
    self:drawRectBorder(0, y, self:getWidth(), h, 0.5, self.borderColor.r, self.borderColor.g, self.borderColor.b)

    -- Icon, title
    local icon = item.modInfoExtra.maps and ICON_MAP or ICON_DEFAULT
    if self.parent.manager.settings.client.showCustomModIcons ~= false then
        icon = item.modInfoExtra.icon or icon
    end

    local text = item.modInfo:getName()
    local tooltip
    local r, g, b = 1, 1, 1

    if item.isHidden then
        icon = item.modInfoExtra.maps and ICON_MAP_GREY or ICON_DEFAULT_GREY
        r, g, b = 0.7, 0.7, 0.7
    end

    local iconY = y + DY
    local iconRight, iconBottom = DX + FONT_HGT_MEDIUM, iconY + FONT_HGT_MEDIUM
    self:drawTextureScaled(icon, DX, iconY, FONT_HGT_MEDIUM, FONT_HGT_MEDIUM, 1)

    if not item.isAvailable then
        g, b = 0.2, 0.2
        self:drawTexture(ICON_BROKEN, iconRight - 6, iconBottom - 9, 1)
    elseif item.isActive then
        local dependents = {}
        for _, dependentId in ipairs(item.dependents or {}) do
            if self.items[self.indexById[dependentId]].item.isActive then
                table.insert(dependents, dependentId)
            end
        end
        if #dependents > 0 then
            g, b = 0.7, 0.2
            tooltip = getText("UI_ModManager_List_Tooltip_EnabledBy")
            for _, dependentId in ipairs(dependents) do
                tooltip = tooltip .. " <LINE> <INDENT:20> " .. getModInfoByID(dependentId):getName()
            end
            self:drawTexture(ICON_REQUIRED, iconRight - 4, iconBottom - 4, 1)
        else
            r, g, b = 0.4, 0.8, 0.3
            self:drawTexture(ICON_ACTIVE, iconRight - 4, iconBottom - 4, 1)
        end
    end
    if item.isFavorite then
        self:drawTexture(ICON_FAVORITE, iconRight - 6, iconY - 4, 1)
    end
    self.items[index].tooltip = tooltip
    self:drawText(text, DX + FONT_HGT_MEDIUM + DX, y + DY, r, g, b, 1, UIFont.Medium)

    local iconLocation = item.modInfo:getWorkshopID() and ICON_STEAM
    if not iconLocation then
        iconLocation = item.modInfo:getDir():find(string.gsub("Zomboid/Workshop", "/", getFileSeparator())) and ICON_FOLDER_W or ICON_FOLDER
    end
    self:drawTextureScaled(iconLocation, self.width - FONT_HGT_SMALL - DX - s, y + h / 2 - FONT_HGT_SMALL / 2, FONT_HGT_SMALL, FONT_HGT_SMALL, 1)

    -- Buttons
    if self.mouseOverSelected == index and not self:isMouseOverScrollBar() then
        if item.isFavorite then
            self:doDrawButton(self.btn.text2, "UNFAVORITE", self.btn.x1 - s, y + self.btn.dy, self.btn.w1, BUTTON_HGT)
        elseif item.isHidden then
            self:doDrawButton(self.btn.text6, "UNHIDE", self.btn.x1 - s, y + self.btn.dy, self.btn.w1, BUTTON_HGT)
        elseif item.isAvailable then
            self:doDrawButton(self.btn.text5, "HIDE", self.btn.x1 - s, y + self.btn.dy, self.btn.w3, BUTTON_HGT)
            self:doDrawButton(self.btn.text1, "FAVORITE", self.btn.x2 - s, y + self.btn.dy, self.btn.w3, BUTTON_HGT)
            if item.isActive then
                self:doDrawButton(self.btn.text4, "OFF", self.btn.x3 - s, y + self.btn.dy, self.btn.w3, BUTTON_HGT)
            else
                self:doDrawButton(self.btn.text3, "ON", self.btn.x3 - s, y + self.btn.dy, self.btn.w3, BUTTON_HGT)
            end
        end
    end

    y = y + h - 1
    return y
end

function ModListBox:onButtonClick(button, item)
    if button.internal == "ON" then
        self.parent:doActiveRequest(item)
    elseif button.internal == "OFF" then
        self.parent:doInactiveRequest(item)
    elseif button.internal == "FAVORITE" then
        self:showDialog(getText("UI_ModManager_List_Dialog_Favorite"), item,
                function(target, modalButton, selectedItem)
                    if modalButton.internal == "YES" then
                        target.parent:doActiveRequest(selectedItem, true)
                    end
                end
        )
    elseif button.internal == "UNFAVORITE" then
        self.parent:doInactiveRequest(item)
    elseif button.internal == "HIDE" then
        self:showDialog(getText("UI_ModManager_List_Dialog_Hide"), item,
                function(target, modalButton, selectedItem)
                    if modalButton.internal == "YES" then
                        target.parent:doInactiveRequest(selectedItem, true)
                    end
                end
        )
    elseif button.internal == "UNHIDE" then
        self.parent:doUnhide(item)
    end
end

function ModListBox:onItemDoubleClick(item)
    if not item.isAvailable then return end

    if not item.isActive then
        self.parent:doActiveRequest(item)
    else
        self.parent:doInactiveRequest(item)
    end
end

function ModListBox:showDialog(text, item, onClick)
    self.modal = MMModalDialog.show(text, false, true, 0, 0, 350, 0, self, onClick, item)
end

-- ******************************
-- ModPanelPoster
-- ******************************

function ModPanelPoster:new(x, y, width, height)
    local o = ISPanelJoypad:new(x, y, width, height)
    setmetatable(o, self)
    self.__index = self
    o.selectedMod = 0
    o.index = 0 -- poster index
    --[[
    o.modInfo -- set in ModPanelInfo
    ]]
    return o
end

function ModPanelPoster:render()
    ISPanelJoypad.render(self)

    local noPoster = true
    if self.modInfo and (self.modInfo:getPosterCount() > 0) then
        self.index = self.parent.thumbnailPanel.index
        self.index = math.min(math.max(self.index, 1), self.modInfo:getPosterCount())

        local texture = getTexture(self.modInfo:getPoster(self.index - 1)) or Texture.getWhite()
        if texture ~= Texture.getWhite() then
            noPoster = false
            local scrollBarWid = (self:getScrollHeight() > self.height) and self.vscroll:getWidth() or 0
            -- Some posters throw Not a valid PNG file or unsupported interlace method
            -- 1910287882\Lighter Ammo, 1273524566\No Ammo Weight
            self:drawTextureScaledAspect(texture, 1, 1, self.width - scrollBarWid - 1, self.height - 2, 1, 1, 1, 1)
        end
    end

    if noPoster then
        self:drawTextCentre(getText("UI_ModManager_Info_NoPoster"), self.width / 2, self.height / 2, 1, 1, 1, 1, UIFont.Medium)
    end
end

function ModPanelPoster:onMouseDown(x, y)
    local poster = self.modInfo:getPoster(self.index - 1)
    if poster then
        local posterView = MMPoster:new(poster)
        posterView:initialise()
        local wrapper = posterView:wrapInCollapsableWindow(getText("UI_ModManager_Info_Poster"), false, MMPosterWrapper)
        wrapper:setWantKeyEvents(true)
        posterView.wrap = wrapper
        wrapper.posterUI = posterView
        posterView.render = MMPoster.noRender
        posterView.prerender = MMPoster.noRender
        wrapper:setCapture(true)
        wrapper:setAlwaysOnTop(true)
        wrapper:setVisible(true)
        wrapper:addToUIManager()

        self.parent.parent.listBox.keyboardFocus = false
    end
end

function ModPanelPoster:setJoypadFocused(focused)
end

function ModPanelPoster:setModInfo(modInfo)
    self.modInfo = modInfo
end

-- ******************************
-- ModPanelThumbnail
-- ******************************

function ModPanelThumbnail:new(x, y, width, height)
    local o = ISPanelJoypad:new(x, y, width, height)
    setmetatable(o, self)
    self.__index = self
    o.padX = 10
    o.padY = 8
    o.thumbnailWidth = 116
    o.thumbnailHeight = height - o.padY * 2 -- 64
    o.thumbs = {}
    o.index = 1
    --[[
    o.modInfo -- set in ModPanelInfo
    ]]
    return o
end

function ModPanelThumbnail:render()
    ISPanelJoypad.render(self)

    if self.modInfo and (self.modInfo:getPosterCount() > 0) then
        self.index = math.min(math.max(self.index, 1), self.modInfo:getPosterCount())

        local width = self.thumbnailWidth
        local height = self.thumbnailHeight
        local x = 0
        local y = 0
        for i = 1, self.modInfo:getPosterCount() do
            local texture = getTexture(self.modInfo:getPoster(i - 1)) or Texture:getWhite()
            if texture ~= Texture:getWhite() then
                width = math.floor(texture:getWidth() * (height / texture:getHeight()))

                self:drawRect(x + self.padX, y + self.padY, width, height, 1, 0.1, 0.1, 0.1)
                self:drawTextureScaledAspect(texture, x + self.padX, y + (self.height - height) / 2, width, height, 1, 1, 1, 1)

                if not self.pressed and self:isMouseOver() and self:getIndexAt(self:getMouseX(), self:getMouseY()) == i then
                    self:drawRectBorder(x + self.padX - 2, y + self.padY - 2, width + 4, height + 4, 1, 0.5, 0.5, 0.5)
                end

                if not self.thumbs[i] then
                    table.insert(self.thumbs, { x1 = x + self.padX, x2 = x + self.padX + width })
                end

                x = x + self.padX + width
            end
        end

        if x > self.width then
            self:setXScroll(math.min(self:getXScroll(), 0))
            self:setXScroll(math.max(self:getXScroll(), -(x - self.width)))
        else
            self:setXScroll(0)
        end
    end
end

function ModPanelThumbnail:onMouseDown(x, y)
    self.index = self:getIndexAt(x, y)
    self.pressed = true
end

function ModPanelThumbnail:onMouseUp(x, y)
    self.pressed = false
end

function ModPanelThumbnail:onMouseUpOutside(x, y)
    self.pressed = false
end

function ModPanelThumbnail:onMouseMove(dx, dy)
    if self.pressed then
        self:setXScroll(self:getXScroll() + dx)
    end
end

function ModPanelThumbnail:onMouseMoveOutside(dx, dy)
    if self.pressed then
        self:onMouseMove(dx, dy)
    end
end

function ModPanelThumbnail:getIndexAt(x, y)
    if not self.modInfo or self.modInfo:getPosterCount() == 0 then
        return -1
    end
    local index = -1
    for i, v in ipairs(self.thumbs) do
        if x >= v.x1 and x <= v.x2 then
            index = i
            break
        end
    end
    if index > self.modInfo:getPosterCount() then
        return -1
    end
    return index
end

function ModPanelThumbnail:setJoypadFocused(focused)
end

function ModPanelThumbnail:setModInfo(modInfo)
    self.modInfo = modInfo
    self.thumbs = {}
end

-- ******************************
-- ModPanelInfo
-- ******************************

function ModPanelInfo:new(x, y, width, height)
    local o = ISPanelJoypad:new(x, y, width, height)
    setmetatable(o, self)
    self.__index = self
    o.scrollwidth = 13
    o.selected = 0
    o.backgroundColor = { r = 0, g = 0, b = 0, a = 0.8 }
    --[[
    o.item = self.parent.listBox.items[i].item -- can be nil
    ]]
    return o
end

function ModPanelInfo:initialise()
    ISPanelJoypad.initialise(self)

    self.posterPanel = ModPanelPoster:new(
            0, 0, self.width - self.scrollwidth + 1, (self.width - self.scrollwidth) * 9 / 16 + 2
    )
    self:addChild(self.posterPanel)

    self.thumbnailPanel = ModPanelThumbnail:new(
            0, self.posterPanel:getBottom() - 1, self.width - self.scrollwidth + 1, 80
    )
    self:addChild(self.thumbnailPanel)

    -- Location Label, Entry
    self.locationLabel = ISLabel:new(
            DX, 4, FONT_HGT_SMALL, getText("UI_ModManager_Info_LocationLabel"),
            1, 1, 1, 1, UIFont.Small, true
    )
    self:addChild(self.locationLabel)

    self.locationEntry = ISTextEntryBox:new("",
            self.locationLabel:getRight() + DX, 2,
            self.width - (DX + self.scrollwidth) - (self.locationLabel:getRight() + DX), FONT_HGT_SMALL + 2 * 2
    )
    self:addChild(self.locationEntry)
    self.locationEntry:setEditable(false)
    self.locationEntry:setSelectable(true)

    -- URL Label, Entry
    self.urlLabel = ISLabel:new(
            DX, 4, FONT_HGT_SMALL, getText("UI_ModManager_Info_URLLabel"),
            1, 1, 1, 1, UIFont.Small, true
    )
    self.urlLabel:setVisible(false)
    self:addChild(self.urlLabel)

    self.urlEntry = ISTextEntryBox:new("",
            self.urlLabel:getRight() + DX, 2,
            self.width - (DX + self.scrollwidth) - (self.urlLabel:getRight() + DX), FONT_HGT_SMALL + 2 * 2
    )
    self.urlEntry:setVisible(false)
    self:addChild(self.urlEntry)
    self.urlEntry:setEditable(false)
    self.urlEntry:setSelectable(true)

    self.descRichText = ISRichTextLayout:new(self.width - self.scrollwidth)
    self.descRichText:setMargins(DX, DY, DX, DY)

    self.customTagsButton = MMImageButton:new(
            self:getRight() - DX - BUTTON_SQ - self.scrollwidth, self:getBottom() - DX - BUTTON_SQ - 1,
            BUTTON_SQ, BUTTON_SQ, self, self.onCustomTagsDialog
    )
    self.customTagsButton:setImage(getTexture("media/ui/MM_Button_Tags.png"))
    self.customTagsButton:setPadding(DX, DY)
    self.customTagsButton:setDisplayBackground(true)
    self.customTagsButton.tooltip = getText("UI_ModManager_Info_Tags_Button")
    self.parent:addChild(self.customTagsButton)

    self.workshopButton = MMImageButton:new(
            0, self:getBottom() - DX - BUTTON_SQ - 1, BUTTON_SQ, BUTTON_SQ, self, self.onGoButton
    )
    self.workshopButton.internal = "WORKSHOP"
    self.workshopButton:setImage(getTexture("media/ui/MM_Button_Steam.png"))
    self.workshopButton:setDisplayBackground(true)
    self.workshopButton:setPadding(DX, DY)
    self.workshopButton.tooltip = getText("UI_WorkshopSubmit_OverlayButton")
    self.parent:addChild(self.workshopButton)

    self.urlButton = MMImageButton:new(
            0, self:getBottom() - DX - BUTTON_SQ - 1, BUTTON_SQ, BUTTON_SQ, self, self.onGoButton
    )
    self.urlButton.internal = "URL"
    self.urlButton:setImage(getTexture("media/ui/MM_Button_Url.png"))
    self.urlButton:setPadding(DX, DY)
    self.urlButton:setDisplayBackground(true)
    self.urlButton.tooltip = getText("UI_ModManager_Info_URLButton")
    self.parent:addChild(self.urlButton)
end

function ModPanelInfo:prerender()
    local i = self.parent.listBox.selected
    local item = self.parent.listBox.items[i].item
    if item and (not self.item or item.modInfo:getId() ~= self.item.modInfo:getId()) then
        local modInfo = item.modInfo
        local modInfoExtra = item.modInfoExtra

        self.posterPanel:setModInfo(modInfo)
        self.thumbnailPanel:setModInfo(modInfo)
        self.thumbnailPanel:setVisible(modInfo:getPosterCount() > 1)

        local description = " <H2> " .. modInfo:getName() .. " <TEXT> <LINE> "
        if modInfo:getDescription() ~= "" then
            description = description .. " <LINE> "
            description = description .. modInfo:getDescription()
            description = description .. " <LINE> "
        end

        -- Game version
        local gameVersion = getCore():getGameVersion()
        if modInfo:getVersionMin() then
            description = description .. " <LINE> "
            local versionMin = modInfo:getVersionMin():toString()
            if modInfo:getVersionMin():isGreaterThan(gameVersion) then
                description = description .. " <RED> " .. getText("UI_mods_RequiredVersionMin", versionMin)
            else
                description = description .. getText("UI_ModManager_Info_GameVersion", versionMin)
            end
            description = description .. " <LINE> "
        end
        if modInfo:getVersionMax() and modInfo:getVersionMax():isLessThan(gameVersion) then
            if not modInfo:getVersionMin() then
                description = description .. " <LINE> "
            end
            description = description .. " <RED> " .. getText("UI_mods_RequiredVersionMax", modInfo:getVersionMax():toString())
            description = description .. " <LINE> "
        end

        -- Required mods
        if modInfo:getRequire() and not modInfo:getRequire():isEmpty() then
            description = description .. " <LINE> <TEXT> " .. getText("UI_mods_require")
            description = description .. " <LINE> <INDENT:20> "
            for j = 0, modInfo:getRequire():size() - 1 do
                local modID = modInfo:getRequire():get(j)
                local modInfo1 = getModInfoByID(modID)
                if modInfo1 == nil then
                    description = description .. " <RED> " .. modID
                elseif not modInfo1:isAvailable() then
                    description = description .. " <RED> " .. modInfo1:getName()
                else
                    description = description .. " <TEXT> " .. modInfo1:getName()
                end
                description = description .. " <LINE> "
            end
            description = description .. " <INDENT:0> "
        end

        -- Mod ID
        description = description .. " <LINE> <TEXT> " .. getText("UI_ModManager_Info_ModID", modInfo:getId()) .. " <LINE> "
        -- Workshop ID
        if getSteamModeActive() and modInfo:getWorkshopID() then
            description = description .. getText("UI_ModManager_Info_WorkshopID", modInfo:getWorkshopID()) .. " <LINE> "
        end

        -- Mod version
        if modInfoExtra.modVersion ~= nil then
            description = description .. getText("UI_ModManager_Info_ModVersion", modInfoExtra.modVersion) .. " <LINE> "
        end

        -- Authors
        local authors = modInfoExtra.authors
        if authors ~= nil then
            description = description .. " <TEXT> " .. getText("UI_ModManager_Info_Author")
            for index, author in ipairs(authors) do
                description = description .. " " .. author
                if #authors > 1 and index ~= #authors then
                    description = description .. ","
                end
            end
            description = description .. " <LINE> "
        end

        -- Maps
        local maps = modInfoExtra.maps
        if maps ~= nil then
            description = description .. " <LINE> <TEXT> " .. getText("UI_ModManager_Info_Maps")
            description = description .. " <LINE> <INDENT:20> "
            for _, map in ipairs(maps) do
                description = description .. map .. " <LINE> "
            end
            description = description .. " <INDENT:0> "
        end

        -- Tags
        local tags = modInfoExtra.tags or {}
        local customTags = self.parent.manager.customTags[modInfo:getId()] or {}
        if #tags + #customTags > 0 then
            description = description .. " <LINE> <TEXT> " .. getText("UI_ModManager_Info_Tags")
            description = description .. " <LINE> <INDENT:20> "
            for _, tag in ipairs(tags) do
                description = description .. tag .. " <LINE> "
            end
            for _, tag in ipairs(customTags) do
                description = description .. "<RGB:0.5,1,0.5>" .. tag .. " <LINE> "
            end
            description = description .. " <INDENT:0> "
        end

        self.descRichText:setText(description)
        self.descRichText:paginate()

        -- Formation links
        if modInfo:getWorkshopID() and isSteamOverlayEnabled() then
            self.workshopButton:setVisible(true)
        else
            self.workshopButton:setVisible(false)
        end

        if modInfo:getUrl() ~= nil and modInfo:getUrl() ~= "" then
            self.urlLabel:setVisible(true)
            self.urlEntry:setVisible(true)
            self.urlButton:setVisible(true)
            self.urlButton.tooltip = getText("UI_mods_OpenWebBrowser")
            self.urlEntry:setText(modInfo:getUrl())
        elseif modInfoExtra.url ~= nil and modInfoExtra.url ~= "" then
            self.urlLabel:setVisible(true)
            self.urlEntry:setVisible(true)
            self.urlButton:setVisible(true)
            self.urlButton.tooltip = getText("UI_mods_OpenWebBrowser") .. " " .. getText("UI_ModManager_Info_URLWarning")
            self.urlEntry:setText(modInfoExtra.url)
        else
            self.urlLabel:setVisible(false)
            self.urlEntry:setVisible(false)
            self.urlButton:setVisible(false)
            self.urlEntry:setText("")
        end

        if self.workshopButton:isVisible() and self.urlButton:isVisible() then
            self.urlButton:setX(self.customTagsButton:getX() - BUTTON_SQ - DX)
            self.workshopButton:setX(self.urlButton:getX() - BUTTON_SQ - DX)
        elseif self.workshopButton:isVisible() then
            self.workshopButton:setX(self.customTagsButton:getX() - BUTTON_SQ - DX)
        elseif self.urlButton:isVisible() then
            self.urlButton:setX(self.customTagsButton:getX() - BUTTON_SQ - DX)
        end

        self.locationEntry:setText(modInfo:getDir())

        self.item = item
        self.selected = i
    end

    if self.width - self.scrollwidth ~= self.descRichText.width then
        self.descRichText:setWidth(self.width - self.scrollwidth)
        self.descRichText:paginate()
    end

    local bottom = self.thumbnailPanel:getBottom() + self.descRichText:getHeight() + DY
    if not self.thumbnailPanel:isVisible() then
        bottom = self.posterPanel:getBottom() + self.descRichText:getHeight() + DY
    end

    self.locationLabel:setY(bottom + 2)
    self.locationEntry:setY(bottom)
    bottom = self.locationEntry:getBottom() + DY

    if self.urlButton:isVisible() then
        self.urlLabel:setY(bottom + 4)
        self.urlEntry:setY(bottom + 2)
        bottom = self.urlEntry:getBottom() + DY
    end
    bottom = bottom + BUTTON_SQ + DX

    self:setScrollHeight(bottom)
    self:setStencilRect(0, 0, self:getWidth(), self:getHeight())

    ISPanelJoypad.prerender(self)
end

function ModPanelInfo:render()
    ISPanelJoypad.render(self)

    local x = self.thumbnailPanel:isVisible() and self.thumbnailPanel:getBottom() or self.posterPanel:getBottom()
    self.descRichText:render(0, x, self)
    self:clearStencilRect()
    self:drawRectBorderStatic(0, 0, self.width, self.height, self.borderColor.a, self.borderColor.r, self.borderColor.g, self.borderColor.b)
    self:drawRectBorderStatic(
            self.width - self.scrollwidth, 0, 1, self.height,
            self.borderColor.a, self.borderColor.r, self.borderColor.g, self.borderColor.b
    )
end

function ModPanelInfo:onMouseWheel(del)
    self:setYScroll(self:getYScroll() - (del * 40))
    return true
end

function ModPanelInfo:onGoButton(button)
    if button.internal == "URL" then
        ModManagerUtils.openUrl(self.urlEntry.title)
    elseif button.internal == "WORKSHOP" then
        ModManagerUtils.openWorkshopLink(self.item.modInfo:getWorkshopID())
    end
end

function ModPanelInfo:onCustomTagsDialog()
    local modId = self.parent.listBox.items[self.selected].item.modInfo:getId()
    local text = table.concat(self.parent.manager.customTags[modId] or {}, ",")
    local modal = ISTextBox:new(
            (getCore():getScreenWidth() / 2) - 140,
            (getCore():getScreenHeight() / 2) - 90,
            280, 180,
            getText("UI_ModManager_Info_Tags_Request"),
            text, self, self.onCustomTagsConfirm
    )
    modal.validateTooltipText = getText("UI_ModManager_Info_Tags_Warning", ModManager.getCustomTagsIllegalCharsString())
    modal:initialise()
    modal:setCapture(true)
    modal:setAlwaysOnTop(true)
    modal:setValidateFunction(nil, ModManager.isValidCustomTags)
    modal:addToUIManager()
    modal.entry:focus()

    modal.addComboBox = ISComboBox:new(
            modal.entry:getX(), modal.entry:getBottom() + DY, (modal.entry:getWidth() - DX) / 2, BUTTON_HGT, modal,
            function(parent)
                local tags = luautils.split(parent.entry:getText(), ",")
                local addTag = parent.addComboBox:getOptionData(parent.addComboBox.selected)
                table.insert(tags, addTag)
                parent.entry:setText(table.concat(tags, ","))
                parent.entry:onTextChange()
            end
    )
    modal.addComboBox.noSelectionText = getText("UI_ModManager_Info_TagsCombo_Add")
    modal.addComboBox.image = ICON_PLUS
    modal:addChild(modal.addComboBox)

    modal.delComboBox = ISComboBox:new(
            modal.addComboBox:getRight() + DX, modal.entry:getBottom() + DY, (modal.entry:getWidth() - DX) / 2, BUTTON_HGT, modal,
            function(parent)
                local index = parent.delComboBox.selected
                if parent.delComboBox:getOptionData(index) == "all" then
                    parent.entry:setText("")
                else
                    local tags, delTag = {}, parent.delComboBox:getOptionText(index)
                    for _, tag in ipairs(luautils.split(parent.entry:getText(), ",")) do
                        if tag ~= delTag then
                            table.insert(tags, tag)
                        end
                    end
                    parent.entry:setText(table.concat(tags, ","))
                end
                parent.entry:onTextChange()
            end
    )
    modal.delComboBox.noSelectionText = getText("UI_ModManager_Info_TagsCombo_Del")
    modal.delComboBox.image = ICON_MINUS
    modal:addChild(modal.delComboBox)

    modal.entry.onTextChange = function(entry)
        local current_tags_d = luautils.split(entry:getInternalText(), ",") -- no entry:getText() - it returns previous text
        local current_tags_a = {}
        for _, tag in ipairs(current_tags_d) do
            current_tags_a[tag] = true
        end
        local all_tags = {}
        for tag, _ in pairs(self.parent.counters.customTags) do
            if not current_tags_a[tag] then
                table.insert(all_tags, tag)
            end
        end
        table.sort(all_tags)

        if #all_tags == 0 then
            entry.parent.addComboBox.disabled = true
        else
            entry.parent.addComboBox:clear()
            for _, tag in ipairs(all_tags) do
                local count = self.parent.counters.customTags[tag]
                entry.parent.addComboBox:addOptionWithData(tag .. " [" .. tostring(count) .. "]", tag)
            end
            entry.parent.addComboBox.disabled = false
        end
        entry.parent.addComboBox.selected = 0

        if #current_tags_d == 0 then
            entry.parent.delComboBox.disabled = true
        else
            entry.parent.delComboBox:clear()
            entry.parent.delComboBox:addOptionWithData(getText("UI_ModManager_Info_TagsCombo_All"), "all")
            for _, tag in ipairs(current_tags_d) do
                entry.parent.delComboBox:addOption(tag)
            end
            entry.parent.delComboBox.disabled = false
        end
        entry.parent.delComboBox.selected = 0
    end

    modal.entry:onTextChange()
end

function ModPanelInfo:onCustomTagsConfirm(button)
    if button.internal == "OK" then
        local modId = self.parent.listBox.items[self.selected].item.modInfo:getId()
        local text = button.parent.entry:getText()

        local old_tags, new_tags = {}, {}
        for _, tag in ipairs(self.parent.manager.customTags[modId] or {}) do
            old_tags[tag] = true
        end
        for _, tag in ipairs(luautils.split(text, ",")) do
            new_tags[tag] = true
        end

        -- Update tags and counts
        for tag, _ in pairs(old_tags) do
            if not new_tags[tag] then
                self.parent.counters.customTags[tag] = self.parent.counters.customTags[tag] - 1
            end
        end
        self.parent.manager.customTags[modId] = {}
        for tag, _ in pairs(new_tags) do
            self.parent.counters.customTags[tag] = (self.parent.counters.customTags[tag] or 0) + 1
            table.insert(self.parent.manager.customTags[modId], tag)
        end
        table.sort(self.parent.manager.customTags[modId])

        -- Save custom tags
        self.parent.manager:saveCustomTags()

        -- To force update info panel
        self.item = nil

        -- Update dropdown list for search string
        if self.parent.filterPanel.searchBy2.selected[4] then
            self.parent.filterPanel.searchEntryBox.options = {}
            local tags = {}
            for i, j in pairs(self.parent.counters.originalTags) do
                tags[i] = j
            end
            for i, j in pairs(self.parent.counters.customTags) do
                tags[i] = (tags[i] or 0) + j
            end
            for i, j in pairs(tags) do
                self.parent.filterPanel.searchEntryBox:addOption(i, j)
            end
        end
    end
end

-- ******************************
-- ModPanelPresets
-- ******************************

function ModPanelPresets:new(x, y, width, height)
    local o = MMPanelPresets:new(x, y, width, height)
    setmetatable(o, self)
    self.__index = self
    o.validateNameText = getText("UI_ModManager_Presets_Save_Warning", ModManager.getPresetNameIllegalCharsString())
    o.validateNameFunc = ModManager.isValidPresetName
    return o
end

function ModPanelPresets:createChildren()
    MMPanelPresets.createChildren(self)

    self.loadFromButton = MMButton:new(
            self.delButton:getRight() + DX, 0, BUTTON_WDH, BUTTON_HGT,
            getText("UI_ModManager_Presets_Button_LoadFromSave"), self, self.onLoadFromButton
    )
    self.loadFromButton:setWidthToTitle(BUTTON_WDH)
    self:addChild(self.loadFromButton)
end

function ModPanelPresets:updateOptions()
    self.presetsComboBox:clear()
    self.presetsComboBox:addOptionWithData(getText("UI_ModManager_Presets_List_DisableAll"), "clearAll")
    self.presetsComboBox:addOptionWithData(getText("UI_ModManager_Presets_List_DisableAllExceptFavs"), "clear")
    self.presetsComboBox:addOptionWithData(getText("UI_ModManager_Presets_List_EnableAll"), "enableAll")
    self.presetsComboBox:addOptionWithData(getText("UI_ModManager_Presets_List_EnableAllExceptHidden"), "enable")
    self.presetsComboBox:addOptionWithData(getText("UI_ModManager_Presets_List_Default"), "game_default")
    if MainScreen.latestSaveGameMode and MainScreen.latestSaveWorld and #getFullSaveDirectoryTable() > 0 then
        if not (MainScreen.latestSaveGameMode == "LastStand") and not (MainScreen.latestSaveGameMode == "Multiplayer") then
            getWorld():setGameMode(MainScreen.latestSaveGameMode)
            getWorld():setWorld(MainScreen.latestSaveWorld)
            if getSaveInfo(getWorld():getWorld()).gameMode then
                self.presetsComboBox:addOptionWithData(getText("UI_ModManager_Presets_List_LastSave"), "game_lastSave")
            end
        end
    end
    if self.parent.loadGameFolder or self.parent.isNewGame then
        self.presetsComboBox:addOptionWithData(getText("UI_ModManager_Presets_List_CurrentSave"), "game_currentSave")
    end
    for name, _ in pairs(self.parent.manager.presets) do
        if name ~= ModManager.PRESET_FAVORITES and name ~= ModManager.PRESET_HIDDEN then
            self.presetsComboBox:addOptionWithData(name, "user")
        end
    end
    self.presetsComboBox.selected = 0
    self.delButton:setEnable(false)
end

function ModPanelPresets:onSelectedAux(name, data)
    local activeList = {}
    if data == "clearAll" then
        for _, item in ipairs(self.parent.listBox.items) do
            item.item.isActive = false
            item.item.isFavorite = false
        end
        self:updateOptions()
    elseif data == "clear" then
        for _, item in ipairs(self.parent.listBox.items) do
            if not item.item.isFavorite then
                item.item.isActive = false
            else
                table.insert(activeList, item.item.modInfo:getId())
                activeList[item.item.modInfo:getId()] = true
            end
        end
        self:updateOptions()
    elseif data == "enableAll" then
        for _, item in ipairs(self.parent.listBox.items) do
            item.item.isHidden = false

            table.insert(activeList, item.item.modInfo:getId())
            activeList[item.item.modInfo:getId()] = true
        end
        self:updateOptions()
    elseif data == "enable" then
        for _, item in ipairs(self.parent.listBox.items) do
            if not item.item.isHidden then
                table.insert(activeList, item.item.modInfo:getId())
                activeList[item.item.modInfo:getId()] = true
            end
        end
        self:updateOptions()
    elseif data == "game_default" then
        local mods = ActiveMods.getById("default"):getMods()
        if not self.parent.isNewGame and not self.parent.loadGameFolder then
            -- "default" list is edited, load backup
            mods = ActiveMods.getById("modManager"):getMods()
        end
        for i = 0, mods:size() - 1 do
            table.insert(activeList, mods:get(i))
            activeList[mods:get(i)] = true
        end
    elseif data == "game_lastSave" then
        local latestSave = MainScreen.latestSaveGameMode .. getFileSeparator() .. MainScreen.latestSaveWorld
        local mods = getSaveInfo(latestSave).activeMods:getMods()
        for i = 0, mods:size() - 1 do
            table.insert(activeList, mods:get(i))
            activeList[mods:get(i)] = true
        end
    elseif data == "game_currentSave" then
        -- "currentGame" list is edited, load backup
        local mods = ActiveMods.getById("modManager"):getMods()
        for i = 0, mods:size() - 1 do
            table.insert(activeList, mods:get(i))
            activeList[mods:get(i)] = true
        end
    elseif data == "user" then
        for _, modId in ipairs(self.parent.manager.presets[name]) do
            table.insert(activeList, modId)
            activeList[modId] = true
        end
    end

    self:onApplyPreset(activeList)
end

function ModPanelPresets:onApplyPreset(activeList)
    self.parent.counters.enabled = 0
    self.parent.counters.favorites = 0
    self.parent.counters.hidden = 0

    local warnBroken, warnFavs, warnHidden = {}, {}, {}

    -- TODO: add mod names instead of their ids when possible
    -- Remove not existing mods
    for i = #activeList, 1, -1 do
        local modId = activeList[i]
        if not getModInfoByID(modId) or not getModInfoByID(modId):isAvailable() then
            table.insert(warnBroken, modId)

            activeList[modId] = nil
            table.remove(activeList, i)
        end
    end

    for _, item in ipairs(self.parent.listBox.items) do
        local modId = item.item.modInfo:getId()

        if activeList[modId] and item.item.isHidden then
            table.insert(warnHidden, modId)

            activeList[modId] = nil
            table.remove(activeList, ModManagerUtils.indexOf(activeList, modId))
        end
        if item.item.isFavorite then
            if not activeList[modId] and item.item.isAvailable then
                table.insert(warnFavs, modId)

                table.insert(activeList, modId)
                activeList[modId] = true
            end

            self.parent.counters.favorites = self.parent.counters.favorites + 1
        elseif item.item.isHidden then
            self.parent.counters.hidden = self.parent.counters.hidden + 1
        end
        if activeList[modId] then
            item.item.isActive = true
            self.parent.counters.enabled = self.parent.counters.enabled + 1
        else
            item.item.isActive = false
        end
    end

    local activeMods = self.parent:getActiveMods()
    activeMods:clear()
    for _, modId in ipairs(activeList) do
        activeMods:setModActive(modId, true)
    end

    self.parent.listBox:updateFilter()
    self.parent:showModsWarning(warnBroken, warnFavs, warnHidden)
end

function ModPanelPresets:onSavePresetAux(name)
    self.parent.manager.presets[name] = {}
    local activeList = self.parent:getActiveMods():getMods()
    for i = 0, activeList:size() - 1 do
        table.insert(self.parent.manager.presets[name], activeList:get(i))
    end
    self.parent.manager:savePresets()
end

function ModPanelPresets:onDeletePresetAux(name)
    self.parent.manager.presets[name] = nil
    self.parent.manager:savePresets()
end

function ModPanelPresets:onLoadFromButton()
    local loadGameScreen = LoadGameScreen.instance
    loadGameScreen.originalRender = LoadGameScreen.render
    loadGameScreen.originalOnOptionMouseDown = LoadGameScreen.onOptionMouseDown
    loadGameScreen.originalOnDblClickWorld = LoadGameScreen.onDblClickWorld

    loadGameScreen.render = function() end
    loadGameScreen.onDblClickWorld = function(target)
        target:onOptionMouseDown(target.loadModsButton)
    end
    loadGameScreen.onOptionMouseDown = function(target, button, x, y)
        target:setVisible(false)
        ModSelector.instance:setVisible(true)

        target.render = target.originalRender
        target.onOptionMouseDown = target.originalOnOptionMouseDown
        target.onDblClickWorld = target.originalOnDblClickWorld

        target:removeChild(target.loadModsButton)

        target.listbox:setOnMouseDoubleClick(target, target.onDblClickWorld)
        target.backButton.onclick = target.onOptionMouseDown

        if target.joyfocus then
            target.joyfocus.focus = ModSelector.instance
            updateJoypadFocus(target.joyfocus)
        end

        if button.internal == "BACK" then
            -- Do nothing
        elseif button.internal == "LOAD_MODS" then
            local selected = target.listbox.items[target.listbox.selected]
            if not selected then return end
            ModSelector.instance.presetsPanel:onSaveFileSelected(selected.text)
            ModSelector.instance.presetsPanel:updateOptions()
        end
    end

    loadGameScreen.loadModsButton = ISButton:new(
            loadGameScreen.width - 116, loadGameScreen.height - BUTTON_HGT - 5, 100, BUTTON_HGT,
            getText("UI_ModManager_LoadGameScreen_Button_LoadMods"), loadGameScreen, loadGameScreen.onOptionMouseDown
    )
    loadGameScreen.loadModsButton.internal = "LOAD_MODS"
    loadGameScreen.loadModsButton:setAnchorLeft(false)
    loadGameScreen.loadModsButton:setAnchorRight(true)
    loadGameScreen.loadModsButton:setAnchorTop(false)
    loadGameScreen.loadModsButton:setAnchorBottom(true)
    loadGameScreen.loadModsButton.borderColor = { r = 1, g = 1, b = 1, a = 0.1 }
    loadGameScreen:addChild(loadGameScreen.loadModsButton)

    loadGameScreen.playButton:setVisible(false)
    loadGameScreen.configButton:setVisible(false)
    loadGameScreen.deleteButton:setVisible(false)

    loadGameScreen.listbox:setOnMouseDoubleClick(loadGameScreen, loadGameScreen.onDblClickWorld)
    loadGameScreen.backButton.onclick = loadGameScreen.onOptionMouseDown

    loadGameScreen:setSaveGamesList()
    loadGameScreen:setVisible(true, JoypadState.getMainMenuJoypad())

    self.parent:setVisible(false)
end

function ModPanelPresets:onSaveFileSelected(folder)
    local activeMods = {}
    local mods = getSaveInfo(folder).activeMods:getMods()
    for i = 0, mods:size() - 1 do
        table.insert(activeMods, mods:get(i))
        activeMods[mods:get(i)] = true
    end

    self:onApplyPreset(activeMods)
end

Events.OnKeyPressed.Add(ModSelector.onKeyPressed)
Events.OnModsModified.Add(ModSelector.onModsModified)