require('NPCs/MainCreationMethods');

local function initFirebomberTrait()	
	local firebomber = TraitFactory.addTrait("Firebomber", getText("UI_trait_firebomber"), 2, getText("UI_trait_firebomberdesc"), false, false);
end

local function initFirebomberStuff(player, square)
	if player:HasTrait("Firebomber") then
		player:getInventory():AddItem("Base.Lighter");
	        local firebomber_bag = player:getInventory():AddItem("Base.Bag_InmateEscapedBag");
	        firebomber_bag:getItemContainer():AddItem("Base.Molotov");
	        firebomber_bag:getItemContainer():AddItem("Base.Molotov");
	        firebomber_bag:getItemContainer():AddItem("Base.Molotov");
	        firebomber_bag:getItemContainer():AddItem("Base.Molotov");
	end
end

Events.OnGameBoot.Add(initFirebomberTrait);
Events.OnNewGame.Add(initFirebomberStuff);
