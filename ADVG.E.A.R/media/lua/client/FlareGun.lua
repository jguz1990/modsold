FlareTest = function(wielder, victim, weapon, damage)
	ModInfo = wielder:getModData()
	--FlareShot = ModInfo.FlareShot
	--print("TESTIE!")
	--print(weapon:getType())
	--print(tostring(ModInfo.FlareShot))
	local hitObject = victim
	local owner = wielder
	if weapon:getType() ~= "FlareGun" then
	 return false
	end
	
	if owner:getLastHitCount() > 0 and ModInfo.GroundShot == false then
		--hitObject:getCurrentSquare():explode()
		hitObject:SetOnFire()
		hitObject:startMuzzleFlash()
		ModInfo.FlareShot = false
		ModInfo.FlareShotWait = false
	elseif owner:isOutside() == false and  ModInfo.GroundShot == false then
		--owner:getCurrentSquare():explode()
		--owner:startMuzzleFlash()
	elseif  ModInfo.GroundShot == false then
		testHelicopter()
		local clim = getWorld():getClimateManager();
        if clim then
            clim:launchFlare()
        end
		--launchFlare(1, 1, 1, 1, 1, 1)
	end
	ModInfo.GroundShot = false
end

--Events.OnWeaponHitXp.Add(FlareGun);
Events.OnWeaponHitCharacter.Add(FlareTest)


function GoFlare()
	WorldFlares.new(nil):launchFlare(1, 1, 1, 1, 1, 1)
end
