local esTooltips = require("esq.tooltip.01"):new();
local esCommon = require("esq.common.01");
local esPerks = require("esq.perks.01");
local esInfoOptions = require("es.info.options");
local esWeaponInfo = {};

function esWeaponInfo.isRangedWeapon(item)
    return item.isRanged and item:isRanged();
end

function esWeaponInfo.getRangedWeaponInfo(item)
    local v = esWeaponInfo.getRangedProperties(InventoryItemFactory.CreateItem(item:getFullType()));
    local o = esWeaponInfo.getRangedProperties(item);
    local a = esPerks.getPerksData(getPlayer(), "Aiming");
    local r = esPerks.getPerksData(getPlayer(), "Reloading");
    local equippedWeapon = getPlayer():getPrimaryHandItem();

    local eqo, eq;
    if (equippedWeapon ~= nil and equippedWeapon ~= item and equippedWeapon.getMaxDamage) then
        eq = esWeaponInfo.getRangedProperties(getPlayer():getPrimaryHandItem());
        eqo = esWeaponInfo.getRangedProperties(InventoryItemFactory.CreateItem(getPlayer():getPrimaryHandItem():getFullType()));
    end

    local attach = false;
    local itemInfo, itemRow = {};

    itemRow = { o.name,"","    " };
    if (eq) then itemRow[4] = eq.name end;
    table.insert(itemInfo, itemRow);

    table.insert(itemInfo, { a.type, a.level .. "/10", "  ", esCommon.numbers.padding(a.percent, 2, 2) .. "%" });
    table.insert(itemInfo, { r.type, r.level .. "/10", "  ", esCommon.numbers.padding(r.percent, 2, 2) .. "%" });
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

    itemRow = { o.ammoType }
    if (eq) then itemRow[4] = eq.ammoType end;
    table.insert(itemInfo, itemRow);

    if (item:isEquipped()) then
        itemRow = { getText("Tooltip_item_Weight"), o.weight .. "(" .. o.aWeight .. ")" };
        if (eq and eq.weight > o.weight) then
            itemRow[2] = "<G>" .. o.weight .. "(" .. o.aWeight .. ")";
            itemRow[4] = "<R>" .. eq.weight .. "(" .. eq.aWeight .. ")";
        elseif (eq and eq.weight > o.weight) then
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
    if (o.magazine and not o.hasClip) then
        table.insert(itemInfo, { "<R>" .. getText("Tooltip_weapon_NoClip") });
    end
    if (o.jammed) then
        table.insert(itemInfo, { "<R>" .. getText("Tooltip_weapon_Jammed") });
    end
    if (o.needRack) then
        table.insert(itemInfo, { "<R>" .. getText("Tooltip_weapon_NoRoundChambered") });
    end

    if (o.magazine and o.hasClip) then
        itemRow = { o.magazine, o.ammoLoad };
    elseif (o.magazine) then
        itemRow = { "<R>" .. getText("ContextMenu_Empty"), o.ammoLoad };
    else
        itemRow = { getText("Tooltip_weapon_AmmoCount"), o.ammoLoad };
    end
    if (eq and eq.magazine and eq.hasClip) then
        itemRow[4] = eq.ammoLoad ;
    elseif (eq and eq.magazine) then
        itemRow[4] = "<R>" .. getText("ContextMenu_Empty");
    elseif (eq) then
        itemRow[4] = eq.ammoLoad;
    end
    table.insert(itemInfo, itemRow);

    itemRow = { getText("Tooltip_weapon_Ammo") .. " " .. getText("ContextMenu_MoveToInventory"), tostring(o.ammo) };
    if (eq) then
        itemRow[4] = tostring(eq.ammo);
    end
    table.insert(itemInfo, itemRow);
    table.insert(itemInfo, { "" });


    itemRow = { getText("Tooltip_weapon_Condition"), o.condition .. "/" .. v.condition };
    if (eq) then
        itemRow[4] = eq.condition .. "/" .. eqo.condition;
    end
    table.insert(itemInfo, itemRow);

    itemRow = { getText("IGUI_tt_esqWeaponInfo_Durability"), o.durability .. "/" .. v.durability };
    if (eq) then
        itemRow[4] = o.durability .. "/" .. v.durability;
    end
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
    table.insert(itemInfo, { "" });

    if (o.scope or (eq and eq.scope)) then
        itemRow = { getText("Tooltip_weapon_Scope") .. ": " };
        if (eq and o.scope == nil) then
            itemRow[4] = "<G>" .. eq.scope;
        elseif (eq and eq.scope) then
            itemRow[4] = eq.scope;
        elseif (eq) then
            itemRow[4] = "<R>" .. getText("ContextMenu_Empty");
        end
        table.insert(itemInfo, itemRow);

        if (o.scope and eq and eq.scope == nil) then
            table.insert(itemInfo, { "<G>    " .. o.scope });
        elseif (o.scope) then
            table.insert(itemInfo, { "    " .. o.scope });
        else
            table.insert(itemInfo, { "<R>    " .. getText("ContextMenu_Empty") });
        end
        attach = true;
    end

    if (o.clip or (eq and eq.clip)) then
        itemRow = { getText("Tooltip_weapon_Clip") .. ": " };
        if (eq and o.clip == nil) then
            itemRow[4] = "<G>" .. eq.clip;
        elseif (eq and eq.clip) then
            itemRow[4] = eq.clip;
        elseif (eq) then
            itemRow[4] = "<R>" .. getText("ContextMenu_Empty");
        end
        table.insert(itemInfo, itemRow);

        if (o.clip and eq and eq.clip == nil) then
            table.insert(itemInfo, { "<G>    " .. o.clip });
        elseif (o.clip) then
            table.insert(itemInfo, { "    " .. o.clip });
        else
            table.insert(itemInfo, { "<R>    " .. getText("ContextMenu_Empty") });
        end
        attach = true;
    end

    if (o.sling or (eq and eq.sling)) then
        itemRow = { getText("Tooltip_weapon_Sling") .. ": " };
        if (eq and o.sling == nil) then
            itemRow[4] = "<G>" .. eq.sling;
        elseif (eq and eq.sling) then
            itemRow[4] = eq.sling;
        elseif (eq) then
            itemRow[4] = "<R>" .. getText("ContextMenu_Empty");
        end
        table.insert(itemInfo, itemRow);

        if (o.sling and eq and eq.sling == nil) then
            table.insert(itemInfo, { "<G>    " .. o.sling });
        elseif (o.sling) then
            table.insert(itemInfo, { "    " .. o.sling });
        else
            table.insert(itemInfo, { "<R>    " .. getText("ContextMenu_Empty") });
        end
        attach = true;
    end

    if (o.cannon or (eq and eq.cannon)) then
        itemRow = { getText("Tooltip_weapon_Canon") .. ": " };
        if (eq and o.cannon == nil) then
            itemRow[4] = "<G>" .. eq.cannon;
        elseif (eq and eq.cannon) then
            itemRow[4] = eq.cannon;
        elseif (eq) then
            itemRow[4] = "<R>" .. getText("ContextMenu_Empty");
        end
        table.insert(itemInfo, itemRow);

        if (o.cannon and eq and eq.cannon == nil) then
            table.insert(itemInfo, { "<G>    " .. o.cannon });
        elseif (o.cannon) then
            table.insert(itemInfo, { "    " .. o.cannon });
        else
            table.insert(itemInfo, { "<R>    " .. getText("ContextMenu_Empty") });
        end
        attach = true;
    end

    if (o.stock or (eq and eq.stock)) then
        itemRow = { getText("Tooltip_weapon_Stock") .. ": " };
        if (eq and o.stock == nil) then
            itemRow[4] = "<G>" .. eq.stock;
        elseif (eq and eq.stock) then
            itemRow[4] = eq.stock;
        elseif (eq) then
            itemRow[4] = "<R>" .. getText("ContextMenu_Empty");
        end
        table.insert(itemInfo, itemRow);

        if (o.stock and eq and eq.stock == nil) then
            table.insert(itemInfo, { "<G>    " .. o.stock });
        elseif (o.stock) then
            table.insert(itemInfo, { "    " .. o.stock });
        else
            table.insert(itemInfo, { "<R>    " .. getText("ContextMenu_Empty") });
        end
        attach = true;
    end

    if (o.recoilpad or (eq and eq.recoilpad)) then
        itemRow = { getText("Tooltip_weapon_RecoilPad") .. ": " };
        if (eq and o.recoilpad == nil) then
            itemRow[4] = "<G>" .. eq.recoilpad;
        elseif (eq and eq.recoilpad) then
            itemRow[4] = eq.recoilpad;
        elseif (eq) then
            itemRow[4] = "<R>" .. getText("ContextMenu_Empty");
        end
        table.insert(itemInfo, itemRow);

        if (o.recoilpad and eq and eq.recoilpad == nil) then
            table.insert(itemInfo, { "<G>    " .. o.recoilpad });
        elseif (o.recoilpad) then
            table.insert(itemInfo, { "    " .. o.recoilpad });
        else
            table.insert(itemInfo, { "<R>    " .. getText("ContextMenu_Empty") });
        end
        attach = true;
    end
    if (attach) then table.insert(itemInfo, { "" }); end

    itemRow = { getText("IGUI_tt_esqWeaponInfo_MaxRange"), o.range .. "/" .. v.range };
    if (eq) then
        if (o.range > eq.range) then
            itemRow[2] = "<G>" .. o.range .. "/" .. v.range;
            itemRow[4] = "<R>" .. eq.range .. "/".. eqo.range;
        elseif (o.range < eq.range) then
            itemRow[2] = "<R>" .. o.range .. "/" .. v.range;
            itemRow[4] = "<G>" .. eq.range .. "/".. eqo.range;
        else
            itemRow[4] = eq.range .. "/".. eqo.range;
        end
    end
    table.insert(itemInfo, itemRow);
    
    itemRow = { getText("IGUI_tt_esqWeaponInfo_Accuracy"), o.accuracy .. "/" .. v.accuracy };
    if (eq) then
        if (o.accuracy > eq.accuracy) then
            itemRow[2] = "<G>" .. o.accuracy .. "/" .. v.accuracy;
            itemRow[4] = "<R>" .. eq.accuracy .. "/".. eqo.accuracy;
        elseif (o.accuracy < eq.accuracy) then
            itemRow[2] = "<R>" .. o.accuracy .. "/" .. v.accuracy;
            itemRow[4] = "<G>" .. eq.accuracy .. "/".. eqo.accuracy;
        else
            itemRow[4] = eq.accuracy .. "/".. eqo.accuracy;
        end
    end
    table.insert(itemInfo, itemRow);
    
    itemRow = { getText("IGUI_tt_esqWeaponInfo_AimingSpeed"), o.aiming .. "/" .. v.aiming };
    if (eq) then
        if (o.aiming > eq.aiming) then
            itemRow[2] = "<G>" .. o.aiming .. "/" .. v.aiming;
            itemRow[4] = "<R>" .. eq.aiming .. "/".. eqo.aiming;
        elseif (o.aiming < eq.aiming) then
            itemRow[2] = "<R>" .. o.aiming .. "/" .. v.aiming;
            itemRow[4] = "<G>" .. eq.aiming .. "/".. eqo.aiming;
        else
            itemRow[4] = eq.aiming .. "/".. eqo.aiming;
        end
    end
    table.insert(itemInfo, itemRow);
    
    table.insert(itemInfo, { "" });
    itemRow = { getText("IGUI_tt_esqWeaponInfo_Sound"), o.sound .. "/" .. v.sound };
    if (eq) then
        if (o.sound > eq.sound) then
            itemRow[2] = "<R>" .. o.sound .. "/" .. v.sound;
            itemRow[4] = "<G>" .. eq.sound .. "/".. eqo.sound;
        elseif (o.sound < eq.sound) then
            itemRow[2] = "<G>" .. o.sound .. "/" .. v.sound;
            itemRow[4] = "<R>" .. eq.sound .. "/".. eqo.sound;
        else
            itemRow[4] = eq.sound .. "/".. eqo.sound;
        end
    end
    table.insert(itemInfo, itemRow);
    
    itemRow = { getText("IGUI_tt_esqWeaponInfo_Weight"), o.aWeight .. "/" .. v.aWeight };
    if (eq) then
        if (o.aWeight > eq.aWeight) then
            itemRow[2] = "<R>" .. o.aWeight .. "/" .. v.aWeight;
            itemRow[4] = "<G>" .. eq.aWeight .. "/".. eqo.aWeight;
        elseif (o.aWeight < eq.aWeight) then
            itemRow[2] = "<G>" .. o.aWeight .. "/" .. v.aWeight;
            itemRow[4] = "<R>" .. eq.aWeight .. "/".. eqo.aWeight;
        else
            itemRow[4] = eq.aWeight .. "/".. eqo.aWeight;
        end
    end
    table.insert(itemInfo, itemRow);
    
    itemRow = { getText("IGUI_tt_esqWeaponInfo_Recoil"), o.recoil .. "/" .. v.recoil };
    if (eq) then
        if (o.recoil > eq.recoil) then
            itemRow[2] = "<R>" .. o.recoil .. "/" .. v.recoil;
            itemRow[4] = "<G>" .. eq.recoil .. "/".. eqo.recoil;
        elseif (o.recoil < eq.recoil) then
            itemRow[2] = "<G>" .. o.recoil .. "/" .. v.recoil;
            itemRow[4] = "<R>" .. eq.recoil .. "/".. eqo.recoil;
        else
            itemRow[4] = eq.recoil .. "/".. eqo.recoil;
        end
    end
    table.insert(itemInfo, itemRow);
    
    itemRow = { getText("IGUI_tt_esqWeaponInfo_ReloadSpeed"), o.reload .. "/" .. v.reload };
    if (eq) then
        if (o.reload > eq.reload) then
            itemRow[2] = "<R>" .. o.reload .. "/" .. v.reload;
            itemRow[4] = "<G>" .. eq.reload .. "/".. eqo.reload;
        elseif (o.reload < eq.reload) then
            itemRow[2] = "<G>" .. o.reload .. "/" .. v.reload;
            itemRow[4] = "<R>" .. eq.reload .. "/".. eqo.reload;
        else
            itemRow[4] = eq.reload .. "/".. eqo.reload;
        end
    end
    table.insert(itemInfo, itemRow);
    
    return itemInfo;
