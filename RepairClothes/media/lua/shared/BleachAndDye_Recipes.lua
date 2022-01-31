function BleachClothes(items, result, player)
	for i=0,items:size()-1 do
		local item = items:get(i)
		if item:IsClothing() then
			--print("Color: " .. tostring(item:getColor()))
			local ClothingColor = ColorInfo.new(1, 1, 1, 1);
			item:setColor(ClothingColor:toColor())
			local color = ImmutableColor.new(1.0, 1.0, 1.0, 1)
			if item:getVisual() then item:getVisual():setTint(color) end
			item:setWetness(100);
		end		
	end
	player:getInventory():AddItem("Base.BleachEmpty");
end

function CopyClothingColor(items, result, player)
	local ClothingIconColor  = nil
	local ClothingActualColor = nil
	for i=0,items:size()-1 do
		local item = items:get(i)
		local data = item:getModData()
		if item:IsClothing() or data.SewingMaterial then
			if item:getColor() then
				ClothingIconColor = item:getColor()
			end
			if item:getVisual():getTint() then
				ClothingActualColor = item:getVisual():getTint()
			end
		end		
	end
	if ClothingIconColor then result:setColor(ClothingIconColor:toColor()) end
	if ClothingActualColor then result:getVisual():setTint(ClothingActualColor) end
end

function DyeClothes(items, result, player)
	local ClothingIconColor  = nil
	local ClothingActualColor = nil
	local GarmentIconColor  = nil
	local GarmentActualColor = nil
	local garment = nil
			local Red = nil
			local Green= nil
			local Blue = nil
			local Red2 = nil
			local Green2= nil
			local Blue2 = nil
			local Red3 = nil
			local Green3= nil
			local Blue3 = nil
			local Red4 = nil
			local Green4= nil
			local Blue4 = nil
			local Red5 = nil
			local Green5= nil
			local Blue5 = nil
			local ugh = nil
	for i=0,items:size()-1 do
		local item = items:get(i)
		local modData = item:getModData()
		if modData.ClothingDye then
			--print("Dye!")
			Red = modData.DyeColorRed/255
			Green= modData.DyeColorGreen/255
			Blue = modData.DyeColorBlue/255
			--print("Red: " .. Red)
			--print("Green: " .. Green)
			--print("Blue: " .. Blue)
			ClothingIconColor = ColorInfo.new(Red, Green, Blue, 1);
			ClothingActualColor = ImmutableColor.new(Red, Green, Blue, 1)
		end	
		if item:IsClothing() then
			--print("Garment")
			garment = item
			if garment:getColor() then
				GarmentIconColor = item:getColor()
				Red2 = GarmentIconColor:getRedFloat()
				Green2 = GarmentIconColor:getGreenFloat()
				Blue2 = GarmentIconColor:getBlueFloat()
				--print("Garment Icon Color: " .. tostring(GarmentIconColor))
			end
			if garment:getVisual() and garment:getVisual():getTint(garment:getClothingItem()) then
				GarmentActualColor = garment:getVisual():getTint(garment:getClothingItem())
				--Red3, Green3, Blue3, ugh = {garment:getVisual():getTint(garment:getClothingItem())}
				Red3 = GarmentActualColor:getRedFloat()
				Green3 = GarmentActualColor:getGreenFloat()
				Blue3 = GarmentActualColor:getBlueFloat()
				--print("Garment Actual Color: " .. tostring(GarmentActualColor))
			end		
		end			
	end
	
	if garment and garment:getColor() then	
		Red2 = 1 - Red2
		Green2 = 1 - Green2
		Blue2 = 1 - Blue2	
		
		Red3 = Red2
		Green3 = Green2
		Blue3 = Blue2
	end
	if garment and garment:getVisual() then		
		Red3 = 1 - Red3
		Green3 = 1 - Green3
		Blue3 = 1 - Blue3
	end
	if garment then
		
		Red4 = Red - Red2
		Green4 = Green - Green2
		Blue4 = Blue - Blue2
		
		Red5 = Red - Red3
		Green5 = Green - Green3
		Blue5 = Blue - Blue3
		if Red4 < 0 then Red4 = 0 end		
		if Green4 < 0 then Green4 = 0 end		
		if Blue4 < 0 then Blue4 = 0 end
		
		if Red5 < 0 then Red5 = 0 end		
		if Green5 < 0 then Green5 = 0 end		
		if Blue5 < 0 then Blue5 = 0 end
		
		--ClothingIconColor = ColorInfo.new(Red4, Green4, Blue4, 1);
		--ClothingActualColor = ImmutableColor.new(Red5, Green5, Blue5, 1)
		local color = Color.new(Red5, Green5, Blue5, 1)
		--garment:setColor(ClothingIconColor:toColor())
		
		    garment:setColor(color);
            garment:getVisual():setTint(ImmutableColor.new(color));

            garment:setCustomColor(true)
		
		
		garment:setColor(color)
		--ClothingIconColor = color
		--garment:getVisual():setTint(color)
		--if ClothingActualColor and garment:getVisual() then garment:getVisual():setTint(ClothingActualColor) end
		garment:setCustomColor(true)
		garment:setWetness(100);
	end
