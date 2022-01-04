local esCommon = require("esq.common.01");
local fixerAnimate = require("esq.animate.01"):new();
local fixerOptions = require("es.tweaks.options");
local esPerks = require("esq.perks.01");

local fixerAmmo = {
    ["i"] = { 1, 3, 6, 12 },
    ["m"] = 1.77,
    ["p"] = 1.33,
}

local function isWeaponRanged(selectedItem)
    return selectedItem.isRanged and selectedItem:isRanged();
end

local function getCritChance(player)
    local baseChance = 0.1;
    local perksBonus = esPerks.getPerksData(player, "Aiming").level + esPerks.getPerksData(player, "Reloading").level;
    perksBonus = (perksBonus / 3) / 10;

    return esCommon.numbers.round(baseChance + perksBonus, 2)
end

local function getBulletCount(bullet)
    if (bullet.getCount and bullet:getCount()) then
        return bullet:getCount();
    end
    return 1;
end

local function getBulletRecipe(bullet)
    local metals = esCommon.numbers.round(getBulletCount(bullet) * fixerAmmo["m"]);
    local powder = esCommon.numbers.round(getBulletCount(bullet) * fixerAmmo["p"]);
    return { metals, powder }
end

local function getTooltip(selectedItem, volume, player)
    local bullet = InventoryItemFactory.CreateItem(selectedItem:getAmmoType());
    local bulletRecipe = getBulletRecipe(bullet);
    local canMake = true;
    bulletRecipe[1] = bulletRecipe[1] * volume;
    bulletRecipe[2] = bulletRecipe[2] * volume;

    local allMetals = esCommon.items.getStackItems("Base.ScrapMetal", esCommon.containers.getAll(player));
    allMetals = allMetals:size();
    local allPowders = esCommon.items.getStackItems("Base.GunPowder", esCommon.containers.getAll(player));
    allPowders = esCommon.items.getStackUses(allPowders);

    local description = getText("IGUI_CraftUI_CountUnits", bullet:getDisplayName(), getBulletCount(bullet) * volume);
    description = description .. " <LINE> " .. getText("IGUI_ESQ_COMMON_UI_CRITICAL") .. ":  ";
    description = description .. esCommon.volume.getRGBTag(getCritChance(player))["green"] .. getCritChance(player) * 100 .. "% <LINE> ";

    description = description .. " <RGB:1,1,1> <LINE> " .. getText("IGUI_CraftUI_SourceUse") .. " <LINE> ";
    if (allMetals < bulletRecipe[1]) then
        canMake = false;
        description = description .. " <RGB:1,0,0> "
    end
    description = description .. getText("IGUI_CraftUI_CountUnits", getItemNameFromFullType("Base.ScrapMetal"), bulletRecipe[1] .. "/" .. allMetals) .. " <LINE> <RGB:1,1,1> ";

    if (allPowders < bulletRecipe[2]) then
        canMake = false;
        description = description .. " <RGB:1,0,0> "
    end
    description = description .. getText("IGUI_CraftUI_CountUnits", getItemNameFromFullType("Base.GunPowder"), bulletRecipe[2] .. "/" .. allPowders);

    return description, not canMake;
end

local function makeAmmo (selectedItem, volume, player)
    local playerObj = esCommon.player.getPlayerObject(player);
    local animate = fixerAnimate:new(playerObj, selectedItem, 90);
    for i = 1, volume do
        ISTimedActionQueue.add(animate);
    end
end

function fixerAnimate:isValid()
    local bullet = InventoryItemFactory.CreateItem(self.item:getAmmoType());
    local bulletRecipe = getBulletRecipe(bullet);
    local allMetals = esCommon.items.getStackItems("Base.ScrapMetal", esCommon.containers.getAll(self.character));
    allMetals = allMetals:size();
    local allPowders = esCommon.items.getStackItems("Base.GunPowder", esCommon.containers.getAll(self.character));
    allPowders = esCommon.items.getStackUses(allPowders);

    if (allMetals > bulletRecipe[1] and allPowders > bulletRecipe[2]) then
        return true
    end

    return false;
end

function fixerAnimate:doPerform()
    local bullet = InventoryItemFactory.CreateItem(self.item:getAmmoType());
    local bulletRecipe = getBulletRecipe(bullet);
    local allMetals = esCommon.items.getStackItems("Base.ScrapMetal", esCommon.containers.getAll(self.character));
    local allPowders = esCommon.items.getStackItems("Base.GunPowder", esCommon.containers.getAll(self.character));

    for m = 1, bulletRecipe[1] do
        esCommon.items.destroyItem(allMetals:get(m-1));
    end

    local powderUsed = 0;
    for p = 0, allPowders:size() - 1 do
        local powder = allPowders:get(p);
        while (powder) do
            if (powderUsed < bulletRecipe[2]) then
                if (powder:getDrainableUsesInt() == 1) then
                    powder:setUsedDelta(0);
                    powder:Use();
                    powderUsed = powderUsed + 1;
                    break ;
                end
                powder:Use();
                powderUsed = powderUsed + 1;
            else
                break;
            end
        end

        if (powderUsed == bulletRecipe[2]) then
            break;
        end
    end

    local haloText = getText("IGUI_CraftUI_CountUnits", bullet:getDisplayName(), getBulletCount(bullet));
    HaloTextHelper.addTextWithArrow(self.character, haloText, true, HaloTextHelper.getColorGreen());
    for i = 1, getBulletCount(bullet) do
        local item = InventoryItemFactory.CreateItem(self.item:getAmmoType());
        esCommon.items.createItem(item, self.item:getContainer(), self.character);
    end

    if (esCommon.numbers.roll(getCritChance(self.character))) then
        HaloTextHelper.addText(self.character, getText("UI_trait_lucky").. "!!", HaloTextHelper.getColorGreen());
        HaloTextHelper.addTextWithArrow(self.character, haloText, true, HaloTextHelper.getColorGreen());
        for i = 1, getBulletCount(bullet) do
            local item = InventoryItemFactory.CreateItem(self.item:getAmmoType());
            esCommon.items.createItem(item, self.item:getContainer(), self.character);
        end
    end

end

local baseISInventoryPaneContextMenu = ISInventoryPaneContextMenu.addDynamicalContextMenu;
function ISInventoryPaneContextMenu.addDynamicalContextMenu(selectedItem, context, recipeList, player, containerList)
    if (fixerOptions.getOption("fixerAmmoOn") and isWeaponRanged(selectedItem)) then
        local ammoSubMenu = context:getNew(context);
        local bullet = InventoryItemFactory.CreateItem(selectedItem:getAmmoType());
        local recipeName = getText("IGUI_ESQ_COMMON_UI_MAKE") .. " " .. getItemNameFromFullType(bullet:getFullType());

        for k, v in pairs(fixerAmmo["i"]) do
            local fixOption = ammoSubMenu:addOption(recipeName .. " x" .. v, selectedItem, makeAmmo, v, player);
            local toolTip = ISToolTip:new();
            toolTip:initialise();
            toolTip.texture = bullet:getTex();
            toolTip:setName(recipeName);
            toolTip.description, fixOption.notAvailable = getTooltip(selectedItem, v, player);
            fixOption.toolTip = toolTip;
        end

        if (#ammoSubMenu.options > 0) then
            context:addSubMenu(context:addOption(recipeName .. ":"), ammoSubMenu);
        end
    end

    baseISInventoryPaneContextMenu(selectedItem, context, recipeList, player, containerList);
end