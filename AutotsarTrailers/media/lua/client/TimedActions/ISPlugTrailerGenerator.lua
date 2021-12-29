--***********************************************************
--**                    	 iBrRus                        **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISPlugTrailerGenerator = ISBaseTimedAction:derive("ISPlugTrailerGenerator");

function ISPlugTrailerGenerator:isValid()
	return true
end

function ISPlugTrailerGenerator:waitToStart()
	self.character:faceThisObject(self.trailer)
	return self.character:shouldBeTurning()
end

function ISPlugTrailerGenerator:update()
	self.character:faceThisObject(self.trailer)
end

function ISPlugTrailerGenerator:start()
	local fuelAmount = self.trailer:getPartById("GasTank"):getContainerContentAmount()/self.trailer:getPartById("GasTank"):getContainerCapacity() * 100
	self.trailer:setMass(10000)
	self.generator = IsoGenerator.new(InventoryItemFactory.CreateItem("Base.Generator"), getCell(), self.trailer:getSquare())
	self.generator:setSprite("appliances_misc_01_10")
	self.generator:setFuel(fuelAmount)
	self.generator:setCondition(self.trailer:getPartById("Engine"):getCondition())
	self:setActionAnim("Loot")
	self.character:SetVariable("LootPosition", "Low")
end

function ISPlugTrailerGenerator:stop()
	self.generator:remove()
    ISBaseTimedAction.stop(self);
end

function ISPlugTrailerGenerator:perform()
    self.generator:setConnected(true)
	self.trailer:getModData()["generatorObject"] = self.generator
	self.trailer:getPartById("EarthingOn"):setInventoryItem(InventoryItemFactory.CreateItem("Base.LightBulb"))
	-- self.trailer:getPartById("EarthingOff"):setInventoryItem(nil)
	self.trailer:setMass(10000)
    -- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end

function ISPlugTrailerGenerator:new(character, trailer, time)
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
