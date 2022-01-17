ModTracker = ModTracker or {}
ModTracker.mods = {}

local FILE = "modmanager-mods.txt"
local VERSION = 1

function ModTracker.indexOf(modId)
    for index, v in ipairs(ModTracker.mods) do
        if v == modId then
            return index
        end
    end
    return -1
end

function ModTracker.checkMods()
    -- Read mods
    local version = 0
    local storedMods = {}
    local file = getFileReader(FILE, true)
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
    file = getFileWriter(FILE, true, false)
    file:write("VERSION=" .. tostring(VERSION) .. "\r\n")
    file:write(table.concat(newList, ";"))
    file:close()

    ModTracker.mods = newList
end

Events.OnGameBoot.Add(ModTracker.checkMods)