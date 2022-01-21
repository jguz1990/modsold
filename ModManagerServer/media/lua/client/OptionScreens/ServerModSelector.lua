---
--- Mod: Mod Manager
--- Workshop: https://steamcommunity.com/sharedfiles/filedetails/?id=2725216703
--- Author: NoctisFalco
--- Profile: https://steamcommunity.com/id/NoctisFalco/
---
--- Redistribution of this mod without explicit permission from the creator is prohibited
--- under any circumstances. This includes, but not limited to, uploading this mod to the Steam Workshop
--- or any other site, distribution as part of another mod or modpack, distribution of modified versions.
---
--- Copyright 2022 NoctisFalco
---

require('ModManager')
require('ModManagerUtils')
require('UI/MMListBox')
require('UI/MMPanelPresets')

local ICON_ABOUT = getTexture("media/ui/MM_Button_About.png")
local ICON_DEFAULT = getTexture("media/ui/MM_Icon_ModDefault.png")
local ICON_DEFAULT_GREY = getTexture("media/ui/MM_Icon_ModDefaultGrey.png")
local ICON_MAP = getTexture("media/ui/MM_Icon_ModMap.png")
local ICON_MAP_GREY = getTexture("media/ui/MM_Icon_ModMapGrey.png")
local ICON_ACTIVE = getTexture("media/ui/MM_Icon_StatusActive.png")
local ICON_REQUIRED = getTexture("media/ui/MM_Icon_StatusRequired.png")
local ICON_BROKEN = getTexture("media/ui/icon_broken.png")
local ICON_FAVORITE = getTexture("media/ui/FavoriteStar.png")
local ICON_LOC_STEAM = getTexture("media/ui/MM_Icon_LocationSteam.png")
local ICON_LOC_Z_MODS = getTexture("media/ui/MM_Icon_LocationMods.png")
local ICON_LOC_Z_WORK = getTexture("media/ui/MM_Icon_LocationWorkshop.png")
local ICON_UPDATE = getTexture("media/ui/MM_Icon_StateUpdate.png")

local FONT_HGT_TITLE = getTextManager():getFontHeight(UIFont.Title)
local FONT_HGT_MEDIUM = getTextManager():getFontHeight(UIFont.Medium)
local FONT_HGT_SMALL = getTextManager():getFontHeight(UIFont.Small)

local BUTTON_HGT = math.max(25, FONT_HGT_SMALL + 3 * 2)
local BUTTON_WDH = 100
local ENTRY_HGT = FONT_HGT_MEDIUM + 4
local DX, DY = 8, 8

ServerModSelector = ISPanelJoypad:derive("ServerModSelector")
local ServerChoiceListBox = MMListBox:derive("ServerChoiceListBox")
local ServerWorkshopListBox = MMListBox:derive("ServerWorkshopListBox")
local ServerModsListBox = MMListBox:derive("ServerWorkshopListBox")
local ServerPanelPresets = MMPanelPresets:derive("ServerPanelPresets")
local ServerPanelConfigs = ISPanelJoypad:derive("ServerPanelConfigs")

function ServerModSelector:new()
    local width, height = ModSelector.instance.width, ModSelector.instance.height
    local x, y = ModSelector.instance.x, ModSelector.instance.y
    local o = ISPanelJoypad:new(x, y, width, height)
    setmetatable(o, self)
    self.__index = self
    o.backgroundColor = { r = 0, g = 0, b = 0, a = 0.95 }
    o.borderColor = { r = 0.4, g = 0.4, b = 0.4, a = 1 }
    o.anchorLeft = true
    o.anchorRight = false
    o.anchorTop = true
    o.anchorBottom = false
    o.manager = ModManager.instance
    o.manager:loadServerPresets()
    o.counters = {} -- see ServerModSelector.populateListBox()
    o.ignoreNextTabKey = false -- see ServerModSelector.onKeyPressed(key) and MMTextEntryList.onOtherKey(key)
    o.workshopItemDetails = {}
    ServerModSelector.instance = o
    --[[
    o.clientWorkshopItems = { workshopID1 = { modID = true, ... }, workshopID2 = { modID = true }, ... }
    o.clientModIDs = { modID1 = true, ... }
    o.serverSettings = ServerSettings object
    ]]
    return o
end

