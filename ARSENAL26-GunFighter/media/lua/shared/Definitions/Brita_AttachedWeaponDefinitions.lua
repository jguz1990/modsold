-- define weapons to be attached to zombies when creating them
-- random knives inside their neck, spear in their stomach, meatcleaver in their back...
-- this is used in IsoZombie.addRandomAttachedWeapon()

--[[
AttachedWeaponDefinitions = AttachedWeaponDefinitions or {};

AttachedWeaponDefinitions.chanceOfAttachedWeapon = 6; -- Global chance of having an attached weapon, if we pass this we gonna add randomly one from the list

-- random spear in the stomach
AttachedWeaponDefinitions.spearStomach = {
	chance = 5, -- chance is total, we'll get the chance of every definition and take one from there
	weaponLocation = {"Stomach"}, -- defined in AttachedLocations.lua
	bloodLocations = {"Torso_Lower","Back"}, -- we add blood & hole on this part
	addHoles = true, -- if true, you need at least one bloodLocation
	daySurvived = 30, -- needed day of survival before seeing this one
	weapons = { -- list of possible weapons, we'll take one randomly from there
		"Base.SpearKnife",
		"Base.SpearCrafted",
		"Base.SpearHuntingKnife",
		"Base.SpearScrewdriver",
		"Base.SpearScissors",
		"Base.SpearScalpel",
		"Base.SpearButterKnife",
		"Base.SpearHuntingKnife",
	},
}

-- katana in stomach
AttachedWeaponDefinitions.katanaStomach = {
	chance = 1,
	weaponLocation = {"Stomach"},
	bloodLocations = {"Torso_Lower","Back"},
	addHoles = true,
	daySurvived = 60,
	weapons = {
		"Base.Katana",
	},
}

-- meat cleaver & some others low weapons (Hand Axes..) in the back
AttachedWeaponDefinitions.meatCleaverBackLowQuality = {
	chance = 5,
	weaponLocation = {"MeatCleaver in Back"},
	bloodLocations = {"Back"},
	addHoles = true,
	daySurvived = 0,
	weapons = {
		"Base.MeatCleaver",
		"Base.HandAxe",
	},
}

-- Better weapons in the back
AttachedWeaponDefinitions.meatCleaverBack = {
	chance = 1,
	weaponLocation = {"MeatCleaver in Back"},
	bloodLocations = {"Back"},
	addHoles = true,
	daySurvived = 20,
	weapons = {
		"Base.Machete",
	},
}

-- random knife (low quality weapon) in the back
AttachedWeaponDefinitions.knifeLowQualityBack = {
	chance = 30,
	weaponLocation = {"Knife in Back"},
	bloodLocations = {"Back"},
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Base.HandFork",
		"Base.Fork",
		"Base.Screwdriver",
		"Base.ButterKnife",
		"Base.Scissors",
		"Base.LetterOpener",
		"Base.BreadKnife",
		"Base.KitchenKnife",
	},
}

-- Axe in the back
AttachedWeaponDefinitions.axeBack = {
	chance = 2,
	weaponLocation = {"Axe Back"},
	bloodLocations = {"Back"},
	addHoles = true,
	daySurvived = 15,
	weapons = {
		"Base.Axe",
	},
}

-- random knife (better quality) in the back
AttachedWeaponDefinitions.knifeBack = {
	chance = 10,
	weaponLocation = {"Knife in Back"},
	bloodLocations = {"Back"},
	addHoles = false,
	daySurvived = 10,
	weapons = {
		"Base.HuntingKnife",
	},
}

-- random knife (low quality weapon) in the left leg
AttachedWeaponDefinitions.knifeLowQualityLeftLeg = {
	chance = 30,
	weaponLocation = {"Knife Left Leg"},
	bloodLocations = {"UpperLeg_L"},
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Base.HandFork",
		"Base.Fork",
		"Base.Screwdriver",
		"Base.ButterKnife",
		"Base.Scissors",
		"Base.LetterOpener",
		"Base.BreadKnife",
		"Base.KitchenKnife",
	},
}

-- random knife (better quality) in the left leg
AttachedWeaponDefinitions.knifeLeftLeg = {
	chance = 10,
	weaponLocation = {"Knife Left Leg"},
	bloodLocations = {"UpperLeg_L"},
	addHoles = false,
	daySurvived = 10,
	weapons = {
		"Base.HuntingKnife",
	},
}

