--**************************************************************
--**                    Developer: Aiteron                    **
--**************************************************************
--    Интерфейс для прицепов с лодками (загрузка на прицеп и спуск на воду)
---------------------------------------
require 'AquaConfig'


ISVehicleMenuForTrailerWithBoat = {}

local vec = Vector3f.new()
ISVehicleMenuForTrailerWithBoat.nearCheckThatTrailerNearWater = 5
ISVehicleMenuForTrailerWithBoat.spawnDistForBoat = 7.5

-------------------------
-- Radian menu
-------------------------

local function isWater(square)
    return square ~= nil and square:Is(IsoFlagType.water)
end

function ISVehicleMenuForTrailerWithBoat.canLaunchBoat(boat)
    local point = boat:getWorldPos(0, 0, -boat:getScript():getPhysicsChassisShape():z()/2 - ISVehicleMenuForTrailerWithBoat.nearCheckThatTrailerNearWater, vec)
    if not isWater(getCell():getGridSquare(point:x(), point:y(), 0)) then return false end
    point = boat:getWorldPos(0, 0, -boat:getScript():getPhysicsChassisShape():z()/2 - ISVehicleMenuForTrailerWithBoat.spawnDistForBoat, vec)
    if not isWater(getCell():getGridSquare(point:x(), point:y(), 0)) then return false end
    return true
end

function ISVehicleMenuForTrailerWithBoat.launchRadialMenu(playerObj, vehicle)
    local menu = getPlayerRadialMenu(playerObj:getPlayerNum())
    if ISVehicleMenuForTrailerWithBoat.canLaunchBoat(vehicle) then
        menu:addSlice(getText("ContextMenu_LaunchBoat"), getTexture("media/ui/boats/ICON_boat_on_trailer.png"), ISVehicleMenuForTrailerWithBoat.launchBoat, playerObj, vehicle)
    else
        menu:addSlice(getText("ContextMenu_CantLaunchBoat"), getTexture("media/ui/boats/ICON_cant_boat_on_trailer.png"), nil)
    end
end


function ISVehicleMenuForTrailerWithBoat.loadOntoTrailerRadialMenu(playerObj, vehicle)
    local menu = getPlayerRadialMenu(playerObj:getPlayerNum())
    local boat = ISVehicleMenuForTrailerWithBoat.getBoatAtRearOfTrailer(vehicle)
    if boat then
        -- print(boat:getPassenger(0))
        -- if boat:getPassenger(0) then
            -- menu:addSlice(getText("ContextMenu_CantLoadBoatOntoTrailerMan"), getTexture("media/ui/boats/ICON_cant_boat_on_trailer.png"), nil)
        -- else   
            menu:addSlice(getText("ContextMenu_LoadBoatOntoTrailer"), getTexture("media/ui/boats/ICON_boat_on_trailer.png"), ISVehicleMenuForTrailerWithBoat.loadOntoTrailer, playerObj, vehicle, boat)
        -- end
    else
        menu:addSlice(getText("ContextMenu_CantLoadBoatOntoTrailer"), getTexture("media/ui/boats/ICON_cant_boat_on_trailer.png"), nil)
    end
end

-------------------------
-- Launch on Water
-------------------------

function ISVehicleMenuForTrailerWithBoat.launchBoat(playerObj, vehicle)
    local point = vehicle:getWorldPos(0, 0, -vehicle:getScript():getPhysicsChassisShape():z()/2 - ISVehicleMenuForTrailerWithBoat.spawnDistForBoat, vec)
    local sq = getCell():getGridSquare(point:x(), point:y(), 0)
    if sq == nil then return end
    
    if luautils.walkAdj(playerObj, vehicle:getSquare()) then
        ISTimedActionQueue.add(ISLaunchBoatOnWater:new(playerObj, vehicle, sq));
    end
end

-------------------------
-- Load on Trailer
-------------------------

function ISVehicleMenuForTrailerWithBoat.getBoatAtRearOfTrailer(vehicle)
    -- Check line at rear of trailer
    for i=0, 8, 0.5 do    
        local point = vehicle:getWorldPos(0, 0, -vehicle:getScript():getPhysicsChassisShape():z()/2 - i, vec)
        local sq = getCell():getGridSquare(point:x(), point:y(), 0)
        
        local boat = sq:getVehicleContainer()
        if boat then
            if AquaConfig.isBoat(boat) and AquaConfig.Trailers[vehicle:getScript():getName()].trailerWithBoatTable[boat:getScript():getName()] then
                return boat
            end
        end
    end
end

function ISVehicleMenuForTrailerWithBoat.loadOntoTrailer(playerObj, vehicle, boat)
    if luautils.walkAdj(playerObj, vehicle:getSquare()) then
        ISTimedActionQueue.add(ISLoadBoatOntoTrailer:new(playerObj, vehicle, boat));
    end
end
