require('NPCs/MainCreationMethods');

local function initGasguzzlerTrait()	
	local gasguzzler = TraitFactory.addTrait("Gasguzzler", getText("UI_trait_gasguzzler"), 1, getText("UI_trait_gasguzzlerdesc"), false, false);
end

local function initGasguzzlerStuff(player, square)
	if player:HasTrait("Gasguzzler") then
		player:getInventory():AddItem("Base.PetrolCan");
	end
end

Events.OnGameBoot.Add(initGasguzzlerTrait);
Events.OnNewGame.Add(initGasguzzlerStuff);
