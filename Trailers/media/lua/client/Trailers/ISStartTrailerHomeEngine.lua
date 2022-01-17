require "TimedActions/ISBaseTimedAction"

ISStartTrailerHomeEngine = ISBaseTimedAction:derive("ISStartTrailerHomeEngine")

function ISStartTrailerHomeEngine:isValid()
	local vehicle = self.character:getVehicle()
	return vehicle ~= nil and
--		vehicle:isEngineWorking() and
--		vehicle:isDriver(self.character) and
		not vehicle:isEngineRunning() and 
		not vehicle:isEngineStarted()
end

function ISStartTrailerHomeEngine:update()
	self:forceComplete()
end

function ISStartTrailerHomeEngine:start()
end

function ISStartTrailerHomeEngine:stop()
	ISBaseTimedAction.stop(self)
end

function ISStartTrailerHomeEngine:perform()
	local vehicle = self.character:getVehicle()
	local haveKey = false;
	if self.character:getInventory():haveThisKeyId(vehicle:getKeyId()) then
		haveKey = true;
	end
	vehicle:tryStartEngine(true)
	-- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self)
end

function ISStartTrailerHomeEngine:new(character)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.maxTime = -1
	return o
end

