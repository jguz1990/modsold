--***********************************************************
--**                          KI5                          **
--***********************************************************


commando = {}
commando.CheckEngine = {}
commando.CheckOperate = {}
commando.ContainerAccess = {}
commando.Create = {}
commando.Init = {}
commando.InstallComplete = {}
commando.InstallTest = {}
commando.UninstallComplete = {}
commando.UninstallTest = {}
commando.Update = {}
commando.Use = {}

function commando.ContainerAccess.Trunk(vehicle, part, chr)
	if chr:getVehicle() == vehicle then
		local seat = vehicle:getSeat(chr)
		return seat == 5 or seat == 4 or seat == 3 or seat == 2 or seat == 1 or seat == 0;
	elseif chr:getVehicle() then
		return false
	else
		if not vehicle:isInArea(part:getArea(), chr) then return false end
		local doorPart = vehicle:getPartById("DoorRear")
		if doorPart and doorPart:getDoor() and not doorPart:getDoor():isOpen() then
			return false
		end
		return true
	end
end