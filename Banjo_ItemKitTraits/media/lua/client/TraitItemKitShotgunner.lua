require('NPCs/MainCreationMethods');

local function initShotgunnerTrait()	
	local shotgunner = TraitFactory.addTrait("Shotgunner", getText("UI_trait_shotgunner"), 4, getText("UI_trait_shotgunnerdesc"), false, false);
end

local function initShotgunnerStuff(player, square)
	if player:HasTrait("Shotgunner") then
		player:getInventory():AddItem("Base.M1014_Wick");
		player:getInventory():AddItem("Base.ShotgunShellsBox");
		player:getInventory():AddItem("Base.ShotgunShellsBox");
		player:getInventory():AddItem("Base.ShotgunShellsBox");
		player:getInventory():AddItem("Base.ShotgunShellsBox");
	end
end

Events.OnGameBoot.Add(initShotgunnerTrait);
Events.OnNewGame.Add(initShotgunnerStuff);
