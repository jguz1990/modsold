local esTooltips = require("esq.tooltip.01"):new();
local esCommon = require("esq.common.01");
local esInfoOptions = require("es.info.options");
local esWeaponInfo = {};

function esWeaponInfo.isWeaponParts(selectItem)
    return (tostring(selectItem:getCategory()) == 'WeaponPart');
end

function esWeaponInfo.getGunName(selectItem)
    local trimSelectItem = esCommon.utils.trim(selectItem);
    local gunCount = getPlayer():getInventory():getAllTypeRecurse(trimSelectItem):size();
    local gunName = getScriptManager():FindItem(trimSelectItem):getDisplayName();

    if (gunCount > 0) then
        return "<B>" .. gunName;
    else
        return "<A>" .. gunName;
    end
end

function esWeaponInfo.getMountOnGuns(partsInfo, selectItem)
    table.insert(partsInfo, { getText("Tooltip_weapon_CanBeMountOn") });
    table.insert(partsInfo, { "", "", "", "" });

    local mountedGuns = tostring(selectItem:getMountOn());
    mountedGuns = mountedGuns:sub(2, mountedGuns:len() - 1);
    mountedGuns = esCommon.utils.split(mountedGuns, ",");

    local indx = 0;
    while (indx <= #mountedGuns) do
        local gun1, gun2, gun3;
        if (mountedGuns[indx + 1]) then
            gun1 = esWeaponInfo.getGunName(mountedGuns[indx + 1]);
        end
        if (mountedGuns[indx + 2]) then
            gun2 = esWeaponInfo.getGunName(mountedGuns[indx + 2]);
        end
        if (mountedGuns[indx + 3]) then
            gun3 = esWeaponInfo.getGunName(mountedGuns[indx + 3]);
        end

        if (gun1 ~= nil and gun2 ~= nil and gun3 ~= nil) then
            table.insert(partsInfo, { "", gun1 .. "   ", gun2 .. "   ", gun3 });
        elseif (gun1 ~= nil and gun2 ~= nil) then
            table.insert(partsInfo, { "", gun1 .. "   ", gun2, "" });
        elseif (gun1 ~= nil) then
            table.insert(partsInfo, { "", gun1, "", "" });
        end

        indx = indx + 3;
    end
end

function esWeaponInfo.getPartsInfo(selectItem)
    local description = getText(selectItem:getTooltip() or "");
    local partsInfo = {
        { "", selectItem:getDisplayName() },
        { "", getText("Tooltip_item_Weight"), tostring(esCommon.numbers.round(selectItem:getActualWeight(), 2)) },
        { "", getText("Tooltip_weapon_Type"), tostring(selectItem:getPartType()) },
        { "" },
        { description },
    };
    local breaks = esCommon.utils.split(description, "\n");

    if (#breaks > 1) then
        for i = 2, #breaks do
            table.insert(partsInfo, { "" });
        end
    end

    esWeaponInfo.getMountOnGuns(partsInfo, selectItem);
    return partsInfo;
end

local baseInvTooltipRender = ISToolTipInv.render;
function ISToolTipInv:render()
    if esInfoOptions.getOption("partsOn") and (not ISContextMenu.instance or not ISContextMenu.instance.visibleCheck) then

        if (not esWeaponInfo.isWeaponParts(self.item)) then
            return baseInvTooltipRender(self);
        end

        local weaponsData = esWeaponInfo.getPartsInfo(self.item);
        local cardinal = esInfoOptions.getOption("partsCardinal");

        local tooltipOptions = {}
        tooltipOptions.tooltipCardinal = cardinal;
        tooltipOptions.directions = { "R", "R", "R", "R" };

        local newTooltip = esTooltips:new(self, weaponsData, tooltipOptions);

        newTooltip:init();
        newTooltip:setMinWidth(1);
        newTooltip:drawToolTip();
        newTooltip:drawData();

        if(cardinal == "O") then
            newTooltip:hideDefault();
            return;
        end
    end

    return baseInvTooltipRender(self);
end