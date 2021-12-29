--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

ISBoatPartMenu = {}

function ISBoatPartMenu.getNearbyFuelPump(vehicle)
	local part = vehicle:getPartById("GasTank")
	if not part then return nil end
	local areaCenter = vehicle:getAreaCenter(part:getArea())
	if not areaCenter then return nil end
	local square = getCell():getGridSquare(areaCenter:getX(), areaCenter:getY(), vehicle:getZ())
	if not square then return nil end
	for dy=-2,2 do
		for dx=-2,2 do
			-- TODO: check line-of-sight between 2 squares
			local square2 = getCell():getGridSquare(square:getX() + dx, square:getY() + dy, square:getZ())
			if square2 and square2:getProperties():Is("fuelAmount") and tonumber(square2:getProperties():Val("fuelAmount")) > 0 then
				return square2
			end
		end
	end
end

function ISBoatPartMenu.getGasCanNotEmpty(playerObj, typeToItem)
	-- Prefer an equipped PetrolCan, then the emptiest PetrolCan.
	local equipped = playerObj:getPrimaryHandItem()
	if equipped and equipped:getType() == "PetrolCan" and equipped:getUsedDelta() > 0 then
		return equipped
	end
	if typeToItem["Base.PetrolCan"] then
		local gasCan = nil
		local usedDelta = 1.1
		for _,item in ipairs(typeToItem["Base.PetrolCan"]) do
			if item:getUsedDelta() > 0 and item:getUsedDelta() < usedDelta then
				gasCan = item
				usedDelta = gasCan:getUsedDelta()
			end
		end
		if gasCan then return gasCan end
	end
	return nil
end

function ISBoatPartMenu.getGasCanNotFull(playerObj, typeToItem)
	-- Prefer an equipped EmptyPetrolCan/PetrolCan, then the fullest PetrolCan, then any EmptyPetrolCan.
	local equipped = playerObj:getPrimaryHandItem()
	if equipped and equipped:getType() == "PetrolCan" and equipped:getUsedDelta() < 1 then
		return equipped
	elseif equipped and equipped:getType() == "EmptyPetrolCan" then
		return equipped
	end
	if typeToItem["Base.PetrolCan"] then
		local gasCan = nil
		local usedDelta = -1
		for _,item in ipairs(typeToItem["Base.PetrolCan"]) do
			if item:getUsedDelta() < 1 and item:getUsedDelta() > usedDelta then
				gasCan = item
				usedDelta = gasCan:getUsedDelta()
			end
		end
		if gasCan then return gasCan end
	end
	if typeToItem["Base.EmptyPetrolCan"] then
		return typeToItem["Base.EmptyPetrolCan"][1]
	end
	return nil
end

function ISBoatPartMenu.toPlayerInventory(playerObj, item)
	if item and item:getContainer() and item:getContainer() ~= playerObj:getInventory() then
		local action = ISInventoryTransferAction:new(playerObj, item, item:getContainer(), playerObj:getInventory())
		ISTimedActionQueue.add(action)
	end
end

function ISBoatPartMenu.transferRequiredItems(playerObj, part, tbl)
	if tbl and tbl.items then
		local typeToItem = VehicleUtils.getItems(playerObj:getPlayerNum())
		for _,item in pairs(tbl.items) do
			-- FIXME: handle drainables
			for i=1,tonumber(item.count) do
				ISBoatPartMenu.toPlayerInventory(playerObj, typeToItem[item.type][i])
			end
		end
	end
end

function ISBoatPartMenu.equipRequiredItems(playerObj, part, tbl)
	if tbl and tbl.items then
		for _,item in pairs(tbl.items) do
			local module,type = VehicleUtils.split(item.type, "\\.")
			type = type or item.type -- in case item.type has no '.'
			if item.equip == "primary" then
				ISWorldObjectContextMenu.equip(playerObj, playerObj:getPrimaryHandItem(), type, true)
			elseif item.equip == "secondary" then
				ISWorldObjectContextMenu.equip(playerObj, playerObj:getSecondaryHandItem(), type, false)
			elseif item.equip == "both" then
				ISWorldObjectContextMenu.equip(playerObj, playerObj:getPrimaryHandItem(), type, false, true)
			end
		end
	end
