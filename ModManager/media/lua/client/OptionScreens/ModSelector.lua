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
--- This mod is based on NRK Mod Selector by Narrnika and uploaded with his permission.
--- Original mod: https://steamcommunity.com/sharedfiles/filedetails/?id=2155197983
---

require('luautils')

local FILE_SETTINGS = "modmanager.ini"
local FILE_CUSTOM_TAGS = "saved_modtags.txt"
local FILE_MOD_LIST = "saved_modlist.txt"

local VERSION_SETTINGS = 1

local LIST_FAVORITES = "modmanager-favorites"
local LIST_HIDDEN = "modmanager-hidden"

local ICON_DEFAULT = getTexture("media/ui/ModManager_IconDefault.png")
local ICON_DEFAULT_GREY = getTexture("media/ui/ModManager_IconDefaultGrey.png")
local ICON_MAP = getTexture("media/ui/ModManager_IconMap.png")
local ICON_MAP_GREY = getTexture("media/ui/ModManager_IconMapGrey.png")
local ICON_ACTIVE = getTexture("media/ui/ModManager_StatusEnabled.png")
local ICON_REQUIRE = getTexture("media/ui/ModManager_StatusEnabledBy.png")
local ICON_BROKEN = getTexture("media/ui/icon_broken.png")
local ICON_FAVORITE = getTexture("media/ui/FavoriteStar.png")
local ICON_MINUS = getTexture("media/ui/Moodle_internal_minus_red.png")
local ICON_PLUS = getTexture("media/ui/Moodle_internal_plus_green.png")
local ICON_STEAM = getTexture("media/ui/ModManager_LocationSteam.png")
local ICON_FOLDER = getTexture("media/ui/ModManager_LocationMods.png")
local ICON_FOLDER_W = getTexture("media/ui/ModManager_LocationWorkshop.png")

local FONT_HGT_TITLE = getTextManager():getFontHeight(UIFont.Title)
local FONT_HGT_SMALL = getTextManager():getFontHeight(UIFont.Small)
local FONT_HGT_MEDIUM = getTextManager():getFontHeight(UIFont.Medium)

local BUTTON_HGT = math.max(25, FONT_HGT_SMALL + 3 * 2)
local BUTTON_WDH = 100
local BUTTON_SQ = math.min(48, FONT_HGT_SMALL * 2 + 8)
local BUTTON_SQ_IMG = BUTTON_SQ - 8
local DX, DY = 8, 8

-- **********************************************
-- ModSelector
-- **********************************************

ModSelector = ISPanelJoypad:derive("ModSelector")

function ModSelector:new(x, y, width, height)
    local o = ISPanelJoypad:new(x, y, width, height)
    ModSelector.instance = o
    setmetatable(o, self)
    self.__index = self
    o.backgroundColor = { r = 0, g = 0, b = 0, a = 0.8 }
    o.borderColor = { r = 1, g = 1, b = 1, a = 0.2 }
    o.anchorLeft = true
    o.anchorRight = false
    o.anchorTop = true
    o.anchorBottom = false
    o.selected = 1

    o.mapGroups = MapGroups.new()
    o.mapConflicts = false
    o.ignoreMapConflicts = false

    o.customTags = {} -- {modId = {tag, tag, tag, ...}, modId = {tag, tag, tag, ...}, ...}
    o.counters = {} -- see ModSelector:populateListBox()
    --o.settings = {} -- see ModSelector:loadSettings()
    --o.isNewGame = false/true -- when called from MainScreen.lua/NewGameScreen.lua
    --o.loadGameFolder = folder -- when called from LoadGameScreen.lua
    return o
end

function ModSelector:create()
    self:loadSettings()

    local halfW = (self.width - 3 * DX) / 2
    local halfH = (self.height - (FONT_HGT_TITLE + DY * 2 + BUTTON_HGT + DY * 2 + DY)) / 2

    self.titleLabel = ISLabel:new(0, DY, FONT_HGT_TITLE, getText("UI_ModManager_Title"), 1, 1, 1, 1, UIFont.Title, true)
    self.titleLabel:setX((self.width - self.titleLabel:getWidth()) / 2)
    self:addChild(self.titleLabel)

    self.filterPanel = ModPanelFilter:new(DX, FONT_HGT_TITLE + DY * 2, halfW, BUTTON_HGT * 3 + DY * 4)
    self:addChild(self.filterPanel)

    self.listBox = ModListBox:new(DX, self.filterPanel:getBottom() + DY, halfW, halfH + halfH - self.filterPanel:getHeight())
    self:addChild(self.listBox)

    self.infoPanel = ModPanelInfo:new(halfW + DX * 2, FONT_HGT_TITLE + DY * 2, halfW, halfH + halfH + DY)
    self:addChild(self.infoPanel)
    self.infoPanel:addScrollBars()
    self.infoPanel:setScrollChildren(true)
    self.infoPanel:initialise()

    self.backButton = ISButton:new(
            DX, self.height - (DY + BUTTON_HGT), BUTTON_WDH, BUTTON_HGT,
            getText("UI_btn_back"), self, ModSelector.onBack
    )
    self.backButton:setAnchorTop(false)
    self.backButton:setAnchorBottom(true)
    self.backButton:setWidthToTitle(BUTTON_WDH)
    self.backButton.borderColor = { r = 1, g = 1, b = 1, a = 0.1 }
    self:addChild(self.backButton)

    self.acceptButton = ISButton:new(
            self.width - (DX + BUTTON_WDH), self.height - (DY + BUTTON_HGT), BUTTON_WDH, BUTTON_HGT,
            getText("UI_btn_accept"), self, ModSelector.onAccept
    )
    self.acceptButton:setAnchorLeft(false)
    self.acceptButton:setAnchorRight(true)
    self.acceptButton:setAnchorTop(false)
    self.acceptButton:setAnchorBottom(true)
    self.acceptButton:setWidthToTitle(BUTTON_WDH)
    self.acceptButton:setX(self.width - (DX + self.acceptButton:getWidth()))
    self.acceptButton.borderColor = { r = 1, g = 1, b = 1, a = 0.1 }
    self:addChild(self.acceptButton)

    self.modOrderButton = ISButton:new(
            self.width - (DX + BUTTON_WDH), self.height - (DY + BUTTON_HGT), BUTTON_WDH, BUTTON_HGT,
            getText("UI_mods_ModsOrder"), self, ModSelector.onModOrder
    )
    self.modOrderButton:setAnchorLeft(false)
    self.modOrderButton:setAnchorRight(true)
    self.modOrderButton:setAnchorTop(false)
    self.modOrderButton:setAnchorBottom(true)
    self.modOrderButton:setWidthToTitle(BUTTON_WDH)
    self.modOrderButton:setX(self.acceptButton:getX() - (DX + self.modOrderButton:getWidth()))
    self.modOrderButton.borderColor = { r = 1, g = 1, b = 1, a = 0.1 }
    self:addChild(self.modOrderButton)

    self.getModButton = ISButton:new(
            self.width - (DX + BUTTON_WDH) * 2, self.height - (DY + BUTTON_HGT), BUTTON_WDH, BUTTON_HGT,
            getText("UI_mods_GetModsHere"), self, ModSelector.onGetMods
    )
    self.getModButton:setAnchorLeft(false)
    self.getModButton:setAnchorRight(true)
    self.getModButton:setAnchorTop(false)
    self.getModButton:setAnchorBottom(true)
    self.getModButton:setWidthToTitle(BUTTON_WDH)
    self.getModButton:setX(self.modOrderButton:getX() - (DX + self.getModButton:getWidth()))
    self.getModButton.borderColor = { r = 1, g = 1, b = 1, a = 0.1 }
    local tooltip_text = getText("UI_mods_Explanation") .. Core.getMyDocumentFolder() .. getFileSeparator() .. "mods" .. getFileSeparator()
    if not getSteamModeActive() then tooltip_text = getText("UI_mods_WorkshopRequiresSteam") .. "\n" .. tooltip_text end
    self.getModButton.tooltip = tooltip_text
    self:addChild(self.getModButton)

    self.presetsPanel = ModPanelPresets:new(
            self.backButton:getRight() + DX, self.height - (DY + BUTTON_HGT),
            self.getModButton:getX() - (self.backButton:getRight() + DX * 2), BUTTON_HGT
    )
    self.presetsPanel:setAnchorTop(false)
    self.presetsPanel:setAnchorBottom(true)
    self:addChild(self.presetsPanel)
end

function ModSelector:onResolutionChange(oldW, oldH, newW, newH)
    local halfW = (self.width - 3 * DX) / 2
    local halfH = (self.height - (FONT_HGT_TITLE + DY * 2 + BUTTON_HGT + DY * 2 + DY)) / 2

    self.titleLabel:setX((self.width - self.titleLabel:getWidth()) / 2)

    self.filterPanel:setWidth(halfW)
    self.filterPanel.filter:setWidth(halfW - BUTTON_WDH - 3 * DX)
    self.filterPanel.order:setWidth(halfW - BUTTON_WDH - 3 * DX)
    self.filterPanel.saveButton:setX(self.filterPanel.filter:getRight() + DX)
    self.filterPanel.resetButton:setX(self.filterPanel.order:getRight() + DX)

    self.filterPanel.search:setWidth(halfW - 2 * DX)
    self.filterPanel.search:recalcChildren()
    self.filterPanel.searchEntryBox:setHeight(self.filterPanel.search.height - 6)

    self.listBox:setWidth(halfW)
    self.listBox.btn.x1 = halfW - self.listBox.btn.w1 - DX
    self.listBox.btn.x2 = self.listBox.btn.x1 + self.listBox.btn.w3 + DX
    self.listBox.btn.x3 = self.listBox.btn.x2 + self.listBox.btn.w3 + DX
    self.listBox:setHeight(halfH + halfH - self.filterPanel:getHeight())

    self.infoPanel:setX(halfW + DX * 2)
    self.infoPanel:setWidth(halfW)
    self.infoPanel:setY(FONT_HGT_TITLE + DY * 2)
    self.infoPanel:setHeight(halfH + halfH + DY)
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

    self.presetsPanel:setWidth(self.getModButton:getX() - (self.backButton:getRight() + DX * 2))
end

