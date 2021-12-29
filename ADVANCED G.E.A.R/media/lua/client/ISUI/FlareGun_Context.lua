function FlareGun_Context (player, context, worldobjects, test)
	local playerObj = getSpecificPlayer(player)
	local playerInv = playerObj:getInventory()
	--local canBeWaterPiped = nil
	--local shower = false
	--print("flare?")
	
	for i,v in ipairs(worldobjects) do
			if v:getSquare() then
				local square = v:getSquare()
				break
			end
	end

	if square and playerObj:isOutside() and square:isOutside() and square:isCanSee(player) then
		--print("FLARE OUTSIDE")
		local primary = playerObj:getPrimaryHandItem()
		if primary then
			--local typePrimary = primary:getType()
		--end
			--print(primary:getType())
			--print(typePrimary)
			if primary:getType() == "FlareGun" and primary:getCurrentAmmoCount() > 0 then
				--print("PEW PEW")
				local mainOption = context:addOption(getText("Shoot Flare At The Ground"), playerObj, FlareSquare, worldobjects, primary)
			end
		end
	end
	-- if square and playerObj:isOutside() == false and square:isCanSee(player) then
		-- print("FLARE INSIDE")
		-- local primary = playerObj:getPrimaryHandItem()
		-- local typePrimary = primary:getType()
		-- print(typePrimary)
		-- if typePrimary == "FlareGun" and primary:getCurrentAmmoCount() > 0 then
			-- print("PEW PEW")
			-- local mainOption = context:addOption(getText("Shoot Flare At The Floor"), playerObj, FlareSquare, worldobjects, primary)
		-- end
	-- end

end

FlareSquare = function(playerObj, worldobjects, primary)
	for i,v in ipairs(worldobjects) do
			if v:getSquare() then
				local square = v:getSquare()
				break
			end
	end
	playerObj:faceLocation(square:getX(), square:getY())
	--square:startMuzzleFlash()
	--character:playSound()	
	
	--playerObj:setActionAnim("Bob_AttackHandgun_Small")
	--playerObj:PlayAnimUnlooped("Attack_" .. primary:getSwingAnim())
	
	--playerObj:playSound(primary:getSwingSound());
	--AddWorldSound(playerObj, primary:getSoundRadius(), primary:getSoundVolume());
	--playerObj:startMuzzleFlash()
	ModInfo.GroundShot = true
	ISReloadWeaponAction.attackHook(playerObj, nil, primary)
	ISReloadWeaponAction.onShoot(playerObj, primary)
	
	square:StartFire();
	--ISReloadWeaponAction.attackHook(playerObj, 0, primary)
end

Events.OnPreFillWorldObjectContextMenu.Add(FlareGun_Context	)