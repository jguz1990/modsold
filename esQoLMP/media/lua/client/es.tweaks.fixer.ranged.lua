local esCommon = require("esq.common.01");
local fixerAnimate = require("esq.animate.01"):new();
local fixerOptions = require("es.tweaks.options");
local esPerks = require("esq.perks.01");

local function isWeaponRanged(selectedItem)
    return selectedItem.isRanged and selectedItem:isRanged();
end

local function getOtherGuns(selectedItem)
    local otherGuns = LuaList:new();
    local allGuns = selectedItem:getContainer():getItems();

    for g = 0, allGuns:size() - 1 do
        local gun = allGuns:get(g);
        if (isWeaponRanged(gun) and gun ~= selectedItem and not gun:isEquipped() and not gun:isFavorite()) then
            otherGuns:add(gun);
        end
    end

    return otherGuns;
end

local function getFixAmount(selectedItem, targetItem, player)
    local repairPercent = 0.50;

    if (selectedItem:getFullType() == targetItem:getFullType()) then
        repairPercent = repairPercent + 0.3;
    end
    repairPercent = repairPercent - (selectedItem:getHaveBeenRepaired() * 0.05);

    local perksBonus = esPerks.getPerksData(player, "Aiming").level + esPerks.getPerksData(player, "Reloading").level;
    perksBonus = (perksBonus / 3) / 10;

    return esCommon.numbers.round((repairPercent + perksBonus) * targetItem:getCondition())
end

local function getGunAttach(targetItem)
    local attach = {};

    if (targetItem.isContainsClip and targetItem:isContainsClip()) then
        local newMag = InventoryItemFactory.CreateItem(targetItem:getMagazineType());
        table.insert(attach, { newMag:getFullType(), 1 });
    end

    local ammoCount = targetItem:getCurrentAmmoCount();
    if (targetItem.isRoundChambered and targetItem:isRoundChambered()) then
        ammoCount = ammoCount + 1;
    end

    if (ammoCount > 0) then
        table.insert(attach, { targetItem:getAmmoType(), ammoCount });
    end

    if (targetItem.getScope and targetItem:getScope()) then
        table.insert(attach, { targetItem:getScope():getFullType(), 1 });
    end
    if (targetItem.getClip and targetItem:getClip()) then
        table.insert(attach, { targetItem:getClip():getFullType(), 1 });
    end
    if (targetItem.getSling and targetItem:getSling()) then
        table.insert(attach, { targetItem:getSling():getFullType(), 1 });
    end
    if (targetItem.getCanon and targetItem:getCanon()) then
        table.insert(attach, { targetItem:getCanon():getFullType(), 1 });
    end
    if (targetItem.getStock and targetItem:getStock()) then
        table.insert(attach, { targetItem:getStock():getFullType(), 1 });
    end
    if (targetItem.getRecoilpad and targetItem:getRecoilpad()) then
        table.insert(attach, { targetItem:getRecoilpad():getFullType(), 1 });
    end

    return attach;
end

local function fixThis(selectedItem, gunItem, player)
    local ttl = selectedItem:getWeight() * 50;
    if (ttl > 200) then ttl = 200 end;
    local animate = fixerAnimate:new(player, selectedItem, ttl);
    animate:setExtra(gunItem);

    ISInventoryPaneContextMenu.transferIfNeeded(player, selectedItem)
    ISInventoryPaneContextMenu.transferIfNeeded(player, gunItem)
    ISTimedActionQueue.add(animate);
end

function fixerAnimate:isValid()
    if not self.extra:getContainer() or not self.extra:getContainer():contains(self.extra) then
        return false
    end
    if not self.item:getContainer() or not self.item:getContainer():contains(self.item) then
        return false
    end

    return true;
end

