require('NPCs/MainCreationMethods');

local function initDoublebarreledTrait()	
	local doublebarreled = TraitFactory.addTrait("DoubleBarreled", getText("UI_trait_doublebarreled"), 2, getText("UI_trait_doublebarreleddesc"), false, false);
end

local function initDoublebarreledStuff(player, square)
	if player:HasTrait("DoubleBarreled") then
		player:getInventory():AddItem("Base.DoubleBarrelShotgun");
		player:getInventory():AddItem("Base.ShotgunShellsBox");
	end
end

Events.OnGameBoot.Add(initDoublebarreledTrait);
Events.OnNewGame.Add(initDoublebarreledStuff);
