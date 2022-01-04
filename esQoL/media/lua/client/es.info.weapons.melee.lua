local esTooltips = require("esq.tooltip.01"):new();
local esCommon = require("esq.common.01");
local esPerks = require("esq.perks.01");
local esInfoOptions = require("es.info.options");
local esWeaponInfo = {};

function esWeaponInfo.isMeleeWeapon(item)
    return item:IsWeapon() and not item:isRanged();
end

function esWeaponInfo:getMeleeWeaponInfo(item)
    local v = esWeaponInfo.getMeleeProperties(InventoryItemFactory.CreateItem(item:getFullType()));
    local o = esWeaponInfo.getMeleeProperties(item);
    local equippedWeapon = getPlayer():getPrimaryHandItem();

    local eqo, eq;
    if (equippedWeapon ~= nil and equippedWeapon ~= item and equippedWeapon.getMaxDamage) then
        eq = esWeaponInfo.getMeleeProperties(getPlayer():getPrimaryHandItem());
        eqo = esWeaponInfo.getMeleeProperties(InventoryItemFactory.CreateItem(getPlayer():getPrimaryHandItem():getFullType()));
    end

    local itemInfo, itemRow = {};

    itemRow = { o.name, "", "   " };
    if (eq) then itemRow[4] = eq.name end;
    table.insert(itemInfo, itemRow);

    itemRow = { o.type };
    if (eq) then itemRow[4] = eq.type end;
    table.insert(itemInfo, itemRow);

    itemRow = { "XP" };
    if (o.perk) then itemRow[2] = o.perk .. "/10 " .. o.toLevel .. "%"; end
    if (eq and eq.perk) then itemRow[4] = eq.perk .. "/10 " .. eq.toLevel .. "%"; end
    table.insert(itemInfo, itemRow);
    table.insert(itemInfo, { "" });

    itemRow = { getText("Tooltip_weapon_Damage"), o.maxDamage .. "/" .. v.maxDamage };
    if (eq) then
        if (o.maxDamage > eq.maxDamage) then
            itemRow[2] = "<G>" .. o.maxDamage .. "/" .. v.maxDamage;
            itemRow[4] = "<R>" .. eq.maxDamage .. "/".. eqo.maxDamage;
        elseif (o.maxDamage < eq.maxDamage) then
            itemRow[2] = "<R>" .. o.maxDamage .. "/" .. v.maxDamage;
            itemRow[4] = "<G>" .. eq.maxDamage .. "/".. eqo.maxDamage;
        else
            itemRow[4] = eq.maxDamage .. "/".. eqo.maxDamage;
        end
    end
    table.insert(itemInfo, itemRow);

    itemRow = { getText("IGUI_tt_esqWeaponInfo_SwingTime"), o.swingTime .. "/" .. v.swingTime };
    if (eq) then
        if (o.swingTime > eq.swingTime) then
            itemRow[2] = "<G>" .. o.swingTime .. "/" .. v.swingTime;
            itemRow[4] = "<R>" .. eq.swingTime .. "/".. eqo.swingTime;
        elseif (o.swingTime < eq.swingTime) then
            itemRow[2] = "<R>" .. o.swingTime .. "/" .. v.swingTime;
            itemRow[4] = "<G>" .. eq.swingTime .. "/".. eqo.swingTime;
        else
            itemRow[4] = eq.swingTime .. "/".. eqo.swingTime;
        end
    end;
    table.insert(itemInfo, itemRow);

    if (item:isEquipped()) then
        itemRow = { getText("Tooltip_item_Weight"), o.weight .. "(" .. o.aWeight .. ")" };
        if (eq and eq.weight > o.weight) then
            itemRow[2] = "<G>" .. o.weight .. "(" .. o.aWeight .. ")";
            itemRow[4] = "<R>" .. eq.weight .. "(" .. eq.aWeight .. ")";
        elseif (eq and eq.weight < o.weight) then
            itemRow[2] = "<R>" .. o.weight .. "(" .. o.aWeight .. ")";
            itemRow[4] = "<G>" .. eq.weight .. "(" .. eq.aWeight .. ")";
        elseif (eq) then
            itemRow[4] = eq.weight .. "(" .. eq.aWeight .. ")";
        end
    else
        itemRow = { getText("Tooltip_item_Weight"), o.aWeight .. "(" .. o.weight .. ")" };
        if (eq and eq.aWeight > o.aWeight) then
            itemRow[2] = "<G>" .. o.aWeight .. "(" .. o.weight .. ")";
            itemRow[4] = "<R>" .. eq.aWeight .. "(" .. eq.weight .. ")";
        elseif (eq and eq.aWeight < o.aWeight) then
            itemRow[2] = "<R>" .. o.aWeight .. "(" .. o.weight .. ")";
            itemRow[4] = "<G>" .. eq.aWeight .. "(" .. eq.weight .. ")";
        elseif (eq) then
            itemRow[4] = eq.aWeight .. "(" .. eq.weight .. ")";
        end
    end
    table.insert(itemInfo, itemRow);

    table.insert(itemInfo, { "" });

    itemRow = { getText("Tooltip_weapon_Condition"), o.condition .. "/" .. v.condition };
    if (eq) then itemRow[4] = eq.condition .. "/" .. eqo.condition end;
    table.insert(itemInfo, itemRow);

    itemRow = { getText("IGUI_tt_esqWeaponInfo_Durability"), tostring(o.durability .. "/" .. v.durability) };
    if (eq) then itemRow[4] = eq.durability .. "/" .. eqo.durability end;
    table.insert(itemInfo, itemRow);

    if (o.repaired > 0) then
        itemRow = { getText("Tooltip_weapon_Repaired"), o.repaired .. "x" };
    else
        itemRow = { getText("Tooltip_weapon_Repaired"), getText("Tooltip_never") };
    end
    if (eq and eq.repaired > 0) then
        itemRow[4] = eq.repaired .. "x";
    elseif (eq) then
        itemRow[4] = getText("Tooltip_never");
    end
    table.insert(itemInfo, itemRow);

    return itemInfo;