function ModSelector:prerender()
    self.modOrderButton.enable = self.mapConflicts
    if self.modOrderUI and self.modOrderUI:isReallyVisible() then
        self.modOrderButton.blinkBG = false
        self.modOrderButton.tooltip = nil
    else
        self.modOrderButton.blinkBG = self.mapConflicts
        self.modOrderButton.tooltip = self.mapConflicts and getText("UI_mods_ConflictDetected") or nil
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
        -- To avoid errors if the mod has already been removed
        if modInfo then
            local modId = modInfo:getId()
            if not self.listBox.indexById[modId] then
                self.listBox:addItem(modInfo:getName(), { modInfo = modInfo, storedIndex = ModTracker.indexOf(modId) })
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
        translate = 0,
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
    for _, modId in ipairs(self.presetsPanel.saveList[LIST_FAVORITES] or {}) do
        favorList[modId] = true
    end
    local hiddenList = {}
    for _, modId in ipairs(self.presetsPanel.saveList[LIST_HIDDEN] or {}) do
        hiddenList[modId] = true
    end

    local activeMods = (self.loadGameFolder or self.isNewGame) and ActiveMods.getById("currentGame") or ActiveMods.getById("default")
    for _, i in ipairs(self.listBox.items) do
        local item, modId, dir = i.item, i.item.modInfo:getId(), i.item.modInfo:getDir()

        if item.modInfo:getWorkshopID() then self.counters.workshop = self.counters.workshop + 1 end

        item.modInfoExtra = self:readInfoExtra(modId)
        if item.modInfoExtra.maps then self.counters.map = self.counters.map + 1 end

        local lang = Translator.getLanguage():name()
        item.modInfoExtra.translate = fileExists(dir .. string.gsub("/media/lua/shared/Translate/" .. lang, "/", getFileSeparator()))
        if item.modInfoExtra.translate then self.counters.translate = self.counters.translate + 1 end

        if item.isAvailable == nil then item.isAvailable = self:checkRequire(modId) and item.modInfo:isAvailable() end
        if item.isAvailable then
            self.counters.available = self.counters.available + 1
            --else
            --    -- Remove broken mods from favorites?
            --    favorList[modId] = false
        end

        item.isActive = activeMods:isModActive(modId)
        if oldItems[modId] and item.isAvailable then item.isActive = oldItems[modId].isActive end
        if item.isActive then self.counters.enabled = self.counters.enabled + 1 end

        item.isFavorite = favorList[modId] or false
        if oldItems[modId] then item.isFavorite = oldItems[modId].isFavorite end
        if item.isFavorite then self.counters.favorites = self.counters.favorites + 1 end

        item.isHidden = hiddenList[modId] or false
        if oldItems[modId] then item.isHidden = oldItems[modId].isHidden end
        if item.isHidden then self.counters.hidden = self.counters.hidden + 1 end

        for _, tag in ipairs(item.modInfoExtra.tags or {}) do
            self.counters.originalTags[tag] = (self.counters.originalTags[tag] or 0) + 1
        end
        for _, author in ipairs(item.modInfoExtra.authors or {}) do
            self.counters.authors[author] = (self.counters.authors[author] or 0) + 1
        end
    end

    -- Read custom tags
    self.customTags = {}
    local file = getFileReader(FILE_CUSTOM_TAGS, true)
    local line = file:readLine()
    while line ~= nil do
        -- Split modId and tags (by first ":", no luautils.split)
        local sep = string.find(line, ":")
        local modId, tags = "", ""
        if sep ~= nil then
            modId = string.sub(line, 0, sep - 1)
            tags = string.sub(line, sep + 1)
        end

        if modId ~= "" and tags ~= "" then
            self.customTags[modId] = luautils.split(tags, ",")
            for _, tag in ipairs(self.customTags[modId]) do
                self.counters.customTags[tag] = (self.counters.customTags[tag] or 0) + 1
            end
        end

        line = file:readLine()
    end
    file:close()

    self.listBox:updateFilter()
    self.listBox.keyboardFocus = true

    -- Check for map conflicts
    self.mapGroups:createGroups(self:getActiveMods(), false)
    self.mapConflicts = self.mapGroups:checkMapConflicts()
end

function ModSelector:checkRequire(modId)
    local requires = getModInfoByID(modId):getRequire()
    if requires and not requires:isEmpty() then
        for i = 0, requires:size() - 1 do
            local requireId = requires:get(i)
            local index = self.listBox.indexById[requireId]
            if index == nil then
                return false
            else
                local requireItem = self.listBox.items[index].item
                if type(requireItem.dependents) == "table" then
                    table.insert(requireItem.dependents, modId)
                else
                    requireItem.dependents = { modId }
                end
                if requireItem.isAvailable == nil then
                    requireItem.isAvailable = self:checkRequire(requireId)
                end
                if requireItem.isAvailable == false then
                    return false
                end
            end
        end
    end
    return true
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

function ModSelector:checkConflictsOnAccept()
    local activeMods = self:getActiveMods()
    -- Remove mod IDs for missing mods from ActiveMods.mods
    activeMods:checkMissingMods()
    -- Remove unused map directories from ActiveMods.mapOrder
    activeMods:checkMissingMaps()

    -- Check map conflicts
    self.mapGroups:createGroups(self:getActiveMods(), false)
    self.mapConflicts = self.mapGroups:checkMapConflicts()

    if self.mapConflicts and not self.ignoreMapConflicts then
        self:showModOrderUI(true)
        return true
    end
    return false
end

function ModSelector:showModOrderUI(fromOnAccept)
    self:setVisible(false)

    self.modOrderUI = ModOrderUI:new(0, 0, 700, 400)
    self.modOrderUI:initialise()
    local onSaveButton = function(target, button)
        ModOrderUI.onClick(target, button)
        if target.fromOnAccept then
            ModSelector.instance.ignoreMapConflicts = true
            ModSelector.instance:onAccept()
        end
    end
    self.modOrderUI.save.onclick = onSaveButton
    self.modOrderUI.fromOnAccept = fromOnAccept
    self.modOrderUI:addToUIManager()
end

-- **********************************************
-- ModSelector: buttons callbacks
-- **********************************************

function ModSelector:onAccept()
    self:setVisible(false)

    -- Hidden
    local oldHidden, newHidden = {}, {}
    for _, modId in ipairs(self.presetsPanel.saveList[LIST_HIDDEN] or {}) do
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
    for _, modId in ipairs(self.presetsPanel.saveList[LIST_FAVORITES] or {}) do
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

    if #addFavors + #delFavors + #addHidden + #delHidden > 0 then
        -- At least one list has been changed
        -- Change mods list of saves
        for _, folder in ipairs(getFullSaveDirectoryTable()) do
            local modListChanged = false

            local info = getSaveInfo(folder)
            local activeMods = info.activeMods or ActiveMods.getById("default")
            ActiveMods.getById("currentGame"):copyFrom(activeMods)
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

        -- Change global mod list
        -- Favorites
        for _, modId in ipairs(addFavors) do
            ActiveMods.getById("default"):setModActive(modId, true)
        end
        -- Hidden
        for _, modId in ipairs(addHidden) do
            ActiveMods.getById("default"):setModActive(modId, false)
        end
        saveModsFile()

        -- Save new favorites list
        self.presetsPanel.saveList[LIST_FAVORITES] = {}
        for modId, _ in pairs(newFavors) do
            table.insert(self.presetsPanel.saveList[LIST_FAVORITES], modId)
        end
        table.sort(self.presetsPanel.saveList[LIST_FAVORITES])
        -- Save new hidden list
        self.presetsPanel.saveList[LIST_HIDDEN] = {}
        for modId, _ in pairs(newHidden) do
            table.insert(self.presetsPanel.saveList[LIST_HIDDEN], modId)
        end
        table.sort(self.presetsPanel.saveList[LIST_HIDDEN])
        self.presetsPanel:savePresets()
    end

    -- Accept for LoadGameScreen
    if self.loadGameFolder then
        local saveFolder = self.loadGameFolder
        for _, item in ipairs(self.listBox.items) do
            ActiveMods.getById("currentGame"):setModActive(item.item.modInfo:getId(), item.item.isActive)
        end

        if self:checkConflictsOnAccept() then return end
        self.loadGameFolder = nil

        manipulateSavefile(saveFolder, "WriteModsDotTxt")
        LoadGameScreen.instance:onSavefileModsChanged(saveFolder)
        LoadGameScreen.instance:setVisible(true, self.joyfocus)

        -- Reset filter
        self.filterPanel:resetFilter()
        return
    end

    -- Accept for NewGameScreen
    if self.isNewGame then
        for _, item in ipairs(self.listBox.items) do
            ActiveMods.getById("currentGame"):setModActive(item.item.modInfo:getId(), item.item.isActive)
        end

        if self:checkConflictsOnAccept() then return end
        self.isNewGame = nil

        NewGameScreen.instance:setVisible(true, self.joyfocus)
        if ActiveMods.requiresResetLua(ActiveMods.getById("currentGame")) then
            getCore():ResetLua("currentGame", "NewGameMods")
        else
            -- Reset filter
            self.filterPanel:resetFilter()
        end
        return
    end

    -- Accept for MainScreen
    for _, item in ipairs(self.listBox.items) do
        ActiveMods.getById("default"):setModActive(item.item.modInfo:getId(), item.item.isActive)
    end
    saveModsFile()

    if self:checkConflictsOnAccept() then return end

    -- Setting 'currentGame' to 'default' in case other places forget to set it
    -- before starting a game (DebugScenarios.lua, etc).
    local defaultMods = ActiveMods.getById("default")
    local currentMods = ActiveMods.getById("currentGame")
    currentMods:copyFrom(defaultMods)

    -- Return to MainScreen
    MainScreen.instance.bottomPanel:setVisible(true)
    if self.joyfocus then
        self.joyfocus.focus = MainScreen.instance
        updateJoypadFocus(self.joyfocus)
    end

    --if ActiveMods.requiresResetLua(ActiveMods.getById("default")) then
    getCore():ResetLua("default", "modsChanged")
    --end
end

function ModSelector:onBack()
    self.listBox.keyboardFocus = false
    self:setVisible(false)

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

function ModSelector:onModOrder()
    self:showModOrderUI(false)
end

function ModSelector:onGetMods()
    if getSteamModeActive() then
        if isSteamOverlayEnabled() then
            activateSteamOverlayToWorkshop()
        else
            openUrl("steam://url/SteamWorkshopPage/108600")
        end
    else
        openUrl("http://theindiestone.com/forums/index.php/forum/58-mods/")
    end
end

function ModSelector:loadSettings()
    self.settings = {}
    local version = 0
    local category = ""
    local file = getFileReader(FILE_SETTINGS, true)
    local line = file:readLine()
    while line ~= nil do
        if luautils.stringStarts(line, "VERSION=") then
            version = tonumber(string.split(line, "=")[2])
            --elseif version == VERSION_SETTINGS then
        else
            line = line:trim()
            if line ~= "" then
                local k, v = line:match("^([^=%[]+)=([^=]+)$")
                if k then
                    k = k:trim()
                    if v:trim() == "true" then
                        v = true
                    elseif v:trim() == "false" then
                        v = false
                    end
                    self.settings[category][k] = v
                else
                    local t = line:match("^%[([^%[%]%%]+)%]$")
                    if t then
                        category = t:trim()
                        if not self.settings[category] then
                            self.settings[category] = {}
                        end
                    end
                end
            end
        end
        line = file:readLine()
    end
    file:close()
