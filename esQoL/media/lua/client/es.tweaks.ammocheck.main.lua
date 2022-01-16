local esCommon = require("esq.common.01");
local esAmmoOptions = require("es.tweaks.options");
local esAmmoCheckMain = {};
esAmmoCheckMain.notes = {
    "",
    "[<GunAmmo>]",
    "[<GunAmmo>] @<BagAmmo>",
    "<GunName> [<GunAmmo>]",
    "<GunName> [<GunAmmo>] @<BagAmmo>",
    "<GunName> [<GunAmmo>] #[<MagAmmo>]",
    "<GunName> [<GunAmmo>] #[<MagAmmo>] @<BagAmmo>",
};

function esAmmoCheckMain.getCurrentWeapon()
    return getPlayer():getPrimaryHandItem();
end

function esAmmoCheckMain.isValid(weapon)
    if (not esAmmoOptions.getOption("ammoCheckOn")) then return false end
    local equipped = weapon or esAmmoCheckMain.getCurrentWeapon();
    if not equipped then return false end
    if not equipped.isRanged then return false end
    if not equipped:isRanged() then return false end
    return true;
end

function esAmmoCheckMain.getAmmo(item)
    local weapon = item or esAmmoCheckMain.getCurrentWeapon();
    return weapon:getCurrentAmmoCount();
end

function esAmmoCheckMain.getChamber(item)
    local weapon = item or esAmmoCheckMain.getCurrentWeapon();
    if (weapon:isRoundChambered()) then
        return " +1";
    elseif (weapon:haveChamber()) then
        return " +0";
    end
    return "";
end

function esAmmoCheckMain.getAmmoGun(item)
    local weapon = item or esAmmoCheckMain.getCurrentWeapon();
    if (weapon.isJammed and weapon:isJammed()) then return "---/---"; end
    return esAmmoCheckMain.getAmmo(weapon)..esAmmoCheckMain.getChamber() .. "/" .. weapon:getMaxAmmo();
end

function esAmmoCheckMain.getAmmoBag(item)
    local weapon = item or esAmmoCheckMain.getCurrentWeapon();
    return getPlayer():getInventory():getCountTypeRecurse(weapon:getAmmoType());
end

function esAmmoCheckMain.getAmmoMag(item)
    local weapon = item or esAmmoCheckMain.getCurrentWeapon();
    local weaponFullType = weapon:getFullType();

    if (weapon.getMagazineType and weapon:getMagazineType()) then
        weaponFullType = weapon:getMagazineType();
    end

    local allMags = getPlayer():getInventory():getAllTypeRecurse(weaponFullType);
    local magAmmo = "";

    for i=0, allMags:size() -1 do
        local item = allMags:get(i);
        magAmmo = magAmmo .. item:getCurrentAmmoCount() .. "/" .. item:getMaxAmmo();
        if (i + 1 ~= allMags:size()) then
            magAmmo = magAmmo ..",";
        end
    end

    return magAmmo;
end

function esAmmoCheckMain.getAmmoPercent(item)
    return esAmmoCheckMain.getAmmo(item) / item:getMaxAmmo();
end

function esAmmoCheckMain.printNote(item)
    if (not esAmmoCheckMain.isValid()) then return end;
    local weapon = item or esAmmoCheckMain.getCurrentWeapon();

    local noteFormat = esAmmoCheckMain.notes[esAmmoOptions.getOption("ammoCheckFormat")];
    if (noteFormat:contains("<GunName>")) then
        noteFormat = noteFormat:gsub("<GunName>", weapon:getName());
    end
    if (noteFormat:contains("<GunAmmo>")) then
        noteFormat = noteFormat:gsub("<GunAmmo>", esAmmoCheckMain.getAmmoGun(weapon));
    end
    if (noteFormat:contains("<BagAmmo>")) then
        noteFormat = noteFormat:gsub("<BagAmmo>", esAmmoCheckMain.getAmmoBag(weapon));
    end
    if (noteFormat:contains("<MagAmmo>")) then
        noteFormat = noteFormat:gsub("<MagAmmo>", esAmmoCheckMain.getAmmoMag(weapon));
    end

    local rgb = esCommon.volume.getRGB(esAmmoCheckMain.getAmmoPercent(weapon));
    getPlayer():setHaloNote(noteFormat, rgb.green.r * 250, rgb.green.g * 250, rgb.green.b * 250, 150);
end

return esAmmoCheckMain;