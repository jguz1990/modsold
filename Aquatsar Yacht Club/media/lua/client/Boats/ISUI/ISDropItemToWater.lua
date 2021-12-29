require 'AquaConfig'

local function dropItems(items, playerObj)
	items = ISInventoryPane.getActualItems(items)
	for _,item in ipairs(items) do
		if item and not item:isFavorite() then
			ISTimedActionQueue.add(ISDropItemToWaterAction:new(playerObj, item))
		end
		-- if isForceDropHeavyItem(item) then
			-- playerObj:setPrimaryHandItem(nil);
			-- playerObj:setSecondaryHandItem(nil);
		-- end
	end
end

local function dropItemToWater( player, context, items)
    local playerObj = getSpecificPlayer(player)
	local boat = playerObj:getVehicle()
    if boat ~= nil and AquaConfig.isBoat(boat) then 
		context:removeOptionTsar(context:getOptionFromName(getText("ContextMenu_Drop")))
		if not boat:getPartById("InCabin" .. seatNameTable[boat:getSeat(playerObj)+1]) then
			context:addOption(getText("IGUI_DropToWater"), items, dropItems, playerObj);
		else
			
		end
    end
end

Events.OnFillInventoryObjectContextMenu.Add(dropItemToWater);