function ServerModSelector:initialise()
    ISPanelJoypad.initialise(self)
    self:setAlwaysOnTop(true)
    self:setCapture(true)

    -- Changelog
    self:showChangelog()

    local halfW = (self.width - 3 * DX) / 2
    local halfH = (self.height - (FONT_HGT_TITLE + DY * 2 + BUTTON_HGT + DY * 2 + DY)) / 2
    local thin = (halfW - DX) / 3

    self.titleLabel = ISLabel:new(0, DY, FONT_HGT_TITLE, "MOD MANAGER: SERVER", 1, 1, 1, 1, UIFont.Title, true)
    self.titleLabel:setX((self.width - self.titleLabel:getWidth()) / 2)
    self:addChild(self.titleLabel)

    self.aboutButton = MMImageButton:new(
            self.width - FONT_HGT_TITLE - DX, self.titleLabel:getY(),
            FONT_HGT_TITLE, FONT_HGT_TITLE, self, self.onButtonClick
    )
    self.aboutButton.internal = "ABOUT"
    self.aboutButton:setImage(ICON_ABOUT)
    self.aboutButton:setPadding(DX, DY)
    self.aboutButton:setAnchorLeft(false)
    self.aboutButton:setAnchorRight(true)
    self.aboutButton:setAnchorTop(true)
    self.aboutButton:setAnchorBottom(false)
    self:addChild(self.aboutButton)

    self.filterPanel = MMPanelFilter:new(DX, FONT_HGT_TITLE + DY * 2, halfW, BUTTON_HGT * 3 + DY * 4)
    self.filterPanel:setSettingsCategory(ModManager.SETTINGS_SERVER)
    self:addChild(self.filterPanel)

    self.listBox = ServerChoiceListBox:new(DX, self.filterPanel:getBottom() + DY, halfW, halfH * 2 - self.filterPanel:getHeight())
    self.listBox:setDisabledText(getText("UI_ModManager_Server_List_SelectConfig"))
    self.listBox:setEmptyText(getText("UI_ModManager_List_Empty"))
    self:addChild(self.listBox)

    self.workshopListBox = ServerWorkshopListBox:new(halfW + DX * 2, FONT_HGT_TITLE + DY * 2, thin, halfH * 2 - ENTRY_HGT)
    self:addChild(self.workshopListBox)

    self.workshopTextEntry = ISTextEntryBox:new(
            "", halfW + DX * 2, self.height - (DY + BUTTON_HGT) - (DY + ENTRY_HGT), thin, ENTRY_HGT
    )
    self.workshopTextEntry.font = UIFont.Medium
    self.workshopTextEntry.tooltip = ServerModSelector.getTooltipText("UI_ServerSettings_AddOtherWorkshopItem_tooltip")
    self.workshopTextEntry.onCommandEntered = function(entry)
        if entry:getInternalText() ~= "" and entry.parent:isValidWorkshopID(entry:getInternalText()) then
            local workshopID = entry:getText()
            local itemMods = entry.parent.clientWorkshopItems[workshopID]
            if itemMods then
                for modID, _ in pairs(itemMods) do
                    entry.parent:doActiveModID(modID)
                end
                entry.parent.listBox:updateFilter()
            else
                entry.parent.workshopListBox:doActive(workshopID)
            end

            local index = entry.parent.workshopListBox.indexById[workshopID]
            if index then
                entry.parent.workshopListBox:ensureVisible(index)
            end

            if not entry.parent.clientWorkshopItems[workshopID] then
                entry.parent:queryExternalWorkshopItemDetails(workshopID)
            end

            entry:setText("")
        end
    end
    self.workshopTextEntry.onTextChange = function(entry)
        if entry:getInternalText() == "" or entry.parent:isValidWorkshopID(entry:getInternalText()) then
            entry.borderColor.a = 1
            entry.borderColor.g = 0.4
            entry.borderColor.b = 0.4
        else
            entry.borderColor.a = 0.9
            entry.borderColor.g = 0.0
            entry.borderColor.b = 0.0
        end
    end
    self:addChild(self.workshopTextEntry)

    self.modsListBox = ServerModsListBox:new(halfW + thin + DX * 3, FONT_HGT_TITLE + DY * 2, thin * 2, halfH * 2 - ENTRY_HGT)
    self:addChild(self.modsListBox)

    self.modTextEntry = ISTextEntryBox:new(
            "", halfW + thin + DX * 3, self.height - (DY + BUTTON_HGT) - (DY + ENTRY_HGT), thin * 2, ENTRY_HGT
    )
    self.modTextEntry.font = UIFont.Medium
    self.modTextEntry.tooltip = ServerModSelector.getTooltipText("UI_ServerSettings_AddOtherMod_tooltip")
    self.modTextEntry.onCommandEntered = function(entry)
        if entry:getInternalText() ~= "" and not string.contains(entry:getInternalText(), ";") then
            local modID = entry:getText()
            entry.parent:doActiveRequest(modID)

            local index = entry.parent.modsListBox.indexById[modID]
            if index then
                entry.parent.modsListBox:ensureVisible(index)
            end

            entry:setText("")
        end
    end
    self.modTextEntry.onTextChange = function(entry)
        if entry:getInternalText() == "" or not string.contains(entry:getInternalText(), ";") then
            entry.borderColor.a = 1
            entry.borderColor.g = 0.4
            entry.borderColor.b = 0.4
        else
            entry.borderColor.a = 0.9
            entry.borderColor.g = 0.0
            entry.borderColor.b = 0.0
        end
    end
    self:addChild(self.modTextEntry)

    self.backButton = MMButton:new(
            DX, self.height - (DY + BUTTON_HGT), BUTTON_WDH, BUTTON_HGT,
            getText("UI_ModManager_Button_Back"):upper(), self, self.onBack
    )
    self.backButton:setAnchorTop(false)
    self.backButton:setAnchorBottom(true)
    self.backButton:setWidthToTitle(BUTTON_WDH)
    self:addChild(self.backButton)

    self.saveButton = MMButton:new(
            self.width - (DX + BUTTON_WDH), self.height - (DY + BUTTON_HGT), BUTTON_WDH, BUTTON_HGT,
            getText("UI_ModManager_Button_Save"):upper(), self, self.onSave
    )
    self.saveButton:setAnchorLeft(false)
    self.saveButton:setAnchorRight(true)
    self.saveButton:setAnchorTop(false)
    self.saveButton:setAnchorBottom(true)
    self.saveButton:setWidthToTitle(BUTTON_WDH)
    self.saveButton:setX(self.width - (DX + self.saveButton:getWidth()))
    self:addChild(self.saveButton)

    self.presetsPanel = ServerPanelPresets:new(
            self.backButton:getRight() + DX, self.height - (DY + BUTTON_HGT),
            self.listBox:getRight() - (self.backButton:getRight() + DX * 2), BUTTON_HGT
    )
    self.presetsPanel:setAnchorTop(false)
    self.presetsPanel:setAnchorBottom(true)
    self:addChild(self.presetsPanel)

    self.configsPanel = ServerPanelConfigs:new(
            halfW + DX, self.height - (DY + BUTTON_HGT),
            self.saveButton:getX() - self.workshopListBox:getX() - DX, BUTTON_HGT
    )
    self.configsPanel:setAnchorTop(false)
    self.configsPanel:setAnchorBottom(true)
    self:addChild(self.configsPanel)

    self:setChildrenEnable(false)
end

