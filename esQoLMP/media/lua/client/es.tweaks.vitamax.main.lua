local esCommon = require("esq.common.01");
local esVitaMaxConfig = require("es.tweaks.options");

local function takePills(pillStack, amount, player)
    local pillTime = 30;
    if (esVitaMaxConfig.getOption("vitamaxFast")) then pillTime = 15; end

    for ps = 0, pillStack:size() - 1 do
        if (amount > 0) then
            local bottle = pillStack:get(ps);

            for p = 1, bottle:getDrainableUsesInt() do
                ISInventoryPaneContextMenu.transferIfNeeded(player, bottle)
                ISTimedActionQueue.add(ISTakePillAction:new(player, bottle, pillTime));
                amount = amount - 1;
                if amount < 1 then break end;
            end

        else
            break;
        end

    end
end

local function filterPills(itemStack)
    local pills = LuaList:new();
    for i = 0, itemStack:size() - 1 do
        local testItem = itemStack:get(i);
        if (testItem:getFullType() == "Base.PillsVitamins") then
            pills:add(testItem);
        end
    end
    return pills;
end

local ISIPCMCreateMenu = ISInventoryPaneContextMenu.createMenu;
ISInventoryPaneContextMenu.createMenu = function(player, isInPlayerInventory, items, x, y, origin)
    local baseContext = ISIPCMCreateMenu(player, isInPlayerInventory, items, x, y, origin);
    if not (esVitaMaxConfig.getOption("vitamaxOn") and baseContext) then return baseContext end;

    local allSelectedItems = filterPills(esCommon.items.getStackFromSelection(items));
    if (allSelectedItems:size() > 0) then
        local char = esCommon.player.getPlayerObject(player);
        local charFatigue = esCommon.numbers.round(char:getStats():getFatigue(), 2);
        local itemFatigue = esCommon.numbers.round(allSelectedItems:get(0):getFatigueChange(), 2);

        local pillsCount = esCommon.items.getStackUses(allSelectedItems);
        local pillRequired = esCommon.numbers.round(charFatigue / itemFatigue) * - 1;
        if (pillRequired > pillsCount) then pillRequired = pillsCount end;

        if (pillRequired > 0) then
            local recipeName = getText("IGUI_mo_esqVitaMax") .. ": " .. getText("ContextMenu_Take_pills") .. " (" .. pillRequired .. "x) ";
            baseContext:addOption(recipeName, allSelectedItems, takePills, pillRequired, char);
        end
    end

    return baseContext;
end

