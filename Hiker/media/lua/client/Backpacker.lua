require('NPCs/MainCreationMethods');
local function initStrongbackTrait()	
	local strongback = TraitFactory.addTrait("strongback", getText("UI_trait_Strongback"), 2, getText("UI_trait_StrongbackDesc"), false, false);
end

Events.OnGameBoot.Add(initStrongbackTrait);

Events.OnGameStart.Add(function()
	if getPlayer():HasTrait("strongback") then
		local maxWeightBase = getPlayer():getMaxWeightBase();
        getPlayer():setMaxWeightBase(maxWeightBase * 2);
    end
end)