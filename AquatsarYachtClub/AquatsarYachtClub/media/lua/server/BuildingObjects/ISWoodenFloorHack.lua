require "BuildingObjects/ISWoodenFloor"

local old_ISWoodenFloor_isValid = ISWoodenFloor.isValid

function ISWoodenFloor:isValid(square)
    if square and square:getFloor() and square:getFloor():getSprite() and square:getFloor():getSprite():getProperties() and square:getFloor():getSprite():getProperties():Is(IsoFlagType.water) then return false end
    if old_ISWoodenFloor_isValid(self, square) then
        return true
    else
        return false
    end
end