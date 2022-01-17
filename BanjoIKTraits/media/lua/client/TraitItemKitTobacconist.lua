require('NPCs/MainCreationMethods');

local function initTobacconistTrait()	
	local tobacconist = TraitFactory.addTrait("Tobacconist", getText("UI_trait_tobacconist"), 1, getText("UI_trait_tobacconistdesc"), false, false);
end

local function initTobacconistStuff(player, square)
	if player:HasTrait("Tobacconist") then
		player:getInventory():AddItem("Base.Lighter");
		player:getInventory():AddItem("Base.Cigarettes");
		player:getInventory():AddItem("Base.Cigarettes");
	end
end

Events.OnGameBoot.Add(initTobacconistTrait);
Events.OnNewGame.Add(initTobacconistStuff);
