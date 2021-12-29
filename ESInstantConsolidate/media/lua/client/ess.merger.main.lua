local esCommon = require("esq.common.01");
local esMergeOptions = require("ess.merger.options");
local mergeAnimate = require("esq.animate.01"):new();

function mergeAnimate:doPerform()
    local totalStackUses = esCommon.items.getStackUses(self.extra);
    local usesPerItem = esCommon.numbers.round(1 / self.item:getUseDelta());

    for i=0, self.extra:size() - 1 do
        local item = self.extra:get(i);

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
end

local function doMenuMerge(item, itemStack, player)
    local animate = mergeAnimate:new(player, item, 80);
    animate:setExtra(itemStack);

    esCommon.items.moveTo(itemStack, item:getContainer(), player)
    ISTimedActionQueue.add(animate);
end

local function filterDrainable(itemStack)
    local drainables = LuaList:new();
    local selectedItem;

    for i = 0, itemStack:size() - 1 do
        local testItem = itemStack:get(i);
        if testItem:IsDrainable() and not testItem:isFavorite() then

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

    if (thisStack:size() > 1) then
        local recipeName = getText("UI_mo_InstantConsolidate_MERGE_THIS") .. " " .. selectedItem:getDisplayName() .. " (" .. thisStack:size() .. ")";
        baseContext:addOption(recipeName, selectedItem, doMenuMerge, thisStack, esCommon.player.getPlayerObject(player));
    end
    if (allItems:size() > 1) then
        local recipeName = getText("UI_ESIC_CONSOLIDATE_THIS_ITEM") .. " " .. thisStack:get(0):getDisplayName() .. " (" .. allItems:size() .. ")";
        baseContext:addOption(recipeName, selectedItem, doMenuMerge, allItems, esCommon.player.getPlayerObject(player));
    end

    return baseContext;
end

local baseISInventoryPane = ISInventoryPane.drawItemDetails;
function ISInventoryPane:drawItemDetails(item, y, xoff, yoff, red)

    if (esMergeOptions.getOption("mergeOn") and item ~= nil and instanceof(item, "Drainable")) then
        local maxUses = esCommon.numbers.round(1 / item:getUseDelta());
        local usesLeft = item:getDrainableUsesInt();

        local hdrHgt = self.headerHgt
        local top = hdrHgt + y * self.itemHgt + yoff
        local fgBar = {r=0.0, g=0.6, b=0.0, a=0.7}
        local fgText = {r=0.6, g=0.8, b=0.5, a=0.6}
        local text = getText("IGUI_invpanel_Remaining") .. ": "..usesLeft.."/"..maxUses;
        self:drawTextAndProgressBar(text, item:getUsedDelta(), xoff, top, fgText, fgBar)
    else
        baseISInventoryPane(self,item, y, xoff, yoff, red);
    end

end