end

function esWeaponInfo.getMeleeProperties(item)
    local itemProp = {};

    itemProp.name = item:getDisplayName();
    itemProp.condition = esCommon.numbers.round(item:getCondition(), 2);
    itemProp.maxDamage = esCommon.numbers.round(item:getMaxDamage(), 2);
    itemProp.weight = esCommon.numbers.round((item.getEquippedWeight and item:getEquippedWeight() or 0),2);
    itemProp.aWeight = esCommon.numbers.round((item.getActualWeight and item:getActualWeight() or 0),2);
    itemProp.repaired = item:getHaveBeenRepaired() - 1;
    itemProp.swingTime = esCommon.numbers.round(item:getBaseSpeed(), 2);

    itemProp.durability = item:getConditionLowerChance();
    if (itemProp.durability > 1000) then
        itemProp.durability = "---";
    end

    local playerSkills = esPerks.getPerksData(getPlayer(), item:getCategories())
    if (playerSkills) then
        itemProp.type = playerSkills.type;
        itemProp.perk = playerSkills.level;
        itemProp.toLevel = esCommon.numbers.padding(playerSkills.percent, 2, 2);
    end

    return itemProp;
end

local baseInvTooltipRender = ISToolTipInv.render;
function ISToolTipInv:render()
    if esInfoOptions.getOption("meleeOn") and (not ISContextMenu.instance or not ISContextMenu.instance.visibleCheck) then
        if (not esWeaponInfo.isMeleeWeapon(self.item)) then
            return baseInvTooltipRender(self);
        end

        local weaponsData = esWeaponInfo:getMeleeWeaponInfo(self.item);
        local cardinal = esInfoOptions.getOption("meleeCardinal");

        local tooltipOptions = {}
        tooltipOptions.tooltipCardinal = cardinal;
        tooltipOptions.directions = { "R", "L", "R", "R" };

        local newTooltip = esTooltips:new(self, weaponsData, tooltipOptions);

        newTooltip:init();
        newTooltip:drawToolTip();
        newTooltip:drawData();

        if(cardinal == "O") then
            newTooltip:hideDefault();
            return;
        end
    end

    return baseInvTooltipRender(self);
end
