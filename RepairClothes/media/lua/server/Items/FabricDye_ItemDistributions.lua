require "Items/Distributions"
require "Items/ProceduralDistributions"
require "Items/ItemPicker"	

	table.insert(ProceduralDistributions.list["BookstoreBooks"].items, "NaturalDyesMag");
	table.insert(ProceduralDistributions.list["BookstoreBooks"].items, 0.1);
	
	table.insert(ProceduralDistributions.list["LibraryBooks"].items, "NaturalDyesMag");
	table.insert(ProceduralDistributions.list["LibraryBooks"].items, 0.1);	
	
	table.insert(ProceduralDistributions.list["PostOfficeBooks"].items, "NaturalDyesMag");
	table.insert(ProceduralDistributions.list["PostOfficeBooks"].items, 0.1);
	
	table.insert(ProceduralDistributions.list["CrateBooks"].items, "NaturalDyesMag");
	table.insert(ProceduralDistributions.list["CrateBooks"].items, 0.1);
	
	ProceduralDistributions.list["SewingStoreTools"] = ProceduralDistributions.list["SewingStoreTools"] or {
        rolls = 4,
        items = {}
    }

	table.insert(ProceduralDistributions.list["SewingStoreTools"].items, "Base.FabricDyeBlack");
	table.insert(ProceduralDistributions.list["SewingStoreTools"].items, 4);
	table.insert(ProceduralDistributions.list["SewingStoreTools"].items, "Base.FabricDyeBlue");
	table.insert(ProceduralDistributions.list["SewingStoreTools"].items, 4);
	table.insert(ProceduralDistributions.list["SewingStoreTools"].items, "Base.FabricDyeGreen");
	table.insert(ProceduralDistributions.list["SewingStoreTools"].items, 4);
	table.insert(ProceduralDistributions.list["SewingStoreTools"].items, "Base.FabricDyeLightBrown");
	table.insert(ProceduralDistributions.list["SewingStoreTools"].items, 4);
	table.insert(ProceduralDistributions.list["SewingStoreTools"].items, "Base.FabricDyePink");
	table.insert(ProceduralDistributions.list["SewingStoreTools"].items, 4);
	table.insert(ProceduralDistributions.list["SewingStoreTools"].items, "Base.FabricDyeRed");
	table.insert(ProceduralDistributions.list["SewingStoreTools"].items, 4);
	table.insert(ProceduralDistributions.list["SewingStoreTools"].items, "Base.FabricDyeYellow");
	table.insert(ProceduralDistributions.list["SewingStoreTools"].items, 4);	
	
	-- table.insert(SuburbsDistributions["sewingstore"]["shelves"].items, "Base.FabricDyeBlack");
	-- table.insert(SuburbsDistributions["sewingstore"]["shelves"].items, 4);
	-- table.insert(SuburbsDistributions["sewingstore"]["shelves"].items, "Base.FabricDyeBlue");
	-- table.insert(SuburbsDistributions["sewingstore"]["shelves"].items, 4);
	-- table.insert(SuburbsDistributions["sewingstore"]["shelves"].items, "Base.FabricDyeGreen");
	-- table.insert(SuburbsDistributions["sewingstore"]["shelves"].items, 4);
	-- table.insert(SuburbsDistributions["sewingstore"]["shelves"].items, "Base.FabricDyeLightBrown");
	-- table.insert(SuburbsDistributions["sewingstore"]["shelves"].items, 4);
	-- table.insert(SuburbsDistributions["sewingstore"]["shelves"].items, "Base.FabricDyePink");
	-- table.insert(SuburbsDistributions["sewingstore"]["shelves"].items, 4);
	-- table.insert(SuburbsDistributions["sewingstore"]["shelves"].items, "Base.FabricDyeRed");
	-- table.insert(SuburbsDistributions["sewingstore"]["shelves"].items, 4);
	-- table.insert(SuburbsDistributions["sewingstore"]["shelves"].items, "Base.FabricDyeYellow");
	-- table.insert(SuburbsDistributions["sewingstore"]["shelves"].items, 4);	
	
	table.insert(SuburbsDistributions["SewingKit"].items, "Base.FabricDyeBlack");
	table.insert(SuburbsDistributions["SewingKit"].items, 0.1);	
	table.insert(SuburbsDistributions["SewingKit"].items, "Base.FabricDyeBlue");
	table.insert(SuburbsDistributions["SewingKit"].items, 0.1);	
	table.insert(SuburbsDistributions["SewingKit"].items, "Base.FabricDyeGreen");
	table.insert(SuburbsDistributions["SewingKit"].items, 0.1);	
	table.insert(SuburbsDistributions["SewingKit"].items, "Base.FabricDyeLightBrown");
	table.insert(SuburbsDistributions["SewingKit"].items, 0.1);	
	table.insert(SuburbsDistributions["SewingKit"].items, "Base.FabricDyePink");
	table.insert(SuburbsDistributions["SewingKit"].items, 0.1);	
	table.insert(SuburbsDistributions["SewingKit"].items, "Base.FabricDyeRed");
	table.insert(SuburbsDistributions["SewingKit"].items, 0.1);	
	table.insert(SuburbsDistributions["SewingKit"].items, "Base.FabricDyeYellow");
	table.insert(SuburbsDistributions["SewingKit"].items, 0.1);		
			
	table.insert(ProceduralDistributions.list["KitchenRandom"].items, "Base.FabricDyeBlack");
	table.insert(ProceduralDistributions.list["KitchenRandom"].items, 0.1);			
	table.insert(ProceduralDistributions.list["KitchenRandom"].items, "Base.FabricDyeBlue");
	table.insert(ProceduralDistributions.list["KitchenRandom"].items, 0.1);			
	table.insert(ProceduralDistributions.list["KitchenRandom"].items, "Base.FabricDyeGreen");
	table.insert(ProceduralDistributions.list["KitchenRandom"].items, 0.1);			
	table.insert(ProceduralDistributions.list["KitchenRandom"].items, "Base.FabricDyeLightBrown");
	table.insert(ProceduralDistributions.list["KitchenRandom"].items, 0.1);			
	table.insert(ProceduralDistributions.list["KitchenRandom"].items, "Base.FabricDyePink");
	table.insert(ProceduralDistributions.list["KitchenRandom"].items, 0.1);			
	table.insert(ProceduralDistributions.list["KitchenRandom"].items, "Base.FabricDyeRed");
	table.insert(ProceduralDistributions.list["KitchenRandom"].items, 0.1);			
	table.insert(ProceduralDistributions.list["KitchenRandom"].items, "Base.FabricDyeYellow");
	table.insert(ProceduralDistributions.list["KitchenRandom"].items, 0.1);	
	
	-- table.insert(SuburbsDistributions["bookstore"]["other"].items, "Base.NaturalDyesMag");
	-- table.insert(SuburbsDistributions["bookstore"]["other"].items, 0.1);	
	-- table.insert(SuburbsDistributions["gardenstore"]["shelves"].items, "Base.NaturalDyesMag");
	-- table.insert(SuburbsDistributions["gardenstore"]["shelves"].items, 0.3);
					
	table.insert(ProceduralDistributions.list["GigamartHousewares"].items, "Base.FabricDyeBlack");
	table.insert(ProceduralDistributions.list["GigamartHousewares"].items, 1);			
	table.insert(ProceduralDistributions.list["GigamartHousewares"].items, "Base.FabricDyeBlue");
	table.insert(ProceduralDistributions.list["GigamartHousewares"].items, 1);			
	table.insert(ProceduralDistributions.list["GigamartHousewares"].items, "Base.FabricDyeGreen");
	table.insert(ProceduralDistributions.list["GigamartHousewares"].items, 1);			
	table.insert(ProceduralDistributions.list["GigamartHousewares"].items, "Base.FabricDyeLightBrown");
	table.insert(ProceduralDistributions.list["GigamartHousewares"].items, 1);			
	table.insert(ProceduralDistributions.list["GigamartHousewares"].items, "Base.FabricDyePink");
	table.insert(ProceduralDistributions.list["GigamartHousewares"].items, 1);			
	table.insert(ProceduralDistributions.list["GigamartHousewares"].items, "Base.FabricDyeRed");
	table.insert(ProceduralDistributions.list["GigamartHousewares"].items, 1);			
	table.insert(ProceduralDistributions.list["GigamartHousewares"].items, "Base.FabricDyeYellow");
	table.insert(ProceduralDistributions.list["GigamartHousewares"].items, 1);	