-- define weapons to be attached to zombies when creating them
-- random knives inside their neck, spear in their stomach, meatcleaver in their back...
-- this is used in IsoZombie.addRandomAttachedWeapon()

AttachedWeaponDefinitions = AttachedWeaponDefinitions or {};

AttachedWeaponDefinitions.chanceOfAttachedWeapon = 6; -- Global chance of having an attached weapon, if we pass this we gonna add randomly one from the list

-- random spear in the stomach
AttachedWeaponDefinitions.MWPspearStomach = {
	chance = 1, -- chance is total, we'll get the chance of every definition and take one from there
	weaponLocation = {"Stomach"}, -- defined in AttachedLocations.lua
	bloodLocations = {"Torso_Lower","Back"}, -- we add blood & hole on this part
	addHoles = true, -- if true, you need at least one bloodLocation
	daySurvived = 0, -- needed day of survival before seeing this one
	weapons = { -- list of possible weapons, we'll take one randomly from there
          	
			"MWPWeapons.aluminiumbaseballbat",
			"MWPWeapons.avengebaseballbat",
			"MWPWeapons.eastonb5baseballbat",			
			"MWPWeapons.louisvillevaporbaseballbat",
			"MWPWeapons.roughneckgorillasledgehammer",
			"MWPWeapons.brooklynsmasher",
			"MWPWeapons.fiskarsplittingmaul",
			
			
	},
}

-- katana in stomach
AttachedWeaponDefinitions.MWPkatanaStomach = {
	chance = 1,
	weaponLocation = {"Stomach"},
	bloodLocations = {"Torso_Lower","Back"},
	addHoles = true,
	daySurvived = 0,
	weapons = {
		"MWPWeapons.syntheticsword",
		"MWPWeapons.gothsamuraisword",
		"MWPWeapons.albtacticalkatana",
		
	
	},
}

-- meat cleaver & some others low weapons (Hand Axes..) in the back
AttachedWeaponDefinitions.MWPmeatCleaverBackLowQuality = {
	chance = 1,
	weaponLocation = {"MeatCleaver in Back"},
	bloodLocations = {"Back"},
	addHoles = true,
	daySurvived = 0,
	weapons = {
		"MWPWeapons.crtkfreyraxe",
		"MWPWeapons.cwcombathatchet",
		"MWPWeapons.dmmiceaxe",
		"MWPWeapons.doomsdaysurvivalaxe",
		"MWPWeapons.gemtord42crashaxe",
		"MWPWeapons.gerberpackhatchet",
		"MWPWeapons.reapertacsickle",
		"MWPWeapons.sogbeardedcampaxe",
		"MWPWeapons.winklersurvivalhatchet",
		"MWPWeapons.gerberdownrangetomahawk",
                "MWPWeapons.sogf19nelite",
		"MWPWeapons.m48tacticalwarhammer",


	},
}

-- Better weapons in the back
AttachedWeaponDefinitions.MWPmeatCleaverBack = {
	chance = 1,
	weaponLocation = {"MeatCleaver in Back"},
	bloodLocations = {"Back"},
	addHoles = true,
	daySurvived = 0,
	weapons = {
		"MWPWeapons.crtkfreyraxe",
		"MWPWeapons.cwcombathatchet",
		"MWPWeapons.dmmiceaxe",
		"MWPWeapons.doomsdaysurvivalaxe",
		"MWPWeapons.gemtord42crashaxe",
		"MWPWeapons.gerberpackhatchet",
		"MWPWeapons.reapertacsickle",
		"MWPWeapons.sogbeardedcampaxe",
		"MWPWeapons.winklersurvivalhatchet",
		"MWPWeapons.gerberdownrangetomahawk",
                "MWPWeapons.sogf19nelite",
		"MWPWeapons.m48tacticalwarhammer",		

	},
}

-- random knife (low quality weapon) in the back
AttachedWeaponDefinitions.MWPknifeLowQualityBack = {
	chance = 1,
	weaponLocation = {"Knife in Back"},
	bloodLocations = {"Back"},
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"MWPWeapons.aitormonterobowieknife",
		"MWPWeapons.arliabutterflyknife",
		"MWPWeapons.assaultvknife",
		"MWPWeapons.cgcombattanto",
		"MWPWeapons.kabar1245tanto",
		"MWPWeapons.khkcombatknife",
		"MWPWeapons.muelahuntingknife",
		"MWPWeapons.rexlerkunai",
		"MWPWeapons.yangjangcolumbiabayonet",
		"MWPWeapons.blitalianstiletto",
		"MWPWeapons.russianakmbayonet",

	},
}

