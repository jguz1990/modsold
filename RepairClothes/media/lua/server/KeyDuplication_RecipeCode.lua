
function CanFindKeyCuttingMachine(recipe, playerObj)
	local KeyCuttingMachine = nil
	--KeyCuttingMachine = FindAppliance(playerObj, "Key Duplication Machine")
	KeyCuttingMachine = FindAppliance(playerObj, "Duplication Machine")
	if KeyCuttingMachine then square = KeyCuttingMachine:getSquare() end
	if square and (getGameTime():getNightsSurvived() < getSandboxOptions():getElecShutModifier())
	and not square:isOutside() then
		power = true
	end	
	if square and square:haveElectricity() then			
		power = true
	end
	if (not KeyCuttingMachine)
	--or (not AdjacentFreeTileFinder.isTileOrAdjacent(getSpecificPlayer(0):getCurrentSquare(), KeyCuttingMachine:getSquare()))
	--or KeyCuttingMachine and not (player:CanSee(KeyCuttingMachine))
	then
		power = false
	end
	if power then return true end	
	return false	
end

function Duplicate_Key(items, result, player)
	local copySource = nil
	for i=1,items:size() do
		local item = items:get(i-1)
		--if item:getScriptItem():getType()=="Key" then 
		if item:getCategory()=="Key" then 
			copySource = item
		end
	end
	if copySource then
		result:setKeyId(copySource:getKeyId())
	end
end