function detect_Alarm (player, context, worldobjects, test)
	local playerObj = getSpecificPlayer(player)
	if not playerObj:HasTrait("Burglar") then return end

	local square = nil;
	for i,v in ipairs(worldobjects) do
		square = v:getSquare();
		break;
	end
	
	--if square and square:getBuilding() and square:DistTo(playerObj) < 5 then
	if square and square:getBuilding() then
		local def = square:getBuilding():getDef();
		local alarm = "Building has no Alarm";
		if def:isAlarmed() then
			alarm = "Building has Alarm";
		end
		context:addOption(alarm, nil, nil);
	end
	
	
	
	vehicle = IsoObjectPicker.Instance:PickVehicle(getMouseXScaled(), getMouseYScaled())
	--if vehicle and vehicle:DistTo(playerObj) < 5 then
	if vehicle then
		detect_Vehicle_Alarm(player, context, vehicle)
	end
		
end

function detect_Vehicle_Alarm (player, context, vehicle)
	local playerObj = getSpecificPlayer(player)
	if vehicle:isAlarmed() then 
		context:addOption("Vehicle has Alarm", nil, nil);
	else		
		context:addOption("Vehicle has no Alarm", nil, nil);
	end
end