-- Axe in the back
AttachedWeaponDefinitions.MWPaxeBack = {
	chance = 1,
	weaponLocation = {"Axe Back"},
	bloodLocations = {"Back"},
	addHoles = true,
	daySurvived = 0,
	weapons = {
		"MWPWeapons.pythoncampaxe",
		"MWPWeapons.roughneckaxe",
		"MWPWeapons.spydercohatchethawk",	
		
	},
}

-- random knife (better quality) in the back
AttachedWeaponDefinitions.MWPknifeBack = {
	chance = 1,
	weaponLocation = {"Knife in Back"},
	bloodLocations = {"Back"},
	addHoles = false,
	daySurvived = 10,
	weapons = {
		"MWPWeapons.aitormonterobowieknife",
		"MWPWeapons.arliabutterflyknife",
		"MWPWeapons.assaultvknife",
		"MWPWeapons.cgcombattanto",
		"MWPWeapons.kabar1245tanto",
		"MWPWeapons.khkcombatknife",
		"MWPWeapons.muelahuntingknife",
		"MWPWeapons.rexlerkunai",
		"MWPWeapons.yangjangcolumbiabayonet",
        "MWPWeapons.ontariookc10bayonet",
		"MWPWeapons.blitalianstiletto",
		"MWPWeapons.russianakmbayonet",

	
	},
}

-- random knife (low quality weapon) in the left leg
AttachedWeaponDefinitions.MWPknifeLowQualityLeftLeg = {
	chance = 1,
	weaponLocation = {"Knife Left Leg"},
	bloodLocations = {"UpperLeg_L"},
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"MWPWeapons.aitormonterobowieknife",
		"MWPWeapons.arliabutterflyknife",
		"MWPWeapons.assaultvknife",
		"MWPWeapons.cgcombattanto",
		"MWPWeapons.kabar1245tanto",
		"MWPWeapons.khkcombatknife",
		"MWPWeapons.muelahuntingknife",
		"MWPWeapons.rexlerkunai",
		"MWPWeapons.yangjangcolumbiabayonet",
        "MWPWeapons.ontariookc10bayonet",  
		"MWPWeapons.blitalianstiletto",
		"MWPWeapons.russianakmbayonet",

	},
}

-- random knife (better quality) in the left leg
AttachedWeaponDefinitions.MWPknifeLeftLeg = {
	chance = 1,
	weaponLocation = {"Knife Left Leg"},
	bloodLocations = {"UpperLeg_L"},
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"MWPWeapons.aitormonterobowieknife",
		"MWPWeapons.arliabutterflyknife",
		"MWPWeapons.assaultvknife",
		"MWPWeapons.cgcombattanto",
		"MWPWeapons.kabar1245tanto",
		"MWPWeapons.khkcombatknife",
		"MWPWeapons.muelahuntingknife",
		"MWPWeapons.rexlerkunai",
		"MWPWeapons.yangjangcolumbiabayonet",
        "MWPWeapons.ontariookc10bayonet",
		"MWPWeapons.blitalianstiletto",
		"MWPWeapons.russianakmbayonet",
	
	},
}

-- random knife (low quality weapon) in the right leg
AttachedWeaponDefinitions.MWPknifeLowQualityLeftLeg = {
	chance = 1,
	weaponLocation = {"Knife Right Leg"},
	bloodLocations = {"UpperRight_L"},
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"MWPWeapons.aitormonterobowieknife",
		"MWPWeapons.arliabutterflyknife",
		"MWPWeapons.assaultvknife",
		"MWPWeapons.cgcombattanto",
		"MWPWeapons.kabar1245tanto",
		"MWPWeapons.khkcombatknife",
		"MWPWeapons.muelahuntingknife",
		"MWPWeapons.rexlerkunai",
		"MWPWeapons.yangjangcolumbiabayonet",
        "MWPWeapons.ontariookc10bayonet",
		"MWPWeapons.blitalianstiletto",
		"MWPWeapons.russianakmbayonet",

	
	},
}

