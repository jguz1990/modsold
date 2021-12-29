require('NPCs/MainCreationMethods');

local function initCaseyjTrait()	
	local caseyj = TraitFactory.addTrait("CaseyJ", getText("UI_trait_caseyj"), 1, getText("UI_trait_caseyjdesc"), false, false);
end

local function initCaseyjStuff(player, square)
	if player:HasTrait("CaseyJ") then
		player:getInventory():AddItem("Base.HockeyStick");
	end
end

Events.OnGameBoot.Add(initCaseyjTrait);
Events.OnNewGame.Add(initCaseyjStuff);
