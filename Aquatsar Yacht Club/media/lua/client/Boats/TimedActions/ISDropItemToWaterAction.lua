require "TimedActions/ISBaseTimedAction"

ISDropItemToWaterAction = ISBaseTimedAction:derive("ISDropItemToWaterAction")

function ISDropItemToWaterAction:isValid()
	return true
end

function ISDropItemToWaterAction:update()
end

function ISDropItemToWaterAction:start()
	self:setActionAnim("Loot")
	
end

function ISDropItemToWaterAction:stop()
	ISBaseTimedAction.stop(self)
end

function ISDropItemToWaterAction:perform()
	self.character:getEmitter():playSound("ThrowInWater")
	if self.item:getContainer() ~= nil then
		self.item:getContainer():Remove(self.item)
		if isForceDropHeavyItem(self.item) then
			self.character:setPrimaryHandItem(nil);
			self.character:setSecondaryHandItem(nil);
		end
	end
	ISBaseTimedAction.perform(self)
end

function ISDropItemToWaterAction:new(character, item)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.item = item
	o.maxTime = 100
	
	return o
end




