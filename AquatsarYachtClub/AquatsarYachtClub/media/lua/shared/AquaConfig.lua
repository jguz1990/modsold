AquaConfig = {}
AquaConfig.Boats = {}
AquaConfig.Trailers = {}

---------------
-- Utils
---------------

AquaConfig.windVeryLight = 4 * 1.60934
AquaConfig.windLight = 10 * 1.60934
AquaConfig.windMedium = 20 * 1.60934
AquaConfig.windStrong = 31 * 1.60934
AquaConfig.windVeryStrong = 55 * 1.60934


function AquaConfig.isBoat(boat)
    if not boat then return false end
    return AquaConfig.Boats[boat:getScript():getName()] ~= nil
end

function AquaConfig.Boat(boat)
    if not boat then return false end
    return AquaConfig.Boats[boat:getScript():getName()]
end


-------------------------
-- Replace functions
-------------------------

local ignoreParts = {
["TireFrontLeft"] = true,
["TireFrontRight"] = true,
["TireRearLeft"] = true,
["TireRearRight"] = true,
["SuspensionFrontLeft"] = true,
["SuspensionFrontRight"] = true,
["SuspensionRearLeft"] = true,
["SuspensionRearRight"] = true,
}

function AquaConfig.exchangePartsVehicle(veh1, veh2)
    local partsTable = {}
    for i=1, veh1:getScript():getPartCount() do
        local part = veh1:getPartByIndex(i-1)
        if not ignoreParts[part:getId()] then
            partsTable[part:getId()] = {}
            partsTable[part:getId()]["InventoryItem"] = part:getInventoryItem()
            partsTable[part:getId()]["Condition"] = part:getCondition()
            partsTable[part:getId()]["ItemContainer"] = nil
            partsTable[part:getId()]["modData"] = part:getModData()
            local itemContainer = part:getItemContainer()
            if itemContainer and not itemContainer:isEmpty()then
                partsTable[part:getId()]["ItemContainer"] = itemContainer
            end
        end
    end
    for i=1, veh2:getScript():getPartCount() do
        local part = veh2:getPartByIndex(i-1)
        if partsTable[part:getId()] then
            part:setInventoryItem(partsTable[part:getId()]["InventoryItem"])
            part:setCondition(partsTable[part:getId()]["Condition"])
            if partsTable[part:getId()]["ItemContainer"] then
                part:setItemContainer(partsTable[part:getId()]["ItemContainer"])
            end
            if partsTable[part:getId()]["modData"] then
                for a, b in pairs(partsTable[part:getId()]["modData"]) do 
                    part:getModData()[a] = b
                end
            end
            veh2:transmitPartItem(part)
        end
    end
    -- print("veh1 keyId: ", veh1:getKeyId())
    -- print("veh2 keyId: ", veh2:getKeyId())
    veh2:setKeyId(veh1:getKeyId())
    -- print("veh2 new keyId: ", veh2:getKeyId())
    return veh2
end

function AquaConfig.replaceVehicleScript(vehicle, newTrailerName)
    -- print("vehicle keyId: ", vehicle:getKeyId())
    local partsTable = {}
    local keyId = vehicle:getKeyId()
    for i=1, vehicle:getScript():getPartCount() do
        local part = vehicle:getPartByIndex(i-1)
        partsTable[part:getId()] = {}
        partsTable[part:getId()]["InventoryItem"] = part:getInventoryItem()
        partsTable[part:getId()]["Condition"] = part:getCondition()
        partsTable[part:getId()]["ItemContainer"] = nil
        partsTable[part:getId()]["modData"] = part:getModData()
        local itemContainer = part:getItemContainer()
        if itemContainer and not itemContainer:isEmpty()then
            partsTable[part:getId()]["ItemContainer"] = itemContainer
        end
    end
    vehicle:setScriptName(newTrailerName)
    vehicle:scriptReloaded()
    for i=1, vehicle:getScript():getPartCount() do
        local part = vehicle:getPartByIndex(i-1)
        if partsTable[part:getId()] then
            part:setInventoryItem(partsTable[part:getId()]["InventoryItem"])
            part:setCondition(partsTable[part:getId()]["Condition"])
            if partsTable[part:getId()]["ItemContainer"] then
                part:setItemContainer(partsTable[part:getId()]["ItemContainer"])
            end
            if partsTable[part:getId()]["modData"] then
                for a, b in pairs(partsTable[part:getId()]["modData"]) do 
                    part:getModData()[a] = b
                end
            end
            vehicle:transmitPartItem(part)
        end
    end
    -- print("trailer2 keyId: ", vehicle:getKeyId())
    vehicle:setKeyId(keyId)
    -- print("trailer2 new keyId: ", vehicle:getKeyId())
    return vehicle