function ServerModSelector:onResolutionChange(oldW, oldH, newW, newH)
    self:setX(ModSelector.instance:getX())
    self:setY(ModSelector.instance:getY())
    self:setWidth(ModSelector.instance:getWidth())
    self:setHeight(ModSelector.instance:getHeight())
    self:recalcSize()

    local halfW = (self.width - 3 * DX) / 2
    local halfH = (self.height - (FONT_HGT_TITLE + DY * 2 + BUTTON_HGT + DY * 2 + DY)) / 2
    local thin = (halfW - DX) / 3

    self.titleLabel:setX((self.width - self.titleLabel:getWidth()) / 2)

    self.filterPanel:setWidth(halfW)
    self.filterPanel:onResolutionChange()

    self.listBox:setWidth(halfW)
    self.listBox:setHeight(halfH * 2 - self.filterPanel:getHeight())
    self.listBox.btn.x = halfW - self.listBox.btn.w - DX

    self.workshopListBox:setX(halfW + DX * 2)
    self.workshopListBox:setWidth(thin)
    self.workshopListBox:setHeight(halfH * 2 - ENTRY_HGT)
    self.workshopListBox.btn.x = thin - self.workshopListBox.btn.w - DX
    self.workshopTextEntry:setX(halfW + DX * 2)
    self.workshopTextEntry:setY(self.workshopListBox:getBottom() + DY)
    self.workshopTextEntry:setWidth(thin)

    self.modsListBox:setX(halfW + thin + DX * 3)
    self.modsListBox:setWidth(thin * 2)
    self.modsListBox:setHeight(halfH * 2 - ENTRY_HGT)
    self.modsListBox.btn.x = thin * 2 - self.modsListBox.btn.w - DX
    self.modTextEntry:setX(halfW + thin + DX * 3)
    self.modTextEntry:setY(self.modsListBox:getBottom() + DY)
    self.modTextEntry:setWidth(thin * 2)

    self.configsPanel:setX(halfW + DX)
    self.configsPanel:setWidth(self.saveButton:getX() - self.workshopListBox:getX() - DX)
end

function ServerModSelector:populateListBox()
    local workshopMods, zomboidMods = {}, {}
    for _, directory in ipairs(getModDirectoryTable()) do
        local modInfo = getModInfo(directory)
        if modInfo then
            local modID = modInfo:getId()
            local workshopID = modInfo:getWorkshopID()
            if workshopID then
                workshopMods[modID] = modInfo
            else
                zomboidMods[modID] = modInfo
            end
        end
    end

    self.listBox:clear()
    self.clientModIDs = {}
    self.clientWorkshopItems = {}

    for modID, modInfo in pairs(workshopMods) do
        self.listBox:addItem(modInfo:getName(), { modInfo = modInfo })
        self.listBox.indexById[modID] = #self.listBox.items
    end
    for modID, modInfo in pairs(zomboidMods) do
        if not workshopMods[modID] then
            self.listBox:addItem(modInfo:getName(), { modInfo = modInfo })
            self.listBox.indexById[modID] = #self.listBox.items
        end
    end

    self.counters = {
        workshop = 0,
        map = 0,
        translated = 0,
        available = 0,
        enabled = 0,
        needsUpdate = 0,
        favorites = 0,
        hidden = 0,
        authors = {},
        originalTags = {},
        customTags = {},
    }

    local favorList = {}
    for _, modID in ipairs(self.manager.presets.mmFavorites) do
        favorList[modID] = true
    end
    local hiddenList = {}
    for _, modID in ipairs(self.manager.presets.mmHidden) do
        hiddenList[modID] = true
    end

    for _, i in ipairs(self.listBox.items) do
        local item, modID = i.item, i.item.modInfo:getId()

        item.name = item.modInfo:getName()
        item.modID = modID
        item.workshopID = item.modInfo:getWorkshopID()
        item.indexAdded = self.manager:indexByDateAdded(modID)
        item.isAvailable = item.modInfo:isAvailable()
        item.isFavorite = favorList[modID] or false
        item.isHidden = hiddenList[modID] or false
        item.isActive = false

        item.timeCreated = 0
        item.timeUpdated = 0

        -- Populate dependents
        self:readRequire(modID)

        if item.isAvailable then self.counters.available = self.counters.available + 1 end
        if item.isFavorite then self.counters.favorites = self.counters.favorites + 1 end
        if item.isHidden then self.counters.hidden = self.counters.hidden + 1 end
        if item.modInfo:getWorkshopID() then self.counters.workshop = self.counters.workshop + 1 end

        item.modInfoExtra = self:readInfoExtra(modID)
        item.modInfoExtra.translated = fileExists(
                item.modInfo:getDir() .. string.gsub("/media/lua/shared/Translate/" .. Translator.getLanguage():name(),
                        "/", getFileSeparator())
        )

        if item.modInfoExtra.maps then self.counters.map = self.counters.map + 1 end
        if item.modInfoExtra.translated then self.counters.translated = self.counters.translated + 1 end

        for _, tag in ipairs(item.modInfoExtra.tags or {}) do
            self.counters.originalTags[tag] = (self.counters.originalTags[tag] or 0) + 1
        end
        for _, author in ipairs(item.modInfoExtra.authors or {}) do
            self.counters.authors[author] = (self.counters.authors[author] or 0) + 1
        end

        self.clientModIDs[modID] = true

        if item.workshopID then
            if not self.clientWorkshopItems[item.workshopID] then
                self.clientWorkshopItems[item.workshopID] = {}
            end
            self.clientWorkshopItems[item.workshopID][item.modID] = true
        end
    end

    -- Count custom tags
    for _, tags in pairs(self.manager.customTags) do
        for _, tag in ipairs(tags) do
            self.counters.customTags[tag] = (self.counters.customTags[tag] or 0) + 1
        end
    end

    -- Sort by name and re-index
    self.listBox:sort()
    self.listBox:reindexById()

    self:queryWorkshopItemDetails()
    self.presetsPanel:updateOptions()
    self.configsPanel:updateOptions()

    self.listBox:updateFilter()
    self.listBox.keyboardFocus = true
