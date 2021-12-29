require('NPCs/MainCreationMethods');

local function initAmmostockpilerTrait()	
	local ammostockpiler = TraitFactory.addTrait("AmmoStockpiler", getText("UI_trait_ammostockpiler"), 2, getText("UI_trait_ammostockpilerdesc"), false, false);
end

local function initAmmostockpilerStuff(player, square)
	if player:HasTrait("AmmoStockpiler") then
	        local ammostockpiler_bag = player:getInventory():AddItem("Base.Bag_WeaponBag");
	        ammostockpiler_bag:getItemContainer():AddItem("Base.Bullets9mmBox");
	        ammostockpiler_bag:getItemContainer():AddItem("Base.Bullets45Box");
	        ammostockpiler_bag:getItemContainer():AddItem("Base.Bullets44Box");
	        ammostockpiler_bag:getItemContainer():AddItem("Base.Bullets38Box");
	        ammostockpiler_bag:getItemContainer():AddItem("Base.ShotgunShellsBox");
	        ammostockpiler_bag:getItemContainer():AddItem("Base.223Box");
	        ammostockpiler_bag:getItemContainer():AddItem("Base.308Box");
	        ammostockpiler_bag:getItemContainer():AddItem("Base.556Box");
	end
end

Events.OnGameBoot.Add(initAmmostockpilerTrait);
Events.OnNewGame.Add(initAmmostockpilerStuff);
