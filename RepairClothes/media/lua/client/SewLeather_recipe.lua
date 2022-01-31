function SewLeather(items, result, player)
	local roll = ZombRand(0,10)
	local skill = player:getPerkLevel(Perks.Tailoring)
	local inventory = player:getInventory()
	local awl = inventory:contains("LeatherworkingAwl") or inventory:contains("Multitool") or inventory:contains("SAK")
	print("Awl?" .. tostring(awl))
	if (roll >= skill) and (not awl) then
		for i=0,items:size()-1 do
			local item = items:get(i)
			if item:getType()=="Needle" then
				player:getInventory():Remove(item)
				player:getInventory():AddItem("Base.BrokenNeedle")
				player:playSound("PZ_MetalSnap")
				break
			end		
		end
	end
end


