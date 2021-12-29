--***********************************************************
--**                      AQUATSAR       	               **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISExitBoat = ISBaseTimedAction:derive("ISExitBoat")

function ISExitBoat:isValid()
	return self.character:getVehicle() ~= nil
end

function ISExitBoat:update()
	local vehicle = self.character:getVehicle()
	local seat = vehicle:getSeat(self.character)
	vehicle:playPassengerAnim(seat, "exit")
	if self.character:GetVariable("ExitAnimationFinished") == "true" then
		self.character:ClearVariable("ExitAnimationFinished")
		self.character:ClearVariable("bExitingVehicle")
		self:forceComplete()
	end
end

function ISExitBoat:start()
	self.action:setBlockMovementEtc(true) -- ignore 'E' while exiting
	local vehicle = self.character:getVehicle()
	local seat = vehicle:getSeat(self.character)
	self.character:SetVariable("bExitingVehicle", "true")
	vehicle:playPassengerSound(seat, "exit")
end

function ISExitBoat:stop()
	self.character:clearVariable("bExitingVehicle")
	self.character:clearVariable("ExitAnimationFinished")
	local vehicle = self.character:getVehicle()
	local seat = vehicle:getSeat(self.character)
	vehicle:playPassengerAnim(seat, "idle")
	ISBaseTimedAction.stop(self)
end

function ISExitBoat:perform()
	local vehicle = self.character:getVehicle()
	local seat = vehicle:getSeat(self.character)
	vehicle:exit(self.character)
	--vehicle:setCharacterPosition(self.character, seat, "outside")
	self.character:PlayAnim("Idle")
	triggerEvent("OnExitVehicle", self.character)
    vehicle:updateHasExtendOffsetForExitEnd(self.character)
	self.character:setX(self.exitPos:x())
	self.character:setY(self.exitPos:y())
	-- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self)
end

function ISExitBoat:new(character, exitPos)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.maxTime = -1
	o.exitPos = exitPos
	return o
end