-- random knife (better quality) in the right leg
AttachedWeaponDefinitions.MWPknifeRightLeg = {
	chance = 1,
	weaponLocation = {"Knife Right Leg"},
	bloodLocations = {"UpperRight_L"},
	addHoles = false,
	daySurvived = 10,
	weapons = {
		"MWPWeapons.aitormonterobowieknife",
		"MWPWeapons.arliabutterflyknife",
		"MWPWeapons.assaultvknife",
		"MWPWeapons.cgcombattanto",
		"MWPWeapons.kabar1245tanto",
		"MWPWeapons.khkcombatknife",
		"MWPWeapons.muelahuntingknife",
		"MWPWeapons.rexlerkunai",
		"MWPWeapons.yangjangcolumbiabayonet",
        "MWPWeapons.ontariookc10bayonet",
		"MWPWeapons.blitalianstiletto",
		"MWPWeapons.russianakmbayonet",
	
	},
}

-- random knife (low quality weapon) in the shoulder
AttachedWeaponDefinitions.MWPknifeLowQualityShoulder = {
	chance = 1,
	weaponLocation = {"Knife Shoulder"},
	bloodLocations = {"UpperArm_L", "Torso_Upper"},
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"MWPWeapons.aitormonterobowieknife",
		"MWPWeapons.arliabutterflyknife",
		"MWPWeapons.assaultvknife",
		"MWPWeapons.cgcombattanto",
		"MWPWeapons.kabar1245tanto",
		"MWPWeapons.khkcombatknife",
		"MWPWeapons.muelahuntingknife",
		"MWPWeapons.rexlerkunai",
		"MWPWeapons.yangjangcolumbiabayonet",
        "MWPWeapons.ontariookc10bayonet",  
		"MWPWeapons.blitalianstiletto",
		"MWPWeapons.russianakmbayonet",

	},
}

-- random knife (better quality) in the shoulder
AttachedWeaponDefinitions.MWPknifeShoulder = {
	chance = 1,
	weaponLocation = {"Knife Shoulder"},
	bloodLocations = {"UpperArm_L", "Torso_Upper"},
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"MWPWeapons.aitormonterobowieknife",
		"MWPWeapons.arliabutterflyknife",
		"MWPWeapons.assaultvknife",
		"MWPWeapons.cgcombattanto",
		"MWPWeapons.kabar1245tanto",
		"MWPWeapons.khkcombatknife",
		"MWPWeapons.muelahuntingknife",
		"MWPWeapons.rexlerkunai",
		"MWPWeapons.yangjangcolumbiabayonet",
        "MWPWeapons.ontariookc10bayonet",
		"MWPWeapons.blitalianstiletto",
		"MWPWeapons.russianakmbayonet",

	},
}

-- Machete in shoulder
AttachedWeaponDefinitions.MWPMacheteShoulder = {
	chance = 1,
	weaponLocation = {"Knife Shoulder"},
	bloodLocations = {"UpperArm_L", "Torso_Upper"},
	addHoles = true,
	daySurvived = 0,
	weapons = {
		"MWPWeapons.crtkkukrimachete",
		"MWPWeapons.defender18machete",
		"MWPWeapons.fiskarcurvedmachete",
		"MWPWeapons.zhunterhookmachete",
                "MWPWeapons.sogfaritantomachete",
                "MWPWeapons.taigamachete",


	
	},
}

-- random knife (low quality weapon) in the stomach
AttachedWeaponDefinitions.MWPknifeLowQualityStomach = {
	chance = 1,
	weaponLocation = {"Knife Stomach"},
	bloodLocations = {"Torso_Lower"},
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"MWPWeapons.aitormonterobowieknife",
		"MWPWeapons.arliabutterflyknife",
		"MWPWeapons.assaultvknife",
		"MWPWeapons.cgcombattanto",
		"MWPWeapons.kabar1245tanto",
		"MWPWeapons.khkcombatknife",
		"MWPWeapons.muelahuntingknife",
		"MWPWeapons.rexlerkunai",
		"MWPWeapons.yangjangcolumbiabayonet",
		"MWPWeapons.britishp1856pioneers",
        "MWPWeapons.ontariookc10bayonet", 
		"MWPWeapons.blitalianstiletto",
		"MWPWeapons.russianakmbayonet",




	},
}

