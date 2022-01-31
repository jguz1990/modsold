function slurpBurp2 (player, context, worldobjects, test)
	local CustomName = nil
	local GroupName = nil
	local slurpburp = nil
	local power = nil
	local water = nil
	local devicePower = nil
	if (getGameTime():getNightsSurvived() < getSandboxOptions():getElecShutModifier()) then
		power = true
	end	
	for x in pairs(worldobjects) do
		if worldobjects[x]:getProperties() then
			if worldobjects[x]:getProperties():Val("CustomName") then
				print(worldobjects[x]:getProperties():Val("CustomName"))
				CustomName = worldobjects[x]:getProperties():Val("CustomName")
			end
			if worldobjects[x]:getProperties():Val("GroupName") then
				print(worldobjects[x]:getProperties():Val("GroupName"))
				GroupName = worldobjects[x]:getProperties():Val("GroupName")
			end
		end
		if GroupName == "SlurpBurp" then
			slurpburp = worldobjects[x]
			local x = slurpburp:getX()
			local y = slurpburp:getY()
			local z = slurpburp:getZ()
			local square = getCell():getGridSquare( x, y, z)
			if (getGameTime():getNightsSurvived() < getSandboxOptions():getElecShutModifier())
			and not square:isOutside() then
				power = true
			end	
			if square:haveElectricity() then			
				devicePower = true
			end
		end
	end	
	if slurpburp and (power or devicePower) then
		local modData = slurpburp:getModData()
		if not modData.lemonlimeAmount then modData.lemonlimeAmount = lowerOf(0, 60) end
		if not modData.cherryAmount then modData.cherryAmount = lowerOf(0, 60) end
		if not modData.colaAmount then modData.colaAmount = lowerOf(0, 60) end
		if not modData.dietorangeAmount then modData.dietorangeAmount = lowerOf(0, 60) end
		
		if modData.lemonlimeAmount > 0 then
			--local contextString = ("Get Lemon-Lime Slurp Burp (" .. tostring(modData.lemonlimeAmount) .. " servings left)")
			context:addOption(getText("Get Lemon-Lime Slurp Burp"), worldobjects, getSlurpBurp, slurpburp, player, "lemonlimeSlurpBurp");
		end
		
		if modData.cherryAmount > 0 then		
			--local contextString = ("Get Cherry Slurp Burp (" .. tostring(modData.cherryAmount) .. " servings left)")
			context:addOption(getText("Get Cherry Slurp Burp"), worldobjects, getSlurpBurp, slurpburp, player, "cherrySlurpBurp");
		end
		
		if modData.colaAmount > 0 then		
			--local contextString = ("Get Cola Slurp Burp (" .. tostring(modData.colaAmount) .. " servings left)")
			context:addOption(getText("Get Cola Slurp Burp"), worldobjects, getSlurpBurp, slurpburp, player, "colaSlurpBurp");
		end
		
		if modData.dietorangeAmount > 0 then		
			--local contextString = ("Get Diet Orange Slurp Burp (" .. tostring(modData.dietorangeAmount) .. " servings left)")
			context:addOption(getText("Get Diet Orange Slurp Burp"), worldobjects, getSlurpBurp, slurpburp, player, "dietorangeSlurpBurp");
		end
	end
end

getSlurpBurp = function(worldobjects, slurpBurp, player, flavour)
    local playerObj = getSpecificPlayer(player)
	if not slurpBurp:getSquare() or not luautils.walkAdj(playerObj, slurpBurp:getSquare(), true) then
		return
	end
	ISTimedActionQueue.add(GetSlurpBurpAction:new(playerObj, nil, nil, slurpBurp, 100, nil, flavour));
end

function lowerOf(number1, number2)	
	local roll = ZombRand(number1, number2)
	local roll2 = ZombRand(number1, number2)
	if roll2 < roll then roll = roll2 end
	return roll
end