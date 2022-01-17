-- require 'Vehicles/VehicleDistributions'
local distributionTable = VehicleDistributions[1]

VehicleDistributions.CamperCounter = {
	rolls = 2,
	items = {
                "CookieJelly", 1,
                "CookieChocolateChip", 1,
                "Candycane", 1,
                "Mugl", 10,
                "Matches", 5,
                "Lighter", 3,
                "Cereal", 3,
                "Salt", 2,
                "Pepper", 2,
                "SunflowerSeeds", 0.5,
                "KitchenKnife", 5,
                "WhiskeyFull", 3,
                "TinnedSoup", 3,
                "TinnedBeans", 3,
                "CannedCornedBeef", 2,
                "Macandcheese", 2,
                "CannedChili", 2,
                "CannedBolognese", 2,
                "CannedCarrots2", 2,
                "CannedCorn", 2,
                "CannedMushroomSoup", 2,
                "CannedPeas", 2,
                "CannedPotato2", 2,
                "CannedSardines", 2,
                "CannedTomato2", 2,
                "TVDinner", 4,
                "Chocolate", 4,
                "TinOpener", 15,
                "Pot", 10,
                "Saucepan", 10,
                "ButterKnife", 10,
                "ButterKnife", 10,
                "Spoon", 20,
                "Spoon", 20,
                "Fork", 20,
                "Fork", 20,
                "Bowl", 10,
                "Bowl", 10,
                "DishCloth", 5,
                "Kettle", 3,
                "Coffee2", 3,
                "Sugar", 3,
                "Teabag2", 3,
                "TunaTin", 3,
                "PeanutButter", 3,
                "Pan", 9,
                "Ramen", 3,
                "Popcorn", 3,
                "Crisps2", 4,
                "Crisps3", 4,
                "Crisps", 4,
                "Wine2", 2,
	}
}

VehicleDistributions.CamperVan = {
	Counter1 = VehicleDistributions.CamperCounter;
	Counter2 = VehicleDistributions.CamperCounter;
	Counter3 = VehicleDistributions.CamperCounter;
	Counter4 = VehicleDistributions.CamperCounter;
	Fridge = VehicleDistributions.Groceries;
}

distributionTable["86bounder"] = { Normal = VehicleDistributions.CamperVan; }
distributionTable["86econolinerv"] = { Normal = VehicleDistributions.CamperVan; }
