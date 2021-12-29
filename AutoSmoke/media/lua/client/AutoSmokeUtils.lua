require('AutoSmoke')

AutoSmoke.Utils = {}

function AutoSmoke.Utils.round(number, decimalPlaces)
    local multiplier = 10 ^ (decimalPlaces or 0)
    return math.floor(number * multiplier + 0.5) / multiplier
end

function AutoSmoke.Utils.drainableComparator(item1, item2)
    if instanceof(item1, "DrainableComboItem") then
        return item2:getDrainableUsesInt() - item1:getDrainableUsesInt()
    end
    return true
end

local function keysOfTable(t)
    if type(t) ~= 'table' then return nil end
    local set = {}
    for k, v in ipairs(t) do
        if type(k) == 'number' then
            set[v] = true
        end
    end
    return set
end

function AutoSmoke.Utils.mergeItems(active, supported)
    for _, category in ipairs(supported) do
        local keysInActiveCategory = keysOfTable(active[category])
        for _, itemType in ipairs(supported[category]) do
            if not keysInActiveCategory or not keysInActiveCategory[itemType] then
                if active[category] == nil then
                    active[category] = {}
                    table.insert(active, category)
                end
                table.insert(active[category], itemType)
                active[category][itemType] = supported[category][itemType]
            end
        end
    end
end

function AutoSmoke.Utils.reverseTable(t)
    local reversed = {}
    local itemCount = #t
    for k, v in ipairs(t) do
        reversed[itemCount + 1 - k] = v
    end
    return reversed
end