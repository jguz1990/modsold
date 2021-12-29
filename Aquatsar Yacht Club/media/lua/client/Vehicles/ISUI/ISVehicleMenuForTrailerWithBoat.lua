--**************************************************************
--**                    Developer: Aiteron                    **
--**************************************************************
--	Интерфейс для прицепов с лодками (загрузка на прицеп и спуск на воду)
---------------------------------------
require 'AquaConfig'


ISVehicleMenuForTrailerWithBoat = {}

local vec = Vector3f.new()
ISVehicleMenuForTrailerWithBoat.nearCheckThatTrailerNearWater = 3
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
		menu:addSlice(getText("ContextMenu_LoadBoatOntoTrailer"), getTexture("media/ui/boats/ICON_boat_on_trailer.png"), ISVehicleMenuForTrailerWithBoat.loadOntoTrailer, playerObj, vehicle, boat)
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

-------------------------
-- Replace functions
-------------------------

function ISVehicleMenuForTrailerWithBoat.replaceTrailerBoat(veh1, veh2)
	local partsTable = {}
	for i=1, veh1:getScript():getPartCount() do
		local part = veh1:getPartByIndex(i-1)
		partsTable[part:getId()] = {}
		partsTable[part:getId()]["InventoryItem"] = part:getInventoryItem()
		partsTable[part:getId()]["Condition"] = part:getCondition()
		partsTable[part:getId()]["ItemContainer"] = nil
		local itemContainer = part:getItemContainer()
		if itemContainer and not itemContainer:isEmpty()then
			partsTable[part:getId()]["ItemContainer"] = itemContainer
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
		end
	end
	-- print("veh1 keyId: ", veh1:getKeyId())
	-- print("veh2 keyId: ", veh2:getKeyId())
	veh2:setKeyId(veh1:getKeyId())
	veh2:setSkinIndex(veh1:getSkinIndex())
	-- print("veh2 new keyId: ", veh2:getKeyId())
	return veh2
end

function ISVehicleMenuForTrailerWithBoat.replaceTrailer(trailer, newTrailerName)
	-- print("trailer keyId: ", trailer:getKeyId())
	local partsTable = {}
	local keyId = trailer:getKeyId()
	for i=1, trailer:getScript():getPartCount() do
		local part = trailer:getPartByIndex(i-1)
		partsTable[part:getId()] = {}
		partsTable[part:getId()]["InventoryItem"] = part:getInventoryItem()
		partsTable[part:getId()]["Condition"] = part:getCondition()
		partsTable[part:getId()]["ItemContainer"] = nil
		local itemContainer = part:getItemContainer()
		if itemContainer and not itemContainer:isEmpty()then
			partsTable[part:getId()]["ItemContainer"] = itemContainer
		end
	end
	trailer:setScriptName(newTrailerName)
	trailer:scriptReloaded()
	for i=1, trailer:getScript():getPartCount() do
		local part = trailer:getPartByIndex(i-1)
		if partsTable[part:getId()] then
			part:setInventoryItem(partsTable[part:getId()]["InventoryItem"])
			part:setCondition(partsTable[part:getId()]["Condition"])
			if partsTable[part:getId()]["ItemContainer"] then
				part:setItemContainer(partsTable[part:getId()]["ItemContainer"])
			end
		end
	end
	-- print("trailer2 keyId: ", trailer:getKeyId())
	trailer:setKeyId(keyId)
	-- print("trailer2 new keyId: ", trailer:getKeyId())
	return trailer
end



-- local function isEmptyContainersOnVehicle(vehicle)
	-- for i=1,vehicle:getPartCount() do
		-- local part = vehicle:getPartByIndex(i-1)	
		-- if part:isContainer() and part:getItemContainer() ~= nil then
			-- local itemContainer = part:getItemContainer()
			-- if itemContainer:getItems():size() ~= 0 then return false end
		-- end
	-- end
	-- return true
-- end