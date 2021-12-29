-- --***********************************************************
-- --**                       AQUATSAR                        **
-- --***********************************************************

require "CommonTemplates/ISUI/ISCommonMenu" 
require 'AquaConfig'
require 'Vehicles/ISUI/ISVehicleMenuForTrailerWithBoat'

local TEMPVARS = {
	pos = Vector3f.new()
}

-- if not FindVehicleGas then
	-- FindVehicleGas = function(worldobjects, metalDrum, player)
		-- return false
	-- end
-- end

local function distanceToPassengerPosition(seatNum)
	local outside = TEMPVARS.boat:getPassengerPosition(seatNum, "outside")
	local worldPos = TEMPVARS.boat:getWorldPos(outside:getOffset(), TEMPVARS.pos)
	return TEMPVARS.playerObj:DistTo(worldPos:x(), worldPos:y())
end

function getClosestSeat(playerObj, boat, seats)
	if #seats == 0 then
		return nil
	end
	-- Sort by distance from the player to the 'outside' position.
	TEMPVARS.playerObj = playerObj
	TEMPVARS.boat = boat
	table.sort(seats, function(a,b)
		local distA = distanceToPassengerPosition(a)
		local distB = distanceToPassengerPosition(b)
		return distA < distB
	end)
	return seats[1]
end

