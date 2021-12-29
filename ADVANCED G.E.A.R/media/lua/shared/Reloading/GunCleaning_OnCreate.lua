require "Reloading/ISReloadableWeapon"


function GunCleaning_OnCreate(items, result, player)	
	player:getInventory():AddItem("Base.RippedSheetsDirty");
	for i=0,items:size()-1 do
		local item = items:get(i)
		if item:getSubCategory() == "Firearm" then
		--if item:getType() == "Shotgun" or item:getType() == "DoubleBarrelShotgun" or item:getType() == "VarmintRifle" or  item:getType() == "HuntingRifle" then
			condition = item:getCondition()
			conditionMax = item:getConditionMax()
			if condition < conditionMax then
				item:setCondition( condition + 1 )
				--item:setCondition( conditionMax )
				--print("CLEANING")
			end
			if condition < conditionMax then
				result:setCondition( condition + 1 )
			end
			result:setCurrentAmmoCount(item:getCurrentAmmoCount())
			if result:haveChamber() and item:haveChamber() and item:isRoundChambered() then
				result:setRoundChambered(true)
			end
			if item:isContainsClip() then
				result:setContainsClip(true)
			end
			local modData = result:getModData()
			for k,v in pairs(item:getModData()) do
				modData[k] = v
			end
			result:attachWeaponPart(item:getScope())
			result:attachWeaponPart(item:getClip())
			result:attachWeaponPart(item:getSling())
			result:attachWeaponPart(item:getCanon())
			result:attachWeaponPart(item:getStock())
			result:attachWeaponPart(item:getRecoilpad())
			return
		end
    end
end
