local esSacOption = require("es.tweaks.options");
local esSacMain = require("es.tweaks.sac.main");
local esCommon = require("esq.common.01");

local esSacEvents = {};

function esSacEvents.attachEvent(inventoryPage, state)
    if state ~= "buttonsAdded" then return end;
    if (not esSacOption.getOption("sacOn")) then return end;
    local playerObj = esCommon.player.getPlayerObject(inventoryPage.player);

    if (inventoryPage.onCharacter) then
        local invAttached = esSacMain.getAttached(playerObj:getInventory():getItems());
        esSacEvents.addShortCuts(invAttached, inventoryPage);

        local eqBags = esSacMain.getEquippedBags(playerObj);
        for b = 0, eqBags:size() - 1 do
            esSacEvents.addShortCuts(esSacMain.getAttached(eqBags:get(b):getInventory():getItems()), inventoryPage);
        end
        esSacEvents.addCapacityInfo(inventoryPage, playerObj);
    else
        esSacEvents.addShortCuts(esSacMain.getAttached(esSacMain.getExtraLoots(playerObj)), inventoryPage);
    end
end

function esSacEvents.addShortCuts(extraEquip, inventoryPage)
    if (extraEquip == nil) then return end;
    for i = 0, extraEquip:size() - 1 do
        local item = extraEquip:get(i);
        local containerButton = inventoryPage:addContainerButton(item:getInventory(), item:getTex(), item:getName(), item:getName());
        if item:getVisual() and item:getClothingItem() then
            local tint = item:getVisual():getTint(item:getClothingItem())
            containerButton:setTextureRGBA(tint:getRedFloat(), tint:getGreenFloat(), tint:getBlueFloat(), 1.0);
            containerButton:setBorderRGBA(tint:getRedFloat(), tint:getGreenFloat(), tint:getBlueFloat(), 1.0);
        end
    end
end

function esSacEvents.addCapacityInfo(inventoryPage, player)
    for i,v in ipairs(inventoryPage.backpacks) do
        if (v.tooltip) then
            local currentWeight = esCommon.numbers.round(v.inventory:getContentsWeight(), 2);
            local currentPercent = currentWeight / v.inventory:getCapacity();
            local displayPercent = esCommon.numbers.round((currentPercent * 100), 2);
            displayPercent = esCommon.numbers.padding(displayPercent,2,2);

            local rgb = esCommon.volume.getRGBTag(currentPercent);
            v.tooltip = rgb.red .. v.tooltip .. " <LINE> <RGB:1,1,1> " .. currentWeight .. " / " .. v.inventory:getEffectiveCapacity(player);
        end
    end
end

local ISITActionValid = ISInventoryTransferAction.isValid;
function ISInventoryTransferAction:isValid()
    if (esSacOption.getOption("sacOn") and not esSacOption.getOption("sacIgnore")) then
        if (self.destContainer:getType() == "none" or
                self.destContainer:getType() == "floor") then
            return ISITActionValid(self);
        end

        local destItem = esCommon.containers.getItem(self.destContainer, self.character)
        if (not destItem) then return ISITActionValid(self) end;

        local parentContainer = destItem:getContainer();
        if (parentContainer:getType() == "none" or
                parentContainer:getType() == "floor") then
            return ISITActionValid(self);
        end

        if (self.destContainer:hasRoomFor(self.character, self.item) and
                parentContainer:hasRoomFor(self.character, self.item)) then
            return ISITActionValid(self);
        end

        return false;
    end

    return ISITActionValid(self);
end

local baseISInventoryPaneContextMenu = ISInventoryPaneContextMenu.addDynamicalContextMenu;
function ISInventoryPaneContextMenu.addDynamicalContextMenu(selectedItem, context, recipeList, player, containerList)

    if (esSacOption.getOption("sacOn") and esSacMain.isBag(selectedItem) and esSacMain.isValidContainer(selectedItem, player)) then
        local onOff = selectedItem:getModData()["esSac.equipped"] == nil;
        local recipeName = getText("IGUI_mo_esqSacToggle") .. " " .. selectedItem:getDisplayName();
        if (onOff) then
            recipeName = recipeName .. " " .. getText("IGUI_ESQ_COMMON_UI_ON");
        else
            recipeName = recipeName .. " " .. getText("IGUI_ESQ_COMMON_UI_OFF");
        end
        context:addOption(recipeName, selectedItem, esSacMain.toggleSac);
    end

    baseISInventoryPaneContextMenu(selectedItem, context, recipeList, player, containerList);
end

Events.OnRefreshInventoryWindowContainers.Add(esSacEvents.attachEvent);