function fixerAnimate:doPerform()
    local conditionRecover = getFixAmount(self.item, self.extra, self.character);
    local attachments = getGunAttach(self.extra);

    self.item:setCondition(self.item:getCondition() + conditionRecover);
    self.item:setHaveBeenRepaired(self.item:getHaveBeenRepaired() + 1);
    for k, v in pairs(attachments) do
        if (v[2] > 1) then
            for i = 1, v[2] do
                local item = InventoryItemFactory.CreateItem(v[1]);
                esCommon.items.createItem(item, self.item:getContainer(), self.character);
                local haloText = getText("IGUI_CraftUI_CountUnits", getItemNameFromFullType(v[1]), v[2]);
                HaloTextHelper.addTextWithArrow(self.character, haloText, true, HaloTextHelper.getColorGreen())
            end
        else
            esCommon.items.createItem(InventoryItemFactory.CreateItem(v[1]), self.item:getContainer(), self.character);
            local haloText = getText("IGUI_CraftUI_CountUnits", getItemNameFromFullType(v[1]), v[2]);
            HaloTextHelper.addTextWithArrow(self.character, haloText, true, HaloTextHelper.getColorGreen())
        end
    end

    esCommon.items.destroyItem(self.extra)
end

local function getTooltip(selectedItem, targetItem, player)
    local description = "";
    local conditionRecover = getFixAmount(selectedItem, targetItem, player);
    local attachments = getGunAttach(targetItem);

    description = description .. " <RGB:0,.9,0> " .. getText("Tooltip_weapon_Condition") .. " ";
    description = description .. selectedItem:getCondition() + conditionRecover .. "/";
    description = description .. selectedItem:getConditionMax() .. " <RGB:1,1,1> <LINE> ";
    description = description .. " <RGB:1,0,0> "  .. getText("Tooltip_weapon_Repaired") .. " ";
    description = description .. selectedItem:getHaveBeenRepaired() .. "x <RGB:1,1,1> <LINE> ";

    for k, v in pairs(attachments) do
        description = description .. getItemNameFromFullType(v[1]) .. " x" .. v[2] .. " <LINE> ";
    end

    description = description .. " <LINE> " .. getText("Tooltip_craft_Needs") .. " <LINE> "
    description = description .. targetItem:getDisplayName() .. " 1/1";

    return description, false;
end

local baseISInventoryPaneContextMenu = ISInventoryPaneContextMenu.addDynamicalContextMenu;
function ISInventoryPaneContextMenu.addDynamicalContextMenu(selectedItem, context, recipeList, player, containerList)
    if (fixerOptions.getOption("fixerRangeOn") and isWeaponRanged(selectedItem) and selectedItem:getCondition() < selectedItem:getConditionMax()) then

        local allOtherGuns = getOtherGuns(selectedItem);
        if (allOtherGuns:size() > 0) then
            local fixerMenu = context:getNew(context);

            for g = 0, allOtherGuns:size() - 1 do
                local gun = allOtherGuns:get(g);
                local recipeName = getText("IGUI_JobType_Repair") .. " " .. selectedItem:getDisplayName() .. " (" ..
                        selectedItem:getCondition() .. "/" .. selectedItem:getConditionMax() .. ") " ..
                        getText("IGUI_ESQ_COMMON_UI_USE") .. " " .. gun:getDisplayName() .. " (" ..
                        gun:getCondition() .. "/" .. gun:getConditionMax() .. ")";

                local fixOption = fixerMenu:addOption(recipeName, selectedItem, fixThis, gun, esCommon.player.getPlayerObject(player));
                local toolTip = ISToolTip:new();
                toolTip:initialise();
                toolTip.texture = selectedItem:getTex();
                toolTip:setName(getText("IGUI_JobType_Repair") .. " " .. selectedItem:getDisplayName());
                toolTip.description, fixOption.notAvailable = getTooltip(selectedItem, gun, esCommon.player.getPlayerObject(player));
                fixOption.toolTip = toolTip;
            end

            if (#fixerMenu.options > 0) then
                context:addSubMenu(context:addOption(getText("IGUI_mo_fixer_menu") .. ":"), fixerMenu);
            end

        end
    end

    return baseISInventoryPaneContextMenu(selectedItem, context, recipeList, player, containerList);
end
