require "recipecode"


function CanPhotocopyPage(item, result)
	local itemType = item:getType()
	if itemType == "SheetPaper2" then
		local page = item:seePage(1)
		local length = string.len(page)
		if length < 1 then return false end	
	end
	return true
end


function CanPhotocopyBook(item, result)
	local canCopy = true
	local itemType = item:getType()
	if itemType == "Journal" or itemType == "Notebook" then
		canCopy = false
		local pageCount = item:getPageToWrite()
		for i=1,pageCount do
			local page = item:seePage(i)
			if page and string.len(page) > 0 then
				return true
			end		
		end
	end
	return canCopy
end


function CanPhotocopyPhotocopier(recipe, playerObj)
	local photocopier = nil
	photocopier = FindAppliance(playerObj, "Photocopier")
	if photocopier then square = photocopier:getSquare() end
	if square and (getGameTime():getNightsSurvived() < getSandboxOptions():getElecShutModifier())
	and not square:isOutside() then
		power = true
	end	
	if square and square:haveElectricity() then			
		power = true
	end
	if (not photocopier)
	--or (not AdjacentFreeTileFinder.isTileOrAdjacent(getSpecificPlayer(0):getCurrentSquare(), photocopier:getSquare()))
	--or photocopier and not (player:CanSee(photocopier))
	then
		power = false
	end
	if power then return true end	
	return false	
end

function PhotocopySheet(items, result, player)
	local copySource = nil
	for i=1,items:size() do
		local item = items:get(i-1)
		if item:getType() == "SheetPaper2" then 
			local page = item:seePage(1)
			--print("Page " .. tostring(i) .. " - " .. string.len(page) .. " - " .. tostring(page))
			if page then 				
				copySource = item
			end
		end
	end
	if copySource then
		result:addPage(1, copySource:seePage(1))
		result:setLockedBy("admin");
		if copySource:getName():contains("(photocopied)") then
			result:setName(copySource:getName())
		else
			result:setName(copySource:getName() .. " (photocopied)")
		end
	end
	player:startMuzzleFlash()
end




function PhotocopyMap(items, result, player)
	local copySource = nil
	for i=1,items:size() do
		local item = items:get(i-1)
		if item:getMap() then 
			copySource = item
		end
	end
	if copySource then
		result:setMap(copySource:getMap())
		local mData = result:getModData()
		mData.copiedMap = copySource:getMap()
		if copySource:getName():contains("(photocopied)") then
			result:setName(copySource:getName())
		else
			result:setName(copySource:getName() .. " (photocopied)")
		end
	end
	player:startMuzzleFlash()
end



function PhotocopyRecipes(items, result, player)
	local copySource = nil
	for i=1,items:size() do
		local item = items:get(i-1)
		if item:getStringItemType()=="Literature" and item:getTeachedRecipes() and not item:getTeachedRecipes():isEmpty() then
			copySource = item
		end
	end
	if copySource then
		--print("Player = " .. tostring(player) .. " - " .. tostring(copySource:getFullType()))
		result2 = player:getInventory():AddItem(copySource:getFullType())
		if copySource:getName():contains("(photocopied)") then
			result2:setName(copySource:getName())
		else
			result2:setName(copySource:getName() .. " (photocopied)")
		end
	end
	player:startMuzzleFlash()
end


function PhotocopyBook(items, result, player)
	local copySource = nil
	for i=1,items:size() do
		local item = items:get(i-1)
		if item:getType() == "Notebook" or item:getType() == "Journal" then 
			copySource = item
		end
	end
	if copySource then
		local pageCount = copySource:getPageToWrite()		
		-- local pageCount2 = 0
		-- for i=1,pageCount do
			-- print("PAGE " .. tostring(i))
			-- local page = copySource:seePage(i)
			-- if page and string.len(page) > 0 then
				-- pageCount2 = pageCount2+1
			-- end		
		-- end
		result:setPageToWrite(pageCount)		
		--local pageCount2 = 0
		for i=1,pageCount do
			local page = copySource:seePage(i)
			--if page and string.len(page) > 0 then
				--pageCount2 = pageCount2+1
				--result:addPage(pageCount2, page)
				result:addPage(i, page)
			--end		
		end		
		result:setLockedBy("admin");
		if copySource:getName():contains("(photocopied)") then
			result:setName(copySource:getName())
		else
			result:setName(copySource:getName() .. " (photocopied)")
		end
	end
	player:startMuzzleFlash()
end