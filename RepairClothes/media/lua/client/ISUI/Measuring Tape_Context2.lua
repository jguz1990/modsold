function Measuring_Tape_Context2(player, context, worldobjects, test)
	local playerObj = getSpecificPlayer(player)
	--local playerInv = playerObj:getInventory()
	--print("measuring tape?")
	
		local primary = playerObj:getPrimaryHandItem()
		local secondary = playerObj:getSecondaryHandItem()
		
	if not primary and not secondary then return false end	
	local tape = nil
	--if not (primary:getType() == "Measuring_Tape") and not (secondary:getType() == "Measuring_Tape")  then return false end
	if primary and (primary:getType() == "Measuring_Tape") then tape = true end
	if secondary and (secondary:getType() == "Measuring_Tape")  then tape = true end
	if not tape then return false end
	
	local square = nil	
		
	for i,v in ipairs(worldobjects) do
			if v:getSquare() then
				square = v:getSquare()
				break
			end
	end

	if square and  square:isCanSee(player) then --and  (playerObj:DistoTo(square) < 20) then 
	
		
		local primary = playerObj:getPrimaryHandItem()
		local secondary = playerObj:getSecondaryHandItem()
		if primary or secondary then

			if (primary and primary:getType() == "Measuring_Tape") or (secondary and secondary:getType() == "Measuring_Tape")  then
				--print("Measure Tape")
				local x = math.abs(square:getX() - playerObj:getSquare():getX())
				local y = math.abs(square:getY() - playerObj:getSquare():getY())
				
				local distance = math.floor(math.sqrt((x*x)+(y*y)))
				if distance > 10 then return false end
				
				if (x > 0) or (y > 0) then
					--print("SOUND")
					--playerObj:playSound("Sawing")
					
					playerObj:playSound("Measuring_Tape")
					local text = ("Measuring Tape: ")
					if x then
						text = (text .. "X-offset " .. tostring(x) .. " squares")
						if y then text = (text .. ", ") end
					end
					if y then
						text = (text .. "Y-offset " .. tostring(y) .. " squares")
					end
					local mainOption = context:addOption(getText(text))--, playerObj, FlareSquare, worldobjects, primary)
					text = nil
				end
			end
		end
	end

end

