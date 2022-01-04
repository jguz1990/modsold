local esCommon = require("esq.common.01");
local towelAnimate = require("esq.animate.01"):new();
local esDrierOptions = require("es.tweaks.options");

local function filterTowels(itemStack)
    local towels = LuaList:new();
    local selectedItem = {};
    for i = 0, itemStack:size() - 1 do
        local testItem = itemStack:get(i);
        if (testItem.getReplaceOnDeplete and testItem:getReplaceOnDeplete() and
            string.find(string.lower(testItem:getReplaceOnDeplete()),"wet")) then
            towels:add(testItem);
            selectedItem[testItem:getFullType()] = testItem;
        end
    end
    -- possible to get towel and dish towel
    return towels, selectedItem;
end

local function drier(items, player)
    local wetNow = player:getBodyDamage():getWetness();

    for t = 0, items:size() - 1 do
        local item = items:get(t);

        for u = 1, item:getDrainableUsesInt() do
            wetNow = wetNow - (wetNow / 20);
        end

        ISInventoryPaneContextMenu.transferIfNeeded(player, item)
        local animate = towelAnimate:new(player, item, item:getDrainableUsesInt() * 11);
        animate:setCaloriesModifier(4);
        ISTimedActionQueue.add(animate);

        if (wetNow < 15) then break end;
    end
end

function towelAnimate:doPerform()
    for r = 1, self.item:getDrainableUsesInt() do
        self.character:getBodyDamage():decreaseBodyWetness( self.character:getBodyDamage():getWetness() / 20 );
        self.item:Use();
        self.character:setMetabolicTarget(Metabolics.LightDomestic);
    end
end

local ISIPCMCreateMenu = ISInventoryPaneContextMenu.createMenu;
ISInventoryPaneContextMenu.createMenu = function(player, isInPlayerInventory, items, x, y, origin)
    local baseContext = ISIPCMCreateMenu(player, isInPlayerInventory, items, x, y, origin);
    if not (esDrierOptions.getOption("dieterOn") and baseContext) then return baseContext end;

    local playerObj = esCommon.player.getPlayerObject(player);
    if playerObj:getBodyDamage():getWetness() < 15 then return baseContext end;

    local allSelectedItems = esCommon.items.getStackFromSelection(items);
    local towels, selectedItem = filterTowels(allSelectedItems);

    if (towels:size() > 0) then
        local recipeName = getText("IGUI_mo_esqDrier") .. ": " .. getText("IGUI_ESQ_COMMON_UI_USE") .. " " ..
                getText("IGUI_ESQ_COMMON_UI_SELECTED") .. " " .. getText("IGUI_esqDrier_UntilDried");
        if (esCommon.utils.sizeOf(selectedItem) == 1) then
            recipeName = getText("IGUI_mo_esqDrier") .. ": " .. getText("IGUI_ESQ_COMMON_UI_USE") .. " " ..
                    towels:get(0):getDisplayName() .. " " .. getText("IGUI_esqDrier_UntilDried");
        end
        baseContext:addOption(recipeName, towels, drier, playerObj);
    end

    return baseContext;
end