-- random knife (better quality) in the stomach
AttachedWeaponDefinitions.MWPknifeStomach = {
	chance = 1,
	weaponLocation = {"Knife Stomach"},
	bloodLocations = {"Torso_Lower", "Back"},
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"MWPWeapons.aitormonterobowieknife",
		"MWPWeapons.arliabutterflyknife",
		"MWPWeapons.assaultvknife",
		"MWPWeapons.cgcombattanto",
		"MWPWeapons.kabar1245tanto",
		"MWPWeapons.khkcombatknife",
		"MWPWeapons.muelahuntingknife",
		"MWPWeapons.rexlerkunai",
		"MWPWeapons.yangjangcolumbiabayonet",
		"MWPWeapons.britishp1856pioneers",
        "MWPWeapons.ontariookc10bayonet",
		"MWPWeapons.blitalianstiletto",
		"MWPWeapons.russianakmbayonet",

		
	},
}

-- random weapon in stomach
AttachedWeaponDefinitions.MWPweaponInStomach = {
	chance = 1,
	weaponLocation = {"Knife Stomach"},
	bloodLocations = {"Torso_Lower", "Back"},
	addHoles = true,
	daySurvived = 0,
	weapons = {
		"MWPWeapons.crtkkukrimachete",
		"MWPWeapons.defender18machete",
		"MWPWeapons.fiskarcurvedmachete",
		"MWPWeapons.zhunterhookmachete",
		"MWPWeapons.pythoncampaxe",
		"MWPWeapons.roughneckaxe",
		"MWPWeapons.spydercohatchethawk",
		"MWPWeapons.syntheticsword",
		"MWPWeapons.gothsamuraisword",
		"MWPWeapons.albtacticalkatana",
		"MWPWeapons.brooklynsmasher",
		"MWPWeapons.fiskarsplittingmaul",
                "MWPWeapons.sogfaritantomachete",


		
	},
}

-- crowbar in the back
AttachedWeaponDefinitions.MWPcrowbarBack = {
	chance = 4,
	weaponLocation = {"Crowbar Back"},
	bloodLocations = {"Back"},
	addHoles = true,
	daySurvived = 0,
	weapons = {
		
	},
}


-- random construction tools on construction worker
AttachedWeaponDefinitions.MWPconstructionWorker = {
	chance = 80,
	outfit = {"ConstructionWorker", "Foreman"},
	weaponLocation = {"Belt Left", "Belt Right"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"MWPWeapons.crtkfreyraxe",
		"MWPWeapons.cwcombathatchet",
		"MWPWeapons.doomsdaysurvivalaxe",
		"MWPWeapons.gerberpackhatchet",
		"MWPWeapons.oxnailhammer",
		"MWPWeapons.winklersurvivalhatchet",
		"MWPWeapons.fatmaxbrickhammer",
		"MWPWeapons.sogbeardedcampaxe",

	
	},
}


-- hand axe on lumberjack
AttachedWeaponDefinitions.MWPlumberjack = {
	chance = 80,
	outfit = {"McCoys"},
	weaponLocation = {"Belt Left", "Belt Right"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"MWPWeapons.crtkfreyraxe",
		"MWPWeapons.cwcombathatchet",
		"MWPWeapons.doomsdaysurvivalaxe",
		"MWPWeapons.gerberpackhatchet",
		"MWPWeapons.oxnailhammer",
		"MWPWeapons.winklersurvivalhatchet",
		"MWPWeapons.fatmaxbrickhammer",
		"MWPWeapons.sogbeardedcampaxe",
		"MWPWeapons.gerberdownrangetomahawk",
	
	},
}

-- various melee weapon attached in back
AttachedWeaponDefinitions.MWPmeleeInBack = {
	chance = 50,
	outfit = {"Bandit"},
	weaponLocation = {"Shovel Back"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"MWPWeapons.crtkkukrimachete",
		"MWPWeapons.defender18machete",
		"MWPWeapons.fiskarcurvedmachete",
		"MWPWeapons.zhunterhookmachete",
		"MWPWeapons.dmmiceaxe",
		"MWPWeapons.brooklynsmasher",
                "MWPWeapons.sogfaritantomachete",
		
	},
}

-- more melee in back!
AttachedWeaponDefinitions.MWPmelee2InBack = {
	chance = 60,
	outfit = {"Bandit"},
	weaponLocation = {"Big Weapon On Back"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"MWPWeapons.crtkkukrimachete",
		"MWPWeapons.defender18machete",
		"MWPWeapons.fiskarcurvedmachete",
		"MWPWeapons.zhunterhookmachete",
		"MWPWeapons.dmmiceaxe",
                "MWPWeapons.sogfaritantomachete",
		"MWPWeapons.brooklynsmasher",
	

	},
}

