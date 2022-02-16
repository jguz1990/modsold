--***********************************************************
--**                   KI5 / bikinihorst                   **
--***********************************************************

M998 = {
	parts = {
		Muffler = {
			M998Muffler = {
				Muffler1 = "M998Muffler1_Item",
				Muffler2 = "M998Muffler2_Item",
			},
		},
		Bullbar = {
			M998Bullbar = {
				Bullbar1 = "M998Bullbar1_Item",
				Bullbar2 = "M998Bullbar2_Item",
			},
		},
		BackCover = {
			M998BackCover = {
				BackCover1 = "M998BackCover1_Item",
			},
		},
		TrunkBarrier = {
			M998TrunkBarrier = {
				TrunkBarrier1 = "M998TrunkBarrier1_Item",
				TrunkBarrier2 = "M998TrunkBarrier2_Item",
			},
		},
		DoorFrontLeftArmor = {
			M998DoorFrontLeftArmor = {
				DoorFrontLeftArmor1 = "M998CarFrontDoorArmor1_Item",
			},
		},
		DoorFrontRightArmor = {
			M998DoorFrontRightArmor = {
				DoorFrontRightArmor1 = "M998CarFrontDoorArmor1_Item",
			},
		},
		DoorRearLeftArmor = {
			M998DoorRearLeftArmor = {
				DoorFrontLeftArmor1 = "M998CarRearDoorArmor1_Item",
			},
		},
		DoorRearRightArmor = {
			M998DoorRearRightArmor = {
				DoorRearRightArmor1 = "M998CarRearDoorArmor1_Item",
			},
		},
		WindshieldArmor = {
			M998WindshieldArmor = {
				WindshieldArmor1 = "M998WindshieldArmor1_Item",
				WindshieldArmor2 = "M998WindshieldArmor2_Item",
			},
		},
		Mudflaps = {
			M998Mudflaps = {
				Mudflaps1 = "M998Mudflaps1_Item",
			},
		},
		Roofrack = {
			M998Roofrack = {
				Roofrack1 = "M998Roofrack1_Item",
			},
		},
	},
};

M998.parts.Muffler.default = "random";
M998.parts.BackCover.default = M998.parts.BackCover.M998BackCover.BackCover1;
M998.parts.TrunkBarrier.default = "random";
M998.parts.Mudflaps.default = M998.parts.Mudflaps.M998Mudflaps.Mudflaps1;

KI5:createVehicleConfig(M998);


function Recipe.OnCreate.DismantleSpareTireWithMount(items, result, player)
    player:getInventory():AddItem("Base.M998SpareMount_Item");
end

function M998.ContainerAccess.Trunk(vehicle, part, chr)
	if chr:getVehicle() == vehicle then
		local seat = vehicle:getSeat(chr)
		return seat == 3 or seat == 2 or seat == 1 or seat == 0;
	elseif chr:getVehicle() then
		return false
	else
		if not vehicle:isInArea(part:getArea(), chr) then return false end
		local doorPart = vehicle:getPartById("TrunkDoor")
		if doorPart and doorPart:getDoor() and not doorPart:getDoor():isOpen() then
			return false
		end
		return true
	end
end

function M998.ContainerAccess.Roofrack(vehicle, part, chr)
	if chr:getVehicle() then return false end
	if not vehicle:isInArea(part:getArea(), chr) then return false end
	return true
end

function M998.UninstallComplete.TrunkDoor(vehicle, part, chr)
		KI5:sendClientCommand("vehicle", "setDoorOpen", {
		vehicle = part:getVehicle():getId(),
		part = part:getId(),
		open = true
		});
end