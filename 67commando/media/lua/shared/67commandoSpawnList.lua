if VehicleZoneDistribution then

-- Normal spawns --

VehicleZoneDistribution.trailerpark.vehicles["Base.67commando"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trailerpark.vehicles["Base.67commandoT50"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trailerpark.vehicles["Base.67commandoBurnt"] = {index = -1, spawnChance = 3};

VehicleZoneDistribution.junkyard.vehicles["Base.67commando"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.junkyard.vehicles["Base.67commandoT50"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.junkyard.vehicles["Base.67commandoBurnt"] = {index = -1, spawnChance = 4};

VehicleZoneDistribution.trafficjamw.vehicles["Base.67commando"] = {index = -1, spawnChance = 3};
VehicleZoneDistribution.trafficjamw.vehicles["Base.67commandoT50"] = {index = -1, spawnChance = 0};
VehicleZoneDistribution.trafficjamw.vehicles["Base.67commandoBurnt"] = {index = -1, spawnChance = 3};

VehicleZoneDistribution.trafficjame.vehicles["Base.67commando"] = {index = -1, spawnChance = 0};
VehicleZoneDistribution.trafficjame.vehicles["Base.67commandoT50"] = {index = -1, spawnChance = 2};
VehicleZoneDistribution.trafficjame.vehicles["Base.67commandoBurnt"] = {index = -1, spawnChance =3};

VehicleZoneDistribution.trafficjamn.vehicles["Base.67commando"] = {index = -1, spawnChance = 2};
VehicleZoneDistribution.trafficjamn.vehicles["Base.67commandoT50"] = {index = -1, spawnChance = 0};
VehicleZoneDistribution.trafficjamn.vehicles["Base.67commandoBurnt"] = {index = -1, spawnChance = 4};

VehicleZoneDistribution.trafficjams.vehicles["Base.67commando"] = {index = -1, spawnChance = 0};
VehicleZoneDistribution.trafficjams.vehicles["Base.67commandoT50"] = {index = -1, spawnChance = 3};
VehicleZoneDistribution.trafficjams.vehicles["Base.67commandoBurnt"] = {index = -1, spawnChance = 2};

-- Police spawn --

VehicleZoneDistribution.police.vehicles["Base.67commandoPolice"] = {index = -1, spawnChance = 20};

-- Ranger spawn --
VehicleZoneDistribution.ranger.vehicles["Base.67commando"] = {index = 3, spawnChance = 10};

-- Military spawn --

VehicleZoneDistribution.farm = VehicleZoneDistribution.farm or {}
VehicleZoneDistribution.farm.vehicles = VehicleZoneDistribution.farm.vehicles or {}
VehicleZoneDistribution.farm.vehicles["Base.67commando"] = {index = -1, spawnChance = 20};
VehicleZoneDistribution.farm.vehicles["Base.67commandoT50"] = {index = -1, spawnChance = 20};

VehicleZoneDistribution.military = VehicleZoneDistribution.military or {}
VehicleZoneDistribution.military.vehicles = VehicleZoneDistribution.military.vehicles or {}
VehicleZoneDistribution.military.vehicles["Base.67commando"] = {index = -1, spawnChance = 20};
VehicleZoneDistribution.military.vehicles["Base.67commandoT50"] = {index = -1, spawnChance = 20};

end