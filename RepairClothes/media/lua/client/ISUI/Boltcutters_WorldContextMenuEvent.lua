local function Cut_Lock_Boltcutters (player, context, worldobjects, test)
	
    -- if digitalPadlockedThump then
		-- print("DIGITAL")
	-- else
		-- print("NOT DIGITAL")
	-- end
	
	
	--if (not padlockedThump) and (not digitalPadlockedThump) then return end
	local playerObj = getSpecificPlayer(player) 
	local playerInv = playerObj:getInventory()
	if playerObj:getPerkLevel(Perks.Strength) < 5 then return end
	if not playerInv:getFirstEvalRecurse(predicateBoltcutters) then return end
	local thump = nil
	if padlockedThump then thump = padlockedThump 
	elseif digitalPadlockedThump then thump = digitalPadlockedThump end
	local cutters = playerInv:getFirstEvalRecurse(predicateBoltcutters)
	
	if not thump then
	
		local lockedContainer = nil
		for x in pairs(worldobjects) do
			local object = worldobjects[x]
			local mData = object:getModData()
			if object and mData and mData.locked and mData.locked > 0 and mData.padlocked then 
				thump = worldobjects[x]
			end	
			if object and mData and mData.combinationLocked and mData.combinationLocked > 0 then 
				thump = worldobjects[x]
			end	
		end	
	
	
	end
	
	
	if thump and cutters then
        if test == true then return true; end
        context:addOption(getText("ContextMenu_Cut_Padlock"), worldobjects, cutPadlock, player, thump, cutters);
    end
	
end


function predicateBoltcutters(item)
	return not item:isBroken() and item:hasTag("Boltcutters")
end


Events.OnPreFillWorldObjectContextMenu.Add(Cut_Lock_Boltcutters)	

-- function cutPadlock(worldobjects, player, thump)
    -- local playerObj = getSpecificPlayer(player)

    -- if luautils.walkAdj(playerObj, thump:getSquare()) then
		
		-- if ISWorldObjectContextMenu.equip(playerObj, playerObj:getPrimaryHandItem(), predicateBoltcutters, true) then
			-- ISTimedActionQueue.add(ISCutPadlockAction:new(playerObj, thump, nil, getPlayerData(player)));
		-- end
    -- end
-- end