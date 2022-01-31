require "Items/Distributions"
require "Items/ProceduralDistributions"
require "Vehicles/VehicleDistributions"
require "Items/ItemPicker"	

	
	table.insert(ProceduralDistributions.list["KitchenRandom"].items, "Base.Dice");
	table.insert(ProceduralDistributions.list["KitchenRandom"].items, 0.5);
	
	-- table.insert(SuburbsDistributions["bar"]["bin"].items, "Base.Dice");
	-- table.insert(SuburbsDistributions["bar"]["bin"].items, 0.5);		
	table.insert(SuburbsDistributions["all"]["sidetable"].items, "Base.Dice");
	table.insert(SuburbsDistributions["all"]["sidetable"].items, 0.5);		
	-- table.insert(SuburbsDistributions["giftstore"]["shelves"].items, "Base.Dice");
	-- table.insert(SuburbsDistributions["giftstore"]["shelves"].items, 2);	
	-- table.insert(SuburbsDistributions["giftstore"]["displaycase"].items, "Base.Dice");
	-- table.insert(SuburbsDistributions["giftstore"]["displaycase"].items, 2);		
	-- table.insert(SuburbsDistributions["toystore"]["shelves"].items, "Base.Dice");
	-- table.insert(SuburbsDistributions["toystore"]["shelves"].items, 4);	