end

function esWeaponInfo.getRangedProperties(item)
    local itemProp = {};
    itemProp.name = item:getDisplayName();
    itemProp.hasClip = item.isContainsClip and item:isContainsClip();
    if (item:getMagazineType() ~= nil) then
        itemProp.magazine = getScriptManager():FindItem(item:getMagazineType()):getDisplayName();
    end

    itemProp.ammoLoad = item:getCurrentAmmoCount();
    if (item:isRoundChambered()) then
        itemProp.ammoLoad = itemProp.ammoLoad .. " +1";
    elseif (item:haveChamber()) then
        itemProp.ammoLoad = itemProp.ammoLoad .. " +0";
    end
    itemProp.ammoLoad = itemProp.ammoLoad .. "/" .. item:getMaxAmmo();

    if (item.getAmmoType and item:getAmmoType()) then
        itemProp.ammoType = getScriptManager():FindItem(item:getAmmoType()):getDisplayName();
        itemProp.ammo = getPlayer():getInventory():getAllTypeRecurse(item:getAmmoType()):size();
    end

    if (item.getScope and item:getScope()) then
        itemProp.scope = item:getScope():getDisplayName();
    end
    if (item.getClip and item:getClip()) then
        itemProp.clip = item:getClip():getDisplayName();
    end
    if (item.getSling and item:getSling()) then
        itemProp.sling = item:getSling():getDisplayName();
    end
    if (item.getCanon and item:getCanon()) then
        itemProp.cannon = item:getCanon():getDisplayName();
    end
    if (item.getStock and item:getStock()) then
        itemProp.stock = item:getStock():getDisplayName();
    end
    if (item.getRecoilpad and item:getRecoilpad()) then
        itemProp.recoilpad = item:getRecoilpad():getDisplayName();
    end

    itemProp.sound = esCommon.numbers.round(item:getSoundRadius(), 2);
    itemProp.recoil = esCommon.numbers.round(item:getRecoilDelay(), 2);
    itemProp.reload = esCommon.numbers.round(item:getReloadTime(), 2);
    itemProp.range = esCommon.numbers.round(item:getMaxRange(), 2);
    itemProp.condition = esCommon.numbers.round(item:getCondition(), 2);
    itemProp.aiming = esCommon.numbers.round(item:getAimingTime(), 2);
    itemProp.accuracy = esCommon.numbers.round(item:getHitChance(), 2);
    itemProp.durability = item:getConditionLowerChance();
    itemProp.maxDamage = esCommon.numbers.round(item:getMaxDamage(), 2);
    itemProp.weight = esCommon.numbers.round((item.getEquippedWeight and item:getEquippedWeight() or 0),2);
    itemProp.aWeight = esCommon.numbers.round((item.getActualWeight and item:getActualWeight() or 0),2);
    itemProp.repaired = item:getHaveBeenRepaired() - 1;
    itemProp.jammed = item:isJammed();
    itemProp.needRack = item:haveChamber() and not item:isRoundChambered() and item:getCurrentAmmoCount() > 0;

    return itemProp;
end

local baseInvTooltipRender = ISToolTipInv.render;
function ISToolTipInv:render()
    if esInfoOptions.getOption("rangedOn") and (not ISContextMenu.instance or not ISContextMenu.instance.visibleCheck) then
        if (not esWeaponInfo.isRangedWeapon(self.item)) then
            return baseInvTooltipRender(self);
        end

        local weaponsData = esWeaponInfo.getRangedWeaponInfo(self.item);
        local cardinal = esInfoOptions.getOption("rangedCardinal");

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