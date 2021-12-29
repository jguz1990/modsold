require('NPCs/MainCreationMethods');

local function initHomepharmacyTrait()	
	local homepharmacy = TraitFactory.addTrait("HomePharmacy", getText("UI_trait_homepharmacy"), 2, getText("UI_trait_homepharmacydesc"), false, false);
end

local function initHomepharmacyStuff(player, square)
	if player:HasTrait("HomePharmacy") then
	        local homepharmacy_bag = player:getInventory():AddItem("Base.Tote");
	        homepharmacy_bag:getItemContainer():AddItem("Base.Pills");
	        homepharmacy_bag:getItemContainer():AddItem("Base.Pills");
	        homepharmacy_bag:getItemContainer():AddItem("Base.PillsAntiDep");
	        homepharmacy_bag:getItemContainer():AddItem("Base.PillsAntiDep");
	        homepharmacy_bag:getItemContainer():AddItem("Base.PillsBeta");
	        homepharmacy_bag:getItemContainer():AddItem("Base.PillsBeta");
	        homepharmacy_bag:getItemContainer():AddItem("Base.PillsSleepingTablets");
	        homepharmacy_bag:getItemContainer():AddItem("Base.PillsSleepingTablets");
	        homepharmacy_bag:getItemContainer():AddItem("Base.PillsVitamins");
	        homepharmacy_bag:getItemContainer():AddItem("Base.PillsVitamins");
	end
end

Events.OnGameBoot.Add(initHomepharmacyTrait);
Events.OnNewGame.Add(initHomepharmacyStuff);
