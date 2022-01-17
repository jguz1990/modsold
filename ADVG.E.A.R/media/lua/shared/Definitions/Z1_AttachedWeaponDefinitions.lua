-- -- define weapons to be attached to zombies when creating them
-- -- random knives inside their neck, spear in their stomach, meatcleaver in their back...
-- -- this is used in IsoZombie.addRandomAttachedWeapon()

-- AttachedWeaponDefinitions = AttachedWeaponDefinitions or {};

-- AttachedWeaponDefinitions.chanceOfAttachedWeapon = 6; -- Global chance of having an attached weapon, if we pass this we gonna add randomly one from the list

-- -- -- random weapon on police zombies holster
-- -- AttachedWeaponDefinitions.handgunHolster = {
	-- -- id = "handgunHolster",
	-- -- chance = 50,
	-- -- outfit = {"Police", "PoliceState", "PoliceRiot", "PrisonGuard", "PrivateMilitia"},
	-- -- weaponLocation =  {"Holster Right"},
	-- -- bloodLocations = nil,
	-- -- addHoles = false,
	-- -- daySurvived = 0,
	-- -- ensureItem = "Base.HolsterPLL",
	-- -- weapons = {
		-- -- "Base.Pistol",
		-- -- "Base.Pistol2",
		-- -- "Base.Pistol3",
		-- -- "Base.Revolver",
		-- -- "Base.Revolver_Long",
		-- -- "Base.Revolver_Short",
	-- -- },
-- -- }




