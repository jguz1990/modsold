local esCommon = require("esq.common.01");
local esForceEquip = {};
local esForceEquipOptions = require("es.tweaks.options");

function esForceEquip.isWearable(selectedItem)
    if (selectedItem:canBeEquipped() ~= nil and selectedItem:canBeEquipped() ~= "") then
        return selectedItem:canBeEquipped()
    end
end

function esForceEquip.isValid(selectedItem)
    if not (instanceof(selectedItem, "InventoryContainer")) then return false end;
    if (selectedItem:getContainer():getType() == "floor") then return true end;
    return false;
end

function esForceEquip.equip(selectedItem, location, player)
    if selectedItem:getWorldItem() == nil then return end;
    selectedItem:getWorldItem():getSquare():transmitRemoveItemFromSquare(selectedItem:getWorldItem());
    selectedItem:getWorldItem():getSquare():removeWorldObject(selectedItem:getWorldItem());
    selectedItem:setWorldItem(nil);

    player:getInventory():AddItem(selectedItem);
    ISInventoryPage.renderDirty = true

    if (location == 3) then
        ISTimedActionQueue.add(ISWearClothing:new(player, selectedItem, 50));
    elseif (location == 2) then
        ISTimedActionQueue.add(ISEquipWeaponAction:new(player, selectedItem, 50, false, false));
    elseif (location == 1) then
        ISTimedActionQueue.add(ISEquipWeaponAction:new(player, selectedItem, 50, true, false));
    end
end

local baseISInventoryPaneContextMenu = ISInventoryPaneContextMenu.addDynamicalContextMenu;
function ISInventoryPaneContextMenu.addDynamicalContextMenu(selectedItem, context, recipeList, player, containerList)
    if (esForceEquipOptions.getOption("forceEquipOn") and esForceEquip.isValid(selectedItem)) then
        local playerObj = esCommon.player.getPlayerObject(player);
        local subMenu = context:getNew(context);
        local recipeName = getText("IGUI_mo_esqForceEquip") .. " " .. selectedItem:getDisplayName() .. " (";

        if (esForceEquip.isWearable(selectedItem)) then
            subMenu:addOption(recipeName .. esForceEquip.isWearable(selectedItem) .. ")", selectedItem, esForceEquip.equip, 3, playerObj);
        end

        subMenu:addOption(recipeName .. getText("IGUI_PrimaryTooltip") .. ")", selectedItem, esForceEquip.equip, 1, playerObj);
        subMenu:addOption(recipeName .. getText("IGUI_SecondaryTooltip") .. ")", selectedItem, esForceEquip.equip, 2, playerObj);
        context:addSubMenu(context:addOption(getText("IGUI_mo_esqForceEquip") .. ": "), subMenu);
    end

    baseISInventoryPaneContextMenu(selectedItem, context, recipeList, player, containerList);
end