function Recipe.GetItemTypes.Is_BulletproofVest(scriptItems)
    local allScriptItems = getScriptManager():getAllItems()
    for i=1,allScriptItems:size() do
        local scriptItem = allScriptItems:get(i-1)
		--print
		--print("TORSO EXTRA? " .. tostring(scriptItem:getName()))
        if (scriptItem:getType() == Type.Clothing) then
			--print("IS CLOTHING")
			if scriptItem:getBodyLocation() == "TorsoExtra" then
				
				if scriptItem:getName():contains("ullet") 
				or  scriptItem:getName():contains("Armor_Defender")  or  scriptItem:getName():contains("Bag_Plate_Carrier")
				or  scriptItem:getName():contains("RogueVest")  or  scriptItem:getName():contains("WitchyCarrier")
				then
				--print("TORSO EXTRA! " .. tostring(scriptItem:getName()))
				--print("IS SHOES")
					if ClothingRecipesDefinitions[scriptItem:getName()] then
						-- ignore
					else
						--print("IS ADDED " .. tostring(scriptItem:getType()))
						scriptItems:add(scriptItem)
					--print("ADDED " .. tostring(scriptItem:getName()))
					end
				end
			end
        end
    end	
end


function Repair_BulletproofVest(items, result, player)
	for i=0, items:size()-1 do
		local item = items:get(i)
		--if item:getCondition() <  item:getConditionMax() then
		if item:getBodyLocation() and item:getBodyLocation() == "TorsoExtra" then	
			
			--player:getInventory():AddItem(item:getType());
		
			--item:addPatch(player, "Torso_Upper", nil)
			--item:addPatch(player, "Torso_Lower", nil)
			-- item:getVisual():removeHole(0)
			-- item:getVisual():removeHole(1)
			-- item:getVisual():removeHole(2)
			-- item:getVisual():removeHole(3)
			-- item:getVisual():removeHole(4)
			-- item:getVisual():removeHole(5)
			item:getVisual():removeHole(6)
			item:getVisual():removeHole(7)
			-- item:getVisual():removeHole(8)
			-- item:getVisual():removeHole(9)
			-- item:getVisual():removeHole(10)
			-- item:getVisual():removeHole(11)
			-- item:getVisual():removeHole(12)
			-- item:getVisual():removeHole(13)
			--item:setCondition(item:getConditionMax())
			local repairLevel = item:getCondition() + player:getPerkLevel(Perks.Tailoring)
			local maxRepair = item:getConditionMax() - 1
			if repairLevel >  maxRepair then
				repairLevel = maxRepair
			end
			item:setCondition(repairLevel)
			player:resetModel();
			-- if  GlobalArmor and GlobalArmor[item:getType()] then
				-- item:getModData().Durability = item:getModData().Durability + (player:getPerkLevel(Perks.Tailoring) * 10)
				-- if item:getModData().Durability >   ( GlobalArmor[item:getType()]["Durability"] - 10 ) then
					-- item:getModData().Durability = ( GlobalArmor[item:getType()]["Durability"] - 10 )
				-- end
			-- end
			
			
			--item:setCondition(item:getCondition() + 1)
			--item:getVisual():setDecal("DuctTapeShoes")
		end
	end
end


function Can_Repair_BulletproofVest(sourceItem, result)
	if sourceItem:isBroken() then
		--print("IS BROKEN")
		return false
	end
	-- if  GlobalArmor and GlobalArmor[sourceItem:getType()] then
		-- if sourceItem:getModData().Durability <  GlobalArmor[sourceItem:getType()]["Durability"] then return true end
	-- end
	--print("TYPE " .. sourceItem:getType())
   if sourceItem:getBodyLocation() and sourceItem:getBodyLocation() == "TorsoExtra" then		
			--print("IS CLOTHING - Condition :" ..  tostring(sourceItem:getCondition()) .. " / " .. tostring(sourceItem:getConditionMax()))
		if sourceItem:getCondition() >= sourceItem:getConditionMax() then			
			--print("IS UNDAMAGED")
		   return false
		end
		local hole = sourceItem:getHolesNumber()
		if hole < 1 then return false end			
	end
	return true
end
