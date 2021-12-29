require('NPCs/MainCreationMethods');

local function initHardboiledTrait()	
	local hardboiled = TraitFactory.addTrait("Hardboiled", getText("UI_trait_hardboiled"), 2, getText("UI_trait_hardboileddesc"), false, false);
end

local function initHardboiledStuff(player, square)
	if player:HasTrait("Hardboiled") then
		player:getInventory():AddItem("Base.Pistol2");
		player:getInventory():AddItem("Base.45Clip");
		player:getInventory():AddItem("Base.45Clip");
		player:getInventory():AddItem("Base.Bullets45Box");
	end
end

Events.OnGameBoot.Add(initHardboiledTrait);
Events.OnNewGame.Add(initHardboiledStuff);