-- random weapon on police zombies holster
AttachedWeaponDefinitions.armyGrenade = {
	id = "armyGrenade",
	chance = 50,
	outfit = {"AirCrew", "ArmyCamoGreen","ArmyCamoDesert", "ArmyInstructor", "HazardSuit", "PrivateMilitia"},
	weaponLocation =  {"Chest Rig Gear"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	ensureItem = "Base.Webbing_Military",
	weapons = {
		"Base.SmokeGrenade",
		"Base.ConcussionGrenade",
	},
	
}

AttachedWeaponDefinitions.armyCanteenLeft = {
	id = "armyCanteenLeft",
	chance = 50,
	outfit = {"ArmyCamoGreen","ArmyCamoDesert", "PrivateMilitia"},
	weaponLocation =  {"Gear Belt Left"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Base.Canteen",
		"Base.CanteenFull",
	},
}	


AttachedWeaponDefinitions.armyCanteenRight = {
	id = "armyCanteenRight",
	chance = 50,
	outfit = {"ArmyCamoGreen","ArmyCamoDesert", "PrivateMilitia"},
	weaponLocation =  {"Gear Belt Right"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Base.Canteen",
		"Base.CanteenFull",
	},
}

AttachedWeaponDefinitions.armyRadio = {
	id = "armyRadio",
	chance = 50,
	outfit = {"AirCrew", "ArmyCamoGreen","ArmyCamoDesert", "ArmyInstructor","ArmyServiceUniform","HazardSuit", "PrivateMilitia"},
	weaponLocation =  {"Chest Rig Gear Right"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	ensureItem = "Base.Webbing_Military",
	weapons = {
		"Radio.WalkieTalkie5",
		"Base.Flashlight_Military",
		"Base.SmokeGrenade",
		"Base.ConcussionGrenade",
	},
}

-- random weapon on police zombies holster
AttachedWeaponDefinitions.policeRadio = {
	id = "policeRadio",
	chance = 50,
	outfit = {"Police", "PoliceState", "PoliceRiot", "PrisonGuard", "Security"},
	weaponLocation =  {"Chest Rig Gear Right"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	ensureItem = "Base.Webbing_Black",
	weapons = {
		"Radio.WalkieTalkie4",
	},
}


-- random weapon on police zombies holster
AttachedWeaponDefinitions.policeGrenade = {
	id = "policeGrenade",
	chance = 50,
	outfit = {"Police", "PoliceState", "PoliceRiot", "PrisonGuard", "Security"},
	weaponLocation =  {"Chest Rig Gear"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	ensureItem = "Base.Webbing_Black",
	weapons = {
		"Base.SmokeGrenade",
	},
}


AttachedWeaponDefinitions.emergencyRadio = {
	id = "emergencyRadio",
	chance = 50,
	outfit = {"Fireman", "FiremanFullSuit"},
	weaponLocation =  {"Gear Belt Right"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Radio.WalkieTalkie3",
		"Radio.WalkieTalkie4",
	},
}

AttachedWeaponDefinitions.medicRadio = {
	id = "medicRadio",
	chance = 50,
	outfit = {"AmbulanceDriver", "Doctor", "Nurse"},
	weaponLocation =  {"Gear Belt Right"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Radio.WalkieTalkie3",
	},
}

AttachedWeaponDefinitions.constructionRadio = {
	id = "constructionRadio",
	chance = 50,
	outfit = {"ConstructionWorker", "Foreman", "MallSecurity"},
	weaponLocation =  {"Gear Belt Right"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Radio.WalkieTalkie2",
		"Radio.WalkieTalkie3",
	},
}


AttachedWeaponDefinitions.firstAidKit = {
	id = "firstAidKit",
	chance = 25,
	outfit = {"Doctor"},
	--weaponLocation =  {"Belt Right"},
	weaponLocation =  {"Inventory1"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	---ensureItem = {"Base.Webbing", "Base.strapchest"},
	weapons = {
		"Base.FirstAidKit",
		--"Base.Shotgun",
	},
}



-- Define some custom weapons attached on some specific outfit, so for example police have way more chance to have guns in holster and not simply a spear in stomach or something
AttachedWeaponDefinitions.attachedWeaponCustomOutfit = AttachedWeaponDefinitions.attachedWeaponCustomOutfit or {};

-- AttachedWeaponDefinitions.attachedWeaponCustomOutfit.HockeyPsycho = {
	-- chance = 100;
	-- weapons = {
		-- AttachedWeaponDefinitions.macheteInBack,
	-- },
-- }


AttachedWeaponDefinitions.attachedWeaponCustomOutfit.AmbulanceDriver = {
	chance = 50;
	maxitem = 1;
	weapons = {
		AttachedWeaponDefinitions.medicRadio,
	},
}


AttachedWeaponDefinitions.attachedWeaponCustomOutfit.FiremanFullSuit = {
	chance = 50;
	maxitem = 1;
	weapons = {
		AttachedWeaponDefinitions.emergencyRadio,
	},
}
AttachedWeaponDefinitions.attachedWeaponCustomOutfit.MallSecurity = {
	chance = 50;
	maxitem = 1;
	weapons = {
		AttachedWeaponDefinitions.constructionRadio,
	},
}



AttachedWeaponDefinitions.attachedWeaponCustomOutfit.PrivateMilitia = {
	chance = 50;
	maxitem = 7;
	weapons = {
		AttachedWeaponDefinitions.shotgunPolice,
		AttachedWeaponDefinitions.assaultRifleOnBack,
		AttachedWeaponDefinitions.huntingRifleOnBack,
		AttachedWeaponDefinitions.handgunHolster,
		AttachedWeaponDefinitions.knivesBelt,
		AttachedWeaponDefinitions.nightstick,
		AttachedWeaponDefinitions.armyRadio,
		AttachedWeaponDefinitions.armyCanteenLeft,
		AttachedWeaponDefinitions.armyCanteenRight,
		AttachedWeaponDefinitions.armyGrenade,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.Bandit = {
	chance = 50;
	maxitem = 4;
	weapons = {
		AttachedWeaponDefinitions.meleeInBack,
		AttachedWeaponDefinitions.melee2InBack,
		AttachedWeaponDefinitions.hammerBelt,
		AttachedWeaponDefinitions.knivesBelt,
		AttachedWeaponDefinitions.handgunHolster,
		AttachedWeaponDefinitions.bladeInBack,
		AttachedWeaponDefinitions.armyRadio,
		AttachedWeaponDefinitions.armyGrenade,
	},
}






AttachedWeaponDefinitions.attachedWeaponCustomOutfit.Police = {
	chance = 50;
	maxitem = 3;
	weapons = {
		AttachedWeaponDefinitions.handgunHolster,
		AttachedWeaponDefinitions.shotgunPolice,
		AttachedWeaponDefinitions.nightstick,
		AttachedWeaponDefinitions.policeRadio,
		--AttachedWeaponDefinitions.policeGrenade,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.PoliceState = {
	chance = 50;
	maxitem = 3;
	weapons = {
		AttachedWeaponDefinitions.handgunHolster,
		AttachedWeaponDefinitions.shotgunPolice,
		AttachedWeaponDefinitions.nightstick,
		AttachedWeaponDefinitions.policeRadio,
		--AttachedWeaponDefinitions.policeGrenade,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.PoliceRiot = {
	chance = 90;
	maxitem = 5;
	weapons = {
		AttachedWeaponDefinitions.policeRadio,
		AttachedWeaponDefinitions.policeRadio,
		AttachedWeaponDefinitions.policeGrenade,
		AttachedWeaponDefinitions.handgunHolster,
		AttachedWeaponDefinitions.nightstick,
		AttachedWeaponDefinitions.shotgunPolice,
		AttachedWeaponDefinitions.policeGrenade,
	},
}


AttachedWeaponDefinitions.attachedWeaponCustomOutfit.Doctor = {
	chance = 25;
	maxitem = 1;
	weapons = {
		AttachedWeaponDefinitions.firstAidKit,
	},
}