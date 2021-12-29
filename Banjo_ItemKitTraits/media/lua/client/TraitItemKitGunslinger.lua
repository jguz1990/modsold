require('NPCs/MainCreationMethods');

local function initGunslingerTrait()	
	local gunslinger = TraitFactory.addTrait("Gunslinger", getText("UI_trait_gunslinger"), 2, getText("UI_trait_gunslingerdesc"), false, false);
end

local function initGunslingerStuff(player, square)
	if player:HasTrait("Gunslinger") then
		player:getInventory():AddItem("Base.Revolver");
		player:getInventory():AddItem("Base.Bullets45Box");
	end
end

Events.OnGameBoot.Add(initGunslingerTrait);
Events.OnNewGame.Add(initGunslingerStuff);