end


function ClothingOffTest(item, result)
	if item:IsClothing() and item:isEquipped() then
		--print("Worn!")	
		return false
	end		
	return true
end

function BleachOrDye(scriptItems)
    local allScriptItems = getScriptManager():getAllItems()
    for i=1,allScriptItems:size() do
        local scriptItem = allScriptItems:get(i-1)
        if (scriptItem:getType() == Type.Clothing) and (scriptItem:getFabricType() == "Cotton" or scriptItem:getFabricType() == "Denim") and (scriptItem:getName():contains("TINT"))then
            if ClothingRecipesDefinitions[scriptItem:getName()] then
                -- ignore
            else
                scriptItems:add(scriptItem)
            end
        end
    end
end

DyeList = {}

function CanDye_MakeList(DyeList)
	print("Dye List Make List!")
    local allScriptItems = getScriptManager():getAllItems()
    for i=1,allScriptItems:size() do
        local scriptItem = allScriptItems:get(i-1)

        if (scriptItem:getType() == Type.Clothing) then 		
			print("Dye List? " .. scriptItem:getName())
			if scriptItem:getFabricType() == "Cotton" or scriptItem:getFabricType() == "Denim"
			or scriptItem:getName():contains("TINT")  then
				--if ClothingRecipesDefinitions[scriptItem:getName()] then
					-- ignore
				--else
					print("Dye List! " .. scriptItem:getName())
					table.insert(DyeList, scriptItem)
					--DyeList:add(scriptItem:getName())
				--end
			end
        end
    end
end
Events.OnGameStart.Add( CanDye_MakeList(DyeList) )



--Events.OnGameStart.Add( CanDye_MakeList )
--CanDye_MakeList()
function CanDye(scriptItems)
    local allScriptItems = getScriptManager():getAllItems()
    for i=1,allScriptItems:size() do
        local scriptItem = allScriptItems:get(i-1)
		--print(tostring(scriptItem:getName()))
        if (scriptItem:getType() == Type.Clothing) and
		((scriptItem:getFabricType() == "Cotton" or scriptItem:getFabricType() == "Denim")
		or scriptItem:getName():contains("TINT")) then
            if ClothingRecipesDefinitions[scriptItem:getName()] then
                -- ignore
            else
                scriptItems:add(scriptItem)
            end
        end
    end
end

function CanDye_List(scriptItems)
    local allScriptItems = getScriptManager():getAllItems()
    for i=1,allScriptItems:size() do
        local scriptItem = allScriptItems:get(i-1)
		--print(tostring(scriptItem:getName()))
        if (scriptItem:getType() == Type.Clothing) and
		((scriptItem:getFabricType() == "Cotton" or scriptItem:getFabricType() == "Denim")
		or scriptItem:getName():contains("TINT")) then
            if ClothingRecipesDefinitions[scriptItem:getName()] then
                -- ignore
            else
                scriptItems:add(scriptItem)
            end
        end
    end
	--CanDye(scriptItems)
	
	
    --local allScriptItems = DyeList
	-- print("Can Dye List?")
	-- print(tostring(DyeList))
    -- for i=1,DyeList:size() do
        -- --local scriptItem = DyeList:get(i-1)
        -- local scriptItem = DyeList[i]
		-- --print ("Can Dye? " .. 
        -- if (scriptItem) then
	
                -- scriptItems:add(scriptItem)
            
        -- end
    -- end
	
	--scriptItems = DyeList
	
end