end

function ServerModSelector:readRequire(modID)
    local requires = getModInfoByID(modID):getRequire()
    if requires and not requires:isEmpty() then
        for i = 0, requires:size() - 1 do
            local requiredID = requires:get(i)
            local index = self.listBox.indexById[requiredID]
            if index ~= nil then
                local requiredItem = self.listBox.items[index].item
                if type(requiredItem.dependents) == "table" then
                    table.insert(requiredItem.dependents, modID)
                else
                    requiredItem.dependents = { modID }
                end
            end
        end
    end
end

function ServerModSelector:readInfoExtra(modID)
    local modInfoExtra = {}

    -- Mod with maps?
    local mapList = getMapFoldersForMod(modID)
    if mapList ~= nil and mapList:size() > 0 then
        modInfoExtra.maps = {}
        for i = 0, mapList:size() - 1 do
            table.insert(modInfoExtra.maps, mapList:get(i))
        end
    end

    -- Extra data from mod.info
    local file = getModFileReader(modID, "mod.info", false)
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

        if key == "tags" then
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

function ServerModSelector:setServerSettings(serverSettings)
    if not serverSettings then return end

    self.serverSettings = serverSettings
    self.serverSettings:loadFiles()

    for _, item in ipairs(self.listBox.items) do
        item.item.isActive = false
    end
    self.workshopListBox:clear()
    self.modsListBox:clear()

    -- Server workshop IDs
    local idsString = self.serverSettings:getServerOptions():getOptionByName("WorkshopItems"):getValue()
    local workshopIDs = string.split(idsString, ";")
    for _, workshopID in ipairs(workshopIDs) do
        if workshopID ~= "" then
            self.workshopListBox:doActive(workshopID)
        end
    end
    self:queryExternalWorkshopItemDetails(workshopIDs)

    -- Server mod IDs
    local modsString = self.serverSettings:getServerOptions():getOptionByName("Mods"):getValue()
    local modIDs = string.split(modsString, ";")
    for _, modID in ipairs(modIDs) do
        if modID ~= "" then
            self:doActiveModID(modID)
        end
    end

    self.workshopListBox:reindexById()
    self.modsListBox:reindexById()

    -- Update counters
    self.counters.enabled = 0
    for _, i in ipairs(self.listBox.items) do
        if i.item.isActive then self.counters.enabled = self.counters.enabled + 1 end
    end

    self.listBox:updateFilter()
    self.listBox.keyboardFocus = true
end

function ServerModSelector:setChildrenEnable(enable)
    self.saveButton:setEnable(enable)
    self.filterPanel:setEnable(enable)
    self.listBox:setEnable(enable)
    self.presetsPanel:setEnable(enable)
    self.workshopTextEntry:setEditable(enable)
    self.modTextEntry:setEditable(enable)
end

function ServerModSelector:isValidWorkshopID(workshopID)
    return workshopID and not string.contains(workshopID, ";") and isValidSteamID(workshopID)
end

function ServerModSelector:doActiveRequest(modID)
    self:doActiveModID(modID)
    self.listBox:updateFilter()
end

function ServerModSelector:doActiveModID(modID)
    self.listBox:doActive(modID)
    self.modsListBox:doActive(modID)
end

function ServerModSelector:doInactiveRequest(modID)
    self:doInactiveModID(modID)
    self.listBox:updateFilter()
end

function ServerModSelector:doInactiveModID(modID)
    self.modsListBox:doInactive(modID)
    self.listBox:doInactive(modID)
end

function ServerModSelector:queryWorkshopItemDetails()
    self.workshopItemDetails = {}
    local workshopIDs = getSteamWorkshopItemIDs()
    if not workshopIDs or workshopIDs:isEmpty() then
        return
    end
    querySteamWorkshopItemDetails(workshopIDs, self.onItemQueryFinished, self)
end

function ServerModSelector:queryExternalWorkshopItemDetails(workshopIDs)
    local list = ArrayList.new()
    if type(workshopIDs) == 'table' then
        for _, workshopID in pairs(workshopIDs) do
            list:add(workshopID)
        end
    else
        list:add(workshopIDs)
    end
    querySteamWorkshopItemDetails(list, self.onItemQueryFinished, self)
end

function ServerModSelector:onItemQueryFinished(status, info)
    if status == "Completed" then
        for i = 1, info:size() do
            local details = info:get(i - 1)
            local workshopID = details:getIDString()
            self.workshopItemDetails[workshopID] = details
        end
        if info:size() > 0 then
            self.counters.needsUpdate = 0
            for _, i in ipairs(self.listBox.items) do
                local item, workshopID = i.item, i.item.modInfo:getWorkshopID()
                local details = self.workshopItemDetails[workshopID]
                if workshopID and details then
                    item.timeCreated = details:getTimeCreated()
                    item.timeUpdated = details:getTimeUpdated()
                    if details:getState() == "NeedsUpdate" then
                        item.needsUpdate = true
                        self.counters.needsUpdate = self.counters.needsUpdate + 1
                    end
                end
            end
        end
    elseif status == "NotCompleted" then
    end
end

function ServerModSelector:onBack()
    self.listBox.keyboardFocus = false

    self.serverSettings = nil
    self.configsPanel.configsComboBox.options = nil

    self.clientModIDs = {}
    self.clientWorkshopItems = {}

    -- Reset filter
    self.filterPanel:resetFilter()
    -- Reset scroll
    self.listBox:ensureVisible(1)
    self.workshopTextEntry:setText("")
    self.modTextEntry:setText("")
    self:setChildrenEnable(false)

    --self.listBox:clear()
    self.workshopListBox:clear()
    self.modsListBox:clear()

    ModSelector.instance:setVisible(true)
    self:setVisible(false)
    --self:removeFromUIManager()
end