end

function ISBoatPartMenu.onInstallPart(playerObj, part, item)
	if not ISVehicleMechanics.cheat then
		-- if playerObj:getVehicle() then
			-- ISVehicleMenu.onExit(playerObj)
		-- end
		ISBoatPartMenu.toPlayerInventory(playerObj, item)
		local tbl = part:getTable("install")
		ISBoatPartMenu.transferRequiredItems(playerObj, part, tbl)
		local area = tbl.area or part:getArea()
		-- ISTimedActionQueue.add(ISPathFindAction:pathToVehicleArea(playerObj, part:getVehicle(), area))
		ISBoatPartMenu.equipRequiredItems(playerObj, part, tbl)
	end
	
	-- Open the engine cover if needed
	-- TODO: pop hood inside vehicle?
	local engineCover = nil
	local keyvalues = part:getTable("install")
	if keyvalues.door then
		local doorPart = part:getVehicle():getPartById(keyvalues.door)
		if doorPart and doorPart:getDoor() and doorPart:getInventoryItem() and not doorPart:getDoor():isOpen() then
			engineCover = doorPart
		end
	end
	
	local time = tonumber(keyvalues.time) or 50
	-- if engineCover and not ISVehicleMechanics.cheat then
		--ISTimedActionQueue.add(ISOpenVehicleDoor:new(playerObj, part:getVehicle(), engineCover))
		ISTimedActionQueue.add(ISInstallBoatPart:new(playerObj, part, item, time))
		--ISTimedActionQueue.add(ISCloseVehicleDoor:new(playerObj, part:getVehicle(), engineCover))
	--else
		--ISTimedActionQueue.add(ISInstallVehiclePart:new(playerObj, part, item, time))
	--end
end

function ISBoatPartMenu.onUninstallPart(playerObj, part)
	if not ISVehicleMechanics.cheat then
		-- if playerObj:getVehicle() then
			-- ISVehicleMenu.onExit(playerObj)
		-- end
		local tbl = part:getTable("uninstall")
		ISBoatPartMenu.transferRequiredItems(playerObj, part, tbl)
		local area = tbl.area or part:getArea()
		-- ISTimedActionQueue.add(ISPathFindAction:pathToVehicleArea(playerObj, part:getVehicle(), area))
		ISBoatPartMenu.equipRequiredItems(playerObj, part, tbl)
	end
	-- Open the engine cover if needed
	-- TODO: pop hood inside vehicle?
	local engineCover = nil;
	local keyvalues = part:getTable("install")
	if keyvalues.door then
		local doorPart = part:getVehicle():getPartById(keyvalues.door)
		if doorPart and doorPart:getDoor() and doorPart:getInventoryItem() and not doorPart:getDoor():isOpen() then
			engineCover = doorPart
		end
	end
	local time = tonumber(keyvalues.time) or 50
	-- if engineCover and not ISVehicleMechanics.cheat then
		-- ISTimedActionQueue.add(ISOpenVehicleDoor:new(playerObj, part:getVehicle(), engineCover))
		-- ISTimedActionQueue.add(ISUninstallBoatPart:new(playerObj, part, time))
		-- ISTimedActionQueue.add(ISCloseVehicleDoor:new(playerObj, part:getVehicle(), engineCover))
	-- else
		ISTimedActionQueue.add(ISUninstallBoatPart:new(playerObj, part, time))
	-- end
end

