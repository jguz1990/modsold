RecycleVehicle = RecycleVehicle or {}
RecycleVehicle.Utils = RecycleVehicle.Utils or {}

function RecycleVehicle.Utils.isBurnt(vehicle)
    return string.match(string.lower(vehicle:getScript():getName()), "burnt")
end

function RecycleVehicle.Utils.isSmashed(vehicle)
    return string.match(string.lower(vehicle:getScript():getName()), "smashed")
end

function RecycleVehicle.Utils.isTrailer(vehicle)
    return string.match(string.lower(vehicle:getScript():getName()), "trailer")
end

function RecycleVehicle.Utils.getBaseArea(vehicle)
    local script = vehicle:getScript()
    local vModifier = script:getMechanicType() == 2 and 1 or -2

    local extX = script:getExtents():x()
    local extY = script:getExtents():y()
    local extZ = script:getExtents():z()

    return math.ceil(2 * (extX + extZ) * extY + extX * extZ) + vModifier
end