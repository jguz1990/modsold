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

local semver = require('MMSemver')

ModManager = {
    ID = "ModManager",
    VERSION = "2.0.0",
    PRESET_FAVORITES = "mmFavorites",
    PRESET_HIDDEN = "mmHidden",
    SETTINGS_CLIENT = "client",
    SETTINGS_SERVER = "server"
}

local FILE_SETTINGS = "modmanager.ini"
local FILE_MODS = "modmanager-mods.txt"
local FILE_CHANGELOG = "changelog.txt"
local FILE_CUSTOM_TAGS = "saved_modtags.txt"
local FILE_PRESETS = "saved_modlists.txt"
local FILE_PRESETS_SERVER = "saved_modlists_server.txt"

local VERSION_CUSTOM_TAGS = 1
local VERSION_MODS = 1
local VERSION_PRESETS = 2
local VERSION_PRESETS_SERVER = 1
local VERSION_SETTINGS = 2

local ILLEGAL_CHARS_CUSTOM_TAGS = { '/', '\\', '|', ':', ';', '.' }
local ILLEGAL_CHARS_PRESET_NAME = { '/', '\\', '|', ':', ';', '.', ',' }
local ILLEGAL_CHARS_SERVER_PRESET_NAME = { '/', '\\', '|', ':', ';', '.', ',', '[', ']' }

local Migration = {
    ---@deprecated
    FILE_PRESETS_V1 = "saved_modlist.txt",
    ---@deprecated
    PRESET_FAVORITES_V1 = "modmanager-favorites",
    ---@deprecated
    PRESET_HIDDEN_V1 = "modmanager-hidden"
}

local settingsDefault = {
    client = {
        version = 0,
        filterFromWorkshop = true,
        filterFromLocal = true,
        filterWithMaps = true,
        filterWithoutMaps = true,
        filterTranslated = true,
        filterNotTranslated = true,
        filterAvailable = true,
        filterNotAvailable = true,
        filterActive = true,
        filterNotActive = true,
        filterNormal = true,
        filterFavorite = true,
        filterHidden = false,
        orderName = true,
        orderActive = false,
        orderRecent = false,
        orderAsc = true,
        orderDesc = false,
        showCustomModIcons = true,
        showGetModsButton = true,
        showNagPanel = true,
        presetsCompatV2 = false,
    },
    server = {
        version = 0,
        filterFromWorkshop = true,
        filterFromLocal = false,
        filterWithMaps = true,
        filterWithoutMaps = true,
        filterTranslated = true,
        filterNotTranslated = true,
        filterAvailable = true,
        filterNotAvailable = true,
        filterActive = true,
        filterNotActive = true,
        filterNormal = true,
        filterFavorite = true,
        filterHidden = false,
        orderName = true,
        orderActive = false,
        orderRecent = false,
        orderAsc = true,
        orderDesc = false,
    }
}

function ModManager:new()
    local o = {}
    ModManager.instance = o
    setmetatable(o, self)
    self.__index = self

    self.modsByRecent = {}
    self.settings = {}
    self.presets = {
        mmFavorites = {},
        mmHidden = {}
    }
    self.customTags = {} -- { modId = { tag, tag, tag, ... }, modId = { tag, tag, tag, ... }, ... }
    self.serverPresets = {} -- { name = { WorkshopItems = { workshopID1, ... }, Mods = { modID1, ... } }, ... }

    self:trackMods()
    self:loadSettings()
    self:loadPresets()
    self:loadCustomTags()

    --[[
    self.settingsCopy = {}
    self.changelog = "changelog"
    ]]
    return o
end

-- ******************************
-- ModManager: Settings
-- ******************************

function ModManager:loadSettings()
    self.settings = ModManagerUtils.deepCopy(settingsDefault)
    self.settingsCopy = {}

    local version = 0
    local category = ""
    local file = getFileReader(FILE_SETTINGS, true)
    local line = file:readLine()
    while line ~= nil do
        if luautils.stringStarts(line, "VERSION=") then
            version = tonumber(string.split(line, "=")[2])
        elseif version == VERSION_SETTINGS then
            line = line:trim()
            if not string.match(line, "^#") then
                if line ~= "" then
                    local k, v = line:match("^([^=%[]+)=([^=]+)$")
                    if k then
                        k, v = k:trim(), v:trim()
                        if v == "true" then
                            v = true
                        elseif v == "false" then
                            v = false
                        end
                        if category ~= "" then
                            self.settings[category][k] = v
                        else
                            self.settings[k] = v
                        end
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
        end
        line = file:readLine()
    end
    file:close()

    self.settingsCopy = ModManagerUtils.deepCopy(self.settings)