-- random knife (low quality weapon) in the right leg
AttachedWeaponDefinitions.knifeLowQualityLeftLeg = {
	chance = 30,
	weaponLocation = {"Knife Right Leg"},
	bloodLocations = {"UpperRight_L"},
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Base.HandFork",
		"Base.Fork",
		"Base.Screwdriver",
		"Base.ButterKnife",
		"Base.Scissors",
		"Base.LetterOpener",
	},
}

-- random knife (better quality) in the right leg
AttachedWeaponDefinitions.knifeRightLeg = {
	chance = 10,
	weaponLocation = {"Knife Right Leg"},
	bloodLocations = {"UpperRight_L"},
	addHoles = false,
	daySurvived = 10,
	weapons = {
		"Base.HuntingKnife",
	},
}

-- random knife (low quality weapon) in the shoulder
AttachedWeaponDefinitions.knifeLowQualityShoulder = {
	chance = 30,
	weaponLocation = {"Knife Shoulder"},
	bloodLocations = {"UpperArm_L", "Torso_Upper"},
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Base.HandFork",
		"Base.Fork",
		"Base.Screwdriver",
		"Base.ButterKnife",
		"Base.Scissors",
		"Base.LetterOpener",
		"Base.BreadKnife",
		"Base.KitchenKnife",
	},
}

-- random knife (better quality) in the shoulder
AttachedWeaponDefinitions.knifeShoulder = {
	chance = 10,
	weaponLocation = {"Knife Shoulder"},
	bloodLocations = {"UpperArm_L", "Torso_Upper"},
	addHoles = false,
	daySurvived = 10,
	weapons = {
		"Base.HuntingKnife",
	},
}

-- Machete in shoulder
AttachedWeaponDefinitions.MacheteShoulder = {
	chance = 1,
	weaponLocation = {"Knife Shoulder"},
	bloodLocations = {"UpperArm_L", "Torso_Upper"},
	addHoles = true,
	daySurvived = 20,
	weapons = {
		"Base.Machete",
	},
}

-- random knife (low quality weapon) in the stomach
AttachedWeaponDefinitions.knifeLowQualityStomach = {
	chance = 30,
	weaponLocation = {"Knife Stomach"},
	bloodLocations = {"Torso_Lower"},
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Base.Stake",
		"Base.Fork",
		"Base.Screwdriver",
		"Base.ButterKnife",
		"Base.Scissors",
		"Base.LetterOpener",
		"Base.HandFork",
	},
}

-- random knife (better quality) in the stomach
AttachedWeaponDefinitions.knifeStomach = {
	chance = 10,
	weaponLocation = {"Knife Stomach"},
	bloodLocations = {"Torso_Lower", "Back"},
	addHoles = false,
	daySurvived = 10,
	weapons = {
		"Base.HuntingKnife",
	},
}

-- random weapon in stomach
AttachedWeaponDefinitions.weaponInStomach = {
	chance = 3,
	weaponLocation = {"Knife Stomach"},
	bloodLocations = {"Torso_Lower", "Back"},
	addHoles = true,
	daySurvived = 10,
	weapons = {
		"Base.LeadPipe",
		"Base.MetalBar",
		"Base.Nightstick",
	},
}

-- crowbar in the back
AttachedWeaponDefinitions.crowbarBack = {
	chance = 3,
	weaponLocation = {"Crowbar Back"},
	bloodLocations = {"Back"},
	addHoles = true,
	daySurvived = 10,
	weapons = {
		"Base.Crowbar",
	},
}

