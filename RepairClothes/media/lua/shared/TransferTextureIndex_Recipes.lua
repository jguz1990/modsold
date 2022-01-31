function Transfer_Texture_Index(items, resultItem, player)

	local player_Inventory = player:getInventory();
	local transferred_Items = {}; 
	local Item;
	local texture
	local textureName
	
	for i = 0, (items:size()-1) do 
		Item = items:get(i); 
		texture = Item:getVisual():getTextureChoice()
		textureName = Item:getTexture()
	end
	--print("Texture Choice: " .. tostring(texture))
	--print ("Start Item Texture:" .. tostring(Item:getTexture()))
	--print ("Result Item Texture:" .. tostring(resultItem:getTexture()))
	--resultItem:synchWithVisual()
	if resultItem:getType():contains("Hat") then
		if texture == 0 then textureName = "Item_BandanaBlack"
		resultItem:setTexture(getTexture(textureName))
		resultItem:getVisual():setTextureChoice(0)
		elseif texture == 1 then textureName = "Item_BandanaBlue"
		resultItem:setTexture(getTexture(textureName))
		resultItem:getVisual():setTextureChoice(1)
		elseif texture == 2 then textureName = "Item_BandanaRed"
		resultItem:setTexture(getTexture(textureName))
		resultItem:getVisual():setTextureChoice(2)
		elseif texture == 3 then textureName = "Item_BandanaBlack"
		resultItem:setTexture(getTexture(textureName))
		resultItem:getVisual():setTextureChoice(3)
		end	
	else
		if texture == 0 then textureName = "Item_RamboBandanna_Black"
		resultItem:setTexture(getTexture(textureName))
		resultItem:getVisual():setTextureChoice(0)
		elseif texture == 1 then textureName = "Item_RamboBandanna_Blue"
		resultItem:setTexture(getTexture(textureName))
		resultItem:getVisual():setTextureChoice(1)
		elseif texture == 2 then textureName = "Item_RamboBandanna_Red"
		resultItem:setTexture(getTexture(textureName))
		resultItem:getVisual():setTextureChoice(2)
		elseif texture == 3 then textureName = "Item_RamboBandanna_Black"
		resultItem:setTexture(getTexture(textureName))
		resultItem:getVisual():setTextureChoice(3)
		end	
	end
	--resultItem:setTexture(getTexture(textureName))
	print("Texture Choice Start: " .. tostring((texture)) .. " - " .. tostring(Item:getTexture()))
	print("Texture Choice Result: " .. tostring(resultItem:getVisual():getTextureChoice()).. " - " .. tostring(resultItem:getTexture()))
	resultItem:getVisual():setTextureChoice(texture)
	--resultItem:getVisual():setTextureChoice(texture)
end