end

function ModManager:saveSettings()
    -- To avoid unnecessary write operations
    if ModManagerUtils.tableEquals(self.settings, self.settingsCopy) then return end
    self.settingsCopy = ModManagerUtils.deepCopy(self.settings)

    local file = getFileWriter(FILE_SETTINGS, true, false)
    file:write("# Mod Manager settings\r\n")
    file:write("# Do not modify\r\n\r\n")
    file:write("VERSION=" .. tostring(VERSION_SETTINGS) .. "\r\n")

    for k, v in pairs(self.settings) do
        if settingsDefault[k] ~= nil then
            if type(v) == "table" then
                file:write("\r\n[" .. k .. "]\r\n")
                for tk, tv in pairs(v) do
                    if settingsDefault[k][tk] ~= nil then
                        file:write(tk .. '=' .. tostring(tv) .. "\r\n")
                    end
                end
            else
                file:write(k .. '=' .. tostring(v) .. "\r\n")
            end
        end
    end
    file:close()
end

function ModManager:setTickBoxSelectionFromSettings(tickBox, category, applyDefault)
    local settings = applyDefault and settingsDefault or self.settings
    for index = 1, tickBox.optionCount - 1 do
        local value = settings[category][tickBox.optionData[index]]
        if value == nil then
            value = tickBox.selected[index]
            settings[category][tickBox.optionData[index]] = value
        end
        tickBox:setSelected(index, value)
    end
end

function ModManager:updateSettingsFromTickBox(tickBox, category)
    for index = 1, tickBox.optionCount - 1 do
        local value = tickBox.selected[index] ~= nil and tickBox.selected[index] or false
        self.settings[category][tickBox.optionData[index]] = value
    end
end

-- ******************************
-- ModManager: Presets
-- ******************************

function ModManager:loadPresets()
    Migration.presetsToVersion2(self)

    self.presets = {
        mmFavorites = {},
        mmHidden = {}
    }

    local version = 0
    local file = getFileReader(FILE_PRESETS, true)
    local line = file:readLine()
    while line ~= nil do
        if luautils.stringStarts(line, "VERSION=") then
            version = tonumber(string.split(line, "=")[2])
        elseif version == VERSION_PRESETS then
            -- Split name and list (by first ":", no luautils.split)
            local sep = string.find(line, ":")
            local name, list = "", ""
            if sep ~= nil then
                name = string.sub(line, 0, sep - 1)
                list = string.sub(line, sep + 1)
            end
            if name ~= "" and list ~= "" then
                self.presets[name] = luautils.split(list, ";")
            end
        end
        line = file:readLine()
    end
    file:close()
end

function ModManager:savePresets()
    local file = getFileWriter(FILE_PRESETS, true, false)
    file:write("VERSION=" .. tostring(VERSION_PRESETS) .. "\r\n")
    for name, list in pairs(self.presets) do
        if #list > 0 then
            file:write(name .. ":" .. table.concat(list, ";") .. "\n")
        end
    end
    file:close()
end

function ModManager.isValidPresetName(_, text)
    for _, char in ipairs(ILLEGAL_CHARS_PRESET_NAME) do
        if text:contains(char) then
            return false
        end
    end
    return text ~= ModManager.PRESET_FAVORITES and text ~= ModManager.PRESET_HIDDEN
end

function ModManager.getPresetNameIllegalCharsString()
    return table.concat(ILLEGAL_CHARS_PRESET_NAME, "  ")
end

