require('NPCs/MainCreationMethods');

local function initBackpackerTrait()	
	local backpacker = TraitFactory.addTrait("Backpacker", getText("UI_trait_backpacker"), 2, getText("UI_trait_backpackerdesc"), false, false);
end

local function initBackpackerStuff(player, square)
	if player:HasTrait("Backpacker") then
	        local backpacker_bag = player:getInventory():AddItem("Base.Bag_NormalHikingBag");
	        backpacker_bag:getItemContainer():AddItem("Base.MarchRidgeMap");
	        backpacker_bag:getItemContainer():AddItem("Base.MuldraughMap");
	        backpacker_bag:getItemContainer():AddItem("Base.WestpointMap");
	        backpacker_bag:getItemContainer():AddItem("Base.RosewoodMap");
	        backpacker_bag:getItemContainer():AddItem("Base.RiversideMap");
	        backpacker_bag:getItemContainer():AddItem("Base.Toothbrush");
	        backpacker_bag:getItemContainer():AddItem("Base.Toothpaste");
	        backpacker_bag:getItemContainer():AddItem("Base.Socks_Long");
	end
end

Events.OnGameBoot.Add(initBackpackerTrait);
Events.OnNewGame.Add(initBackpackerStuff);
