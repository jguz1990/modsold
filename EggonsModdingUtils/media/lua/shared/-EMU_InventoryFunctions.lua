local function isFloor(container)
    return container:getType() == "floor"
end

local function isKeyRing(container)
    return container:getType() == "KeyRing"
end
local function isMainInventory(container)
    return container:getType() == "none"
end

EggonsMU.functions.getBackPack = function()
    local backpack = getPlayer(0):getClothingItem_Back()
    if backpack then
        return backpack:getItemContainer()
    else
        return nil
    end
end
EggonsMU.functions.getActiveInventoryContainer = function()
    return getPlayerInventory(0).inventoryPane.inventory
end
-- EggonsMU.functions.getSecondaryBag = function()
--     local backpack = getPlayer(0):getClothingItem_Back()
--     if backpack then
--         return backpack:getItemContainer()
--     else
--         return nil
--     end
-- end

EggonsMU.functions.getBackPackItems = function()
    local backpack = getPlayer(0):getClothingItem_Back()
    if backpack then
        return backpack:getItemContainer():getItems()
    else
        return nil
    end
end

function EggonsMU.functions.getCarriedContainers()
    local backpacks = getPlayerInventory(0).backpacks
    local output = {}
    for i, carriedContainer in ipairs(backpacks) do
        if carriedContainer.inventory:getType() ~= "KeyRing" then
            table.insert(output, carriedContainer.inventory)
        end
    end
    return output
end
function EggonsMU.functions.getLootContainers()
    local backpacks = getPlayerLoot(0).backpacks
    local output = {}
    for i, lootContainer in ipairs(backpacks) do
        if lootContainer.inventory:getType() ~= "KeyRing" then
            table.insert(output, lootContainer.inventory)
        end
    end
    return output
end
function EggonsMU.functions.getAllAccessibleContainers()
    local containers = EggonsMU.functions.getCarriedContainers()
    local lootContainers = EggonsMU.functions.getLootContainers()
    for i, container in pairs(lootContainers) do
        table.insert(containers, container)
    end
    return containers
end

EggonsMU.functions.getHotbarItems = function()
    return getPlayerHotbar(0).attachedItems
end

EggonsMU.functions.isEquippedPrimary = function(item)
    local player = getPlayer(0)
    local output
    if not item then
        output = false
    else
        output = player:getPrimaryHandItem() == item
    end
    return output
end
EggonsMU.functions.isACarriedContainer = function(verifiedContainer)
    local playerPreContainers = EggonsMU.functions.getPlayerPreContainers()
    local output = false
    for i, preContainer in ipairs(playerPreContainers) do
        if preContainer.inventory == verifiedContainer then
            output = true
            break
        end
    end
    return output
end

EggonsMU.functions.getPlayerPreContainers = function()
    return getPlayerInventory(0).backpacks
end
EggonsMU.functions.getMainInventory = function()
    local playerPreContainers = EggonsMU.functions.getPlayerPreContainers()
    local output
    for i, preContainer in ipairs(playerPreContainers) do
        if preContainer.inventory:getType() == "none" then
            output = preContainer.inventory
            break
        end
    end
    return output
end
EggonsMU.functions.getMainInventoryItems = function(includeWornItems, includeHotbarItems)
    includeWornItems = includeWornItems or false
    includeHotbarItems = includeHotbarItems or false
    local pseudoinventory = EggonsMU.functions.getMainInventory():getItems()
    local hotbar = getPlayerHotbar(0)
    local output = {}
    for i = 0, pseudoinventory:size() - 1 do
        local item = pseudoinventory:get(i)
        if
            (includeWornItems or not item:isEquipped()) and (includeHotbarItems or not hotbar:isInHotbar(item)) and
                item:getType() ~= "KeyRing"
         then
            table.insert(output, item)
        -- print("type: ", item:getType(), " is equipped ", item:isEquipped())
        end
    end
    -- EggonsMU.printFuckingNormalObject(output, "output")
    return output
end

function EggonsMU.functions.performActionOnItems(itemsList, actionFunction)
    for i, item in pairs(itemsList) do
        actionFunction(item)
    end
end
function EggonsMU.functions.performActionOnItemsInContainers(containersList, actionFunction)
    for i, container in pairs(containersList) do
        EggonsMU.functions.performActionOnItems(container:getItems(), actionFunction)
    end
end

EggonsMU.functions.getItemsInHotbar = function()
    return getPlayerHotbar(0).attachedItems
end

EggonsMU.functions.getWornItems = function()
    return getPlayerHotbar(0).wornItems
end

-- EggonsMU.pseudoInventory = function()
--     local player = getPlayer()
--     return player:getInventory() -- to zwraca mix - polaczony array clothingItems, inventoryContainers i handWeapons
-- end
