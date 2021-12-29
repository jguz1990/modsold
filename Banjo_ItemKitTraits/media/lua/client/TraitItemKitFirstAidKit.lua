require('NPCs/MainCreationMethods');

local function initFirstaidkitTrait()	
	local firstaidkit = TraitFactory.addTrait("FirstAidKit", getText("UI_trait_firstaidkit"), 1, getText("UI_trait_firstaidkitdesc"), false, false);
end

local function initFirstaidkitStuff(player, square)
	if player:HasTrait("FirstAidKit") then
	        local firstaidkit_bag = player:getInventory():AddItem("Base.FirstAidKit");
	        firstaidkit_bag:getItemContainer():AddItem("Base.Pills");
	        firstaidkit_bag:getItemContainer():AddItem("Base.Bandage");
	        firstaidkit_bag:getItemContainer():AddItem("Base.Bandaid");
	        firstaidkit_bag:getItemContainer():AddItem("Base.Bandaid");
	        firstaidkit_bag:getItemContainer():AddItem("Base.AlcoholWipes");
	        firstaidkit_bag:getItemContainer():AddItem("Base.CottonBalls");
	        firstaidkit_bag:getItemContainer():AddItem("Base.Tweezers");
	end
end

Events.OnGameBoot.Add(initFirstaidkitTrait);
Events.OnNewGame.Add(initFirstaidkitStuff);
