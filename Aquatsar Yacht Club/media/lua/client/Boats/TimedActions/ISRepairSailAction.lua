--**************************************************************
--**                    Developer: Aiteron                    **
--**************************************************************

require "TimedActions/ISBaseTimedAction"

ISRepairSailAction = ISBaseTimedAction:derive("ISRepairSailAction")

function ISRepairSailAction:isValid()
	return self.character:getInventory():contains(self.sail) and
		self.character:getInventory():contains(self.item) and
		self.character:getInventory():contains(self.needle) and
		self.character:getInventory():contains(self.thread)
end

function ISRepairSailAction:update()
end

function ISRepairSailAction:start()
	self:setActionAnim(CharacterActionAnims.Craft)
end

function ISRepairSailAction:stop()
	ISBaseTimedAction.stop(self)
end

function ISRepairSailAction:perform()
    self.character:getInventory():Remove(self.item);
    self.thread:Use();
    self.character:getXp():AddXP(Perks.Tailoring, ZombRand(3, 6))

    self.sail:setCondition(self.sail:getCondition()+self.addCondition)

	ISBaseTimedAction.perform(self)
end

function ISRepairSailAction:new(character, sail, item, thread, needle, addCondition)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
    o.sail = sail
    o.item = item
    o.thread = thread
    o.needle = needle
    o.addCondition = addCondition

	o.maxTime = 600;

	if character:isTimedActionInstant() then o.maxTime = 10 end
	return o
end
