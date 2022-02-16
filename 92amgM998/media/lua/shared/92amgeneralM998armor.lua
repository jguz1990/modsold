--***********************************************************
--**                   KI5 / bikinihorst                   **
--***********************************************************
--v1.8.9

KI5 = KI5 or {};

KI5.tireCond = ZombRand(19,29)
KI5.tirePsi = ZombRand(29,35)

function KI5.extractCond(player)
	local vehicle = player:getVehicle()
	if (vehicle and string.find( vehicle:getScriptName(), "92amgeneralM998" )) then
		for i, partId in ipairs ({
			"Engine", "EngineDoor",
			"Windshield", "WindowFrontLeft", "WindowFrontRight", "WindowRearLeft", "WindowRearRight",
			"DoorFrontLeft", "DoorFrontRight", "DoorRearLeft", "DoorRearRight",
			})
		do
			KI5:savePartCondById(vehicle, partId);
		end
	end
end

function KI5:savePartCond(part)
	if part then
		local vehicle = part:getVehicle()
		if vehicle then
			KI5:sendArmorCommandWrapper(getPlayer(), part, "setPartModData", {
				data = {
					saveCond = part:getCondition()
				}
			});
		end
	end
end

function KI5:savePartCondById(vehicle, partId)
	if vehicle and partId then
		KI5:savePartCond(vehicle:getPartById(partId))
	end
end

function KI5:sendVehicleCommandWrapper(player, part, methodName, args)
	local args = args or {}
	args.part = part:getId()
	args.vehicle = part:getVehicle():getId()
	sendClientCommand(player, "vehicle", methodName, args)
end

function KI5:sendArmorCommandWrapper(player, part, methodName, args)
	local args = args or {}
	args.part = part:getId()
	args.vehicle = part:getVehicle():getId()
	sendClientCommand(player, "KI5_armor", methodName, args)
end

function KI5.activeArmor(player)
    local vehicle = player:getVehicle()
    	if (vehicle and string.find( vehicle:getScriptName(), "92amgeneralM998" )) then

		--

			for i, tirePart in ipairs ({"TireFrontLeft", "TireFrontRight", "TireRearLeft", "TireRearRight"})
				do
					if vehicle:getPartById(tirePart) then
						local part = vehicle:getPartById(tirePart)
					    	if part:getCondition() < KI5.tireCond then
					    		KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {condition = KI5.tireCond})
							elseif part:getContainerContentAmount() < 10 then
								KI5:sendVehicleCommandWrapper(player, part, "setContainerContentAmount", {amount = KI5.tirePsi})
							end
					end
			end

		--

			local part = vehicle:getPartById("GasTank")
				if part:getCondition() < 85 then
					KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {condition = 85})
				end

			local part = vehicle:getPartById("M998Trunk")
				if part:getCondition() < 49 then
					KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {condition = 49})
				end

			local part = vehicle:getPartById("M998Roofrack")
				if part:getCondition() < 48 then
					KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {condition = 48})
				end

			local part = vehicle:getPartById("TrunkDoor")
				if part:getCondition() < 37 then
					KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {condition = 37})
				end

		--

			local protection = vehicle:getPartById("M998Bullbar")
			local part = vehicle:getPartById("EngineDoor")
				if part and protection and part:getInventoryItem() and protection:getInventoryItem() and part:getModData()
				then
					local partCond = tonumber(part:getModData().saveCond)
					if protection:getCondition() > 0 and partCond
					then
						if part:getCondition() < partCond
						then
							KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {
								condition = partCond
							})
							local cond = protection:getCondition() - ZombRand(3)
							KI5:sendVehicleCommandWrapper(player, protection, "setPartCondition", {
								condition = cond
							})
						end
					end
				else
					local protection = vehicle:getPartById("M998Bullbar")
					local part = vehicle:getPartById("Engine")
						if protection and protection:getInventoryItem() and part and part:getModData()
						then
							local partCond = tonumber(part:getModData().saveCond)
							if protection:getCondition() > 0 and partCond
							then
								if part:getCondition() < partCond
								then
									KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {
										condition = partCond
									})
									local cond = protection:getCondition() - ZombRand(4)
									KI5:sendVehicleCommandWrapper(player, protection, "setPartCondition", {
										condition = cond
									})
								end
							end
						end
				end

		--

			for partId, armorPartId in pairs({
				["DoorFrontLeft"] = "M998DoorFrontLeftArmor",
				["DoorFrontRight"] = "M998DoorFrontRightArmor",
				["DoorRearLeft"] = "M998DoorRearLeftArmor",
				["DoorRearRight"] = "M998DoorRearRightArmor",
			}) do
				local part = vehicle:getPartById(partId);
				local protection = vehicle:getPartById(armorPartId);
				if protection and protection:getInventoryItem() and part and part:getModData()
				then
					local partCond = tonumber(part:getModData().saveCond);
					if protection:getCondition() > 0 and partCond and part:getCondition() < partCond
					then
						KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {
							condition = partCond
						});
						local cond = protection:getCondition() - ZombRand(4);
						KI5:sendVehicleCommandWrapper(player, protection, "setPartCondition", {
							condition = cond
						});
					end
				end
			end

		--

			for partId, armorPartId in pairs({
				["WindowFrontLeft"] = "M998DoorFrontLeftArmor",
				["WindowFrontRight"] = "M998DoorFrontRightArmor",
				["WindowRearLeft"] = "M998DoorRearLeftArmor",
				["WindowRearRight"] = "M998DoorRearRightArmor",
			}) do
				local part = vehicle:getPartById(partId);
				local protection = vehicle:getPartById(armorPartId);
				if protection and protection:getInventoryItem() and part and part:getModData()
				then
					local partCond = tonumber(part:getModData().saveCond);
					if protection:getCondition() > 0 and partCond and part:getCondition() < partCond
					then
						KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {
							condition = partCond
						});
					end
				end
			end

		--

			local protection = vehicle:getPartById("M998WindshieldArmor")
			local part = vehicle:getPartById("Windshield")
			if protection and protection:getInventoryItem() and part and part:getModData()
			then
				local partCond = tonumber(part:getModData().saveCond)
				if protection:getCondition() > 0 and partCond
				then
					if part:getCondition() < partCond
					then
						KI5:sendVehicleCommandWrapper(player, part, "setPartCondition", {
							condition = partCond
						})
						local cond = protection:getCondition() - ZombRand(3)
						KI5:sendVehicleCommandWrapper(player, protection, "setPartCondition", {
							condition = cond
						})
					end
				end
			end
		end
end

Events.OnEnterVehicle.Add(KI5.extractCond);
Events.OnPlayerUpdate.Add(KI5.activeArmor);