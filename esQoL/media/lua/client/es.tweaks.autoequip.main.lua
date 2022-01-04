local esAutoEquipOptions = require("es.tweaks.options");
local esCommon = require("esq.common.01");
local esAutoEquip = {};
esAutoEquip.lastWeapon = {};

function esAutoEquip.onHit(zombie, player, bodyPart, weapon)
    if (esAutoEquipOptions.getOption("autoEquipOn") or esAutoEquipOptions.getOption("DropOnBreakOn")) then
        esAutoEquip.lastWeapon = { weapon, luautils.isEquipped(weapon, player) };
    end
end

function esAutoEquip.isSameWeaponType(source, target)
    local sourceCat = source:getCategories();
    local targetCat = target:getCategories();

    if (sourceCat:contains("Axe") and targetCat:contains("Axe") ) then return true; end
    if (sourceCat:contains("Spear") and targetCat:contains("Spear") ) then return true; end
    if (sourceCat:contains("SmallBlunt") and targetCat:contains("SmallBlunt") ) then return true; end
    if (sourceCat:contains("Blunt") and targetCat:contains("Blunt") ) then return true; end
    if (sourceCat:contains("SmallBlade") and targetCat:contains("SmallBlade") ) then return true; end
    if (sourceCat:contains("LongBlade") and targetCat:contains("LongBlade") ) then return true; end

    return false;
end

function esAutoEquip.onAttackEnd(player, weapon)
    if (not esAutoEquipOptions.getOption("autoEquipOn")) then return; end
    if (esAutoEquip.lastWeapon[1] == nil or esAutoEquip.lastWeapon[1]:getCondition() > 0) then return; end

    local newWeapon;

    if (esAutoEquipOptions.getOption("autoEquipSameWeapon")) then
        local foundWeapons = esCommon.items.getStackItems(esAutoEquip.lastWeapon[1]:getFullType(), player:getInventory());
        if (foundWeapons:size() > 0) then
            local worstWeapon = nil;

            for i = 0, foundWeapons:size() - 1 do
                local item = foundWeapons:get(i);

                if (item:getCondition() > 0) then
                    if (worstWeapon == nil) then worstWeapon = item end
                    if (item:getCondition() < worstWeapon:getCondition()) then
                        worstWeapon = item;
                    end
                end
            end

            if (worstWeapon ~= nil and worstWeapon:getCondition() > 0) then
                newWeapon = worstWeapon;
            end
        end
    end

    if (esAutoEquipOptions.getOption("autoEquipSameType") and newWeapon == nil) then
        local allItems = player:getInventory():getItems();
        local worstWeapon = nil;

        for i = 0, allItems:size() - 1 do
            local item = allItems:get(i);

            if (item:IsWeapon() and esAutoEquip.isSameWeaponType(esAutoEquip.lastWeapon[1], item) and item:getCondition() > 0) then
                if (worstWeapon == nil) then worstWeapon = item end
                if (item:getCondition() < worstWeapon:getCondition()) then
                    worstWeapon = item;
                end
            end

        end

        if (worstWeapon ~= nil and worstWeapon:getCondition() > 0) then
            newWeapon = worstWeapon;
        end
    end

    if (newWeapon ~= nil) then
        if esAutoEquip.lastWeapon[2] == 1 then
            ISTimedActionQueue.add(ISEquipWeaponAction:new(player, newWeapon, 5, true));
        elseif esAutoEquip.lastWeapon[2] == 2 then
            ISTimedActionQueue.add(ISEquipWeaponAction:new(player, newWeapon, 5, false));
        elseif esAutoEquip.lastWeapon[2] == 3 then
            ISTimedActionQueue.add(ISEquipWeaponAction:new(player, newWeapon, 5, false, true));
        end
    end

end

function esAutoEquip.onDropBroken(player, weapon)
    if (esAutoEquip.lastWeapon[1] == nil or esAutoEquip.lastWeapon[1]:getCondition() > 0) then return; end
    if esAutoEquipOptions.getOption("DropOnBreakOn") then
        ISTimedActionQueue.add(ISDropItemAction:new(player , esAutoEquip.lastWeapon[1], 1));
    end
end

Events.OnHitZombie.Add(esAutoEquip.onHit);
Events.OnPlayerAttackFinished.Add(esAutoEquip.onAttackEnd);
Events.OnPlayerAttackFinished.Add(esAutoEquip.onDropBroken);