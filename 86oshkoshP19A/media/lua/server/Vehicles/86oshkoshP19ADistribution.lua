--***********************************************************
--**                          KI5                          **
--***********************************************************

local distributionTable = VehicleDistributions[1]

VehicleDistributions.P19AGloveBox = {
    rolls = 4,
    items ={
        "Pistol", 3,
        "9mmClip", 2,
        "Bullets9mm", 1,
	"556Clip", 1,
        "556Box", 1,
	"HuntingKnife", 2,
        "FirstAidKit", 5,
    }
}

VehicleDistributions.P19AGloveBoxCiv = {
    rolls = 5,
    items ={
        "Radio.WalkieTalkie5", 3,
        "FirstAidKit", 2,
    }
}

VehicleDistributions.smallTrunk = {
    rolls = 2,
    items ={
        "Bag_ALICEpack_Army", 2,
        "Vest_BulletArmy", 2,
        "Hat_Army", 3,
        "Hat_GasMask", 2,
	"HolsterSimple", 3,
        "Trousers_CamoGreen", 3,
        "Shirt_CamoGreen", 3,
        "Jacket_ArmyCamoGreen", 1,
        "Hat_BonnieHat_CamoGreen", 1,
        "Hat_PeakedCapArmy", 0.5,
        "Hat_BeretArmy", 0.5,
        "Jacket_CoatArmy", 0.5,
        "Shoes_ArmyBoots", 1,
        "Shirt_CamoGreen", 1,
        "Radio.WalkieTalkie5", 2,
        "HuntingKnife", 3,
        "FirstAidKit", 3,
	"EmptyPetrolCan", 4,
	"PetrolCan", 2,
	
    }
}

VehicleDistributions.smallTrunkCiv = {
    rolls = 3,
    items ={
	"Hat_Fireman", 3,
	"Jacket_Fireman", 3,
        "Radio.WalkieTalkie5", 2,
	"EmptyPetrolCan", 5,
	"PetrolCan", 2,
        "Radio.WalkieTalkie4",2,
        "Radio.WalkieTalkie5",2,
        "farming.WateredCan", 3,
        "Bandage", 2,
        "Bandage", 2,
        "FirstAidKit", 1,
        "FirstAidKit", 1,
        "Bandaid", 2,
        "Bandaid", 2,
        "Tweezers", 4,
        "Disinfectant", 4,
        "AlcoholWipes", 3,
        "SutureNeedle", 2,
	
    }
}

VehicleDistributions.bigTrunk = {
    rolls = 2,
    items ={
        "V100Tire2", 10,
        "FiberglassStock", 2,
        "RecoilPad", 1,
        "RedDot", 1,
        "Bag_ALICEpack_Army", 2,
        "Vest_BulletArmy", 2,
        "556Clip", 3,
        "556Box", 3,
        "Boilersuit_Flying", 3,
        "Hat_Army", 3,
        "Hat_GasMask", 3,
        "AssaultRifle", 2,
        "Pistol", 3,
        "9mmClip", 3,
        "9mmClip", 3,
        "Bullets9mm", 3,
        "Bullets9mm", 3,
	"HolsterSimple", 3,
        "Trousers_CamoGreen", 4,
        "Shirt_CamoGreen", 1,
        "Jacket_ArmyCamoGreen", 1,
        "Hat_BonnieHat_CamoGreen", 1,
        "Ghillie_Top", 0.5,
        "Ghillie_Trousers", 0.5,
    	"Vest_BulletArmy", 0.5,
        "Hat_PeakedCapArmy", 0.5,
        "Hat_BeretArmy", 0.5,
        "Jacket_CoatArmy", 0.5,
        "Shoes_ArmyBoots", 1,
        "Shirt_CamoGreen", 1,
        "Radio.WalkieTalkie5", 2,
        "HuntingKnife", 2,
        "FirstAidKit", 3,
	"EmptyPetrolCan", 3,
	"PetrolCan", 2,
	"x2Scope", 0.3,
	"x4Scope", 0.4,
	"x8Scope", 0.2,
	
    }
}

VehicleDistributions.bigTrunkCiv = {
    rolls = 2,
    items ={
        "V100Tire2", 10,
	"Hat_Fireman", 5,
	"Jacket_Fireman", 5,
	"Trousers_Fireman", 5,
        "Hat_GasMask", 3,
        "Radio.WalkieTalkie5", 3,
        "FirstAidKit", 3,
	"EmptyPetrolCan", 3,
	"PetrolCan", 2,
	"Shoes_Wellies", 3,
        "Axe", 3,
        "Radio.WalkieTalkie4",2,
        "Radio.WalkieTalkie5",2,
        "farming.WateredCan", 3,
        "Bandage", 2,
        "Bandage", 2,
        "FirstAidKit", 1,
        "FirstAidKit", 1,
        "Bandaid", 2,
        "Bandaid", 2,
        "Tweezers", 4,
        "Disinfectant", 4,
        "AlcoholWipes", 3,
        "SutureNeedle", 2,
	
    }
}

VehicleDistributions.P19ACiv = {
	
	GloveBox = VehicleDistributions.P19AGloveBoxCiv;

	P19ABigTrunkCompartment0 = VehicleDistributions.bigTrunkCiv;
	P19ASmallTrunkCompartment1 = VehicleDistributions.smallTrunkCiv;
	P19ASmallTrunkCompartment2 = VehicleDistributions.smallTrunkCiv;
	P19ASmallTrunkCompartment3 = VehicleDistributions.smallTrunkCiv;
}


VehicleDistributions.P19A = {
	
	GloveBox = VehicleDistributions.P19AGloveBox;

	P19ABigTrunkCompartment0 = VehicleDistributions.bigTrunk;
	P19ASmallTrunkCompartment1 = VehicleDistributions.smallTrunk;
	P19ASmallTrunkCompartment2 = VehicleDistributions.smallTrunk;
	P19ASmallTrunkCompartment3 = VehicleDistributions.smallTrunk;
}


distributionTable["86oshkoshUSMC"] = { Normal = VehicleDistributions.P19A; }
distributionTable["86oshkoshKYFD"] = { Normal = VehicleDistributions.P19ACiv; }
distributionTable["86oshkoshFRTR55"] = { Normal = VehicleDistributions.P19A; }
distributionTable["86oshkoshP19ABurnt"] = { Normal = VehicleDistributions.P19A; }

distributionTable["TrailerM1082"] = distributionTable["Trailer"]
distributionTable["TrailerM1082tarp"] = distributionTable["Trailer"]
distributionTable["TrailerM1095"] = distributionTable["Trailer"]
distributionTable["TrailerM1095tarp"] = distributionTable["Trailer"]