function ServerModSelector:onSave()
    local modIDsString = self.modsListBox:modIDsToString()
    self.serverSettings:getServerOptions():getOptionByName("Mods"):setValue(modIDsString)

    local workshopIDsString = self.workshopListBox:workshopIDsToString()
    self.serverSettings:getServerOptions():getOptionByName("WorkshopItems"):setValue(workshopIDsString)

    self.serverSettings:saveFiles()
end

function ServerModSelector:onButtonClick(button)
    if button.internal == "ABOUT" then
        self.aboutUI = ModManagerAboutUI:new(ModManager.SERVER_ID)
        self.aboutUI:initialise()
        self.aboutUI:addToUIManager()
    end
end

function ServerModSelector:showChangelog()
    if ModManager.instance:isNewVersion(ModManager.SERVER_ID) then
        local panel = ModManagerChangelogUI:new(ModManager.SERVER_ID)
        panel:initialise()
        panel:addToUIManager()
        panel:setAlwaysOnTop(true)
        panel:setCapture(true)
    end
end

function ServerModSelector.getTooltipText(name)
    local tooltip = getTextOrNull(name)
    if tooltip then
        tooltip = tooltip:gsub("\\n", "\n")
        tooltip = tooltip:gsub("\\\"", "\"")
    end
    return tooltip
end

function ServerModSelector.onKeyPressed(key)
    local target = ServerModSelector.instance
    if target == nil or not target:isVisible() then return end

    local listBox = target.listBox
    if listBox == nil or listBox.keyboardFocus ~= true then return end

    if key == Keyboard.KEY_ESCAPE then
        if target.aboutUI and target.aboutUI:isVisible() then
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
        if not listBox:isEmpty() and listBox.enable then
            local item = listBox:getSelectedItem()
            if item.isAvailable then
                if item.isActive then
                    target:doInactiveRequest(item.modID)
                else
                    target:doActiveRequest(item.modID)
                end
                listBox:ensureVisible(listBox.selected)
            end
        end
    end
end

-- ******************************
-- ServerChoiceListBox
-- ******************************

function ServerChoiceListBox:new(x, y, width, height)
    local o = MMListBox:new(x, y, width, height)
    setmetatable(o, self)
    self.__index = self
    o.indexById = {} -- { modID1 = index, ... }
    o.keyboardFocus = false

    o.btn = {}
    o.btn.text1 = getText("UI_ModManager_List_Add")
    o.btn.text2 = getText("UI_ModManager_List_Remove")
    local w1 = getTextManager():MeasureStringX(UIFont.Small, o.btn.text1)
    local w2 = getTextManager():MeasureStringX(UIFont.Small, o.btn.text2)
    o.btn.w = math.max(math.max(w1, w2), 70) + DX * 2
    o.btn.x = o.width - o.btn.w - DX
    o.btn.dy = (o.itemheight - BUTTON_HGT) / 2
    --[[
    o.items[index].item.name
    o.items[index].item.modID
    o.items[index].item.workshopID
    o.items[index].item.modInfo
    o.items[index].item.modInfoExtra = {}
    o.items[index].item.isAvailable = bool
    o.items[index].item.isActive = bool
    o.items[index].item.isFavorite = bool
    o.items[index].item.isHidden = bool
    o.items[index].item.dependents = {}
    o.items[index].item.indexAdded = number -- index, sorted by date added
    ]]
    return o
end

function ServerChoiceListBox:clear()
    MMListBox.clear(self)
    self.indexById = {}
end

function ServerChoiceListBox:reindexById()
    for index, item in ipairs(self.items) do
        self.indexById[item.item.modID] = index
    end
end

function ServerChoiceListBox:getItemByModID(modID)
    local index = self.indexById[modID]
    if index then
        return self.items[index].item
    end
    return nil
end

function ServerChoiceListBox:doDrawItem(y, i, alt)
    local index, item = i.index, i.item
    if item.visibleIndex == nil then return y end

    local h, sW = self.itemheight, self:isVScrollBarVisible() and 13 or 0

    -- Check real line visibility
    local localY = self:getYScroll() + y
    if sW ~= 0 and (localY < -h or localY > self:getHeight()) then
        return y + h - 1
    end

    -- Item bar
    if self.selected == index then
        self:drawRect(0, y, self:getWidth(), h, 0.3, 0.7, 0.35, 0.15)
    elseif self.mouseOverSelected == index and not self:isMouseOverScrollBar() then
        self:drawRect(0, y, self:getWidth(), h, 0.95, 0.05, 0.05, 0.05)
    end
    self:drawRectBorder(0, y, self:getWidth(), h, 0.5, self.borderColor.r, self.borderColor.g, self.borderColor.b)

    -- Tooltip
    local workshopID = item.modInfo:getWorkshopID() or getText("UI_ModManager_NotAvailable")
    local tooltip = getText("UI_ModManager_Info_WorkshopID", workshopID) .. " <LINE> "
    tooltip = tooltip .. getText("UI_ModManager_Info_ModID", item.modInfo:getId())

    -- Icon, title
    local icon = item.modInfoExtra.maps and ICON_MAP or ICON_DEFAULT
    local name = item.modInfo:getName()
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
        for _, dependentID in ipairs(item.dependents or {}) do
            if self.items[self.indexById[dependentID]].item.isActive then
                table.insert(dependents, dependentID)
            end
        end
        if #dependents > 0 then
            g, b = 0.7, 0.2
            tooltip = tooltip .. " <LINE> <LINE> " .. getText("UI_ModManager_List_Tooltip_EnabledBy")
            for _, dependentID in ipairs(dependents) do
                tooltip = tooltip .. " <LINE> <INDENT:20> " .. getModInfoByID(dependentID):getName()
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
    self:drawText(name, DX + FONT_HGT_MEDIUM + DX, y + DY, r, g, b, 1, UIFont.Medium)

    if item.needsUpdate then
        self:drawTextureScaled(ICON_UPDATE,
                self.width - (FONT_HGT_SMALL + DX) * 2 - sW, y + h / 2 - FONT_HGT_SMALL / 2,
                FONT_HGT_SMALL, FONT_HGT_SMALL, 1)
    end

    local iconLocation = item.modInfo:getWorkshopID() and ICON_LOC_STEAM
    if not iconLocation then
        iconLocation = item.modInfo:getDir():find(string.gsub("Zomboid/Workshop", "/", getFileSeparator())) and ICON_LOC_Z_WORK or ICON_LOC_Z_MODS
    end
    self:drawTextureScaled(iconLocation,
            self.width - FONT_HGT_SMALL - DX - sW, y + h / 2 - FONT_HGT_SMALL / 2,
            FONT_HGT_SMALL, FONT_HGT_SMALL, 1)

    -- Button
    if self.mouseOverSelected == index and not self:isMouseOverScrollBar() then
        if item.isAvailable then
            if item.isActive then
                self:doDrawButton(self.btn.text2, "OFF", self.btn.x - sW, y + self.btn.dy, self.btn.w, BUTTON_HGT)
            else
                self:doDrawButton(self.btn.text1, "ON", self.btn.x - sW, y + self.btn.dy, self.btn.w, BUTTON_HGT)
            end
        end
    end

    y = y + h - 1
    return y
