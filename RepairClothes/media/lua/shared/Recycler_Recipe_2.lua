
function UseRecycler(items, result, player)
	local recycler = FindAppliance_Container(player, "Recycler")
	local container = recycler:getContainer()
	--print(tostring(recycler))
	--print(tostring(container))
	multiple = nil
	--if result:size() then multiple = result:size() end
	container:AddItem(result:getFullType())
	
	--container:AddItem("Spoon")
end
function UseRecycler_Metal(items, result, player)
	local recycler = FindAppliance_Container(player, "Recycler")
	local container = recycler:getContainer()
	local metal = items:get(0):getMetalValue()
	local weight = items:get(0):getWeight()
	local item = items:get(0)
	if items:get(0):getDisplayCategory() == "Ammo" then
		recycler:getSquare():explode()
		player:getEmitter():playSound("BigExplosion")
		return false
	end
	--print(items:get(0):getType())
	--print("METAL 1 - " .. tostring(metal))
	metal = math.floor(metal/30)
	--print(tostring(recycler))
	--print(tostring(container))
	--print("METAL 2 - " .. tostring(metal))
	multiple = nil
	--if result:size() then multiple = result:size() end
	for i=1,metal do
		container:AddItem("Base.ScrapMetal")
	end
	weight = weight - (metal * 0.1)
	weight = math.floor(weight)
	--print("WEIGHT - " .. tostring(weight))
	if weight > 0 then
		for i=1,weight do
			if item:getType():contains("xe") or item:getType():contains("Shovel") or  item:getType():contains("Hoe")
			or item:getType():contains("Shotgun") or item:getType():contains("Rifle") then
				container:AddItem("Base.UnusableWood")			
			else
				--print("Unusable Metal! - " .. i)
				container:AddItem("Base.UnusableMetal")
			end
		end	
	end	
	--container:AddItem("Spoon")
end
function UseRecycler_Rope(items, result, player)
	local recycler = FindAppliance_Container(player, "Recycler")
	local container = recycler:getContainer()
	for i=1,3 do
		container:AddItem("Base.Twine")
	end
end
function UseRecycler_Lead(items, result, player)
	local recycler = FindAppliance_Container(player, "Recycler")
	local container = recycler:getContainer()
	for i=1,3 do
		container:AddItem("Base.fr_LeadChunk")
	end
end
function UseRecycler_Cloth(items, result, player, selectedItem)
	local recycler = FindAppliance_Container(player, "Recycler")
	local container = recycler:getContainer()
    local item = items:get(0) -- assumes any tool comes after this in recipes.txt

    -- either we come from clothingrecipesdefinitions or we simply check number of covered parts by the clothing and add
    local materials = nil
    local nbrOfCoveredParts = nil
    local maxTime = 0 -- TODO: possibly allow recipe to call Lua function to get maxTime for actions
    if ClothingRecipesDefinitions[item:getType()] then
        local recipe = ClothingRecipesDefinitions[item:getType()]
        materials = luautils.split(recipe.materials, ":");
        maxTime = tonumber(materials[2]) * 20;
    elseif ClothingRecipesDefinitions["FabricType"][item:getFabricType()] then
        materials = {};
        materials[1] = ClothingRecipesDefinitions["FabricType"][item:getFabricType()].material;
        nbrOfCoveredParts = item:getNbrOfCoveredParts();
        local minMaterial = 2;
        local maxMaterial = nbrOfCoveredParts;
        if nbrOfCoveredParts == 1 then
            minMaterial = 1;
        end
    
        local nbr = ZombRand(minMaterial, maxMaterial + 1);
        if nbr > nbrOfCoveredParts then
            nbr = nbrOfCoveredParts;
        end
        materials[2] = nbr;
    
        maxTime = nbrOfCoveredParts * 20;
    else
        error "Recipe.OnCreate.RipClothing"
    end

    for i=1,tonumber(materials[2]) do
        local item2;
        local dirty = true;
        if instanceof(item, "Clothing") then
            dirty = (ZombRand(100) <= item:getDirtyness()) or (ZombRand(100) <= item:getBloodlevel());
        end
        if not dirty then
            item2 = InventoryItemFactory.CreateItem(materials[1]);
        elseif getScriptManager():FindItem(materials[1] .. "Dirty") then
            item2 = InventoryItemFactory.CreateItem(materials[1] .. "Dirty");
        else
            item2 = InventoryItemFactory.CreateItem(materials[1])
        end
        container:AddItem(item2);
    end

    -- add thread sometimes, depending on tailoring level
    if ZombRand(7) <  1 then
        local max = 2;
        if nbrOfCoveredParts then
            max = nbrOfCoveredParts;
            if max > 6 then
                max = 6;
            end
        end
        max = ZombRand(2, max);
        local thread = InventoryItemFactory.CreateItem("Base.Thread");
        for i=1,10-max do
            thread:Use();
        end
        container:AddItem(thread);
    end
end
function UseRecycler_Wood1(items, result, player)
	local item = items:get(0)
	local recycler = FindAppliance_Container(player, "Recycler")
	local container = recycler:getContainer()
	local weight = (item:getWeight())
	local weight2 = math.floor(weight)
	local weight3 = ((weight2-weight)*10)
	for i=1,weight2 do
		container:AddItem("Base.UnusableWood")
	end
	for i=1,weight3 do
		container:AddItem("Base.Twigs")
	end
end
function UseRecycler_Wood2(items, result, player)
	local item = items:get(0)
	local recycler = FindAppliance_Container(player, "Recycler")
	local container = recycler:getContainer()
	local weight = (item:getWeight() * 10)
	for i=1,weight do
		container:AddItem("Base.Twigs")
	end
end
function UseRecycler_Glass(items, result, player)
	local item = items:get(0)
	local recycler = FindAppliance_Container(player, "Recycler")
	local container = recycler:getContainer()
	local weight = (item:getWeight() * 10)
	for i=1,weight do
		container:AddItem("Base.BrokenGlass")
	end
end
function UseRecycler_Corpse(items, result, player)	
	-- if items:get(0):isSkeleton() then
		-- print("SKELETON!")
	-- end
	player:getEmitter():playSound("Recycler3")
	local recycler = FindAppliance_Container(player, "Recycler")
	local container = recycler:getContainer()
	container:AddItem("Base.GroundCorpse")
	--recycler:getSquare():AddWorldInventoryItem("Base.GroundCorpse", (ZombRand(0,10)/10), (ZombRand(0,10)/10), 0.0)
	for i=1,20 do
		player:addBlood(null, false, true, false)
		player:splatBlood(3, 0.3)
		player:splatBloodFloorBig(0.3)
		addBloodSplat(recycler:getSquare(), ZombRand(7, 12))
	end
end