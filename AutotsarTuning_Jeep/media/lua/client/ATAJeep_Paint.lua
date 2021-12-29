local oldISVehicleMenu = ISVehicleMenu.FillMenuOutsideVehicle

local paintTable = {}
paintTable["Base.ATAJeepArcher"] = 1
paintTable["Base.ATAJeepRubicon"] = 1
paintTable["Base.ATAJeepClassic"] = 1

local paintBus = function(playerObj, vehicle, newSkinIndex)
	ISTimedActionQueue.add(ISPathFindAction:pathToVehicleArea(playerObj, vehicle, "SeatFrontRight"))
	ISTimedActionQueue.add(ISPaintBus:new(playerObj, vehicle, "SeatFrontRight", newSkinIndex))
end

function ISVehicleMenu.FillMenuOutsideVehicle(player, context, vehicle, test)
	oldISVehicleMenu(player, context, vehicle, test)
	local playerObj = getSpecificPlayer(player)
	local playerInv = playerObj:getInventory()
	local paintBrush = playerInv:getFirstTypeRecurse("Paintbrush")
	if vehicle and paintBrush then
		if (paintTable[vehicle:getScriptName()]) and (vehicle:getSkinIndex()%2) ~= 1 then
			local paintCan = playerInv:getFirstTypeRecurse("PaintRed")
			if paintCan then
				context:addOption(getText("ContextMenu_Vehicle_EGNH"), playerObj, paintBus, vehicle, vehicle:getSkinIndex()+1)
			end
		end
	end
end


