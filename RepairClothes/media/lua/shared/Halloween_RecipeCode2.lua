function Creature_Balaclava(items, result, player)
	result:getVisual():setDecal("Creature_Balaclava")
	local ClothingColor = ColorInfo.new(0.9, 0.9, 0.9, 1);
	result:setColor(ClothingColor:toColor())
	for i=0,items:size()-1 do
		local item = items:get(i)
		if item:getType():contains("Costume") then			
			local item2= player:getInventory():AddItem("Base.Poncho_Creature")
			item2:getVisual():setDecal("Poncho_Creature")
			local ClothingColor = ColorInfo.new(1, 1, 0, 1);
			item2:setColor(ClothingColor:toColor())
			player:getInventory():AddItem("CreatureCostumePackaging")
		end		
	end
end
