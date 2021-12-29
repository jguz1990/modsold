require('NPCs/MainCreationMethods');

local function initSniperTrait()	
	local sniper = TraitFactory.addTrait("Sniper", getText("UI_trait_sniper"), 3, getText("UI_trait_sniperdesc"), false, false);
end

local function initSniperStuff(player, square)
	if player:HasTrait("Sniper") then
		player:getInventory():AddItem("Base.AssaultRifle2");
		player:getInventory():AddItem("Base.M14Clip");
		player:getInventory():AddItem("Base.M14Clip");
		player:getInventory():AddItem("Base.308Box");
	end
end

Events.OnGameBoot.Add(initSniperTrait);
Events.OnNewGame.Add(initSniperStuff);
