require('NPCs/MainCreationMethods');
local function initHikerTrait()	
	local hiker = TraitFactory.addTrait("hiker", getText("UI_trait_Hiker"), 2, getText("UI_trait_HikerDesc"), false, false);
end

Events.OnGameBoot.Add(initHikerTrait);

Events.OnGameStart.Add(function()
	if getPlayer():HasTrait("hiker") then
		local maxWeightBase = getPlayer():getMaxWeightBase();
        getPlayer():setMaxWeightBase(maxWeightBase * 1.5);
    end
end)