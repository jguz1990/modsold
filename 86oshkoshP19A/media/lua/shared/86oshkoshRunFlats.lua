--***********************************************************
--**                          KI5                          **
--***********************************************************

Events.OnPlayerUpdate.Add(function(player, vehicle, args, part)
    local vehicle = player.getVehicle and player:getVehicle() or nil
    if (vehicle and string.find( vehicle:getScriptName(), "86oshkosh" )) then

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


end

--next time you copy paste my shit without permission at least give me some credit man,you know who you are.

end)