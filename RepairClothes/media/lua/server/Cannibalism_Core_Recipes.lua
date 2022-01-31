function InfectedFlesh(food, player)
	local bd = player:getBodyDamage();
	bd:setInf(true);
	bd:getBodyPart(BodyPartType.Head):SetInfected(true);
end

function IsTainted(items, resultItem, player)
	local player_Inventory = player:getInventory();
	local transferred_Items = {}; 
	local item;
	--print("Tainted Test")
	for i = 0, (items:size()-1) do 
		item = items:get(i); 
		if item:getCategory() == "Food" and item:getOnEat() == "InfectedFlesh" then
			resultItem:setOnEat("InfectedFlesh")
		end
		if item:getType() == "HumanFlesh" or item:getType() == "InfectedFlesh" or item:getType() == "ZombieFlesh" then
			player_Inventory:AddItem("Base.BonePieces");
		end
		if item:getType() == "SoylentGreenPan" or item:getType() == "SoylentGreenInfectedPan" then
			player_Inventory:AddItem("Base.BakingPan");
		end
		if item:getType() == "BeanBowl" then
			player_Inventory:AddItem("Base.Bowl");
		end
		if item:getType() == "OpenBeans" then
			player_Inventory:AddItem("Base.TinCanEmpty");
		end
	end
end
