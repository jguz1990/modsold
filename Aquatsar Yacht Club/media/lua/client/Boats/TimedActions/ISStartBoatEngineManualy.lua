--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISStartBoatEngineManualy = ISBaseTimedAction:derive("ISStartBoatEngineManualy")

function ISStartBoatEngineManualy:isValid()
	self.boat = self.character:getVehicle()
	return self.boat ~= nil and
--		boat:isEngineWorking() and
		self.boat:isDriver(self.character) and
		not self.boat:isEngineRunning() and 
		not self.boat:isEngineStarted()
end

function ISStartBoatEngineManualy:start()
	self.soundId = self.boat:getEmitter():playSound("TryStartEngineManualy")
end

function ISStartBoatEngineManualy:stop()
	self.boat:getEmitter():stopSound(self.soundId)
	ISBaseTimedAction.stop(self)
end

function ISStartBoatEngineManualy:perform()
	local haveKey = false;
	-- if self.character:getInventory():haveThisKeyId(boat:getKeyId()) then
		-- haveKey = true;
	-- end
	self.boat:getEmitter():stopSound(self.soundId)
	self.boat:setHotwired(true)
	sendClientCommand(self.character, 'vehicle', 'startEngine', {haveKey=haveKey})
	-- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self)
end

function ISStartBoatEngineManualy:new(character)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.maxTime = 9 * 50
	return o
end

