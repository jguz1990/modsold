--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISHornBoat = ISBaseTimedAction:derive("ISHornBoat")

function ISHornBoat:isValid()
	return true
end

function ISHornBoat:update()
	if (getTimestampMs() - self.t > 1500) then
		ISBaseTimedAction.forceComplete(self)
	end
end

function ISHornBoat:start()
	self.t = getTimestampMs()
	ISVehicleMenu.onHornStart(self.character)
end

function ISHornBoat:stop()
	ISVehicleMenu.onHornStop(self.character)
    ISBaseTimedAction.stop(self)
end

function ISHornBoat:perform()
	ISVehicleMenu.onHornStop(self.character)
	ISBaseTimedAction.perform(self)
end

function ISHornBoat:new(character)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.maxTime = -1
	o.t = getTimestampMs()
	return o
end

