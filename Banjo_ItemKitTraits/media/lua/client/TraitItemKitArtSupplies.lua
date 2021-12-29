require('NPCs/MainCreationMethods');

local function initArtsuppliesTrait()	
	local artsupplies = TraitFactory.addTrait("ArtSupplies", getText("UI_trait_artsupplies"), 1, getText("UI_trait_artsuppliesdesc"), false, false);
end

local function initArtsuppliesStuff(player, square)
	if player:HasTrait("ArtSupplies") then
	        local artsupplies_bag = player:getInventory():AddItem("Base.Tote");
	        artsupplies_bag:getItemContainer():AddItem("Base.SheetPaper2");
	        artsupplies_bag:getItemContainer():AddItem("Base.SheetPaper2");
	        artsupplies_bag:getItemContainer():AddItem("Base.SheetPaper2");
	        artsupplies_bag:getItemContainer():AddItem("Base.SheetPaper2");
	        artsupplies_bag:getItemContainer():AddItem("Base.SheetPaper2");
	        artsupplies_bag:getItemContainer():AddItem("Base.SheetPaper2");
	        artsupplies_bag:getItemContainer():AddItem("Base.Notebook");
	        artsupplies_bag:getItemContainer():AddItem("Base.Pencil");
	        artsupplies_bag:getItemContainer():AddItem("Base.Pencil");
	        artsupplies_bag:getItemContainer():AddItem("Base.Eraser");
	        artsupplies_bag:getItemContainer():AddItem("Base.Pen");
	        artsupplies_bag:getItemContainer():AddItem("Base.Crayons");
	end
end

Events.OnGameBoot.Add(initArtsuppliesTrait);
Events.OnNewGame.Add(initArtsuppliesStuff);
