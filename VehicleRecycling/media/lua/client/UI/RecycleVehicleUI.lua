require "ISUI/ISModalDialog"
require "luautils"

if not RecycleVehicle then RecycleVehicle = {} end
if not RecycleVehicle.UI then RecycleVehicle.UI = {} end

-- ------------------------------------------------------
-- Copy of the same functions from ISBlacksmithMenu
-- for compatibility reasons
-- ------------------------------------------------------

local function comparatorDrainableUsesInt(item1, item2)
    return item1:getDrainableUsesInt() - item2:getDrainableUsesInt()
end

local function predicateDrainableUsesInt(item, count)
    return item:getDrainableUsesInt() >= count
end

local function getBlowTorchWithMostUses(container)
    return container:getBestTypeEvalRecurse("Base.BlowTorch", comparatorDrainableUsesInt)
end

local function getFirstBlowTorchWithUses(container, uses)
    return container:getFirstTypeEvalArgRecurse("Base.BlowTorch", predicateDrainableUsesInt, uses)
end

-- ------------------------------------------------------
-- The mod's functions
-- ------------------------------------------------------

local function onRecycleVehicleAux(player, button, vehicle, propaneNeeded)
    if button.internal == "NO" then return end

    if luautils.walkAdj(player, vehicle:getSquare()) then
        local blowTorch = getFirstBlowTorchWithUses(player:getInventory(), propaneNeeded)
        ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), blowTorch, true);
        local mask = player:getInventory():getFirstTypeRecurse("WeldingMask")
        if mask then
            ISInventoryPaneContextMenu.wearItem(mask, player:getPlayerNum())
        end
        ISTimedActionQueue.add(RecycleVehicleAction:new(player, vehicle, propaneNeeded))
    end
end

local function onRecycleVehicle(player, vehicle, propaneNeeded)
    local message = getText("IGUI_VehicleRecycling_ConfirmDialog_Vehicle")
    if vehicle:getScript():getName():find("Trailer") then
        message = getText("IGUI_VehicleRecycling_ConfirmDialog_Trailer")
    end

    local playerNum = player:getPlayerNum()
    local modal = ISModalDialog:new(0, 0, 350, 150, message, true, player, onRecycleVehicleAux, playerNum, vehicle, propaneNeeded)
    modal:initialise();
    modal:addToUIManager();
end

function RecycleVehicle.UI.addOptionToMenuOutsideVehicle(player, context, vehicle)
    --if RecycleVehicle.Utils.isBurnt(vehicle) and not RecycleVehicleOptions.overrideBurnt then return end
    --if RecycleVehicle.Utils.isSmashed(vehicle) and not RecycleVehicleOptions.overrideSmashed then return end
    if not RecycleVehicle.Utils.isBurnt(vehicle) and not RecycleVehicle.Utils.isSmashed(vehicle) then
        if not player:getInventory():containsTypeRecurse("BlowTorch") then return end
    end

    local propaneNeeded = 0
    for i = 1, vehicle:getPartCount() do
        local part = vehicle:getPartByIndex(i - 1)
        local partId = part:getId()

        if not (part:getItemType() and not part:getItemType():isEmpty() and not part:getInventoryItem()) then
            if not (partId:find("Wind") or partId:find("Headlight") or partId:find("TruckBed")
                    or partId:find("GloveBox") or partId:find("Engine") or partId:find("Heater")
                    or partId:find("PassengerCompartment") or partId == "TrunkDoorWreck") then
                propaneNeeded = propaneNeeded + 0.65
            end
        end
    end

    propaneNeeded = math.ceil(propaneNeeded) + RecycleVehicle.Utils.getBaseArea(vehicle)

    -- TODO: temporary fix for cases when more than one propane torch (>100 units) needed
    if propaneNeeded > 100 then
        propaneNeeded = 100
    end

    local optionText = getText("ContextMenu_VehicleRecycling_RemoveVehicle")
    if vehicle:getScript():getName():find("Trailer") then
        optionText = getText("ContextMenu_VehicleRecycling_RemoveTrailer")
    end

    local option
    -- Override the vanilla implementation for burnt or smashed vehicles
    --if RecycleVehicleOptions.overrideBurnt and RecycleVehicle.Utils.isBurnt(vehicle) then
    if RecycleVehicle.Utils.isBurnt(vehicle) then
        option = context:getOptionFromName(getText("ContextMenu_RemoveBurntVehicle"))
    end
    --if RecycleVehicleOptions.overrideSmashed and RecycleVehicle.Utils.isSmashed(vehicle) then
    if RecycleVehicle.Utils.isSmashed(vehicle) then
        option = context:getOptionFromName(getText("ContextMenu_RemoveBurntVehicle"))
    end

    if option then
        option.name = optionText
        option.target = player
        option.onSelect = onRecycleVehicle
        option.param1 = vehicle
        option.param2 = propaneNeeded
    else
        option = context:addOption(optionText, player, onRecycleVehicle, vehicle, propaneNeeded)
    end

    local toolTip = ISToolTip:new();
    toolTip:initialise();
    toolTip:setVisible(false);
    option.toolTip = toolTip;
    toolTip:setName(optionText);
    toolTip.description = getText("Tooltip_VehicleRecycling") .. " <LINE> <LINE> ";

    if player:getInventory():containsTypeRecurse("WeldingMask") then
        toolTip.description = toolTip.description .. " <LINE> <RGB:1,1,1> " .. getItemNameFromFullType("Base.WeldingMask");
    else
        toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> " .. getItemNameFromFullType("Base.WeldingMask");
        option.notAvailable = true;
    end

    local blowTorch = getBlowTorchWithMostUses(player:getInventory())
    if blowTorch then
        local blowTorchUsesLeft = blowTorch:getDrainableUsesInt();
        if blowTorchUsesLeft >= propaneNeeded then
            toolTip.description = toolTip.description .. " <LINE> <RGB:1,1,1> " .. getItemNameFromFullType("Base.BlowTorch") .. " " .. getText("ContextMenu_Uses") .. " " .. blowTorchUsesLeft .. "/" .. propaneNeeded;
        else
            toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> " .. getItemNameFromFullType("Base.BlowTorch") .. " " .. getText("ContextMenu_Uses") .. " " .. blowTorchUsesLeft .. "/" .. propaneNeeded;
            option.notAvailable = true;
        end
    else
        toolTip.description = toolTip.description .. " <LINE> <RGB:1,0,0> " .. getItemNameFromFullType("Base.BlowTorch") .. " 0/" .. propaneNeeded;
        option.notAvailable = true;
    end
end

-- Wrap the original function
if not RecycleVehicle.UI.defaultMenuOutsideVehicle then
    RecycleVehicle.UI.defaultMenuOutsideVehicle = ISVehicleMenu.FillMenuOutsideVehicle
end

-- Override the original function
function ISVehicleMenu.FillMenuOutsideVehicle(player, context, vehicle, test)
    RecycleVehicle.UI.defaultMenuOutsideVehicle(player, context, vehicle, test)
    RecycleVehicle.UI.addOptionToMenuOutsideVehicle(getSpecificPlayer(player), context, vehicle)
end