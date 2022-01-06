local Commands = {}

function Commands.insideThumps(player, args)
	local vehicle = getVehicleById(args.id)
	local trunk = vehicle:getPartById("TruckBed"):getItemContainer()
	if trunk and trunk:contains("CorpseToken") then
		local sound = "thumpsqueak" .. tostring(ZombRand(6));
		addSound(vehicle, vehicle:getSquare():getX(),vehicle:getSquare():getY(),vehicle:getSquare():getZ(), 20, 10);
		vehicle:playSound(sound)
	end
end

function Commands.setCoolerOn(player, args)
	local vehicle = getVehicleById(args.id)
	local trunk = vehicle:getPartById("TruckBed")
	local active = trunk:getModData().coolerActive
	trunk:getModData().coolerActive = not active
	vehicle:transmitPartModData(trunk)
end

function Commands.spawnFromCar(player, args)
	spawnHorde(args.x, args.y, args.x2, args.y2, args.z, args.bodies)
end

function Commands.startTrunkFridge(player, args)
	args.part:getModData().coolerActive = true
	args.part:getItemContainer():setCustomTemperature(0.2)
end

function Commands.updateCarFridge(player, args)
	local vehicle = getVehicleById(args.id)
	local part = vehicle:getPartById("Fridge")
	if vehicle:getBatteryCharge() <= 0.0 then
		part:getModData().coolerActive = false
	else
		part:getItemContainer():setCustomTemperature(0.2)
		if not vehicle:isEngineRunning() then
			VehicleUtils.chargeBattery(vehicle, args.batteryChange * args.elapsedMinutes)
		end
	end
	vehicle:transmitPartModData(part)
end

function Commands.updateCarOven(player, args)
	local vehicle = getVehicleById(args.id)
	local part = vehicle:getPartById("Oven")

	if part:getInventoryItem() and part:getItemContainer() then
		if part:getItemContainer():isActive() then
			local currentTemp = part:getItemContainer():getTemperature()
			local maxTemp = 2.0

			if currentTemp < maxTemp then
				part:getItemContainer():setCustomTemperature(currentTemp + 0.05)
			elseif currentTemp > maxTemp then
				part:getItemContainer():setCustomTemperature(maxTemp)
			end
		elseif not part:getItemContainer():isActive() then
			local currentTemp = args.part:getItemContainer():getTemperature()
			local minTemp = 1.0

			if currentTemp > minTemp then
				part:getItemContainer():setCustomTemperature(currentTemp - 0.05)
			elseif currentTemp < minTemp then
				part:getItemContainer():setCustomTemperature(minTemp)
			end
		end
		vehicle:transmitPartModData(part)
	end
end

function Commands.useCarOven(player, args)
	local vehicle = getVehicleById(args.id)
	cont = vehicle:getPartById("Oven"):getItemContainer()

	if cont:isActive() then
		cont:setActive(false)
		player:getEmitter():playSound("PZ_Switch")
	elseif vehicle:getBatteryCharge() < 0.00005 then

	else
		cont:setActive(true)
		VehicleUtils.chargeBattery(vehicle, -0.00005)
		player:getEmitter():playSound("PZ_Switch")
	end
end

Events.OnClientCommand.Add(function(module, command, player, args)
	if module == 'SFDrive' and Commands[command] then
		args = args or {}
		Commands[command](player, args)
    		sendServerCommand(module, command, args)
	end
end)
