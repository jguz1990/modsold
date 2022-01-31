
function Recycle_getMetal(scriptItems)
	print("METAL RECYCLE!")
    local allScriptItems = getScriptManager():getAllItems()
    for i=1,allScriptItems:size() do
        local scriptItem = allScriptItems:get(i-1)
		--print(tostring(scriptItem))
		if scriptItem:getName() ~= "ScrapMetal"
		and not scriptItem:getName():contains("MRE")
		then
			local thing = InventoryItemFactory.CreateItem(scriptItem:getFullName())
			if thing:getMetalValue() >= 30 then
					--print(tostring(thing))
					scriptItems:add(scriptItem)
			end
		end
		thing = nil
    end
end

function Recycle_getGlass(scriptItems)
	print("METAL RECYCLE!")
    local allScriptItems = getScriptManager():getAllItems()
    for i=1,allScriptItems:size() do
        local scriptItem = allScriptItems:get(i-1)
		--print(tostring(scriptItem))
		--if scriptItem:getName() ~= "ScrapMetal" then
			local thing = InventoryItemFactory.CreateItem(scriptItem:getName())
			--print("Thing 1 - " .. tostring(thing))
			--print("Thing 2 - " .. tostring(thing:getType()))
			if thing and thing:getType() 
			and not thing:getType():contains("MRE")
			then
				if thing:getType():contains("Glasses") and
				( not thing:getType():contains("Safety")
				and not thing:getType():contains("Shoot") 
				and not thing:getType():contains("Ski") )
				then
						--print(tostring(thing))
						scriptItems:add(scriptItem)
				end
				if thing:getType():contains("Empty") and (thing:getType():contains("Beer") or thing:getType():contains("Wine") or thing:getType():contains("Whiskey")) then
						--print(tostring(thing))
						scriptItems:add(scriptItem)
				end
				if thing:getType():contains("LightBulb") then
						--print(tostring(thing))
						scriptItems:add(scriptItem)
				end
			end
		thing = nil
    end
end


function CanRecycler(item, result)
	--print("can sew?")
	if not item then return false end
	local power = nil
	local recycler = nil
	local player = getSpecificPlayer(0)
	local square = nil
	--recycler = FindAppliance_Container(player, "Recycler")
	--if not recycler then recycler = FindAppliance(player, "Recycler") end
	recycler = FindAppliance_Container(player, "Recycler")
	if recycler then square = recycler:getSquare() end
	if square and (getGameTime():getNightsSurvived() < getSandboxOptions():getElecShutModifier())
	and not square:isOutside() then
		power = true
	end	
	if square and square:haveElectricity() then			
		power = true
	end
	if (not recycler)
	--or (not AdjacentFreeTileFinder.isTileOrAdjacent(getSpecificPlayer(0):getCurrentSquare(), sewingMachine:getSquare()))
	--or sewingMachine and not (player:CanSee(sewingMachine))
	then
		power = false
	end
	--print("Container Weight: " .. tostring(recycler:getContainer():getCapacityWeight()))
	--print("Container MaxWeight: " .. tostring(recycler:getContainer():getMaxWeight()))
	-- if recycler
	-- and recycler:getContainer():getCapacityWeight()
	-- >= recycler:getContainer():getMaxWeight()
	-- then
		-- power = false
	-- end
	if power then return true end
	
	return false
end
