--***********************************************************
--**                          KI5                          **
--***********************************************************

Events.OnPlayerUpdate.Add(function(player, vehicle, args, part)
    local vehicle = player.getVehicle and player:getVehicle() or nil
    if (vehicle and string.find( vehicle:getScriptName(), "82oshkoshM911" )) then


	-- Juicy stuff

	local part = vehicle:getPartById("Engine")
		    		if part:getCondition() < 10 then
						sendClientCommand(player, "vehicle", "setPartCondition", { vehicle = vehicle:getId(), part = part:getId(), condition = 10 })
					--print ("Engine repaired")
			end

	local part = vehicle:getPartById("GasTank")
		    		if part:getCondition() < 50 then
						sendClientCommand(player, "vehicle", "setPartCondition", { vehicle = vehicle:getId(), part = part:getId(), condition = 50 })
					--print ("GasTank repaired")
			end

	local part = vehicle:getPartById("EngineDoor")
		    		if part:getCondition() < 10 then
						sendClientCommand(player, "vehicle", "setPartCondition", { vehicle = vehicle:getId(), part = part:getId(), condition = 10 })
					--print ("EngineDoor repaired")
			end

end

end)