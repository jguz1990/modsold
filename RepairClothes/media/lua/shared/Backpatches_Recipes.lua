function RemoveBackpatch(items, result, player)
	--print("Removing Patch!")
	local garment = nil
	local patch = nil
	local patchName = nil
	for i=0,items:size()-1 do
		local item = items:get(i)
		local data = item:getModData()
		--print("Type :" .. item:getType())
		if item:IsClothing() 
		or item:IsInventoryContainer() then
			--item:getVisual():setDecal("TShirt_RockDECAL") 
			--item:getVisual():setDecal("PatchEagle") 
			print("Garment!")
			garment = item
		end	
		if data.Backpatch then
			--item:getVisual():setDecal("TShirt_RockDECAL") 
			--item:getVisual():setDecal("PatchEagle") 
			patch = data.Backpatch
			--print("Patch: " .. patch)
			local script = item:getScriptItem()
			--patchName = script:getDisplayName()
		end			
	end
	if garment and patch then
		--print("Sewing " .. patch .. " patch to " .. garment:getType())
		garment:getVisual():setDecal(nil)
		local data = garment:getModData()
		data.Backpatch = nil
		local script = garment:getScriptItem()
		local newName = script:getDisplayName()
		garment:setName(newName)
		player:getInventory():AddItem(patch);
	end
end

function Backpatch(items, result, player)
	--print("Sewing Patch!")
	local garment = nil
	local patch = nil
	local patchName = nil
	for i=0,items:size()-1 do
		local item = items:get(i)
		local data = item:getModData()
		--print("Type :" .. item:getType())
		if item:IsClothing()
		or item:IsInventoryContainer() then
			--item:getVisual():setDecal("TShirt_RockDECAL") 
			--item:getVisual():setDecal("PatchEagle") 
			--print("Garment!")
			garment = item
		end	
		if (item:getType():contains("Patch") or  item:getType():contains("patch")) and data.Backpatch then
			--item:getVisual():setDecal("TShirt_RockDECAL") 
			--item:getVisual():setDecal("PatchEagle") 
			patch = data.Backpatch
			--print("Patch: " .. patch)
			local script = item:getScriptItem()
			patchName = script:getDisplayName()
		end			
	end
	if garment and patch then
		--print("Sewing " .. patch .. " patch to " .. garment:getType())
		garment:getVisual():setDecal(patch)
		local data = garment:getModData()
		data.Backpatch = patch
		local script = garment:getScriptItem()
		local newName = script:getDisplayName()
		garment:setName(newName .. " with " .. patchName)
	end
end

function CanBackpatchGarment(item, result)
	if item:IsClothing() 
	or item:IsInventoryContainer() then
		
		--print("Worn!")
		if item:isEquipped() then
			return false
		end
		local data = item:getModData()
		if data.Backpatch then
			return false
		end
		if item:getVisual() then
			local clothingItem = item:getVisual():getClothingItem()
			if item:getVisual():getDecal(clothingItem) then
				return false
			end
		end
	end		
	return true
end

function HasBackpatch(item, result)
	if item:IsClothing() 
	or item:IsInventoryContainer() then
		--print("Worn!")
		if item:isEquipped() then
			return false
		end
		local data = item:getModData()
		if data.Backpatch then
			return true
		end
		return false
	end		
	return true
end

function IsBackpatch(scriptItems)
	scriptItems:addAll(getScriptManager():getItemsTag("Backpatch"))
end

local CanBackpatchList = {
	"Jacket",
	"TorsoExtra",
}


function CanBackpatch(scriptItems)
	--print("Can Backpatch List")
    local allScriptItems = getScriptManager():getAllItems()
    for i=1,allScriptItems:size() do
        local scriptItem = allScriptItems:get(i-1)
        if (scriptItem:getType() == Type.Clothing)  or scriptItem:getType() == Type.Container then
        --if (scriptItem:getType() == Type.Clothing)  or scriptItem:getType() == Type.Container then
			--if (scriptItem:getFabricType() == "Cotton" or scriptItem:getFabricType() == "Denim") then
			local location = scriptItem:getBodyLocation() or scriptItem.canBeEquipped()
			--print("Display Name: " .. tostring(scriptItem:getDisplayName()))
			--print("Location: " .. tostring(location))
			--if CanBackpatchList:contains(location) then
			if ((location == "Jacket" or location == "TorsoExtra" ) and (not scriptItem:getDisplayName():contains("Apron")))
			or (scriptItem:getType() == Type.Container and scriptItem:getDisplayName():contains("Vest")) then
			
			--if ((location == "Jacket" or location == "TorsoExtra" ) and (not scriptItem:getDisplayName():contains("Apron"))) then
				if ClothingRecipesDefinitions[scriptItem:getName()] then
					-- ignore
				else
					scriptItems:add(scriptItem)
				end
			-- elseif scriptItem:getDisplayName():contains("Hoodie") then
				-- --if ClothingRecipesDefinitions[scriptItem:getName()] then
					-- -- ignore
				-- --else
					-- scriptItems:add(scriptItem)
				-- --end
			end
        end
    end
end