end

function AquaConfig.replaceVehicle(vehicle, newVehicle, skin)
    local partsTable = {}
    local square = vehicle:getSquare()
    local keyId = vehicle:getKeyId()
    local angleX = vehicle:getAngleX()
    local angleY = vehicle:getAngleY()
    local angleZ = vehicle:getAngleZ()
    for i=1, vehicle:getScript():getPartCount() do
        local part = vehicle:getPartByIndex(i-1)
        partsTable[part:getId()] = {}
        partsTable[part:getId()]["InventoryItem"] = part:getInventoryItem()
        partsTable[part:getId()]["Condition"] = part:getCondition()
        partsTable[part:getId()]["ItemContainer"] = nil
        partsTable[part:getId()]["modData"] = part:getModData()
        local itemContainer = part:getItemContainer()
        if itemContainer and not itemContainer:isEmpty()then
            partsTable[part:getId()]["ItemContainer"] = itemContainer
        end
    end
    vehicle:permanentlyRemove()
    vehicle = addVehicleDebug(newVehicle, IsoDirections.N, skin, square)
    vehicle:setAngles(angleX, angleY, angleZ)
    for i=1, vehicle:getScript():getPartCount() do
        local part = vehicle:getPartByIndex(i-1)
        if partsTable[part:getId()] then
            part:setInventoryItem(partsTable[part:getId()]["InventoryItem"])
            part:setCondition(partsTable[part:getId()]["Condition"])
            if partsTable[part:getId()]["ItemContainer"] then
                part:setItemContainer(partsTable[part:getId()]["ItemContainer"])
            end
            if partsTable[part:getId()]["modData"] then
                for a, b in pairs(partsTable[part:getId()]["modData"]) do 
                    part:getModData()[a] = b
                end
            end
            vehicle:transmitPartItem(part)
        end
    end
    -- print("trailer2 keyId: ", vehicle:getKeyId())
    vehicle:setKeyId(keyId)
    -- print("trailer2 new keyId: ", vehicle:getKeyId())
    return vehicle
end

--------------
-- Boats
--------------

-- BoatMotor --
AquaConfig.Boats["BoatSailingYacht_shipwreckwater"] = {}

AquaConfig.Boats["BoatMotor"] = {}
boat = AquaConfig.Boats["BoatMotor"]
boat.dashboard = "ISBoatDashboard"
boat.multiplierFuelConsumption = 2
boat.limitReverseSpeed = 6
boat.boatSeatUI_Image = "BoatMotorYacht_seat"
boat.boatSeatUI_Scale = 1
boat.windInfluence = 1.1
boat.boatSeatUI_SeatOffsetX = {
    ["FrontLeft"] = 0,
    ["FrontRight"] = 0,
    ["MiddleLeft"] = 0,
    ["MiddleRight"] = 0,
    ["RearLeft"] = 0,
    ["RearRight"] = 0,
}
boat.boatSeatUI_SeatOffsetY = {
    ["FrontLeft"] = 0,
    ["FrontRight"] = 0,
    ["MiddleLeft"] = 0, 
    ["MiddleRight"] = 0,
    ["RearLeft"] = 0,
    ["RearRight"] = 0,
}

AquaConfig.Boats["BoatMotor_Ground"] = {}
boat = AquaConfig.Boats["BoatMotor_Ground"]
boat.onGround = true
boat.dashboard = "ISBoatDashboard"
boat.multiplierFuelConsumption = 2
boat.limitReverseSpeed = 6
boat.boatSeatUI_Image = "BoatMotorYacht_seat"
boat.boatSeatUI_Scale = 1
boat.windInfluence = 1.1
boat.boatSeatUI_SeatOffsetX = {
    ["FrontLeft"] = 0,
    ["FrontRight"] = 0,
    ["MiddleLeft"] = 0,
    ["MiddleRight"] = 0,
    ["RearLeft"] = 0,
    ["RearRight"] = 0,
}
boat.boatSeatUI_SeatOffsetY = {
    ["FrontLeft"] = 0,
    ["FrontRight"] = 0,
    ["MiddleLeft"] = 0, 
    ["MiddleRight"] = 0,
    ["RearLeft"] = 0,
    ["RearRight"] = 0,
}

