require('NPCs/MainCreationMethods');

local function initCleaningsuppliesTrait()	
	local cleaningsupplies = TraitFactory.addTrait("CleaningSupplies", getText("UI_trait_cleaningsupplies"), 1, getText("UI_trait_cleaningsuppliesdesc"), false, false);
end

local function initCleaningsuppliesStuff(player, square)
	if player:HasTrait("CleaningSupplies") then
	        local cleaningsupplies_bag = player:getInventory():AddItem("Base.Garbagebag");
	        cleaningsupplies_bag:getItemContainer():AddItem("Base.Bleach");
	        cleaningsupplies_bag:getItemContainer():AddItem("Base.Disinfectant");
	        cleaningsupplies_bag:getItemContainer():AddItem("Base.Sponge");
	        cleaningsupplies_bag:getItemContainer():AddItem("Base.Soap");
	        cleaningsupplies_bag:getItemContainer():AddItem("Base.DishCloth");
		player:getInventory():AddItem("Base.Mop");
		player:getInventory():AddItem("Base.BucketEmpty");
	end
end

Events.OnGameBoot.Add(initCleaningsuppliesTrait);
Events.OnNewGame.Add(initCleaningsuppliesStuff);