-- Compatibility with pre-v2.0.0 (presets version <= 1)
function Migration.presetsToVersion2(manager)
    if not manager.settings.client.presetsCompatV2 then
        manager.settings.client.presetsCompatV2 = true
        manager:saveSettings()

        local file = getFileReader(FILE_PRESETS, false)
        if file then
            file:close()
            return
        end

        manager.presets = {
            mmFavorites = {},
            mmHidden = {}
        }
        file = getFileReader(Migration.FILE_PRESETS_V1, false)
        if file then
            local line = file:readLine()
            while line do
                -- Split name and list (by first ":", no luautils.split)
                local sep = string.find(line, ":")
                local name, list = "", ""
                if sep ~= nil then
                    name = string.sub(line, 0, sep - 1)
                    list = string.sub(line, sep + 1)
                end
                if name ~= "" and list ~= "" then
                    if name == Migration.PRESET_FAVORITES_V1 then
                        name = ModManager.PRESET_FAVORITES
                    elseif name == Migration.PRESET_HIDDEN_V1 then
                        name = ModManager.PRESET_HIDDEN
                    end

                    manager.presets[name] = luautils.split(list, ";")
                end
                line = file:readLine()
            end
            file:close()

            manager:savePresets()
        end
    end
end

-- ******************************
-- ModManager: Server Presets
-- ******************************

function ModManager:loadServerPresets()
    self.serverPresets = {}
    local name = ""
    local version = 0
    local file = getFileReader(FILE_PRESETS_SERVER, true)
    local line = file:readLine()
    while line ~= nil do
        if luautils.stringStarts(line, "VERSION=") then
            version = tonumber(string.split(line, "=")[2])
        elseif version == VERSION_PRESETS_SERVER then
            line = line:trim()
            if line ~= "" then
                local k, v = line:match("^([^=%[]+)=([^=]+)$")
                if k then
                    self.serverPresets[name][k] = luautils.split(v, ";")
                else
                    local t = line:match("^%[([^%[%]%%]+)%]$")
                    if t then
                        name = t:trim()
                        if not self.serverPresets[name] then
                            self.serverPresets[name] = {}
                        end
                    end
                end
            end
        end
        line = file:readLine()
    end
    file:close()
end

function ModManager:saveServerPresets()
    local file = getFileWriter(FILE_PRESETS_SERVER, true, false)
    file:write("VERSION=" .. tostring(VERSION_PRESETS_SERVER) .. "\r\n")
    for name, config in pairs(self.serverPresets) do
        file:write("[" .. name .. "]\r\n")
        for key, values in pairs(config) do
            file:write(key .. '=' .. table.concat(values, ";") .. "\r\n")
        end
    end
    file:close()
end

function ModManager.isValidServerPresetName(_, text)
    for _, char in ipairs(ILLEGAL_CHARS_SERVER_PRESET_NAME) do
        if text:contains(char) then
            return false
        end
    end
    return true
end

function ModManager.getServerPresetNameIllegalCharsString()
    return table.concat(ILLEGAL_CHARS_SERVER_PRESET_NAME, "  ")
end

-- ******************************
-- ModManager: Custom Tags
-- ******************************

function ModManager:loadCustomTags()
    self.customTags = {}
    local version = 0
    local file = getFileReader(FILE_CUSTOM_TAGS, true)
    local line = file:readLine()
    while line ~= nil do
        if luautils.stringStarts(line, "VERSION=") then
            version = tonumber(string.split(line, "=")[2])
            --elseif version == VERSION_CUSTOM_TAGS then
        else
            -- Split modId and tags (by first ":", no luautils.split)
            local sep = string.find(line, ":")
            local modId, tags = "", ""
            if sep ~= nil then
                modId = string.sub(line, 0, sep - 1)
                tags = string.sub(line, sep + 1)
            end
            if modId ~= "" and tags ~= "" then
                self.customTags[modId] = luautils.split(tags, ",")
            end
        end
        line = file:readLine()
    end
    file:close()
end

function ModManager:saveCustomTags()
    local file = getFileWriter(FILE_CUSTOM_TAGS, true, false)
    file:write("VERSION=" .. tostring(VERSION_CUSTOM_TAGS) .. "\r\n")
    for modId, tags in pairs(self.customTags) do
        if #tags > 0 then
            file:write(modId .. ":" .. table.concat(tags, ",") .. "\n")
        end
    end
    file:close()
end

function ModManager.isValidCustomTags(_, text)
    for _, char in ipairs(ILLEGAL_CHARS_CUSTOM_TAGS) do
        if text:contains(char) then
            return false
        end
    end
    return true
end