-- random weapon on police zombies holster
AttachedWeaponDefinitions.handgunHolster = {
	id = "handgunHolster",
	chance = 50,
	outfit = {"Police", "PoliceState", "PoliceRiot", "PrisonGuard", "PrivateMilitia"},
	weaponLocation =  {"Holster Right"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	ensureItem = "Base.HolsterSimple",
	weapons = {
		"Base.M9",
		"Base.AMT1911",
		"Base.AMT1911_Long",
		"Base.Colt1911",
		"Base.Colt_Kimber",
		"Base.Colt_Commander",
		"Base.CZ75",
		"Base.G18",
		"Base.G21",
		"Base.P226",
		"Base.K5",
		"Base.M5906",
		"Base.M4506",
		"Base.Colt_Service38",
		"Base.GP100_2",
		"Base.GP100_4",
		"Base.GP100_6",
		"Base.M29_44",
		"Base.DEagle",
		"Base.Automag",
	},
}

-- shotgun on police's back
AttachedWeaponDefinitions.shotgunPolice = {
	id = "shotgunPolice",
	chance = 30,
	outfit = {"Police", "PoliceState", "PoliceRiot", "PrivateMilitia"},
	weaponLocation =  {"Rifle On Back"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Base.Shotgun",
		"Base.M870_Police",
		"Base.M870_MCS",
		"Base.M870_CQB",
		"Base.M870_Breaching_Pistol",
		"Base.SPAS12_Fold",
		"Base.SPAS12_Fixed",
		"Base.SPAS_15",
		"Base.DAO12",
		"Base.TOZ106",
		"Base.TOZ194_Pistol",
	},
}

-- assault rifle on back
AttachedWeaponDefinitions.assaultRifleOnBack = {
	id = "assaultRifleOnBack",
	chance = 20,
	outfit = {"PrivateMilitia"},
	weaponLocation =  {"Rifle On Back"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Base.UZI", 
		"Base.UZI_Wood",
		"Base.MP5_Fixed",
		"Base.MP5_Stock",
		"Base.K7_Stock",
		"Base.AUG9",
		"Base.KG9",
		"Base.Calico_M900_Stock",
		"Base.Calico_M950_Pistol",
		"Base.M1Carbine",
		"Base.M2Carbine",
		"Base.M635",
		"Base.M635S",
		"Base.Jatimatic",
		"Base.MAC10_Fold",
		"Base.Thompson",
		"Base.Thompson_1928",
		"Base.M2Hyde",
		"Base.Model55_Stock",
		"Base.Model50",
		"Base.G33",
		"Base.M16A1",
		"Base.M723",
		"Base.M4",
		"Base.M4A1",
		"Base.ColtM16",
		"Base.M16Wood",
		"Base.M16Tape",
		"Base.FAMAS",
		"Base.FAMAS_G2",
		"Base.FAMAS_Felin",
		"Base.AUG",
		"Base.M85_Stock",
		"Base.AK74",
		"Base.AKS74",
		"Base.AKS74U",
		"Base.RPK74",
		"Base.L85",
		"Base.L86",
		"Base.AR18",
		"Base.Type89",
		"Base.M14",
		"Base.FAL",
		"Base.FAL_PARA_Fold",
		"Base.FN_FNC",
		"Base.Vz58",
		"Base.Vz58_Stock",
		"Base.AK47",
		"Base.AKM",
		"Base.AKMS_Fold",
		"Base.MD65_Fold",
		"Base.G3",
		"Base.AUG",
		"Base.MINI14",
		"Base.SKS",
		"Base.SKS_PARA",
		"Base.BAR",
		"Base.BAR_Monitor",
		"Base.MAS36",
		"Base.MAS44",
		"Base.MAS49",
		"Base.Galil",
	},
}

-- varmint/hunting rifle on back
AttachedWeaponDefinitions.huntingRifleOnBack = {
	id = "huntingRifleOnBack",
	chance = 30,
	outfit = {"PrivateMilitia"},
	weaponLocation =  {"Rifle On Back"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Base.Sako85",
		"Base.Savage12",
		"Base.M1903",
		"Base.Mosin",
		"Base.M29_44Carbine",
		"Base.Marlin_1894",
		"Base.Win_1894",
		"Base.Win_1895",
		"Base.Winchester1866",
		"Base.Winchester1873",
		"Base.SVD",
		"Base.SVDK",
		"Base.M82",
		"Base.BOAR",
		"Base.Harris50",
		"Base.TAC50",
		"Base.WA2000",
		"Base.DT11",
		"Base.Coachgun",
		"Base.M40",
		"Base.M40A1",
		"Base.NEF_Handi_357",
		"Base.NEF_Handi_410",
		"Base.Thompson_Center_3006",
		"Base.Thompson_Center_4570",
		"Base.Ruger_No1_3006",
		"Base.Ruger_No1_4570",
		"Base.Type38",
		"Base.Type99",
		"Base.L96",
	},
}

-- random construction tools on construction worker
AttachedWeaponDefinitions.constructionWorker = {
	chance = 80,
	outfit = {"ConstructionWorker", "Foreman"},
	weaponLocation = {"Belt Left", "Belt Right"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Base.Hammer",
		"Base.ClubHammer",
		"Base.WoodenMallet",
		"Base.BallPeenHammer",
	},
}

-- screwdriver on construction worker
AttachedWeaponDefinitions.constructionWorkerScrewdriver = {
	chance = 80,
	outfit = {"ConstructionWorker", "Foreman"},
	weaponLocation = {"Belt Left Screwdriver", "Belt Right Screwdriver"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Base.Screwdriver",
	},
}

-- hand axe on lumberjack
AttachedWeaponDefinitions.lumberjack = {
	chance = 80,
	outfit = {"McCoys"},
	weaponLocation = {"Belt Left", "Belt Right"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Base.HandAxe",
	},
}

-- various melee weapon attached in back
AttachedWeaponDefinitions.meleeInBack = {
	chance = 50,
	outfit = {"Bandit"},
	weaponLocation = {"Shovel Back"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Base.BaseballBat",
		"Base.BaseballBatNails",
		"Base.PlankNail",
		"Base.Shovel",
		"Base.HockeyStick",
		"Base.WoodenLance",
	},
}

-- more melee in back!
AttachedWeaponDefinitions.melee2InBack = {
	chance = 60,
	outfit = {"Bandit"},
	weaponLocation = {"Big Weapon On Back"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Base.AxeStone",
		"Base.LeadPipe",
		"Base.MetalBar",
		"Base.MetalPipe",
		"Base.HockeyStick",
		"Base.WoodenLance",
	},
}

-- hammer/axe in belt left (so we keep knives for belt right if we got multiple items)
AttachedWeaponDefinitions.hammerBelt = {
	chance = 80,
	outfit = {"Bandit"},
	weaponLocation = {"Belt Left"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Base.HandAxe",
		"Base.Hammer",
		"Base.HammerStone",
	},
}

-- knives in belt right
AttachedWeaponDefinitions.knivesBelt = {
	chance = 80,
	outfit = {"Bandit"},
	weaponLocation = {"Belt Right Upside"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Base.HuntingKnife",
		"Base.KitchenKnife",
		"Base.HammerStone",
	},
}

-- crowbar or machete in back
AttachedWeaponDefinitions.bladeInBack = {
	chance = 20,
	outfit = {"Bandit"},
	weaponLocation = {"Blade On Back"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Base.Crowbar",
		"Base.Machete",
	},
}

-- machete in back
AttachedWeaponDefinitions.macheteInBack = {
	chance = 20,
	outfit = {"HockeyPsycho"},
	weaponLocation = {"Blade On Back"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Base.Machete",
	},
}


-- nightstick in belt
AttachedWeaponDefinitions.nightstick = {
	chance = 30,
	outfit = {"Police", "PoliceState", "PoliceRiot", "PrisonGuard", "PrivateMilitia"},
	weaponLocation = {"Nightstick Left"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Base.Nightstick",
	},
}

-- Define some custom weapons attached on some specific outfit, so for example police have way more chance to have guns in holster and not simply a spear in stomach or something
AttachedWeaponDefinitions.attachedWeaponCustomOutfit = {};

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.HockeyPsycho = {
	chance = 100;
	weapons = {
		AttachedWeaponDefinitions.macheteInBack,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.PrivateMilitia = {
	chance = 50;
	maxitem = 3;
	weapons = {
		AttachedWeaponDefinitions.shotgunPolice,
		AttachedWeaponDefinitions.assaultRifleOnBack,
		AttachedWeaponDefinitions.huntingRifleOnBack,
		AttachedWeaponDefinitions.handgunHolster,
		AttachedWeaponDefinitions.knivesBelt,
		AttachedWeaponDefinitions.nightstick,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.Bandit = {
	chance = 50;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.meleeInBack,
		AttachedWeaponDefinitions.melee2InBack,
		AttachedWeaponDefinitions.hammerBelt,
		AttachedWeaponDefinitions.knivesBelt,
		AttachedWeaponDefinitions.handgunHolster,
		AttachedWeaponDefinitions.bladeInBack,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.Police = {
	chance = 50;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.handgunHolster,
		AttachedWeaponDefinitions.shotgunPolice,
		AttachedWeaponDefinitions.nightstick,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.PoliceState = {
	chance = 50;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.handgunHolster,
		AttachedWeaponDefinitions.shotgunPolice,
		AttachedWeaponDefinitions.nightstick,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.PoliceRiot = {
	chance = 60;
	maxitem = 3;
	weapons = {
		AttachedWeaponDefinitions.handgunHolster,
		AttachedWeaponDefinitions.nightstick,
		AttachedWeaponDefinitions.shotgunPolice,
	},
}
]]

require "Definitions/AttachedWeaponDefinitions"

--------------------------------------------------------------------------
--	DO NOT CLEAR VANILLA WEAPONS					--
--------------------------------------------------------------------------
-- table.remove(AttachedWeaponDefinitions["handgunHolster"].weapons, "Base.Pistol");
-- table.remove(AttachedWeaponDefinitions["handgunHolster"].weapons, "Base.Pistol2");
-- table.remove(AttachedWeaponDefinitions["handgunHolster"].weapons, "Base.Pistol3");
-- table.remove(AttachedWeaponDefinitions["handgunHolster"].weapons, "Base.Revolver_Short");
-- table.remove(AttachedWeaponDefinitions["handgunHolster"].weapons, "Base.Revolver");
-- table.remove(AttachedWeaponDefinitions["handgunHolster"].weapons, "Base.Revolver_Long");
-- table.remove(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.AssaultRifle");
-- table.remove(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.AssaultRifle2");
-- table.remove(AttachedWeaponDefinitions["huntingRifleOnBack"].weapons, "Base.VarmintRifle");
-- table.remove(AttachedWeaponDefinitions["huntingRifleOnBack"].weapons, "Base.HuntingRifle");

--------------------------------------------------------------------------
--	NOT USED							--
--------------------------------------------------------------------------
-- table.insert(AttachedWeaponDefinitions["spearStomach"].weapons, "Base.");
-- table.insert(AttachedWeaponDefinitions["meatCleaverBackLowQuality"].weapons, "Base.");
-- table.insert(AttachedWeaponDefinitions["knifeLowQualityBack"].weapons, "Base.");
-- table.insert(AttachedWeaponDefinitions["knifeLowQualityLeftLeg"].weapons, "Base.");
-- table.insert(AttachedWeaponDefinitions["knifeLowQualityLeftLeg"].weapons, "Base.");  DOUBLE INSTANCE IN VANILLA
-- table.insert(AttachedWeaponDefinitions["knifeLowQualityShoulder"].weapons, "Base.");
-- table.insert(AttachedWeaponDefinitions["knifeLowQualityStomach"].weapons, "Base.");
-- table.insert(AttachedWeaponDefinitions["meatCleaverBack"].weapons, "Base.");
-- table.insert(AttachedWeaponDefinitions["weaponInStomach"].weapons, "Base.");
-- table.insert(AttachedWeaponDefinitions["weaponInStomach"].weapons, "Base.");
-- table.insert(AttachedWeaponDefinitions["weaponInStomach"].weapons, "Base.");
-- table.insert(AttachedWeaponDefinitions["weaponInStomach"].weapons, "Base.");
-- table.insert(AttachedWeaponDefinitions["crowbarBack"].weapons, "Base.");
-- table.insert(AttachedWeaponDefinitions["crowbarBack"].weapons, "Base.");
-- table.insert(AttachedWeaponDefinitions["constructionWorker"].weapons, "Base.");
-- table.insert(AttachedWeaponDefinitions["constructionWorkerScrewdriver"].weapons, "Base.");
-- table.insert(AttachedWeaponDefinitions["meleeInBack"].weapons, "Base.");
-- table.insert(AttachedWeaponDefinitions["melee2InBack"].weapons, "Base.");
-- table.insert(AttachedWeaponDefinitions["hammerBelt"].weapons, "Base.");
-- table.insert(AttachedWeaponDefinitions["bladeInBack"].weapons, "Base.");
-- table.insert(AttachedWeaponDefinitions["nightstick"].weapons, "Base.");

--------------------------------------------------------------------------
--	MELEE IMPALED INSERTED ONLY WHERE APPLICABLE			--
--------------------------------------------------------------------------
table.insert(AttachedWeaponDefinitions["katanaStomach"].weapons, "Base.KillBill");
table.insert(AttachedWeaponDefinitions["axeBack"].weapons, "Base.Tactical_Axe");
table.insert(AttachedWeaponDefinitions["axeBack"].weapons, "Base.Tactical_Sickle");
table.insert(AttachedWeaponDefinitions["knifeStomach"].weapons, "Base.Butterfly");
table.insert(AttachedWeaponDefinitions["knifeStomach"].weapons, "Base.Karambit");
table.insert(AttachedWeaponDefinitions["knifeStomach"].weapons, "Base.PushDagger");
table.insert(AttachedWeaponDefinitions["knifeStomach"].weapons, "Base.RamboKnife");
table.insert(AttachedWeaponDefinitions["knifeBack"].weapons, "Base.Butterfly");
table.insert(AttachedWeaponDefinitions["knifeBack"].weapons, "Base.Karambit");
table.insert(AttachedWeaponDefinitions["knifeBack"].weapons, "Base.PushDagger");
table.insert(AttachedWeaponDefinitions["knifeBack"].weapons, "Base.RamboKnife");
table.insert(AttachedWeaponDefinitions["knifeLeftLeg"].weapons, "Base.Butterfly");
table.insert(AttachedWeaponDefinitions["knifeLeftLeg"].weapons, "Base.Karambit");
table.insert(AttachedWeaponDefinitions["knifeLeftLeg"].weapons, "Base.PushDagger");
table.insert(AttachedWeaponDefinitions["knifeLeftLeg"].weapons, "Base.RamboKnife");
table.insert(AttachedWeaponDefinitions["knifeRightLeg"].weapons, "Base.Butterfly");
table.insert(AttachedWeaponDefinitions["knifeRightLeg"].weapons, "Base.Karambit");
table.insert(AttachedWeaponDefinitions["knifeRightLeg"].weapons, "Base.PushDagger");
table.insert(AttachedWeaponDefinitions["knifeRightLeg"].weapons, "Base.RamboKnife");
table.insert(AttachedWeaponDefinitions["knifeShoulder"].weapons, "Base.Butterfly");
table.insert(AttachedWeaponDefinitions["knifeShoulder"].weapons, "Base.Karambit");
table.insert(AttachedWeaponDefinitions["knifeShoulder"].weapons, "Base.PushDagger");
table.insert(AttachedWeaponDefinitions["knifeShoulder"].weapons, "Base.RamboKnife");
table.insert(AttachedWeaponDefinitions["MacheteShoulder"].weapons, "Base.BGMachete");
table.insert(AttachedWeaponDefinitions["MacheteShoulder"].weapons, "Base.RussianMachete");
table.insert(AttachedWeaponDefinitions["lumberjack"].weapons, "Base.Tactical_Axe");
table.insert(AttachedWeaponDefinitions["knivesBelt"].weapons, "Base.Butterfly");
table.insert(AttachedWeaponDefinitions["knivesBelt"].weapons, "Base.Karambit");
table.insert(AttachedWeaponDefinitions["knivesBelt"].weapons, "Base.PushDagger");
table.insert(AttachedWeaponDefinitions["knivesBelt"].weapons, "Base.RamboKnife");
table.insert(AttachedWeaponDefinitions["macheteInBack"].weapons, "Base.BGMachete");
table.insert(AttachedWeaponDefinitions["macheteInBack"].weapons, "Base.RussianMachete");

--------------------------------------------------------------------------
--	ATTACHED SERVICE HANDGUNS PRE_93 ONLY				--
--------------------------------------------------------------------------
table.insert(AttachedWeaponDefinitions["handgunHolster"].weapons, "Base.CZ75");
table.insert(AttachedWeaponDefinitions["handgunHolster"].weapons, "Base.G17");
table.insert(AttachedWeaponDefinitions["handgunHolster"].weapons, "Base.K5");
table.insert(AttachedWeaponDefinitions["handgunHolster"].weapons, "Base.M9");
table.insert(AttachedWeaponDefinitions["handgunHolster"].weapons, "Base.M9A3");
table.insert(AttachedWeaponDefinitions["handgunHolster"].weapons, "Base.M5906");
table.insert(AttachedWeaponDefinitions["handgunHolster"].weapons, "Base.P226");
table.insert(AttachedWeaponDefinitions["handgunHolster"].weapons, "Base.GP100_2");
table.insert(AttachedWeaponDefinitions["handgunHolster"].weapons, "Base.GP100_4");
table.insert(AttachedWeaponDefinitions["handgunHolster"].weapons, "Base.GP100_6");
table.insert(AttachedWeaponDefinitions["handgunHolster"].weapons, "Base.G21");
table.insert(AttachedWeaponDefinitions["handgunHolster"].weapons, "Base.P220");
table.insert(AttachedWeaponDefinitions["handgunHolster"].weapons, "Base.M4506");
table.insert(AttachedWeaponDefinitions["handgunHolster"].weapons, "Base.PARA1911");
table.insert(AttachedWeaponDefinitions["handgunHolster"].weapons, "Base.AMT1911");
table.insert(AttachedWeaponDefinitions["handgunHolster"].weapons, "Base.AMT1911_Long");
table.insert(AttachedWeaponDefinitions["handgunHolster"].weapons, "Base.Colt1911");
table.insert(AttachedWeaponDefinitions["handgunHolster"].weapons, "Base.Colt_Commander");
table.insert(AttachedWeaponDefinitions["handgunHolster"].weapons, "Base.M29_44");
table.insert(AttachedWeaponDefinitions["handgunHolster"].weapons, "Base.Automag");
table.insert(AttachedWeaponDefinitions["handgunHolster"].weapons, "Base.DEagle");
table.insert(AttachedWeaponDefinitions["handgunHolster"].weapons, "Base.DEagle_Long");

--------------------------------------------------------------------------
--	ATTACHED COMBAT SHOTGUNS PRE_93 ONLY				--
--------------------------------------------------------------------------
table.insert(AttachedWeaponDefinitions["shotgunPolice"].weapons, "Base.SPAS12_Fixed");
table.insert(AttachedWeaponDefinitions["shotgunPolice"].weapons, "Base.SPAS12_Fold");
table.insert(AttachedWeaponDefinitions["shotgunPolice"].weapons, "Base.SPAS_15");
table.insert(AttachedWeaponDefinitions["shotgunPolice"].weapons, "Base.USAS_12");
table.insert(AttachedWeaponDefinitions["shotgunPolice"].weapons, "Base.R11_87");
table.insert(AttachedWeaponDefinitions["shotgunPolice"].weapons, "Base.M870");
table.insert(AttachedWeaponDefinitions["shotgunPolice"].weapons, "Base.M1897");
table.insert(AttachedWeaponDefinitions["shotgunPolice"].weapons, "Base.Coachgun");
table.insert(AttachedWeaponDefinitions["shotgunPolice"].weapons, "Base.M870_Police");
table.insert(AttachedWeaponDefinitions["shotgunPolice"].weapons, "Base.M870_MCS");
table.insert(AttachedWeaponDefinitions["shotgunPolice"].weapons, "Base.M870_CQB");
table.insert(AttachedWeaponDefinitions["shotgunPolice"].weapons, "Base.M870_Breaching_Pistol");
table.insert(AttachedWeaponDefinitions["shotgunPolice"].weapons, "Base.DAO12");
table.insert(AttachedWeaponDefinitions["shotgunPolice"].weapons, "Base.CAWS");

--------------------------------------------------------------------------
--	ATTACHED COMBAT LONG-GUNS PRE_93 ONLY				--
--------------------------------------------------------------------------
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.UZI");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.UZI_Wood");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.MP5_Fixed");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.MP5_Stock");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.MP5SD6_Fixed");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.MP5SD6_Stock");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.AUG9");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.M1Carbine");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.M2Carbine");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.M635");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.M635S");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.M635SD");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.CAR15SMG");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.CAR15_Survival");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.G33");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.M16A1");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.M16A2");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.M16A3");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.M723");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.M4");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.M4A1");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.K2_1");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.K2_203");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.K1_1");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.ColtM16");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.M16Wood");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.M16Tape");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.FAMAS");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.FAMAS_G2");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.FAMAS_Felin");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.AUG");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.M85_Stock");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.AK74");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.AKS74");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.AKS74U");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.L85");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.AR18");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.Type89");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.AKM");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.MD65_Stock");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.AKMS_Stock");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.Vz58");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.Vz58_Stock");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.Vz58_Mini_Stock");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.SKS");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.SKS_PARA");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.G3");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.Type64");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.FAL");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.FAL_PARA_Stock");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.FN_FNC");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.M14");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.BAR");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.BAR_Monitor");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.MAS36");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.MAS44");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.MAS49");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.Galil");
table.insert(AttachedWeaponDefinitions["assaultRifleOnBack"].weapons, "Base.Galil_Sniper");

