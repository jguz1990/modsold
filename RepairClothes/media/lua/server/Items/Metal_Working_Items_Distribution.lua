require 'Items/SuburbsDistributions'
require "Items/ProceduralDistributions"
require "Vehicles/VehicleDistributions"
	
	table.insert(ProceduralDistributions.list["CrateMetalwork"].items, "Base.MetalworkStation");
	table.insert(ProceduralDistributions.list["CrateMetalwork"].items, 0.01);
	
	-- table.insert(SuburbsDistributions["mechanic"]["metal_shelves"].items, "Base.MetalworkStation");
	-- table.insert(SuburbsDistributions["mechanic"]["metal_shelves"].items, 0.01);