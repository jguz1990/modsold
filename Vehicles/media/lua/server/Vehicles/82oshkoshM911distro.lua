--***********************************************************
--**                          KI5                          **
--***********************************************************

local distributionTable = VehicleDistributions[1]

VehicleDistributions.M911Trunk = {
    rolls = 2,
    items ={
	"OshkoshShirts.TShirt_OshkoshGray", 5,
	"OshkoshShirts.TShirt_OshkoshBlack", 5,
	"OshkoshShirts.TShirt_bknht", 3,
	"OshkoshShirts.Hoodie_OshkoshBlack", 5,
	"OshkoshShirts.Hoodie_OshkoshGray", 5,
	"EngineParts", 10,
    }
}

VehicleDistributions.M911Toolbox = {
    rolls = 10,
    items ={
	"Axe", 6,
	"Crowbar", 3,
	"Hammer", 5,
	"BlowTorch", 3,
	"Sledgehammer", 2,
	"Screwdriver", 7,
	"Saw", 5,
	"Torch", 5,
	"PetrolCan", 9,
	"EmptyPetrolCan", 9,
	"Jack", 6,
	"TirePump", 8,
	"Wrench", 8,
	"Extinguisher", 5,
	"CarBatteryCharger", 2,
	"EngineParts", 2,
	"LugWrench", 7,
    }
}

VehicleDistributions.M911SpareTire = {
	rolls = 1,
        items = {
        "V100Tire2", 500,
    }
}

VehicleDistributions.M911 = {

	GloveBox = VehicleDistributions.GloveBox;
	
	M911Trunk = VehicleDistributions.M911Trunk;
	M911Toolbox = VehicleDistributions.M911Toolbox;
	M911SpareTire = VehicleDistributions.M911SpareTire;
}

distributionTable["82oshkoshM911"] = { Normal = VehicleDistributions.M911; }
distributionTable["82oshkoshM911B"] = { Normal = VehicleDistributions.M911; }
distributionTable["82oshkoshM911Burnt"] = { Normal = VehicleDistributions.M911; }

distributionTable["TrailerM127stake"] = distributionTable["Trailer"]
distributionTable["TrailerM128van"] = distributionTable["Trailer"]
distributionTable["TrailerM129van"] = distributionTable["Trailer"]
distributionTable["TrailerM747lowbed"] = distributionTable["Trailer"]
distributionTable["TrailerM967tanker"] = distributionTable["Trailer"]