end

function ServerChoiceListBox:onButtonClick(_, item)
    if item.isAvailable then
        if item.isActive then
            self.parent:doInactiveRequest(item.modID)
        else
            self.parent:doActiveRequest(item.modID)
        end
    end
end

function ServerChoiceListBox:onItemDoubleClick(item)
    self:onButtonClick(nil, item)
end

function ServerChoiceListBox:doActive(modID)
    local index = self.indexById[modID]
    if index then
        local item = self.items[index].item
        if not item.isActive then
            item.isActive = true

            local requires = item.modInfo:getRequire()
            if requires and not requires:isEmpty() then
                for i = 0, requires:size() - 1 do
                    self.parent:doActiveModID(requires:get(i))
                end
            end

            self.parent.counters.enabled = self.parent.counters.enabled + 1
        end
    end
end

function ServerChoiceListBox:doInactive(modID)
    local index = self.indexById[modID]
    if index then
        local item = self.items[index].item
        if item.isActive then
            item.isActive = false

            self.parent.workshopListBox:doInactive(item.workshopID)

            for _, dependentID in ipairs(item.dependents or {}) do
                self.parent:doInactiveModID(dependentID)
            end

            self.parent.counters.enabled = self.parent.counters.enabled - 1
        end
    end
end

function ServerChoiceListBox:checkFilter(item)
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
    if not filter.updateTickBox.selected[1] and not item.needsUpdate then return false end
    if not filter.updateTickBox.selected[2] and item.needsUpdate then return false end
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

function ServerChoiceListBox:updateFilter()
    -- Sort and re-index
    self:sort(self.parent.filterPanel:getOrderFunc())
    self:reindexById()

    MMListBox.updateFilter(self)
end

-- ******************************
-- ServerWorkshopListBox
-- ******************************

function ServerWorkshopListBox:new(x, y, width, height)
    local o = MMListBox:new(x, y, width, height)
    setmetatable(o, self)
    self.__index = self
    o.itemheight = math.max(FONT_HGT_MEDIUM + DY * 2, BUTTON_HGT)
    o.indexById = {} -- { workshopID = index, ... }
    o.itemMods = {} -- { workshopID1 = { modID1 = true, modID2 = true, ... }, ... }

    o.btn = {}
    o.btn.text = getText("UI_ModManager_List_Remove")
    local w = getTextManager():MeasureStringX(UIFont.Small, o.btn.text)
    o.btn.w = w + DX * 2
    o.btn.x = o.width - o.btn.w - DX
    o.btn.dy = (o.itemheight - BUTTON_HGT) / 2
    --[[
    o.items[index].item.workshopID
    ]]
    return o
end

function ServerWorkshopListBox:clear()
    MMListBox.clear(self)
    self.indexById = {}
    self.itemMods = {}
end

function ServerWorkshopListBox:reindexById()
    self.indexById = {}
    for index, item in ipairs(self.items) do
        self.indexById[item.item.workshopID] = index
    end
end

function ServerWorkshopListBox:doDrawItem(y, i, _)
    local index, item = i.index, i.item

    local h, sW = self.itemheight, self:isVScrollBarVisible() and 13 or 0

    -- Check real line visibility
    local localY = self:getYScroll() + y
    if sW ~= 0 and (localY < -h or localY > self:getHeight()) then
        return y + h - 1
    end

    -- Item bar
    if self.selected == index then
        self:drawRect(0, y, self:getWidth(), h, 0.3, 0.7, 0.35, 0.15)
    elseif self.mouseOverSelected == index and not self:isMouseOverScrollBar() then
        self:drawRect(0, y, self:getWidth(), h, 0.95, 0.05, 0.05, 0.05)
    end
    self:drawRectBorder(0, y, self:getWidth(), h, 0.5, self.borderColor.r, self.borderColor.g, self.borderColor.b)

    -- Title
    local tooltip
    local r, g, b = 1, 1, 1

    local itemDetails = self.parent.workshopItemDetails[item.workshopID]
    if itemDetails then
        tooltip = itemDetails:getTitle() .. " <LINE> "
        local state = itemDetails:getState()
        if state == "NotSubscribed" or state == "Error" then
            r, g, b = 0.9, 0.4, 0.4
            tooltip = tooltip .. " <RED> " .. getText("UI_ModManager_WorkshopItemState_" .. state) .. " <LINE> <RGB:1,1,1> "
        end
    else
        r, g, b = 0.7, 0.7, 0.7
        tooltip = getText("UI_ModManager_WorkshopItemState_NotInstalled")
    end

    -- Enabled mods of this workshop item
    local needsTitle = true
    for modID, _ in pairs(self.itemMods[item.workshopID]) do
        if needsTitle then
            needsTitle = false
            if not tooltip then tooltip = "" end
            tooltip = tooltip .. getText("UI_ModManager_Info_ModID", " <LINE> <INDENT:20> ")
        end
        tooltip = tooltip .. modID .. " <LINE> "
    end

    self.items[index].tooltip = tooltip
    self:drawText(i.text, DX, y + DY, r, g, b, 1, UIFont.Medium)

    -- Button
    if self.mouseOverSelected == index and not self:isMouseOverScrollBar() then
        self:doDrawButton(self.btn.text, "REMOVE", self.btn.x - sW, y + self.btn.dy, self.btn.w, BUTTON_HGT)
    end

    y = y + h - 1
    return y
