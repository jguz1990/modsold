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

ModManagerUtils = {}

---
---Checks an element's existence in a list.
---@param tbl table the list to search in.
---@param element any the element to look for.
---@return number index if the list contains the specified element, nil otherwise
function ModManagerUtils.indexOf(tbl, element)
    for i = 1, #tbl do
        if tbl[i] == element then return i end
    end
    return nil
end

---
---Makes a deep copy of an object.
---Doesn't handle metatables and recursive tables.
---@param o any the object to copy.
---@return any copy of the object
function ModManagerUtils.deepCopy(o)
    local copy
    if type(o) == 'table' then
        copy = {}
        for k, v in pairs(o) do
            copy[ModManagerUtils.deepCopy(k)] = ModManagerUtils.deepCopy(v)
        end
    else
        copy = o
    end
    return copy
end

-- igv, Rutrus https://stackoverflow.com/a/32660766
function ModManagerUtils.tableEquals(o1, o2)
    local ignore_mt = true
    if o1 == o2 then return true end
    local o1Type = type(o1)
    local o2Type = type(o2)
    if o1Type ~= o2Type then return false end
    if o1Type ~= 'table' then return false end

    if not ignore_mt then
        local mt1 = getmetatable(o1)
        if mt1 and mt1.__eq then
            --compare using built in method
            return o1 == o2
        end
    end

    local keySet = {}
    for key1, value1 in pairs(o1) do
        local value2 = o2[key1]
        if value2 == nil or ModManagerUtils.tableEquals(value1, value2, ignore_mt) == false then
            return false
        end
        keySet[key1] = true
    end
    for key2, _ in pairs(o2) do
        if not keySet[key2] then return false end
    end
    return true
end

function ModManagerUtils.openWorkshopLink(workshopID)
    if isSteamOverlayEnabled() then
        activateSteamOverlayToWorkshopItem(workshopID)
    else
        openUrl(string.format("https://steamcommunity.com/sharedfiles/filedetails/?id=%s", workshopID))
    end
end

function ModManagerUtils.openUrl(url)
    if isSteamOverlayEnabled() then
        activateSteamOverlayToWebPage(url)
    else
        openUrl(url)
    end
end