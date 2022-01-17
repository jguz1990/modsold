require('NPCs/MainCreationMethods');

local function initPlinkerTrait()	
	local plinker = TraitFactory.addTrait("Plinker", getText("UI_trait_plinker"), 2, getText("UI_trait_plinkerdesc"), false, false);
end

local function initPlinkerStuff(player, square)
	if player:HasTrait("Plinker") then
		player:getInventory():AddItem("Base.VarmintRifle");
		player:getInventory():AddItem("Base.223Clip");
		player:getInventory():AddItem("Base.223Clip");
		player:getInventory():AddItem("Base.223Box");
	end
end

Events.OnGameBoot.Add(initPlinkerTrait);
Events.OnNewGame.Add(initPlinkerStuff);
