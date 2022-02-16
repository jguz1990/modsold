VehicleZoneDistribution = VehicleZoneDistribution or {};

VehicleZoneDistribution.parkingstall.vehicles["Base.TrailerForBoat"] = {index = -1, spawnChance = 1};

VehicleZoneDistribution.trailerpark.vehicles["Base.TrailerWithBoatSailingYacht"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trailerpark.vehicles["Base.TrailerWithBoatMotor"] = {index = -1, spawnChance = 1};

VehicleZoneDistribution.medium.vehicles["Base.TrailerWithBoatSailingYacht"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.medium.vehicles["Base.TrailerWithBoatMotor"] = {index = -1, spawnChance = 1};

VehicleZoneDistribution.good.vehicles["Base.TrailerWithBoatSailingYacht"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.good.vehicles["Base.TrailerWithBoatMotor"] = {index = -1, spawnChance = 1};

if not VehicleZoneDistribution.sea or not VehicleZoneDistribution.sea.vehicles then
    VehicleZoneDistribution.sea = {};
    VehicleZoneDistribution.sea.vehicles = {};
end

VehicleZoneDistribution.sea.vehicles["Base.BoatSailingYacht"] = {index = -1, spawnChance = 50};
VehicleZoneDistribution.sea.vehicles["Base.BoatMotor"] = {index = -1, spawnChance = 50};
VehicleZoneDistribution.sea.specialCar = false;
VehicleZoneDistribution.sea.chanceToSpawnSpecial = 0;
VehicleZoneDistribution.sea.randomAngle = true;
VehicleZoneDistribution.sea.spawnRate = 30; -- 30

if not VehicleZoneDistribution.river or not VehicleZoneDistribution.river.vehicles then
    VehicleZoneDistribution.river = {};
    VehicleZoneDistribution.river.vehicles = {};
end

VehicleZoneDistribution.river.vehicles["Base.BoatSailingYacht"] = {index = -1, spawnChance = 50};
VehicleZoneDistribution.river.vehicles["Base.BoatMotor"] = {index = -1, spawnChance = 50};
VehicleZoneDistribution.river.specialCar = false;
VehicleZoneDistribution.river.chanceToSpawnSpecial = 0;
VehicleZoneDistribution.river.spawnRate = 30; -- 30

if not VehicleZoneDistribution.harbour or not VehicleZoneDistribution.harbour.vehicles then
    VehicleZoneDistribution.harbour = {};
    VehicleZoneDistribution.harbour.vehicles = {};
end
VehicleZoneDistribution.harbour.vehicles["Base.BoatMotor"] = {index = -1, spawnChance = 50};
VehicleZoneDistribution.harbour.vehicles["Base.BoatSailingYacht"] = {index = -1, spawnChance = 50};
VehicleZoneDistribution.harbour.specialCar = false;
VehicleZoneDistribution.harbour.chanceToSpawnSpecial = 0;
VehicleZoneDistribution.harbour.spawnRate = 80;

if not VehicleZoneDistribution.smallboat or not VehicleZoneDistribution.smallboat.vehicles then
    VehicleZoneDistribution.smallboat = {};
    VehicleZoneDistribution.smallboat.vehicles = {};
end
VehicleZoneDistribution.smallboat.vehicles["Base.BoatMotor"] = {index = -1, spawnChance = 100};
VehicleZoneDistribution.smallboat.specialCar = false;
VehicleZoneDistribution.smallboat.chanceToSpawnSpecial = 0;
VehicleZoneDistribution.smallboat.spawnRate = 80;

if not VehicleZoneDistribution.middleboat or not VehicleZoneDistribution.middleboat.vehicles then
    VehicleZoneDistribution.middleboat = {};
    VehicleZoneDistribution.middleboat.vehicles = {};
end
VehicleZoneDistribution.middleboat.vehicles["Base.BoatMotor"] = {index = -1, spawnChance = 100};
VehicleZoneDistribution.middleboat.specialCar = false;
VehicleZoneDistribution.middleboat.chanceToSpawnSpecial = 0;
VehicleZoneDistribution.middleboat.spawnRate = 80;

if not VehicleZoneDistribution.bigboat or not VehicleZoneDistribution.bigboat.vehicles then
    VehicleZoneDistribution.bigboat = {};
    VehicleZoneDistribution.bigboat.vehicles = {};
end
VehicleZoneDistribution.bigboat.vehicles["Base.BoatSailingYacht"] = {index = -1, spawnChance = 100};
VehicleZoneDistribution.bigboat.spawnRate = 80;
VehicleZoneDistribution.bigboat.specialCar = false;
VehicleZoneDistribution.bigboat.chanceToSpawnSpecial = 0;


if not VehicleZoneDistribution.shipwreckland or not VehicleZoneDistribution.shipwreckland.vehicles then
    VehicleZoneDistribution.shipwreckland = {};
    VehicleZoneDistribution.shipwreckland.vehicles = {};
end
VehicleZoneDistribution.shipwreckland.vehicles["Base.BoatSailingYacht_shipwreckland"] = {index = -1, spawnChance = 100};
VehicleZoneDistribution.shipwreckland.spawnRate = 80;
VehicleZoneDistribution.shipwreckland.specialCar = false;
VehicleZoneDistribution.shipwreckland.randomAngle = true;
VehicleZoneDistribution.shipwreckland.chanceToSpawnSpecial = 0;

if not VehicleZoneDistribution.shipwreckwater or not VehicleZoneDistribution.shipwreckwater.vehicles then
    VehicleZoneDistribution.shipwreckwater = {};
    VehicleZoneDistribution.shipwreckwater.vehicles = {};
end
VehicleZoneDistribution.shipwreckwater.vehicles["Base.BoatSailingYacht_shipwreckwater"] = {index = -1, spawnChance = 100};
VehicleZoneDistribution.shipwreckwater.spawnRate = 80;
VehicleZoneDistribution.shipwreckwater.specialCar = false;
VehicleZoneDistribution.shipwreckwater.randomAngle = true;
VehicleZoneDistribution.shipwreckwater.chanceToSpawnSpecial = 0;