function ISBoatPartMenu.onPumpGasoline(playerObj, part)
	if playerObj:getVehicle() then
		ISVehicleMenu.onExit(playerObj)
	end
	local square = ISBoatPartMenu.getNearbyFuelPump(part:getVehicle())
	if square then
		local action = ISPathFindAction:pathToVehicleArea(playerObj, part:getVehicle(), part:getArea())
		action:setOnFail(ISBoatPartMenu.onPumpGasolinePathFail, playerObj)
		ISTimedActionQueue.add(action)
		ISTimedActionQueue.add(ISRefuelFromGasPump:new(playerObj, part, square, 100))
	end
end

function ISBoatPartMenu.onPumpGasolinePathFail(playerObj)
	playerObj:Say(getText("IGUI_PlayerText_NoWayToFuelTankInlet"));
end

function ISBoatPartMenu.onAddGasoline(playerObj, part)
	-- if playerObj:getVehicle() then
		-- ISVehicleMenu.onExit(playerObj)
	-- end
	local typeToItem = VehicleUtils.getItems(playerObj:getPlayerNum())
	local item = ISBoatPartMenu.getGasCanNotEmpty(playerObj, typeToItem)
	if item then
		ISBoatPartMenu.toPlayerInventory(playerObj, item)
		--ISTimedActionQueue.add(ISPathFindAction:pathToVehicleArea(playerObj, part:getVehicle(), part:getArea()))
		ISInventoryPaneContextMenu.equipWeapon(item, true, false, playerObj:getPlayerNum())
		ISTimedActionQueue.add(ISAddGasolineToBoat:new(playerObj, part, item, 50))
	end
end

function ISBoatPartMenu.onTakeGasoline(playerObj, part)
	-- if playerObj:getVehicle() then
		-- ISVehicleMenu.onExit(playerObj)
	-- end
	local typeToItem = VehicleUtils.getItems(playerObj:getPlayerNum())
	local item = ISBoatPartMenu.getGasCanNotFull(playerObj, typeToItem)
	if item then
		ISBoatPartMenu.toPlayerInventory(playerObj, item)
		--ISTimedActionQueue.add(ISPathFindAction:pathToVehicleArea(playerObj, part:getVehicle(), part:getArea()))
		ISInventoryPaneContextMenu.equipWeapon(item, false, false, playerObj:getPlayerNum())
		ISTimedActionQueue.add(ISTakeGasolineFromBoat:new(playerObj, part, item, 50))
	end
end

function ISBoatPartMenu.onDebugFill(playerObj, part)
	part:setContainerContentAmount(part:getContainerCapacity())
end

function ISBoatPartMenu.onInflateTire(playerObj, part)
	if not playerObj:getInventory():contains("TirePump", true) then return end
	if playerObj:getVehicle() then
		ISVehicleMenu.onExit(playerObj)
	end
	-- TODO: choose desired tire pressure (underinflated - recommended - max)
	ISTimedActionQueue.add(ISPathFindAction:pathToVehicleArea(playerObj, part:getVehicle(), part:getArea()))
	local pump = ISWorldObjectContextMenu.equip(playerObj, playerObj:getPrimaryHandItem(), "TirePump", true)
	local psiTarget = part:getContainerCapacity() + 5
	if round(part:getContainerContentAmount(), 2) < part:getContainerCapacity() then
		psiTarget = part:getContainerCapacity()
	end
	local maxTime = math.ceil(psiTarget - part:getContainerContentAmount()) * 100
	ISTimedActionQueue.add(ISInflateTire:new(playerObj, part, pump, psiTarget, maxTime))
end

function ISBoatPartMenu.onDeflateTire(playerObj, part)
	if playerObj:getVehicle() then
		ISVehicleMenu.onExit(playerObj)
	end
	-- TODO: choose desired tire pressure (underinflated - recommended - max)
	ISTimedActionQueue.add(ISPathFindAction:pathToVehicleArea(playerObj, part:getVehicle(), part:getArea()))
	ISTimedActionQueue.add(ISDeflateTire:new(playerObj, part, 0, (part:getContainerContentAmount() - 0) * 50))
end