--------------------------------------------------------------------------
--	ATTACHED HUNTING LONG-GUNS PRE_93 ONLY				--
--------------------------------------------------------------------------
table.insert(AttachedWeaponDefinitions["huntingRifleOnBack"].weapons, "Base.NEF_Handi_38");
table.insert(AttachedWeaponDefinitions["huntingRifleOnBack"].weapons, "Base.Marlin_1894");
table.insert(AttachedWeaponDefinitions["huntingRifleOnBack"].weapons, "Base.Winchester1866");
table.insert(AttachedWeaponDefinitions["huntingRifleOnBack"].weapons, "Base.Win_1894");
table.insert(AttachedWeaponDefinitions["huntingRifleOnBack"].weapons, "Base.TXS_804_45LC");
table.insert(AttachedWeaponDefinitions["huntingRifleOnBack"].weapons, "Base.Winchester1873");
table.insert(AttachedWeaponDefinitions["huntingRifleOnBack"].weapons, "Base.Sako85");
table.insert(AttachedWeaponDefinitions["huntingRifleOnBack"].weapons, "Base.WA2000");
table.insert(AttachedWeaponDefinitions["huntingRifleOnBack"].weapons, "Base.Savage12");
table.insert(AttachedWeaponDefinitions["huntingRifleOnBack"].weapons, "Base.Ruger_No1_3006");
table.insert(AttachedWeaponDefinitions["huntingRifleOnBack"].weapons, "Base.M40");
table.insert(AttachedWeaponDefinitions["huntingRifleOnBack"].weapons, "Base.M40A1");
table.insert(AttachedWeaponDefinitions["huntingRifleOnBack"].weapons, "Base.M40A2");
table.insert(AttachedWeaponDefinitions["huntingRifleOnBack"].weapons, "Base.M40A3");
table.insert(AttachedWeaponDefinitions["huntingRifleOnBack"].weapons, "Base.Mosin");
table.insert(AttachedWeaponDefinitions["huntingRifleOnBack"].weapons, "Base.M1903");
table.insert(AttachedWeaponDefinitions["huntingRifleOnBack"].weapons, "Base.Win_1895");
table.insert(AttachedWeaponDefinitions["huntingRifleOnBack"].weapons, "Base.Thompson_Center_3006");
table.insert(AttachedWeaponDefinitions["huntingRifleOnBack"].weapons, "Base.Type38");
table.insert(AttachedWeaponDefinitions["huntingRifleOnBack"].weapons, "Base.Type99");
table.insert(AttachedWeaponDefinitions["huntingRifleOnBack"].weapons, "Base.L96");
table.insert(AttachedWeaponDefinitions["huntingRifleOnBack"].weapons, "Base.BOAR");
table.insert(AttachedWeaponDefinitions["huntingRifleOnBack"].weapons, "Base.Harris50");
table.insert(AttachedWeaponDefinitions["huntingRifleOnBack"].weapons, "Base.TAC50");
table.insert(AttachedWeaponDefinitions["huntingRifleOnBack"].weapons, "Base.Coachgun");
table.insert(AttachedWeaponDefinitions["huntingRifleOnBack"].weapons, "Base.M870_Wingmaster");
table.insert(AttachedWeaponDefinitions["huntingRifleOnBack"].weapons, "Base.ROYAL_SXS");
table.insert(AttachedWeaponDefinitions["huntingRifleOnBack"].weapons, "Base.Triple_Crown");
table.insert(AttachedWeaponDefinitions["huntingRifleOnBack"].weapons, "Base.10855_Silver");









