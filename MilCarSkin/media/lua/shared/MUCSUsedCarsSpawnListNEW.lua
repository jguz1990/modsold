local getActivatedMods = getActivatedMods
local size = size
local get = get

local function isMod(mod_Name)
    local mods = getActivatedMods();
    for i=0, mods:size()-1, 1 do
        if mods:get(i) == mod_Name then
            return true;
        end
    end
    return false;
end

if VehicleZoneDistribution then -- check if the table exists for backwards compatibility


-- traffic jam, mostly burnt car & damaged ones.
-- Used either for hard coded big traffic jam or smaller random ones.

VehicleZoneDistribution.trafficjamw.vehicles["Base.hmmwvpolice"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trafficjamw.vehicles["Base.hmmwvblackopps"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trafficjamw.vehicles["Base.blazerblackops"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trafficjamw.vehicles["Base.m35a2blackopps"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trafficjamw.vehicles["Base.m151blackopps"] = {index = -1, spawnChance = 1};


VehicleZoneDistribution.trafficjamn.vehicles["Base.hmmwvpolice"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trafficjamn.vehicles["Base.hmmwvblackopps"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trafficjamn.vehicles["Base.blazerblackops"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trafficjamn.vehicles["Base.m35a2blackopps"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trafficjamn.vehicles["Base.m151blackopps"] = {index = -1, spawnChance = 1};


VehicleZoneDistribution.trafficjams.vehicles["Base.hmmwvpolice"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trafficjams.vehicles["Base.hmmwvblackopps"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trafficjams.vehicles["Base.blazerblackops"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trafficjams.vehicles["Base.m35a2blackopps"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trafficjams.vehicles["Base.m151blackopps"] = {index = -1, spawnChance = 1};



VehicleZoneDistribution.trafficjame.vehicles["Base.hmmwvpolice"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trafficjame.vehicles["Base.hmmwvblackopps"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trafficjame.vehicles["Base.blazerblackops"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trafficjame.vehicles["Base.m35a2blackopps"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.trafficjame.vehicles["Base.m151blackopps"] = {index = -1, spawnChance = 1};
-- ****************************** --
--          SPECIAL VEHICLES      --
-- ****************************** --

-- police

VehicleZoneDistribution.police.vehicles["Base.hmmwvpolice"] = {index = -1, spawnChance = 5};
VehicleZoneDistribution.police.vehicles["Base.hmmwvblackopps"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.police.vehicles["Base.blazerblackops"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.police.vehicles["Base.m35a2blackopps"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.police.vehicles["Base.m151blackopps"] = {index = -1, spawnChance = 1};



-- ranger
VehicleZoneDistribution.ranger.vehicles["Base.hmmwvblackopps"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.ranger.vehicles["Base.blazerblackops"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.ranger.vehicles["Base.m151blackopps"] = {index = -1, spawnChance = 1};

-- ambulance
VehicleZoneDistribution.ambulance.vehicles["Base.hmmwvblackopps"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.ambulance.vehicles["Base.blazerblackops"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.ambulance.vehicles["Base.m35a2blackopps"] = {index = -1, spawnChance = 1};
VehicleZoneDistribution.ambulance.vehicles["Base.m151blackopps"] = {index = -1, spawnChance = 1};



    if isMod("VileM113APC") then
        VehicleZoneDistribution.police.vehicles["Base.m113a1police"] = {index = -1, spawnChance = 5};
        VehicleZoneDistribution.police.vehicles["Base.m113a1"] = {index = -1, spawnChance = 0};   
    end
    -- Police Zones
    -- Ranger Zones
    -- Farm Zones
end