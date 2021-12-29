function Leatherdad_Folding(items, result, player)
	for i=0,items:size()-1 do
		local item = items:get(i)
		local modData = result:getModData()
		for k,v in pairs(item:getModData()) do
			modData[k] = v
		end
		result:setCondition(item:getCondition())
		result:setBroken(item:isBroken())	
		if item:getType()=="Leatherdad" then 
			if player:getPrimaryHandItem() == player:getSecondaryHandItem() then player:setSecondaryHandItem(nil) end
			player:setPrimaryHandItem(result)			
		end
		return
    end
end

function Detach_P38(items, result, player)
	player:getInventory():AddItem("Base.Necklace_DogTag")
end