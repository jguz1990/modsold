function Sack_Balaclava(items, result, player)
	result:getVisual():setDecal("Sack_Balaclava")
	local ClothingColor = ColorInfo.new(0.9, 0.9, 0.9, 1);
	result:setColor(ClothingColor:toColor())
end
function Sack_Balaclava2(items, result, player)
	result:getVisual():setDecal("Sack_Balaclava2")
end
function Pillowcase_Balaclava(items, result, player)
	result:getVisual():setDecal("Pillowcase_Balaclava")
	for i=0,items:size()-1 do
		local item = items:get(i)
		if item:getType():contains("Costume") then		
			local item2= player:getInventory():AddItem("Base.Poncho_Ghost")
			item2:getVisual():setDecal("Poncho_Ghost")
			player:getInventory():AddItem("GhostCostumePackaging")
		end		
	end
end
function Pumpkin_Balaclava(items, result, player)
	result:getVisual():setDecal("Pumpkin_Balaclava")
	local ClothingColor = ColorInfo.new(0.9, 0.9, 0.9, 1);
	result:setColor(ClothingColor:toColor())
	for i=0,items:size()-1 do
		local item = items:get(i)
		if item:getType():contains("Costume") then			
			local item2= player:getInventory():AddItem("Base.Poncho_Pumpkin")
			item2:getVisual():setDecal("Poncho_Pumpkin")
			player:getInventory():AddItem("PumpkinCostumePackaging")
		end		
	end
end
function Skull_Balaclava(items, result, player)
	result:getVisual():setDecal("Skull_Balaclava")
	local ClothingColor = ColorInfo.new(0.9, 0.9, 0.9, 1);
	result:setColor(ClothingColor:toColor())
	for i=0,items:size()-1 do
		local item = items:get(i)
		if item:getType():contains("Costume") then			
			local item2= player:getInventory():AddItem("Base.Poncho_Skeleton")
			item2:getVisual():setDecal("Poncho_Skeleton")
			player:getInventory():AddItem("SkeletonCostumePackaging")
		end		
	end
end
function Poncho_Ghost(items, result, player)
	result:getVisual():setDecal("Poncho_Ghost")
end
function Poncho_Pumpkin(items, result, player)
	result:getVisual():setDecal("Poncho_Pumpkin")
end


function FakeBlood(items, result, player)
	player:addBlood(null, false, true, false)
	triggerEvent("OnClothingUpdated", player)
end

