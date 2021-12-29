require('NPCs/MainCreationMethods');

local function initFishingtripTrait()	
	local fishingtrip = TraitFactory.addTrait("FishingTrip", getText("UI_trait_fishingtrip"), 2, getText("UI_trait_fishingtripdesc"), false, false);
end

local function initFishingtripStuff(player, square)
	if player:HasTrait("FishingTrip") then
	        local fishingtrip_bag = player:getInventory():AddItem("Base.SewingKit");
	        fishingtrip_bag:getItemContainer():AddItem("Base.Worm");
	        fishingtrip_bag:getItemContainer():AddItem("Base.Worm");
	        fishingtrip_bag:getItemContainer():AddItem("Base.Worm");
	        fishingtrip_bag:getItemContainer():AddItem("Base.Worm");
	        fishingtrip_bag:getItemContainer():AddItem("Base.Worm");
	        fishingtrip_bag:getItemContainer():AddItem("Base.Worm");
	        fishingtrip_bag:getItemContainer():AddItem("Base.FishingTackle");
	        fishingtrip_bag:getItemContainer():AddItem("Base.FishingTackle");
	        fishingtrip_bag:getItemContainer():AddItem("Base.PaperclipBox");
	        fishingtrip_bag:getItemContainer():AddItem("Base.FishingLine");
	        fishingtrip_bag:getItemContainer():AddItem("Base.FishingLine");
		player:getInventory():AddItem("Base.FishingRod");
	end
end

Events.OnGameBoot.Add(initFishingtripTrait);
Events.OnNewGame.Add(initFishingtripStuff);
