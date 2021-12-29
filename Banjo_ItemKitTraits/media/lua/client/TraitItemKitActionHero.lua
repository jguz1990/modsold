require('NPCs/MainCreationMethods');

local function initActionheroTrait()	
	local actionhero = TraitFactory.addTrait("ActionHero", getText("UI_trait_actionhero"), 2, getText("UI_trait_actionherodesc"), false, false);
end

local function initActionheroStuff(player, square)
	if player:HasTrait("ActionHero") then
		player:getInventory():AddItem("Base.Pistol3");
		player:getInventory():AddItem("Base.44Clip");
		player:getInventory():AddItem("Base.44Clip");
		player:getInventory():AddItem("Base.Bullets44Box");
	end
end

Events.OnGameBoot.Add(initActionheroTrait);
Events.OnNewGame.Add(initActionheroStuff);
