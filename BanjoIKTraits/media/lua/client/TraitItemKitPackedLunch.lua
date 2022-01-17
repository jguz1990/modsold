require('NPCs/MainCreationMethods');

local function initPackedlunchTrait()	
	local packedlunch = TraitFactory.addTrait("PackedLunch", getText("UI_trait_packedlunch"), 1, getText("UI_trait_packedlunchdesc"), false, false);
end

local function initPackedlunchStuff(player, square)
	if player:HasTrait("PackedLunch") then
	        local packedlunch_bag = player:getInventory():AddItem("Base.Plasticbag");
	        packedlunch_bag:getItemContainer():AddItem("Base.CheeseSandwich");
	        packedlunch_bag:getItemContainer():AddItem("Base.Apple");
	        packedlunch_bag:getItemContainer():AddItem("Base.Yoghurt");
	        packedlunch_bag:getItemContainer():AddItem("Base.Crisps");
	        packedlunch_bag:getItemContainer():AddItem("Base.Chocolate");
	        packedlunch_bag:getItemContainer():AddItem("Base.PopBottle");
	end
end

Events.OnGameBoot.Add(initPackedlunchTrait);
Events.OnNewGame.Add(initPackedlunchStuff);
