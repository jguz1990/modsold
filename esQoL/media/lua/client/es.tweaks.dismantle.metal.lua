esSorterAction = esSorterAction or {}
local esDismantle = {};
local esCommon = require("esq.common.01");
local esDismantleOptions = require("es.tweaks.options");
local esDismantleAnimate = require("esq.animate.01"):new();

function esDismantle.getGunAttach(targetItem)
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

function esDismantle.destroyItem(selectedItem, player)
    if (selectedItem.getAmmoType and selectedItem:getAmmoType()) then
        local attachments = esDismantle.getGunAttach(selectedItem)
        for k, v in pairs(attachments) do
            if (v[2] > 1) then
                for i = 1, v[2] do
                    local item = InventoryItemFactory.CreateItem(v[1]);
                    esCommon.items.createItem(item, selectedItem:getContainer(), player);
                end
                local haloText = getText("IGUI_CraftUI_CountUnits", getItemNameFromFullType(v[1]), v[2]);
                HaloTextHelper.addTextWithArrow(player, haloText, true, HaloTextHelper.getColorGreen())
            else
                esCommon.items.createItem(InventoryItemFactory.CreateItem(v[1]), selectedItem:getContainer(), player);
                local haloText = getText("IGUI_CraftUI_CountUnits", getItemNameFromFullType(v[1]), v[2]);
                HaloTextHelper.addTextWithArrow(player, haloText, true, HaloTextHelper.getColorGreen())
            end
        end
    end

    esCommon.items.destroyItem(selectedItem);
end

function esDismantle.getMetalValue(item)
    if (item:getFullType() == "Base.ScrapMetal") then return 0 end;
    if (item:isFavorite() or item:isEquipped()) then return 0 end;
    if (item:getCategory() == "Container") then return 0 end;

    if (item:getFullType() == "Base.MetalBar" or
        item:getFullType() == "Base.MetalPipe" or
        tostring(item:getCategory()) == "WeaponPart") then
        return 15;
    end;
    if (item.getAmmoType and item:getAmmoType()) then
        if (item:getActualWeight() < 1) then
            return item:getActualWeight() * 36;
        elseif (item:getActualWeight() < 2) then
            return item:getActualWeight() * 24;
        else
            return item:getActualWeight() * 12;
        end
    end
    if (item.getDisplayCategory and item:getDisplayCategory() == "VehicleMaintenance") then
        local partsType = string.lower(item:getFullType());
        if not (partsType:contains("window") or partsType:contains("windshield")) then
            if (item:getActualWeight() < 10) then
                return item:getActualWeight() * 5;
            elseif (item:getActualWeight() < 20) then
                return item:getActualWeight() * 2;
            else
                return item:getActualWeight();
            end
        end
    end

    if (item.getDisplayCategory and item:getDisplayCategory() == "Ammo") then return 0 end;
    if (item.getMetalValue and item:getMetalValue()) then return item:getMetalValue() end;
    return 0;
end

function esDismantle.onMenuGatherMetal(stack, player)
    local char = esCommon.player.getPlayerObject(player);

    for i = 0, stack:size() - 1 do
        local item = stack:get(i);
        ISInventoryPaneContextMenu.transferIfNeeded(char, item)
        local timeExecute = (esDismantle.getMetalValue(item) / 5) * 10;
        if (timeExecute > 90) then timeExecute = 90 end;
        local animate = esDismantleAnimate:new(char, item, timeExecute);
        ISTimedActionQueue.add(animate);
    end

    esSorterAction.action = "craft";
end

function esDismantleAnimate:doPerform()
    local metalValue = esDismantle.getMetalValue(self.item);
    local metalPerks = self.character:getPerkLevel(Perks.MetalWelding);

    while (metalValue > 0) do
        metalValue = metalValue - 5;
        if (esCommon.numbers.roll((metalPerks * 3) + 10)) then
            local Zrandom = ZombRand(1, 4);
            self.character:getXp():AddXP(Perks.MetalWelding, Zrandom);
            local haloText = getText("IGUI_CraftUI_CountUnits", getItemNameFromFullType("Base.ScrapMetal"), Zrandom);
            HaloTextHelper.addTextWithArrow(self.character, haloText, true, HaloTextHelper.getColorGreen())
            for z = 1, Zrandom do
                esCommon.items.createItem(
                        InventoryItemFactory.CreateItem("Base.ScrapMetal"),
                        self.item:getContainer(),
                        self.character
                );
            end
        end
    end

    esDismantle.destroyItem(self.item, self.character);
end

local function filterMetal(itemStack)
    local metals = LuaList:new();
    local selectedItem = {};
    for i = 0, itemStack:size() - 1 do
        local testItem = itemStack:get(i);
        if (esDismantle.getMetalValue(testItem) > 0) then
            metals:add(testItem);
            selectedItem[testItem:getFullType()] = testItem;
        end
    end
    return metals, selectedItem;
end

local ISIPCMCreateMenu = ISInventoryPaneContextMenu.createMenu;
ISInventoryPaneContextMenu.createMenu = function(player, isInPlayerInventory, items, x, y, origin)
    local baseContext = ISIPCMCreateMenu(player, isInPlayerInventory, items, x, y, origin);
    if not (esDismantleOptions.getOption("metalOn") and baseContext) then return baseContext end;

    local metals, selectedItem = filterMetal(esCommon.items.getStackFromSelection(items));
    if (metals:size() > 0) then
        local recipeName = getText("IGUI_ESQ_COMMON_UI_MAKE") .. " " .. getItemNameFromFullType("Base.ScrapMetal") .. " " ..
                getText("IGUI_ESQ_COMMON_UI_FROM") .. " " .. metals:get(0):getDisplayName() .. " (" .. metals:size() .. ")";
        if (esCommon.utils.sizeOf(selectedItem) > 1) then
            recipeName = getText("IGUI_ESQ_COMMON_UI_MAKE") .. " " .. getItemNameFromFullType("Base.ScrapMetal") ..
                    " " .. getText("IGUI_ESQ_COMMON_UI_FROM") .. " " .. getText("IGUI_ESQ_COMMON_UI_SELECTED") ..
                    " (" .. metals:size() .. ")";
        end

        baseContext:addOption(recipeName, metals, esDismantle.onMenuGatherMetal, player);
    end

    return baseContext;
end