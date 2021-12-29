VehicleZoneDistribution = VehicleZoneDistribution or {};

VehicleZoneDistribution.parkingstall.vehicles["Base.TrailerWithBoatSailingYacht"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.parkingstall.vehicles["Base.TrailerWithBoatMotor"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.parkingstall.vehicles["Base.TrailerForBoat"] = {index = -1, spawnChance = 1};

VehicleZoneDistribution.trailerpark.vehicles["Base.TrailerWithBoatSailingYacht"] = {index = -1, spawnChance = 4};
VehicleZoneDistribution.trailerpark.vehicles["Base.TrailerWithBoatMotor"] = {index = -1, spawnChance = 4};

-- VehicleZoneDistribution.bad.vehicles["Base.TrailerWithBoatSailingYacht"] = {index = -1, spawnChance = 1};
-- VehicleZoneDistribution.bad.vehicles["Base.TrailerWithBoatMotor"] = {index = -1, spawnChance = 1};

VehicleZoneDistribution.medium.vehicles["Base.TrailerWithBoatSailingYacht"] = {index = -1, spawnChance = 3};
VehicleZoneDistribution.medium.vehicles["Base.TrailerWithBoatMotor"] = {index = -1, spawnChance = 3};

VehicleZoneDistribution.good.vehicles["Base.TrailerWithBoatSailingYacht"] = {index = -1, spawnChance = 3};
VehicleZoneDistribution.good.vehicles["Base.TrailerWithBoatMotor"] = {index = -1, spawnChance = 3};

VehicleZoneDistribution.sea = {};
VehicleZoneDistribution.sea.vehicles = {};
VehicleZoneDistribution.sea.vehicles["Base.BoatSailingYacht"] = {index = -1, spawnChance = 50};
VehicleZoneDistribution.sea.vehicles["Base.BoatMotor"] = {index = -1, spawnChance = 50};
VehicleZoneDistribution.sea.specialcar = false;
VehicleZoneDistribution.sea.randomAngle = true;
VehicleZoneDistribution.sea.spawnRate = 80;

VehicleZoneDistribution.river = {};
VehicleZoneDistribution.river.vehicles = {};
VehicleZoneDistribution.river.vehicles["Base.BoatSailingYacht"] = {index = -1, spawnChance = 50};
VehicleZoneDistribution.river.vehicles["Base.BoatMotor"] = {index = -1, spawnChance = 50};
VehicleZoneDistribution.river.specialcar = false;
VehicleZoneDistribution.river.spawnRate = 80;

VehicleZoneDistribution.harbour = {};
VehicleZoneDistribution.harbour.vehicles = {};
VehicleZoneDistribution.harbour.vehicles["Base.BoatMotor"] = {index = -1, spawnChance = 50};
VehicleZoneDistribution.harbour.vehicles["Base.BoatSailingYacht"] = {index = -1, spawnChance = 50};
VehicleZoneDistribution.harbour.specialcar = false;
VehicleZoneDistribution.harbour.spawnRate = 80;

VehicleZoneDistribution.middleboat = {};
VehicleZoneDistribution.middleboat.vehicles = {};
VehicleZoneDistribution.middleboat.vehicles["Base.BoatMotor"] = {index = -1, spawnChance = 100};
VehicleZoneDistribution.middleboat.specialcar = false;
VehicleZoneDistribution.middleboat.spawnRate = 80;

VehicleZoneDistribution.bigboat = {};
VehicleZoneDistribution.bigboat.vehicles = {};
VehicleZoneDistribution.bigboat.vehicles["Base.BoatSailingYacht"] = {index = -1, spawnChance = 100};
VehicleZoneDistribution.bigboat.spawnRate = 80;
VehicleZoneDistribution.bigboat.specialcar = false;

VehicleZoneDistribution.shipwreckland = {};
VehicleZoneDistribution.shipwreckland.vehicles = {};
VehicleZoneDistribution.shipwreckland.vehicles["Base.BoatSailingYacht_shipwreckland"] = {index = -1, spawnChance = 100};
VehicleZoneDistribution.shipwreckland.spawnRate = 80;
VehicleZoneDistribution.shipwreckland.specialcar = false;
VehicleZoneDistribution.shipwreckland.randomAngle = true;

VehicleZoneDistribution.shipwreckwater = {};
VehicleZoneDistribution.shipwreckwater.vehicles = {};
VehicleZoneDistribution.shipwreckwater.vehicles["Base.BoatSailingYacht_shipwreckwater"] = {index = -1, spawnChance = 100};
VehicleZoneDistribution.shipwreckwater.spawnRate = 80;
VehicleZoneDistribution.shipwreckwater.specialcar = false;
VehicleZoneDistribution.shipwreckwater.randomAngle = true;