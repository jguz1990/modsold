FlareGun_Shoot = function(character, chargeDelta, weapon)
	ModInfo = character:getModData()
	--FlareShot = ModInfo.FlareShot
	--print("SHOOT!")
	local typeWeapon = weapon:getType()
	--print(typeWeapon)
	ModInfo.FlareShot = false
	--if weapon:getType() == "FlareGun" then
	if  ( typeWeapon == "FlareGun" or typeWeapon == "Flare Gun" ) and weapon:getCurrentAmmoCount() > 0 then
		--print("FLARE GUNE")
		ModInfo.FlareShot = true
		--print(tostring(ModInfo.FlareShot))
	end	
end

FlareGun_Shot_Test = function(player)
	ModInfo = player:getModData()
	--print(ModInfo.FlareShot)
	--FlareShot = ModInfo.FlareShot
	local owner = player
	if ModInfo.FlareShotWait == true then	
		--print("FLARE AND COPTER")
		--print(tostring(ModInfo.FlareShot))
		ModInfo.FlareShot = false
		ModInfo.FlareShotWait = false
		if owner:isOutside() == false then
			owner:getCurrentSquare():explode()
			owner:startMuzzleFlash()
		else
			testHelicopter()
			--local clim = getWorld():getClimateManager();
			--if clim then
				--clim:launchFlare()
			--end
			local hour = getGameTime():getTimeOfDay()
			if hour < 5 or hour > 22 then
				local clim = getWorld():getClimateManager();
				clim:launchFlare()
				addSound(null, ( player:getX() ), (player:getY() ), (player:getZ()), 1000, 1000)
			end 
		end
		
		--print(tostring(ModInfo.FlareShot))
	end
	if ModInfo.FlareShot == true then
		ModInfo.FlareShotWait = true
	end
end	
	
Hook.Attack.Add(FlareGun_Shoot);
Events.OnPlayerUpdate.Add(FlareGun_Shot_Test)