require('NPCs/MainCreationMethods');

local function initDirtyharryTrait()	
	local dirtyharry = TraitFactory.addTrait("DirtyHarry", getText("UI_trait_dirtyharry"), 2, getText("UI_trait_dirtyharrydesc"), false, false);
end

local function initDirtyharryStuff(player, square)
	if player:HasTrait("DirtyHarry") then
		player:getInventory():AddItem("Base.Revolver_Long");
		player:getInventory():AddItem("Base.Bullets44Box");
	end
end

Events.OnGameBoot.Add(initDirtyharryTrait);
Events.OnNewGame.Add(initDirtyharryStuff);
