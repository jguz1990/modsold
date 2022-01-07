require('NPCs/MainCreationMethods');

local function initMachinegunnerTrait()	
	local machinegunner = TraitFactory.addTrait("Machinegunner", getText("UI_trait_machinegunner"), 3, getText("UI_trait_machinegunnerdesc"), false, false);
end

local function initMachinegunnerStuff(player, square)
	if player:HasTrait("Machinegunner") then
		player:getInventory():AddItem("Base.CAR15_Survival");
		player:getInventory():AddItem("Base.556Clip");
		player:getInventory():AddItem("Base.556Clip");
		player:getInventory():AddItem("Base.556Box");
	end
end

Events.OnGameBoot.Add(initMachinegunnerTrait);
Events.OnNewGame.Add(initMachinegunnerStuff);
