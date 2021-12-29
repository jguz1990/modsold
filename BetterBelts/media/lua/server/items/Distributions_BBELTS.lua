Distributions = Distributions or {};

-- Function made by star -- 
local function AddProcLoot(proc_name, item_name, chance)
	local data = ProceduralDistributions.list
	if not data then
		 return print('Better Belts ERROR: procedure distributions not found!')
	end
	local c = data[proc_name];
	if not c then
		 return print('Better Belts ERROR: cant add '..item_name..' to procedure '..proc_name)
	end
	table.insert(c.items, item_name);
	table.insert(c.items, chance);
end

AddProcLoot("MedicalClinicTools","BetterBelts.AFAK", 10);		    -- medclinic/pharmacystorage // 10
AddProcLoot("ArmyStorageMedical","BetterBelts.AFAK", 7);  			 -- army medical // 7

AddProcLoot("CrateRandomJunk","BetterBelts.HookB", 0.5);   	       -- junk crate   // 0.5
AddProcLoot("ToolStoreMisc","BetterBelts.HookB", 1);               -- tool store    // 1
AddProcLoot("ToolStoreMetalwork","BetterBelts.HookB", 1);          -- tool store metalwork   // 1
AddProcLoot("CampingStoreGear","BetterBelts.HookB", 1);    		    -- camping store gear   // 1
AddProcLoot("CrateMetalwork","BetterBelts.HookB", 1);      		    -- metalwork crate   // 1
AddProcLoot("CrateCamping","BetterBelts.HookB", 2);       			 -- camping crate   // 2
AddProcLoot("GarageTools","BetterBelts.HookB", 2);         			 -- shed/garagestorage/garage // 2
AddProcLoot("GarageMetalwork","BetterBelts.HookB", 2);      	    -- garage metalworw  // 2
AddProcLoot("StoreCounterBagsFancy","BetterBelts.HookB", 3);   	 -- clothesstore      // 3
AddProcLoot("GigamartTools","BetterBelts.HookB", 4);               -- tools    // 4

