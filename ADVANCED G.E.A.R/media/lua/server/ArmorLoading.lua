require "Items/Distributions"
require "Items/ItemPicker"
require "Items/ProceduralDistributions"
require "Vehicles/VehicleDistributions"

-- AArmor = {}
-- AArmor.getSprites = function()
	-- getTexture("Item_BicycleHelmet.png");
	-- print("Textures and Sprites Loaded.");
-- end

	-- table.insert(SuburbsDistributions["policestorage"]["locker"].items, "Base.Hat_RiotHelmet");
	-- table.insert(SuburbsDistributions["policestorage"]["locker"].items, 1);	
	-- table.insert(SuburbsDistributions["policestorage"]["locker"].items, "Base.Vest_BulletPolice");
	-- table.insert(SuburbsDistributions["policestorage"]["locker"].items, 1);
	-- table.insert(SuburbsDistributions["policestorage"]["locker"].items, "Base.Shoes_ArmyBoots");
	-- table.insert(SuburbsDistributions["policestorage"]["locker"].items, 1);
	
	-- table.insert(SuburbsDistributions["policestorage"]["metal_shelves"].items, "Base.Hat_RiotHelmet");
	-- table.insert(SuburbsDistributions["policestorage"]["metal_shelves"].items, 1);	
	-- table.insert(SuburbsDistributions["policestorage"]["metal_shelves"].items, "Base.Vest_BulletPolice");
	-- table.insert(SuburbsDistributions["policestorage"]["metal_shelves"].items, 1);
	-- table.insert(SuburbsDistributions["policestorage"]["metal_shelves"].items, "Base.Shoes_ArmyBoots");
	-- table.insert(SuburbsDistributions["policestorage"]["metal_shelves"].items, 1);
	
	table.insert(ProceduralDistributions.list["PoliceStorageOutfit"].items, "Base.Hat_RiotHelmet");
	table.insert(ProceduralDistributions.list["PoliceStorageOutfit"].items, 1);	
	table.insert(ProceduralDistributions.list["PoliceStorageOutfit"].items, "Base.Shoes_ArmyBoots");
	table.insert(ProceduralDistributions.list["PoliceStorageOutfit"].items, 1);
	
	
	-- table.insert(SuburbsDistributions["gunstore"]["locker"].items, "Base.Hat_Army");
	-- table.insert(SuburbsDistributions["gunstore"]["locker"].items, 1);
	-- table.insert(SuburbsDistributions["gunstore"]["locker"].items, "Base.Vest_BulletArmy");
	-- table.insert(SuburbsDistributions["gunstore"]["locker"].items, 1);	
	-- table.insert(SuburbsDistributions["gunstore"]["locker"].items, "Base.Jacket_ArmyCamoGreen");
	-- table.insert(SuburbsDistributions["gunstore"]["locker"].items, 1);
	-- table.insert(SuburbsDistributions["gunstore"]["locker"].items, "Base.Shoes_ArmyBoots");
	-- table.insert(SuburbsDistributions["gunstore"]["locker"].items, 1);	
	-- table.insert(SuburbsDistributions["gunstore"]["locker"].items, "Base.Trousers_CamoGreen");
	-- table.insert(SuburbsDistributions["gunstore"]["locker"].items, 1);	
	
	table.insert(ProceduralDistributions.list["GunStoreShelf"].items, "Base.Vest_BulletArmy");
	table.insert(ProceduralDistributions.list["GunStoreShelf"].items, 1);	
	

	table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.Hat_Army");
	table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 1);
	table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.Vest_BulletArmy");
	table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 1);
	table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.Jacket_ArmyCamoGreen");
	table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 1);	
	table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.Shoes_ArmyBoots");
	table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 1);
	table.insert(ProceduralDistributions.list["FirearmWeapons"].items, "Base.Trousers_CamoGreen");
	table.insert(ProceduralDistributions.list["FirearmWeapons"].items, 1);	
	
	table.insert(ProceduralDistributions.list["MeleeWeapons"].items, "Base.Hat_Army");
	table.insert(ProceduralDistributions.list["MeleeWeapons"].items, 1);
	table.insert(ProceduralDistributions.list["MeleeWeapons"].items,  "Base.Vest_BulletArmy");
	table.insert(ProceduralDistributions.list["MeleeWeapons"].items,  1);
	table.insert(ProceduralDistributions.list["MeleeWeapons"].items,  "Base.Jacket_ArmyCamoGreen");
	table.insert(ProceduralDistributions.list["MeleeWeapons"].items,  1);	
	table.insert(ProceduralDistributions.list["MeleeWeapons"].items,  "Base.Shoes_ArmyBoots");
	table.insert(ProceduralDistributions.list["MeleeWeapons"].items, 1);	
	table.insert(ProceduralDistributions.list["MeleeWeapons"].items, "Base.Trousers_CamoGreen");
	table.insert(ProceduralDistributions.list["MeleeWeapons"].items, 1);		
	
	table.insert(SuburbsDistributions["Bag_WeaponBag"].items, "Base.Hat_Army");
	table.insert(SuburbsDistributions["Bag_WeaponBag"].items, 1);
	table.insert(SuburbsDistributions["Bag_WeaponBag"].items, "Base.Vest_BulletArmy");
	table.insert(SuburbsDistributions["Bag_WeaponBag"].items, 1);
	table.insert(SuburbsDistributions["Bag_WeaponBag"].items, "Base.Jacket_ArmyCamoGreen");
	table.insert(SuburbsDistributions["Bag_WeaponBag"].items, 1);
	table.insert(SuburbsDistributions["Bag_WeaponBag"].items, "Base.Shoes_ArmyBoots");
	table.insert(SuburbsDistributions["Bag_WeaponBag"].items, 1);
	table.insert(SuburbsDistributions["Bag_WeaponBag"].items, "Base.Trousers_CamoGreen");
	table.insert(SuburbsDistributions["Bag_WeaponBag"].items, 1);	

	
-- print("SuburbsDistributions added. ");
-- Events.OnPreMapLoad.Add(AArmor.getSprites);