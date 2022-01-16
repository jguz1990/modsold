--***********************************************************
--**                          KI5                          **
--***********************************************************

if VehicleZoneDistribution then

-- Normal spawns --

VehicleZoneDistribution.trailerpark.vehicles["Base.82oshkoshM911"] = {index = -1, spawnChance = 2};
VehicleZoneDistribution.trailerpark.vehicles["Base.82oshkoshM911B"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trailerpark.vehicles["Base.82oshkoshM911Burnt"] = {index = -1, spawnChance = 1};

VehicleZoneDistribution.trailerpark.vehicles["Base.TrailerM127stake"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trailerpark.vehicles["Base.TrailerM128van"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trailerpark.vehicles["Base.TrailerM129van"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trailerpark.vehicles["Base.TrailerM747lowbed"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trailerpark.vehicles["Base.TrailerM967tanker"] = {index = -1, spawnChance = 1};

VehicleZoneDistribution.junkyard.vehicles["Base.82oshkoshM911"] = {index = -1, spawnChance = 0};
VehicleZoneDistribution.junkyard.vehicles["Base.82oshkoshM911B"] = {index = -1, spawnChance = 2};
VehicleZoneDistribution.junkyard.vehicles["Base.82oshkoshM911Burnt"] = {index = -1, spawnChance = 4};

VehicleZoneDistribution.bad.vehicles["Base.82oshkoshM911"] = {index = -1, spawnChance = 1};

VehicleZoneDistribution.fossoil.vehicles["Base.TrailerM967tanker"] = {index = -1, spawnChance = 2};

VehicleZoneDistribution.mccoy.vehicles["Base.TrailerM127stake"] = {index = -1, spawnChance = 2};

VehicleZoneDistribution.ranger.vehicles["Base.TrailerM129van"] = {index = -1, spawnChance = 2};

-- Trafficjam spawns --

VehicleZoneDistribution.trafficjamw.vehicles["Base.82oshkoshM911"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trafficjamw.vehicles["Base.82oshkoshM911B"] = {index = -1, spawnChance = 0};
VehicleZoneDistribution.trafficjamw.vehicles["Base.82oshkoshM911Burnt"] = {index = -1, spawnChance = 1};

VehicleZoneDistribution.trafficjamw.vehicles["Base.TrailerM127stake"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trafficjamw.vehicles["Base.TrailerM128van"] = {index = -1, spawnChance = 0};
VehicleZoneDistribution.trafficjamw.vehicles["Base.TrailerM129van"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trafficjamw.vehicles["Base.TrailerM747lowbed"] = {index = -1, spawnChance = 0};
VehicleZoneDistribution.trafficjamw.vehicles["Base.TrailerM967tanker"] = {index = -1, spawnChance = 1};


VehicleZoneDistribution.trafficjame.vehicles["Base.82oshkoshM911"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trafficjame.vehicles["Base.82oshkoshM911B"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trafficjame.vehicles["Base.82oshkoshM911Burnt"] = {index = -1, spawnChance = 0};

VehicleZoneDistribution.trafficjame.vehicles["Base.TrailerM127stake"] = {index = -1, spawnChance = 0};
VehicleZoneDistribution.trafficjame.vehicles["Base.TrailerM128van"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trafficjame.vehicles["Base.TrailerM129van"] = {index = -1, spawnChance = 0};
VehicleZoneDistribution.trafficjame.vehicles["Base.TrailerM747lowbed"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trafficjame.vehicles["Base.TrailerM967tanker"] = {index = -1, spawnChance = 0};


VehicleZoneDistribution.trafficjamn.vehicles["Base.82oshkoshM911"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trafficjamn.vehicles["Base.82oshkoshM911B"] = {index = -1, spawnChance = 0};
VehicleZoneDistribution.trafficjamn.vehicles["Base.82oshkoshM911Burnt"] = {index = -1, spawnChance = 1};

VehicleZoneDistribution.trafficjamn.vehicles["Base.TrailerM127stake"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trafficjamn.vehicles["Base.TrailerM128van"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trafficjamn.vehicles["Base.TrailerM129van"] = {index = -1, spawnChance = 0};
VehicleZoneDistribution.trafficjamn.vehicles["Base.TrailerM747lowbed"] = {index = -1, spawnChance = 0};
VehicleZoneDistribution.trafficjamn.vehicles["Base.TrailerM967tanker"] = {index = -1, spawnChance = 0};


VehicleZoneDistribution.trafficjams.vehicles["Base.82oshkoshM911"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trafficjams.vehicles["Base.82oshkoshM911B"] = {index = -1, spawnChance = 0};
VehicleZoneDistribution.trafficjams.vehicles["Base.82oshkoshM911Burnt"] = {index = -1, spawnChance = 1};

VehicleZoneDistribution.trafficjams.vehicles["Base.TrailerM127stake"] = {index = -1, spawnChance = 0};
VehicleZoneDistribution.trafficjams.vehicles["Base.TrailerM128van"] = {index = -1, spawnChance = 0};
VehicleZoneDistribution.trafficjams.vehicles["Base.TrailerM129van"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trafficjams.vehicles["Base.TrailerM747lowbed"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trafficjams.vehicles["Base.TrailerM967tanker"] = {index = -1, spawnChance = 0};

-- pseudoMilitary spawn --

VehicleZoneDistribution.farm = VehicleZoneDistribution.farm or {}
VehicleZoneDistribution.farm.vehicles = VehicleZoneDistribution.farm.vehicles or {}

VehicleZoneDistribution.farm.vehicles["Base.82oshkoshM911"] = {index = -1, spawnChance = 15};
VehicleZoneDistribution.farm.vehicles["Base.82oshkoshM911B"] = {index = -1, spawnChance = 5};
VehicleZoneDistribution.farm.vehicles["Base.82oshkoshM911Burnt"] = {index = -1, spawnChance = 5};

VehicleZoneDistribution.farm.vehicles["Base.TrailerM127stake"] = {index = -1, spawnChance = 15};
VehicleZoneDistribution.farm.vehicles["Base.TrailerM128van"] = {index = -1, spawnChance = 15};
VehicleZoneDistribution.farm.vehicles["Base.TrailerM129van"] = {index = -1, spawnChance = 15};
VehicleZoneDistribution.farm.vehicles["Base.TrailerM747lowbed"] = {index = -1, spawnChance = 15};
VehicleZoneDistribution.farm.vehicles["Base.TrailerM967tanker"] = {index = -1, spawnChance = 15};

-- Military spawn --

VehicleZoneDistribution.military = VehicleZoneDistribution.military or {}
VehicleZoneDistribution.military.vehicles = VehicleZoneDistribution.military.vehicles or {}

VehicleZoneDistribution.military.vehicles["Base.82oshkoshM911"] = {index = -1, spawnChance = 30};
VehicleZoneDistribution.military.vehicles["Base.82oshkoshM911B"] = {index = -1, spawnChance = 8};
VehicleZoneDistribution.military.vehicles["Base.82oshkoshM911Burnt"] = {index = -1, spawnChance = 5};

VehicleZoneDistribution.military.vehicles["Base.TrailerM127stake"] = {index = -1, spawnChance = 25};
VehicleZoneDistribution.military.vehicles["Base.TrailerM128van"] = {index = -1, spawnChance = 25};
VehicleZoneDistribution.military.vehicles["Base.TrailerM129van"] = {index = -1, spawnChance = 25};
VehicleZoneDistribution.military.vehicles["Base.TrailerM747lowbed"] = {index = -1, spawnChance = 25};
VehicleZoneDistribution.military.vehicles["Base.TrailerM967tanker"] = {index = -1, spawnChance = 25};

end