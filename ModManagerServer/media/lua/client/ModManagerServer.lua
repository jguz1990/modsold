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

ModManager.SERVER_VERSION = "1.0.0"

local FILE_PRESETS_SERVER = "saved_modlists_server.txt"
local VERSION_PRESETS_SERVER = 1

local ILLEGAL_CHARS_SERVER_PRESET_NAME = { '/', '\\', '|', ':', ';', '.', ',', '[', ']' }

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