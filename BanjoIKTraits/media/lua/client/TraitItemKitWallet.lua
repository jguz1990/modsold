require('NPCs/MainCreationMethods');

local function initWalletTrait()	
	local wallet = TraitFactory.addTrait("Wallet", getText("UI_trait_wallet"), 1, getText("UI_trait_walletdesc"), false, false);
end

local function initWalletStuff(player, square)
	if player:HasTrait("Wallet") then
		player:getInventory():AddItem("Base.Wallet2");
		player:getInventory():AddItem("Base.Money");
		player:getInventory():AddItem("Base.CreditCard");
	end
end

Events.OnGameBoot.Add(initWalletTrait);
Events.OnNewGame.Add(initWalletStuff);
