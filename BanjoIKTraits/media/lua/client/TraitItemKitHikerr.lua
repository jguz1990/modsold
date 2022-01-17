require('NPCs/MainCreationMethods');

local function initHikerTrait()	
	local Hiker = TraitFactory.addTrait("Hiker", getText("UI_trait_hiker"), 2, getText("UI_trait_hikerdesc"), false, false);
end

local function initHikerStuff(player, square)
	if player:HasTrait("Hiker") then
	        local hiker_bag = player:getInventory():AddItem("Base.Bag_NormalHikingBag");
	        hiker_bag:getItemContainer():AddItem("Base.MarchRidgeMap");
	        hiker_bag:getItemContainer():AddItem("Base.MuldraughMap");
	        hiker_bag:getItemContainer():AddItem("Base.WestpointMap");
	        hiker_bag:getItemContainer():AddItem("Base.RosewoodMap");
	        hiker_bag:getItemContainer():AddItem("Base.RiversideMap");
	        hiker_bag:getItemContainer():AddItem("Base.Toothbrush");
	        hiker_bag:getItemContainer():AddItem("Base.Toothpaste");
	        hiker_bag:getItemContainer():AddItem("Base.Socks_Long");
	end
end

Events.OnGameBoot.Add(initHikerTrait);
Events.OnNewGame.Add(initHikerStuff);