function ModManager.getCustomTagsIllegalCharsString()
    return table.concat(ILLEGAL_CHARS_CUSTOM_TAGS, "  ")
end

-- ******************************
-- ModManager: Track Mods
-- ******************************

function ModManager:indexInRecent(modId)
    for index, v in ipairs(self.modsByRecent) do
        if v == modId then
            return index
        end
    end
    return -1
end

function ModManager:trackMods()
    -- Read mods
    local version = 0
    local storedMods = {}
    local file = getFileReader(FILE_MODS, true)
    local line = file:readLine()
    while line ~= nil do
        if luautils.stringStarts(line, "VERSION=") then
            version = tonumber(string.split(line, "=")[2])
            --elseif version == VERSION_SETTINGS then
        else
            storedMods = luautils.split(line, ";")
        end
        line = file:readLine()
    end
    file:close()

    -- Get all installed mods
    local loadedMods = {}
    local directories = getModDirectoryTable()
    for _, directory in ipairs(directories) do
        local modInfo = getModInfo(directory)
        if modInfo then
            local modId = modInfo:getId()
            table.insert(loadedMods, modId)
        end
    end

    -- Check for changes
    -- Convert arrays to sets
    local oldMods, newMods = {}, {}
    for _, modId in ipairs(storedMods or {}) do
        oldMods[modId] = true
    end
    for _, modId in ipairs(loadedMods) do
        newMods[modId] = true
    end

    -- Diff
    local addMods, delMods = {}, {}
    for modId, _ in pairs(oldMods) do
        if not newMods[modId] then
            delMods[modId] = true
        end
    end
    for modId, _ in pairs(newMods) do
        if not oldMods[modId] then
            table.insert(addMods, modId)
        end
    end

    -- Create new list of mods
    local newList = {}
    for _, modId in ipairs(storedMods) do
        if not delMods[modId] then
            table.insert(newList, modId)
        end
    end
    for _, modId in ipairs(addMods) do
        table.insert(newList, modId)
    end

    -- Save mods
    file = getFileWriter(FILE_MODS, true, false)
    file:write("VERSION=" .. tostring(VERSION_MODS) .. "\r\n")
    file:write(table.concat(newList, ";"))
    file:close()

    self.modsByRecent = newList
end

--Events.OnGameBoot.Add(ModManager.trackMods)

-- ******************************
-- ModManager: Changelog
-- ******************************

function ModManager:loadChangelog(id)
    local s = ""
    local file = getModFileReader(id, FILE_CHANGELOG, false)
    local line = file:readLine()
    while line ~= nil do
        --if string.match(line, "^v+[0-9]") then
        if string.match(line, "^## ") then
            s = s .. string.gsub(line, "^## ", " <SIZE:large> ") .. " <LINE> <SIZE:small> "
        elseif string.match(line, "^### ") then
            s = s .. string.gsub(line, "^### ", " <SIZE:medium> ") .. " <LINE> <SIZE:small> "
        else
            s = s .. line .. " <LINE> "
        end
        line = file:readLine()
    end
    file:close()

    s = string.gsub(s, "%[", "")
    s = string.gsub(s, "%]", "")
    --s = string.gsub(s, "%[", " <RGB:0.2,0.4,0.8> ")
    --s = string.gsub(s, "%]", "  <RGB:1,1,1> ")

    self.changelog = s
end

function ModManager:onCloseChangelog(id)
    self.changelog = nil
    if id == ModManager.ID then
        self.settings.client.version = ModManager.VERSION
    elseif id == ModManager.Server.ID then
        self.settings.server.version = ModManager.Server.VERSION
    end
    self:saveSettings()
end

-- ******************************
-- ModManager: Version
-- ******************************

function ModManager:isNewVersion(id)
    if id == ModManager.ID then
        local version = self.settings.client.version or 0
        return ModManager.compareVersions(ModManager.VERSION, version)
    elseif id == ModManager.Server.ID then
        local version = self.settings.server.version or 0
        return ModManager.compareVersions(ModManager.Server.VERSION, version)
    end
end

---Compares two version strings.
---Semantic Versioning 2.0.0
---@param v1 string Version 1
---@param v2 string Version 2
---@return boolean true if v1 > v2
function ModManager.compareVersions(v1, v2)
    return semver(v1) > semver(v2)
end
