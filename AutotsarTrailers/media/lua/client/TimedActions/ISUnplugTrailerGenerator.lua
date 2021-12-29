--***********************************************************
--**                    	 iBrRus                        **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISUnplugTrailerGenerator = ISBaseTimedAction:derive("ISUnplugTrailerGenerator");

function ISUnplugTrailerGenerator:isValid()
	return true
end

function ISUnplugTrailerGenerator:waitToStart()
	self.character:faceThisObject(self.generator)
	return self.character:shouldBeTurning()
end

function ISUnplugTrailerGenerator:update()
	self.character:faceThisObject(self.generator)
end

function ISUnplugTrailerGenerator:start()
	self.generator = self.trailer:getModData()["generatorObject"]
	self:setActionAnim("Loot")
	self.character:SetVariable("LootPosition", "Low")
end

function ISUnplugTrailerGenerator:stop()
    ISBaseTimedAction.stop(self);
end

function ISUnplugTrailerGenerator:perform()
	local genId = string.format("%05d", self.generator:getX()) .. string.format("%05d", self.generator:getY())
    self.generator:setConnected(false);
	self.generator:remove()
	self.trailer:setMass(1000)
	self.trailer:getModData()["generatorObject"] = nil
	-- self.trailer:getPartById("EarthingOff"):setInventoryItem(InventoryItemFactory.CreateItem("Base.LightBulb"))
	self.trailer:getPartById("EarthingOn"):setInventoryItem(nil)
	-- TrailerGeneratorList[self.trailer] = nil
    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function ISUnplugTrailerGenerator:new(character, trailer, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.trailer = trailer;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = time;
	if o.character:isTimedActionInstant() then o.maxTime = 1; end
	return o;
end
