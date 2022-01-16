require "Definitions/AttachedWeaponDefinitions"

-- zombie tokens
AttachedWeaponDefinitions.banshee = {
	chance = 100,
	weaponLocation = {"Stomach"},
	outfit = {"Banshee"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Base.Token_Banshee",
	},
}

AttachedWeaponDefinitions.noTeeth = {
	chance = 100,
	weaponLocation = {"Stomach"},
	outfit = {"NoTeeth"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Base.Token_NoTeeth",
	},
}

AttachedWeaponDefinitions.onlyJawStab = {
	chance = 100,
	weaponLocation = {"Stomach"},
	outfit = {"Nemesis"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Base.Token_OnlyJawStab",
	},
}

AttachedWeaponDefinitions.skeleton = {
	chance = 100,
	weaponLocation = {"Stomach"},
	outfit = {"Skeleton"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Base.Token_Skeleton",
	},
}

AttachedWeaponDefinitions.useless = {
	chance = 100,
	weaponLocation = {"Stomach"},
	outfit = {"Useless"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"Base.Token_Useless",
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.Nemesis = {
	chance = 100;
	maxitem = 1;
	weapons = {
		AttachedWeaponDefinitions.onlyJawStab,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.Banshee = {
	chance = 100;
	maxitem = 1;
	weapons = {
		AttachedWeaponDefinitions.banshee,
	},
}