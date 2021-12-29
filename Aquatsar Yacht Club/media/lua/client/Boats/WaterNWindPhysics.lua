--*************************************************************
--**              Developers: IBrRus n Aiteron               **
--*************************************************************

require 'AquaConfig'

if AquaPhysics == nil then AquaPhysics = {} end
AquaPhysics.Utils = {}
AquaPhysics.Wind = {}
AquaPhysics.Water = {}

-----------------------------
-- Util variables/functions
-----------------------------

local tempVec1 = Vector3f.new()
local tempVec2 = Vector3f.new()
local tempIsoObj = IsoObject.new()
local tempSquare = IsoGridSquare.new(getCell(), nil, 0, 0, 0)

local frontVector = Vector3f.new()
local rearVector = Vector3f.new()
local collisionPosVector2 = Vector3.fromLengthDirection(1, 1)
local boatDirVector = Vector3f.new()


local function isWater(square)
	return square ~= nil and square:Is(IsoFlagType.water)
end

function AquaPhysics.Wind.getWindSpeed()
    return getClimateManager():getWindspeedKph()
end

-- function AquaPhysics.Wind.fromWindDirection()	
	-- local angle = getClimateManager():getWindAngleDegrees()	
	-- local windAngles = { 22.5, 67.5, 112.5, 157.5, 202.5, 247.5, 292.5, 337.5, 382.5 }	
	-- local windAngleStr = { "N", "NW", "W", "SW", "S", "SE", "E", "NE", "N" }	
    -- for b = 1, #windAngles do	
		-- if (angle < windAngles[b]) then	
			-- return windAngleStr[b]	
		-- end	
	-- end	
    -- return windAngleStr[#windAngleStr - 1];	
-- end

function AquaPhysics.Wind.inWindDirection()
	local angle = getClimateManager():getWindAngleDegrees()
	local windAngles = { 22.5, 67.5, 112.5, 157.5, 202.5, 247.5, 292.5, 337.5, 382.5 }
	local windAngleStr = { "S", "SE", "E", "NE", "N", "NW", "W", "SW", "S" }
    for b = 1, #windAngles do
		if (angle < windAngles[b]) then
			return windAngleStr[b]
		end
	end
    return windAngleStr[#windAngleStr - 1];
end

-------------------------------------
-- Water Physics
-------------------------------------

function AquaPhysics.Water.getCollisionSquaresAround(dx, dy, square)
    local squares = {}
	if square == nil then return squares end

	for y=square:getY() - dy, square:getY() + dy do
		for x=square:getX() - dx, square:getX() + dx do
            local square2 = getCell():getGridSquare(x, y, 0)
			if square2 ~= nil and not isWater(square2) then
				table.insert(squares, square2)
			end
		end
	end
	return squares
end

function AquaPhysics.Water.Borders(boat)
	local boatSquare = boat:getSquare()
	if boatSquare ~= nil and isWater(boatSquare) then
		local notWaterSquares = AquaPhysics.Water.getCollisionSquaresAround(5, 5, boatSquare)
		local collisionWithGround = false
		for _, square in ipairs(notWaterSquares) do
			tempSquare:setX(square:getX())
			tempSquare:setY(square:getY())
			tempSquare:setZ(0.8)
			tempIsoObj:setSquare(tempSquare)
			local collisionVector = boat:testCollisionWithObject(tempIsoObj, 0.5, collisionPosVector2)
			if collisionVector then
				boat:ApplyImpulse4Break(tempIsoObj, 0.2)
				boat:ApplyImpulse(tempIsoObj, 80)
				boat:update()
				collisionWithGround = true
			end
		end
		return collisionWithGround
	end
end

-------------------------------------
-- Wind Physics
-------------------------------------

function AquaPhysics.Wind.windImpulse(boat, collisionWithGround)
	local boatScriptName = boat:getScript():getName()
	local boatSpeedKPH = boat:getCurrentSpeedKmHour()
	boat:getAttachmentWorldPos("trailerfront", frontVector)
	boat:getAttachmentWorldPos("trailer", rearVector)
	local x = frontVector:x() - rearVector:x()
	local y = frontVector:y() - rearVector:y()
	local windSpeedKPH = AquaPhysics.Wind.getWindSpeed()

	-- AUD.insp("Boat", "boatSpeed (MPH):", boat:getCurrentSpeedKmHour() / 1.60934)
	-- AUD.insp("Boat", " ", " ")
	boatDirVector:set(x, 0, y):normalize()
	-- boatDirVector = boat:getWorldPos(0, 0, 1, boatDirVector):add(-boat:getX(), -boat:getY(), -boat:getZ())
	-- boatDirVector:set(boatDirVector:x(), 0, boatDirVector:y())
	-- boatDirVector:normalize()
	local boatDirection = math.atan2(x,y) * 57.2958 + 180
	local sailAngle = boat:getModData()["sailAngle"]
	if sailAngle == nil then
		sailAngle = 0
		boat:getModData()["sailAngle"] = 0
	end
	
	local wind = getClimateManager():getWindAngleDegrees()
	local windOnBoat = 0
	if wind > boatDirection then
		windOnBoat = wind - boatDirection
	else
		windOnBoat = 360 - (boatDirection - wind)
	end
	
	local windForceByDirection = 0
	if windSpeedKPH < AquaConfig.windVeryLight then
		windForceByDirection = 0
	elseif windSpeedKPH < AquaConfig.windLight then
		if windOnBoat > 85 and windOnBoat < 275 then
			windForceByDirection = 7 * math.sqrt(1 * math.cos(math.rad(2*(windOnBoat + 90))) + 1.3) * AquaConfig.Boats[boatScriptName].windInfluence
		end
	elseif windSpeedKPH < AquaConfig.windMedium then
		if windOnBoat > 20 and windOnBoat < 340 then
			windForceByDirection = 10 * math.sqrt(1 * math.cos(math.rad(2*(windOnBoat + 90))) + 1.3) * AquaConfig.Boats[boatScriptName].windInfluence
		end
	elseif windSpeedKPH < AquaConfig.windStrong then
		if windOnBoat > 20 and windOnBoat < 340 then
			windForceByDirection = 12 * math.sqrt(1 * math.cos(math.rad(2*(windOnBoat + 90))) + 1.3) * AquaConfig.Boats[boatScriptName].windInfluence
		end
	elseif windSpeedKPH < AquaConfig.windVeryStrong then
		if windOnBoat > 85 and windOnBoat < 275 then
			windForceByDirection = 14 * math.sqrt(1 * math.cos(math.rad(2*(windOnBoat + 90))) + 1.3) * AquaConfig.Boats[boatScriptName].windInfluence
		end
	else
		if windOnBoat > 100 and windOnBoat < 260 then
			windForceByDirection = 15 * math.sqrt(1 * math.cos(math.rad(2*(windOnBoat + 90))) + 1.3) * AquaConfig.Boats[boatScriptName].windInfluence
		end
	end
	
	-- AUD.insp("Boat", "windSpeedKPH (MPH):", windSpeedKPH / 1.60934)
	-- AUD.insp("Boat", "windForceByDirection154:", windForceByDirection)
	local coefficientSailAngle = 0
	local requiredSailAngle = 0
	if windOnBoat >= 150 and windOnBoat <= 210 then
		if boat:getModData().sailCode == 1 and sailAngle < 0 then
			windForceByDirection = windForceByDirection * (sailAngle / -90)
			requiredSailAngle = "Any < 0"
		elseif boat:getModData().sailCode == 2 and sailAngle > 0 then
			windForceByDirection = windForceByDirection * (sailAngle / 90)
			requiredSailAngle = "Any > 0"
		else 
			windForceByDirection = 0
			requiredSailAngle = "Another direction"
		end
	elseif windOnBoat < 150 and boat:getModData().sailCode == 2 and sailAngle < 0 then
		requiredSailAngle = windOnBoat/2
		local deltaAngle = math.abs(sailAngle) - requiredSailAngle
		if deltaAngle > 10 then
			local y2 = 0.44
			local x2 = requiredSailAngle+10
			local x1 = 90
			local y1 = 0
			local m = y2/(x2-x1)
			coefficientSailAngle = m * (math.abs(sailAngle)-90)
		elseif deltaAngle < -10 then
			local y2 = 0.44
			local x2 = requiredSailAngle - 10
			if x2 <= 0 then x2 = 0.01 end
			local m = y2/x2
			coefficientSailAngle = m * math.abs(sailAngle)
		else
			coefficientSailAngle = -0.005 * deltaAngle^2 + 1
		end
		if coefficientSailAngle > 0 then
			windForceByDirection = coefficientSailAngle * windForceByDirection
		else
			windForceByDirection = 0
		end
	elseif windOnBoat > 210 and boat:getModData().sailCode == 1 and sailAngle > 0 then
		requiredSailAngle = (360 - windOnBoat)/2
		local deltaAngle = math.abs(sailAngle) - requiredSailAngle
		if deltaAngle > 10 then
			local y2 = 0.44
			local x2 = requiredSailAngle+10
			local x1 = 90
			local y1 = 0
			local m = y2/(x2-x1)
			coefficientSailAngle = m * (math.abs(sailAngle)-90)
		elseif deltaAngle < -10 then
			local y2 = 0.44
			local x2 = requiredSailAngle - 10
			if x2 <= 0 then x2 = 0.01 end
			local m = y2/x2
			coefficientSailAngle = m * math.abs(sailAngle)
		else
			coefficientSailAngle = -0.005 * deltaAngle^2 + 1
		end
		if coefficientSailAngle > 0 then
			windForceByDirection = coefficientSailAngle * windForceByDirection
		else
			windForceByDirection = 0
		end
	else
		windForceByDirection = 0
		requiredSailAngle = "Another direction"
	end
	
	-- AUD.insp("Boat", "Name: ", boatScriptName)
	-- AUD.insp("Boat", "Boat Speed: ", boatSpeedKPH)
	-- AUD.insp("Boat", "Mass: ", boat:getMass())
	-- AUD.insp("Boat", " ", " ")		
	-- AUD.insp("Boat", "windOnBoat:", windOnBoat)
	-- AUD.insp("Boat", "SailAngle:", sailAngle)
	-- AUD.insp("Boat", "RequiredSailAngle (absolute value):", requiredSailAngle)
	-- AUD.insp("Boat", "coefficientSailAngle:", coefficientSailAngle)
	-- AUD.insp("Boat", "windForceByDirection:", windForceByDirection)
	
	boat:getAttachmentWorldPos("checkFront", frontVector)
	
	local savedWindForce = boat:getModData()["windForceByDirection"]
	if savedWindForce == nil then
		savedWindForce = 0
	end
	
	if isKeyDown(getCore():getKey("Backward")) then
		savedWindForce = 0
	elseif collisionWithGround then
		savedWindForce = 0
	elseif savedWindForce < windForceByDirection then
		savedWindForce = (savedWindForce + 0.05)
	elseif savedWindForce >= windForceByDirection then
		savedWindForce = (savedWindForce - 0.02)
	end
	
	boat:getModData()["windForceByDirection"] = savedWindForce
	-- AUD.insp("Boat", "savedWindForce:", savedWindForce)

	local squareFrontVehicle = getCell():getGridSquare(frontVector:x(), frontVector:y(), 0)
	if squareFrontVehicle ~= nil and isWater(squareFrontVehicle) then
		if savedWindForce > 0 and boatSpeedKPH < (savedWindForce * 1.60934) and boatSpeedKPH < windSpeedKPH and not isKeyDown(getCore():getKey("Backward")) then
			local startCoeff = 1
			if boatSpeedKPH < 2 * 1.60934 then
				startCoeff = 5
			end
			if collisionWithGround then 
				boatDirVector:mul(150 * savedWindForce)
			else
				boatDirVector:mul(550 * savedWindForce * startCoeff)
			end
			boat:setPhysicsActive(true)
			tempVec2:set(0, 0, 0)
			boat:addImpulse(boatDirVector, tempVec2)
		end
		-- AUD.insp("Boat", "forceVectorX:", boatDirVector:x())
		-- AUD.insp("Boat", "forceVectorZ:", boatDirVector:y())
		-- AUD.insp("Boat", "forceVectorY:", boatDirVector:z())
	end
	-- if boat:getDriver() then -- TODO исправить для онлайна
		-- if isKeyDown(getCore():getKey("Left")) then
			-- -- boat:update()
			-- forceVector = boat:getWorldPos(-1, 0, 0, tempVec1):add(-boat:getX(), -boat:getY(), -boat:getZ())
			-- forceVector:mul(4000)
			-- forceVector:set(forceVector:x(), 0, forceVector:y())
			
			-- boat:getWorldPos(0, 0, -3, tempVec2):add(-boat:getX(), -boat:getY(), -boat:getZ())
			-- tempVec2:set(tempVec2:x(), tempVec2:z(), tempVec2:y())
			-- boat:addImpulse(forceVector, tempVec2)   
		-- elseif isKeyDown(getCore():getKey("Right")) then
			-- -- boat:update()
			-- forceVector = boat:getWorldPos(1, 0, 0, tempVec1):add(-boat:getX(), -boat:getY(), -boat:getZ())
			-- forceVector:mul(4000)
			-- forceVector:set(forceVector:x(), 0, forceVector:y())
			
			-- boat:getWorldPos(0, 0, -3, tempVec2):add(-boat:getX(), -boat:getY(), -boat:getZ())
			-- tempVec2:set(tempVec2:x(), tempVec2:z(), tempVec2:y())
			-- boat:addImpulse(forceVector, tempVec2)
		-- end
	-- end
end


-------------------------------------
-- Physics
-------------------------------------

function AquaPhysics.boatEngineShutDownOnGround(veh)
	local sq = veh:getSquare()
	if sq and not isWater(sq) and veh:isEngineRunning() then
		veh:engineDoShutingDown()
	end
end

function AquaPhysics.stopVehicleMove(vehicle, force)   	
	local speed = vehicle:getCurrentSpeedKmHour()
	local lenHalf = vehicle:getScript():getPhysicsChassisShape():z()/2

	local forceVector = vehicle:getWorldPos(0, 10, 1, tempVec1):add(-vehicle:getX(), -vehicle:getY(), -vehicle:getZ())
	forceVector:mul(math.abs(speed)*300)
	forceVector:set(forceVector:x(), 0, forceVector:y())
	local pushPoint = vehicle:getWorldPos(0, 0, -lenHalf, tempVec2):add(-vehicle:getX(), -vehicle:getY(), -vehicle:getZ())
	pushPoint:set(pushPoint:x(), 0, pushPoint:y())
	
	vehicle:addImpulse(forceVector, pushPoint)
	vehicle:update() 
end

function AquaPhysics.inertiaFix(boat)	
	if boat:getSquare() ~= nil and isWater(boat:getSquare()) then
		local speed = math.abs(boat:getCurrentSpeedKmHour())
		if speed < 1 then
			boat:setMass(100)
		elseif speed < 10 then
			boat:setMass(100*speed)
		else
			if boat:getMass() ~= 1000 then 
				boat:setMass(1000)
			end
		end
	end
end

function AquaPhysics.reverseSpeedFix(boat, limit)
	if boat:getSquare() ~= nil and isWater(boat:getSquare()) then
		local speed = boat:getCurrentSpeedKmHour()
		if isKeyDown(getCore():getKey("Backward")) then
			if speed < -limit then
				AquaPhysics.stopVehicleMove(boat, 3000)
			end
		end
	end
end

function AquaPhysics.heightFix(boat)
	local squareUnderVehicle = getCell():getGridSquare(boat:getX(), boat:getY(), 0)
	-- AUD.insp("Boat", "getDebugZ:", boat:getDebugZ())
	if squareUnderVehicle ~= nil and isWater(squareUnderVehicle) then
		-- AUD.insp("Boat", "getDebugZ:", boat:getDebugZ())
		if boat:getDebugZ() < 0.62 and boat:getCurrentSpeedKmHour() < 2 then 
			-- boat:setPhysicsActive(true)
			-- print("AquaPhysics.heightFix")
			tempVec1:set(0, 5000, 0)
			tempVec2:set(0, 0, 0)
			boat:addImpulse(tempVec1, tempVec2)
			-- boat:update()
		end
	elseif boat:getDebugZ() < 0.1 then
		boat:setZ(0.9 - boat:getDebugZ())
	end
end

function AquaPhysics.addImpulseGetWorldPos(boat, force)
	tempVec1:set(0, 0, 0)
	local forceVector = boat:getWorldPos(0, 0, 1, tempVec1):add(-boat:getX(), -boat:getY(), -boat:getZ())
	
	-- AUD.insp("Boat", "addImpulseGetWorldPos:", forceVector:x(),   forceVector:y())
	forceVector:mul(force)
	-- AUD.insp("Boat", "addImpulseGetWorldPosforce:", forceVector:x(), forceVector:y())
	forceVector:set(forceVector:x(), 0, forceVector:y())
	tempVec2:set(0, 0, 0)
	boat:addImpulse(forceVector, tempVec2)
end

function AquaPhysics.addImpulseXY(boat, force)
	frontVector:set(0,0,0)
	rearVector:set(0,0,0)
	boat:getAttachmentWorldPos("trailerfront", frontVector)
	boat:getAttachmentWorldPos("trailer", rearVector)
	local x = frontVector:x() - rearVector:x()
	local y = frontVector:y() - rearVector:y()
	local forceVector = boatDirVector
	
	-- AUD.insp("Boat", "addImpulseXY:", forceVector:x(),   forceVector:y())
	forceVector:mul(force)
	-- AUD.insp("Boat", "addImpulseXYforce:", forceVector:x(), forceVector:y())
	forceVector:set(forceVector:x(), 0, forceVector:y())
	tempVec2:set(0, 0, 0)
	boat:addImpulse(forceVector, tempVec2)
end


function AquaPhysics.waterFlowRotation(boat, force)
	local playerObj = getSpecificPlayer(0)
	if not playerObj or not (boat:getDriver() == playerObj) then return end
	if boat:getDriver() and boat:getPartById("Propeller") and boat:getPartById("Propeller"):getInventoryItem() and not boat:getModData()["aqua_anchor_on"] then
		local lenHalf = boat:getScript():getPhysicsChassisShape():z()/2
		if isKeyDown(getCore():getKey("Right")) and 
				not isKeyDown(getCore():getKey("Forward")) and 
				not isKeyDown(getCore():getKey("Backward")) then
			-- boat:setPhysicsActive(true)
			-- AquaPhysics.addImpulseGetWorldPos(boat, force)
			boat:setPhysicsActive(true)
			
			local forceVector = boat:getWorldPos(-1, 0, 0, tempVec1):add(-boat:getX(), -boat:getY(), -boat:getZ())
			local pushPoint = boat:getWorldPos(0, 0, lenHalf, tempVec2):add(-boat:getX(), -boat:getY(), -boat:getZ())
			pushPoint:set(pushPoint:x(), 0, pushPoint:y())
			
			forceVector:mul(force)
			forceVector:set(forceVector:x(), 0, forceVector:y())
			boat:addImpulse(forceVector, pushPoint)
			boat:update()

			local forceVector = boat:getWorldPos(1, 0, 0, tempVec1):add(-boat:getX(), -boat:getY(), -boat:getZ())
			local pushPoint = boat:getWorldPos(0, 0, -lenHalf, tempVec2):add(-boat:getX(), -boat:getY(), -boat:getZ())
			pushPoint:set(pushPoint:x(), 0, pushPoint:y())
			
			forceVector:mul(force)
			forceVector:set(forceVector:x(), 0, forceVector:y())
			boat:addImpulse(forceVector, pushPoint)
			boat:update()

		elseif isKeyDown(getCore():getKey("Left")) and 
				not isKeyDown(getCore():getKey("Forward")) and 
				not isKeyDown(getCore():getKey("Backward")) then
			boat:setPhysicsActive(true)
			local forceVector = boat:getWorldPos(1, 0, 0, tempVec1):add(-boat:getX(), -boat:getY(), -boat:getZ())
			local pushPoint = boat:getWorldPos(0, 0, lenHalf, tempVec2):add(-boat:getX(), -boat:getY(), -boat:getZ())
			pushPoint:set(pushPoint:x(), 0, pushPoint:y())
			
			forceVector:mul(force)
			forceVector:set(forceVector:x(), 0, forceVector:y())
			boat:addImpulse(forceVector, pushPoint)
			boat:update()

			local forceVector = boat:getWorldPos(-1, 0, 0, tempVec1):add(-boat:getX(), -boat:getY(), -boat:getZ())
			local pushPoint = boat:getWorldPos(0, 0, -lenHalf, tempVec2):add(-boat:getX(), -boat:getY(), -boat:getZ())
			pushPoint:set(pushPoint:x(), 0, pushPoint:y())
			
			forceVector:mul(force)
			forceVector:set(forceVector:x(), 0, forceVector:y())
			boat:addImpulse(forceVector, pushPoint)
			boat:update()
		end
	end
end

-------------------------------------
-- Control
-------------------------------------

function AquaPhysics.changeSailAngle(boat)
	local playerObj = getSpecificPlayer(0)
	if not playerObj or not (boat:getDriver() == playerObj) then return end
	local sailAngle = boat:getModData()["sailAngle"]
	if sailAngle == nil then
		sailAngle = 0
		boat:getModData()["sailAngle"] = 0
	end
	if isKeyDown(Keyboard.KEY_LEFT) then
		if sailAngle < 90 then
			sailAngle = sailAngle + 0.5
		end
		boat:getModData()["sailAngle"] = sailAngle
		playerObj:getStats():setEndurance(playerObj:getStats():getEndurance() - 0.0005)
	elseif isKeyDown(Keyboard.KEY_RIGHT) then
		if sailAngle > -90 then
			sailAngle = sailAngle - 0.5
		end
		boat:getModData()["sailAngle"] = sailAngle
		playerObj:getStats():setEndurance(playerObj:getStats():getEndurance() - 0.0005)
	end
end

function AquaPhysics.stopByAnchor(vehicle, force)   
	local linearVel = vehicle:getLinearVelocity(tempVec1)
	tempVec2:set(linearVel:x(), linearVel:z(), linearVel:y())   

	tempVec1:set(tempVec2:x(), 0, tempVec2:y())
	if tempVec1:length() > 1 then 
		tempVec1:normalize()
	end

	tempVec1:mul(-force)
	tempVec2:set(0, 0, 0)
	vehicle:addImpulse(tempVec1, tempVec2) 
 end

local function dirTest (boat)
	boat:getAttachmentWorldPos("trailerfront", frontVector)
	boat:getAttachmentWorldPos("trailer", rearVector)
	local x = frontVector:x() - rearVector:x()
	local y = frontVector:y() - rearVector:y()
	-- AUD.insp("Boat", "frontVector:", frontVector:x(), frontVector:y())
	-- AUD.insp("Boat", "rearVector:", rearVector:x(), rearVector:y())
	local boatDirection = math.atan2(x,y) * 57.2958 + 180
	-- AUD.insp("Boat", "boatDirection:", boatDirection)
	boatDirVector:set(x, 0, y):normalize()
	-- AUD.insp("Boat", "boatDirVector:", boatDirVector:x(),   boatDirVector:z())
	boatDirVector = boat:getWorldPos(0, 0, 1, tempVec1):add(-boat:getX(), -boat:getY(), -boat:getZ()):normalize()
	-- AUD.insp("Boat", "getWorldPos:", boatDirVector:x(),  boatDirVector:y())
	boatDirVector = boat:getLocalPos(boatDirVector, tempVec2):normalize()
	-- AUD.insp("Boat", "getLocalPos:", boatDirVector:x(), boatDirVector:y(), boatDirVector:z())
	boatDirVector = boat:getLinearVelocity(tempVec2):normalize()
	-- AUD.insp("Boat", "getLinearVelocity:", boatDirVector:x(), boatDirVector:z())
	
end


function AquaPhysics.updateVehicles()
	local vehicles = getCell():getVehicles()
    for i=0, vehicles:size()-1 do
        local boat = vehicles:get(i)
		if boat ~= nil and AquaConfig.isBoat(boat) then
			-- dirTest (boat)
			local collisionWithGround = AquaPhysics.Water.Borders(boat)
			AquaPhysics.heightFix(boat)
			-- AquaPhysics.inertiaFix(boat)
			if AquaConfig.Boat(boat).limitReverseSpeed ~= nil then
				AquaPhysics.reverseSpeedFix(boat, AquaConfig.Boats[boat:getScript():getName()].limitReverseSpeed)
			end
			if boat:getPartById("Sails") then
				if boat:getPartById("Sails"):getLight():getActive() and not boat:getModData()["aqua_anchor_on"] then
					AquaPhysics.Wind.windImpulse(boat, collisionWithGround)
				end
				AquaPhysics.changeSailAngle(boat)
			end
			
			if math.abs(boat:getCurrentSpeedKmHour()) < 4 then
				AquaPhysics.waterFlowRotation(boat, 800)
			end
			
			if boat:getModData()["aqua_anchor_on"] then 
				AquaPhysics.stopByAnchor(boat, 5000) 
			end
			AquaPhysics.boatEngineShutDownOnGround(boat)
        end
    end
	
end

Events.OnTick.Add(AquaPhysics.updateVehicles)