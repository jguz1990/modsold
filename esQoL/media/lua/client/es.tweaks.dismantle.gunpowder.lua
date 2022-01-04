esSorterAction = esSorterAction or {}
local esDismantle = {};
local esCommon = require("esq.common.01");
local esDismantleOptions = require("es.tweaks.options");
local esDismantleAnimate = require("esq.animate.01"):new();

function esDismantle.onMenuGatherGunPowder(stack, player)
    local char = esCommon.player.getPlayerObject(player);
    esCommon.items.moveTo(stack, char:getInventory(), char);

    local animate = esDismantleAnimate:new(char, stack:get(0), 30);
    animate:setExtra(stack);
    ISTimedActionQueue.add(animate);
end

function esDismantleAnimate:doPerform()
    for i = 0, self.extra:size() - 1 do
        esCommon.items.createItem(
            InventoryItemFactory.CreateItem("Base.GunPowder"),
            self.extra:get(0):getContainer(),
            self.character
        );
    end
    for i = 0, self.extra:size() - 1 do
        esCommon.items.destroyItem(self.extra:get(i));
    end

    esSorterAction.action = "craft";
end

local baseISInventoryPaneContextMenu = ISInventoryPaneContextMenu.addDynamicalContextMenu;
function ISInventoryPaneContextMenu.addDynamicalContextMenu(selectedItem, context, recipeList, player, containerList)

    if (esDismantleOptions.getOption("gunpowderOn")) then
        for i = 0, recipeList:size() - 1 do
            local recipe = recipeList:get(i);

            if (recipe:getResult():getFullType() == "Base.GunPowder") then
                local allItemStack = esCommon.items.getStackItems(selectedItem:getFullType(), selectedItem:getContainer());
                local itemStack = LuaList:new();

                for i = 0, allItemStack:size() - 1 do
                    local item = allItemStack:get(i);
                    if not (item:isFavorite() or item:isEquipped()) then
                        itemStack:add(item);
                    end
                end
                local gunPowder = InventoryItemFactory.CreateItem("Base.GunPowder");
                local recipeName = getText("IGUI_ESQ_COMMON_UI_MAKE") .. " " .. gunPowder:getDisplayName() .. " " ..
                        getText("IGUI_ESQ_COMMON_UI_FROM") .. " " .. selectedItem:getDisplayName() .. " (" .. itemStack:size() .. ")";
                context:addOption(recipeName, itemStack, esDismantle.onMenuGatherGunPowder, player);
            end
        end
    end

    return baseISInventoryPaneContextMenu(selectedItem, context, recipeList, player, containerList);
end

