require('NPCs/MainCreationMethods');

local function initGolferTrait()	
	local golfer = TraitFactory.addTrait("Golfer", getText("UI_trait_golfer"), 1, getText("UI_trait_golferdesc"), false, false);
end

local function initGolferStuff(player, square)
	if player:HasTrait("Golfer") then
		player:getInventory():AddItem("Base.Golfclub");
		player:getInventory():AddItem("Base.GolfBall");
		player:getInventory():AddItem("Base.GolfBall");
	end
end

Events.OnGameBoot.Add(initGolferTrait);
Events.OnNewGame.Add(initGolferStuff);