-- BoatSailingYacht --
AquaConfig.Boats["BoatSailingYacht"] = {}
boat = AquaConfig.Boats["BoatSailingYacht"]
boat.dashboard = "ISNewSalingBoatDashboard"
boat.multiplierFuelConsumption = 4
boat.limitReverseSpeed = 6
boat.windInfluence = 1.1
boat.boatSeatUI_Image = "BoatSailingYacht_seat"
boat.boatSeatUI_Scale = 0.75
boat.boatSeatUI_SeatOffsetX = {
    ["FrontLeft"] = 0,
    ["FrontRight"] = 0,
    ["MiddleLeft"] = 0,
    ["MiddleRight"] = 0,
    ["RearLeft"] = 0,
    ["RearRight"] = 0,
}
boat.boatSeatUI_SeatOffsetY = {
    ["FrontLeft"] = 120,
    ["FrontRight"] = 120,
    ["MiddleLeft"] = -50, 
    ["MiddleRight"] = -30,
    ["RearLeft"] = -40,
    ["RearRight"] = 50,
}

AquaConfig.Boats["BoatSailingYacht_Ground"] = {}
boat = AquaConfig.Boats["BoatSailingYacht_Ground"]
boat.onGround = true
boat.dashboard = "ISNewSalingBoatDashboard"
boat.multiplierFuelConsumption = 4
boat.limitReverseSpeed = 6
boat.windInfluence = 1.1
boat.boatSeatUI_Image = "BoatSailingYacht_seat"
boat.boatSeatUI_Scale = 0.75
boat.boatSeatUI_SeatOffsetX = {
    ["FrontLeft"] = 0,
    ["FrontRight"] = 0,
    ["MiddleLeft"] = 0,
    ["MiddleRight"] = 0,
    ["RearLeft"] = 0,
    ["RearRight"] = 0,
}
boat.boatSeatUI_SeatOffsetY = {
    ["FrontLeft"] = 120,
    ["FrontRight"] = 120,
    ["MiddleLeft"] = -50, 
    ["MiddleRight"] = -30,
    ["RearLeft"] = -40,
    ["RearRight"] = 50,
}

--[[
AquaConfig.Boats["BoatZeroPatient"] = {}
local boat = AquaConfig.Boats["BoatZeroPatient"]
boat.dashboard = nil
boat.boatSeatUI_Image = "BoatSailingYacht_seat"
boat.boatSeatUI_Scale = 1.25
boat.windInfluence = 1.1
boat.boatSeatUI_SeatOffsetX = {
    ["FrontLeft"] = 1,
    ["FrontRight"] = 1,
    ["MiddleLeft"] = 0,
    ["MiddleRight"] = 1,
    ["RearLeft"] = -4,
    ["RearRight"] = 1,
}
boat.boatSeatUI_SeatOffsetY = {
    ["FrontLeft"] = 10,
    ["FrontRight"] = 10,
    ["MiddleLeft"] = -75, 
    ["MiddleRight"] = -55,
    ["RearLeft"] = -30,
    ["RearRight"] = 10,
}
]]

-----------------
-- Trailers
-----------------

AquaConfig.Trailers["TrailerForBoat"] = {}
local trailer = AquaConfig.Trailers["TrailerForBoat"]
trailer.isWithBoat = false
trailer.trailerWithBoatTable = {}
trailer.trailerWithBoatTable["BoatSailingYacht"] = "TrailerWithBoatSailingYacht"
trailer.trailerWithBoatTable["BoatSailingYacht_Ground"] = "TrailerWithBoatSailingYacht"
trailer.trailerWithBoatTable["BoatMotor"] = "TrailerWithBoatMotor"
trailer.trailerWithBoatTable["BoatMotor_Ground"] = "TrailerWithBoatMotor"

AquaConfig.Trailers["TrailerWithBoatSailingYacht"] = {}
local trailer = AquaConfig.Trailers["TrailerWithBoatSailingYacht"]
trailer.isWithBoat = true
trailer.boat = "BoatSailingYacht"
trailer.emptyTrailer = "TrailerForBoat"

AquaConfig.Trailers["TrailerWithBoatMotor"] = {}
local trailer = AquaConfig.Trailers["TrailerWithBoatMotor"]
trailer.isWithBoat = true
trailer.boat = "BoatMotor"
trailer.emptyTrailer = "TrailerForBoat"





