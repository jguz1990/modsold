local esSorter = {};
local esCommon = require("esq.common.01");

esSorter.jsonKey = "esSort.jsonData";
esSorter.itemKey = "esq.sorter.item";
esSorter.itemsKey = "esq.sorter.items";

function esSorter.getTagTooltip(selectedItem)
    local data = esSorter.getContainerTags(selectedItem);
    local description = "";

    if (data[esSorter.itemKey]) then
        local itemCount = esCommon.utils.sizeOf(data[esSorter.itemKey]);
        if (itemCount > 0) then
            description = getText("IGUI_ESS_UNTAG_THESE") .. " (" .. itemCount .. "):\n";
            local c = 0;
            for k, v in pairs(data[esSorter.itemKey]) do
                c = c + 1;
                if (type(v) == "string") then
                    description = description .. getItemNameFromFullType(v) ..  "\n";
                else
                    description = description .. k ..  "\n";
                end
                if (c > 9) then
                    description = description .. " (...)\n";
                    break;
                end
            end
            description = description .. "\n";
        end
    end

    if (data[esSorter.itemsKey]) then
        local itemCount = esCommon.utils.sizeOf(data[esSorter.itemsKey]);
        if (itemCount > 0) then
            description = description .. getText("IGUI_ESS_UNTAG_THESE_TYPE") .. " (" .. itemCount .. "):\n";
            local c = 0;
            for k, v in pairs(data[esSorter.itemsKey]) do
                c = c + 1;
                description = description .. getItemNameFromFullType(k) ..  "\n";
                if (c > 9) then
                    description = description .. " (...)\n";
                    break;
                end
            end
        end
    end

    return description;
end

function esSorter.getContainerTags(selectedItem)
    if (selectedItem:getCategory() ~= "Container") then return {} end;

    local containerData = esCommon.modData.jsonGet(selectedItem, esSorter.jsonKey) or {};
    local data = {};

    if (containerData[esSorter.itemKey] ~= nil) then
        data[esSorter.itemKey] = containerData[esSorter.itemKey];
    end
    if (containerData[esSorter.itemsKey] ~= nil) then
        data[esSorter.itemsKey] = containerData[esSorter.itemsKey];
    end

    return data;
end

function esSorter.tagThis(selectedItem, keyA, keyB, player)
    local containerItem = esCommon.containers.getItem(selectedItem:getContainer(), player);
    local containerData = esCommon.modData.jsonGet(containerItem, esSorter.jsonKey) or {};
    containerData[keyA] = containerData[keyA] or {}
    containerData[keyA][keyB] = selectedItem:getFullType();
    esCommon.modData.jsonSet(containerItem, containerData, esSorter.jsonKey);
end

function esSorter.tagAllThis(items, keyA, player)
    for i = 0, items:size() - 1 do
        if (keyA == esSorter.itemKey) then
            esSorter.tagThis(items:get(i), keyA, items:get(i):getID(), player);
        else
            esSorter.tagThis(items:get(i), keyA, items:get(i):getFullType(), player);
        end
    end
end

function esSorter.unTagAllThis(items, keyA, player)
    for i = 0, items:size() - 1 do
        if (keyA == esSorter.itemKey) then
            esSorter.unTagThis(items:get(i), keyA, items:get(i):getID(), player);
        else
            esSorter.unTagThis(items:get(i), keyA, items:get(i):getFullType(), player);
        end
    end
end

function esSorter.unTagThis(selectedItem, keyA, keyB, player)
    local containerItem = esCommon.containers.getItem(selectedItem:getContainer(), player);
    local containerData = esCommon.modData.jsonGet(containerItem, esSorter.jsonKey) or {};
    local keyAData = containerData[keyA] or {}

    containerData[keyA] = {};
    for k,v in pairs(keyAData) do
        if (k ~= tostring(keyB)) then
            containerData[keyA][k] = v;
        end
    end

    esCommon.modData.jsonSet(containerItem, containerData, esSorter.jsonKey);
end

function esSorter.clearTags(selectedItem)
    esCommon.modData.jsonSet(selectedItem, {}, esSorter.jsonKey);
end

function esSorter.isItemTagged(selectedItem, keyA, keyB, player)
    local containerItem = esCommon.containers.getItem(selectedItem:getContainer(), player);
    local containerData = esCommon.modData.jsonGet(containerItem, esSorter.jsonKey) or {};

    return (containerData[tostring(keyA)] ~= nil and containerData[tostring(keyA)][tostring(keyB)] ~= nil);
end

function esSorter.getContainersWithTags(player)
    local allContainers = esCommon.containers.getPlayer(player);
    local containerTags = LuaList:new();

    for c = 0, allContainers:size() - 1 do
        local container = allContainers:get(c);
        local containerItems = container:getItems();

        for i = 0, containerItems:size() - 1 do
            local item = containerItems:get(i);
            local itemTags = esSorter.getContainerTags(item);

            if (itemTags[esSorter.itemKey] ~= nil or itemTags[esSorter.itemsKey] ~= nil) then
                containerTags:add(item);
            end
        end
    end

    return containerTags;
end

function esSorter.sort(character, container)
    local player = esCommon.player.getPlayerObject(character);
    local containerWithTags = esSorter.getContainersWithTags(player);
    local invItems = player:getInventory():getItems();
    if (container ~= nil) then invItems = container:getItems() end;

    -- Do Singles
    for i = 0, invItems:size() - 1 do
        local item = invItems:get(i);

        for c = 0, containerWithTags:size() - 1 do
            local thisContainer = containerWithTags:get(c);
            local containerTags = esSorter.getContainerTags(thisContainer);
            if (containerTags[esSorter.itemKey] and containerTags[esSorter.itemKey][tostring(item:getID())] ~= nil) then

                if (item:isEquipped()) then
                    ISInventoryPaneContextMenu.unequipItem(item, esCommon.player.getPlayerNumber(player));
                end

                if (thisContainer:getInventory():hasRoomFor(player, item)) then
                    ISTimedActionQueue.add(
                            ISInventoryTransferAction:new(
                                    player, item,
                                    item:getContainer(),
                                    thisContainer:getInventory()
                            )
                    );
                    break;
                end

            end
        end

    end

    -- Do byTypes
    invItems = player:getInventory():getItems();
    if (container ~= nil) then invItems = container:getItems() end;
    for i = 0, invItems:size() - 1 do
        local item = invItems:get(i);

        for c = 0, containerWithTags:size() - 1 do
            local thisContainer = containerWithTags:get(c);
            local containerTags = esSorter.getContainerTags(containerWithTags:get(c));
            if (not item:isFavorite() and containerTags[esSorter.itemsKey] and containerTags[esSorter.itemsKey][tostring(item:getFullType())] ~= nil) then

                if (item:isEquipped()) then
                    ISInventoryPaneContextMenu.unequipItem(item, esCommon.player.getPlayerNumber(player));
                end

                if (thisContainer:getInventory():hasRoomFor(player, item)) then
                    ISTimedActionQueue.add(
                            ISInventoryTransferAction:new(
                                    player, item,
                                    item:getContainer(),
                                    thisContainer:getInventory()
                            )
                    );
                    break;
                end
            end
        end

    end

end

function esSorter.lootSort(character)
    local allLootContainers = esCommon.containers.getLoot(character);
    for c = 0, allLootContainers:size() - 1 do
        esSorter.sort(character, allLootContainers:get(c));
    end
end

function esSorter.playaSort(character)
    local allLootContainers = esCommon.containers.getPlayer(character);
    for c = 0, allLootContainers:size() - 1 do
        esSorter.sort(character, allLootContainers:get(c));
    end
end

return esSorter;