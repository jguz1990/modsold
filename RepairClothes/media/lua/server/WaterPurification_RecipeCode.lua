
function Recipe.GetItemTypes.Is_Water_Container(scriptItems)	
	--scriptItems:addAll(getScriptManager():getAllItems():getCanStoreWater() )
    local allScriptItems = getScriptManager():getAllItems()
    for i=1,allScriptItems:size() do
        local scriptItem = allScriptItems:get(i-1)
        if (scriptItem:getType() == Type.Drainable and scriptItem:getCanStoreWater()) then
			-- if scriptItem:isWaterSource() then		
			scriptItems:add(scriptItem)
			-- end
        end
    end	
end

function Purify_Water_Container(items, result, player)
	for i=0, items:size()-1 do
		local item = items:get(i)
		--print(tostring(item:getType()))
		if item:isWaterSource() then
			--print("WATER " .. tostring(item:getType()))	
			item:setTaintedWater(false)
		end
	end
end