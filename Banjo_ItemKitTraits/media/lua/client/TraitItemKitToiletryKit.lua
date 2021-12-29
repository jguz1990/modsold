require('NPCs/MainCreationMethods');

local function initToiletrykitTrait()	
	local toiletrykit = TraitFactory.addTrait("ToiletryKit", getText("UI_trait_toiletrykit"), 1, getText("UI_trait_toiletrykitdesc"), false, false);
end

local function initToiletrykitStuff(player, square)
	if player:HasTrait("ToiletryKit") then
	        local toiletrykit_bag = player:getInventory():AddItem("Base.Purse");
	        toiletrykit_bag:getItemContainer():AddItem("Base.Razor");
	        toiletrykit_bag:getItemContainer():AddItem("Base.Mirror");
	        toiletrykit_bag:getItemContainer():AddItem("Base.Comb");
	        toiletrykit_bag:getItemContainer():AddItem("Base.Soap");
	        toiletrykit_bag:getItemContainer():AddItem("Base.Toothbrush");
	        toiletrykit_bag:getItemContainer():AddItem("Base.Toothpaste");
	        toiletrykit_bag:getItemContainer():AddItem("Base.Cologne");
	        toiletrykit_bag:getItemContainer():AddItem("Base.BathTowel");
	end
end

Events.OnGameBoot.Add(initToiletrykitTrait);
Events.OnNewGame.Add(initToiletrykitStuff);
