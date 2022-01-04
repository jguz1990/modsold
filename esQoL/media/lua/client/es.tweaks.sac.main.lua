local esCommon = require("esq.common.01");
local esSacMain = {};

function esSacMain.isBag(selectedItem)
    if (selectedItem:getCategory() ~= "Container") then
        return false;
    end
    if (selectedItem:getType() == "KeyRing") then
        return false;
    end
    return true;
end

function esSacMain.isValidContainer(selectedItem, player)
    if (selectedItem:getContainer():getType() == "none") then return true end;
    if (selectedItem:getContainer():getType() == "floor") then return false end;

    local parentItem = esCommon.containers.getItem(selectedItem:getContainer(), player);
    if (not parentItem) then return true end;

    if (parentItem:getContainer():getType() == "none" or
        parentItem:getContainer():getType() == "floor") then
        return true;
    end

    if (isClient()) then return false end

    return false;
end

function esSacMain.toggleSac(selectedItem)
    local extraEquip = esSacMain.getAttached(selectedItem:getContainer():getItems());
    if (selectedItem:getModData()['esSac.equipped'] == nil) then
        selectedItem:getModData()['esSac.equipped'] = extraEquip:size() + 1;
    else
        selectedItem:getModData()['esSac.equipped'] = nil;
    end
    ISInventoryPage.dirtyUI();
end

function esSacMain.shrink(itemList)
    local itemsReturned = LuaList:new();
    local itemLowest;

    if (itemList:size() == 1) then
        return itemList:get(0);
    end

    itemLowest = itemList:get(0)
    for i = 1, itemList:size() - 1 do
        if (tonumber(itemLowest:getModData()['esSac.equipped']) > tonumber(itemList:get(i):getModData()['esSac.equipped'])) then
            itemsReturned:add(itemLowest);
            itemLowest = itemList:get(i);
        else
            itemsReturned:add(itemList:get(i));
        end
    end

    return itemLowest, itemsReturned;
end

function esSacMain.getAttached(allItems)
    if (not allItems) then return nil end;
    local allAttached = LuaList:new();

    -- filter all bags with attach Index
    for i = 0, allItems:size() - 1 do
        local item = allItems:get(i);
        if (not item:isEquipped() and esSacMain.isBag(item) and (item:getModData()['esSac.equipped'] or nil) ~= nil) then
            allAttached:add(item);
        end
    end

    local sorted = LuaList:new();
    local item;
    local count = 0;
    while (allAttached and allAttached:size() > 0) do
        item, allAttached = esSacMain.shrink(allAttached);
        if (item) then
            sorted:add(item);
        end

        count = count + 1;
        if count > 50 then
            print(">>> esSac has crashed <<<");
            break;
        end
    end

    for i = 0, sorted:size() - 1 do
        sorted:get(i):getModData()['esSac.equipped'] = i + 1;
    end

    return sorted;
end

function esSacMain.getEquippedBags(player)
    local allItems = player:getInventory():getItems();
    local bags = LuaList:new();
    for i = 0, allItems:size() - 1 do
        local item = allItems:get(i);
        if (esSacMain.isBag(item) and item:isEquipped()) then
            bags:add(item);
        end
    end

    return bags;
end

function esSacMain.getExtraLoots(player)
    if (isClient()) then return nil end
    local lootContainers = esCommon.containers.getLoot(player);
    local shortBags = LuaList:new();

    for l = 0, lootContainers:size() - 1 do
        local container = lootContainers:get(l);
        if (container:getType() ~= "floor") then
            local invItems = container:getItems();
            for i = 0, invItems:size() - 1 do
                local item = invItems:get(i);
                if (esSacMain.isBag(item)) then
                    shortBags:add(item);
                end
            end
        end
    end

    return shortBags;
end

return esSacMain;