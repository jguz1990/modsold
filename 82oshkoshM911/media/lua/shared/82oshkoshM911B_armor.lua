--***********************************************************
--**                          KI5                          **
--***********************************************************

Events.OnPlayerUpdate.Add(function(player, vehicle, args, part)
    local vehicle = player.getVehicle and player:getVehicle() or nil
    if (vehicle and string.find( vehicle:getScriptName(), "82oshkoshM911B" )) then

	-- Bodywork

	local part = vehicle:getPartById("DoorFrontLeft")
		    		if part:getCondition() < 15 then
						sendClientCommand(player, "vehicle", "setPartCondition", { vehicle = vehicle:getId(), part = part:getId(), condition = 15 })
					--print ("doorfL repaired")
			end

	local part = vehicle:getPartById("DoorFrontRight")
		    		if part:getCondition() < 15 then
						sendClientCommand(player, "vehicle", "setPartCondition", { vehicle = vehicle:getId(), part = part:getId(), condition = 15 })
					--print ("doorfR repaired")
			end

	local part = vehicle:getPartById("EngineDoor")
		    		if part:getCondition() < 15 then
						sendClientCommand(player, "vehicle", "setPartCondition", { vehicle = vehicle:getId(), part = part:getId(), condition = 15 })
					--print ("EngineDoor repaired")
			end

	-- Windows

	local part = vehicle:getPartById("WindowFrontLeft")
		    		if part:getCondition() < 84 then
						sendClientCommand(player, "vehicle", "setPartCondition", { vehicle = vehicle:getId(), part = part:getId(), condition = 84 })
					--print ("WindowFrontLeft repaired")
			end

	local part = vehicle:getPartById("WindowFrontRight")
		    		if part:getCondition() < 86 then
						sendClientCommand(player, "vehicle", "setPartCondition", { vehicle = vehicle:getId(), part = part:getId(), condition = 86 })
					--print ("WindowFrontRight repaired")
			end

	local part = vehicle:getPartById("WindowRearLeft")
		    		if part:getCondition() < 80 then
						sendClientCommand(player, "vehicle", "setPartCondition", { vehicle = vehicle:getId(), part = part:getId(), condition = 80 })
					--print ("WindowRearLeft repaired")
			end

	local part = vehicle:getPartById("WindowRearRight")
		    		if part:getCondition() < 83 then
						sendClientCommand(player, "vehicle", "setPartCondition", { vehicle = vehicle:getId(), part = part:getId(), condition = 83 })
					--print ("WindowRearRight repaired")
			end

	local part = vehicle:getPartById("WindshieldRear")
		    		if part:getCondition() < 81 then
						sendClientCommand(player, "vehicle", "setPartCondition", { vehicle = vehicle:getId(), part = part:getId(), condition = 81 })
					--print ("WindshieldRear repaired")
			end

	local part = vehicle:getPartById("Windshield")
		    		if part:getCondition() < 85 then
						sendClientCommand(player, "vehicle", "setPartCondition", { vehicle = vehicle:getId(), part = part:getId(), condition = 85 })
					--print ("Windshield repaired")
			end

	-- Juicy stuff

	local part = vehicle:getPartById("Engine")
		    		if part:getCondition() < 15 then
						sendClientCommand(player, "vehicle", "setPartCondition", { vehicle = vehicle:getId(), part = part:getId(), condition = 15 })
					--print ("Engine repaired")
			end

	local part = vehicle:getPartById("GasTank")
		    		if part:getCondition() < 95 then
						sendClientCommand(player, "vehicle", "setPartCondition", { vehicle = vehicle:getId(), part = part:getId(), condition = 95 })
					--print ("GasTank repaired")
			end

	local part = vehicle:getPartById("TruckBed")
		    		if part:getCondition() < 15 then
						sendClientCommand(player, "vehicle", "setPartCondition", { vehicle = vehicle:getId(), part = part:getId(), condition = 15 })
					--print ("TruckBed repaired")
			end

end

end)