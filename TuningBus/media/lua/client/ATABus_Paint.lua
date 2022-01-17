local oldISVehicleMenu = ISVehicleMenu.FillMenuOutsideVehicle

local paintBus = function(playerObj, vehicle)
	ISTimedActionQueue.add(ISPathFindAction:pathToVehicleArea(playerObj, vehicle, "SeatFrontRight"))
	ISTimedActionQueue.add(ISPaintBus:new(playerObj, vehicle, "SeatFrontRight", 1))
end

function ISVehicleMenu.FillMenuOutsideVehicle(player, context, vehicle, test)
	oldISVehicleMenu(player, context, vehicle, test)
	local playerObj = getSpecificPlayer(player)
	local playerInv = playerObj:getInventory()
	local paintBrush = playerInv:getFirstTypeRecurse("Paintbrush")
	if vehicle and paintBrush then
		if (vehicle:getScriptName() == "Base.ATAArmyBus") and vehicle:getSkinIndex() ~= 1 then
			local paintCan = playerInv:getFirstTypeRecurse("PaintWhite")
			if paintCan then
				context:addOption(getText("ContextMenu_Vehicle_EGNH"), playerObj, paintBus, vehicle)
			end
		elseif (vehicle:getScriptName() == "Base.ATAPrisonBus") and vehicle:getSkinIndex() ~= 1 then
			local paintCan = playerInv:getFirstTypeRecurse("PaintRed")
			if paintCan then
				context:addOption(getText("ContextMenu_Vehicle_EGNH"), playerObj, paintBus, vehicle)
			end
		elseif (vehicle:getScriptName() == "Base.ATASchoolBus") and vehicle:getSkinIndex() ~= 1 then
			local paintCan = playerInv:getFirstTypeRecurse("PaintGreen")
			if paintCan then
				context:addOption(getText("ContextMenu_Vehicle_EGNH"), playerObj, paintBus, vehicle)
			end
		end
	end
end

