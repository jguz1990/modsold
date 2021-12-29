require('NPCs/MainCreationMethods');

local function initFieldmedickitTrait()	
	local fieldmedickit = TraitFactory.addTrait("FieldMedicKit", getText("UI_trait_fieldmedickit"), 2, getText("UI_trait_fieldmedickitdesc"), false, false);
end

local function initFieldmedickitStuff(player, square)
	if player:HasTrait("FieldMedicKit") then
	        local fieldmedickit_bag = player:getInventory():AddItem("Base.FirstAidKit");
	        fieldmedickit_bag:getItemContainer():AddItem("Base.Pills");
	        fieldmedickit_bag:getItemContainer():AddItem("Base.Pills");
	        fieldmedickit_bag:getItemContainer():AddItem("Base.Bandage");
	        fieldmedickit_bag:getItemContainer():AddItem("Base.Bandage");
	        fieldmedickit_bag:getItemContainer():AddItem("Base.Bandage");
	        fieldmedickit_bag:getItemContainer():AddItem("Base.Bandaid");
	        fieldmedickit_bag:getItemContainer():AddItem("Base.Bandaid");
	        fieldmedickit_bag:getItemContainer():AddItem("Base.Splint");
	        fieldmedickit_bag:getItemContainer():AddItem("Base.AlcoholWipes");
	        fieldmedickit_bag:getItemContainer():AddItem("Base.AlcoholWipes");
	        fieldmedickit_bag:getItemContainer():AddItem("Base.CottonBalls");
	        fieldmedickit_bag:getItemContainer():AddItem("Base.CottonBalls");
	        fieldmedickit_bag:getItemContainer():AddItem("Base.Tweezers");
	        fieldmedickit_bag:getItemContainer():AddItem("Base.SutureNeedleHolder");
	        fieldmedickit_bag:getItemContainer():AddItem("Base.SutureNeedle");
	        fieldmedickit_bag:getItemContainer():AddItem("Base.Twine");
	        fieldmedickit_bag:getItemContainer():AddItem("Base.Coldpack");
	        fieldmedickit_bag:getItemContainer():AddItem("Base.Scalpel");
	end
end

Events.OnGameBoot.Add(initFieldmedickitTrait);
Events.OnNewGame.Add(initFieldmedickitStuff);
