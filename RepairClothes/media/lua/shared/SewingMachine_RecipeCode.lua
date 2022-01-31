function CanSewingMachine(item, result)
	--print("can sew?")
	if not item then return false end
	local power = nil
	local sewingMachine = nil
	local player = getSpecificPlayer(0)
	local square = nil
	--sewingMachine = FindWorkbench(player, "Sewing Machine")
	sewingMachine = FindAppliance(player, "SewingMachine")
	if sewingMachine then square = sewingMachine:getSquare() end
	if square and (getGameTime():getNightsSurvived() < getSandboxOptions():getElecShutModifier())
	and not square:isOutside() then
		power = true
	end	
	if square and square:haveElectricity() then			
		power = true
	end
	if (not sewingMachine)
	--or (not AdjacentFreeTileFinder.isTileOrAdjacent(getSpecificPlayer(0):getCurrentSquare(), sewingMachine:getSquare()))
	--or sewingMachine and not (player:CanSee(sewingMachine))
	then
		power = false
	end
	--if sewingMachine and sewingMachine:getSquare() then	
		--print("SQUARE")
		--print("??? " .. tostring(AdjacentFreeTileFinder.isTileOrAdjacent(getSpecificPlayer(0):getCurrentSquare(), sewingMachine:getSquare())))
	--end
	--print("Sewing Machine " .. tostring(sewingMachine))
	--print("Power " .. tostring(power))
	if power then return true end
	
	return false
end

-- function FindAppliance(player, Appliance)
    -- --print("find worksbench")
    -- local station = nil
    -- local CustomName = nil
    -- local cell = player:getCell() -- the cell wont change. no need to getWorld():getCell() every step of the loop
    -- local x, y, z = player:getX(), player:getY(), player:getZ()
    -- local xx, yy, zz
    -- for xx =-1,1 do -- no rule says we need to start at index 1. skip the funky math

        -- for yy =-1,1 do

            -- local square = cell:getGridSquare(x+xx, y+yy, z)
            -- if square then

                -- local objects = square:getObjects()

                -- for index=0, objects:size()-1 do
                    -- local object = objects:get(index)
                    
                    
                    -- if object:getProperties():Val("CustomName") then
                        -- CustomName = object:getProperties():Val("CustomName")
						-- --print("Custom Name " .. tostring(CustomName))
                        -- if CustomName:contains(Appliance) or Appliance:contains(CustomName) then
							-- --print("BINGO")
                            -- station = object
                            -- return station
                        -- end
                    -- end
                -- end
                
            -- end
        -- end
    -- end
    -- return station
-- end



function CopyClothingColor(items, result, player)
	local ClothingIconColor  = nil
	local ClothingActualColor = nil
	for i=0,items:size()-1 do
		local item = items:get(i)
		local data = item:getModData()
		if item:IsClothing() or data.SewingMaterial then
			if item:getColor() then
				ClothingIconColor = item:getColor()
				print("Icon Color: " .. tostring(ClothingIconColor))
			end
			if item:getVisual() and item:getVisual():getTint() then
				ClothingActualColor = item:getVisual():getTint()
				print("Actual Color: " .. tostring(ClothingActualColor))
			end
		end		
	end
	--result:setColor(ClothingIconColor:toColor())
	if ClothingIconColor then
		--result:setColor(ClothingIconColor:toColor())
	end
	if ClothingIconColor then
		--result:getVisual():setTint(ClothingActualColor)
	end
end


function DyeClothes2(items, result, player)
	local ClothingIconColor  = nil
	local ClothingActualColor = nil
	for i=0,items:size()-1 do
		local item = items:get(i)
		local modData = item:getModData()
		if modData.SewingMaterial or item:IsClothing() then
			ClothingIconColor = item:getColor();
			print("Clothing Icon Color: " .. tostring(ClothingIconColor))
		end		
	end
	result:setColor(ClothingIconColor)
	result:getVisual():setTint(ImmutableColor.new(ClothingIconColor))
end
function DyeClothes2_Multiple(items, result, player)
	local ClothingIconColor  = nil
	local ClothingActualColor = nil
	for i=0,items:size()-1 do
		local item = items:get(i)
		local modData = item:getModData()
		if modData.SewingMaterial or item:IsClothing() then
			ClothingIconColor = item:getColor();
			print("Clothing Icon Color: " .. tostring(ClothingIconColor))
		end		
	end
	for i=0,result:size()-1 do
		local item = result:get(i)
		item:setColor(ClothingIconColor)
		item:getVisual():setTint(ImmutableColor.new(ClothingIconColor))
	end

