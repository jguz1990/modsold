require('NPCs/MainCreationMethods');

local function initBookwormTrait()	
	local bookworm = TraitFactory.addTrait("Bookworm", getText("UI_trait_bookworm"), 3, getText("UI_trait_bookwormdesc"), false, false);
end

local function initBookwormStuff(player, square)
	if player:HasTrait("Bookworm") then
	        local bookworm_bag = player:getInventory():AddItem("Base.Bag_Schoolbag");
	        bookworm_bag:getItemContainer():AddItem("Base.BookFirstAid1");
	        bookworm_bag:getItemContainer():AddItem("Base.BookElectrician1");
	        bookworm_bag:getItemContainer():AddItem("Base.BookCooking1");
	        bookworm_bag:getItemContainer():AddItem("Base.BookFarming1");
	        bookworm_bag:getItemContainer():AddItem("Base.BookTailoring1");
	        bookworm_bag:getItemContainer():AddItem("Base.BookForaging1");
	        bookworm_bag:getItemContainer():AddItem("Base.BookMetalWelding1");
	        bookworm_bag:getItemContainer():AddItem("Base.BookBlacksmith1");
	        bookworm_bag:getItemContainer():AddItem("Base.BookCarpentry1");
	        bookworm_bag:getItemContainer():AddItem("Base.BookFishing1");
	        bookworm_bag:getItemContainer():AddItem("Base.BookTrapping1");
	end
end

Events.OnGameBoot.Add(initBookwormTrait);
Events.OnNewGame.Add(initBookwormStuff);
