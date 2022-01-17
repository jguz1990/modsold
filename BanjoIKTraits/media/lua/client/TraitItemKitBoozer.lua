require('NPCs/MainCreationMethods');

local function initBoozerTrait()	
	local boozer = TraitFactory.addTrait("Boozer", getText("UI_trait_boozer"), 1, getText("UI_trait_boozerdesc"), false, false);
end

local function initBoozerStuff(player, square)
	if player:HasTrait("Boozer") then
	        local boozer_bag = player:getInventory():AddItem("Base.Plasticbag");
	        boozer_bag:getItemContainer():AddItem("Base.WhiskeyFull");
	        boozer_bag:getItemContainer():AddItem("Base.Wine");
	        boozer_bag:getItemContainer():AddItem("Base.Wine2");
	end
end

Events.OnGameBoot.Add(initBoozerTrait);
Events.OnNewGame.Add(initBoozerStuff);