end
function MakeBandanas(items, result, player)
	local ClothingIconColor  = nil
	local ClothingActualColor = nil
	for i=0,items:size()-1 do
		local item = items:get(i)
		local modData = item:getModData()
		if modData.SewingMaterial or item:IsClothing() then
			ClothingIconColor = item:getColor();
			--print("Clothing Icon Color: " .. tostring(ClothingIconColor))
		end		
	end
	for i=0, 7 do
		local item = player:getInventory():AddItem("Base.Hat_BandanaTINT")
		item:setColor(ClothingIconColor)
		item:getVisual():setTint(ImmutableColor.new(ClothingIconColor))
	end

end
function SewBag(items, result, player)
	local Cordura = nil
	local Texture = nil	
	for i=0,items:size()-1 do
		local item = items:get(i)
		local modData = item:getModData()
		if item:getType():contains("Cordura") then
			Cordura = item:getType()
		end		
	end
	local Bag = result:getType()
	if Bag:contains("Hiking") then 
		if Cordura:contains("Blue") then Texture = 0
		elseif Cordura:contains("Green") then Texture = 1
		elseif Cordura:contains("Red") then Texture = 2
		end
	elseif Bag:contains("Duffle") then 
		if Cordura:contains("Blue") then Texture = 0
		elseif Cordura:contains("Green") then Texture = 1
		elseif Cordura:contains("Grey") then Texture = 2
		end
	elseif Bag:contains("Satchel") then 
		if Cordura:contains("OliveDrab") then Texture = 1
		elseif Cordura:contains("Khaki") then Texture = 2
		end
	elseif Bag:contains("Schoolbag") then 
		if Cordura:contains("Black") then Texture = 0 
		elseif Cordura:contains("Blue") then Texture = 1 
		end
	end
	if Texture then
		--local TextureName = result:getIconsForTexture():get(Texture)
		--print("Texture Name: " .. tostring(TextureName))
		result:getVisual():setTextureChoice(Texture)
		result:synchWithVisual()
	end
end

function SewDenim(items, result, player)
	local Denim = nil
	local Texture = nil	
	for i=0,items:size()-1 do
		local item = items:get(i)
		local modData = item:getModData()
		if item:getType():contains("Denim") then
			Denim = item:getType()
		end		
	end
	print("Denim: " .. tostring(Denim))
	--if result:getType() == "Shirt_Denim" then
	
	--else
		if Denim==("Denim") then Texture = 0
		elseif Denim==("BlackDenim") then Texture = 1
		elseif Denim==("LightDenim") then Texture = 2
		end
	--end
	print("Texture: " .. tostring(Texture))
	--if Texture then
		--local TextureName = result:getIconsForTexture():get(Texture)
		--print("Texture Name: " .. tostring(TextureName))
		result:getVisual():setTextureChoice(Texture)
		result:synchWithVisual()
		print("Result: " .. tostring(result:getTexture()))
	--end
end
function SewDenimShirt0(items, result, player)
		result:getVisual():setTextureChoice(0)
		result:synchWithVisual()
end
function SewDenimShirt1(items, result, player)
	print("Black Denim?")
	result:getVisual():setTextureChoice(1)
	result:synchWithVisual()
	print("Result: " .. tostring(result:getTexture()))
end
function SewDenimShirt2(items, result, player)
		result:getVisual():setTextureChoice(2)
		result:synchWithVisual()
end

function SewPlaid(items, result, player)
	local Plaid = nil
	local Texture = nil	
	for i=0,items:size()-1 do
		local item = items:get(i)
		local modData = item:getModData()
		if item:getType():contains("Plaid") then
			Plaid = item:getType()
		end		
	end
	print("Plaid: " .. tostring(Plaid))
	if Plaid:contains("Blue") then Texture = 0
	elseif Plaid:contains("Green") then Texture = 1
	elseif Plaid:contains("Grey") then Texture = 2
	elseif Plaid:contains("Red") then Texture = 3
	elseif Plaid:contains("Yellow") then Texture = 4
	end
	print("Texture: " .. tostring(Texture))
	
	local item = player:getInventory():AddItem("Base.Shirt_Lumberjack")
	item:getVisual():setTextureChoice(Texture)
	item:synchWithVisual()
	print("Result: " .. tostring(result:getTexture()))
end