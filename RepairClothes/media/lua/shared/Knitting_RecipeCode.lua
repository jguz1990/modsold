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
function BleachTextiles(items, result, player)
	for i=0,items:size()-1 do
		local item = items:get(i)
		if item:IsClothing() then
			--print("Color: " .. tostring(item:getColor()))
			local ClothingColor = ColorInfo.new(1, 1, 1, 1);
			item:setColor(ClothingColor:toColor())
			--local color = ImmutableColor.new(1.0, 1.0, 1.0, 1)
			--item:getVisual():setTint(color);
			item:setWetness(100);
		end		
	end
	player:getInventory():AddItem("Base.BleachEmpty");
end