--***********************************************************
--**                      AQUATSAR       	               **
--***********************************************************

require "TimedActions/ISBaseTimedAction"
require 'AquaConfig'

ISRemoveSailAction = ISBaseTimedAction:derive("ISRemoveSailAction")

function ISRemoveSailAction:isValid()
	return self.character:getVehicle() ~= nil
end

function ISRemoveSailAction:update()

end

function ISRemoveSailAction:start()
	setGameSpeed(1)
	self.boat:getEmitter():playSound("boat_sails_remove")
end

function ISRemoveSailAction:stop()
	self.boat:getEmitter():stopSoundByName("boat_sails_remove")
	ISBaseTimedAction.stop(self)
end

function ISRemoveSailAction:perform()
	self.character:getStats():setEndurance(self.character:getStats():getEndurance() - 0.23)
	local part = self.boat:getPartById("Sails")
	part:setModelVisible("Boom", true)
	part:setModelVisible("SailCover", true)
	part:setModelVisible("SailLeft", false)
	part:setModelVisible("SailRight", false)
	part:setLightActive(false)
	self.boat:getModData().sailCode = 0
	setGameSpeed(1)
	ISBaseTimedAction.perform(self)
end

function ISRemoveSailAction:new(character, boat)
	local o = {}
	setmetatable(o, self)
	self.__index = self
    o.character = character
    
    o.isFadeOut = false
	o.maxTime = 300
    o.boat = boat

	return o
end

