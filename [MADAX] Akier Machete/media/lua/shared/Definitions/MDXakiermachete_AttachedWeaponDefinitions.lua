AttachedWeaponDefinitions = AttachedWeaponDefinitions or {};

AttachedWeaponDefinitions.chanceOfAttachedWeapon = 6; -- Global chance of having an attached weapon, if we pass this we gonna add randomly one from the list


-- Machete in shoulder
AttachedWeaponDefinitions.MacheteShoulder = {
	chance = 1,
	weaponLocation = {"Knife Shoulder"},
	bloodLocations = {"UpperArm_L", "Torso_Upper"},
	addHoles = true,
	daySurvived = 20,
	weapons = {
		"Base.akiermachete",
	},
}

-- random weapon in stomach
AttachedWeaponDefinitions.weaponInStomach = {
	chance = 1,
	weaponLocation = {"Knife Stomach"},
	bloodLocations = {"Torso_Lower", "Back"},
	addHoles = true,
	daySurvived = 10,
	weapons = {
		"Base.akiermachete",
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
		"Base.akiermachete",
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
		"Base.akiermachete",
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
		"Base.akiermachete",
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
		"Base.akiermachete", 
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