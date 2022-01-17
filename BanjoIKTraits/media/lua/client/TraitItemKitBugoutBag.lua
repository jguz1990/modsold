require('NPCs/MainCreationMethods');

local function initBugoutbagTrait()	
	local bugoutbag = TraitFactory.addTrait("BugoutBag", getText("UI_trait_bugoutbag"), 2, getText("UI_trait_bugoutbagdesc"), false, false);
end

local function initBugoutbagStuff(player, square)
	if player:HasTrait("BugoutBag") then
	        local bugoutbag_bag = player:getInventory():AddItem("Base.Bag_SSO");
	        bugoutbag_bag:getItemContainer():AddItem("Base.HandTorch");
	        bugoutbag_bag:getItemContainer():AddItem("Base.Battery");
	        bugoutbag_bag:getItemContainer():AddItem("Base.HookedWaterBottleFullGreen");
	        bugoutbag_bag:getItemContainer():AddItem("Base.Matches");
	        bugoutbag_bag:getItemContainer():AddItem("Base.MRE");
	        bugoutbag_bag:getItemContainer():AddItem("Base.MRE");
	        bugoutbag_bag:getItemContainer():AddItem("MWPWeapons.khkcombatknife");
	end
end

Events.OnGameBoot.Add(initBugoutbagTrait);
Events.OnNewGame.Add(initBugoutbagStuff);