function ISBoatPartMenu.onDeviceOptions(playerObj, part)
	if playerObj:getVehicle() ~= part:getVehicle() then
		if playerObj:getVehicle() then
			ISVehicleMenu.onExit(playerObj)
		end
		-- TODO: walk to vehicle and enter it
	end
	ISRadioWindow.activate(playerObj, part)
end

function ISBoatPartMenu.onLockDoor(playerObj, part)
	if playerObj:getVehicle() ~= part:getVehicle() then
		if playerObj:getVehicle() then
			ISVehicleMenu.onExit(playerObj)
		end
	end
	-- TODO: check key
	-- TODO: walk to door
	ISTimedActionQueue.add(ISLockVehicleDoor:new(playerObj, part))
end

function ISBoatPartMenu.onUnlockDoor(playerObj, part)
	if playerObj:getVehicle() ~= part:getVehicle() then
		if playerObj:getVehicle() then
			ISVehicleMenu.onExit(playerObj)
		end
	end
	-- TODO: check key
	-- TODO: walk to door
	ISTimedActionQueue.add(ISUnlockVehicleDoor:new(playerObj, part))
end

function ISBoatPartMenu.onOpenCloseWindow(playerObj, part, open)
	-- get seat to sit in to operate this window
	-- if seat occupied, fail
	-- if entrace blocked, find another seat we can sit it that can switch to the desired seat
	-- possibly allow operting window from outside, by opening the door first
	if playerObj:getVehicle() ~= part:getVehicle() then
		if playerObj:getVehicle() then
			ISVehicleMenu.onExit(playerObj)
		end
	end
	ISTimedActionQueue.add(ISOpenCloseVehicleWindow:new(playerObj, part, open, 50))
end


function ISBoatPartMenu.onLockDoors(playerObj, vehicle, lock)
--	if playerObj:getInventory():haveThisKeyId(vehicle:getKeyId()) or vehicle:isEngineRunning() then
	if playerObj:getVehicle() == vehicle then
		ISTimedActionQueue.add(ISLockDoors:new(playerObj, vehicle, lock, 10))
	end
end

function ISBoatPartMenu.onSmashWindow(playerObj, part, open)
	if playerObj:getVehicle() == part:getVehicle() then
	-- if in vehicle, must be in the seat
	else
		if playerObj:getVehicle() then
			ISVehicleMenu.onExit(playerObj)
		end
		ISTimedActionQueue.add(ISPathFindAction:pathToVehicleArea(playerObj, part:getVehicle(), part:getArea()))
	end

	ISTimedActionQueue.add(ISSmashVehicleWindow:new(playerObj, part))
end

function ISBoatPartMenu.onRenameBoat(playerObj, part, item)
	if not ISVehicleMechanics.cheat then
		-- ISBoatPartMenu.toPlayerInventory(playerObj, item)
		local tbl = part:getTable("install")
		ISBoatPartMenu.transferRequiredItems(playerObj, part, tbl)
		-- local area = tbl.area or part:getArea()
		-- ISTimedActionQueue.add(ISPathFindAction:pathToVehicleArea(playerObj, part:getVehicle(), area))
		ISBoatPartMenu.equipRequiredItems(playerObj, part, tbl)
	end
	
	-- Open the engine cover if needed
	-- TODO: pop hood inside vehicle?
	local keyvalues = part:getTable("install")
	local time = tonumber(keyvalues.time) or 50
	-- if engineCover and not ISVehicleMechanics.cheat then
		--ISTimedActionQueue.add(ISOpenVehicleDoor:new(playerObj, part:getVehicle(), engineCover))
	-- ISTimedActionQueue.add(ISUninstallBoatPart:new(playerObj, part, time))
	ISTimedActionQueue.add(ISRenameBoat:new(playerObj, part, item, time))
		--ISTimedActionQueue.add(ISCloseVehicleDoor:new(playerObj, part:getVehicle(), engineCover))
	--else
		--ISTimedActionQueue.add(ISInstallVehiclePart:new(playerObj, part, item, time))
	--end
end