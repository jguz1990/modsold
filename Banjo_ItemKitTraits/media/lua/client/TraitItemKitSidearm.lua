require('NPCs/MainCreationMethods');

local function initSidearmTrait()	
	local sidearm = TraitFactory.addTrait("Sidearm", getText("UI_trait_sidearm"), 2, getText("UI_trait_sidearmdesc"), false, false);
end

local function initSidearmStuff(player, square)
	if player:HasTrait("Sidearm") then
		player:getInventory():AddItem("Base.Pistol");
		player:getInventory():AddItem("Base.9mmClip");
		player:getInventory():AddItem("Base.9mmClip");
		player:getInventory():AddItem("Base.Bullets9mmBox");
	end
end

Events.OnGameBoot.Add(initSidearmTrait);
Events.OnNewGame.Add(initSidearmStuff);
