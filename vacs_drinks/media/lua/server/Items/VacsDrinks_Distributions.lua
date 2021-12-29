require "Items/Distributions"
require "Items/ProceduralDistributions"
require "Vehicles/VehicleDistributions"

local i, j

local enableImmersion = VACS_DRINKS_MO.OPTIONS.box1

local alcoholspawnTable = {
  "BandPracticeFridge", 5,
  "BarCounterLiquor", 4,
  "BarCounterLiquor", 2,
  "BarCounterWeapon", 3,
  "BarShelfLiquor", 4,
  "BarShelfLiquor", 2,
  "BreweryCans", 6,
  "BreweryCans", 4,
  "FridgeBeer", 4,
  "FridgeBeer", 2,
  "FridgeGeneric", 2,
  "KitchenBottles", 2,
  "StoreShelfBeer", 4,
  "StoreShelfBeer", 2,
  "FridgeTrailerPark", 5,
  "FridgeTrailerPark", 2,
}

local alcoholitemTable = {}

if(enableImmersion)
then
  alcoholitemTable = {
    "VDK.VAC_Can_Budlight", 1,
    "VDK.VAC_Can_Budweiser", 0.8,
    "VDK.VAC_Can_CoorsLight", 0.8,
    "VDK.VAC_Can_CoronaExtra", 0.6,
    "VDK.VAC_Can_Heineken",  0.6,
    "VDK.VAC_Can_MillerLite", 0.6,
    "VDK.VAC_Can_Modelo", 1,
    "VDK.VAC_Can_BlueRibbon", 0.8,
  }
else
  alcoholitemTable = {
    "VDK.VAC_Can_Budlight", 1,
    "VDK.VAC_Can_Budweiser", 0.8,
    "VDK.VAC_Can_CoorsLight", 0.8,
    "VDK.VAC_Can_CoronaExtra", 0.6,
    "VDK.VAC_Can_Heineken",  0.6,
    "VDK.VAC_Can_MillerLite", 0.6,
    "VDK.VAC_Can_Modelo", 1,
    "VDK.VAC_Can_BlueRibbon", 0.8,
    "VDK.VAC_Can_BlueMoon", 0.8,
  }
end

for i = 1, #alcoholspawnTable, 2 do
  for j = 1, #alcoholitemTable, 2 do
    table.insert(ProceduralDistributions.list[alcoholspawnTable[i]].items, alcoholitemTable[j])
    table.insert(ProceduralDistributions.list[alcoholspawnTable[i]].items, alcoholspawnTable[i+1] * alcoholitemTable[j+1])
  end
end

local nonalcoholspawnTable = {
  "BandPracticeFridge", 3,
  "BarCounterMisc", 2,
  "BarCounterMisc", 1,
  "CafeteriaDrinks", 2,
  "CrateSodaCans", 3,
  "CrateSodaCans", 3,
  "FridgeBreakRoom", 2,
  "FridgeBreakRoom", 1,
  "FridgeOffice", 2,
  "FridgeOffice", 1,
  "FridgeSoda", 3,
  "FridgeTrailerPark", 1,
  "GigamartBottles", 4,
  "GigamartBottles", 2,
  "KitchenBottles", 2,
  "MotelFridge", 2,
  "StoreShelfCombo", 3,
  "StoreShelfCombo", 1,
  "StoreShelfDrinks", 3,
  "StoreShelfDrinks", 1,
  "TheatreDrinks", 3,
  "FridgeTrailerPark", 2,
}

local nonalcoholitemTable = {}

if(enableImmersion)
then
  nonalcoholitemTable = {
    "VDK.VAC_Can_RedBull", 0.6,
    "VDK.VAC_Can_CocaCola", 0.8,
    "VDK.VAC_Can_Pepsi", 0.8,
    "VDK.VAC_Can_DietCoke", 0.4,
    "VDK.VAC_Can_DrPepper", 0.6,
    "VDK.VAC_Can_MountainDew", 0.6,
    "VDK.VAC_Can_Sprite", 0.6,
    "VDK.VAC_Can_DietPepsi", 0.4,
    "VDK.VAC_Can_Fanta", 0.6,
  }
else
  nonalcoholitemTable = {
    "VDK.VAC_Can_Burn", 0.6,
    "VDK.VAC_Can_Monster", 0.5,
    "VDK.VAC_Can_Nos", 0.5,
    "VDK.VAC_Can_RedBull", 0.6,
    "VDK.VAC_Can_Rockstar", 0.4,
    "VDK.VAC_Can_CocaCola", 0.8,
    "VDK.VAC_Can_Pepsi", 0.8,
    "VDK.VAC_Can_DietCoke", 0.4,
    "VDK.VAC_Can_DrPepper", 0.6,
    "VDK.VAC_Can_MountainDew", 0.6,
    "VDK.VAC_Can_Sprite", 0.6,
    "VDK.VAC_Can_DietPepsi", 0.4,
    "VDK.VAC_Can_Fanta", 0.6,
  }
end

for i = 1, #nonalcoholspawnTable, 2 do
  for j = 1, #nonalcoholitemTable, 2 do
    table.insert(ProceduralDistributions.list[nonalcoholspawnTable[i]].items, nonalcoholitemTable[j])
    table.insert(ProceduralDistributions.list[nonalcoholspawnTable[i]].items, nonalcoholspawnTable[i+1] * nonalcoholitemTable[j+1])
  end
end
