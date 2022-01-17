require('NPCs/MainCreationMethods');

local function initSlasherTrait()	
	local slasher = TraitFactory.addTrait("Slasher", getText("UI_trait_slasher"), 1, getText("UI_trait_slasherdesc"), false, false);
end

local function initSlasherStuff(player, square)
	if player:HasTrait("Slasher") then
		player:getInventory():AddItem("Base.akiermachete");
	end
end

Events.OnGameBoot.Add(initSlasherTrait);
Events.OnNewGame.Add(initSlasherStuff);