end

function ServerWorkshopListBox:onButtonClick(_, item)
    self:doInactive(item.workshopID, true)
    self.parent.listBox:updateFilter()
end

function ServerChoiceListBox:onItemDoubleClick(item)
    self:onButtonClick(nil, item)
end

function ServerWorkshopListBox:doActive(workshopID)
    if not self.indexById[workshopID] then
        local data = {}
        data.workshopID = workshopID

        self:addItem(workshopID, data)
        self.indexById[workshopID] = #self.items

        self.itemMods[workshopID] = {}
    end
end

function ServerWorkshopListBox:doInactive(workshopID, forceInactive)
    local mods = self.itemMods[workshopID] or {}
    local canDoInactive = true
    for modID, _ in pairs(mods) do
        local indexInMods = self.parent.modsListBox.indexById[modID]
        if indexInMods then
            if forceInactive then
                self.parent.modsListBox:doInactive(modID)
            else
                canDoInactive = false
            end
        end
    end

    if canDoInactive then
        self:removeItem(workshopID)
        self:reindexById()

        self.itemMods[workshopID] = nil
    end
end

function ServerWorkshopListBox:workshopIDsToString()
    local s = ""
    for _, item in ipairs(self.items) do
        if s ~= "" then
            s = s .. ";"
        end
        s = s .. item.item.workshopID
    end
    return s
end

-- ******************************
-- ServerModsListBox
-- ******************************

function ServerModsListBox:new(x, y, width, height)
    local o = MMListBox:new(x, y, width, height)
    setmetatable(o, self)
    self.__index = self
    o.itemheight = math.max(FONT_HGT_MEDIUM + DY * 2, BUTTON_HGT)
    o.indexById = {} -- { modID = index, ... }

    o.btn = {}
    o.btn.text = getText("UI_ModManager_List_Remove")
    local w = getTextManager():MeasureStringX(UIFont.Small, o.btn.text)
    o.btn.w = w + DX * 2
    o.btn.x = o.width - o.btn.w - DX
    o.btn.dy = (o.itemheight - BUTTON_HGT) / 2
    --[[
    o.items[index].item.modID
    o.items[index].item.modInfo     -- may be nil
    o.items[index].item.name        -- may be nil
    o.items[index].item.workshopID  -- may be nil
    ]]
    return o
end

function ServerModsListBox:clear()
    MMListBox.clear(self)
    self.indexById = {}
end

function ServerModsListBox:reindexById()
    self.indexById = {}
    for index, item in ipairs(self.items) do
        self.indexById[item.item.modID] = index
    end
end

function ServerModsListBox:doDrawItem(y, i, _)
    local index, item = i.index, i.item

    local h, sW = self.itemheight, self:isVScrollBarVisible() and 13 or 0

    -- Check real line visibility
    local localY = self:getYScroll() + y
    if sW ~= 0 and (localY < -h or localY > self:getHeight()) then
        return y + h - 1
    end

    -- Item bar
    if self.selected == index then
        self:drawRect(0, y, self:getWidth(), h, 0.3, 0.7, 0.35, 0.15)
    elseif self.mouseOverSelected == index and not self:isMouseOverScrollBar() then
        self:drawRect(0, y, self:getWidth(), h, 0.95, 0.05, 0.05, 0.05)
    end
    self:drawRectBorder(0, y, self:getWidth(), h, 0.5, self.borderColor.r, self.borderColor.g, self.borderColor.b)

    -- Title
    local tooltip
    local r, g, b = 1, 1, 1

    -- Not installed
    if not self.parent.clientModIDs[item.modID] then
        --r, g, b = 0.7, 0.7, 0.7
        r, g, b = 0.9, 0.4, 0.4
        tooltip = " <RED> " .. getText("UI_ModManager_WorkshopItemState_NotInstalled")
    else
        tooltip = item.name .. " <LINE> "
        local workshopID = item.modInfo:getWorkshopID() or getText("UI_ModManager_NotAvailable")
        tooltip = tooltip .. getText("UI_ModManager_Info_WorkshopID", workshopID)
    end

    self.items[index].tooltip = tooltip
    self:drawText(i.text, DX, y + DY, r, g, b, 1, UIFont.Medium)

    -- Button
    if self.mouseOverSelected == index and not self:isMouseOverScrollBar() then
        self:doDrawButton(self.btn.text, "REMOVE", self.btn.x - sW, y + self.btn.dy, self.btn.w, BUTTON_HGT)
    end

    y = y + h - 1
    return y
end

function ServerModsListBox:onButtonClick(_, item)
    self.parent:doInactiveRequest(item.modID)
end

function ServerModsListBox:onItemDoubleClick(item)
    self:onButtonClick(nil, item)
end

function ServerModsListBox:doActive(modID)
    if not self.indexById[modID] then
        local data = {}
        data.modID = modID

        local choiceItem = self.parent.listBox:getItemByModID(modID)
        data.modInfo = choiceItem and choiceItem.modInfo or getModInfoByID(modID)
        if data.modInfo then
            data.name = data.modInfo:getName()
            data.workshopID = data.modInfo:getWorkshopID()
        end

        self:addItem(modID, data)
        self.indexById[modID] = #self.items

        if data.workshopID then
            self.parent.workshopListBox:doActive(data.workshopID)
            self.parent.workshopListBox.itemMods[data.workshopID][modID] = true
        end
    end
