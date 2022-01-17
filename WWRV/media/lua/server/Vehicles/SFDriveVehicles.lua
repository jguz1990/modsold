require 'Vehicles/Vehicles'

--
-- CREATE PART
--
function Vehicles.Create.Dont(vehicle, part)
	--used for parts that need to be installed never found in cars
end

function Vehicles.Create.Fridge(vehicle, part)
	local invItem = VehicleUtils.createPartInventoryItem(part);

	if part:getInventoryItem() and part:getItemContainer() then
		part:getModData().coolerActive = true
		part:getItemContainer():setType("fridge")
		part:getItemContainer():setCustomTemperature(0.2)
	end
end

function Vehicles.Create.Oven(vehicle, part)
	local invItem = VehicleUtils.createPartInventoryItem(part);

	if part:getInventoryItem() and part:getItemContainer() then
		part:getItemContainer():setType("stove")
		part:getItemContainer():setActive(false)
		part:getModData().ovenActive = false
	end
end

function Vehicles.Create.Television(vehicle, part)
	local deviceData = part:createSignalDevice();
	deviceData:setIsTwoWay(false);
	deviceData:setTransmitRange(0);
	deviceData:setMicRange(0);
	deviceData:setBaseVolumeRange(10);
	deviceData:setIsPortable(false);
	deviceData:setIsTelevision(true);
	deviceData:setMinChannelRange(200);
	deviceData:setMaxChannelRange(1000000);
	deviceData:setIsBatteryPowered(false);
	deviceData:setIsHighTier(false);
	deviceData:setUseDelta(0.007);
	deviceData:setMediaType(1);
	deviceData:generatePresets();
	local invItem = VehicleUtils.createPartInventoryItem(part);
end

--
-- CONTAINER ACCESS
--

function Vehicles.ContainerAccess.Counter(vehicle, part, chr)
	if not part:getInventoryItem() then return false; end
	if chr:getVehicle() == vehicle then
		local seat = vehicle:getSeat(chr)
		-- Can the seated player reach the passenger seat?
		-- Only character in rear seats can access it
		return seat ~= 0 and seat ~= 1;
	elseif chr:getVehicle() then
		-- Can't reach from inside a different vehicle.
		return false
	else
		return false
	end
end
--
-- UPDATE PARTS
--

function Vehicles.Update.Fridge(vehicle, part, elapsedMinutes)
	print("Fridge Temp " + part:getItemContainer():getTemperature())
	if part:getModData().coolerActive then
		local batteryChange = -0.00005;
		local id = vehicle:getId()
		if vehicle:getBatteryCharge() <= 0.0 then
			part:getModData().coolerActive = false
		else
			part:getItemContainer():setCustomTemperature(0.2)

			if not vehicle:isEngineRunning() and not vehicle:getSquare():haveElectricity() then
				VehicleUtils.chargeBattery(vehicle, batteryChange * elapsedMinutes)
			end
		end
	elseif part:getItemContainer():getTemperature() < 1 then
		part:getItemContainer():setCustomTemperature(1)
	end
	vehicle:transmitPartModData(part);
end

function Vehicles.Update.Oven(vehicle, part, elapsedMinutes)
	local batteryChange = -0.005;
	local id = vehicle:getId()
	if part:getModData().ovenActive then
		local currentTemp = part:getItemContainer():getTemperature()
		local maxTemp = 2.0

		if currentTemp < maxTemp then
			part:getItemContainer():setCustomTemperature(currentTemp + (0.05 * elapsedMinutes))
		elseif currentTemp > maxTemp then
			part:getItemContainer():setCustomTemperature(maxTemp)
		end
		if not vehicle:isEngineRunning() and not vehicle:getSquare():haveElectricity() then
			VehicleUtils.chargeBattery(vehicle, batteryChange * elapsedMinutes)
		end
	end

	if not part:getModData().ovenActive then
		local currentTemp = part:getItemContainer():getTemperature()
		local minTemp = 1.0

		if currentTemp > minTemp then
			part:getItemContainer():setCustomTemperature(currentTemp - (0.05 * elapsedMinutes))
		elseif currentTemp < minTemp then
			part:getItemContainer():setCustomTemperature(minTemp)
		end
	end
	vehicle:transmitPartModData(part);
