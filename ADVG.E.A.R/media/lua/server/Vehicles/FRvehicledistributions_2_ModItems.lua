require "Vehicles/VehicleDistributions"
-- require "Vehicles/FRvehicledistributions"
-- pull the vehicle distributions into a local table
--local distributionTable = VehicleDistributions[1]
--local distributionTable = {}

if VehicleDistributions.Military then
	
	local distributionTable = VehicleDistributions[1]
	VehicleDistributions.Military.GloveBox = VehicleDistributions.Military.GloveBox or {
		rolls = 1,
		items = {
			"Cigarettes", 7,
			"HandTorch", 5,
			"Battery", 7,
			"BeefJerky", 7,
			"Pills", 5,
			"AlcoholWipes", 7,
			"Bandage", 5,
			"Radio.WalkieTalkie5", 5,
			"Pistol", 0.25,
			"Pistol2", 0.25,
			"HuntingKnife", 0.25,
			"Glasses_Sun", 0.25,
			"Glasses_Aviators", 0.1,
			"Gloves_LeatherGlovesBlack", 0.1,
			"Gloves_LeatherGloves", 0.25,
			"Base.MuldraughMap", 5,
			"Base.WestpointMap", 5,
			"Base.MarchRidgeMap", 5,
			"Base.RosewoodMap", 5,
			"Base.RiversideMap", 5,		
			"Leatherdad",1,
			"Brushkit",1,
			"Maintkit",1,
			"SmokeGrenade",3,
			"SmokeGrenade",3,
			"IncendiaryGrenade",1,
			"MRE",3,
			"P38DT",1,
			"ConcussionGrenade",3,
			"Explosives.LandMine",0.1,
			"Flashlight_Military",1,
			"Canteen",3,
			"Canteenfull",3,
			"PLGR",0.1,
			"Base.HolsterPLL2M",1,
			"Base.BeltRig",0.1,
			"CSword.TacticalKnife", 1,
			"eris_nvg.nvgoggles41",0.001,
		},
		junk = {
			rolls = 1,
			items = {
				"Notebook", 10,
				"Magazine", 7,
				"Newspaper", 7,
				"Pen", 5,
				"BluePen", 5,
				"RedPen", 5,
				"Pencil", 5,
				"Eraser", 5,
				"RubberBand", 5,
				"Lighter", 5,
				"Matches", 7,
				"Paperclip", 5,
				"ToiletPaper", 3,
				"Cockroach", 1,
				"LabKeycard", 0.1,
				"IntelFolder", 0.1,
			}
		}
	}


	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, "SniperVeil");
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, 0.1);
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, "Brushkit");
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, 1);	
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, "Maintkit");
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, 1);	
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, "SmokeGrenade");
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, 3);	
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, "SmokeGrenade");
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, 3);	
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, "IncendiaryGrenade");
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, 1);	
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, "ConcussionGrenade");
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, 3);	
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, "Explosives.LandMine");
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, 0.1);	
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, "Explosives.LandMineBox");
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, 0.1);	
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, "Flashlight_Military");
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, 1);	
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, "Canteen");
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, 3);	
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, "Canteenfull");
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, 3);		
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, "MRE");
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, 1);	
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, "MRE_Box");
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, 1);	
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, "Leatherdad");
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, 0.1);		
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, "Base.HolsterPLL2M");
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, 1);	
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, "PLGR");
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, 0.1);	
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, "RogueWaistBag");
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, 0.1);	
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, "Base.strapchest");
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, 0.1);	
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, "Base.MVest");
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, 0.1);	
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, "Base.medbag");
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, 0.1);	
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, "Base.medbag2");
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, 0.1);	
	-- table.insert(VehicleDistributions["MilitaryGearTrunk"].items, "Base.smallback");
	-- table.insert(VehicleDistributions["MilitaryGearTrunk"].items, 0.1);	
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, "Webbing_Military");
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, 0.1);	
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, "Base.BeltRig");
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, 0.1);	
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, "CSword.TacticalKnife");
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, 0.1);	
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, "CSword.Tomahawk");
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, 0.1);	
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, "CSword.EntrenchmentTool");
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, 0.1);	
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, "Boltcutters");
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, 1);	
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, "eris_nvg.nvgoggles41");
	table.insert(VehicleDistributions["MilitaryGearTrunk"].items, 0.001);	
	
	
		
	table.insert(VehicleDistributions["MilitarySeat"].items, "SniperVeil");
	table.insert(VehicleDistributions["MilitarySeat"].items, 0.1);
	table.insert(VehicleDistributions["MilitarySeat"].items, "Brushkit");
	table.insert(VehicleDistributions["MilitarySeat"].items, 1);	
	table.insert(VehicleDistributions["MilitarySeat"].items, "Maintkit");
	table.insert(VehicleDistributions["MilitarySeat"].items, 1);	
	table.insert(VehicleDistributions["MilitarySeat"].items, "SmokeGrenade");
	table.insert(VehicleDistributions["MilitarySeat"].items, 3);	
	table.insert(VehicleDistributions["MilitarySeat"].items, "SmokeGrenade");
	table.insert(VehicleDistributions["MilitarySeat"].items, 3);	
	table.insert(VehicleDistributions["MilitarySeat"].items, "IncendiaryGrenade");
	table.insert(VehicleDistributions["MilitarySeat"].items, 1);	
	table.insert(VehicleDistributions["MilitarySeat"].items, "ConcussionGrenade");
	table.insert(VehicleDistributions["MilitarySeat"].items, 3);	
	table.insert(VehicleDistributions["MilitarySeat"].items, "Explosives.LandMine");
	table.insert(VehicleDistributions["MilitarySeat"].items, 0.1);
	table.insert(VehicleDistributions["MilitarySeat"].items, "Flashlight_Military");
	table.insert(VehicleDistributions["MilitarySeat"].items, 1);	
	table.insert(VehicleDistributions["MilitarySeat"].items, "Canteen");
	table.insert(VehicleDistributions["MilitarySeat"].items, 3);	
	table.insert(VehicleDistributions["MilitarySeat"].items, "Canteenfull");
	table.insert(VehicleDistributions["MilitarySeat"].items, 3);		
	table.insert(VehicleDistributions["MilitarySeat"].items, "MRE");
	table.insert(VehicleDistributions["MilitarySeat"].items, 1);	
	table.insert(VehicleDistributions["MilitarySeat"].items, "MRE_Box");
	table.insert(VehicleDistributions["MilitarySeat"].items, 1);	
	table.insert(VehicleDistributions["MilitarySeat"].items, "Leatherdad");
	table.insert(VehicleDistributions["MilitarySeat"].items, 0.1);		
	table.insert(VehicleDistributions["MilitarySeat"].items, "Base.HolsterPLL2M");
	table.insert(VehicleDistributions["MilitarySeat"].items, 1);	
	table.insert(VehicleDistributions["MilitarySeat"].items, "PLGR");
	table.insert(VehicleDistributions["MilitarySeat"].items, 0.1);	
	-- table.insert(VehicleDistributions["MilitarySeat"].items, "RogueWaistBag");
	-- table.insert(VehicleDistributions["MilitarySeat"].items, 0.1);	
	-- table.insert(VehicleDistributions["MilitarySeat"].items, "Base.strapchest");
	-- table.insert(VehicleDistributions["MilitarySeat"].items, 0.1);	
	-- table.insert(VehicleDistributions["MilitarySeat"].items, "Base.MVest");
	-- table.insert(VehicleDistributions["MilitarySeat"].items, 0.1);	
	-- table.insert(VehicleDistributions["MilitarySeat"].items, "Base.medbag");
	-- table.insert(VehicleDistributions["MilitarySeat"].items, 0.1);	
	-- table.insert(VehicleDistributions["MilitarySeat"].items, "Base.medbag2");
	-- table.insert(VehicleDistributions["MilitarySeat"].items, 0.1);	
	-- table.insert(VehicleDistributions["MilitarySeat"].items, "Base.smallback");
	-- table.insert(VehicleDistributions["MilitarySeat"].items, 0.1);	
	table.insert(VehicleDistributions["MilitarySeat"].items, "Webbing");
	table.insert(VehicleDistributions["MilitarySeat"].items, 0.1);	
	-- table.insert(VehicleDistributions["MilitarySeat"].items, "Base.BeltRig");
	-- table.insert(VehicleDistributions["MilitarySeat"].items, 0.1);	
	table.insert(VehicleDistributions["MilitarySeat"].items, "CSword.TacticalKnife");
	table.insert(VehicleDistributions["MilitarySeat"].items, 0.1);	
	table.insert(VehicleDistributions["MilitarySeat"].items, "CSword.Tomahawk");
	table.insert(VehicleDistributions["MilitarySeat"].items, 0.1);	
	table.insert(VehicleDistributions["MilitarySeat"].items, "CSword.EntrenchmentTool");
	table.insert(VehicleDistributions["MilitarySeat"].items, 0.1);	
	table.insert(VehicleDistributions["MilitarySeat"].items, "Boltcutters");
	table.insert(VehicleDistributions["MilitarySeat"].items, 1);	
	table.insert(VehicleDistributions["MilitarySeat"].items, "eris_nvg.nvgoggles41");
	table.insert(VehicleDistributions["MilitarySeat"].items, 0.001);	
	
		-- VehicleDistributions.Military = {
		-- TruckBed = VehicleDistributions.MilitaryGearTrunk;
		-- TruckbedOpen = VehicleDistributions.MilitaryGearTrunk;

		-- SeatRearLeft = VehicleDistributions.MilitarySeat;
		-- SeatRearRight = VehicleDistributions.MilitarySeat;
		
	   -- GloveBox = VehicleDistributions.Military.GloveBox;
	-- }
	-- table.insert(VehicleDistributions["Military"]["MilitarySeat"].items, 1);	
end