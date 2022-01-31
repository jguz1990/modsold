-- function Recipe.GetItemTypes.Footwear(scriptItems)
	-- scriptItems:addAll(getScriptManager():getBodyLocation("Shoes"))
-- end



function Recipe.GetItemTypes.Is_Footwear(scriptItems)
    local allScriptItems = getScriptManager():getAllItems()
    for i=1,allScriptItems:size() do
        local scriptItem = allScriptItems:get(i-1)
		--print(tostring(scriptItem:getName()))
        if (scriptItem:getType() == Type.Clothing) then
			--print("IS CLOTHING")
			if scriptItem:getBodyLocation() == "Shoes" then
				--print("IS SHOES")
				if ClothingRecipesDefinitions[scriptItem:getName()] then
					-- ignore
				else
					--print("IS ADDED " .. tostring(scriptItem:getType()))
					scriptItems:add(scriptItem)
				end
			end
        end
    end	
end


function Repair_Footwear(items, result, player)
	for i=0, items:size()-1 do
		local item = items:get(i)
		if item:getCondition() <  item:getConditionMax() then
			item:setCondition(item:getCondition() + 1)
			--item:getVisual():setDecal("DuctTapeShoes")
		end
	end
end


function Can_Repair_Footwear(sourceItem, result)
    --if sourceItem:getType() == Type.Clothing then
		if sourceItem:isBroken() then
			-- print("IS BROKEN")
			return false
		end
		print("TYPE " .. sourceItem:getType())
       if sourceItem:getBodyLocation() and sourceItem:getBodyLocation() == "Shoes" then		
				-- print("IS CLOTHING - Condition :" ..  tostring(sourceItem:getCondition()) .. " / " .. tostring(sourceItem:getConditionMax()))
			if sourceItem:getCondition() >= sourceItem:getConditionMax() then			
				-- print("IS UNDAMAGED")
			   return false
			end
		end
    --end
	return true
end
