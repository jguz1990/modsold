require('NPCs/MainCreationMethods');

local function initRiflemanTrait()	
	local rifleman = TraitFactory.addTrait("Rifleman", getText("UI_trait_rifleman"), 2, getText("UI_trait_riflemandesc"), false, false);
end

local function initRiflemanStuff(player, square)
	if player:HasTrait("Rifleman") then
		player:getInventory():AddItem("Base.HuntingRifle");
		player:getInventory():AddItem("Base.308Clip");
		player:getInventory():AddItem("Base.308Clip");
		player:getInventory():AddItem("Base.308Box");
	end
end

Events.OnGameBoot.Add(initRiflemanTrait);
Events.OnNewGame.Add(initRiflemanStuff);
