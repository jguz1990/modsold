require('NPCs/MainCreationMethods');

local function initSewingkitTrait()	
	local sewingkit = TraitFactory.addTrait("SewingKit", getText("UI_trait_sewingkit"), 1, getText("UI_trait_sewingkitdesc"), false, false);
end

local function initSewingkitStuff(player, square)
	if player:HasTrait("SewingKit") then
	        local sewingkit_bag = player:getInventory():AddItem("Base.SewingKit");
	        sewingkit_bag:getItemContainer():AddItem("Base.Needle");
	        sewingkit_bag:getItemContainer():AddItem("Base.Scissors");
	        sewingkit_bag:getItemContainer():AddItem("Base.Thread");
	        sewingkit_bag:getItemContainer():AddItem("Base.Thread");
	        sewingkit_bag:getItemContainer():AddItem("Base.Thread");
	        sewingkit_bag:getItemContainer():AddItem("Base.Twine");
	        sewingkit_bag:getItemContainer():AddItem("Base.Button");
	        sewingkit_bag:getItemContainer():AddItem("Base.Button");
	        sewingkit_bag:getItemContainer():AddItem("Base.Button");
	        sewingkit_bag:getItemContainer():AddItem("Base.Button");
	        sewingkit_bag:getItemContainer():AddItem("Base.Button");
	        sewingkit_bag:getItemContainer():AddItem("Base.Button");
	end
end

Events.OnGameBoot.Add(initSewingkitTrait);
Events.OnNewGame.Add(initSewingkitStuff);
