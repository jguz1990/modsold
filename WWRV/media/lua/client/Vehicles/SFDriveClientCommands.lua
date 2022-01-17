local Commands = {}

function Commands.insideThumps(player, args)
	local vehicle = getVehicleById(args.id)
	local trunk = vehicle:getPartById("TruckBed"):getItemContainer()
	if trunk:contains("CorpseToken") then
		local sound = "thumpsqueak" .. tostring(ZombRand(6));
		addSound(vehicle, vehicle:getSquare():getX(),vehicle:getSquare():getY(),vehicle:getSquare():getZ(), 20, 10);
		vehicle:playSound(sound)
	end
end


function Commands.setCoolerOn(player, args)
	local vehicle = getVehicleById(args.id);
	local trunk = vehicle:getPartById("Fridge");
	local active = trunk:getModData().coolerActive;
	trunk:getModData().coolerActive = not active;
	vehicle:transmitPartModData(trunk);
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
		vehicle:transmitPartModData(part)
	else
		part:getItemContainer():setCustomTemperature(0.2)

		if not vehicle:isEngineRunning() then
			VehicleUtils.chargeBattery(vehicle, args.batteryChange * args.elapsedMinutes)
		end
	end
end

function Commands.updateCarOven(player, args)
	local vehicle = getVehicleById(args.id)
	local part = vehicle:getPartById("Oven")

	if part:getInventoryItem() and part:getItemContainer() and part:getItemContainer():isActive() then
		local currentTemp = part:getItemContainer():getTemprature()
		local maxTemp = 2.0

		if currentTemp < maxTemp then
			part:getItemContainer():setCustomTemperature(currentTemp + 0.05)
		elseif currentTemp > maxTemp then
			part:getItemContainer():setCustomTemperature(maxTemp)
		end
	end

	if part:getInventoryItem() and part:getItemContainer() and not part:getItemContainer():isActive() then
		local currentTemp = part:getItemContainer():getTemprature()
		local minTemp = 1.0

		if currentTemp > minTemp then
			part:getItemContainer():setCustomTemperature(currentTemp - 0.05)
		elseif currentTemp < minTemp then
			part:getItemContainer():setCustomTemperature(minTemp)
		end
	end
end

function Commands.useCarOven(player, args)
	local chr = getPlayerFromUsername(args.player)
	local vehicle = getVehicleById(args.id)
	local cont = vehicle:getPartById("Oven"):getItemContainer()

	if cont:isActive() then
		cont:setActive(false)
		chr:getEmitter():playSound("PZ_Switch")
	elseif vehicle:getBatteryCharge() < 0.00005 then

	else
		cont:setActive(true)
		VehicleUtils.chargeBattery(vehicle, -0.00005)
		chr:getEmitter():playSound("PZ_Switch")
	end
end

Events.OnServerCommand.Add(function(module, command, args)
	if not isClient() then return end
	if module == "SFDrive" and Commands[command] then
		args = args or {}
		Commands[command](player, args)
	end
end)
