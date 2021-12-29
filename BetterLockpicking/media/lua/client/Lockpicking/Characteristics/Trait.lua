
local function initTraits()
	local nimblefingers = TraitFactory.addTrait("nimblefingers", getText("UI_trait_nimblefingers"), 0, getText("UI_trait_nimblefingersDesc"), true);
    nimblefingers:getFreeRecipes():add("Lockpicking");
    nimblefingers:getFreeRecipes():add("Alarm check");
	nimblefingers:getFreeRecipes():add("Create BobbyPin");

	local nimblefingers2 = TraitFactory.addTrait("nimblefingers2", getText("UI_trait_nimblefingers"), 3, getText("UI_trait_nimblefingersDesc"), false, false);
    nimblefingers2:getFreeRecipes():add("Lockpicking");
    nimblefingers2:getFreeRecipes():add("Alarm check");
    nimblefingers2:getFreeRecipes():add("Create BobbyPin");

	TraitFactory.setMutualExclusive("nimblefingers", "nimblefingers2");
end

Events.OnGameBoot.Add(initTraits);