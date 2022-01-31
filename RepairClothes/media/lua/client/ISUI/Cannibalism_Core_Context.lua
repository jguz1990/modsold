function cannibalism_Context (player, context, worldobjects, test)
	local playerObj = getSpecificPlayer(player)
	local playerInv = playerObj:getInventory()
	
	if playerInv:containsType("HuntingKnife") or playerInv:containsType("KitchenKnife")
	or playerInv:containsType("MeatCleaver") or playerInv:containsType("FlintKnife") then

		if  playerObj:getPerkLevel(Perks.Cooking) >= 1 and playerObj:getPerkLevel(Perks.SmallBlade) >= 1 and
		( playerObj:HasTrait("Hemophobic") == false and playerObj:HasTrait("Cowardly") == false and playerObj:HasTrait("WeakStomach") == false ) then
			local corpse = IsoObjectPicker.Instance:PickCorpse(context.x, context.y)
			if corpse then
				if corpse:isSkeleton() == false then 
					if corpse:isZombie() == false then
						context:addOption(getText("Butcher Corpse"), worldobjects, ISWorldObjectContextMenu.onButcherCorpseItem, corpse, player);
					else
						context:addOption(getText("Butcher Rotting Corpse"), worldobjects, ISWorldObjectContextMenu.onButcherRottenCorpseItem, corpse, player);
					end						
				end	
			end		
		end
	end	
end

ISWorldObjectContextMenu.onButcherCorpseItem = function(worldobjects, WItem, player)
	local playerObj = getSpecificPlayer(player) 
	local playerInv = playerObj:getInventory()
	
	local hammer = playerInv:getFirstType("MeatCleaver") or playerInv:getFirstType("KitchenKnife")
	or playerInv:getFirstType("HuntingKnife") or playerInv:getFirstType("FlintKnife")	
    
	if WItem:getSquare() and luautils.walkAdj(playerObj, WItem:getSquare()) then
		ISWorldObjectContextMenu.equip(playerObj, playerObj:getPrimaryHandItem(), hammer, true);
        ISTimedActionQueue.add(ISButcherCorpseAction:new(playerObj, WItem, 250, false, false, false, false));
    end
end

ISWorldObjectContextMenu.onButcherRottenCorpseItem = function(worldobjects, WItem, player)
	local playerObj = getSpecificPlayer(player) 
	local playerInv = playerObj:getInventory()  
	
	local hammer = playerInv:getFirstType("MeatCleaver") or playerInv:getFirstType("KitchenKnife")
	or playerInv:getFirstType("HuntingKnife") or playerInv:getFirstType("FlintKnife")	
    
	if WItem:getSquare() and luautils.walkAdj(playerObj, WItem:getSquare()) then
		ISWorldObjectContextMenu.equip(playerObj, playerObj:getPrimaryHandItem(), hammer, true);
        ISTimedActionQueue.add(ISButcherCorpseAction:new(playerObj, WItem, 250, true, false, false, false));
    end
end

Events.OnPreFillWorldObjectContextMenu.Add(cannibalism_Context)	