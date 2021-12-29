require('NPCs/MainCreationMethods');

local function initFreemanTrait()	
	local freeman = TraitFactory.addTrait("Freeman", getText("UI_trait_freeman"), 1, getText("UI_trait_freemandesc"), false, false);
end

local function initFreemanStuff(player, square)
	if player:HasTrait("Freeman") then
		player:getInventory():AddItem("Base.Crowbar");
	end
end

Events.OnGameBoot.Add(initFreemanTrait);
Events.OnNewGame.Add(initFreemanStuff);