end

function Vehicles.Update.Television(vehicle, part, elapsedMinutes)
	local deviceData = part:getDeviceData()
	if deviceData and deviceData:getIsTurnedOn() and not vehicle:isEngineRunning() and not vehicle:getSquare():haveElectricity() then
		VehicleUtils.chargeBattery(vehicle, -0.000025 * elapsedMinutes)
	end
	vehicle:transmitPartModData(part);
end

function Vehicles.Update.Heater(vehicle, part, elapsedMinutes)
	if not Vehicles.elaspedMinutesForHeater[vehicle:getId()] then
		Vehicles.elaspedMinutesForHeater[vehicle:getId()] = 0;
	end
	local pc = vehicle:getPartById("PassengerCompartment")
	local engine = vehicle:getPartById("Engine")
	if not pc or not engine then return end
	if not pc:getModData().temperature then
		pc:getModData().temperature = 0.0
	end
	if not part:getModData().temperature then part:getModData().temperature = 0; end
--	print(elapsedMinutes)
	local tempInc = 0.5 + (math.min(engine:getModData().temperature / 100, 0.7))
	local previousTemp = pc:getModData().temperature;
--		print("heater temp " .. part:getModData().temperature .. " - " .. pc:getModData().temperature .. " - " .. tempInc)
	if part:getModData().active and vehicle:isEngineRunning() and engine:getModData().temperature > 30 and ((part:getModData().temperature > 0 and pc:getModData().temperature <= part:getModData().temperature) or  (part:getModData().temperature < 0 and pc:getModData().temperature >= part:getModData().temperature)) then
		if part:getModData().temperature > 0 then
			pc:getModData().temperature = math.min(pc:getModData().temperature + tempInc * elapsedMinutes,  part:getModData().temperature)
		else
			pc:getModData().temperature = math.max(pc:getModData().temperature - tempInc * elapsedMinutes,  part:getModData().temperature)
		end
		if part:getModData().temperature > 0 and pc:getModData().temperature > part:getModData().temperature then pc:getModData().temperature = part:getModData().temperature end
		if part:getModData().temperature < 0 and pc:getModData().temperature < part:getModData().temperature then pc:getModData().temperature = part:getModData().temperature end
	else
		if pc:getModData().temperature > 0 then
			pc:getModData().temperature = math.max(pc:getModData().temperature - 0.1 * elapsedMinutes, 0)
		else
			pc:getModData().temperature = math.min(pc:getModData().temperature + 0.1 * elapsedMinutes, 0)
		end
	end
	if part:getModData().active and not vehicle:isEngineRunning() and not vehicle:getSquare():haveElectricity() then
		VehicleUtils.chargeBattery(vehicle, -0.000035 * elapsedMinutes)
	end
	Vehicles.elaspedMinutesForHeater[vehicle:getId()] = Vehicles.elaspedMinutesForHeater[vehicle:getId()] + elapsedMinutes;
	if isServer() and VehicleUtils.compareFloats(previousTemp, pc:getModData().temperature, 2) and Vehicles.elaspedMinutesForHeater[vehicle:getId()] > 2 then
		Vehicles.elaspedMinutesForHeater[vehicle:getId()] = 0;
		vehicle:transmitPartModData(pc);
	end
end
--
-- USE OR ACTIVATE PARTS
--

function Vehicles.Use.Oven(vehicle, cont, player)
	local id = vehicle:getId()
	if isClient() then
		sendClientCommand(getPlayer(), 'SFDrive', 'useCarOven', { player = player:getUsername(), id = id })
	else
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
end
