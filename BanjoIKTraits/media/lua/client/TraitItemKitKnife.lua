require('NPCs/MainCreationMethods');

local function initKnifeTrait()	
	local knife = TraitFactory.addTrait("Knife", getText("UI_trait_knife"), 1, getText("UI_trait_knifedesc"), false, false);
end

local function initKnifeStuff(player, square)
	if player:HasTrait("Knife") then
		player:getInventory():AddItem("Base.KitchenKnife");
	end
end

Events.OnGameBoot.Add(initKnifeTrait);
Events.OnNewGame.Add(initKnifeStuff);
