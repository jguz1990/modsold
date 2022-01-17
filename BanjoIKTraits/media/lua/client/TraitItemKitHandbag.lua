require('NPCs/MainCreationMethods');

local function initHandbagTrait()	
	local handbag = TraitFactory.addTrait("Handbag", getText("UI_trait_handbag"), 1, getText("UI_trait_handbagdesc"), false, false);
end

local function initHandbagStuff(player, square)
	if player:HasTrait("Handbag") then
	        local handbag_bag = player:getInventory():AddItem("Base.Purse");
	        handbag_bag:getItemContainer():AddItem("Base.Comb");
	        handbag_bag:getItemContainer():AddItem("Base.Lipstick");
	        handbag_bag:getItemContainer():AddItem("Base.MakeupFoundation");
	        handbag_bag:getItemContainer():AddItem("Base.Pen");
	        handbag_bag:getItemContainer():AddItem("Base.Wallet4");
	        handbag_bag:getItemContainer():AddItem("Base.CreditCard");
	        handbag_bag:getItemContainer():AddItem("Base.Money");
	end
end

Events.OnGameBoot.Add(initHandbagTrait);
Events.OnNewGame.Add(initHandbagStuff);
