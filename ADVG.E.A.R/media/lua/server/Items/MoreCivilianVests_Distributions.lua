require "Items/Distributions"
require "Vehicles/VehicleDistributions"
require "Items/ItemPicker"
			
	table.insert(VehicleDistributions["DoctorTruckBed"].items, "Base.Vest_BulletEMS");
	table.insert(VehicleDistributions["DoctorTruckBed"].items, 2);	
	
	
	table.insert(VehicleDistributions["Fire"]["TruckBed"].items, "Base.Vest_BulletFire");
	table.insert(VehicleDistributions["Fire"]["TruckBed"].items, 2);	
	table.insert(VehicleDistributions["Fire"]["SeatRearLeft"].items, "Base.Vest_BulletFire");
	table.insert(VehicleDistributions["Fire"]["SeatRearLeft"].items, 0.1);	
	table.insert(VehicleDistributions["Fire"]["SeatRearRight"].items, "Base.Vest_BulletFire");
	table.insert(VehicleDistributions["Fire"]["SeatRearRight"].items, 0.1);		
	
	table.insert(ProceduralDistributions.list["FireStorageOutfit"].items, "Base.Vest_BulletFire");
	table.insert(ProceduralDistributions.list["FireStorageOutfit"].items, 1);	
	
	
	table.insert(VehicleDistributions["Radio"]["TruckBed"].items, "Base.Vest_BulletPress");
	table.insert(VehicleDistributions["Radio"]["TruckBed"].items, 5);	
	table.insert(VehicleDistributions["Radio"]["SeatRearLeft"].items, "Base.Vest_BulletPress");
	table.insert(VehicleDistributions["Radio"]["SeatRearLeft"].items, 0.1);		
	table.insert(VehicleDistributions["Radio"]["SeatRearRight"].items, "Base.Vest_BulletPress");
	table.insert(VehicleDistributions["Radio"]["SeatRearRight"].items, 0.1);			
	
		
	-- table.insert(SuburbsDistributions["armysurplus"]["clothingrack"].items, "Base.Vest_BulletEMS");
	-- table.insert(SuburbsDistributions["armysurplus"]["clothingrack"].items, 1);	
	-- table.insert(SuburbsDistributions["armysurplus"]["clothingrack"].items, "Base.Vest_BulletFire");
	-- table.insert(SuburbsDistributions["armysurplus"]["clothingrack"].items, 1);	
	-- table.insert(SuburbsDistributions["armysurplus"]["clothingrack"].items, "Base.Vest_BulletPress");
	-- table.insert(SuburbsDistributions["armysurplus"]["clothingrack"].items, 1);	
			
	-- table.insert(SuburbsDistributions["armysurplus"]["shelves"].items, "Base.Vest_BulletEMS");
	-- table.insert(SuburbsDistributions["armysurplus"]["shelves"].items, 1);	
	-- table.insert(SuburbsDistributions["armysurplus"]["shelves"].items, "Base.Vest_BulletFire");
	-- table.insert(SuburbsDistributions["armysurplus"]["shelves"].items, 1);	
	-- table.insert(SuburbsDistributions["armysurplus"]["shelves"].items, "Base.Vest_BulletPress");
	-- table.insert(SuburbsDistributions["armysurplus"]["shelves"].items, 1);	
			
	table.insert(ProceduralDistributions.list["ArmySurplusOutfit"].items, "Base.Vest_BulletEMS");
	table.insert(ProceduralDistributions.list["ArmySurplusOutfit"].items, 1);	
	table.insert(ProceduralDistributions.list["ArmySurplusOutfit"].items, "Base.Vest_BulletFire");
	table.insert(ProceduralDistributions.list["ArmySurplusOutfit"].items, 1);	
	table.insert(ProceduralDistributions.list["ArmySurplusOutfit"].items, "Base.Vest_BulletPress");
	table.insert(ProceduralDistributions.list["ArmySurplusOutfit"].items, 1);		
	
	table.insert(ProceduralDistributions.list["GunStoreShelf"].items, "Base.Vest_BulletEMS");
	table.insert(ProceduralDistributions.list["GunStoreShelf"].items, 1);	
	table.insert(ProceduralDistributions.list["GunStoreShelf"].items, "Base.Vest_BulletFire");
	table.insert(ProceduralDistributions.list["GunStoreShelf"].items, 1);	
	table.insert(ProceduralDistributions.list["GunStoreShelf"].items, "Base.Vest_BulletPress");
	table.insert(ProceduralDistributions.list["GunStoreShelf"].items, 1);	