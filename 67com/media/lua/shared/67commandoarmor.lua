--***********************************************************
--**                          KI5                          **
--***********************************************************

Events.OnPlayerUpdate.Add(function(player, vehicle, args, part)
    local vehicle = player.getVehicle and player:getVehicle() or nil
    if (vehicle and string.find( vehicle:getScriptName(), "67commando" )) then

-- RunFlats

	local part = vehicle:getPartById("TireFrontLeft")
    		if part:getCondition() < 29 then
				sendClientCommand(player, "vehicle", "setPartCondition", { vehicle = vehicle:getId(), part = part:getId(), condition = 29 })
				--print ("tireFL repaired")
	end

		local part = vehicle:getPartById("TireFrontLeft")
    		if part:getContainerContentAmount() < 10 then
				sendClientCommand(player, "vehicle", "setContainerContentAmount", { vehicle = vehicle:getId(), part = part:getId(), amount = 30 })
				--print ("tireFL pumped")
		end

	local part = vehicle:getPartById("TireFrontRight")
	    		if part:getCondition() < 29 then
					sendClientCommand(player, "vehicle", "setPartCondition", { vehicle = vehicle:getId(), part = part:getId(), condition = 29 })
				--print ("tireFR repaired")
		end

		local part = vehicle:getPartById("TireFrontRight")
    		if part:getContainerContentAmount() < 10 then
				sendClientCommand(player, "vehicle", "setContainerContentAmount", { vehicle = vehicle:getId(), part = part:getId(), amount = 30 })
				--print ("tireFR pumped")
		end

	local part = vehicle:getPartById("TireRearLeft")
    		if part:getCondition() < 29 then
				sendClientCommand(player, "vehicle", "setPartCondition", { vehicle = vehicle:getId(), part = part:getId(), condition = 29 })
				--print ("tireRL repaired")
	end

		local part = vehicle:getPartById("TireRearLeft")
    		if part:getContainerContentAmount() < 10 then
				sendClientCommand(player, "vehicle", "setContainerContentAmount", { vehicle = vehicle:getId(), part = part:getId(), amount = 30 })
				--print ("tireRL pumped")
		end

	local part = vehicle:getPartById("TireRearRight")
	    		if part:getCondition() < 29 then
					sendClientCommand(player, "vehicle", "setPartCondition", { vehicle = vehicle:getId(), part = part:getId(), condition = 29 })
				--print ("tireRR repaired")
		end

		local part = vehicle:getPartById("TireRearRight")
    		if part:getContainerContentAmount() < 10 then
				sendClientCommand(player, "vehicle", "setContainerContentAmount", { vehicle = vehicle:getId(), part = part:getId(), amount = 30 })
				--print ("tireRR pumped")
		end

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

	local part = vehicle:getPartById("DoorRear")
		    		if part:getCondition() < 5 then
						sendClientCommand(player, "vehicle", "setPartCondition", { vehicle = vehicle:getId(), part = part:getId(), condition = 5 })
						--print ("DoorRear repaired")
			end

-- Windows

	local part = vehicle:getPartById("WindowFrontLeft")
		    		if part:getCondition() < 59 then
						sendClientCommand(player, "vehicle", "setPartCondition", { vehicle = vehicle:getId(), part = part:getId(), condition = 59 })
						--print ("WindowFrontLeft repaired")
			end

	local part = vehicle:getPartById("WindowFrontRight")
		    		if part:getCondition() < 59 then
						sendClientCommand(player, "vehicle", "setPartCondition", { vehicle = vehicle:getId(), part = part:getId(), condition = 59 })
						--print ("WindowFrontRight repaired")
			end

	local part = vehicle:getPartById("WindowRearRight")
		    		if part:getCondition() < 59 then
						sendClientCommand(player, "vehicle", "setPartCondition", { vehicle = vehicle:getId(), part = part:getId(), condition = 59 })
						--print ("WindowRearRight repaired")
			end

	local part = vehicle:getPartById("WindshieldRear")
		    		if part:getCondition() < 59 then
						sendClientCommand(player, "vehicle", "setPartCondition", { vehicle = vehicle:getId(), part = part:getId(), condition = 59 })
						--print ("WindshieldRear repaired")
			end

	local part = vehicle:getPartById("Windshield")
		    		if part:getCondition() < 59 then
						sendClientCommand(player, "vehicle", "setPartCondition", { vehicle = vehicle:getId(), part = part:getId(), condition = 59 })
						--print ("Windshield repaired")
			end

-- Juicy stuff

	local part = vehicle:getPartById("Engine")
		    		if part:getCondition() < 10 then
						sendClientCommand(player, "vehicle", "setPartCondition", { vehicle = vehicle:getId(), part = part:getId(), condition = 10 })
						--print ("Engine repaired")
			end

	local part = vehicle:getPartById("GasTank")
		    		if part:getCondition() < 100 then
						sendClientCommand(player, "vehicle", "setPartCondition", { vehicle = vehicle:getId(), part = part:getId(), condition = 100 })
						--print ("GasTank repaired")
			end

	local part = vehicle:getPartById("TruckBed")
		    		if part:getCondition() < 15 then
						sendClientCommand(player, "vehicle", "setPartCondition", { vehicle = vehicle:getId(), part = part:getId(), condition = 15 })
						--print ("TruckBed repaired")
			end

end

end)

Events.OnPlayerUpdate.Add(function(player, vehicle, args, part)
    local vehicle = player.getVehicle and player:getVehicle() or nil
    if (vehicle and string.find( vehicle:getScriptName(), "67commandoT50" )) then

    local part = vehicle:getPartById("WindowRearLeft")
		    		if part:getCondition() < 59 then
						sendClientCommand(player, "vehicle", "setPartCondition", { vehicle = vehicle:getId(), part = part:getId(), condition = 59 })
						--print ("WindowRearLeft repaired")
			end

end

--next time you copy paste my shit without permission at least give me some credit man,you know who you are.

end)