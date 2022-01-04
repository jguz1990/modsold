local esCommon = require("esq.common.01");
local fixerAnimate = require("esq.animate.01"):new();
local fixerOptions = require("es.tweaks.options");


local function isMeleeWeapon(selectedItem)
    return selectedItem:IsWeapon() and not selectedItem:isRanged();
end

local function getRequireMats(selectedIteme, containers)
    local requiredMats = 2;
    local fixingOptions = {};
    local stack, uses;
    if ((selectedIteme:getCondition() / selectedIteme:getConditionMax()) > 0.5) then requiredMats = 1 end;

    stack = esCommon.items.getStackItems("Base.Woodglue", containers);
    uses  = esCommon.items.getStackUses(stack);
    if (uses >= requiredMats) then
        table.insert(fixingOptions, { stack, requiredMats, uses });
    end
    stack = esCommon.items.getStackItems("Base.DuctTape", containers);
    uses  = esCommon.items.getStackUses(stack);
    if (uses >= requiredMats) then
        table.insert(fixingOptions, { stack, requiredMats, uses });
    end
    stack = esCommon.items.getStackItems("Base.Glue", containers);
    uses  = esCommon.items.getStackUses(stack);
    if (uses >= requiredMats) then
        table.insert(fixingOptions, { stack, requiredMats, uses });
    end

    stack = esCommon.items.getStackItems("Base.Scotchtape", containers);
    uses  = stack:size();
    if (uses >= (requiredMats * 2)) then
        table.insert(fixingOptions, { stack, (requiredMats * 2), uses });
    end

    return fixingOptions;
end

local function canBeFixedWith(selectedItem, testItem)
    if (selectedItem:getCondition() >= selectedItem:getConditionMax()) then return false end;
    if (not isMeleeWeapon(selectedItem)) then return false end;

    if (testItem) then
        if (testItem == selectedItem) then
            return false;
        end
        if (testItem:getFullType() ~= selectedItem:getFullType()) then
            return false;
        end
        if (testItem:getCondition() + selectedItem:getCondition() > (selectedItem:getConditionMax() * 2)) then
            return false;
        end
        if (testItem:isEquipped()) then
            return false;
        end
        if (testItem:isFavorite()) then
            return false;
        end
        if (selectedItem:getCondition() + testItem:getCondition()) > (selectedItem:getConditionMax() * 2) then
            return false
        end
    end

    return true;
end

local function fixThis(selectedItem, withItem, consume, player)
    local ttl = selectedItem:getWeight() * 50;
    if (ttl > 200) then ttl = 200 end;
    local animate = fixerAnimate:new(player, selectedItem, ttl);

    ISInventoryPaneContextMenu.transferIfNeeded(player, selectedItem)
    ISInventoryPaneContextMenu.transferIfNeeded(player, withItem)

    local glue = LuaList:new();
    local volume = 0;
    for i=0, consume[1]:size()-1 do
        local item = consume[1]:get(i);
        if (item) then

            if (item.getDrainableUsesInt) then
                volume = volume + item:getDrainableUsesInt();
                glue:add(item);
                ISInventoryPaneContextMenu.transferIfNeeded(player, item)
            else
                volume = volume + 1;
                glue:add(item);
                ISInventoryPaneContextMenu.transferIfNeeded(player, item)
            end

            if (volume >= consume[2]) then
                break;
            end

        end

    end

    if (volume >= consume[2]) then
        animate:setExtra({
            withItem = withItem,
            glue = glue,
            consume = consume[2],
        });
        ISTimedActionQueue.add(animate);
    end
end

function fixerAnimate:doPerform()
    local newCondition = self.item:getCondition() + self.extra["withItem"]:getCondition();
    self.item:setCondition(newCondition);
    esCommon.items.destroyItem(self.extra["withItem"]);

    local glueUsed = 0;
    for g = 0, self.extra["glue"]:size() - 1 do
        local glue = self.extra["glue"]:get(g);

        while (glue) do
            if (glueUsed < self.extra["consume"]) then
                if (glue.getDrainableUsesInt) then
                    if (glue:getDrainableUsesInt() == 1) then
                        glue:setUsedDelta(0);
                        glue:Use();
                        glueUsed = glueUsed + 1;
                        break;
                    end
                    glue:Use();
                    glueUsed = glueUsed + 1;
                else
                    esCommon.items.destroyItem(glue,glue:getContainer());
                    glueUsed = glueUsed + 1;
                    break;
                end
            else
                break;
            end
        end
    end

end

local baseISInventoryPaneContextMenu = ISInventoryPaneContextMenu.addDynamicalContextMenu;
function ISInventoryPaneContextMenu.addDynamicalContextMenu(selectedItem, context, recipeList, player, containerList)
    if not (fixerOptions.getOption("fixerOn") and canBeFixedWith(selectedItem)) then
        return baseISInventoryPaneContextMenu(selectedItem, context, recipeList, player, containerList);
    end

    local allConsume = getRequireMats(selectedItem, containerList);
    local allItems = esCommon.items.getStackItems(selectedItem:getFullType(), selectedItem:getContainer());

    if (allItems:size() < 2 or #allConsume < 1) then
        return baseISInventoryPaneContextMenu(selectedItem, context, recipeList, player, containerList);
    end

    local consumeItems = LuaList:new()
    for i=0, allItems:size() -1 do
        local item = allItems:get(i);
        if (canBeFixedWith(selectedItem,item)) then
            consumeItems:add(item);
        end
    end

    local fixerMenu = context:getNew(context);
    for i=0, consumeItems:size() -1 do
        for glue=1,#allConsume do

            local recipeName = getText("IGUI_JobType_Repair") .. " " .. selectedItem:getDisplayName() .. " (" ..
            selectedItem:getCondition() .. "/" .. selectedItem:getConditionMax() .. ") " ..
            getText("IGUI_ESQ_COMMON_UI_USE") .. " " .. consumeItems:get(i):getDisplayName() .. " (" ..
            consumeItems:get(i):getCondition() .. "/" .. consumeItems:get(i):getConditionMax() .. ") & " ..
            allConsume[glue][1]:get(0):getDisplayName() .. " (" .. allConsume[glue][2] .. "/" ..  allConsume[glue][3] .. ")";

            fixerMenu:addOption(recipeName, selectedItem, fixThis, consumeItems:get(i), allConsume[glue], esCommon.player.getPlayerObject(player));
        end
    end

    if (#fixerMenu.options > 0) then
        context:addSubMenu(context:addOption(getText("IGUI_mo_fixer_menu") .. ":"), fixerMenu);
    end

    return baseISInventoryPaneContextMenu(selectedItem, context, recipeList, player, containerList);
end