end

function ServerModsListBox:doInactive(modID)
    local index = self.indexById[modID]
    if index then
        self:removeItem(modID)
        self:reindexById()

        self.parent:doInactiveModID(modID)
    end
end

function ServerModsListBox:modIDsToString()
    local s = ""
    for _, item in ipairs(self.items) do
        if s ~= "" then
            s = s .. ";"
        end
        s = s .. item.item.modID
    end
    return s
end

-- ******************************
-- ServerPanelPresets
-- ******************************

function ServerPanelPresets:new(x, y, width, height)
    local o = MMPanelPresets:new(x, y, width, height)
    setmetatable(o, self)
    self.__index = self
    o.validateNameText = getText("UI_ModManager_Presets_Save_Warning", ModManager.getServerPresetNameIllegalCharsString())
    o.validateNameFunc = ModManager.isValidServerPresetName
    return o
end

function ServerPanelPresets:updateOptions()
    self.presetsComboBox:clear()
    self.presetsComboBox:addOptionWithData(getText("UI_ModManager_Presets_List_DisableAll"), "clearAll")
    self.presetsComboBox:addOptionWithData(getText("UI_ModManager_Presets_List_DisableAllExceptFavs"), "clear")
    self.presetsComboBox:addOptionWithData(getText("UI_ModManager_Presets_List_EnableAll"), "enableAll")
    self.presetsComboBox:addOptionWithData(getText("UI_ModManager_Presets_List_EnableAllExceptHidden"), "enable")
    for name, _ in pairs(self.parent.manager.serverPresets) do
        self.presetsComboBox:addOptionWithData(name, "user")
    end
    self.presetsComboBox.selected = 0
    self.delButton:setEnable(false)
end

function ServerPanelPresets:onSelectedAux(name, data)
    if data == "clearAll" then
        for _, item in ipairs(self.parent.listBox.items) do
            if item.item.isActive then
                self.parent:doInactiveModID(item.item.modID)
            end
        end
        self:updateOptions()
    elseif data == "clear" then
        for _, item in ipairs(self.parent.listBox.items) do
            if not item.item.isFavorite then
                self.parent:doInactiveModID(item.item.modID)
            end
        end
        self:updateOptions()
    elseif data == "enableAll" then
        for _, item in ipairs(self.parent.listBox.items) do
            self.parent:doActiveModID(item.item.modID)
        end
        self:updateOptions()
    elseif data == "enable" then
        for _, item in ipairs(self.parent.listBox.items) do
            if not item.item.isHidden then
                self.parent:doActiveModID(item.item.modID)
            end
        end
        self:updateOptions()
    elseif data == "user" then
        self.parent.counters.enabled = 0
        for _, item in ipairs(self.parent.listBox.items) do
            item.item.isActive = false
        end

        self.parent.workshopListBox:clear()
        self.parent.modsListBox:clear()

        local preset = self.parent.manager.serverPresets[name]
        for _, workshopID in pairs(preset.WorkshopItems) do
            self.parent.workshopListBox:doActive(workshopID)
        end
        for _, modID in pairs(preset.Mods) do
            self.parent:doActiveModID(modID)
        end
    end
    self.parent.listBox:updateFilter()
end

function ServerPanelPresets:onSavePresetAux(name)
    self.parent.manager.serverPresets[name] = {
        WorkshopItems = {}, Mods = {}
    }

    for _, i in ipairs(self.parent.workshopListBox.items) do
        table.insert(self.parent.manager.serverPresets[name].WorkshopItems, i.item.workshopID)
    end
    for _, i in ipairs(self.parent.modsListBox.items) do
        table.insert(self.parent.manager.serverPresets[name].Mods, i.item.modID)
    end

    self.parent.manager:saveServerPresets()
end

function ServerPanelPresets:onDeletePresetAux(name)
    self.parent.manager.serverPresets[name] = nil
    self.parent.manager:saveServerPresets()
end

-- ******************************
-- ServerPanelConfigs
-- ******************************

function ServerPanelConfigs:new(x, y, width, height)
    local o = ISPanelJoypad:new(x, y, width, height)
    setmetatable(o, self)
    self.__index = self
    o.background = false
    return o
end

function ServerPanelConfigs:createChildren()
    local configsLabel = ISLabel:new(DX, 0, BUTTON_HGT, getText("UI_ModManager_Server_Configs_Label"), 1, 1, 1, 1, UIFont.Small, true)
    self:addChild(configsLabel)

    self.configsComboBox = ISComboBox:new(configsLabel:getRight() + DX, 0, BUTTON_WDH * 2, BUTTON_HGT, self, self.onSelected)
    self.configsComboBox.openUpwards = true
    self.configsComboBox.noSelectionText = getText("UI_ModManager_Presets_NoSelection")
    self.configsComboBox.borderColor = { r = 0.4, g = 0.4, b = 0.4, a = 1 }
    self:addChild(self.configsComboBox)
end

function ServerPanelConfigs:updateOptions()
    self.configsComboBox:clear()
    getServerSettingsManager():readAllSettings()
    for i = 1, getServerSettingsManager():getSettingsCount() do
        local settings = getServerSettingsManager():getSettingsByIndex(i - 1)
        self.configsComboBox:addOptionWithData(settings:getName(), settings)
    end
    self.configsComboBox.selected = 0
end

function ServerPanelConfigs:onSelected()
    local selectedItem = self.configsComboBox.options[self.configsComboBox.selected]
    local name, data = selectedItem.text, selectedItem.data

    self.parent:setServerSettings(data)

    self.parent:setChildrenEnable(true)
end

Events.OnKeyPressed.Add(ServerModSelector.onKeyPressed)