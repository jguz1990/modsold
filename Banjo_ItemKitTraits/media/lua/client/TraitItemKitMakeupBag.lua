require('NPCs/MainCreationMethods');

local function initMakeupbagTrait()	
	local makeupbag = TraitFactory.addTrait("MakeupBag", getText("UI_trait_makeupbag"), 1, getText("UI_trait_makeupbagdesc"), false, false);
end

local function initMakeupbagStuff(player, square)
	if player:HasTrait("MakeupBag") then
	        local makeupbag_bag = player:getInventory():AddItem("Base.Purse");
	        makeupbag_bag:getItemContainer():AddItem("Base.Comb");
	        makeupbag_bag:getItemContainer():AddItem("Base.Mirror");
	        makeupbag_bag:getItemContainer():AddItem("Base.Tweezers");
	        makeupbag_bag:getItemContainer():AddItem("Base.Tissue");
	        makeupbag_bag:getItemContainer():AddItem("Base.Hairspray");
	        makeupbag_bag:getItemContainer():AddItem("Base.Lipstick");
	        makeupbag_bag:getItemContainer():AddItem("Base.MakeupFoundation");
	        makeupbag_bag:getItemContainer():AddItem("Base.MakeupEyeshadow");
	        makeupbag_bag:getItemContainer():AddItem("Base.Perfume");
	        makeupbag_bag:getItemContainer():AddItem("Base.Pencil");
	end
end

Events.OnGameBoot.Add(initMakeupbagTrait);
Events.OnNewGame.Add(initMakeupbagStuff);
