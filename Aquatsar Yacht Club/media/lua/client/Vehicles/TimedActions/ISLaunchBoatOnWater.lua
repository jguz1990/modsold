--**************************************************************
--**                    Developer: Aiteron                    **
--**************************************************************
require 'AquaConfig'
require "TimedActions/ISBaseTimedAction"

ISLaunchBoatOnWater = ISBaseTimedAction:derive("ISLaunchBoatOnWater")


function ISLaunchBoatOnWater:isValid()
	return self.trailer and not self.trailer:isRemovedFromWorld();
end

function ISLaunchBoatOnWater:update()
	self.character:faceThisObject(self.trailer)

	-- speed 1 = 1, 2 = 5, 3 = 20, 4 = 40
	local uispeed = UIManager.getSpeedControls():getCurrentGameSpeed()
	local speedCoeff = { [1] = 1, [2] = 5, [3] = 20, [4] = 40 }

	local timeLeftNow =  (1 - self:getJobDelta()) * self.maxTime

	if self.isFadeOut == false and timeLeftNow < 115 * speedCoeff[uispeed] then
		-- UIManager.FadeOut(self.character:getPlayerNum(), 1)
		self.isFadeOut = true
		-- saveGame()
	end

    self.character:setMetabolicTarget(Metabolics.HeavyWork);
end

function ISLaunchBoatOnWater:start()
	setGameSpeed(1)
	self:setActionAnim("Loot")
	self.trailer:getEmitter():playSound("boat_launching")
end

function ISLaunchBoatOnWater:stop()
	if self.isFadeOut == true then
		-- UIManager.FadeIn(self.character:getPlayerNum(), 1)
		UIManager.setFadeBeforeUI(self.character:getPlayerNum(), false)
	end
	self.trailer:getEmitter():stopSoundByName("boat_launching")
	ISBaseTimedAction.stop(self)
end

function ISLaunchBoatOnWater:perform()
	local newTrailerName = AquaConfig.Trailers[self.trailer:getScript():getName()].emptyTrailer
	local boatName = AquaConfig.Trailers[self.trailer:getScript():getName()].boat
	local boat = addVehicleDebug("Base."..boatName, IsoDirections.N, 0, self.square)
	boat:setDebugZ(0.75)
	boat:setAngles(self.trailer:getAngleX(), self.trailer:getAngleY(), self.trailer:getAngleZ())
	boat:setRust(self.trailer:getRust())
	ISVehicleMenuForTrailerWithBoat.replaceTrailerBoat(self.trailer, boat)
	ISVehicleMenuForTrailerWithBoat.replaceTrailer(self.trailer, newTrailerName)
	local boatName = boat:getPartById("BoatName")
	if boatName then
		VehicleUtils.callLua(boatName:getLuaFunction("init"), boat, boatName, self.character)
	end
	local sails = boat:getPartById("Sails")
	if sails then
		VehicleUtils.callLua(sails:getLuaFunction("init"), boat, sails, self.character)
	end
	-- Delete key
	local xx = boat:getX()
	local yy = boat:getY()

	for z=0, 3 do
		for i=xx - 15, xx + 15 do
			for j=yy - 15, yy + 15 do
				local tmpSq = getCell():getGridSquare(i, j, z)
				if tmpSq ~= nil then
					for k=0, tmpSq:getObjects():size()-1 do
						local ttt =	tmpSq:getObjects():get(k)
						if ttt:getContainer() ~= nil then
							local items = ttt:getContainer():getItems()
							for ii=0, items:size()-1 do
								if items:get(ii):getKeyId() == boat:getKeyId() then
									items:remove(ii)
								end
							end
						elseif instanceof(ttt, "IsoWorldInventoryObject") then
							if ttt:getItem() and ttt:getItem():getContainer() then
								local items = ttt:getItem():getContainer():getItems()
								for ii=0, items:size()-1 do
									if items:get(ii):getKeyId() == boat:getKeyId() then
										items:remove(ii)
									end
								end
							end
							
							if ttt:getItem() and ttt:getItem():getKeyId() == boat:getKeyId() then
								tmpSq:removeWorldObject(ttt)
							end
						end
					end
				end
			end
		end
	end

	local playerNum = self.character:getPlayerNum()
	UIManager.FadeIn(playerNum, 1)
	UIManager.setFadeBeforeUI(playerNum, false)
	setGameSpeed(1)
	-- self.trailer:getEmitter():stopSoundByName("boat_launching")
	ISBaseTimedAction.perform(self)
end


function ISLaunchBoatOnWater:new(character, trailer, sq)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
    o.trailer = trailer
    o.square = sq
	o.isFadeOut = false
    o.maxTime = 300;
    
	if character:isTimedActionInstant() then o.maxTime = 10 end
	return o
end

