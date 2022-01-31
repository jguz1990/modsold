require "Items/Distributions"
require "Items/ProceduralDistributions"
require "Vehicles/VehicleDistributions"
require "Items/ItemPicker"

if ProceduralDistributions.list.MedicalClinicDrugs then
	table.insert(ProceduralDistributions.list["MedicalClinicDrugs"].items, "Base.SyringeEmpty");
	table.insert(ProceduralDistributions.list["MedicalClinicDrugs"].items, 1);	
	
	table.insert(ProceduralDistributions.list["MedicalClinicTools"].items, "Base.SyringeEmpty");
	table.insert(ProceduralDistributions.list["MedicalClinicTools"].items, 1);	
	
	table.insert(ProceduralDistributions.list["MedicalStorageDrugs"].items, "Base.SyringeEmpty");
	table.insert(ProceduralDistributions.list["MedicalStorageDrugs"].items, 1);	
	
	table.insert(ProceduralDistributions.list["MedicalStorageTools"].items, "Base.SyringeEmpty");
	table.insert(ProceduralDistributions.list["MedicalStorageTools"].items, 1);	
end	
	-- table.insert(SuburbsDistributions["medicalstorage"]["counter"].items, "Base.SyringeEmpty");
	-- table.insert(SuburbsDistributions["medicalstorage"]["counter"].items, 1);	
	-- table.insert(SuburbsDistributions["medicalstorage"]["metal_shelves"].items, "Base.SyringeEmpty");
	-- table.insert(SuburbsDistributions["medicalstorage"]["metal_shelves"].items, 1);	
	
	-- table.insert(SuburbsDistributions["medical"]["counter"].items, "Base.SyringeEmpty");
	-- table.insert(SuburbsDistributions["medical"]["counter"].items, 1);		
	-- table.insert(SuburbsDistributions["medical"]["metal_shelves"].items, "Base.SyringeEmpty");
	-- table.insert(SuburbsDistributions["medical"]["metal_shelves"].items, 1);	
		
	-- table.insert(SuburbsDistributions["medicaloffice"]["counter"].items, "Base.SyringeEmpty");
	-- table.insert(SuburbsDistributions["medicaloffice"]["counter"].items, 1);	
	-- table.insert(SuburbsDistributions["medicaloffice"]["metal_shelves"].items, "Base.SyringeEmpty");
	-- table.insert(SuburbsDistributions["medicaloffice"]["metal_shelves"].items, 1);
	
	table.insert(ProceduralDistributions.list["WardrobeRedneck"].items, "Base.SyringeEmpty");
	table.insert(ProceduralDistributions.list["WardrobeRedneck"].items, 0.1);	
	table.insert(ProceduralDistributions.list["WardrobeRedneck"].items, "Base.SyringeBroken");
	table.insert(ProceduralDistributions.list["WardrobeRedneck"].items, 0.1);
	
	table.insert(SuburbsDistributions["all"]["bin"].items, "Base.SyringeEmpty");
	table.insert(SuburbsDistributions["all"]["bin"].items, 0.1);	
	table.insert(SuburbsDistributions["all"]["bin"].items, "Base.SyringeBroken");
	table.insert(SuburbsDistributions["all"]["bin"].items, 0.1);
	-- table.insert(SuburbsDistributions["bar"]["bin"].items, "Base.SyringeEmpty");
	-- table.insert(SuburbsDistributions["bar"]["bin"].items, 0.1);
	-- table.insert(SuburbsDistributions["bar"]["bin"].items, "Base.SyringeBroken");
	-- table.insert(SuburbsDistributions["bar"]["bin"].items, 0.1);	
	-- table.insert(SuburbsDistributions["bar"]["bin"].items, "Base.SyringeEmpty");
	-- table.insert(SuburbsDistributions["bar"]["bin"].items, 0.1);
	-- table.insert(SuburbsDistributions["bar"]["bin"].items, "Base.SyringeBroken");
	-- table.insert(SuburbsDistributions["bar"]["bin"].items, 0.1);		
	table.insert(SuburbsDistributions["motelroom"]["bin"].items, "Base.SyringeEmpty");
	table.insert(SuburbsDistributions["motelroom"]["bin"].items, 0.1);	
	table.insert(SuburbsDistributions["motelroom"]["bin"].items, "Base.SyringeBroken");
	table.insert(SuburbsDistributions["motelroom"]["bin"].items, 0.1);		
	-- table.insert(SuburbsDistributions["motelroomoccupied"]["bin"].items, "Base.SyringeEmpty");
	-- table.insert(SuburbsDistributions["motelroomoccupied"]["bin"].items, 0.1);	
	-- table.insert(SuburbsDistributions["motelroomoccupied"]["bin"].items, "Base.SyringeBroken");
	-- table.insert(SuburbsDistributions["motelroomoccupied"]["bin"].items, 0.1);
	-- table.insert(SuburbsDistributions["grocerystorage"]["bin"].items, "Base.SyringeEmpty");
	-- table.insert(SuburbsDistributions["grocerystorage"]["bin"].items, 0.1);	
	-- table.insert(SuburbsDistributions["grocerystorage"]["bin"].items, "Base.SyringeBroken");
	-- table.insert(SuburbsDistributions["grocerystorage"]["bin"].items, 0.1);	
	-- table.insert(SuburbsDistributions["cafe"]["bin"].items, "Base.SyringeEmpty");
	-- table.insert(SuburbsDistributions["cafe"]["bin"].items, 0.1);	
	-- table.insert(SuburbsDistributions["cafe"]["bin"].items, "Base.SyringeBroken");
	-- table.insert(SuburbsDistributions["cafe"]["bin"].items, 0.1);	