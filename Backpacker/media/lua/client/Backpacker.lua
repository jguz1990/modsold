require('NPCs/MainCreationMethods');
local function initBackpackerTrait()	
	local backpacker = TraitFactory.addTrait("backpacker", getText("UI_trait_Backpacker"), 2, getText("UI_trait_BackpackerDesc"), false, false);
end

Events.OnGameBoot.Add(initBackpackerTrait);

Events.OnGameStart.Add(function()
	if getPlayer():HasTrait("backpacker") then
		local maxWeightBase = getPlayer():getMaxWeightBase();
        getPlayer():setMaxWeightBase(maxWeightBase * 1.5);
    end
end)