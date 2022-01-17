require('NPCs/MainCreationMethods');

local function initSchoolsuppliesTrait()	
	local schoolsupplies = TraitFactory.addTrait("SchoolSupplies", getText("UI_trait_schoolsupplies"), 1, getText("UI_trait_schoolsuppliesdesc"), false, false);
end

local function initSchoolsuppliesStuff(player, square)
	if player:HasTrait("SchoolSupplies") then
	        local schoolsupplies_bag = player:getInventory():AddItem("Base.Bag_Schoolbag");
	        schoolsupplies_bag:getItemContainer():AddItem("Base.Notebook");
	        schoolsupplies_bag:getItemContainer():AddItem("Base.Journal");
	        schoolsupplies_bag:getItemContainer():AddItem("Base.Pencil");
	        schoolsupplies_bag:getItemContainer():AddItem("Base.Eraser");
	        schoolsupplies_bag:getItemContainer():AddItem("Base.Pen");
	        schoolsupplies_bag:getItemContainer():AddItem("Base.Glue");
	        schoolsupplies_bag:getItemContainer():AddItem("Base.Scotchtape");
	end
end

Events.OnGameBoot.Add(initSchoolsuppliesTrait);
Events.OnNewGame.Add(initSchoolsuppliesStuff);