-- hammer/axe in belt left (so we keep knives for belt right if we got multiple items)
AttachedWeaponDefinitions.MWPhammerBelt = {
	chance = 80,
	outfit = {"Bandit"},
	weaponLocation = {"Belt Left"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"MWPWeapons.crtkfreyraxe",
		"MWPWeapons.cwcombathatchet",
		"MWPWeapons.doomsdaysurvivalaxe",
		"MWPWeapons.gerberpackhatchet",
		"MWPWeapons.oxnailhammer",
		"MWPWeapons.winklersurvivalhatchet",
		"MWPWeapons.fatmaxbrickhammer",
		"MWPWeapons.sogbeardedcampaxe",
		"MWPWeapons.gerberdownrangetomahawk",
		
	},
}

-- knives in belt right
AttachedWeaponDefinitions.MWPknivesBelt = {
	chance = 80,
	outfit = {"Bandit"},
	weaponLocation = {"Belt Right Upside"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"MWPWeapons.aitormonterobowieknife",
		"MWPWeapons.arliabutterflyknife",
		"MWPWeapons.assaultvknife",
		"MWPWeapons.cgcombattanto",
		"MWPWeapons.kabar1245tanto",
		"MWPWeapons.khkcombatknife",
		"MWPWeapons.muelahuntingknife",
		"MWPWeapons.rexlerkunai",
		"MWPWeapons.yangjangcolumbiabayonet",
		
	},
}

-- crowbar or machete in back
AttachedWeaponDefinitions.MWPbladeInBack = {
	chance = 20,
	outfit = {"Bandit"},
	weaponLocation = {"Blade On Back"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"MWPWeapons.crtkkukrimachete",
		"MWPWeapons.defender18machete",
		"MWPWeapons.fiskarcurvedmachete",
		"MWPWeapons.zhunterhookmachete",
		"MWPWeapons.dmmiceaxe",
	
	},
}

-- machete in back
AttachedWeaponDefinitions.MWPmacheteInBack = {
	chance = 20,
	outfit = {"HockeyPsycho"},
	weaponLocation = {"Blade On Back"},
	bloodLocations = nil,
	addHoles = false,
	daySurvived = 0,
	weapons = {
		"MWPWeapons.crtkkukrimachete",
		"MWPWeapons.defender18machete",
		"MWPWeapons.fiskarcurvedmachete",
		"MWPWeapons.zhunterhookmachete",
		"MWPWeapons.dmmiceaxe",
                "MWPWeapons.sogfaritantomachete",
		
	},
}


    -- nightstick in belt                         [ ITS IN PROGRESS ]
--AttachedWeaponDefinitions.nightstick = {
--	chance = 30,
--	outfit = {"Police", "PoliceState", "PoliceRiot", "PrisonGuard", "PrivateMilitia"},
--	weaponLocation = {"Nightstick Left"},
--	bloodLocations = nil,
--	addHoles = false,
--	daySurvived = 0,
--	weapons = {
--		"MWPWeapons.",
	
		
--	},
--}

-- Define some custom weapons attached on some specific outfit, so for example police have way more chance to have guns in holster and not simply a spear in stomach or something
AttachedWeaponDefinitions.attachedWeaponCustomOutfit = {};

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.HockeyPsycho = {
	chance = 100;
	weapons = {
		AttachedWeaponDefinitions.MWPmacheteInBack,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.PrivateMilitia = {
	chance = 50;
	maxitem = 3;
	weapons = {
		AttachedWeaponDefinitions.MWPknivesBelt,
		AttachedWeaponDefinitions.MWPnightstick,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.Bandit = {
	chance = 50;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.MWPmeleeInBack,
		AttachedWeaponDefinitions.MWPmelee2InBack,
		AttachedWeaponDefinitions.MWPhammerBelt,
		AttachedWeaponDefinitions.MWPknivesBelt,
		AttachedWeaponDefinitions.MWPbladeInBack,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.Police = {
	chance = 50;
	maxitem = 2;
	weapons = {
		AttachedWeaponDefinitions.MWPnightstick,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.PoliceState = {
	chance = 50;
	maxitem = 2;
	weapons = {

		AttachedWeaponDefinitions.MWPnightstick,
	},
}

AttachedWeaponDefinitions.attachedWeaponCustomOutfit.PoliceRiot = {
	chance = 60;
	maxitem = 3;
	weapons = {

		AttachedWeaponDefinitions.MWPnightstick,

	},
}