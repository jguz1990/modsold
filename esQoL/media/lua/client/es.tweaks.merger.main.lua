local esCommon = require("esq.common.01");
local esMergeOptions = require("es.tweaks.options");
local mergeAnimate = require("esq.animate.01"):new();

function mergeAnimate:doPerform()
    local totalStackUses = esCommon.items.getStackUses(self.extra[1]);
    local usesPerItem = esCommon.numbers.round(1 / self.item:getUseDelta());

    for i=0, self.extra[1]:size() - 1 do
        local item = self.extra[1]:get(i);

        if (totalStackUses > usesPerItem) then
            item:setUsedDelta(1);
            totalStackUses = totalStackUses - usesPerItem;
        elseif(totalStackUses > 0) then
            local delta = totalStackUses * item:getUseDelta();
            item:setUsedDelta(delta);
            totalStackUses = 0;
        else
            item:setUsedDelta(0);
            if (not esMergeOptions.getOption("mergeKeepOn")) then
                item:Use();
            end
        end

    end

    if (isClient()) then
        local merged = esCommon.items.getStackItems(self.item:getFullType(), self.character:getInventory());
        esCommon.items.moveTo(merged, self.extra[2], self.character)
    end
end

local function doMenuMerge(item, itemStack, player)
    local animate = mergeAnimate:new(player, item, 80);
    animate:setExtra({ itemStack, item:getContainer() });

    if (isClient()) then
        esCommon.items.moveTo(itemStack, player:getInventory(), player);
    else
        esCommon.items.moveTo(itemStack, item:getContainer(), player);
    end

    ISTimedActionQueue.add(animate);
end

local function doMenuFill(item, itemStack, player)
    local animate = mergeAnimate:new(player, item, 80);
    local usesPerItem = esCommon.numbers.round(1 / item:getUseDelta());
    local fillUses = usesPerItem - item:getDrainableUsesInt();
    local newStack = LuaList:new();

    newStack:add(item);
    for i = 0, itemStack:size() - 1 do
        local localItem = itemStack:get(i);
        if (localItem ~= item) then
            fillUses = fillUses - localItem:getDrainableUsesInt();
            newStack:add(localItem);
            if (fillUses <= 0) then
                break;
            end
        end
    end

    animate:setExtra({ newStack, item:getContainer() });

    if (isClient()) then
        esCommon.items.moveTo(newStack, player:getInventory(), player);
    else
        esCommon.items.moveTo(newStack, item:getContainer(), player);
    end

    ISTimedActionQueue.add(animate);
end

local function filterDrainable(itemStack)
    local drainables = LuaList:new();
    local selectedItem;

    for i = 0, itemStack:size() - 1 do
        local testItem = itemStack:get(i);
        if testItem:IsDrainable() and testItem:getUseDelta() > 0 and not testItem:isFavorite() then

            if (selectedItem == nil) then
                drainables:add(testItem);
                selectedItem = testItem;
            elseif (selectedItem:getName() == testItem:getName()) then
                drainables:add(testItem);
            end

        end
    end

    return drainables, selectedItem;
end

local ISIPCMCreateMenu = ISInventoryPaneContextMenu.createMenu;
ISInventoryPaneContextMenu.createMenu = function(player, isInPlayerInventory, items, x, y, origin)
    local baseContext = ISIPCMCreateMenu(player, isInPlayerInventory, items, x, y, origin);
    if not (esMergeOptions.getOption("mergeOn") and baseContext) then return baseContext end;

    local thisStack, selectedItem = filterDrainable(esCommon.items.getStackFromSelection(items));
    if thisStack:size() == 0 then return baseContext end;

    local allItems = esCommon.items.getStackItems(selectedItem:getFullType(), esCommon.containers.getAll(player))

    if (allItems:size() > 1) then
        local recipeName = getText("IGUI_menu_esqIC_FILL_THIS") .. " " .. selectedItem:getDisplayName();
        baseContext:addOption(recipeName, selectedItem, doMenuFill, allItems, esCommon.player.getPlayerObject(player));
    end
    if (thisStack:size() > 1) then
        local recipeName = getText("IGUI_menu_esqIC_MERGE_THIS") .. " " .. selectedItem:getDisplayName() .. " (" .. thisStack:size() .. ")";
        baseContext:addOption(recipeName, selectedItem, doMenuMerge, thisStack, esCommon.player.getPlayerObject(player));
    end
    if (allItems:size() > 1) then
        local recipeName = getText("IGUI_menu_esqIC_MERGE_ALL") .. " " .. thisStack:get(0):getDisplayName() .. " (" .. allItems:size() .. ")";
        baseContext:addOption(recipeName, selectedItem, doMenuMerge, allItems, esCommon.player.getPlayerObject(player));
    end

    return baseContext;
end