require "Items/Distributions"
require "Items/ProceduralDistributions"
require "Vehicles/VehicleDistributions"
require "Items/ItemPicker"	

	SuburbsDistributions.smallback = SuburbsDistributions.smallback or {	-- adventurers bag, surplus, sports
		rolls = 1,
		items = {
		},
		fillRand = 0,
	};

	
	SuburbsDistributions.TacticalWaistBagBack = SuburbsDistributions.TacticalWaistBagBack or {	-- adventurers bag, surplus, sports
		rolls = 1,
		items = {
                "9mmClip", 2,
                "45Clip", 2,
                "44Clip", 2,
                --"223Clip", 2,
                --"308Clip", 2,
                "M14Clip", 2,
                "556Clip", 2,
		},
		fillRand = 0,
	};	
	SuburbsDistributions.RogueWaistBag = SuburbsDistributions.RogueWaistBag or {	-- adventurers bag, surplus, sports
		rolls = 1,
		items = {
                "9mmClip", 2,
                "45Clip", 2,
                "44Clip", 2,
                --"223Clip", 2,
                --"308Clip", 2,
                "M14Clip", 2,
                "556Clip", 2,
		},
		fillRand = 0,
	};
	
	
	SuburbsDistributions.medbag = SuburbsDistributions.medbag or { --stores
		rolls = 1,
		items = {
                "Bandaid", 7,
                "Pills", 7,
                "PillsBeta", 7,
                "Tweezers", 5,
                "Antibiotics", 5,
                "SutureNeedle", 2,
                "Bandage", 5,
                "AlcoholWipes", 5,
                "SutureNeedleHolder", 2,
                "Scalpel", 2,
		},
		fillRand = 0,
	};	
	
	SuburbsDistributions.medbag2 = SuburbsDistributions.medbag2 or { -- stores
		rolls = 1,
		items = {
                "Bandaid", 7,
                "Pills", 7,
                "PillsBeta", 7,
                "Tweezers", 5,
                "Antibiotics", 5,
                "SutureNeedle", 2,
                "Bandage", 5,
                "AlcoholWipes", 5,
                "SutureNeedleHolder", 2,
                "Scalpel", 2
		},
		fillRand = 0,
	};	
	
	SuburbsDistributions.BeltRig = SuburbsDistributions.BeltRig or { -- police storage
		rolls = 1,
		items = {
                "9mmClip", 2,
                "45Clip", 2,
                "44Clip", 2,
                --"223Clip", 2,
                --"308Clip", 2,
                "M14Clip", 2,
                "556Clip", 2,
		},
		fillRand = 0,
	};
	
	SuburbsDistributions.Bag_ParaMedic = SuburbsDistributions.Bag_ParaMedic or { -- stores
		rolls = 1,
		items = {
                "Bandaid", 7,
                "Pills", 7,
                "PillsBeta", 7,
                "Tweezers", 5,
                "Antibiotics", 5,
                "SutureNeedle", 2,
                "Bandage", 5,
                "AlcoholWipes", 5,
                "SutureNeedleHolder", 2,
                "Scalpel", 2
		},
		fillRand = 0,
	};
	
	SuburbsDistributions.MVest = SuburbsDistributions.MVest or { -- stores
		rolls = 1,
		items = {
                "9mmClip", 2,
                "45Clip", 2,
                "44Clip", 2,
                --"223Clip", 2,
                --"308Clip", 2,
                "M14Clip", 2,
                "556Clip", 2,
		},
		fillRand = 0,
	};
	
	
	SuburbsDistributions.SWATPouch = SuburbsDistributions.SWATPouch or { -- stores
		rolls = 1,
		items = {
                "9mmClip", 2,
                "45Clip", 2,
                "44Clip", 2,
                --"223Clip", 2,
                --"308Clip", 2,
                "M14Clip", 2,
                "556Clip", 2,
		},
		fillRand = 0,
	};
	
	SuburbsDistributions.Bag_BigSwatBag = SuburbsDistributions.Bag_BigSwatBag or { -- stores
		rolls = 1,
		items = {
                "HolsterSimple", 3,
                "HolsterDouble", 0.8,
                "Nightstick", 4,
                "Bullets9mmBox", 3,
                "ShotgunShellsBox", 3,
                "Bullets38Box", 3,
                "Bullets44Box", 3,
                "Bullets45Box", 3,
                "223Box", 3,
                "308Box", 3,
                "PistolCase1", 1.5,
                "PistolCase2", 1.5,
                "PistolCase3", 0.5,
                "Revolver", 1,
                "Revolver_Long", 0.5,
                "Radio.WalkieTalkie4",10,
                "Radio.WalkieTalkie5",2,
                "9mmClip", 2,
                "45Clip", 2,
                "44Clip", 2,
                --"223Clip", 2,
                --"308Clip", 2,
                "M14Clip", 2,
                "556Clip", 2,
		},
		fillRand = 0,
	};
	
	SuburbsDistributions.Bag_PoliceBag = SuburbsDistributions.Bag_PoliceBag or { -- stores
		rolls = 1,
		items = {
                "HolsterSimple", 3,
                "HolsterDouble", 0.8,
                "Nightstick", 4,
                "Bullets9mmBox", 3,
                "ShotgunShellsBox", 3,
                "Bullets38Box", 3,
                "Bullets44Box", 3,
                "Bullets45Box", 3,
                "223Box", 3,
                "308Box", 3,
                "PistolCase1", 1.5,
                "PistolCase2", 1.5,
                "PistolCase3", 0.5,
                "Revolver", 1,
                "Revolver_Long", 0.5,
                "Radio.WalkieTalkie4",10,
                "Radio.WalkieTalkie5",2,
                "9mmClip", 2,
                "45Clip", 2,
                "44Clip", 2,
                --"223Clip", 2,
                --"308Clip", 2,
                "M14Clip", 2,
                "556Clip", 2,
		},
		fillRand = 0,
	};
	
	SuburbsDistributions.Vest_Hunting_Grey = { -- stores
		rolls = 1,
		items = {
		},
		fillRand = 0,
	
	};
	
	SuburbsDistributions.Vest_Hunting_Camo = { -- stores
		rolls = 1,
		items = {
		},
		fillRand = 0,
	};
	
	
	SuburbsDistributions.Vest_Hunting_CamoGreen = { -- stores
		rolls = 1,
		items = {
		},
		fillRand = 0,	
	};
	
	
	SuburbsDistributions.Vest_Foreman = { -- stores
		rolls = 1,
		items = {
		},
		fillRand = 0,
	};	
	SuburbsDistributions.Bag_FannyPackBack = { -- stores
		rolls = 1,
		items = {
		"Lighter",1,
		"Matches",1,
		"Cigarettes",1,
		"Leatherdad",0.1,
		"SAK",0.1,
		"HandTorch",0.1,
		},
		fillRand = 0,
	};
	SuburbsDistributions.Bag_FannyPackFront = { -- stores
		rolls = 1,
		items = {
		"Lighter",1,
		"Matches",1,
		"Cigarettes",1,
		"Leatherdad",0.1,
		"SAK",0.1,
		"HandTorch",0.1,
		
		},
		fillRand = 0,
	};
	
	SuburbsDistributions.AmmoStrap_Bullets = { -- stores
		rolls = 1,
		items = {
                "223Bullets",  200,
                "308Bullets",  200,
                "556Bullets",  200,
                "223Bullets",  200,
                "308Bullets",  200,
                "556Bullets",  200,
                "223Bullets",  200,
                "308Bullets",  200,
                "556Bullets",  200,
                "223Bullets", 200,
                "308Bullets", 200,
                "556Bullets",  200,			
		},
		fillRand = 0,
	};	
	SuburbsDistributions.AmmoStrap_Shells = { -- stores
		rolls = 1,
		items = {
                "ShotgunShells", 200,
                "ShotgunShells", 200,
                "ShotgunShells", 200,
                "ShotgunShells", 200,
		},
		fillRand = 0,
	};	

