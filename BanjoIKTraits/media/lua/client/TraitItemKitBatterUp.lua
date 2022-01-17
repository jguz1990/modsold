require('NPCs/MainCreationMethods');

local function initBatterupTrait()	
	local batterup = TraitFactory.addTrait("BatterUp", getText("UI_trait_batterup"), 1, getText("UI_trait_batterupdesc"), false, false);
end

local function initBatterupStuff(player, square)
	if player:HasTrait("BatterUp") then
		player:getInventory():AddItem("Base.ragerbaseballbat");
	end
end

Events.OnGameBoot.Add(initBatterupTrait);
Events.OnNewGame.Add(initBatterupStuff);
