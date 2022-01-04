local esCommon = require("esq.common.01");
local esDieter = {};
local esDieterOptions = require("es.tweaks.options");

function esDieter.getPlayerHunger(player)
    return esCommon.numbers.round(player:getStats():getHunger(), 2);
end

function esDieter.getItemHunger(selectedItem)
    if (selectedItem.getBaseHunger and selectedItem:getBaseHunger()) then
        return esCommon.numbers.round(selectedItem:getBaseHunger(), 2);
    end
    return 0;
end

function esDieter.eat(selectedItem, percentage)
    ISInventoryPaneContextMenu.transferIfNeeded(getPlayer(), selectedItem);
    ISTimedActionQueue.add(ISEatFoodAction:new(getPlayer(), selectedItem, percentage));
end

local baseISInventoryPaneContextMenu = ISInventoryPaneContextMenu.addDynamicalContextMenu;
function ISInventoryPaneContextMenu.addDynamicalContextMenu(selectedItem, context, recipeList, player, containerList)

    if (esDieterOptions.getOption("dieterOn") and esDieter.getItemHunger(selectedItem) < 0) then
        local char = esCommon.player.getPlayerObject(player);
        local charHunger = esDieter.getPlayerHunger(char);
        local itemHunger = esDieter.getItemHunger(selectedItem);
        local percentage = 1;

        if (charHunger + itemHunger < 0) then
            percentage = -1 * esCommon.numbers.round(charHunger / itemHunger, 2);
            if (percentage > 0.95) then percentage = 1.0 end;
        end

        if (charHunger > 0) then
            local itemHungerChange = selectedItem:getHungerChange() * 100;
            local hungerReduce = esCommon.numbers.round((itemHunger * percentage) * 100);

            if (hungerReduce < itemHungerChange) then
                hungerReduce = esCommon.numbers.round(itemHungerChange);
            end

            local consumeAction = selectedItem:getCustomMenuOption() or getText("ContextMenu_Eat");
            local recipeName = getText("IGUI_mo_esqDieter") .. ": " .. consumeAction .. " " .. selectedItem:getDisplayName() .. " (" .. hungerReduce .. ")";
            context:addOption(recipeName, selectedItem, esDieter.eat, percentage);
        end
    end

    baseISInventoryPaneContextMenu(selectedItem, context, recipeList, player, containerList);
end