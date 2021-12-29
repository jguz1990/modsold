require('NPCs/MainCreationMethods');

local function initShotgunnerTrait()	
	local shotgunner = TraitFactory.addTrait("Shotgunner", getText("UI_trait_shotgunner"), 2, getText("UI_trait_shotgunnerdesc"), false, false);
end

local function initShotgunnerStuff(player, square)
	if player:HasTrait("Shotgunner") then
		player:getInventory():AddItem("Base.Shotgun");
		player:getInventory():AddItem("Base.ShotgunShellsBox");
	end
end

Events.OnGameBoot.Add(initShotgunnerTrait);
Events.OnNewGame.Add(initShotgunnerStuff);
