require('NPCs/MainCreationMethods');

local function initHoldoutTrait()	
	local holdout = TraitFactory.addTrait("Holdout", getText("UI_trait_holdout"), 2, getText("UI_trait_holdoutdesc"), false, false);
end

local function initHoldoutStuff(player, square)
	if player:HasTrait("Holdout") then
		player:getInventory():AddItem("Base.Revolver_Short");
		player:getInventory():AddItem("Base.Bullets38Box");
	end
end

Events.OnGameBoot.Add(initHoldoutTrait);
Events.OnNewGame.Add(initHoldoutStuff);
