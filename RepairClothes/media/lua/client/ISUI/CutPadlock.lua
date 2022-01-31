require "ISUI/ISInventoryPaneContextMenu"

function cutPadlock(worldobjects, player, thump, cutters)
	print("Cut Padlock")
    local playerObj = getSpecificPlayer(player)

    if luautils.walkAdj(playerObj, thump:getSquare()) then
		
		-- if ISWorldObjectContextMenu.equip(playerObj, playerObj:getPrimaryHandItem(), predicateBoltcutters, true) then
			-- playerObj:setSecondaryHandItem(playerObj:getPrimaryHandItem())
			
			ISInventoryPaneContextMenu.equipWeapon(cutters, true, true, playerObj:getPlayerNum())
			--ISTimedActionQueue.add(ISEquipWeaponAction:new(playerObj, cutters, 50, true, true))
			print("Cut Padlock 2")
			ISTimedActionQueue.add(ISCutPadlockAction:new(playerObj, thump, nil, getPlayerData(player)));
		-- end
    end
end