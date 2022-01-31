require "Items/Distributions"
require "Items/ProceduralDistributions"
require "Items/ItemPicker"	
ProceduralDistributions.list["SewingStoreFabric"] = ProceduralDistributions.list["SewingStoreFabric"] or {
        rolls = 4,
        items = {}
    }
	table.insert(ProceduralDistributions.list["SewingStoreFabric"].items, "Base.Yarn");
	table.insert(ProceduralDistributions.list["SewingStoreFabric"].items, 4);
	table.insert(ProceduralDistributions.list["SewingStoreFabric"].items, "Base.Yarn");
	table.insert(ProceduralDistributions.list["SewingStoreFabric"].items, 4);
	table.insert(ProceduralDistributions.list["SewingStoreFabric"].items, "Base.Yarn");
	table.insert(ProceduralDistributions.list["SewingStoreFabric"].items, 4);
	table.insert(ProceduralDistributions.list["SewingStoreFabric"].items, "Base.Yarn");
	table.insert(ProceduralDistributions.list["SewingStoreFabric"].items, 4);
	
	
	-- table.insert(SuburbsDistributions["sewingstore"]["counter"].items, "Base.Yarn");
	-- table.insert(SuburbsDistributions["sewingstore"]["counter"].items, 4);
	-- table.insert(SuburbsDistributions["sewingstore"]["counter"].items, "Base.Yarn");
	-- table.insert(SuburbsDistributions["sewingstore"]["counter"].items, 4);
	-- table.insert(SuburbsDistributions["sewingstore"]["counter"].items, "Base.Yarn");
	-- table.insert(SuburbsDistributions["sewingstore"]["counter"].items, 4);
	
	-- table.insert(SuburbsDistributions["sewingstore"]["shelves"].items, "Base.Yarn");
	-- table.insert(SuburbsDistributions["sewingstore"]["shelves"].items, 4);	
	-- table.insert(SuburbsDistributions["sewingstore"]["shelves"].items, "Base.Yarn");
	-- table.insert(SuburbsDistributions["sewingstore"]["shelves"].items, 4);	
	-- table.insert(SuburbsDistributions["sewingstore"]["shelves"].items, "Base.Yarn");
	-- table.insert(SuburbsDistributions["sewingstore"]["shelves"].items, 4);	
	-- table.insert(SuburbsDistributions["sewingstore"]["shelves"].items, "Base.Yarn");
	-- table.insert(SuburbsDistributions["sewingstore"]["shelves"].items, 4);
	
	-- table.insert(SuburbsDistributions["housewarestore"]["shelves"].items, "Base.Yarn");
	-- table.insert(SuburbsDistributions["housewarestore"]["shelves"].items, 0.4);	
	-- table.insert(SuburbsDistributions["housewarestore"]["shelves"].items, "Base.Yarn");
	-- table.insert(SuburbsDistributions["housewarestore"]["shelves"].items, 0.4);	
	-- table.insert(SuburbsDistributions["housewarestore"]["shelves"].items, "Base.Yarn");
	-- table.insert(SuburbsDistributions["housewarestore"]["shelves"].items, 0.4);	
	-- table.insert(SuburbsDistributions["housewarestore"]["shelves"].items, "Base.Yarn");
	-- table.insert(SuburbsDistributions["housewarestore"]["shelves"].items, 0.4);
	
	table.insert(SuburbsDistributions["SewingKit"].items, "Base.Yarn");
	table.insert(SuburbsDistributions["SewingKit"].items, 0.1);	
			
	table.insert(ProceduralDistributions.list["KitchenRandom"].items, "Base.Yarn");
	table.insert(ProceduralDistributions.list["KitchenRandom"].items, 0.1);	
			
	table.insert(ProceduralDistributions.list["GigamartHousewares"].items, "Base.Yarn");
	table.insert(ProceduralDistributions.list["GigamartHousewares"].items, 1);				
	table.insert(ProceduralDistributions.list["GigamartHousewares"].items, "Base.Yarn");
	table.insert(ProceduralDistributions.list["GigamartHousewares"].items, 1);			
	table.insert(ProceduralDistributions.list["GigamartHousewares"].items, "Base.Yarn");
	table.insert(ProceduralDistributions.list["GigamartHousewares"].items, 1);			
	table.insert(ProceduralDistributions.list["GigamartHousewares"].items, "Base.Yarn");
	table.insert(ProceduralDistributions.list["GigamartHousewares"].items, 1);	