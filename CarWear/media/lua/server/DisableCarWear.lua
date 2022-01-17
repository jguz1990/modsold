-- steamapps\common\ProjectZomboid\media\lua\server\Vehicles\Vehicles.lua
function Vehicles.Update.Muffler(vehicle, part, elapsedMinutes)
	-- left speed at 10
	if vehicle:isEngineRunning() and vehicle:getCurrentSpeedKmHour() > 10 and part:getInventoryItem() then
		local chance = part:getInventoryItem():getConditionLowerNormal();
		if vehicle:isDoingOffroad() then chance = part:getInventoryItem():getConditionLowerOffroad() / vehicle:getScript():getOffroadEfficiency(); end
		-- will also depend on speed
		-- divide 1100 gets around 10% at 90mph
		-- AmericanCars has 13200 should get around 0.0068+.00999
		-- every AmericanCars value was multiplied by 50. so you can expect 50 times less wear from AmericanCars! :D
		-- base chance is something like < 1 || .009999999776482582 so about 1.5% at 90mph
		chance = chance + (vehicle:getCurrentSpeedKmHour() / 660000);
		if part:getCondition() > 0 and ZombRandFloat(0, 100) < chance then
			part:setCondition(part:getCondition() - 1);
			vehicle:updatePartStats();
		end
		
		-- chance of totally dropping the muffler if condition is really low - taken from AmericanCars mod, will delete if phil gets mad
		if part:getCondition() < 5 then
			if ZombRandFloat(0, 100) < 0.2 then
				vehicle:getSquare():AddWorldInventoryItem(part:getInventoryItem(), 0,0,0);
				part:setInventoryItem(nil);
			end
		end
	end
end


-- suspension
function Vehicles.Update.Suspension(vehicle, part, elapsedMinutes)
	-- speed left at 10
	if vehicle:isEngineRunning() and vehicle:getCurrentSpeedKmHour() > 10 and part:getInventoryItem() and math.abs(vehicle:getCurrentSteering()) > 0.2 then
		local chance = part:getInventoryItem():getConditionLowerNormal();
		if vehicle:isDoingOffroad() then chance = part:getInventoryItem():getConditionLowerOffroad() / vehicle:getScript():getOffroadEfficiency(); end
		-- will also depend on speed/current steering
		-- default is 300
		-- AmericanCars has 3600
		chance = chance + (vehicle:getCurrentSpeedKmHour() / 180000);
		-- default is 20
		-- AmericanCars has 40
		chance = chance + math.abs(vehicle:getCurrentSteering() / 2000)
		if part:getCondition() > 0 and ZombRandFloat(0, 100) < chance then
			part:setCondition(part:getCondition() - 1);
			vehicle:updatePartStats();
		end
	end
end


-- tires
function Vehicles.Update.Tire(vehicle, part, elapsedMinutes)
	-- speed left at 10
	if vehicle:isEngineRunning() and vehicle:getCurrentSpeedKmHour() > 10 and part:getInventoryItem() and math.abs(vehicle:getCurrentSteering()) > 0.2 then
		local chance = part:getInventoryItem():getConditionLowerNormal();
		if vehicle:isDoingOffroad() then chance = part:getInventoryItem():getConditionLowerOffroad() / vehicle:getScript():getOffroadEfficiency(); end
		-- will also depend on speed/current steering
		-- default is  500
		-- AmericanCars has 3000
		chance = chance + (vehicle:getCurrentSpeedKmHour() / 150000);
		-- default is 40
		-- AmericanCars has 80
		chance = chance + math.abs(vehicle:getCurrentSteering() / 4000)
	
		if part:getCondition() > 0 and ZombRandFloat(0, 100) < chance then
			part:setCondition(part:getCondition() - 1);
			vehicle:updatePartStats();
		end
		
		-- Random air loss. I made it a 1/1000 chance because I think this feature is cool
		if part:getContainerContentAmount() > 0 and ZombRandFloat(0, 100) < (0.001) then
			part:setContainerContentAmount(part:getContainerContentAmount() - 1, false, true);
		end
		
		-- unchanged
		if part:getContainerContentAmount() < 5 then
			local contentMod = (part:getInventoryItem():getMaxCapacity() - part:getContainerContentAmount())  / 350;
			if part:getContainerContentAmount() == 0 or ZombRandFloat(0, 100) < contentMod then
				vehicle:getSquare():AddWorldInventoryItem(part:getInventoryItem(), 0,0,0);
				VehicleUtils.RemoveTire(part, false);
			end
		end
	
		-- unchanged
		if part:getCondition() < 15 then
			local condMod = (100 - part:getCondition())  / 350;
			if part:getCondition() == 0 or ZombRandFloat(0, 100) < condMod then VehicleUtils.RemoveTire(part, true); end
		end
	end
end

-- brakes - AmericanCars doesn't modify this, default is 20
function Vehicles.Update.Brakes(vehicle, part, elapsedMinutes)
	if vehicle:isEngineRunning() and vehicle:getBrakeSpeedBetweenUpdate() > 0 and part:getInventoryItem() then
		local speedMod = (math.min(80, vehicle:getBrakeSpeedBetweenUpdate()) / 1000);
		if ZombRandFloat(0, 100) < speedMod then
			part:setCondition(part:getCondition() - 1);
			vehicle:transmitPartCondition(part);
			vehicle:updatePartStats();
		end
	end
end
