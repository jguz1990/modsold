--***********************************************************
--**                          KI5                          **
--***********************************************************

Events.OnPlayerUpdate.Add(function(player, vehicle, args, part)
    local vehicle = player.getVehicle and player:getVehicle() or nil
    if (vehicle and string.find( vehicle:getScriptName(), "86oshkoshKYFD" )) then

-- Bodywork

	local part = vehicle:getPartById("DoorFrontLeft")
		    		if part:getCondition() < 5 then
						sendClientCommand(player, "vehicle", "setPartCondition", { vehicle = vehicle:getId(), part = part:getId(), condition = 5 })
				--print ("doorfL repaired")
			end

	local part = vehicle:getPartById("DoorFrontRight")
		    		if part:getCondition() < 5 then
						sendClientCommand(player, "vehicle", "setPartCondition", { vehicle = vehicle:getId(), part = part:getId(), condition = 5 })
				--print ("doorfR repaired")
			end

	local part = vehicle:getPartById("EngineDoor")
		    		if part:getCondition() < 5 then
						sendClientCommand(player, "vehicle", "setPartCondition", { vehicle = vehicle:getId(), part = part:getId(), condition = 5 })
				--print ("EngineDoor repaired")
			end

-- Windows

	local part = vehicle:getPartById("WindowFrontLeft")
		    		if part:getCondition() < 19 then
						sendClientCommand(player, "vehicle", "setPartCondition", { vehicle = vehicle:getId(), part = part:getId(), condition = 19 })
				--print ("WindowFrontLeft repaired")
			end

	local part = vehicle:getPartById("WindowFrontRight")
		    		if part:getCondition() < 19 then
						sendClientCommand(player, "vehicle", "setPartCondition", { vehicle = vehicle:getId(), part = part:getId(), condition = 19 })
				--print ("WindowFrontRight repaired")
			end

	local part = vehicle:getPartById("Windshield")
		    		if part:getCondition() < 19 then
						sendClientCommand(player, "vehicle", "setPartCondition", { vehicle = vehicle:getId(), part = part:getId(), condition = 19 })
				--print ("Windshield repaired")
			end

-- Juicy stuff

	local part = vehicle:getPartById("Engine")
		    		if part:getCondition() < 5 then
						sendClientCommand(player, "vehicle", "setPartCondition", { vehicle = vehicle:getId(), part = part:getId(), condition = 5 })
				--print ("Engine repaired")
			end

	local part = vehicle:getPartById("GasTank")
		    		if part:getCondition() < 50 then
						sendClientCommand(player, "vehicle", "setPartCondition", { vehicle = vehicle:getId(), part = part:getId(), condition = 50 })
				--print ("GasTank repaired")
			end

	local part = vehicle:getPartById("TruckBed")
		    		if part:getCondition() < 5 then
						sendClientCommand(player, "vehicle", "setPartCondition", { vehicle = vehicle:getId(), part = part:getId(), condition = 5 })
				--print ("TruckBed repaired")
			end

end

end)