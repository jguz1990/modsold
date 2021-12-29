require('NPCs/MainCreationMethods');

local function initToolboxTrait()	
	local toolbox = TraitFactory.addTrait("Toolbox", getText("UI_trait_toolbox"), 2, getText("UI_trait_toolboxdesc"), false, false);
end

local function initToolboxStuff(player, square)
	if player:HasTrait("Toolbox") then
	        local toolbox_bag = player:getInventory():AddItem("Base.Bag_WorkerBag");
	        toolbox_bag:getItemContainer():AddItem("Base.Hammer");
	        toolbox_bag:getItemContainer():AddItem("Base.Screwdriver");
	        toolbox_bag:getItemContainer():AddItem("Base.Saw");
	        toolbox_bag:getItemContainer():AddItem("Base.NailsBox");
	        toolbox_bag:getItemContainer():AddItem("Base.ScrewsBox");
	        toolbox_bag:getItemContainer():AddItem("Base.DuctTape");
	        toolbox_bag:getItemContainer():AddItem("Base.Woodglue");
	end
end

Events.OnGameBoot.Add(initToolboxTrait);
Events.OnNewGame.Add(initToolboxStuff);