-- local function starts_with(str, start)
   -- return str:sub(1, #start) == start
-- end

ISBoatMenu = {}

ISBoatMenu.oldShowRadialMenu = ISVehicleMenu.showRadialMenu

function ISVehicleMenu.showRadialMenu(playerObj)
	ISBoatMenu.oldShowRadialMenu(playerObj)
	local boat = ISBoatMenu.getBoatInside(playerObj)
	if boat then
		ISBoatMenu.showRadialMenu(playerObj)
		ISCommonMenu.showRadialMenu(playerObj)
		return
	end
	boat = ISBoatMenu.getBoatToInteractWith(playerObj)
	local vehicle = ISVehicleMenu.getVehicleToInteractWith(playerObj)
	if boat then
		if key == getCore():getKey("Toggle UI") and getCore():getGameMode() ~= "Tutorial" and not vehicle then
			ISUIHandler.toggleUI()
		end
		ISBoatMenu.showRadialMenuOutside(playerObj)
		return
	end
	if vehicle ~= nil and AquaConfig.Trailers[vehicle:getScript():getName()] then
		if AquaConfig.Trailers[vehicle:getScript():getName()].isWithBoat then
			ISVehicleMenuForTrailerWithBoat.launchRadialMenu(playerObj, vehicle)
		else
			ISVehicleMenuForTrailerWithBoat.loadOntoTrailerRadialMenu(playerObj, vehicle)
		end
	end
	-- ISCommonMenu.showRadialMenu(playerObj)
end

function ISBoatMenu.isWater(square)
	local tileName = square:getFloor():getTextureName()
	if not tileName then
		return true
	elseif string.match(string.lower(tileName), "blends_natural_02") then
		return true
	else
		return false
	end
    --return square:getFloor():getSprite():getProperties():Is(IsoFlagType.water)
end

function ISBoatMenu.onKeyStartPressed(key)
	local playerObj = getSpecificPlayer(0)
	if not playerObj then return end
	if playerObj:isDead() then return end
	local boat = playerObj:getVehicle()
	if not boat and playerObj:getModData()["blockForward"] then
		getCore():addKeyBinding("Forward", playerObj:getModData()["blockForward"])
		playerObj:getModData()["blockForward"] = nil
		getCore():addKeyBinding("Backward", playerObj:getModData()["blockBackward"])
		playerObj:getModData()["blockBackward"] = nil
		getCore():addKeyBinding("StartVehicleEngine", playerObj:getModData()["blockStartVehicleEngine"])
		playerObj:getModData()["StartVehicleEngine"] = nil
	elseif AquaConfig.isBoat(boat) and 
			boat:getPartById("ManualStarter") and
			(key == getCore():getKey("Forward") or 
			key == getCore():getKey("StartVehicleEngine") or 
			key == getCore():getKey("Backward")) and not boat:isEngineRunning() then
		playerObj:getModData()["blockForward"] = getCore():getKey("Forward")
		playerObj:getModData()["blockBackward"] = getCore():getKey("Backward")
		playerObj:getModData()["blockStartVehicleEngine"] = getCore():getKey("StartVehicleEngine")
		getCore():addKeyBinding("Forward", nil)
		getCore():addKeyBinding("Backward", nil)
		getCore():addKeyBinding("StartVehicleEngine", nil)
	elseif AquaConfig.isBoat(boat) and 
			boat:getPartById("ManualStarter") and 
			(key == playerObj:getModData()["blockForward"] or 
			key == playerObj:getModData()["blockBackward"] or 
			key == playerObj:getModData()["blockStartVehicleEngine"]) and 
			boat:isEngineRunning() then
		getCore():addKeyBinding("Forward", playerObj:getModData()["blockForward"])
		getCore():addKeyBinding("Backward", playerObj:getModData()["blockBackward"])
		getCore():addKeyBinding("StartVehicleEngine", playerObj:getModData()["blockStartVehicleEngine"])
	elseif key == getCore():getKey("Interact") then
		local boat = playerObj:getVehicle()
		if boat == nil then
			boat = ISBoatMenu.getBoatToInteractWith(playerObj)
			if boat then
				-- if playerObj:getSquare():Is(IsoFlagType.water) then
					ISBoatMenu.onEnter(playerObj, boat)
				-- else
					-- ISBoatMenu.onEnterFromGround(playerObj, boat)
				-- end
				-- ISTimedActionQueue.add(ISEnterVehicle:new(playerObj, boat, 0))
			end
		elseif AquaConfig.isBoat(boat) then
			ISBoatMenu.onExit(playerObj)
		end	
	-- elseif key == getCore():getKey("VehicleRadialMenu") and playerObj then
		-- -- 'V' can be 'Toggle UI' when outside a vehicle
		-- local boat = ISBoatMenu.getBoatInside(playerObj)
		-- if boat then
			-- ISBoatMenu.showRadialMenu(playerObj)
			-- return
		-- end
		-- boat = ISBoatMenu.getBoatToInteractWith(playerObj)
		-- local vehicle = ISVehicleMenu.getVehicleToInteractWith(playerObj)
		-- if boat then
			-- if key == getCore():getKey("Toggle UI") and getCore():getGameMode() ~= "Tutorial" and not vehicle then
				-- ISUIHandler.toggleUI()
			-- end
			-- ISBoatMenu.showRadialMenuOutside(playerObj)
			-- return
		-- end
		-- if vehicle ~= nil and AquaConfig.Trailers[vehicle:getScript():getName()] then
			-- if AquaConfig.Trailers[vehicle:getScript():getName()].isWithBoat then
				-- ISVehicleMenuForTrailerWithBoat.launchRadialMenu(playerObj, vehicle)
			-- else
				-- ISVehicleMenuForTrailerWithBoat.loadOntoTrailerRadialMenu(playerObj, vehicle)
			-- end
		-- end

	elseif key == getCore():getKey("VehicleSwitchSeat") then	
		local boat = ISBoatMenu.getBoatInside(playerObj)
		if boat then
			ISBoatMenu.onShowSeatUI(playerObj, boat)
			return
		end
		boat = ISBoatMenu.getBoatToInteractWith(playerObj)
		if boat then
			ISBoatMenu.onShowSeatUI(playerObj, boat)
			return
		end
	end
end

ISBoatMenu.onKeyPressed = function(key)
	local playerObj = getSpecificPlayer(0)
	if not playerObj then return end
	if playerObj:isDead() then return end
	if key == getCore():getKey("VehicleRadialMenu") and playerObj then
		-- 'V' can be 'Toggle UI' when outside a vehicle
		if not getCore():getOptionRadialMenuKeyToggle() then
			-- Hide radial menu when 'V' is released.
			local menu = getPlayerRadialMenu(0)
			if menu:isReallyVisible() then
				local boat = ISBoatMenu.getBoatInside(playerObj)
				if boat then
					ISBoatMenu.showRadialMenu(playerObj)
					return
				end
				boat = ISBoatMenu.getBoatToInteractWith(playerObj)
				if boat then
					ISBoatMenu.showRadialMenuOutside(playerObj)
					return
				end
			end
		end
	end
end


-- function ISBoatMenu.onKeyPressed(key)
	-- local playerObj = getSpecificPlayer(0)
	-- if not playerObj then return end
	-- if playerObj:isDead() then return end
	-- local boat = playerObj:getVehicle()
	-- if not boat then
		-- boat = ISBoatMenu.getVehicleToInteractWith(playerObj)
		-- if boat then
			-- if key == getCore():getKey("VehicleMechanics") then
				-- ISBoatMenu.onMechanic(playerObj, boat)
				-- return
			-- end
		-- end
		-- return
	-- end
	-- if key == getCore():getKey("StartVehicleEngine") then
		-- if boat:isEngineRunning() then
			-- ISBoatMenu.onShutOff(playerObj)
		-- else
			-- ISBoatMenu.onStartEngine(playerObj)
		-- end
	-- elseif key == getCore():getKey("VehicleHeater") then
		-- ISBoatMenu.onToggleHeater(playerObj)
	-- elseif key == getCore():getKey("VehicleMechanics") then
		-- ISBoatMenu.onMechanic(playerObj, boat)
	-- elseif key == getCore():getKey("VehicleHorn") then
		-- if boat:isDriver(playerObj) then
			-- ISBoatMenu.onHornStop(playerObj)
		-- end
	-- end
	-- -- Could be same as VehicleHorn key
	-- if key == getCore():getKey("Shout") then
		-- if not boat:isDriver(playerObj) then
			-- playerObj:Callout()
		-- end
	-- end
-- end


function ISBoatMenu.getBoatInside(player)
	local boat = player:getVehicle()
	if boat and AquaConfig.Boat(boat) then
		return boat
	end
end

function ISBoatMenu.getNearBoat(player)
	local boat = player:getNearVehicle()
	if boat and AquaConfig.Boat(boat) then
		return boat
	end
end

function ISBoatMenu.getSquaresFromDir(playerObj, lastx, lasty)
    local sqs = {}
	local px = playerObj:getX()
	local py = playerObj:getY()
	local pz = playerObj:getZ()
	local dx = math.floor(lastx/math.abs(lastx))
	local dy = math.floor(lasty/math.abs(lasty))
	local index = 1
	if math.abs(lastx) == math.abs(lasty) then
		local ymin = -1
		local ymax = 1
		for x = 0,lastx,dx do 
			for y = ymin,ymax,1 do
				table.insert(sqs, getCell():getGridSquare(px+x, py+y, 0))
			end
			ymin = ymin + dy
			ymax = ymax + dy
		end
    elseif lastx == 0 then
		for y = 0, lasty, dy do
			for x = -1,1 do
				table.insert(sqs, getCell():getGridSquare(px+x, py+y, 0))
			end
		end
	elseif lasty == 0 then
		for x = 0, lastx, dx do
			for y = -1,1 do
				table.insert(sqs, getCell():getGridSquare(px+x, py+y, 0))
			end
		end
	end
	return sqs
end

function ISBoatMenu.getBoatToInteractWith(playerObj)
	local boat = ISBoatMenu.getNearBoat(playerObj)
	if not boat then
		local sqs = {}
		local dir = playerObj:getDir()
		if (dir == IsoDirections.N) then sqs = ISBoatMenu.getSquaresFromDir(playerObj, 0,-2)
		elseif (dir == IsoDirections.NE) then sqs = ISBoatMenu.getSquaresFromDir(playerObj, 2,-2)
		elseif (dir == IsoDirections.E) then sqs = ISBoatMenu.getSquaresFromDir(playerObj, 2,0)
		elseif (dir == IsoDirections.SE) then sqs = ISBoatMenu.getSquaresFromDir(playerObj, 2,2)
		elseif (dir == IsoDirections.S) then sqs = ISBoatMenu.getSquaresFromDir(playerObj, 0,2)
		elseif (dir == IsoDirections.SW) then sqs = ISBoatMenu.getSquaresFromDir(playerObj, -2,2)
		elseif (dir == IsoDirections.W) then sqs = ISBoatMenu.getSquaresFromDir(playerObj, -2,0)
		elseif (dir == IsoDirections.NW) then sqs = ISBoatMenu.getSquaresFromDir(playerObj, -2,-2)
		end
		
		for _,sq in ipairs(sqs) do
			local boat2 = sq:getVehicleContainer()
			if boat2 then
				if AquaConfig.Boat(boat2) then
					boat = boat2
					break
				end
			end
		end
	end
	return boat
end


-- function ISBoatMenu.getNearLandForExit(boat)
	-- local square = boat:getSquare()
	-- if square == nil then return nil end
	-- local vec = Vector3f.new()
	
	-- local max_distance = 3
	-- local minDist = 9999999
	-- local nearestSq = nil

	-- for y=-max_distance, max_distance do
		-- for x=-max_distance, max_distance do
			-- local square2 = getCell():getGridSquare(square:getX() + x, square:getY() + y, 0)
			-- if square2 then
				-- if not ISBoatMenu.isWater(square2) and square2:isNotBlocked(true) then
					-- if nearestSq == nil then
						-- nearestSq = square2
						-- minDist = vec:set(square2:getX(), square2:getY(), 0):add(-square:getX(), -square:getY(), 0):length()
					-- else
						-- if vec:set(square2:getX(), square2:getY(), 0):add(-square:getX(), -square:getY(), 0):length() < minDist then
							-- nearestSq = square2
							-- minDist = vec:set(square2:getX(), square2:getY(), 0):add(-square:getX(), -square:getY(), 0):length()
						-- end
					-- end			
				-- end
			-- end
		-- end
	-- end

	-- if nearestSq == nil then return nil end

	-- return Vector3f.new(nearestSq:getX(), nearestSq:getY(), 0)
-- end



-- function ISBoatMenu.getBestSwitchSeatEnter(playerObj, boat, seatNum)
	-- local seats = {}
	-- for seat2=0,boat:getMaxPassengers()-1 do
		-- if seatNum ~= seat2 and
				-- boat:canSwitchSeat(seat2, seatNum) and
				-- not boat:isSeatOccupied(seat2) and
				-- not boat:isEnterBlocked(playerObj, seat2) then
			-- table.insert(seats, seat2)
		-- end
	-- end
	-- return getClosestSeat(playerObj, boat, seats)
-- end

-- function ISBoatMenu.getBestSwitchSeatExit(playerObj, boat, seatNum)
	-- local seats = {}
	-- for seat2=0,boat:getMaxPassengers()-1 do
		-- if seatNum ~= seat2 and
				-- boat:canSwitchSeat(seatNum, seat2) and
				-- not boat:isSeatOccupied(seat2) and
				-- not boat:isExitBlocked(seat2) then
			-- table.insert(seats, seat2)
		-- end
	-- end
	-- return getClosestSeat(playerObj, boat, seats)
-- end


function ISBoatMenu.getNearSquare(object, x_max, y_max, z)
	local squares = {}
	for y=-y_max, y_max do
		for x=-x_max, x_max do
			local square = getCell():getGridSquare(object:getX() + x, object:getY() + y, object:getZ())
			table.insert(squares, square)
		end
	end
	return squares
end

-- function ISBoatMenu.onEnterFromGround(playerObj, boat)
	-- local seat = ISBoatMenu.getBestSeatEnter(playerObj, boat, true)
	-- if seat then
		-- ISBoatMenu.onEnterAux(playerObj, boat, seat)
	-- -- else
		-- -- playerObj:Say(getText("IGUI_PlayerText_NeedSwim")) -- Проход заблокирован.
	-- end
-- end

function ISBoatMenu.onEnter(playerObj, boat)
	-- if boat:getModData()["AquaCabin_isUnlocked"] == nil then
		-- if ZombRand(100) < 20 then
			-- boat:getModData()["AquaCabin_isUnlocked"] = true			    
		-- end
	-- end
	local seat = ISBoatMenu.getBestSeatEnter(playerObj, boat)
	if seat then
		ISBoatMenu.onEnterAux(playerObj, boat, seat)
	else
		playerObj:Say(getText("IGUI_PlayerText_BoatSeatBlock")) -- Проход заблокирован.
	end
end

function ISBoatMenu.getBestSeatEnter(playerObj, boat, ground)
	local seats = {}
	for seat=0, boat:getMaxPassengers()-1 do
		local outside = boat:getPassengerPosition(seat, "outside")
		if outside and
				not boat:getCharacter(seat) then
			if ground then
				local worldPos = boat:getWorldPos(outside:getOffset(), TEMPVARS.pos)
				local squares = ISBoatMenu.getNearSquare(getCell():getGridSquare(TEMPVARS.pos:x(), TEMPVARS.pos:y(), 0), 1, 1)
				for i, square in pairs(squares) do
					if square and not ISBoatMenu.isWater(square) and square:isNotBlocked(true) then
						table.insert(seats, seat)
						break
					end
				end
			else
				table.insert(seats, seat)
			end
		end
	end
	return getClosestSeat(playerObj, boat, seats)
end

function ISBoatMenu.getBestSeatExit(playerObj, boat, ground)
	local seat = boat:getSeat(playerObj) -- print(getPlayer():getVehicle():getSeat(getPlayer()))
	local outside = boat:getPassengerPosition(seat, "outside")
	if outside then
		boat:getWorldPos(outside:getOffset(), TEMPVARS.pos)
		local squares = ISBoatMenu.getNearSquare(getCell():getGridSquare(TEMPVARS.pos:x(), TEMPVARS.pos:y(), 0), 1, 1)
		if ground then
			for i, square in pairs(squares) do
				if square and not ISBoatMenu.isWater(square) and square:isNotBlocked(true) then
					TEMPVARS.pos:set(square:getX(), square:getY(), 0)
					return TEMPVARS.pos
				end
			end
		elseif ground == false then
			return TEMPVARS.pos
		end
	end
	for seat2=0, boat:getMaxPassengers()-1 do
		outside = boat:getPassengerPosition(seat2, "outside")
		if outside then
			boat:getWorldPos(outside:getOffset(), TEMPVARS.pos)
			squares = ISBoatMenu.getNearSquare(getCell():getGridSquare(TEMPVARS.pos:x(), TEMPVARS.pos:y(), 0), 1, 1)
			if ground then
				for i, square in pairs(squares) do
					if square and not ISBoatMenu.isWater(square) and square:isNotBlocked(true) then
						TEMPVARS.pos:set(square:getX(), square:getY(), 0)
						return TEMPVARS.pos
					end
				end
			elseif ground == false then
				return TEMPVARS.pos
			end
		end
	end
	return nil
end

function ISBoatMenu.getBestSeatsEnter(playerObj, boat)
	local seats = {}
	for seat=0, boat:getMaxPassengers()-1 do
		if boat:getPassengerPosition(seat, "outside") and
				not boat:getCharacter(seat) then
			table.insert(seats, seat)
		end
	end
	return getClosestSeat(playerObj, boat, seats)
end

function ISBoatMenu.onEnterAux(playerObj, boat, seat)
	ISTimedActionQueue.add(ISEnterVehicle:new(playerObj, boat, seat))
end

-- function ISBoatMenu.onEnterAux2(playerObj, boat, seat)
	-- ISTimedActionQueue.add(ISEnterVehicle:new(playerObj, boat, seat))
-- end

function ISBoatMenu.onExit(playerObj)
    local boat = playerObj:getVehicle()
	if not boat then return end
    boat:updateHasExtendOffsetForExit(playerObj)
	if AquaConfig.isBoat(boat) then
		local inCabin = boat:getPartById("InCabin" .. seatNameTable[boat:getSeat(playerObj)+1])
		if math.abs(boat:getCurrentSpeedKmHour()) < 4 and not inCabin then 
			-- exitPoint = ISBoatMenu.getNearLandForExit(boat)
			local exitPoint = ISBoatMenu.getBestSeatExit(playerObj, boat, true)
			if exitPoint then
				ISTimedActionQueue.add(ISExitBoat:new(playerObj, exitPoint))
			else	
				ISBoatMenu.exitBoatOnWater(playerObj)
			end
			local emi = boat:getEmitter()
			TickControl.stopWeatherSound(emi)
		end
	end
end

function ISBoatMenu.onExitAux(playerObj, seatNum)
	local boat = playerObj:getVehicle()
	local doorPart = boat:getPassengerDoor(seatNum)
	if doorPart and doorPart:getDoor() and doorPart:getInventoryItem() then
		local door = doorPart:getDoor()
		if door:isLocked() then
			ISTimedActionQueue.add(ISUnlockVehicleDoor:new(playerObj, doorPart))
		end
		if not door:isOpen() then
			ISTimedActionQueue.add(ISOpenVehicleDoor:new(playerObj, boat, seatNum))
		end
		ISTimedActionQueue.add(ISExitVehicle:new(playerObj))
		ISTimedActionQueue.add(ISCloseVehicleDoor:new(playerObj, boat, doorPart))
	else
		ISTimedActionQueue.add(ISExitVehicle:new(playerObj))
	end
end

function ISBoatMenu.OnFillWorldObjectContextMenu(player, context, worldobjects, test)
	local playerObj = getSpecificPlayer(player)
	local boat = playerObj:getVehicle()
	if not boat then
		if JoypadState.players[player+1] then
			local px = playerObj:getX()
			local py = playerObj:getY()
			local pz = playerObj:getZ()
			local sqs = {}
			sqs[1] = getCell():getGridSquare(px, py, pz)
			local dir = playerObj:getDir()
			if (dir == IsoDirections.N) then        sqs[2] = getCell():getGridSquare(px-1, py-1, pz); sqs[3] = getCell():getGridSquare(px, py-1, pz);   sqs[4] = getCell():getGridSquare(px+1, py-1, pz);
			elseif (dir == IsoDirections.NE) then   sqs[2] = getCell():getGridSquare(px, py-1, pz);   sqs[3] = getCell():getGridSquare(px+1, py-1, pz); sqs[4] = getCell():getGridSquare(px+1, py, pz);
			elseif (dir == IsoDirections.E) then    sqs[2] = getCell():getGridSquare(px+1, py-1, pz); sqs[3] = getCell():getGridSquare(px+1, py, pz);   sqs[4] = getCell():getGridSquare(px+1, py+1, pz);
			elseif (dir == IsoDirections.SE) then   sqs[2] = getCell():getGridSquare(px+1, py, pz);   sqs[3] = getCell():getGridSquare(px+1, py+1, pz); sqs[4] = getCell():getGridSquare(px, py+1, pz);
			elseif (dir == IsoDirections.S) then    sqs[2] = getCell():getGridSquare(px+1, py+1, pz); sqs[3] = getCell():getGridSquare(px, py+1, pz);   sqs[4] = getCell():getGridSquare(px-1, py+1, pz);
			elseif (dir == IsoDirections.SW) then   sqs[2] = getCell():getGridSquare(px, py+1, pz);   sqs[3] = getCell():getGridSquare(px-1, py+1, pz); sqs[4] = getCell():getGridSquare(px-1, py, pz);
			elseif (dir == IsoDirections.W) then    sqs[2] = getCell():getGridSquare(px-1, py+1, pz); sqs[3] = getCell():getGridSquare(px-1, py, pz);   sqs[4] = getCell():getGridSquare(px-1, py-1, pz);
			elseif (dir == IsoDirections.NW) then   sqs[2] = getCell():getGridSquare(px-1, py, pz);   sqs[3] = getCell():getGridSquare(px-1, py-1, pz); sqs[4] = getCell():getGridSquare(px, py-1, pz);
			end
			for _,sq in ipairs(sqs) do
				boat = sq:getVehicleContainer()
				if AquaConfig.Boat(boat) then
					return ISBoatMenu.FillMenuOutsideBoat(playerObj, context, boat, test)
				end
			end
			return
		end
		boat = IsoObjectPicker.Instance:PickVehicle(getMouseXScaled(), getMouseYScaled())
		if AquaConfig.Boat(boat) then
			return ISBoatMenu.FillMenuOutsideBoat(playerObj, context, boat, test)
		end
		return
	else
		if AquaConfig.Boat(boat) then
			return ISBoatMenu.FillMenuInsideBoat(playerObj, context, boat, test)
		end
	end
end

function ISBoatMenu.showRadialMenu(playerObj)
	local isPaused = UIManager.getSpeedControls() and UIManager.getSpeedControls():getCurrentGameSpeed() == 0
	if isPaused then return end

	local boat = playerObj:getVehicle()
	local boatScriptName = boat:getScript():getName()
	if not boat then
		ISBoatMenu.showRadialMenuOutside(playerObj)
		return
	end

	local menu = getPlayerRadialMenu(playerObj:getPlayerNum())
	menu:clear()

	if menu:isReallyVisible() then
		if menu.joyfocus then
			setJoypadFocus(playerObj:getPlayerNum(), nil)
		end
		menu:undisplay()
		return
	end

	menu:setX(getPlayerScreenLeft(playerObj:getPlayerNum()) + getPlayerScreenWidth(playerObj:getPlayerNum()) / 2 - menu:getWidth() / 2)
	menu:setY(getPlayerScreenTop(playerObj:getPlayerNum()) + getPlayerScreenHeight(playerObj:getPlayerNum()) / 2 - menu:getHeight() / 2)
	

	local lightIsOn = true
	local timeHours = getGameTime():getHour()
	
	menu:addSlice(getText("IGUI_SwitchPlace"), getTexture("media/ui/boats/RadialMenu_ChangePlace.png"), ISBoatMenu.onShowSeatUI, playerObj, boat )
	
	local inCabin = boat:getPartById("InCabin" .. seatNameTable[boat:getSeat(playerObj)+1])
	if inCabin then
		if boat:getPartById("HeadlightRearRight") and 
				not boat:getPartById("HeadlightRearRight"):getInventoryItem() then
			if (timeHours > 22 or timeHours < 7) then
				lightIsOn = false
			end
		end
	end
	
	if boat:isDriver(playerObj) then -- and boat:isEngineWorking()
		local manualStarter = boat:getPartById("ManualStarter")
		if boat:isEngineRunning() then
			if manualStarter then
				menu:addSlice(getText("ContextMenu_VehicleShutOff"), getTexture("media/ui/boats/RadialMenu_StopEngine.png"), ISBoatMenu.onShutOff, playerObj)
			else
				menu:addSlice(getText("ContextMenu_VehicleShutOff"), getTexture("media/ui/vehicles/vehicle_ignitionOFF.png"), ISBoatMenu.onShutOff, playerObj)
			end
		else
			if boat:isEngineStarted() then
--				menu:addSlice("Ignition", getTexture("media/ui/vehicles/vehicle_ignitionON.png"), ISBoatMenu.onStartEngine, playerObj)
			else
				if manualStarter then 
					if manualStarter:getInventoryItem() and manualStarter:getCondition() > 0 then
						menu:addSlice(getText("ContextMenu_VehicleStartEngineManual"), getTexture("media/ui/boats/RadialMenu_ManualStarter.png"), ISBoatMenu.onStartEngineManualy, playerObj, manualStarter)
					else
						menu:addSlice(getText("ContextMenu_VehicleManualStarterDamage"), getTexture("media/ui/boats/RadialMenu_ManualStarterDamage.png"), nil)
					end
				elseif (SandboxVars.VehicleEasyUse) then
					menu:addSlice(getText("ContextMenu_VehicleStartEngine"), getTexture("media/ui/vehicles/vehicle_ignitionON.png"), ISBoatMenu.onStartEngine, playerObj)
				elseif not boat:isHotwired() and (playerObj:getInventory():haveThisKeyId(boat:getKeyId()) or boat:isKeysInIgnition()) then
					menu:addSlice(getText("ContextMenu_VehicleStartEngine"), getTexture("media/ui/vehicles/vehicle_ignitionON.png"), ISBoatMenu.onStartEngine, playerObj)
				elseif boat:isHotwired() then
					menu:addSlice(getText("ContextMenu_VehicleStartEngine"), getTexture("media/ui/vehicles/vehicle_ignitionON.png"), ISBoatMenu.onStartEngine, playerObj)
				else
					if ((playerObj:getPerkLevel(Perks.Electricity) >= 1 and playerObj:getPerkLevel(Perks.Mechanics) >= 2) or playerObj:HasTrait("Burglar")) then
						menu:addSlice(getText("ContextMenu_VehicleHotwire"), getTexture("media/ui/vehicles/vehicle_ignitionON.png"), ISBoatMenu.onHotwire, playerObj)
					else
						menu:addSlice(getText("ContextMenu_BoatHotwireSkill"), getTexture("media/ui/vehicles/vehicle_ignitionOFF.png"), nil, playerObj)
					end
--					menu:addSlice("You need keys or\nelectricity level 1 and\nmechanic level 2\nto hotwire", getTexture("media/ui/vehicles/vehicle_ignitionOFF.png"), nil, playerObj)
				end
			end
		end
	end

	if boat:isDriver(playerObj) and boat:hasHeadlights() then
		if boat:getPartById("HeadlightLeft"):getInventoryItem() or boat:getPartById("HeadlightRight"):getInventoryItem() then
			menu:addSlice(getText("ContextMenu_BoatHeadlightsOff"), getTexture("media/ui/vehicles/vehicle_lightsOFF.png"), ISBoatMenu.offToggleHeadlights, playerObj)
		else
			menu:addSlice(getText("ContextMenu_BoatHeadlightsOn"), getTexture("media/ui/vehicles/vehicle_lightsON.png"), ISBoatMenu.onToggleHeadlights, playerObj)
		end
	end
	
	if boat:isDriver(playerObj) and boat:hasHorn() then
		menu:addSlice(getText("ContextMenu_VehicleHorn"), getTexture("media/ui/vehicles/vehicle_horn.png"), ISBoatMenu.onHorn, playerObj)
	end
	
	if boat:isDriver(playerObj) and boat:hasLightbar() then
		menu:addSlice(getText("ContextMenu_VehicleLightbar"), getTexture("media/ui/vehicles/vehicle_lightbar.png"), ISBoatMenu.onLightbar, playerObj)
	end

	-- Swim
	boat:updateHasExtendOffsetForExit(playerObj)
	if not inCabin and boat:getCurrentSpeedKmHour() < 10 and boat:getCurrentSpeedKmHour() > -10 then -- and not ISBoatMenu.getNearLandForExit(boat)
		menu:addSlice(getText("ContextMenu_SwimToLand"), getTexture("media/ui/boats/ICON_boat_swim.png"), ISBoatMenu.exitBoatOnWater, playerObj)
	end
	
	if not inCabin and boat:getPartById("Sails") and boat:getPartById("Sails"):getInventoryItem() then
		if boat:getModData().sailCode ~= 0 then
			menu:addSlice(getText("ContextMenu_RemoveSail"), getTexture("media/ui/boats/ICON_remove_sails.png"), ISBoatMenu.RemoveSails, playerObj, boat)
		end
		if boat:getModData().sailCode ~= 1 then
			menu:addSlice(getText("ContextMenu_SetLeftSail"), getTexture("media/ui/boats/ICON_set_left_sails.png"), ISBoatMenu.SetLeftSails, playerObj, boat)
		end
		if boat:getModData().sailCode ~= 2 then
			menu:addSlice(getText("ContextMenu_SetRightSail"), getTexture("media/ui/boats/ICON_set_right_sails.png"), ISBoatMenu.SetRightSails, playerObj, boat)
		end
	end

	-- Cabin
	-- if inCabin and not boat:getModData()["AquaCabin_isUnlocked"] then	
		-- local func =  function(arg_boat, arg_pl) 
			-- arg_boat:getModData()["AquaCabin_isUnlocked"] = true
			-- arg_pl:getEmitter():playSound("UnlockDoor")
		-- end
		-- menu:addSlice(getText("ContextMenu_Open_Cabin"), getTexture("media/ui/boats/RadialMenu_Door.png"), func, boat, playerObj)
	-- end
	if not boat:getModData()["AquaCabin_isUnlocked"] then
		if playerObj:getInventory():haveThisKeyId(boat:getKeyId()) or inCabin then
			local func =  function(arg_boat, arg_pl) 
				arg_boat:getModData()["AquaCabin_isUnlocked"] = true
				arg_pl:getEmitter():playSound("UnlockDoor")
			end
			menu:addSlice(getText("ContextMenu_Open_Cabin"), getTexture("media/ui/boats/RadialMenu_Door.png"), func, boat, playerObj)
		else
			-- Предметы с помощью которых можно вскрыть каюту
			local openTools = {
				Crowbar = 60, 
				Screwdriver = 40, 
				HuntingKnife = 35, 
				BreadKnife = 35,
				KitchenKnife = 30, 
				LetterOpener = 25, 
				ButterKnife = 25, 
				IcePick = 20, 
				Scalpel = 20, 
			}
			local opener = ""
			for tool, chance in pairs(openTools) do
				opener = playerObj:getInventory():getFirstTypeRecurse(tool)
				if opener then
					
					break
				end
			end
			
			if opener then
				local bored = playerObj:getBodyDamage():getBoredomLevel() > 25
				local tired = playerObj:getStats():getEndurance() < 0.7
				local unhappy = playerObj:getBodyDamage():getUnhappynessLevel() > 20

				if not tired and not bored and not unhappy then				
					local func = function(arg_boat, arg_pl) 
						ISTimedActionQueue.add(ISEquipWeaponAction:new(playerObj, opener, 50, true, true));
						ISTimedActionQueue.add(ISForceUnlockCabin:new(playerObj, boat, opener, openTools[opener:getType()]));
					end
					menu:addSlice(getText("ContextMenu_Open_Cabin_Force", string.lower(opener:getName())), getTexture("media/ui/boats/RadialMenu_Door.png"), func, boat, playerObj)
				elseif tired then
					menu:addSlice(getText("ContextMenu_cabinForceUnlock_tooTired"), getTexture("media/ui/boats/RadialMenu_Door.png"), nil)
				elseif bored then
					menu:addSlice(getText("ContextMenu_cabinForceUnlock_tooBored"), getTexture("media/ui/boats/RadialMenu_Door.png"), nil)
				elseif unhappy then
					menu:addSlice(getText("ContextMenu_cabinForceUnlock_tooUnhappy"), getTexture("media/ui/boats/RadialMenu_Door.png"), nil)
				end
			else
				menu:addSlice(getText("ContextMenu_Open_Cabin_Force_Need_Crowbar"), getTexture("media/ui/boats/RadialMenu_Door.png"))
			end
		end
	elseif boat:getModData()["AquaCabin_isUnlocked"] and not boat:getModData()["AquaCabin_isLockRuined"] then
		if playerObj:getInventory():haveThisKeyId(boat:getKeyId()) or inCabin  then
			local func = function(arg_boat, arg_pl) 
				arg_boat:getModData()["AquaCabin_isUnlocked"] = false
				arg_pl:getEmitter():playSound("LockDoor")
			end
			menu:addSlice(getText("ContextMenu_Close_Cabin"), getTexture("media/ui/boats/RadialMenu_Door.png"), func, boat, playerObj)
		end
	end

	if inCabin and lightIsOn then
		for partIndex=1,boat:getPartCount() do
			local part = boat:getPartByIndex(partIndex-1)
			if part:getDeviceData() and part:getInventoryItem() then
				menu:addSlice(getText("IGUI_DeviceOptions"), getTexture("media/ui/vehicles/vehicle_speakersON.png"), ISBoatMenu.onSignalDevice, playerObj, part)
			end
		end
	end
	
	if not inCabin then
		local playerIndex = playerObj:getPlayerNum()
		ISBoatMenu.FillPartMenu(playerIndex, nil, menu, boat)
	end

	-- local door = boat:getPassengerDoor(seatNum)
	-- local windowPart = VehicleUtils.getChildWindow(door)
	-- if windowPart and (not windowPart:getItemType() or windowPart:getInventoryItem()) then
		-- local window = windowPart:getWindow()
		-- if window:isOpenable() and not window:isDestroyed() then
			-- if window:isOpen() then
				-- option = menu:addSlice(getText("ContextMenu_Close_window"), getTexture("media/ui/vehicles/vehicle_windowCLOSED.png"), ISVehiclePartMenu.onOpenCloseWindow, playerObj, windowPart, false)
			-- else
				-- option = menu:addSlice(getText("ContextMenu_Open_window"), getTexture("media/ui/vehicles/vehicle_windowOPEN.png"), ISVehiclePartMenu.onOpenCloseWindow, playerObj, windowPart, true)
			-- end
		-- end
	-- end

	-- local locked = boat:isAnyDoorLocked()
	-- if JoypadState.players[playerObj:getPlayerNum()+1] then
		-- -- Hack: Mouse players click the trunk icon in the dashboard.
		-- locked = locked or boat:isTrunkLocked()
	-- end
	-- if locked then
		-- menu:addSlice(getText("ContextMenu_Unlock_Doors"), getTexture("media/ui/vehicles/vehicle_lockdoors.png"), ISVehiclePartMenu.onLockDoors, playerObj, boat, false)
	-- else
		-- menu:addSlice(getText("ContextMenu_Lock_Doors"), getTexture("media/ui/vehicles/vehicle_lockdoors.png"), ISVehiclePartMenu.onLockDoors, playerObj, boat, true)
	-- end
	
--	menu:addSlice("Honk", texture, { playerObj, ISBoatMenu.onHonk })
	-- if boat:getCurrentSpeedKmHour() > 1 then
		-- menu:addSlice(getText("ContextMenu_VehicleMechanicsStopCar"), getTexture("media/ui/vehicles/vehicle_repair.png"), nil, playerObj, boat )
	-- else
		-- if seatNum == 1 then
			-- if boat:isEngineRunning() then
				-- menu:addSlice(getText("NEWContextMenu_EngineMustBeStop"), getTexture("media/ui/vehicles/vehicle_repair.png"), nil, nil, nil) -- Необходимо заглушить двигатель
			-- else

	menu:addSlice(getText("ContextMenu_VehicleMechanics"), getTexture("media/ui/vehicles/vehicle_repair.png"), ISBoatMenu.onMechanic, playerObj, boat )

			-- end
		--end
	-- end
	if (not isClient() or getServerOptions():getBoolean("SleepAllowed")) and inCabin then
		local doSleep = true;
		if playerObj:getStats():getFatigue() <= 0.3 then
			menu:addSlice(getText("IGUI_Sleep_NotTiredEnough"), getTexture("media/ui/vehicles/vehicle_sleep.png"), nil, playerObj, boat)
			doSleep = false;
		elseif boat:getCurrentSpeedKmHour() > 10 or boat:getCurrentSpeedKmHour() < -10 then
			menu:addSlice(getText("IGUI_PlayerText_CanNotSleepInMovingBoat"), getTexture("media/ui/vehicles/vehicle_sleep.png"), nil, playerObj, boat)
			doSleep = false;
		else
			-- Sleeping pills counter those sleeping problems
			if playerObj:getSleepingTabletEffect() < 2000 then
				-- In pain, can still sleep if really tired
				if playerObj:getMoodles():getMoodleLevel(MoodleType.Pain) >= 2 and playerObj:getStats():getFatigue() <= 0.85 then
					menu:addSlice(getText("ContextMenu_PainNoSleep"), getTexture("media/ui/vehicles/vehicle_sleep.png"), nil, playerObj, boat)
					doSleep = false;
					-- In panic
				elseif playerObj:getMoodles():getMoodleLevel(MoodleType.Panic) >= 1 then
					menu:addSlice(getText("ContextMenu_PanicNoSleep"), getTexture("media/ui/vehicles/vehicle_sleep.png"), nil, playerObj, boat)
					doSleep = false;
					-- tried to sleep not so long ago
				elseif (playerObj:getHoursSurvived() - playerObj:getLastHourSleeped()) <= 1 then
					menu:addSlice(getText("ContextMenu_NoSleepTooEarly"), getTexture("media/ui/vehicles/vehicle_sleep.png"), nil, playerObj, boat)
					doSleep = false;
				end
			end
		end
		if doSleep then
			menu:addSlice(getText("ContextMenu_Sleep"), getTexture("media/ui/vehicles/vehicle_sleep.png"), ISBoatMenu.onSleep, playerObj, boat);
		end
	end
		
	if boat:getCurrentSpeedKmHour() < 5 and boat:getCurrentSpeedKmHour() > -5 then
		if ISBoatMenu.getBestSeatExit(playerObj, boat, true) then
			menu:addSlice(getText("IGUI_ExitBoat"), getTexture("media/ui/boats/RadialMenu_ExitOnGround.png"), ISBoatMenu.onExit, playerObj)
			if not inCabin then
				if not boat:getModData()["aqua_anchor_on"] then
					boat:getModData()["aqua_anchor_on"] = false
					local funcAnchor = function(boat) ISTimedActionQueue.add(ISAnchorAction:new(playerObj, boat, true, "rope")) end
					menu:addSlice(getText("ContextMenu_bind_boat"), getTexture("media/ui/boats/RadialMenu_BoatBind.png"), funcAnchor, boat)
				else
					local funcAnchor = function(boat) ISTimedActionQueue.add(ISAnchorAction:new(playerObj, boat, false, "rope")) end
					menu:addSlice(getText("ContextMenu_unbind_boat"), getTexture("media/ui/boats/RadialMenu_BoatUnbind.png"), funcAnchor, boat)
				end
			end
		else
			if not inCabin then
				if not boat:getModData()["aqua_anchor_on"] then
					boat:getModData()["aqua_anchor_on"] = false
					local funcAnchor = function(boat) ISTimedActionQueue.add(ISAnchorAction:new(playerObj, boat, true, "anchor")) end
					menu:addSlice(getText("ContextMenu_set_anchor_on"), getTexture("media/ui/boats/RadialMenu_AnchorDown.png"), funcAnchor, boat)
				else
					local funcAnchor = function(boat) ISTimedActionQueue.add(ISAnchorAction:new(playerObj, boat, false, "anchor")) end
					menu:addSlice(getText("ContextMenu_set_anchor_off"), getTexture("media/ui/boats/RadialMenu_AnchorUp.png"), funcAnchor, boat)
				end
			end
		end
	end
	
	menu:addToUIManager()

	if JoypadState.players[playerObj:getPlayerNum()+1] then
		menu:setHideWhenButtonReleased(Joypad.DPadUp)
		setJoypadFocus(playerObj:getPlayerNum(), menu)
		playerObj:setJoypadIgnoreAimUntilCentered(true)
	end
end

function ISBoatMenu.onToggleHeadlights(playerObj)
	local boat = playerObj:getVehicle()
	if not boat then return end
	local workingLight = false
	local rightLight = boat:getPartById("LightFloodlightRight")
	if rightLight and rightLight:getInventoryItem() then
		local apipart = boat:getPartById("HeadlightRight")
		local newInvItem = InventoryItemFactory.CreateItem("Base.LightBulb")
		newInvItem:setCondition(rightLight:getInventoryItem():getCondition())
		apipart:setInventoryItem(newInvItem, 10)
		workingLight = true
	end
	local leftLight = boat:getPartById("LightFloodlightLeft")
	if leftLight and leftLight:getInventoryItem() then
		local apipart = boat:getPartById("HeadlightLeft")
		local newInvItem = InventoryItemFactory.CreateItem("Base.LightBulb")
		newInvItem:setCondition(leftLight:getInventoryItem():getCondition())
		apipart:setInventoryItem(newInvItem, 10)
		workingLight = true
	end
	if workingLight then
		sendClientCommand(playerObj, 'vehicle', 'setHeadlightsOn', { on = true })
	else
		playerObj:Say(getText("IGUI_PlayerText_FloodlightsDoNotWork"))
	end
end

function ISBoatMenu.offToggleHeadlights(playerObj)
	local boat = playerObj:getVehicle()
	if not boat then return end
	local part = boat:getPartById("HeadlightRight")
	part:setInventoryItem(nil)
	part = boat:getPartById("HeadlightLeft")
	part:setInventoryItem(nil)
	local lightIsOn = false
	part = boat:getPartById("HeadlightRearRight")
	if part then
		if part:getInventoryItem() then
			lightIsOn = true
		end
	end
	part = boat:getPartById("HeadlightRearLeft")
	if part then
		if part:getInventoryItem() then
			lightIsOn = true
		end
	end
	if not lightIsOn then
		sendClientCommand(playerObj, 'vehicle', 'setHeadlightsOn', { on = false })
	end
end

function ISBoatMenu.exitBoatOnWater(playerObj)
	local vehicle = playerObj:getVehicle()
	vehicle:exit(playerObj)
	playerObj:PlayAnim("Idle")
	triggerEvent("OnExitVehicle", playerObj)
	vehicle:updateHasExtendOffsetForExitEnd(playerObj)
end

function ISBoatMenu.replaceBoat(boat, newSriptName)
	local partsTable = {}
	local keyId = boat:getKeyId()
	for i=1, boat:getScript():getPartCount() do
		local part = boat:getPartByIndex(i-1)
		partsTable[part:getId()] = {}
		partsTable[part:getId()]["InventoryItem"] = part:getInventoryItem()
		partsTable[part:getId()]["Condition"] = part:getCondition()
		partsTable[part:getId()]["ItemContainer"] = nil
		local itemContainer = part:getItemContainer()
		if itemContainer and not itemContainer:isEmpty() then
			partsTable[part:getId()]["ItemContainer"] = itemContainer
		end
	end
	boat:setScriptName(newSriptName)
	boat:scriptReloaded()
	for i=1, boat:getScript():getPartCount() do
		local part = boat:getPartByIndex(i-1)
		part:setInventoryItem(partsTable[part:getId()]["InventoryItem"])
		part:setCondition(partsTable[part:getId()]["Condition"])
		if partsTable[part:getId()]["ItemContainer"] then
			part:setItemContainer(partsTable[part:getId()]["ItemContainer"])
		end
	end
	boat:setKeyId(keyId)
	boat:setDebugZ(0.75)
	return boat
end

function ISBoatMenu.RemoveSails(playerObj, boat)
	ISTimedActionQueue.add(ISRemoveSailAction:new(playerObj, boat));
end

function ISBoatMenu.SetRightSails(playerObj, boat)
	ISTimedActionQueue.add(ISSetSailAction:new(playerObj, boat, "RIGHT"));
end

function ISBoatMenu.SetLeftSails(playerObj, boat)
	ISTimedActionQueue.add(ISSetSailAction:new(playerObj, boat, "LEFT"));
end

function ISBoatMenu.showRadialMenuOutside(playerObj)
	if playerObj:getVehicle() then return end
	
	local playerIndex = playerObj:getPlayerNum()
	local menu = getPlayerRadialMenu(playerIndex)
	-- For keyboard, toggle visibility
	if menu:isReallyVisible() then
		if menu.joyfocus then
			setJoypadFocus(playerIndex, nil)
		end
		menu:undisplay()
		menu:removeFromUIManager()
		return
	end

	menu:clear()

	local boat = ISBoatMenu.getBoatToInteractWith(playerObj)

	if boat then
		-- menu:addSlice(getText("ContextMenu_VehicleMechanics"), getTexture("media/ui/vehicles/vehicle_repair.png"), ISBoatMenu.onMechanic, playerObj, boat)
		
		if boat:getScript() and boat:getScript():getPassengerCount() > 0 then
			menu:addSlice(getText("IGUI_EnterBoat"), getTexture("media/ui/boats/RadialMenu_ChangePlace.png"), ISBoatMenu.onShowSeatUI, playerObj, boat )
		end
		-- local fuel_truck_source = FindVehicleGas(playerObj, vehicle)
		
		
		
		--
	
		-- local doorPart = boat:getUseablePart(playerObj)
		-- if doorPart and doorPart:getDoor() and doorPart:getInventoryItem() then
			-- local isHood = doorPart:getId() == "EngineDoor"
			-- local isTrunk = doorPart:getId() == "TrunkDoor" or doorPart:getId() == "DoorRear"
			-- if doorPart:getDoor():isOpen() then
				-- local label = "ContextMenu_Close_door"
				-- if isHood then label = "IGUI_CloseHood" end
				-- if isTrunk then label = "IGUI_CloseTrunk" end
				-- menu:addSlice(getText(label), getTexture("media/ui/vehicles/vehicle_exit.png"), ISBoatMenu.onCloseDoor, playerObj, doorPart)
			-- else
				-- local label = "ContextMenu_Open_door"
				-- if isHood then label = "IGUI_OpenHood" end
				-- if isTrunk then label = "IGUI_OpenTrunk" end
				-- menu:addSlice(getText(label), getTexture("media/ui/vehicles/vehicle_exit.png"), ISBoatMenu.onOpenDoor, playerObj, doorPart)
				-- if boat:canUnlockDoor(doorPart, playerObj) then
					-- label = "ContextMenu_UnlockDoor"
					-- if isHood then label = "IGUI_UnlockHood" end
					-- if isTrunk then label = "IGUI_UnlockTrunk" end
					-- menu:addSlice(getText(label), getTexture("media/ui/vehicles/vehicle_lockdoors.png"), ISBoatMenu.onUnlockDoor, playerObj, doorPart)
				-- elseif boat:canLockDoor(doorPart, playerObj) then
					-- label = "ContextMenu_LockDoor"
					-- if isHood then label = "IGUI_LockHood" end
					-- if isTrunk then label = "IGUI_LockTrunk" end
					-- menu:addSlice(getText(label), getTexture("media/ui/vehicles/vehicle_lockdoors.png"), ISBoatMenu.onLockDoor, playerObj, doorPart)
				-- end
			-- end
		-- end

		-- local part = boat:getClosestWindow(playerObj);
		-- if part then
			-- local window = part:getWindow()
			-- if not window:isDestroyed() and not window:isOpen() then
				-- menu:addSlice(getText("ContextMenu_Vehicle_Smashwindow", getText("IGUI_VehiclePart" .. part:getId())),
					-- getTexture("media/ui/vehicles/vehicle_smash_window.png"),
					-- ISVehiclePartMenu.onSmashWindow, playerObj, part)
			-- end
		-- end

		--ISBoatMenu.doTowingMenu(playerObj, boat, menu)
	end
	
	menu:setX(getPlayerScreenLeft(playerIndex) + getPlayerScreenWidth(playerIndex) / 2 - menu:getWidth() / 2)
	menu:setY(getPlayerScreenTop(playerIndex) + getPlayerScreenHeight(playerIndex) / 2 - menu:getHeight() / 2)
	menu:addToUIManager()
	if JoypadState.players[playerObj:getPlayerNum()+1] then
		menu:setHideWhenButtonReleased(Joypad.DPadUp)
		setJoypadFocus(playerObj:getPlayerNum(), menu)
		playerObj:setJoypadIgnoreAimUntilCentered(true)
	end
	-- ISUIHandler.toggleUI()
end

-- function ISBoatMenu.doTowingMenu(playerObj, boat, menu)
	-- if boat:getVehicleTowing() then
		-- menu:addSlice(getText("ContextMenu_Vehicle_DetachTrailer"), getTexture("media/ui/ZoomOut.png"), ISBoatMenu.onDetachTrailer, playerObj, boat, boat:getTowAttachmentSelf())
		-- return
	-- end
	-- if boat:getVehicleTowedBy() then
		-- menu:addSlice(getText("ContextMenu_Vehicle_DetachTrailer"), getTexture("media/ui/ZoomOut.png"), ISBoatMenu.onDetachTrailer, playerObj, boat:getVehicleTowedBy(), boat:getVehicleTowedBy():getTowAttachmentSelf())
		-- return
	-- end

	-- local attachmentA, attachmentB = "trailer", "trailer"
	-- local vehicleB = ISVehicleTrailerUtils.getTowableVehicleNear(boat:getSquare(), boat, attachmentA, attachmentB)
	-- if vehicleB then
		-- local aName = ISBoatMenu.getVehicleDisplayName(boat)
		-- local bName = ISBoatMenu.getVehicleDisplayName(vehicleB)
		-- local attachNameA = getText("IGUI_TrailerAttachName_" .. attachmentA)
		-- local attachNameB = getText("IGUI_TrailerAttachName_" .. attachmentB)
		-- local burntA = string.contains(boat:getScriptName(), "Burnt")
		-- local trailerA = string.contains(boat:getScriptName(), "Trailer")
		-- local trailerB = string.contains(vehicleB:getScriptName(), "Trailer")
		-- local vehicleTowing = boat
		-- if burntA or trailerA then
			-- vehicleTowing = vehicleB
		-- end
		-- local text = getText("ContextMenu_Vehicle_AttachVehicle", aName, bName, attachNameA, attachNameB);
		-- if trailerA or trailerB then
			-- text = getText("ContextMenu_Vehicle_AttachTrailer");
		-- end
		-- menu:addSlice(text, getTexture("media/ui/ZoomIn.png"), ISBoatMenu.onAttachTrailer, playerObj, vehicleTowing, attachmentA, attachmentB)
		-- return
	-- end

	-- attachmentA, attachmentB = "trailerfront", "trailerfront"
	-- vehicleB = ISVehicleTrailerUtils.getTowableVehicleNear(boat:getSquare(), boat, attachmentA, attachmentB)
	-- if vehicleB then
		-- local aName = ISBoatMenu.getVehicleDisplayName(vehicleB)
		-- local bName = ISBoatMenu.getVehicleDisplayName(boat)
		-- local attachNameA = getText("IGUI_TrailerAttachName_" .. attachmentA)
		-- local attachNameB = getText("IGUI_TrailerAttachName_" .. attachmentB)
		-- local text = getText("ContextMenu_Vehicle_AttachVehicle", aName, bName, attachNameA, attachNameB);
		-- menu:addSlice(text, getTexture("media/ui/ZoomIn.png"), ISBoatMenu.onAttachTrailer, playerObj, boat, attachmentB, attachmentA)
		-- return
	-- end

	-- attachmentA, attachmentB = "trailer", "trailerfront"
	-- vehicleB = ISVehicleTrailerUtils.getTowableVehicleNear(boat:getSquare(), boat, attachmentA, attachmentB)
	-- if vehicleB then
		-- local aName = ISBoatMenu.getVehicleDisplayName(boat)
		-- local bName = ISBoatMenu.getVehicleDisplayName(vehicleB)
		-- local attachNameA = getText("IGUI_TrailerAttachName_" .. attachmentA)
		-- local attachNameB = getText("IGUI_TrailerAttachName_" .. attachmentB)
		-- local attachName = getText("IGUI_TrailerAttachName_" .. attachmentA)
		-- local text = getText("ContextMenu_Vehicle_AttachVehicle", aName, bName, attachNameA, attachNameB);
		-- menu:addSlice(text, getTexture("media/ui/ZoomIn.png"), ISBoatMenu.onAttachTrailer, playerObj, boat, attachmentA, attachmentB)
		-- return
	-- end

	-- attachmentA, attachmentB = "trailerfront", "trailer"
	-- vehicleB = ISVehicleTrailerUtils.getTowableVehicleNear(boat:getSquare(), boat, attachmentA, attachmentB)
	-- if vehicleB then
		-- local aName = ISBoatMenu.getVehicleDisplayName(vehicleB)
		-- local bName = ISBoatMenu.getVehicleDisplayName(boat)
		-- local attachNameA = getText("IGUI_TrailerAttachName_" .. attachmentA)
		-- local attachNameB = getText("IGUI_TrailerAttachName_" .. attachmentB)
		-- local text = getText("ContextMenu_Vehicle_AttachVehicle", aName, bName, attachNameA, attachNameB);
		-- menu:addSlice(text, getTexture("media/ui/ZoomIn.png"), ISBoatMenu.onAttachTrailer, playerObj, vehicleB, attachmentB, attachmentA)
		-- return
	-- end
-- end

-- local TowMenu = {}

-- function TowMenu.isBurnt(boat)
	-- return string.contains(boat:getScriptName(), "Burnt")
-- end

-- function TowMenu.isTrailer(boat)
	-- return string.contains(boat:getScriptName(), "Trailer")
-- end

-- function TowMenu.attachBurntToOther(playerObj, boat, menu)
	-- local attachmentA, attachmentB = "trailer", "trailer"
	-- local vehicleB = ISVehicleTrailerUtils.getTowableVehicleNear(boat:getSquare(), boat, attachmentA, attachmentB)

	-- if not vehicleB then
		-- attachmentA, attachmentB = "trailer", "trailerfront"
		-- vehicleB = ISVehicleTrailerUtils.getTowableVehicleNear(boat:getSquare(), boat, attachmentA, attachmentB)
	-- end

	-- if not vehicleB then
		-- attachmentA, attachmentB = "trailerfront", "trailer"
		-- vehicleB = ISVehicleTrailerUtils.getTowableVehicleNear(boat:getSquare(), boat, attachmentA, attachmentB)
	-- end

	-- if not vehicleB then
		-- attachmentA, attachmentB = "trailerfront", "trailerfront"
		-- vehicleB = ISVehicleTrailerUtils.getTowableVehicleNear(boat:getSquare(), boat, attachmentA, attachmentB)
	-- end

	-- if vehicleB then
		-- if TowMenu.isBurnt(vehicleB) then
			-- TowMenu.addOption(playerObj, menu, boat, vehicleB, attachmentA, attachmentB)
		-- elseif TowMenu.isTrailer(vehicleB) then
			-- TowMenu.addOption(playerObj, menu, boat, vehicleB, attachmentA, attachmentB)
		-- else
			-- TowMenu.addOption(playerObj, menu, vehicleB, boat, attachmentB, attachmentA)
		-- end
	-- end
-- end

-- function TowMenu.attachTrailerToOther(playerObj, boat, menu)
	-- local attachmentA, attachmentB = "trailer", "trailer"
	-- local vehicleB = ISVehicleTrailerUtils.getTowableVehicleNear(boat:getSquare(), boat, attachmentA, attachmentB)

	-- if not vehicleB then
		-- attachmentA, attachmentB = "trailer", "trailerfront"
		-- vehicleB = ISVehicleTrailerUtils.getTowableVehicleNear(boat:getSquare(), boat, attachmentA, attachmentB)
	-- end

	-- if vehicleB then
		-- if TowMenu.isBurnt(vehicleB) then
			-- TowMenu.addOption(playerObj, menu, vehicleB, boat, attachmentB, attachmentA)
		-- elseif TowMenu.isTrailer(vehicleB) then
			-- TowMenu.addOption(playerObj, menu, boat, vehicleB, attachmentA, attachmentB)
		-- else
			-- TowMenu.addOption(playerObj, menu, vehicleB, boat, attachmentB, attachmentA)
		-- end
	-- end
-- end

-- function TowMenu.attachVehicleToOther(playerObj, boat, menu)
	-- local attachmentA, attachmentB = "trailer", "trailer"
	-- local vehicleB = ISVehicleTrailerUtils.getTowableVehicleNear(boat:getSquare(), boat, attachmentA, attachmentB)

	-- if not vehicleB then
		-- attachmentA, attachmentB = "trailer", "trailerfront"
		-- vehicleB = ISVehicleTrailerUtils.getTowableVehicleNear(boat:getSquare(), boat, attachmentA, attachmentB)
	-- end

	-- if not vehicleB then
		-- attachmentA, attachmentB = "trailerfront", "trailer"
		-- vehicleB = ISVehicleTrailerUtils.getTowableVehicleNear(boat:getSquare(), boat, attachmentA, attachmentB)
	-- end

	-- if not vehicleB then
		-- attachmentA, attachmentB = "trailerfront", "trailerfront"
		-- vehicleB = ISVehicleTrailerUtils.getTowableVehicleNear(boat:getSquare(), boat, attachmentA, attachmentB)
	-- end

	-- if vehicleB then
		-- if TowMenu.isBurnt(vehicleB) then
			-- TowMenu.addOption(playerObj, menu, boat, vehicleB, attachmentA, attachmentB)
		-- elseif TowMenu.isTrailer(vehicleB) then
			-- TowMenu.addOption(playerObj, menu, boat, vehicleB, attachmentA, attachmentB)
		-- else
			-- TowMenu.addOption(playerObj, menu, boat, vehicleB, attachmentA, attachmentB)
		-- end
	-- end
-- end

-- function TowMenu.addOption(playerObj, menu, vehicleA, vehicleB, attachmentA, attachmentB)
	-- local aName = ISBoatMenu.getVehicleDisplayName(vehicleA)
	-- local bName = ISBoatMenu.getVehicleDisplayName(vehicleB)
	-- local text = getText("ContextMenu_Vehicle_AttachTrailer", bName, aName);
	-- menu:addSlice(text, getTexture("media/ui/ZoomIn.png"), ISBoatMenu.onAttachTrailer, playerObj, vehicleA, attachmentA, attachmentB)
-- end

-- function ISBoatMenu.doTowingMenu(playerObj, boat, menu)
	-- if boat:getVehicleTowing() then
		-- local bName = ISBoatMenu.getVehicleDisplayName(boat:getVehicleTowing())
		-- menu:addSlice(getText("ContextMenu_Vehicle_DetachTrailer", bName), getTexture("media/ui/ZoomOut.png"), ISBoatMenu.onDetachTrailer, playerObj, boat, boat:getTowAttachmentSelf())
		-- return
	-- end

	-- if boat:getVehicleTowedBy() then
		-- local aName = ISBoatMenu.getVehicleDisplayName(boat)
		-- menu:addSlice(getText("ContextMenu_Vehicle_DetachTrailer", aName), getTexture("media/ui/ZoomOut.png"), ISBoatMenu.onDetachTrailer, playerObj, boat:getVehicleTowedBy(), boat:getVehicleTowedBy():getTowAttachmentSelf())
		-- return
	-- end

	-- if TowMenu.isBurnt(boat) then
		-- TowMenu.attachBurntToOther(playerObj, boat, menu)
	-- elseif TowMenu.isTrailer(boat) then
		-- TowMenu.attachTrailerToOther(playerObj, boat, menu)
	-- else
		-- TowMenu.attachVehicleToOther(playerObj, boat, menu)
	-- end
-- end

function ISBoatMenu.FillMenuOutsideBoat(playerObj, context, boat, test)
	context:removeOptionTsar(context:getOptionFromName(getText("ContextMenu_VehicleMechanics")))
	context:removeOptionTsar(context:getOptionFromName(getText("ContextMenu_Vehicle_Smashwindow")))
	context:removeOptionTsar(context:getOptionFromName(getText("ContextMenu_RemoveBurntVehicle")))	
	context:removeOptionTsar(context:getOptionFromName(getText("ContextMenu_Vehicle_Wash")))
	context:removeOptionTsar(context:getOptionFromName(getText("UI_Text_PushByHands")))
end

function ISBoatMenu.FillMenuInsideBoat(playerObj, context, boat, test)
	local inCabin = boat:getPartById("InCabin" .. seatNameTable[boat:getSeat(playerObj)+1])
	local old_option_update = context:getOptionFromName(getText("ContextMenu_Drink"))

	if old_option_update then
		if not inCabin then
			context:updateOptionTsar(old_option_update.id, old_option_update.name, old_option_update.target, ISBoatMenu.onDrink, old_option_update.param1, playerObj)
		else
			context:removeOptionTsar(context:getOptionFromName(getText("ContextMenu_Drink")))
		end
	end
	
	old_option_update = context:getOptionFromName(getText("ContextMenu_Fill"))
	if old_option_update then
		if not inCabin then
		-- SOURCE: ISWorldObjectContextMenu.doFillWaterMenu
			old_option_update.notAvailable = false
			local old_subMenu = context:getSubMenu(old_option_update.subOption)
			for i, subOption in pairs(old_subMenu.options) do 
				context:updateSubOptionTsar(old_subMenu, subOption.id, subOption.name, subOption.target, ISBoatMenu.onTakeWater, subOption.param1, subOption.param2, subOption.param3, subOption.param4, subOption.param5)
			end
		else
			context:removeOptionTsar(context:getOptionFromName(getText("ContextMenu_Fill")))
		end
	end
	
	old_option_update = context:getOptionFromName(getText("ContextMenu_Wash"))
	if old_option_update then
		if not inCabin then
		-- SOURCE: ISWorldObjectContextMenu.doWashClothingMenu
			local old_subMenu = context:getSubMenu(old_option_update.subOption)
			for i, subOption in pairs(old_subMenu.options) do 
				if subOption.name == getText("ContextMenu_Yourself") then
					context:updateSubOptionTsar(old_subMenu, subOption.id, subOption.name, subOption.target, ISBoatMenu.onWashYourself, subOption.param1, subOption.param2, subOption.param3, subOption.param4, subOption.param5)
				else
					context:updateSubOptionTsar(old_subMenu, subOption.id, subOption.name, subOption.target, ISBoatMenu.onWashClothing, subOption.param1, subOption.param2, subOption.param3, subOption.param4, subOption.param5)
				end
			end
		else
			context:removeOptionTsar(context:getOptionFromName(getText("ContextMenu_Wash")))
		end
	end
	
	-- old_option_update = context:getOptionFromName(getText("ContextMenu_Fishing"))
	-- if old_option_update then
	if inCabin then
		context:removeOptionTsar(context:getOptionFromName(getText("ContextMenu_Fishing")))
	end
	-- end
	
	local heavyItem = playerObj:getPrimaryHandItem()
	if isForceDropHeavyItem(heavyItem) then
		context:removeOptionTsar(context:getOptionFromName(getText("ContextMenu_DropNamedItem", heavyItem:getDisplayName())))
	end
	context:removeOptionTsar(context:getOptionFromName(getText("ContextMenu_SleepOnGround")))
end

function ISBoatMenu.onDrink (worldobjects, waterObject, playerObj)
	if not waterObject:getSquare() then
		return
	end
	local waterAvailable = waterObject:getWaterAmount()
	local thirst = playerObj:getStats():getThirst()
	local waterNeeded = math.floor((thirst + 0.005) / 0.1)
	local waterConsumed = math.min(waterNeeded, waterAvailable)
	ISTimedActionQueue.add(ISTakeWaterActionFromBoat:new(playerObj, nil, waterConsumed, waterObject, (waterConsumed * 10) + 15, nil));
end

function ISBoatMenu.onTakeWater (worldobjects, waterObject, waterContainerList, waterContainer, player)
	local playerObj = getSpecificPlayer(player)
	local playerInv = playerObj:getInventory()
	local waterAvailable = waterObject:getWaterAmount()
	if not waterContainerList then
		waterContainerList = {};
		table.insert(waterContainerList, waterContainer);
	end

	for i,item in ipairs(waterContainerList) do
		-- first case, fill an empty bottle
		if item:canStoreWater() and not item:isWaterSource() then
			if not waterObject:getSquare() then
				return
			end
			local newItemType = item:getReplaceOnUseOn();
			newItemType = string.sub(newItemType,13);
			newItemType = item:getModule() .. "." .. newItemType;
			local newItem = InventoryItemFactory.CreateItem(newItemType,0);
			newItem:setCondition(item:getCondition());
			newItem:setFavorite(item:isFavorite());
			local returnToContainer = item:getContainer():isInCharacterInventory(playerObj) and item:getContainer()
			ISWorldObjectContextMenu.transferIfNeeded(playerObj, item)
			local destCapacity = 1 / newItem:getUseDelta()
			local waterConsumed = math.min(math.floor(destCapacity + 0.001), waterAvailable)
			ISTimedActionQueue.add(ISTakeWaterActionFromBoat:new(playerObj, newItem, waterConsumed, waterObject, waterConsumed * 10, item));
			if returnToContainer and (returnToContainer ~= playerInv) then
				ISTimedActionQueue.add(ISInventoryTransferAction:new(playerObj, item, playerInv, returnToContainer))
			end
		elseif item:canStoreWater() and item:isWaterSource() then -- second case, a bottle contain some water, we just fill it
			if not waterObject:getSquare() then
				return
			end
			local returnToContainer = item:getContainer():isInCharacterInventory(playerObj) and item:getContainer()
			if playerObj:getPrimaryHandItem() ~= item and playerObj:getSecondaryHandItem() ~= item then
			end
			ISWorldObjectContextMenu.transferIfNeeded(playerObj, item)
			local destCapacity = (1 - item:getUsedDelta()) / item:getUseDelta()
			local waterConsumed = math.min(math.floor(destCapacity + 0.001), waterAvailable)
			ISTimedActionQueue.add(ISTakeWaterActionFromBoat:new(playerObj, item, waterConsumed, waterObject, waterConsumed * 10, nil));
			if returnToContainer then
				ISTimedActionQueue.add(ISInventoryTransferAction:new(playerObj, item, playerInv, returnToContainer))
			end
		end
	end
end


function ISBoatMenu.onWashYourself(playerObj, sink, soapList)
	if not sink:getSquare() then
		return
	end
	ISTimedActionQueue.add(ISWashYourself:new(playerObj, sink, soapList));
end

function ISBoatMenu.onWashClothing(playerObj, sink, soapList, washList, singleClothing, noSoap)
	if not sink:getSquare() then
		return
	end

	if not washList then
		washList = {};
		table.insert(washList, singleClothing);
	end
    
	for i,item in ipairs(washList) do
		local bloodAmount = 0
		local dirtAmount = 0
		if instanceof(item, "Clothing") then
			if BloodClothingType.getCoveredParts(item:getBloodClothingType()) then
				local coveredParts = BloodClothingType.getCoveredParts(item:getBloodClothingType())
				for j=0, coveredParts:size()-1 do
					local thisPart = coveredParts:get(j)
					bloodAmount = bloodAmount + item:getBlood(thisPart)
				end
			end
			if item:getDirtyness() > 0 then
				dirtAmount = dirtAmount + item:getDirtyness()
			end
		else
			bloodAmount = bloodAmount + item:getBloodLevel()
		end
		playerObj:getEmitter():playSound("WashClothes")
		ISTimedActionQueue.add(ISWashClothing:new(playerObj, sink, soapList, item, bloodAmount, dirtAmount, noSoap))
	end
end


-- function ISBoatMenu.getVehicleDisplayName(boat)
	-- local name = getText("IGUI_VehicleName" .. boat:getScript():getName())
	-- if string.match(boat:getScript():getName(), "Burnt") then
		-- local unburnt = string.gsub(boat:getScript():getName(), "Burnt", "")
		-- if getTextOrNull("IGUI_VehicleName" .. unburnt) then
			-- name = getText("IGUI_VehicleName" .. unburnt)
		-- end
		-- name = getText("IGUI_VehicleNameBurntCar", name)
	-- end
	-- return name
-- end

-- local function predicateBlowTorch(item)
	-- return item:getType() == "BlowTorch" and item:getDrainableUsesInt() >= 20
-- end

-- function ISBoatMenu.onRemoveBurntVehicle(player, boat)
	-- if luautils.walkAdj(player, boat:getSquare()) then
		-- ISWorldObjectContextMenu.equip(player, player:getPrimaryHandItem(), predicateBlowTorch, true);
		-- local mask = player:getInventory():getFirstTypeRecurse("WeldingMask");
		-- if mask then
			-- ISInventoryPaneContextMenu.wearItem(mask, player:getPlayerNum());
		-- end
		-- ISTimedActionQueue.add(ISRemoveBurntVehicle:new(player, boat));
	-- end
-- end

-- function ISBoatMenu.onRoadtrip(playerObj)
	-- local ui = ISVehicleRoadtripDebug:new(0, 0, playerObj);
	-- ui:initialise();
	-- ui:addToUIManager();
-- end

-- function ISBoatMenu.onDebugAngles(playerObj, boat)
	-- debugVehicleAngles(boat)
-- end

-- function ISBoatMenu.onDebugColor(playerObj, boat)
	-- debugVehicleColor(boat)
-- end

-- function ISBoatMenu.onDebugBlood(playerObj, boat)
	-- debugVehicleBloodUI(boat)
-- end

-- function ISBoatMenu.onDebugEditor(playerObj, boat)
	-- showVehicleEditor(boat:getScript():getFullName())
-- end

-- function ISBoatMenu.addSetScriptMenu(context, playerObj, boat)
	-- local option = context:addOption("Set Script", nil, nil)
	-- local subMenu = ISContextMenu:getNew(context)
	-- context:addSubMenu(option, subMenu)

	-- local optionBurnt = context:addOption("Set Script (Burnt)", nil, nil)
	-- local subMenuBurnt = ISContextMenu:getNew(context)
	-- context:addSubMenu(optionBurnt, subMenuBurnt)

	-- local scripts = getScriptManager():getAllVehicleScripts()
	-- local sorted = {}
	-- for i=1,scripts:size() do
		-- local script = scripts:get(i-1)
		-- table.insert(sorted, script)
	-- end
	-- table.sort(sorted, function(a,b) return not string.sort(a:getName(), b:getName()) end)
	-- for _,script in ipairs(sorted) do
		-- if script:getPartCount() == 0 then
			-- subMenuBurnt:addOption(script:getName(), playerObj, ISBoatMenu.onDebugSetScript, boat, script:getFullName())
		-- else
			-- subMenu:addOption(script:getName(), playerObj, ISBoatMenu.onDebugSetScript, boat, script:getFullName())
		-- end
	-- end
-- end

-- function ISBoatMenu.onDebugSetScript(playerObj, boat, scriptName)
	-- boat:setScriptName(scriptName)
	-- boat:scriptReloaded()
	-- boat:setSkinIndex(ZombRand(boat:getSkinCount()))
	-- boat:repair() -- so engine loudness/power/quality are recalculated
-- end

function ISBoatMenu.onMechanic(playerObj, boat)
	local ui = getPlayerMechanicsUI(playerObj:getPlayerNum())
	if ui:isReallyVisible() then
		ui:close()
		return
	end

	local engineHood = nil;
	local cheat = getCore():getDebug() and getDebugOptions():getBoolean("Cheat.boat.MechanicsAnywhere")
	-- if ISVehicleMechanics.cheat or (isClient() and isAdmin()) or cheat then
		-- ISTimedActionQueue.add(ISOpenMechanicsUIAction:new(playerObj, boat))
		-- return;
	-- end
	--engineHood = boat:getPartById("EngineDoor");
	-- if playerObj:getVehicle() then
		-- ISBoatMenu.onExit(playerObj)
	-- end
--		local closestDist;
--		local closestPart;
--		for i=0,boat:getPartCount()-1 do
--			local part = boat:getPartByIndex(i);
--			if (part:getCategory() == "tire" or part:getCategory() == "bodywork") and (not closestDist or closestDist > boat:getAreaDist(part:getArea(), playerObj))then
----				print("TIRE: ", part:getId(), " CLOSER");
--				closestDist = boat:getAreaDist(part:getArea(), playerObj);
--				closestPart = part;
--			end
--		end
	-- if engineHood then
		-- ISTimedActionQueue.add(ISPathFindAction:pathToVehicleArea(playerObj, boat, engineHood:getArea()))
		-- if not engineHood:getDoor() or not engineHood:getInventoryItem() then
			-- engineHood = nil
		-- end
		-- if engineHood and not engineHood:getDoor():isOpen() then
			-- -- The hood is magically unlocked if any door/window is broken/open/uninstalled.
			-- -- If the player can get in the boat, they can pop the hood, no key required.
			-- if engineHood:getDoor():isLocked() and VehicleUtils.RequiredKeyNotFound(boat:getPartById("Engine"), playerObj) then
				-- ISTimedActionQueue.add(ISUnlockVehicleDoor:new(playerObj, engineHood))
			-- end
			-- ISTimedActionQueue.add(ISOpenVehicleDoor:new(playerObj, boat, engineHood))
		-- end
	-- else
		-- -- Burned vehicles and trailers don't have a hood
		-- ISTimedActionQueue.add(ISPathFindAction:pathToVehicleAdjacent(playerObj, boat))
	-- end
	local data = getPlayerData(playerObj:getPlayerNum())
	data.mechanicsUI = ISBoatMechanics:new(0, 0, playerObj, boat);
    data.mechanicsUI:setVisible(false);
    data.mechanicsUI:setEnabled(false);
	data.mechanicsUI:initialise();
	--data.mechanicsUI:addToUIManager();
	
	ISTimedActionQueue.add(ISOpenMechanicsUIAction:new(playerObj, boat, engineHood))
--	local ui = ISVehicleMechanics:new(0,0,playerObj,boat);
--	ui:initialise();
--	ui:addToUIManager();
--	local ui = getPlayerMechanicsUI(playerObj:getPlayerNum());
--	if ui:isReallyVisible() then
--		ui:close()
--		return
--	end
--	ui.boat = boat;
--	ui.usedHood = usedHood
--	ui:initParts();
--	ui:setVisible(true, JoypadState.players[playerObj:getPlayerNum()+1])
--	ui:addToUIManager()
	
--print("ONMECHANIC")
	-- get the closest tire to the player
--	local closestDist;
--	local closestPart;
--	for i=0,boat:getPartCount()-1 do
--		local part = boat:getPartByIndex(i);
--		if part:getCategory() == "tire" and (not closestDist or closestDist < boat:getAreaDist(part:getArea(), playerObj))then
--			print("TIRE: ", part:getId(), " CLOSER");
--			closestDist = boat:getAreaDist(part:getArea(), playerObj);
--			closestPart = part:getId();
--		end
--	end
--	local tire = boat:getPartById(closestPart);
--	ISTimedActionQueue.add(ISPathFindAction:pathToVehicleArea(playerObj, boat, tire:getArea()))
--	closestPart = ISBoatMenu.getNextTire(closestPart);
--	local tire = boat:getPartById(closestPart);
--	ISTimedActionQueue.add(ISPathFindAction:pathToVehicleArea(playerObj, boat, tire:getArea()))
--	closestPart = ISBoatMenu.getNextTire(closestPart);
--	local tire = boat:getPartById(closestPart);
--	ISTimedActionQueue.add(ISPathFindAction:pathToVehicleArea(playerObj, boat, tire:getArea()))
--	closestPart = ISBoatMenu.getNextTire(closestPart);
--	local tire = boat:getPartById(closestPart);
--	ISTimedActionQueue.add(ISPathFindAction:pathToVehicleArea(playerObj, boat, tire:getArea()))
--	local tire = boat:getPartById("TireFrontRight");
--	ISTimedActionQueue.add(ISPathFindAction:pathToVehicleArea(playerObj, boat, tire:getArea()))
end

-- -- cicle thru each tires clockwise
-- function ISBoatMenu.getNextTire(currentTire)
	-- if currentTire == "TireFrontLeft" then return "TireFrontRight"; end
	-- if currentTire == "TireFrontRight" then return "TireRearRight"; end
	-- if currentTire == "TireRearRight" then return "TireRearLeft"; end
	-- if currentTire == "TireRearLeft" then return "TireFrontLeft"; end
-- end

function ISBoatMenu.FillPartMenu(playerIndex, context, slice, boat)
	local playerObj = getSpecificPlayer(playerIndex);
	local typeToItem = VehicleUtils.getItems(playerIndex)
	for i=1,boat:getPartCount() do
		local part = boat:getPartByIndex(i-1)
		if not boat:isEngineStarted() and part:isContainer() and part:getContainerContentType() == "Gasoline" then
			if typeToItem["Base.PetrolCan"] and part:getContainerContentAmount() < part:getContainerCapacity() then
				if slice then
					slice:addSlice(getText("ContextMenu_BoatAddGas"), getTexture("Item_Petrol"), ISBoatPartMenu.onAddGasoline, playerObj, part)
				else
					context:addOption(getText("ContextMenu_BoatAddGas"), playerObj,ISBoatPartMenu.onAddGasoline, part)
				end
			end
			if ISBoatPartMenu.getGasCanNotFull(playerObj, typeToItem) and part:getContainerContentAmount() > 0 then
				if slice then
					slice:addSlice(getText("ContextMenu_VehicleSiphonGas"), getTexture("Item_Petrol"), ISBoatPartMenu.onTakeGasoline, playerObj, part)
				else
					context:addOption(getText("ContextMenu_VehicleSiphonGas"), playerObj, ISBoatPartMenu.onTakeGasoline, part)
				end
			end
			-- local square = ISVehiclePartMenu.getNearbyFuelPump(boat)
			-- if square and ((SandboxVars.AllowExteriorGenerator and square:haveElectricity()) or (SandboxVars.ElecShutModifier > -1 and GameTime:getInstance():getNightsSurvived() < SandboxVars.ElecShutModifier)) then
				-- if square and part:getContainerContentAmount() < part:getContainerCapacity() then
					-- if slice then
						-- slice:addSlice(getText("ContextMenu_VehicleRefuelFromPump"), getTexture("media/ui/vehicles/vehicle_refuel_from_pump.png"), ISVehiclePartMenu.onPumpGasoline, playerObj, part)
					-- else
						-- context:addOption(getText("ContextMenu_VehicleRefuelFromPump"), playerObj, ISVehiclePartMenu.onPumpGasoline, part)
					-- end
				-- end
			-- end
		end
	end
end

-- function ISBoatMenu.onSwitchSeat(playerObj, seatTo)
	-- local boat = playerObj:getVehicle()
	-- if not boat then return end
	-- ISTimedActionQueue.add(ISSwitchVehicleSeat:new(playerObj, seatTo))
-- end

-- function ISBoatMenu.onToggleTrunkLocked(playerObj)
	-- local boat = playerObj:getVehicle();
	-- if not boat then return end
	-- sendClientCommand(playerObj, 'vehicle', 'setTrunkLocked', { locked = not boat:isTrunkLocked() });
-- end

function ISBoatMenu.onSignalDevice(playerObj, part)
	ISRadioWindow.activate(playerObj, part)
end

function ISBoatMenu.onStartEngine(playerObj)
--	local boat = playerObj:getVehicle()
--	if not boat then return end
--	if not boat:isEngineWorking() then return end
--	if not boat:isDriver(playerObj) then return end
	ISTimedActionQueue.add(ISStartVehicleEngine:new(playerObj))
end

function ISBoatMenu.onStartEngineManualy(playerObj, manualStarter)
--	local boat = playerObj:getVehicle()
--	if not boat then return end
--	if not boat:isEngineWorking() then return end
--	if not boat:isDriver(playerObj) then return end
	manualStarter:setCondition(manualStarter:getCondition() - 1)
	ISTimedActionQueue.add(ISStartBoatEngineManualy:new(playerObj))
end

function ISBoatMenu.onHotwire(playerObj)
	ISTimedActionQueue.add(ISHotwireVehicle:new(playerObj))
end

function ISBoatMenu.onShutOff(playerObj)
--	local boat = playerObj:getVehicle()
--	if not boat then return end
--	if not boat:isEngineStarted() then return end
--	if not boat:isDriver(playerObj) then return end
	ISTimedActionQueue.add(ISShutOffVehicleEngine:new(playerObj))
end

-- function ISBoatMenu.onInfo(playerObj, boat)
	-- local ui = getPlayerVehicleUI(playerObj:getPlayerNum())
	-- ui:setVehicle(boat)
	-- ui:setVisible(true)
	-- ui:bringToTop()
	-- if JoypadState.players[playerObj:getPlayerNum()+1] then
		-- JoypadState.players[playerObj:getPlayerNum()+1].focus = ui
	-- end
-- end

function ISBoatMenu.onSleep(playerObj, boat)
	if boat:getCurrentSpeedKmHour() > 5 or boat:getCurrentSpeedKmHour() < -5 then
		playerObj:Say(getText("IGUI_PlayerText_CanNotSleepInMovingCar"))
		return;
	end
	local playerNum = playerObj:getPlayerNum()
	local modal = ISModalDialog:new(0,0, 250, 150, getText("IGUI_ConfirmSleep"), true, nil, ISBoatMenu.onConfirmSleep, playerNum, playerNum, nil);
	modal:initialise()
	modal:addToUIManager()
	if JoypadState.players[playerNum+1] then
		setJoypadFocus(playerNum, modal)
	end
end

function ISBoatMenu.onConfirmSleep(this, button, player, bed)
	if button.internal == "YES" then
		ISWorldObjectContextMenu.onSleepWalkToComplete(player, nil)
	end
end

-- function ISBoatMenu.onOpenDoor(playerObj, part)
	-- local boat = part:getVehicle()
	-- if part:getDoor():isLocked() then
		-- -- The hood is magically unlocked if any door/window is broken/open/uninstalled.
		-- -- If the player can get in the boat, they can pop the hood, no key required.
		-- if not (part:getId() == "EngineDoor" and VehicleUtils.RequiredKeyNotFound(part, playerObj)) then
			-- ISTimedActionQueue.add(ISUnlockVehicleDoor:new(playerObj, part))
		-- end
	-- end
	-- ISTimedActionQueue.add(ISOpenVehicleDoor:new(playerObj, part:getVehicle(), part))
	-- if part:getId() == "EngineDoor" then
		-- ISTimedActionQueue.add(ISOpenMechanicsUIAction:new(playerObj, boat, part))
	-- end
-- end

-- function ISBoatMenu.onCloseDoor(playerObj, part)
	-- ISTimedActionQueue.add(ISCloseVehicleDoor:new(playerObj, part:getVehicle(), part))
-- end

-- function ISBoatMenu.onLockDoor(playerObj, part)
	-- ISTimedActionQueue.add(ISLockVehicleDoor:new(playerObj, part))
-- end

-- function ISBoatMenu.onUnlockDoor(playerObj, part)
	-- ISTimedActionQueue.add(ISUnlockVehicleDoor:new(playerObj, part))
-- end

-- function ISBoatMenu.onWash(playerObj, boat)
	-- local area = ISWashVehicle.chooseArea(playerObj, boat)
	-- if not area then return end
	-- ISTimedActionQueue.add(ISPathFindAction:pathToVehicleArea(playerObj, boat, area.area))
	-- ISTimedActionQueue.add(ISWashVehicle:new(playerObj, boat, area.id, area.area))
-- end


-- -- BaseVehicle.isEnterBlocked() returns true for passengers with no "outside"
-- -- position, which is the case for VanSeats' rear seats that are not accessible
-- -- by any door.  The player must enter through a front or middle door then
-- -- switch to the rear seatNum.


-- function ISBoatMenu.moveItemsOnSeat(seatNum, newSeat, playerObj, moveThem, itemListIndex)
-- --	if moveThem then print("moving item on seatNum from", seatNum:getId(), "to", newSeat:getId()) end
	-- local itemList = {};
	-- local actualWeight = newSeat:getItemContainer():getCapacityWeight();
	-- for i=itemListIndex,seatNum:getItemContainer():getItems():size() -1 do
		-- local item = seatNum:getItemContainer():getItems():get(i);
		-- actualWeight = actualWeight + item:getUnequippedWeight();
		-- if newSeat:getItemContainer():hasRoomFor(playerObj, actualWeight) then
			-- table.insert(itemList, item);
		-- else
			-- break;
		-- end
	-- end
	-- if moveThem then
		-- for i,v in ipairs(itemList) do
			-- ISTimedActionQueue.add(ISInventoryTransferAction:new (playerObj, v, seatNum:getItemContainer(), newSeat:getItemContainer(), 10));
-- --			seatNum:getItemContainer():Remove(v);
-- --			newSeat:getItemContainer():AddItem(v);
		-- end
	-- end
	-- return #itemList + itemListIndex;
-- end

-- function ISBoatMenu.tryMoveItemsFromSeat(playerObj, boat, seatNum, moveThem, doEnter, seatTo, itemListIndex)
	-- local currentSeat = boat:getPartForSeatContainer(seatNum);
	-- if currentSeat:getItemContainer():getItems():isEmpty() then return 0; end
	-- local newSeat = boat:getPartById(seatTo);
	-- if not newSeat then return 0; end
	-- if newSeat == currentSeat or (boat:getCharacter(newSeat:getContainerSeatNumber()) and playerObj ~= boat:getCharacter(newSeat:getContainerSeatNumber())) then return 0; end
	-- if newSeat then
		-- local movedItems = ISBoatMenu.moveItemsOnSeat(currentSeat, newSeat, playerObj, moveThem, itemListIndex);
		-- if doEnter and (movedItems == currentSeat:getItemContainer():getItems():size() or movedItems == currentSeat:getItemContainer():getItems():isEmpty()) then
			-- ISBoatMenu.processEnter(playerObj, boat, seatNum);
			-- return movedItems;
		-- end
		-- return movedItems;
	-- end
	-- return 0;
-- end

-- function ISBoatMenu.moveItemsFromSeat(playerObj, boat, seatNum, moveThem, doEnter)
	-- -- if items are on the seats we'll try to move them to another empty seatNum, first rear seatNum then middle, then front left seats, never on driver's seatNum
	-- -- first rear seats
	-- local currentSeat = boat:getPartForSeatContainer(seatNum);
	-- local movedItems = ISBoatMenu.tryMoveItemsFromSeat(playerObj, boat, seatNum, moveThem, doEnter, "SeatRearLeft", 0);
	-- if movedItems == currentSeat:getItemContainer():getItems():size() then return true; end
	-- movedItems = ISBoatMenu.tryMoveItemsFromSeat(playerObj, boat, seatNum, moveThem, doEnter, "SeatRearRight", movedItems);
	-- if movedItems == currentSeat:getItemContainer():getItems():size() then return true; end
	-- movedItems = ISBoatMenu.tryMoveItemsFromSeat(playerObj, boat, seatNum, moveThem, doEnter, "SeatFrontRight", movedItems);
	-- if movedItems == currentSeat:getItemContainer():getItems():size() then return true; end
	-- movedItems = ISBoatMenu.tryMoveItemsFromSeat(playerObj, boat, seatNum, moveThem, doEnter, "SeatMiddleLeft", movedItems);
	-- if movedItems == currentSeat:getItemContainer():getItems():size() then return true; end
	-- movedItems = ISBoatMenu.tryMoveItemsFromSeat(playerObj, boat, seatNum, moveThem, doEnter, "SeatMiddleRight", movedItems);
	-- if movedItems == currentSeat:getItemContainer():getItems():size() then return true; end
	-- return false;
-- end

-- function ISBoatMenu.onEnter(playerObj, boat, seatNum)
	-- if boat:isSeatOccupied(seatNum) then
		-- if boat:getCharacter(seatNum) then
			-- playerObj:Say(getText("IGUI_PlayerText_VehicleSomeoneInSeat"))
		-- else
			-- if not ISBoatMenu.moveItemsFromSeat(playerObj, boat, seatNum, true, true) then
				-- playerObj:Say(getText("IGUI_PlayerText_VehicleItemInSeat"))
			-- end
		-- end
	-- else
		-- if boat:isPassengerUseDoor2(playerObj, seatNum) then
			-- ISBoatMenu.processEnter2(playerObj, boat, seatNum);
		-- else 
			-- ISBoatMenu.processEnter(playerObj, boat, seatNum);
		-- end
	-- end
-- end

-- function ISBoatMenu.processEnter(playerObj, boat, seatNum)
	-- if not boat:isSeatInstalled(seatNum) then
		-- playerObj:Say(getText("IGUI_PlayerText_VehicleSeatRemoved"))
	-- elseif not playerObj:isBlockMovement() then
		-- if boat:isEnterBlocked(playerObj, seatNum) then
			-- local seat2 = ISBoatMenu.getBestSwitchSeatEnter(playerObj, boat, seatNum)
			-- if seat2 then
				-- ISBoatMenu.onEnterAux(playerObj, boat, seat2)
				-- ISTimedActionQueue.add(ISSwitchVehicleSeat:new(playerObj, seatNum))
			-- end
		-- else
			-- ISBoatMenu.onEnterAux(playerObj, boat, seatNum)
		-- end
	-- end
-- end

-- function ISBoatMenu.onEnterAux(playerObj, boat, seatNum)
		-- ISTimedActionQueue.add(ISPathFindAction:pathToVehicleSeat(playerObj, boat, seatNum))
		-- local doorPart = boat:getPassengerDoor(seatNum)
		-- if doorPart and doorPart:getDoor() and doorPart:getInventoryItem() then
			-- local door = doorPart:getDoor()
			-- if door:isLocked() then
				-- -- if the keys on on the car, we take them and open
				-- if boat:isKeyIsOnDoor() then
					-- local key = boat:getCurrentKey()
					-- boat:setKeyIsOnDoor(false);
					-- boat:setCurrentKey(nil)
					-- playerObj:getInventory():AddItem(key)
					-- if isClient() then
						-- sendClientCommand(playerObj, 'vehicle', 'removeKeyFromDoor', { boat = boat:getId() })
					-- end
				-- else
					-- ISTimedActionQueue.add(ISUnlockVehicleDoor:new(playerObj, doorPart, seatNum))
				-- end
			-- end
			-- if not door:isOpen() then
				-- ISTimedActionQueue.add(ISOpenVehicleDoor:new(playerObj, boat, doorPart))
			-- end
			-- ISTimedActionQueue.add(ISEnterVehicle:new(playerObj, boat, seatNum))
			-- ISTimedActionQueue.add(ISCloseVehicleDoor:new(playerObj, boat, seatNum))
		-- else
			-- ISTimedActionQueue.add(ISEnterVehicle:new(playerObj, boat, seatNum))
		-- end
-- end

-- function ISBoatMenu.onEnter2(playerObj, boat, seatNum)
	-- if boat:isSeatOccupied(seatNum) then
		-- if boat:getCharacter(seatNum) then
			-- playerObj:Say(getText("IGUI_PlayerText_VehicleSomeoneInSeat"))
		-- else
			-- if not ISBoatMenu.moveItemsFromSeat(playerObj, boat, seatNum, true, true) then
				-- playerObj:Say(getText("IGUI_PlayerText_VehicleItemInSeat"))
			-- end
		-- end
	-- else
		-- ISBoatMenu.processEnter2(playerObj, boat, seatNum);
	-- end
-- end

-- function ISBoatMenu.processEnter2(playerObj, boat, seatNum)
	-- if not boat:isSeatInstalled(seatNum) then
		-- playerObj:Say(getText("IGUI_PlayerText_VehicleSeatRemoved"))
	-- elseif not playerObj:isBlockMovement() then
		-- if boat:isEnterBlocked2(playerObj, seatNum) then
			-- local seat2 = ISBoatMenu.getBestSwitchSeatEnter(playerObj, boat, seatNum)
			-- if seat2 then
				-- ISBoatMenu.onEnterAux(playerObj, boat, seat2)
				-- ISTimedActionQueue.add(ISSwitchVehicleSeat:new(playerObj, seatNum))
			-- end
		-- else
			-- ISBoatMenu.onEnterAux2(playerObj, boat, seatNum)
		-- end
	-- end
-- end

-- function ISBoatMenu.onEnterAux2(playerObj, boat, seatNum)
		-- ISTimedActionQueue.add(ISPathFindAction:pathToVehicleSeat(playerObj, boat, seatNum))
		-- local doorPart = boat:getPassengerDoor2(seatNum)
		-- if doorPart and doorPart:getDoor() and doorPart:getInventoryItem() then
			-- local door = doorPart:getDoor()
			-- if door:isLocked() then
				-- -- if the keys on on the car, we take them and open
				-- if boat:isKeyIsOnDoor() then
					-- local key = boat:getCurrentKey()
					-- boat:setKeyIsOnDoor(false);
					-- boat:setCurrentKey(nil)
					-- playerObj:getInventory():AddItem(key)
					-- if isClient() then
						-- sendClientCommand(playerObj, 'vehicle', 'removeKeyFromDoor', { boat = boat:getId() })
					-- end
				-- else
					-- ISTimedActionQueue.add(ISUnlockVehicleDoor:new(playerObj, doorPart, seatNum))
				-- end
			-- end
			-- if not door:isOpen() then
				-- ISTimedActionQueue.add(ISOpenVehicleDoor:new(playerObj, boat, doorPart))
			-- end
			-- ISTimedActionQueue.add(ISEnterVehicle:new(playerObj, boat, seatNum))
			-- ISTimedActionQueue.add(ISCloseVehicleDoor:new(playerObj, boat, doorPart))
		-- else
			-- ISTimedActionQueue.add(ISEnterVehicle:new(playerObj, boat, seatNum))
		-- end
-- end


function ISBoatMenu.onShowSeatUI(playerObj, boat)
	local isPaused = UIManager.getSpeedControls() and UIManager.getSpeedControls():getCurrentGameSpeed() == 0
	if isPaused then return end
	local playerNum = playerObj:getPlayerNum()
	if not ISBoatMenu.seatUI then
		ISBoatMenu.seatUI = {}
	end
	local ui = ISBoatMenu.seatUI[playerNum]
	if not ui or ui.character ~= playerObj then
		ui = ISBoatSeatUI:new(0, 0, playerObj)
		ui:initialise()
		ui:instantiate()
		ISBoatMenu.seatUI[playerNum] = ui
	end
	if ui:isReallyVisible() then
		ui:removeFromUIManager()
		if JoypadState.players[playerNum+1] then
			setJoypadFocus(playerNum, nil)
		end
	else
		ui:setVehicle(boat)
		ui:addToUIManager()
		if JoypadState.players[playerNum+1] then
			JoypadState.players[playerNum+1].focus = ui
		end
	end
end

-- function ISBoatMenu.onWalkPath(playerObj)
	-- ISTimedActionQueue.add(ISPathFindAction:new(playerObj))
-- end

function ISBoatMenu.onHorn(playerObj)
	ISTimedActionQueue.add(ISHornBoat:new(playerObj))
end

-- function ISBoatMenu.onHornStart(playerObj)
-- --	print "onHornStart"
	-- local boat = playerObj:getVehicle()
	-- if boat:getBatteryCharge() <= 0.0 then return end
	-- if isClient() then
		-- sendClientCommand(playerObj, 'vehicle', 'onHorn', {state="start"})
	-- else
		-- boat:onHornStart();
	-- end
-- end

-- function ISBoatMenu.onHornStop(playerObj)
-- --	print "onHornStop"
	-- local boat = playerObj:getVehicle()
	-- if isClient() then
		-- sendClientCommand(playerObj, 'vehicle', 'onHorn', {state="stop"})
	-- else
		-- boat:onHornStop();
	-- end
-- end

-- function ISBoatMenu.onLightbar(playerObj)
	-- ISTimedActionQueue.add(ISLightbarUITimedAction:new(playerObj))
-- end

function ISBoatMenu.onEnterVehicle(playerObj)
	if instanceof(playerObj, 'IsoPlayer') and playerObj:isLocalPlayer() then
		local boat = playerObj:getVehicle()
		if AquaConfig.isBoat(boat) then
			local squareUnderVehicle = getCell():getGridSquare(boat:getX(), boat:getY(), 0)
			if squareUnderVehicle ~= nil and ISBoatMenu.isWater(squareUnderVehicle) then
				emi = boat:getEmitter()
				if not emi:isPlaying("BoatSailing") then
					local songID = emi:playSoundLooped("BoatSailing")
					emi:setVolume(songID, 0.3)
				end
			end
		end
	end
end

function ISBoatMenu.recoveryKeys(playerObj)
	if playerObj:getModData()["blockForward"] then
		getCore():addKeyBinding("Forward", playerObj:getModData()["blockForward"])
		playerObj:getModData()["blockForward"] = nil
		getCore():addKeyBinding("Backward", playerObj:getModData()["blockBackward"])
		playerObj:getModData()["blockBackward"] = nil
		getCore():addKeyBinding("StartVehicleEngine", playerObj:getModData()["blockStartVehicleEngine"])
		playerObj:getModData()["StartVehicleEngine"] = nil
	end
end

-- function ISBoatMenu.onExitVehicle(playerObj)
	-- if instanceof(playerObj, 'IsoPlayer') and playerObj:isLocalPlayer() then
		-- local boat = playerObj:getVehicle()
		-- if AquaConfig.isBoat(boat) then
			-- local emi = boat:getEmitter()
			-- emi:stopSoundByName("BoatSailing")
		-- end
	-- end
-- end
Events.OnFillWorldObjectContextMenu.Add(ISBoatMenu.OnFillWorldObjectContextMenu)
-- Events.OnKeyPressed.Add(ISBoatMenu.onKeyPressed);
Events.OnKeyStartPressed.Add(ISBoatMenu.onKeyStartPressed);
Events.OnEnterVehicle.Add(ISBoatMenu.onEnterVehicle)
Events.OnPlayerDeath.Add(ISBoatMenu.recoveryKeys)
-- Events.OnExitVehicle.Add(ISBoatMenu.onExitVehicle)