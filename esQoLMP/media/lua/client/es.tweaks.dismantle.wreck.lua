esSorterAction = esSorterAction or {}
local esDismantleOptions = require("es.tweaks.options");

local baseFillMenuOutsideVehicle = ISVehicleMenu.FillMenuOutsideVehicle;
function ISVehicleMenu.FillMenuOutsideVehicle(player, context, vehicle, test)

    if esDismantleOptions.getOption("wreckOn") and vehicle:getPartById("Engine") and vehicle:getPartById("Engine"):getCondition() < 11 and
            not (string.match(vehicle:getScript():getName(), "Burnt") or
                 string.match(vehicle:getScript():getName(), "Smashed")) then
        -- from base game:
        local playerObj = getSpecificPlayer(player)
        local option = context:addOption(getText("ContextMenu_RemoveBurntVehicle"), playerObj, ISVehicleMenu.onRemoveBurntVehicle, vehicle);
        local toolTip = ISToolTip:new();
        toolTip:initialise();
        toolTip:setVisible(false);
        option.toolTip = toolTip;
        toolTip:setName(getText("ContextMenu_RemoveBurntVehicle"));
        toolTip.description = getText("Tooltip_removeBurntVehicle") .. " <LINE> <LINE> ";

        if playerObj:getInventory():containsTypeRecurse("WeldingMask") then
            toolTip.description = toolTip.description .. " <LINE> <RGB:1,1,1> " .. getItemNameFromFullType("Base.WeldingMask") .. " 1/1";
        else
            toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> " .. getItemNameFromFullType("Base.WeldingMask") .. " 0/1";
            option.notAvailable = true;
        end

        local blowTorch = ISBlacksmithMenu.getBlowTorchWithMostUses(playerObj:getInventory());
        if blowTorch then
            local blowTorchUseLeft = blowTorch:getDrainableUsesInt();
            if blowTorchUseLeft >= 20 then
                toolTip.description = toolTip.description .. " <LINE> <RGB:1,1,1> " .. getItemNameFromFullType("Base.BlowTorch") .. getText("ContextMenu_Uses") .. " " .. blowTorchUseLeft .. "/" .. 20;
            else
                toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> " .. getItemNameFromFullType("Base.BlowTorch") .. getText("ContextMenu_Uses") .. " " .. blowTorchUseLeft .. "/" .. 20;
                option.notAvailable = true;
            end
        else
            toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> " .. getItemNameFromFullType("Base.BlowTorch") .. " 0/5";
            option.notAvailable = true;
        end
        -- end
    end

    return baseFillMenuOutsideVehicle(player, context, vehicle, test);
end

local baseISVehicleMenuonRemoveBurntVehicle = ISVehicleMenu.onRemoveBurntVehicle;
function ISVehicleMenu.onRemoveBurntVehicle(player, vehicle)
    esSorterAction.action = "craft";
    return baseISVehicleMenuonRemoveBurntVehicle(player, vehicle);
end