end

function ModSelector:saveSettings()
    local file = getFileWriter(FILE_SETTINGS, true, false)
    file:write("VERSION=" .. tostring(VERSION_SETTINGS) .. "\r\n")
    file:write("\r\n[filter]\r\n")
    self:writeTickBoxSelection(file, self.filterPanel.locationTickBox)
    self:writeTickBoxSelection(file, self.filterPanel.mapTickBox)
    self:writeTickBoxSelection(file, self.filterPanel.translateTickBox)
    self:writeTickBoxSelection(file, self.filterPanel.availabilityTickBox)
    self:writeTickBoxSelection(file, self.filterPanel.statusTickBox)
    self:writeTickBoxSelection(file, self.filterPanel.favorTickBox)
    file:write("\r\n[order]\r\n")
    self:writeTickBoxSelection(file, self.filterPanel.orderBy)
    self:writeTickBoxSelection(file, self.filterPanel.orderAs)
    file:close()

    self:loadSettings()
end

function ModSelector:writeTickBoxSelection(file, tickBox)
    for index = 1, tickBox.optionCount - 1 do
        file:write(tickBox.optionData[index] .. "=" .. tostring(tickBox.selected[index]) .. "\r\n")
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

-- Called from MainScreen.lua, NewGameScreen.lua, LoadGameScreen.lua
function ModSelector.showNagPanel()
    if getCore():isModsPopupDone() then return end

    getCore():setModsPopupDone(true)
    ModSelector.instance:setVisible(false)

    local width, height = 650, 400
    local nagPanel = ISModsNagPanel:new(
            (getCore():getScreenWidth() - width) / 2,
            (getCore():getScreenHeight() - height) / 2,
            width, height)
    nagPanel:initialise()
    nagPanel:addToUIManager()
    nagPanel:setAlwaysOnTop(true)
    local joypadData = JoypadState.getMainMenuJoypad()
    if joypadData then
        joypadData.focus = nagPanel
        updateJoypadFocus(joypadData)
    end
end

