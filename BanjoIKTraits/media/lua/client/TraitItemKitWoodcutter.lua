require('NPCs/MainCreationMethods');

local function initWoodcutterTrait()	
	local woodcutter = TraitFactory.addTrait("Woodcutter", getText("UI_trait_woodcutter"), 2, getText("UI_trait_woodcutterdesc"), false, false);
end

local function initWoodcutterStuff(player, square)
	if player:HasTrait("Woodcutter") then
		player:getInventory():AddItem("Base.Axe");
	end
end

Events.OnGameBoot.Add(initWoodcutterTrait);
Events.OnNewGame.Add(initWoodcutterStuff);
