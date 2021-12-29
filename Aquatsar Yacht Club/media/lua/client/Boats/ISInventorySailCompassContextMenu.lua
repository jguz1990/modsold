
require 'AquaConfig'

local function repairSailPerform(playerObj, sail, item, thread, needle, addCondition)
    ISTimedActionQueue.add(ISRepairSailAction:new(playerObj, sail, item, thread, needle, addCondition));
end

local function showRepairSailMenu(playerObj, sail, context) 
    -- you need thread and needle
    local thread = playerObj:getInventory():getItemFromType("Thread", true, true);
    local needle = playerObj:getInventory():getItemFromType("Needle", true, true);
    local fabric1 = playerObj:getInventory():getItemFromType("RippedSheets", true, true);
    local fabric2 = playerObj:getInventory():getItemFromType("DenimStrips", true, true);
    local fabric3 = playerObj:getInventory():getItemFromType("LeatherStrips", true, true);
	local tailoringLevel = playerObj:getPerkLevel(Perks.Tailoring)
    if not thread or not needle or (not fabric1 and not fabric2 and not fabric3) or tailoringLevel < 4 then
        local patchOption = context:addOption(getText("IGUI_RepairSail"));
        patchOption.notAvailable = true;
        local tooltip = ISInventoryPaneContextMenu.addToolTip();
        tooltip.description = getText("IGUI_CantRepairSails");
        patchOption.toolTip = tooltip;
        return;
    end

    local repairOption = context:addOption(getText("IGUI_RepairSail"));
    local subRepairMenu = context:getNew(context)
    context:addSubMenu(repairOption, subRepairMenu)
    
    if fabric1 ~= nil then
        subRepairMenu:addOption(getItemNameFromFullType(fabric1:getFullType()) .. " (2%)", playerObj, repairSailPerform, sail, fabric1, thread, needle, 2)
    end

    if fabric2 ~= nil then
        subRepairMenu:addOption(getItemNameFromFullType(fabric2:getFullType()) .. " (5%)", playerObj, repairSailPerform, sail, fabric2, thread, needle, 5)
    end

    if fabric3 ~= nil then
        subRepairMenu:addOption(getItemNameFromFullType(fabric3:getFullType()) .. " (9%)", playerObj, repairSailPerform, sail, fabric3, thread, needle, 8)
    end
end

local function sayWindInfo(playerObj)
    local speed = AquaPhysics.Wind.getWindSpeed()
    local force = ""
    if speed <= 1 then 
        force = getText("IGUI_Wind_NoWind")
		playerObj:Say(force)
    elseif speed < AquaConfig.windVeryLight then
        force = getText("IGUI_Wind_VeryLight")
    elseif speed < AquaConfig.windLight then
        force = getText("IGUI_Wind_Light")
	elseif speed < AquaConfig.windMedium then
        force = getText("IGUI_Wind_Medium")
	elseif speed < AquaConfig.windStrong then
		force = getText("IGUI_Wind_Strong")
	elseif speed < AquaConfig.windVeryStrong then
		force = getText("IGUI_Wind_VeryStrong")
    else
        force = getText("IGUI_Wind_Storm")
    end
	if speed > 1 then 
		playerObj:Say(getText("IGUI_Wind") .. " " .. force .. ", " .. getText("IGUI_Wind_in") .. " " .. getText("IGUI_Wind_" .. AquaPhysics.Wind.inWindDirection()) .. " " .. getText("IGUI_Wind_direction"))
	end
end

local function aquaItemContextMenu( player, context, items)
    local playerObj = getSpecificPlayer(player)

    items = ISInventoryPane.getActualItems(items)

    for _, item in ipairs(items) do
        if item:getType() == "Compass" then
            if playerObj:isOutside() then
                context:addOption(getText("IGUI_sayWindInfo"), playerObj, sayWindInfo);   
            else
                context:addOption(getText("IGUI_needBeOutside_tosayWindInfo"));   
            end
        end
        if item:getType() == "Sails" and item:getCondition() < 100 then
            showRepairSailMenu(playerObj, item, context)
        end
	end
end

Events.OnFillInventoryObjectContextMenu.Add(aquaItemContextMenu);