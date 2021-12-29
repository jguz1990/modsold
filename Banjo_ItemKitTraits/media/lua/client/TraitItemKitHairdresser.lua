require('NPCs/MainCreationMethods');

local function initHairdresserTrait()	
	local hairdresser = TraitFactory.addTrait("Hairdresser", getText("UI_trait_hairdresser"), 1, getText("UI_trait_hairdresserdesc"), false, false);
end

local function initHairdresserStuff(player, square)
	if player:HasTrait("Hairdresser") then
	        local hairdresser_bag = player:getInventory():AddItem("Base.Purse");
	        hairdresser_bag:getItemContainer():AddItem("Base.Scissors");
	        hairdresser_bag:getItemContainer():AddItem("Base.Mirror");
	        hairdresser_bag:getItemContainer():AddItem("Base.Comb");
	end
end

Events.OnGameBoot.Add(initHairdresserTrait);
Events.OnNewGame.Add(initHairdresserStuff);
