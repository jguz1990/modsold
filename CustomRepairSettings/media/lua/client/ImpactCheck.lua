function ImpactCheckInit()
	DebugLog.log("Controlled Impact Loaded!");

end

function CheckVehicle(player, vehicle, args)
    local vehicle = player.getVehicle and player:getVehicle() or nil
	if (vehicle == nil or not vehicle:isDriver(player)) then
		RemoveStatusTable(player)
	else
		if(player:getModData().VehicleImpactTable[0] == nil) then
			BuildVehicleStatusTable(player, vehicle);
		end
		CheckPartChanges(player, vehicle);
	end
	
	
end

function RemoveStatusTable(player)
	player:getModData().VehicleImpactTable = {};

end

function BuildVehicleStatusTable(player, vehicle)
	local partCount = vehicle:getPartCount();
	for i=0, partCount-1 do	
		local part = vehicle:getPartByIndex(i);
		if (not part:getInventoryItem() and part:getTable("install")) then
			player:getModData().VehicleImpactTable[i] = -1;
		else
			player:getModData().VehicleImpactTable[i] = part:getCondition();
		end
	end
end

function CheckPartChanges(player, vehicle)
	local skill = player:getPerkLevel(Perks.VehicleDurability);
	local damageReduction = DamageReduction(skill)

	local savingThrow = 0;
	-- 0 = not attempted, 1 = passed, -1 = failed
	
	local damageMitigated = 0;
	
	local partCount = vehicle:getPartCount();
	for i=0, partCount-1 do
		local part = vehicle:getPartByIndex(i);
		local knownHP = player:getModData().VehicleImpactTable[i];
		if(not part:getInventoryItem() and part:getTable("install") and knownHP ~= -1 ) then
			player:getModData().VehicleImpactTable[i] = -1;
			if(savingThrow == 0) then
				savingThrow = CalculateSave(skill);
			end
		else
			local partHP = part:getCondition();	
			if(knownHP ~= partHP and knownHP ~= -1) then
				local damage = knownHP - partHP
				if (damage > 1) then
					if(savingThrow == 0) then
						savingThrow = CalculateSave(skill);
					end
					if(savingThrow == 1) then
						damageMitigated = damageMitigated + ReduceTakenDamage(skill, part, partHP, damage, damageReduction);
					end
				end
				player:getModData().VehicleImpactTable[i] = partHP;
			end
		end
	end
	
	if (savingThrow == 1) then
		local xpGain = 0;
		if(damageMitigated >= 60/damageReduction) then
			xpGain = damageMitigated;
		else
			xpGain = damageMitigated/2;
		end
		player:getXp():AddXP(Perks.VehicleDurability, xpGain);
	end
end

function ReduceTakenDamage(skill, part, partHP, damage, damageReduction)
	local reduction =  math.max(damage/damageReduction,1);
	local newCondition = partHP + reduction;
	part:setCondition(newCondition);
	return reduction;
end

function CalculateSave(skill)
	if(skill == 10) then
		return 1
	end
	local roll = ZombRand(100);
	if(roll < (20 + (skill*10))) then
		return 1
	else
		return -1
	end
end

function DamageReduction(skill)
	local min = 5;
	local max = 1.5;
	return (((1.5 - 5.0)*(skill))/5.0) + 5.0;
end

Events.OnGameStart.Add(ImpactCheckInit);
Events.OnPlayerUpdate.Add(CheckVehicle);
