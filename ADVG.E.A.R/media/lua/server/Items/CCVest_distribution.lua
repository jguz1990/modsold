require "Items/Distributions"
require "Items/ItemPicker"
require "Items/ProceduralDistributions"
require "Vehicles/VehicleDistributions"


	-- table.insert(SuburbsDistributions["policestorage"]["locker"].items, "CCVest");
	-- table.insert(SuburbsDistributions["policestorage"]["locker"].items, 1);	
	
	-- table.insert(SuburbsDistributions["policestorage"]["metal_shelves"].items, "CCVest");
	-- table.insert(SuburbsDistributions["policestorage"]["metal_shelves"].items, 1);		
		
	table.insert(ProceduralDistributions.list["PoliceStorageOutfit"].items, "CCVest");
	table.insert(ProceduralDistributions.list["PoliceStorageOutfit"].items, 1);

	-- table.insert(SuburbsDistributions["gunstore"]["locker"].items, "CCVest");
	-- table.insert(SuburbsDistributions["gunstore"]["locker"].items, 1);
	
	-- table.insert(SuburbsDistributions["gunstore"]["shelves"].items, "CCVest");
	-- table.insert(SuburbsDistributions["gunstore"]["shelves"].items, 0.5);
	
	-- table.insert(SuburbsDistributions["gunstore"]["displaycase"].items, "CCVest");
	-- table.insert(SuburbsDistributions["gunstore"]["displaycase"].items, 1);	
		
	table.insert(ProceduralDistributions.list["GunStoreShelf"].items, "CCVest");
	table.insert(ProceduralDistributions.list["GunStoreShelf"].items, 0.5);

	-- table.insert(SuburbsDistributions["armysurplus"]["shelves"].items, "CCVest");
	-- table.insert(SuburbsDistributions["armysurplus"]["shelves"].items, 1);	
	
	-- table.insert(SuburbsDistributions["armysurplus"]["clothingrack"].items, "CCVest");
	-- table.insert(SuburbsDistributions["armysurplus"]["clothingrack"].items, 1);	
	
	table.insert(ProceduralDistributions.list["ArmySurplusOutfit"].items, "CCVest");
	table.insert(ProceduralDistributions.list["ArmySurplusOutfit"].items, 1);
	
	table.insert(ProceduralDistributions.list["WardrobeRedneck"].items, "CCVest");
	table.insert(ProceduralDistributions.list["WardrobeRedneck"].items, 1.0);	
		
	table.insert(VehicleDistributions["Police"]["TruckBed"].items, "CCVest");
	table.insert(VehicleDistributions["Police"]["TruckBed"].items, 0.1);	