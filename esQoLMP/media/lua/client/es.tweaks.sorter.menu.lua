local esCommon = require("esq.common.01");
local esSorter = require("es.tweaks.sorter.main");
local esSorterOptions = require("es.tweaks.options");

local ISIPCMCreateMenu = ISInventoryPaneContextMenu.createMenu;
ISInventoryPaneContextMenu.createMenu = function(player, isInPlayerInventory, items, x, y, origin)
    local baseContext = ISIPCMCreateMenu(player, isInPlayerInventory, items, x, y, origin);
    if not(esSorterOptions.getOption("sorterOn") and baseContext) then return baseContext end;

    local allSelectedItems = esCommon.items.getStackFromSelection(items);
    local itemContainer = esCommon.containers.getItem(allSelectedItems:get(0):getContainer(), player);
    local subMenu = baseContext:getNew(baseContext);
    subMenu:addOption(getText("IGUI_ESS_SORT_THIS"), player, esSorter.sort, allSelectedItems:get(0):getContainer());

    if (isInPlayerInventory) then
        subMenu:addOption(getText("IGUI_ESS_SORT_PLAYA"), player, esSorter.playaSort);
    else
        subMenu:addOption(getText("IGUI_ESS_SORT_LOOTS"), player, esSorter.lootSort);
    end

    if (itemContainer ~= nil) then
        if (allSelectedItems:size() > 1) then
            -- add these
            local recipeName = getText("IGUI_ESS_TAG_THESE") .. getText("IGUI_ESS_TO");
            subMenu:addOption(recipeName, allSelectedItems, esSorter.tagAllThis, esSorter.itemKey, player);

            recipeName = getText("IGUI_ESS_TAG_THESE_TYPE") .. getText("IGUI_ESS_TO");
            subMenu:addOption(recipeName, allSelectedItems, esSorter.tagAllThis, esSorter.itemsKey, player);

            -- remove these
            recipeName = getText("IGUI_ESS_UNTAG_THESE") .. getText("IGUI_ESS_FROM");
            subMenu:addOption(recipeName, allSelectedItems, esSorter.unTagAllThis, esSorter.itemKey, player);

            recipeName = getText("IGUI_ESS_UNTAG_THESE_TYPE") .. getText("IGUI_ESS_FROM");
            subMenu:addOption(recipeName, allSelectedItems, esSorter.unTagAllThis, esSorter.itemsKey, player);

        else
            if (esSorter.isItemTagged(allSelectedItems:get(0), esSorter.itemKey, allSelectedItems:get(0):getID(), player)) then
                local recipeName = getText("IGUI_ESS_UNTAG_THIS") .. allSelectedItems:get(0):getDisplayName() .. getText("IGUI_ESS_FROM");
                subMenu:addOption(recipeName, allSelectedItems, esSorter.unTagAllThis, esSorter.itemKey, player);
            else
                local recipeName = getText("IGUI_ESS_TAG_THIS") .. allSelectedItems:get(0):getDisplayName() .. getText("IGUI_ESS_TO");
                subMenu:addOption(recipeName, allSelectedItems, esSorter.tagAllThis, esSorter.itemKey, player);
            end

            if (esSorter.isItemTagged(allSelectedItems:get(0), esSorter.itemsKey, allSelectedItems:get(0):getFullType(), player)) then
                local recipeName = getText("IGUI_ESS_UNTAG_THIS_TYPE") .. allSelectedItems:get(0):getDisplayName() .. getText("IGUI_ESS_FROM");
                subMenu:addOption(recipeName, allSelectedItems, esSorter.unTagAllThis, esSorter.itemsKey, player);
            else
                recipeName = getText("IGUI_ESS_TAG_THIS_TYPE") .. allSelectedItems:get(0):getDisplayName() .. getText("IGUI_ESS_TO");
                subMenu:addOption(recipeName, allSelectedItems, esSorter.tagAllThis, esSorter.itemsKey, player);
            end
        end

    end

    if (allSelectedItems:size() == 1) then
        if (allSelectedItems:get(0):getModData()[esSorter.jsonKey] ~= nil) then
            local recipeName = getText("IGUI_ESS_CLEAR") .. allSelectedItems:get(0):getDisplayName();
            local subOption = subMenu:addOption(recipeName, allSelectedItems:get(0), esSorter.clearTags);

            local toolTip = ISToolTip:new();
            toolTip:initialise();
            toolTip:setName(allSelectedItems:get(0):getDisplayName());
            toolTip.description = esSorter.getTagTooltip(allSelectedItems:get(0));
            if (toolTip.description ~= "") then
                subOption.toolTip = toolTip;
            end
        end
    end

    if (#subMenu.options > 0) then
        baseContext:addSubMenu(baseContext:addOption(getText("IGUI_ESS_MENU")..":"), subMenu);
    end

    return baseContext;
end
