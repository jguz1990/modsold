require "recipecode"

function Recipe.GetItemTypes.HasMap(scriptItems)
	--print("Has Map?")
	local allScriptItems = getScriptManager():getAllItems()
    for i=1,allScriptItems:size() do
        local scriptItem = allScriptItems:get(i-1)
		--print(tostring(scriptItem))
		--if scriptItem:getName() ~= "ScrapMetal" then
		if not scriptItem:getFullName():contains("MRE") then
			local thing = InventoryItemFactory.CreateItem(scriptItem:getFullName())
			if thing
			--and thing:getMap() then
			and not thing:getType():contains("MRE")
			and ( thing:getType():contains("Map") or thing:getType():contains("map") )then
					--print(tostring(thing:getType()))
					scriptItems:add(scriptItem)
			end
		end
		thing = nil
    end
end

function Recipe.GetItemTypes.HasRecipeMag(scriptItems)
	print("Has Recipes?")
	local allScriptItems = getScriptManager():getAllItems()
    for i=1,allScriptItems:size() do
        local scriptItem = allScriptItems:get(i-1)
		--print(tostring(scriptItem))
		--if scriptItem:getStringItemType() ~= "IntelFolder" then
		if not scriptItem:getFullName():contains("MRE") then
			local thing = InventoryItemFactory.CreateItem(scriptItem:getFullName())
			--print(tostring(thing))
			if thing:getStringItemType()=="Literature" 
			and not thing:getType():contains("MRE")
			and thing:getType() ~= "IntelFolder" then
				if thing:getTeachedRecipes() and not thing:getTeachedRecipes():isEmpty() then
						--print("YES!")
						--print(tostring(thing:getType()))
						scriptItems:add(scriptItem)
				end
			end
		end
		thing = nil
    end
end