function ModSelector.onKeyPressed(key)
    local target = ModSelector.instance
    if target == nil or not target:getIsVisible() then return end

    local list = target.listBox
    if list == nil or list.keyboardFocus ~= true then return end

    if list.alertDialog and list.alertDialog:getIsVisible() then return end

    local indexInVisibleList = list.items[list.selected].item.visibleIndex
    if key == Keyboard.KEY_UP then
        if indexInVisibleList == nil then
            local new_selected = list:prevVisibleIndex(list.selected)
            list.selected = new_selected > 0 and new_selected or 1
        elseif indexInVisibleList > 1 then
            list.selected = list.visibleItems[indexInVisibleList - 1]
        end
    elseif key == Keyboard.KEY_DOWN then
        if indexInVisibleList == nil then
            local new_selected = list:nextVisibleItem(list.selected)
            list.selected = new_selected > 0 and new_selected or list.visibleItems[#list.visibleItems]
        elseif indexInVisibleList < #list.visibleItems then
            list.selected = list.visibleItems[indexInVisibleList + 1]
        end
    elseif key == Keyboard.KEY_PRIOR then
        local step = math.floor(list.height / list.itemheight) - 1
        if indexInVisibleList == nil then
            local new_selected = list:prevVisibleIndex(list.selected)
            list.selected = new_selected > 0 and new_selected or 1
        elseif indexInVisibleList > step then
            list.selected = list.visibleItems[indexInVisibleList - step]
        else
            list.selected = list.visibleItems[1]
        end
    elseif key == Keyboard.KEY_NEXT then
        local step = math.floor(list.height / list.itemheight) - 1
        if indexInVisibleList == nil then
            local new_selected = list:nextVisibleItem(list.selected)
            list.selected = new_selected > 0 and new_selected or list.visibleItems[#list.visibleItems]
        elseif indexInVisibleList < #list.visibleItems - step then
            list.selected = list.visibleItems[indexInVisibleList + step]
        else
            list.selected = list.visibleItems[#list.visibleItems]
        end
    elseif key == Keyboard.KEY_HOME then
        list.selected = list.visibleItems[1]
    elseif key == Keyboard.KEY_END then
        list.selected = list.visibleItems[#list.visibleItems]
    elseif key == Keyboard.KEY_RETURN or key == Keyboard.KEY_SPACE then
        if #list.visibleItems > 0 then
            local item = list.items[list.selected].item
            if item.isAvailable then
                if isShiftKeyDown() then
                    if not item.isHidden then
                        if item.isFavorite then
                            list:doInactiveRequest(item)
                        else
                            list:doActiveRequest(item, true)
                        end
                    end
                elseif isCtrlKeyDown() then
                    if not item.isFavorite then
                        if item.isHidden then
                            list:doUnhide(item)
                        else
                            list:doInactiveRequest(item, true)
                        end
                    end
                else
                    if not item.isFavorite and not item.isHidden then
                        if item.isActive then
                            list:doInactiveRequest(item)
                        else
                            list:doActiveRequest(item)
                        end
                    end
                end
            end
        end
    elseif key == Keyboard.KEY_ESCAPE then
        target:onBack()
    end
    list:ensureVisible(list.selected)
end

function ModSelector.onModsModified()
    ModTracker.checkMods()

    local self = ModSelector.instance
    if self and self.listBox and self:isReallyVisible() then
        local index = self.listBox.selected
        self:populateListBox(getModDirectoryTable(), true)
        if self.listBox.items[index] then
            self.listBox.selected = index
        end
    end
end

Events.OnKeyPressed.Add(ModSelector.onKeyPressed)
Events.OnModsModified.Add(ModSelector.onModsModified)

-- **********************************************
-- ModPanelFilter
-- **********************************************

ModPanelFilter = ISPanelJoypad:derive("ModPanelFilter")

function ModPanelFilter:new(x, y, width, height)
    local o = ISPanelJoypad:new(x, y, width, height)
    setmetatable(o, self)
    self.__index = self
    return o
end

function ModPanelFilter:createChildren()
    self.saveButton = ISButton:new(
            self.width - BUTTON_WDH - DX, DY, BUTTON_WDH, BUTTON_HGT,
            getText("UI_ModManager_Presets_ButtonSave"), self,
            function(target)
                target.parent:saveSettings()
            end
    )
    self.saveButton.borderColor = { r = 0.4, g = 0.4, b = 0.4, a = 1 }
    self:addChild(self.saveButton)

    self.resetButton = ISButton:new(
            self.width - BUTTON_WDH - DX, self.saveButton:getBottom() + DY, BUTTON_WDH, BUTTON_HGT,
            getText("UI_ModManager_Presets_ButtonReset"), self,
            function(target, button)
                target:resetFilter(button.longPressed)
                button.longPressed = false
            end
    )
    self.resetButton.borderColor = { r = 0.4, g = 0.4, b = 0.4, a = 1 }
    self.resetButton.update = function(button)
        ISUIElement.update(button)
        if button.enable and button.pressed and button.target then
            if not button.pressedTime then
                button.pressedTime = getTimestampMs()
            else
                local ms = getTimestampMs()
                if ms - button.pressedTime > 1000 then
                    button.pressedTime = ms
                    button.longPressed = true
                end
            end
        else
            button.pressedTime = nil
            button.longPressed = false
        end
    end
    self:addChild(self.resetButton)

    self.filter = UIPanelCompact:new(DX, DY, self.width - BUTTON_WDH - 3 * DX, BUTTON_HGT)
    self:addChild(self.filter)
    self.filter.createText = function(S)
        local options, P = {}, S.parent

        if P.locationTickBox.selected[1] and not P.locationTickBox.selected[2] then
            table.insert(options, getText("UI_ModManager_Filter_Workshop"))
        elseif not P.locationTickBox.selected[1] and P.locationTickBox.selected[2] then
            table.insert(options, getText("UI_ModManager_Filter_Local"))
        end

        if P.mapTickBox.selected[1] and not P.mapTickBox.selected[2] then
            table.insert(options, getText("UI_ModManager_Filter_WithMap"))
        elseif not P.mapTickBox.selected[1] and P.mapTickBox.selected[2] then
            table.insert(options, getText("UI_ModManager_Filter_WithoutMap"))
        end

        if P.translateTickBox.selected[1] and not P.translateTickBox.selected[2] then
            table.insert(options, getText("UI_ModManager_Filter_WithTranslation"))
        elseif not P.translateTickBox.selected[1] and P.translateTickBox.selected[2] then
            table.insert(options, getText("UI_ModManager_Filter_WithoutTranslation"))
        end

        if P.availabilityTickBox.selected[1] and not P.availabilityTickBox.selected[2] then
            table.insert(options, getText("UI_ModManager_Filter_Available"))
        elseif not P.availabilityTickBox.selected[1] and P.availabilityTickBox.selected[2] then
            table.insert(options, getText("UI_ModManager_Filter_Broken"))
        end

        if P.statusTickBox.selected[1] and not P.statusTickBox.selected[2] then
            table.insert(options, getText("UI_ModManager_Filter_Enabled"))
        elseif not P.statusTickBox.selected[1] and P.statusTickBox.selected[2] then
            table.insert(options, getText("UI_ModManager_Filter_Disabled"))
        end

        if not P.favorTickBox.selected[1] or not P.favorTickBox.selected[2] or not P.favorTickBox.selected[3] then
            if P.favorTickBox.selected[1] then
                table.insert(options, getText("UI_ModManager_Filter_Normal"))
            end
            if P.favorTickBox.selected[2] then
                table.insert(options, getText("UI_ModManager_Filter_Favorites"))
            end
            if P.favorTickBox.selected[3] then
                table.insert(options, getText("UI_ModManager_Filter_Hidden"))
            end
        end

        if #options == 0 then
            S.text = getText("UI_ModManager_Filter_Off")
        else
            S.text = getText("UI_ModManager_Filter_On", table.concat(options, ", "))
        end
    end
    self.filter.popup.resize = function(S)
        local P = S.parentPanel.parent

        -- Update labels, counts and Width
        local all = P.parent.listBox.count
        local counters = P.parent.counters

        P.allButton:setTitle(string.format("%s [%d]", getText("UI_ModManager_Filter_AllButton"), all))

        P.locationTickBox.options[1] = string.format("%s [%d]", getText("UI_ModManager_Filter_Workshop"), counters.workshop)
        P.locationTickBox.optionsIndex[1] = P.locationTickBox.options[1]
        P.locationTickBox.options[2] = string.format("%s [%d]", getText("UI_ModManager_Filter_Local"), all - counters.workshop)
        P.locationTickBox.optionsIndex[2] = P.locationTickBox.options[2]
        P.locationTickBox:setWidthToFit()

        P.mapTickBox.options[1] = string.format("%s [%d]", getText("UI_ModManager_Filter_WithMap"), counters.map)
        P.mapTickBox.optionsIndex[1] = P.mapTickBox.options[1]
        P.mapTickBox.options[2] = string.format("%s [%d]", getText("UI_ModManager_Filter_WithoutMap"), all - counters.map)
        P.mapTickBox.optionsIndex[2] = P.mapTickBox.options[2]
        P.mapTickBox:setWidthToFit()

        P.translateTickBox.options[1] = string.format("%s [%d]", getText("UI_ModManager_Filter_WithTranslation"), counters.translate)
        P.translateTickBox.optionsIndex[1] = P.translateTickBox.options[1]
        P.translateTickBox.options[2] = string.format("%s [%d]", getText("UI_ModManager_Filter_WithoutTranslation"), all - counters.translate)
        P.translateTickBox.optionsIndex[2] = P.translateTickBox.options[2]
        P.translateTickBox:setWidthToFit()

        P.availabilityTickBox.options[1] = string.format("%s [%d]", getText("UI_ModManager_Filter_Available"), counters.available)
        P.availabilityTickBox.optionsIndex[1] = P.availabilityTickBox.options[1]
        P.availabilityTickBox.options[2] = string.format("%s [%d]", getText("UI_ModManager_Filter_Broken"), all - counters.available)
        P.availabilityTickBox.optionsIndex[2] = P.availabilityTickBox.options[2]
        P.availabilityTickBox:setWidthToFit()

        P.statusTickBox.options[1] = string.format("%s [%d]", getText("UI_ModManager_Filter_Enabled"), counters.enabled)
        P.statusTickBox.optionsIndex[1] = P.statusTickBox.options[1]
        P.statusTickBox.options[2] = string.format("%s [%d]", getText("UI_ModManager_Filter_Disabled"), all - counters.enabled)
        P.statusTickBox.optionsIndex[2] = P.statusTickBox.options[2]
        P.statusTickBox:setWidthToFit()

        P.favorTickBox.options[1] = string.format("%s [%d]", getText("UI_ModManager_Filter_Normal"), all - counters.favorites - counters.hidden)
        P.favorTickBox.optionsIndex[1] = P.favorTickBox.options[2]
        P.favorTickBox.options[2] = string.format("%s [%d]", getText("UI_ModManager_Filter_Favorites"), counters.favorites)
        P.favorTickBox.optionsIndex[2] = P.favorTickBox.options[1]
        P.favorTickBox.options[3] = string.format("%s [%d]", getText("UI_ModManager_Filter_Hidden"), counters.hidden)
        P.favorTickBox.optionsIndex[3] = P.favorTickBox.options[3]
        P.favorTickBox:setWidthToFit()

        -- Update coordinates
        P.allButton:setWidth(S.width - 2 * DX)

        local w = {
            P.locationTickBox.width,
            P.mapTickBox.width,
            P.translateTickBox.width,
            P.availabilityTickBox.width,
            P.statusTickBox.width,
            P.favorTickBox.width,
        }
        local w32 = math.max(w[1], w[4]) + math.max(w[2], w[5]) + math.max(w[3], w[6])
        local w23 = math.max(w[1], w[2], w[3]) + math.max(w[4], w[5], w[6])

        if w32 + 4 * DX <= S.width then
            -- 3 columns, 2 rows
            local x1 = (S.width - w32) / 4
            local x2 = x1 + math.max(w[1], w[4]) + x1
            local x3 = x2 + math.max(w[2], w[5]) + x1
            local y1 = P.allButton:getBottom() + DY
            P.locationTickBox:setX(x1)
            P.locationTickBox:setY(y1)
            P.mapTickBox:setX(x2)
            P.mapTickBox:setY(y1)
            P.translateTickBox:setX(x3)
            P.translateTickBox:setY(y1)
            local y2 = P.translateTickBox:getBottom() + DY
            P.availabilityTickBox:setX(x1)
            P.availabilityTickBox:setY(y2)
            P.statusTickBox:setX(x2)
            P.statusTickBox:setY(y2)
            P.favorTickBox:setX(x3)
            P.favorTickBox:setY(y2)
        elseif w23 + 3 * DX <= S.width then
            -- 2 columns, 3 rows
            local dx = (S.width - w23) / 3
            local x1 = (S.width - w23) / 3
            local x2 = x1 + math.max(w[1], w[2], w[3]) + x1
            local y1 = P.allButton:getBottom() + DY
            P.locationTickBox:setX(x1)
            P.locationTickBox:setY(y1)
            P.availabilityTickBox:setX(x2)
            P.availabilityTickBox:setY(y1)
            local y2 = P.availabilityTickBox:getBottom() + DY
            P.mapTickBox:setX(x1)
            P.mapTickBox:setY(y2)
            P.statusTickBox:setX(x2)
            P.statusTickBox:setY(y2)
            local y3 = P.statusTickBox:getBottom() + DY
            P.translateTickBox:setX(x1)
            P.translateTickBox:setY(y3)
            P.favorTickBox:setX(x2)
            P.favorTickBox:setY(y3)
        else
            -- 1 column, 6 rows
            local dx = (S.width - math.max(w[1], w[2], w[3], w[4], w[5], w[6])) / 2
            P.locationTickBox:setX(dx)
            P.locationTickBox:setY(P.allButton:getBottom() + DY)
            P.mapTickBox:setX(dx)
            P.mapTickBox:setY(P.locationTickBox:getBottom() + DY)
            P.translateTickBox:setX(dx)
            P.translateTickBox:setY(P.mapTickBox:getBottom() + DY)
            P.availabilityTickBox:setX(dx)
            P.availabilityTickBox:setY(P.translateTickBox:getBottom() + DY)
            P.statusTickBox:setX(dx)
            P.statusTickBox:setY(P.availabilityTickBox:getBottom() + DY)
            P.favorTickBox:setX(dx)
            P.favorTickBox:setY(P.statusTickBox:getBottom() + DY)
        end

        S:setHeight(P.favorTickBox:getBottom() + DY)
    end

    local allButton = ISButton:new(
            DX, DY, 0, BUTTON_HGT, "", self,
            function(target)
                target.locationTickBox.selected = { true, true }
                target.mapTickBox.selected = { true, true }
                target.translateTickBox.selected = { true, true }
                target.availabilityTickBox.selected = { true, true }
                target.statusTickBox.selected = { true, true }
                target.favorTickBox.selected = { true, true, true }
                target.filter.text = getText("UI_ModManager_Filter_Off")
                target.parent.listBox:updateFilter()
            end
    )
    allButton.borderColor = { r = 1, g = 1, b = 1, a = 0.1 }
    self.filter.popup:addChild(allButton)
    self.allButton = allButton

    local locationTickBox = ISTickBox:new(
            0, 0, 0, 0, nil, self.filter,
            function(target, optionIndex, optionValue, arg1, arg2, tickBox)
                if not optionValue then tickBox.selected[3 - optionIndex] = true end
                target:createText()
                target.parent.parent.listBox:updateFilter()
            end
    )
    locationTickBox.choicesColor = { r = 1, g = 1, b = 1, a = 1 }
    locationTickBox:addOption("", "from_workshop")
    locationTickBox:addOption("", "from_local")
    locationTickBox.selected = { true, true }
    self.filter.popup:addChild(locationTickBox)
    self.locationTickBox = locationTickBox

    local mapTickBox = ISTickBox:new(
            0, 0, 0, 0, nil, self.filter,
            function(target, optionIndex, optionValue, arg1, arg2, tickBox)
                if not optionValue then tickBox.selected[3 - optionIndex] = true end
                target:createText()
                target.parent.parent.listBox:updateFilter()
            end
    )
    mapTickBox.choicesColor = { r = 1, g = 1, b = 1, a = 1 }
    mapTickBox:addOption("", "with_maps")
    mapTickBox:addOption("", "without_maps")
    mapTickBox.selected = { true, true }
    self.filter.popup:addChild(mapTickBox)
    self.mapTickBox = mapTickBox

    local translateTickBox = ISTickBox:new(
            0, 0, 0, 0, nil, self.filter,
            function(target, optionIndex, optionValue, arg1, arg2, tickBox)
                if not optionValue then tickBox.selected[3 - optionIndex] = true end
                target:createText()
                target.parent.parent.listBox:updateFilter()
            end
    )
    translateTickBox.choicesColor = { r = 1, g = 1, b = 1, a = 1 }
    translateTickBox:addOption("", "translated")
    translateTickBox:addOption("", "not_translated")
    translateTickBox.selected = { true, true }
    self.filter.popup:addChild(translateTickBox)
    self.translateTickBox = translateTickBox

    local availabilityTickBox = ISTickBox:new(
            0, 0, 0, 0, nil, self.filter,
            function(target, optionIndex, optionValue, arg1, arg2, tickBox)
                if not optionValue then tickBox.selected[3 - optionIndex] = true end
                target:createText()
                target.parent.parent.listBox:updateFilter()
            end
    )
    availabilityTickBox.choicesColor = { r = 1, g = 1, b = 1, a = 1 }
    availabilityTickBox:addOption("", "available")
    availabilityTickBox:addOption("", "not_available")
    availabilityTickBox.selected = { true, true }
    self.filter.popup:addChild(availabilityTickBox)
    self.availabilityTickBox = availabilityTickBox

    local statusTickBox = ISTickBox:new(
            0, 0, 0, 0, nil, self.filter,
            function(target, optionIndex, optionValue, arg1, arg2, tickBox)
                if not optionValue then tickBox.selected[3 - optionIndex] = true end
                target:createText()
                target.parent.parent.listBox:updateFilter()
            end
    )
    statusTickBox.choicesColor = { r = 1, g = 1, b = 1, a = 1 }
    statusTickBox:addOption("", "enabled")
    statusTickBox:addOption("", "disabled")
    statusTickBox.selected = { true, true }
    self.filter.popup:addChild(statusTickBox)
    self.statusTickBox = statusTickBox

    local favorTickBox = ISTickBox:new(
            0, 0, 0, 0, nil, self.filter,
            function(target, optionIndex, optionValue, arg1, arg2, tickBox)
                if not tickBox.selected[1] and not tickBox.selected[2] and not tickBox.selected[3] then
                    tickBox.selected[1] = true
                end
                target:createText()
                target.parent.parent.listBox:updateFilter()
            end
    )
    favorTickBox.choicesColor = { r = 1, g = 1, b = 1, a = 1 }
    favorTickBox:addOption("", "normal")
    favorTickBox:addOption("", "favorite")
    favorTickBox:addOption("", "hidden")
    favorTickBox.selected = { true, true, false }
    self.filter.popup:addChild(favorTickBox)
    self.favorTickBox = favorTickBox

    self.filter:createText()

    -- Sort
    self.order = UIPanelCompact:new(DX, self.filter:getBottom() + DY, self.width - BUTTON_WDH - 3 * DX, BUTTON_HGT)
    self:addChild(self.order)
    self.order.createText = function(S)
        local P = S.parent
        local operator1, operator2 = "", ""

        for i, name in ipairs(P.orderBy.options) do
            if P.orderBy.selected[i] then
                operator1 = name
            end
        end
        for i, name in ipairs(P.orderAs.options) do
            if P.orderAs.selected[i] then
                operator2 = name
            end
        end

        S.text = getText("UI_ModManager_Order_By", operator1, operator2)
    end
    self.order.popup.resize = function(S)
        local P = S.parentPanel.parent

        local w = {
            P.orderBy.width,
            P.orderAs.width,
        }
        local w2 = w[1] + w[2]
        local x1 = (S.width - w2) / 3
        local x2 = x1 + math.max(w[1], w[2]) + x1

        P.orderBy:setX(x1)
        P.orderBy:setY(DY)
        P.orderAs:setX(x2)
        P.orderAs:setY(DY)

        S:setHeight(math.max(P.orderBy:getBottom(), P.orderAs:getBottom()) + DY)
    end

    local orderBy = ISTickBox:new(
            0, 0, 0, 0, nil, self.order,
            function(target, optionIndex, optionValue, arg1, arg2, tickBox)
                tickBox.selected[optionIndex] = true
                for i = 1, tickBox.optionCount do
                    if i ~= optionIndex then tickBox.selected[i] = false end
                end

                target:createText()
                target.parent.parent.listBox:updateFilter()
            end
    )
    orderBy.choicesColor = { r = 1, g = 1, b = 1, a = 1 }
    orderBy:addOption(getText("UI_ModManager_Order_Name"), "name")
    orderBy:addOption(getText("UI_ModManager_Order_Enabled"), "enabled")
    orderBy:addOption(getText("UI_ModManager_Order_Recent"), "recent")
    orderBy:setWidthToFit()
    orderBy.selected = { true, false, false }
    self.order.popup:addChild(orderBy)
    self.orderBy = orderBy

    local orderAs = ISTickBox:new(
            0, 0, 0, 0, nil, self.order,
            function(target, optionIndex, optionValue, arg1, arg2, tickBox)
                if optionValue then
                    tickBox.selected = {}
                    tickBox.selected[optionIndex] = true
                    tickBox.selected[3 - optionIndex] = false
                else
                    tickBox.selected[optionIndex] = true
                    tickBox.selected[3 - optionIndex] = false
                end
                target:createText()
                target.parent.parent.listBox:updateFilter()
            end
    )
    orderAs.choicesColor = { r = 1, g = 1, b = 1, a = 1 }
    orderAs:addOption(getText("UI_ModManager_Order_Asc"), "asc")
    orderAs:addOption(getText("UI_ModManager_Order_Desc"), "desc")
    orderAs:setWidthToFit()
    orderAs.selected = { true, false }
    self.order.popup:addChild(orderAs)
    self.orderAs = orderAs

    self.order:createText()

    -- Search
    self.search = UIPanelCompact:new(DX, self.order:getBottom() + DY, self.width - 2 * DX, BUTTON_HGT)
    self:addChild(self.search)
    self.search.recalcChildren = function(S)
        local w = math.max(S.width - (10 + getTextManager():MeasureStringX(S.font, S.text) + 5 + 18), BUTTON_WDH)
        S.parent.searchEntryBox:setX(S.width - (w + 18))
        S.parent.searchEntryBox:setWidth(w)
    end
    self.search.createText = function(S)
        local options, P = {}, S.parent
        local operator1, operator2 = "", ""

        for i, name in ipairs(P.searchBy1.options) do
            if P.searchBy1.selected[i] then table.insert(options, name) end
        end
        for i, name in ipairs(P.searchBy2.options) do
            if P.searchBy2.selected[i] then table.insert(options, name) end
        end
        for i, name in ipairs(P.searchAs1.options) do
            if P.searchAs1.selected[i] then
                operator1 = getText("UI_ModManager_Search_OR")
                operator2 = name
            end
        end
        for i, name in ipairs(P.searchAs2.options) do
            if P.searchAs2.selected[i] then
                operator1 = getText("UI_ModManager_Search_AND")
                operator2 = name
            end
        end

        S.text = getText("UI_ModManager_Search_By", table.concat(options, operator1), operator2)
        S:recalcChildren()
    end
    self.search.popup.resize = function(S)
        local P = S.parentPanel.parent

        local w = {
            P.searchBy1.width,
            P.searchBy2.width,
            P.searchAs1.width,
            P.searchAs2.width,
        }
        local w12 = math.max(w[1], w[2])
        local w34 = math.max(w[3], w[4])

        if w[1] + w[2] + w[3] + w[4] + 5 * DX <= S.width then
            local dx = (S.width - (w[1] + w[2] + w[3] + w[4] + 5 * DX)) / 3
            P.searchBy1:setX(DX + dx)
            P.searchBy1:setY(DY)
            P.searchBy2:setX(P.searchBy1:getRight() + DX)
            P.searchBy2:setY(DY)
            P.searchAs1:setX(P.searchBy2:getRight() + DX + dx)
            P.searchAs1:setY(DY)
            P.searchAs2:setX(P.searchAs1:getRight() + DX)
            P.searchAs2:setY(DY)
        elseif w12 + w34 + 3 * DX <= S.width then
            local x1 = (S.width - (w12 + w34)) / 3
            local x2 = x1 + w12 + x1
            P.searchBy1:setX(x1)
            P.searchBy1:setY(DY)
            P.searchBy2:setX(x1)
            P.searchBy2:setY(P.searchBy1:getBottom() + DY)
            P.searchAs1:setX(x2)
            P.searchAs1:setY(DY)
            P.searchAs2:setX(x2)
            P.searchAs2:setY(P.searchAs1:getBottom() + DY)
        else
            local x = (S.width - math.max(w12, w34)) / 2
            P.searchBy1:setX(x)
            P.searchBy1:setY(DY)
            P.searchBy2:setX(x)
            P.searchBy2:setY(P.searchBy1:getBottom() + DY)
            P.searchAs1:setX(x)
            P.searchAs1:setY(P.searchBy2:getBottom() + DY)
            P.searchAs2:setX(x)
            P.searchAs2:setY(P.searchAs1:getBottom() + DY)
        end

        S:setHeight(math.max(P.searchBy2:getBottom(), P.searchAs2:getBottom()) + DY)
    end

    local searchBy1 = ISTickBox:new(
            0, 0, 0, 0, nil, self.search,
            function(target, optionIndex, optionValue, arg1, arg2, tickBox)
                if optionValue then
                    target.parent.searchBy2.selected = {}
                    target.parent.searchEntryBox.options = {}
                elseif not (tickBox.selected[1] or tickBox.selected[2] or tickBox.selected[3]) then
                    tickBox.selected[optionIndex] = true
                end
                target:createText()
                target.parent.parent.listBox:updateFilter()
            end
    )
    searchBy1.choicesColor = { r = 1, g = 1, b = 1, a = 1 }
    searchBy1:addOption(getText("UI_ModManager_Search_Name"))
    searchBy1:addOption(getText("UI_ModManager_Search_Description"))
    searchBy1:addOption(getText("UI_ModManager_Search_ModID"))
    searchBy1:setWidthToFit()
    searchBy1.selected = { true, true, true }
    self.search.popup:addChild(searchBy1)
    self.searchBy1 = searchBy1

    local searchBy2 = ISTickBox:new(
            0, 0, 0, 0, nil, self.search,
            function(target, optionIndex, optionValue, arg1, arg2, tickBox)
                if optionValue then
                    target.parent.searchBy1.selected = {}
                    tickBox.selected = {}
                    tickBox.selected[optionIndex] = true

                    target.parent.searchEntryBox.options = {}
                    if optionIndex == 3 then
                        local tags = {}
                        for i, j in pairs(target.parent.parent.counters.originalTags) do
                            tags[i] = j
                        end
                        for i, j in pairs(target.parent.parent.counters.customTags) do
                            tags[i] = (tags[i] or 0) + j
                        end
                        for i, j in pairs(tags) do
                            target.parent.searchEntryBox:addOption(i, j)
                        end
                    elseif optionIndex == 4 then
                        for i, j in pairs(target.parent.parent.counters.authors) do
                            target.parent.searchEntryBox:addOption(i, j)
                        end
                    end
                else
                    tickBox.selected[optionIndex] = true
                end
                target:createText()
                target.parent.parent.listBox:updateFilter()
            end
    )
    searchBy2.choicesColor = { r = 1, g = 1, b = 1, a = 1 }
    searchBy2:addOption(getText("UI_ModManager_Search_WorkshopID"))
    searchBy2:addOption(getText("UI_ModManager_Search_MapID"))
    searchBy2:addOption(getText("UI_ModManager_Search_Tags"))
    searchBy2:addOption(getText("UI_ModManager_Search_Author"))
    searchBy2:setWidthToFit()
    searchBy2.selected = {}
    self.search.popup:addChild(searchBy2)
    self.searchBy2 = searchBy2

    local searchAs1 = ISTickBox:new(
            0, 0, 0, 0, nil, self.search,
            function(target, optionIndex, optionValue, arg1, arg2, tickBox)
                if optionValue then
                    target.parent.searchEntryBox:setVisible(not (optionIndex == 3))
                    target.parent.searchAs2.selected = {}
                    tickBox.selected = {}
                    tickBox.selected[optionIndex] = true
                else
                    tickBox.selected[optionIndex] = true
                end
                target:createText()
                target.parent.parent.listBox:updateFilter()
            end
    )
    searchAs1.choicesColor = { r = 1, g = 1, b = 1, a = 1 }
    searchAs1:addOption(getText("UI_ModManager_Search_Equals"))
    searchAs1:addOption(getText("UI_ModManager_Search_Contains"))
    searchAs1:addOption(getText("UI_ModManager_Search_Empty"))
    searchAs1:setWidthToFit()
    searchAs1.selected = { false, true, false }
    self.search.popup:addChild(searchAs1)
    self.searchAs1 = searchAs1

    local searchAs2 = ISTickBox:new(
            0, 0, 0, 0, nil, self.search,
            function(target, optionIndex, optionValue, arg1, arg2, tickBox)
                if optionValue then
                    target.parent.searchEntryBox:setVisible(not (optionIndex == 3))
                    target.parent.searchAs1.selected = {}
                    tickBox.selected = {}
                    tickBox.selected[optionIndex] = true
                else
                    tickBox.selected[optionIndex] = true
                end
                target:createText()
                target.parent.parent.listBox:updateFilter()
            end
    )
    searchAs2.choicesColor = { r = 1, g = 1, b = 1, a = 1 }
    searchAs2:addOption(getText("UI_ModManager_Search_notEquals"))
    searchAs2:addOption(getText("UI_ModManager_Search_notContains"))
    searchAs2:addOption(getText("UI_ModManager_Search_notEmpty"))
    searchAs2:setWidthToFit()
    searchAs2.selected = {}
    self.search.popup:addChild(searchAs2)
    self.searchAs2 = searchAs2

    self.searchEntryBox = UITextEntryList:new("", 0, 3, 0, self.search.height - 6)
    self.search:addChild(self.searchEntryBox)
    self.searchEntryBox:setClearButton(true)
    self.searchEntryBox.onTextChange = function(S)
        S.parent.parent.parent.listBox:updateFilter()
    end

    self.search:createText()

    self:resetFilter()
end

function ModPanelFilter:resetFilter(applyDefault)
    if applyDefault then
        self.locationTickBox.selected = { true, true }
        self.mapTickBox.selected = { true, true }
        self.translateTickBox.selected = { true, true }
        self.availabilityTickBox.selected = { true, true }
        self.statusTickBox.selected = { true, true }
        self.favorTickBox.selected = { true, true, false }
        self.orderBy.selected = { true, false, false }
        self.orderAs.selected = { true, false }
    else
        local settings = ModSelector.instance.settings.filter
        if settings then
            self:setTickBoxSelection(settings, self.locationTickBox)
            self:setTickBoxSelection(settings, self.mapTickBox)
            self:setTickBoxSelection(settings, self.translateTickBox)
            self:setTickBoxSelection(settings, self.availabilityTickBox)
            self:setTickBoxSelection(settings, self.statusTickBox)
            self:setTickBoxSelection(settings, self.favorTickBox)
        end
        settings = ModSelector.instance.settings.order
        if settings then
            self:setTickBoxSelection(settings, self.orderBy)
            self:setTickBoxSelection(settings, self.orderAs)
        end
    end
    self.searchBy1.selected = { true, true, true }
    self.searchBy2.selected = {}
    self.searchAs1.selected = { false, true, false }
    self.searchAs2.selected = {}
    self.searchEntryBox:setText("")

    if self.parent and self.parent.listBox then
        self.parent.listBox:updateFilter()
    end

    self.filter:createText()
    self.order:createText()
    self.search:createText()
end

function ModPanelFilter:setTickBoxSelection(settings, tickBox)
    for index = 1, tickBox.optionCount - 1 do
        local value = settings[tickBox.optionData[index]]
        if value == nil then
            value = tickBox.selected[index]
            settings[tickBox.optionData[index]] = value
        end

        tickBox:setSelected(index, value)
    end
end

-- **********************************************
-- ModListBox
-- **********************************************

ModListBox = ISScrollingListBox:derive("ModListBox")

function ModListBox:new(x, y, width, height)
    local o = ISScrollingListBox:new(x, y, width, height)
    setmetatable(o, self)
    self.__index = self
    o.drawBorder = true
    o.indexById = {} -- {modId = index, modId = index, ...}
    o.visibleItems = {} -- {itemindex1, itemindex5, itemindex10, ...}
    o.itemheight = math.max(FONT_HGT_MEDIUM + DY * 2, BUTTON_HGT)
    o.keyboardFocus = false
    o.backgroundColor = { r = 0, g = 0, b = 0, a = 0.8 }

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
    o.item.item.storedIndex = number -- index, sorted by date added
    o.item.item.modInfo
    o.item.item.modInfoExtra = {}
    o.item.item.isAvailable = true/false
    o.item.item.isActive = true/false
    o.item.item.isFavorite = true/false
    o.item.item.isHidden = true/false
    o.item.item.dependents = {}
    o.item.item.visibleIndex = nil or number
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
    if not filter.translateTickBox.selected[1] and modInfoExtra.translate then return false end
    if not filter.translateTickBox.selected[2] and not modInfoExtra.translate then return false end
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
        for _, t in ipairs(self.parent.customTags[modInfo:getId()] or {}) do
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
            sortFunc = function(a, b) return a.item.storedIndex > b.item.storedIndex end
        else
            sortFunc = function(a, b) return a.item.storedIndex < b.item.storedIndex end
        end
    end
    -- Sort
    self:sort(sortFunc)
    -- Re-index
    self:indexByModId()

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

function ModListBox:sort(func)
    -- Sort using arg or by name asc
    func = func or function(a, b) return a.text < b.text end
    table.sort(self.items, func)
    for i, item in ipairs(self.items) do
        item.itemindex = i
    end
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
    local local_y = self:getYScroll() + y
    if s ~= 0 and (local_y < -h or local_y > self:getHeight()) then
        return y + h + 1
    end

    -- Item bar
    if self.selected == index then
        self:drawRect(0, y, self:getWidth(), h, 0.3, 0.7, 0.35, 0.15)
    elseif self.mouseOverSelected == index and not self:isMouseOverScrollBar() then
        self:drawRect(0, y, self:getWidth(), h, 0.95, 0.05, 0.05, 0.05)
    end
    self:drawRectBorder(0, y, self:getWidth(), h, 0.5, self.borderColor.r, self.borderColor.g, self.borderColor.b)

    -- Icon, title
    local icon = item.modInfoExtra.icon or item.modInfoExtra.maps and ICON_MAP or ICON_DEFAULT
    local text = item.modInfo:getName()
    local tooltip
    local r, g, b = 1, 1, 1

    if item.isHidden then
        icon = item.modInfoExtra.maps and ICON_MAP_GREY or ICON_DEFAULT_GREY
        r, g, b = 0.7, 0.7, 0.7
    end
    self:drawTextureScaled(icon, DX, y + DY, FONT_HGT_MEDIUM, FONT_HGT_MEDIUM, 1)
    if not item.isAvailable then
        g, b = 0.2, 0.2
        self:drawTexture(ICON_BROKEN, DX + FONT_HGT_MEDIUM - 6, y + DY + FONT_HGT_MEDIUM - 9, 1)
    elseif item.isActive then
        local dependents = {}
        for _, dependentId in ipairs(item.dependents or {}) do
            if self.items[self.indexById[dependentId]].item.isActive then
                table.insert(dependents, dependentId)
            end
        end
        if #dependents > 0 then
            g, b = 0.7, 0.2
            tooltip = " <SIZE:medium> " .. getText("UI_ModManager_List_Tooltip_EnabledBy") .. " <SIZE:small> <LINE> "
            for _, dependentId in ipairs(dependents) do
                tooltip = tooltip .. " <LINE> <INDENT:20> " .. getModInfoByID(dependentId):getName()
            end
            self:drawTexture(ICON_REQUIRE, DX + FONT_HGT_MEDIUM - 4, y + DY + FONT_HGT_MEDIUM - 4, 1)
        else
            r, g, b = 0.4, 0.8, 0.3
            self:drawTexture(ICON_ACTIVE, DX + FONT_HGT_MEDIUM - 4, y + DY + FONT_HGT_MEDIUM - 4, 1)
        end
    end
    if item.isFavorite then
        self:drawTexture(ICON_FAVORITE, DX + FONT_HGT_MEDIUM - 6, y + DY - 4, 1)
    end
    self.items[index].tooltip = tooltip
    self:drawText(text, DX + FONT_HGT_MEDIUM + DX, y + DY, r, g, b, 1, UIFont.Medium)

    local iconLocation = item.modInfo:getWorkshopID() and ICON_STEAM or item.modInfo:getDir():find("Workshop") and ICON_FOLDER_W or ICON_FOLDER
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

    y = y + h + 1
    return y
end

function ModListBox:doDrawButton(text, internal, x, y, w, h)
    local selected = self.mouseOverSelected
    local color = { a = 1.0, r = 0.0, g = 0.0, b = 0.0 }

    if self:getMouseX() > x and self:getMouseX() < x + w and self:getMouseY() > y and self:getMouseY() < y + h then
        if self.pressedButton and self.pressedButton.internal == internal and self.pressedButton.selected == selected then
            color = { a = 1.0, r = 0.15, g = 0.15, b = 0.15 }
        else
            color = { a = 1.0, r = 0.3, g = 0.3, b = 0.3 }
        end
        self.mouseOverButton = { internal = internal, selected = selected }
    elseif self.mouseOverButton and self.mouseOverButton.internal == internal and self.mouseOverButton.selected == selected then
        self.mouseOverButton = nil
    end

    self:drawRect(x, y, w, h, color.a, color.r, color.g, color.b)
    self:drawRectBorder(x, y, w, h, 0.3, 1, 1, 1)
    self:drawTextCentre(
            text, x + w / 2, y + (BUTTON_HGT - FONT_HGT_SMALL) / 2,
            1.0, 1.0, 1.0, 1.0, UIFont.Small
    )
end

function ModListBox:updateTooltip()
    ISScrollingListBox.updateTooltip(self)

    if self.mouseOverButton and self.tooltipUI and self.tooltipUI:getIsVisible() then
        self.tooltipUI:setVisible(false)
        self.tooltipUI:removeFromUIManager()
    end
end

function ModListBox:doActiveRequest(item, doFavor)
    local indexInVisibleList
    local filter = self.parent.filterPanel
    if filter.orderBy.selected[2] then
        indexInVisibleList = self.items[self.selected].item.visibleIndex
    end

    self:doActive(item, doFavor)

    if indexInVisibleList and #self.visibleItems > 0 then
        self.selected = self.visibleItems[indexInVisibleList]
    end
end

function ModListBox:doActive(item, doFavor)
    if item.isActive == false then
        item.isActive = true
        self.parent.counters.enabled = self.parent.counters.enabled + 1
    end

    if doFavor then
        item.isFavorite = true
        self.parent.counters.favorites = self.parent.counters.favorites + 1
    end

    self:updateFilter()

    local requires = item.modInfo:getRequire()
    if requires and not requires:isEmpty() then
        for i = 0, requires:size() - 1 do
            self:doActive(self.items[self.indexById[requires:get(i)]].item, doFavor)
        end
    end
end

function ModListBox:doInactiveRequest(item, doHidden)
    local indexInVisibleList
    local filter = self.parent.filterPanel
    if filter.orderBy.selected[2] then
        indexInVisibleList = self.items[self.selected].item.visibleIndex
    end

    self:doInactive(item, doHidden)

    if indexInVisibleList and #self.visibleItems > 0 then
        self.selected = self.visibleItems[indexInVisibleList]
    end
end

function ModListBox:doInactive(item, doHidden)
    if item.isActive then
        self.parent.counters.enabled = self.parent.counters.enabled - 1
        item.isActive = false
    end

    if item.isFavorite then
        self.parent.counters.favorites = self.parent.counters.favorites - 1
        item.isFavorite = false
    end

    if doHidden then
        self.parent.counters.hidden = self.parent.counters.hidden + 1
        item.isHidden = true
    end

    self:updateFilter()

    for _, dependentId in ipairs(item.dependents or {}) do
        self:doInactive(self.items[self.indexById[dependentId]].item)
    end
end

function ModListBox:doUnhide(item)
    self.parent.counters.hidden = self.parent.counters.hidden - 1
    item.isHidden = false

    self:updateFilter()
end

function ModListBox:showDialog(text, item, onClick)
    local modal = ISModalDialog:new(0, 0, 350, 150, text, true, self, onClick, nil, item)
    modal:initialise()
    modal.originalOnMouseDown = ISModalDialog.onMouseDown
    modal.onMouseDown = function(target, x, y)
        if not target:isMouseOver() then
            target:removeFromUIManager()
        else
            target.originalOnMouseDown(target, x, y)
        end
    end
    modal:setAlwaysOnTop(true)
    modal:setCapture(true)
    modal:addToUIManager()
    self.alertDialog = modal
end

function ModListBox:onMouseMove(dx, dy)
    if self:isMouseOverScrollBar() then
        self.mouseOverButton = nil
        return
    end
    self.mouseOverSelected = self:rowAt(self:getMouseX(), self:getMouseY())
    if self.mouseOverButton and self.mouseOverButton.selected ~= self.mouseOverSelected then
        self.mouseOverButton = nil
    end
end

function ModListBox:onMouseMoveOutside(x, y)
    self.mouseOverSelected = -1
    self.mouseOverButton = nil
end

function ModListBox:onMouseDown(x, y)
    -- Stops from changing mods while in ModOrderUI
    if not self.parent.modOrderUI or not self.parent.modOrderUI:isVisible() then
        self.keyboardFocus = true
        if self.mouseOverButton then
            self.pressedButton = self.mouseOverButton
        else
            ISScrollingListBox.onMouseDown(self, x, y)
        end
    end
end

function ModListBox:onMouseUp(x, y)
    if self.mouseOverButton and self.pressedButton
            and self.mouseOverButton.internal == self.pressedButton.internal
            and self.mouseOverButton.selected == self.pressedButton.selected then
        getSoundManager():playUISound("UIActivateButton")

        local selectedItem = self.items[self.pressedButton.selected].item
        if self.pressedButton.internal == "ON" then
            self:doActiveRequest(selectedItem)
        elseif self.pressedButton.internal == "OFF" then
            self:doInactiveRequest(selectedItem)
        elseif self.pressedButton.internal == "FAVORITE" then
            self:showDialog(getText("UI_ModManager_List_Dialog_Favorite"), selectedItem,
                    function(target, button, item)
                        if button.internal == "YES" then
                            target:doActiveRequest(item, true)
                        end
                    end
            )
        elseif self.pressedButton.internal == "UNFAVORITE" then
            self:doInactiveRequest(selectedItem)
        elseif self.pressedButton.internal == "HIDE" then
            self:showDialog(getText("UI_ModManager_List_Dialog_Hide"), selectedItem,
                    function(target, button, item)
                        if button.internal == "YES" then
                            target:doInactiveRequest(item, true)
                        end
                    end
            )
        elseif self.pressedButton.internal == "UNHIDE" then
            self:doUnhide(selectedItem)
        end
        self.mouseOverButton = nil
        self.pressedButton = nil
    else
        self.pressedButton = nil
        ISScrollingListBox.onMouseUp(self, x, y)
    end
end

function ModListBox:onMouseUpOutside(x, y)
    self.pressedButton = nil
    self.keyboardFocus = false
    --ISScrollingListBox.onMouseUpOutside(self, x, y) -- call error "attempted index: onMouseUpOutside of non-table" when "reload lua" and mouse cursor outside the panel
    if self.vscroll then self.vscroll.scrolling = false end
end

function ModListBox:onMouseDoubleClick(x, y)
    if self:isMouseOverScrollBar() then
        return
    end

    if self.mouseOverButton then
        self.pressedButton = self.mouseOverButton
        return
    end

    local item = self.items[self.selected].item
    if not item.isAvailable then return end

    if not item.isActive then
        self:doActiveRequest(item)
    else
        self:doInactiveRequest(item)
    end
end

-- **********************************************
-- ModPanelPoster
-- **********************************************

ModPanelPoster = ISPanelJoypad:derive("ModPanelPoster")

function ModPanelPoster:new(x, y, width, height)
    local o = ISPanelJoypad:new(x, y, width, height)
    setmetatable(o, self)
    self.__index = self
    o.selectedMod = 0
    o.index = 0 -- poster index
    --o.modInfo // set in ModPanelInfo
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
        local posterView = UIModPoster:new(poster)
        posterView:initialise()
        local wrapper = posterView:wrapInCollapsableWindow(getText("UI_ModManager_Info_Poster"), false, UIModPosterWrapper)
        wrapper:setWantKeyEvents(true)
        posterView.wrap = wrapper
        wrapper.posterUI = posterView
        posterView.render = UIModPoster.noRender
        posterView.prerender = UIModPoster.noRender
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

-- **********************************************
-- ModPanelThumbnail
-- **********************************************

ModPanelThumbnail = ISPanelJoypad:derive("ModPanelThumbnail")

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
    --o.modInfo // set in ModPanelInfo
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

-- **********************************************
-- ModPanelInfo
-- **********************************************

ModPanelInfo = ISPanelJoypad:derive("ModPanelInfo")

function ModPanelInfo:new(x, y, width, height)
    local o = ISPanelJoypad:new(x, y, width, height)
    setmetatable(o, self)
    self.__index = self
    o.scrollwidth = 13
    o.selected = 0
    o.backgroundColor = { r = 0, g = 0, b = 0, a = 0.8 }
    --o.item = self.parent.listBox.items[i].item / can be nil
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

    self.customTagsButton = ISButton:new(
            self:getRight() - DX - BUTTON_SQ - self.scrollwidth,
            self:getBottom() - DX - BUTTON_SQ - 1,
            BUTTON_SQ, BUTTON_SQ, "", self, self.onCustomTagsDialog
    )
    self.customTagsButton:setImage(getTexture("media/ui/ModManager_InfoTags.png"))
    self.customTagsButton:forceImageSize(BUTTON_SQ_IMG, BUTTON_SQ_IMG)
    self.customTagsButton.borderColor = { r = 1, g = 1, b = 1, a = 0.1 }
    self.customTagsButton.tooltip = getText("UI_ModManager_Info_TagsButton")
    self.parent:addChild(self.customTagsButton)

    self.workshopButton = ISButton:new(
            0, self:getBottom() - DX - BUTTON_SQ - 1, BUTTON_SQ, BUTTON_SQ, "", self, self.onGoButton
    )
    self.workshopButton.internal = "WORKSHOP"
    self.workshopButton:setImage(getTexture("media/ui/ModManager_InfoSteam.png"))
    self.workshopButton:forceImageSize(BUTTON_SQ_IMG, BUTTON_SQ_IMG)
    self.workshopButton.borderColor = { r = 1, g = 1, b = 1, a = 0.1 }
    self.workshopButton.tooltip = getText("UI_WorkshopSubmit_OverlayButton")
    self.parent:addChild(self.workshopButton)

    self.urlButton = ISButton:new(
            0, self:getBottom() - DX - BUTTON_SQ - 1, BUTTON_SQ, BUTTON_SQ, "", self, self.onGoButton
    )
    self.urlButton.internal = "URL"
    self.urlButton:setImage(getTexture("media/ui/ModManager_InfoWeb.png"))
    self.urlButton:forceImageSize(BUTTON_SQ_IMG, BUTTON_SQ_IMG)
    self.urlButton.borderColor = { r = 1, g = 1, b = 1, a = 0.1 }
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
        description = description .. " <LINE> <TEXT> " .. getText("UI_mods_ID", modInfo:getId()) .. " <LINE> "
        -- Workshop ID
        if getSteamModeActive() and modInfo:getWorkshopID() then
            description = description .. getText("UI_WorkshopSubmit_ItemID") .. " " .. modInfo:getWorkshopID() .. " <LINE> "
        end

        -- Mod version
        if modInfoExtra.modVersion ~= nil then
            description = description .. getText("UI_ModManager_Info_ModVersion", modInfoExtra.modVersion) .. " <LINE> "
        end

        -- Authors
        local authors = modInfoExtra.authors
        if authors ~= nil then
            description = description .. " <TEXT> " .. getText("UI_ModManager_Info_Authors")
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
        local customTags = self.parent.customTags[modInfo:getId()] or {}
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
        if isSteamOverlayEnabled() then
            activateSteamOverlayToWebPage(self.urlEntry.title)
        else
            openUrl(self.urlEntry.title)
        end
    elseif button.internal == "WORKSHOP" then
        if isSteamOverlayEnabled() then
            activateSteamOverlayToWorkshopItem(self.item.modInfo:getWorkshopID())
        else
            openUrl(string.format("https://steamcommunity.com/sharedfiles/filedetails/?id=%s", self.item.modInfo:getWorkshopID()))
        end
    end
end

function ModPanelInfo:onCustomTagsDialog()
    local modId = self.parent.listBox.items[self.selected].item.modInfo:getId()
    local text = table.concat(self.parent.customTags[modId] or {}, ",")
    local modal = ISTextBox:new(
            (getCore():getScreenWidth() / 2) - 140,
            (getCore():getScreenHeight() / 2) - 90,
            280, 180,
            getText("UI_ModManager_Info_TagsButton_Request"),
            text, self, self.onCustomTagsConfirm
    )
    modal.validateTooltipText = getText("UI_ModManager_Info_TagsButton_Warning")
    modal:initialise()
    modal:setCapture(true)
    modal:setAlwaysOnTop(true)
    modal:setValidateFunction(self, self.isValidCustomTags)
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

function ModPanelInfo:isValidCustomTags(text)
    return not text:contains("/") and not text:contains("\\")
            and not text:contains(":") and not text:contains(";")
            and not text:contains("\"") and not text:contains(".")
end

function ModPanelInfo:onCustomTagsConfirm(button)
    if button.internal == "OK" then
        local modId = self.parent.listBox.items[self.selected].item.modInfo:getId()
        local text = button.parent.entry:getText()
        local old_tags, new_tags = {}, {}
        for _, tag in ipairs(self.parent.customTags[modId] or {}) do
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
        self.parent.customTags[modId] = {}
        for tag, _ in pairs(new_tags) do
            self.parent.counters.customTags[tag] = (self.parent.counters.customTags[tag] or 0) + 1
            table.insert(self.parent.customTags[modId], tag)
        end
        table.sort(self.parent.customTags[modId])

        -- Write to file
        local file = getFileWriter(FILE_CUSTOM_TAGS, true, false)
        for id, tags in pairs(self.parent.customTags) do
            if #tags > 0 then
                file:write(id .. ":" .. table.concat(tags, ",") .. "\n")
            end
        end
        file:close()

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

-- **********************************************
-- ModPanelPresets
-- **********************************************

ModPanelPresets = ISPanelJoypad:derive("ModPanelPresets")

function ModPanelPresets:new(x, y, width, height)
    local o = ISPanelJoypad:new(x, y, width, height)
    setmetatable(o, self)
    self.__index = self
    o.background = false
    o.saveList = {}
    return o
end

function ModPanelPresets:createChildren()
    self.saveLabel = ISLabel:new(
            DX, 0, BUTTON_HGT, getText("UI_ModManager_Presets_Label"),
            1, 1, 1, 1, UIFont.Small, true
    )
    self:addChild(self.saveLabel)

    self.presetsComboBox = ISComboBox:new(self.saveLabel:getRight() + DX, 0, BUTTON_WDH * 2, BUTTON_HGT, self, self.onSelected)
    self.presetsComboBox.openUpwards = true
    self.presetsComboBox.noSelectionText = getText("UI_ModManager_Presets_NoSelection")
    self:addChild(self.presetsComboBox)

    self.saveButton = ISButton:new(
            self.presetsComboBox:getRight() + DX, 0, BUTTON_WDH, BUTTON_HGT,
            getText("UI_ModManager_Presets_ButtonSave"), self, self.onSavePresetRequest
    )
    self.saveButton.borderColor = { r = 1, g = 1, b = 1, a = 0.1 }
    self.saveButton:setWidthToTitle(BUTTON_WDH / 2)
    self:addChild(self.saveButton)

    self.delButton = ISButton:new(
            self.saveButton:getRight() + DX, 0, BUTTON_WDH, BUTTON_HGT,
            getText("UI_ModManager_Presets_ButtonDel"), self, self.onDeletePresetRequest
    )
    self.delButton.borderColor = { r = 1, g = 1, b = 1, a = 0.1 }
    self.delButton:setWidthToTitle(BUTTON_WDH / 2)
    self.delButton:setEnable(false)
    self:addChild(self.delButton)

    self.fromSaveButton = ISButton:new(
            self.delButton:getRight() + DX, 0, BUTTON_WDH, BUTTON_HGT,
            getText("UI_ModManager_Presets_ButtonLoadFromSave"), self, self.onLoadFromSaveButton
    )
    self.fromSaveButton.borderColor = { r = 1, g = 1, b = 1, a = 0.1 }
    self.fromSaveButton:setWidthToTitle(BUTTON_WDH)
    self:addChild(self.fromSaveButton)
end

function ModPanelPresets:updateOptions()
    self.presetsComboBox:clear()
    self.presetsComboBox:addOptionWithData(getText("UI_ModManager_Presets_List_DisableAll"), "clearAll")
    self.presetsComboBox:addOptionWithData(getText("UI_ModManager_Presets_List_DisableAllExceptFavs"), "clear")
    self.presetsComboBox:addOptionWithData(getText("UI_ModManager_Presets_List_EnableAll"), "enableAll")
    self.presetsComboBox:addOptionWithData(getText("UI_ModManager_Presets_List_EnableAllExceptHidden"), "enable")
    self.presetsComboBox:addOptionWithData(getText("UI_ModManager_Presets_List_Global"), "currentList_global")
    if MainScreen.latestSaveGameMode and MainScreen.latestSaveWorld and #getFullSaveDirectoryTable() > 0 then
        if not MainScreen.latestSaveGameMode == "LastStand" and not MainScreen.latestSaveGameMode == "Multiplayer" then
            getWorld():setGameMode(MainScreen.latestSaveGameMode)
            getWorld():setWorld(MainScreen.latestSaveWorld)
            if getSaveInfo(getWorld():getWorld()).gameMode then
                self.presetsComboBox:addOptionWithData(getText("UI_ModManager_Presets_List_LastSave"), "currentList_lastSave")
            end
        end
    end
    if self.parent.loadGameFolder or self.parent.isNewGame then
        self.presetsComboBox:addOptionWithData(getText("UI_ModManager_Presets_List_CurrentSave"), "currentList_currentSave")
    end
    self:loadPresets()
    for save_name, _ in pairs(self.saveList) do
        if save_name ~= LIST_FAVORITES and save_name ~= LIST_HIDDEN then
            self.presetsComboBox:addOptionWithData(save_name, "user")
        end
    end
    self.presetsComboBox.selected = 0
    self.delButton:setEnable(false)
end

function ModPanelPresets:onSelected()
    local selectedItem = self.presetsComboBox.options[self.presetsComboBox.selected]
    local name, data = selectedItem.text, selectedItem.data

    self.delButton:setEnable(data == "user")

    local activeMods = {}
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
            end
        end
        self:updateOptions()
    elseif data == "enableAll" then
        for _, item in ipairs(self.parent.listBox.items) do
            activeMods[item.item.modInfo:getId()] = true
            item.item.isHidden = false
        end
        self:updateOptions()
    elseif data == "enable" then
        for _, item in ipairs(self.parent.listBox.items) do
            if not item.item.isHidden then
                activeMods[item.item.modInfo:getId()] = true
            end
        end
        self:updateOptions()
    elseif data == "currentList_global" then
        local mods = ActiveMods.getById("default"):getMods()
        for i = 0, mods:size() - 1 do
            activeMods[mods:get(i)] = true
        end
    elseif data == "currentList_lastSave" then
        local latestSave = MainScreen.latestSaveGameMode .. getFileSeparator() .. MainScreen.latestSaveWorld
        local mods = getSaveInfo(latestSave).activeMods:getMods()
        for i = 0, mods:size() - 1 do
            activeMods[mods:get(i)] = true
        end
    elseif data == "currentList_currentSave" then
        local mods = ActiveMods.getById("currentGame"):getMods()
        for i = 0, mods:size() - 1 do
            activeMods[mods:get(i)] = true
        end
    elseif data == "user" then
        for _, m in ipairs(self.saveList[name]) do
            activeMods[m] = true
        end
    end

    self.parent.counters.enabled = 0
    self.parent.counters.favorites = 0
    self.parent.counters.hidden = 0

    for _, item in ipairs(self.parent.listBox.items) do
        if not item.item.isAvailable then
            activeMods[item.item.modInfo:getId()] = false
            -- Remove broken mods from favorites?
            --item.item.isFavorite = false
            item.item.isActive = false
        end
        if item.item.isFavorite then
            self.parent.counters.favorites = self.parent.counters.favorites + 1
        elseif item.item.isHidden then
            self.parent.counters.hidden = self.parent.counters.hidden + 1
        end
        if activeMods[item.item.modInfo:getId()] or (item.item.isFavorite and item.item.isAvailable) then
            item.item.isActive = true
            self.parent.counters.enabled = self.parent.counters.enabled + 1
        else
            item.item.isActive = false
        end
    end

    self.parent.listBox:updateFilter()
end

function ModPanelPresets:onSavePresetRequest()
    local selectedItem = self.presetsComboBox.options[self.presetsComboBox.selected]
    local name = "New"
    if selectedItem and selectedItem.data == "user" then
        name = selectedItem.text
    end

    local modal = ISTextBox:new(
            (getCore():getScreenWidth() / 2) - 140, (getCore():getScreenHeight() / 2) - 90, 280, 180,
            getText("UI_ModManager_Presets_ButtonSave_Request"), name, self, self.onSavePreset
    )
    modal.maxChars = 50
    modal.noEmpty = true
    modal.validateTooltipText = getText("UI_ModManager_Presets_ButtonSave_Warning")
    modal:initialise()
    modal:setCapture(true)
    modal:setAlwaysOnTop(true)
    modal:setValidateFunction(self, self.isValidPresetName)
    modal:addToUIManager()
    modal.entry:focus()
end

function ModPanelPresets:isValidPresetName(text)
    return not text:contains("/") and not text:contains("\\")
            and not text:contains(":") and not text:contains(";")
            and not text:contains("\"") and not text:contains(".")
            and text ~= LIST_FAVORITES and text ~= LIST_HIDDEN
end

function ModPanelPresets:onSavePreset(button)
    if button.internal == "OK" then
        local name = button.parent.entry:getText()
        self.saveList[name] = {}
        for _, item in ipairs(self.parent.listBox.items) do
            if item.item.isActive then
                table.insert(self.saveList[name], item.item.modInfo:getId())
            end
        end
        self:savePresets()
        self:updateOptions()
        self.presetsComboBox:select(name)
        self.delButton:setEnable(true)
    end
end

function ModPanelPresets:onDeletePresetRequest()
    local name = self.presetsComboBox.options[self.presetsComboBox.selected].text
    local modal = ISModalDialog:new(
            (getCore():getScreenWidth() - 230) / 2, (getCore():getScreenHeight() - 120) / 2, 230, 120,
            getText("UI_ModManager_Presets_ButtonDel_Request", name), true, self, self.onDeletePreset
    )
    modal:initialise()
    modal:setCapture(true)
    modal:setAlwaysOnTop(true)
    modal:addToUIManager()
end

function ModPanelPresets:onDeletePreset(button)
    if button.internal == "YES" then
        local name = self.presetsComboBox.options[self.presetsComboBox.selected].text
        self.saveList[name] = nil
        self:savePresets()
        self:updateOptions()
    end
end

function ModPanelPresets:onLoadFromSaveButton()
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
            getText("UI_ModManager_LoadGameScreen_ButtonLoadMods"), loadGameScreen, loadGameScreen.onOptionMouseDown
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
        activeMods[mods:get(i)] = true
    end

    for _, item in ipairs(self.parent.listBox.items) do
        if activeMods[item.item.modInfo:getId()] then
            item.item.isActive = true
            self.parent.counters.enabled = self.parent.counters.enabled + 1
        else
            item.item.isActive = false
        end
    end

    self.parent.listBox:updateFilter()
end

function ModPanelPresets:loadPresets()
    self.saveList = {}
    local file = getFileReader(FILE_MOD_LIST, true)
    local line = file:readLine()
    while line ~= nil do
        -- Split name and list (by first ":", no luautils.split)
        local sep = string.find(line, ":")
        local save_name, save_list = "", ""
        if sep ~= nil then
            save_name = string.sub(line, 0, sep - 1)
            save_list = string.sub(line, sep + 1)
        end
        if save_name ~= "" and save_list ~= "" then
            self.saveList[save_name] = luautils.split(save_list, ";")
        end
        line = file:readLine()
    end
    file:close()
end

function ModPanelPresets:savePresets()
    local file = getFileWriter(FILE_MOD_LIST, true, false)
    for save_name, save_list in pairs(self.saveList) do
        if #save_list > 0 then
            file:write(save_name .. ":" .. table.concat(save_list, ";") .. "\n")
        end
    end
    file:close()
end
