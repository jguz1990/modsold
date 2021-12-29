require('TimedActions/ISBaseTimedAction')

AutoSmokeCampfireLightUpAction = ISBaseTimedAction:derive("AutoSmokeCampfireLightUpAction")

function AutoSmokeCampfireLightUpAction:isValid()
    return self.campfire:getObject() and self.character:getInventory():contains(self.item)
end

function AutoSmokeCampfireLightUpAction:waitToStart()
    self.character:faceThisObject(self.campfire:getObject())
    return self.character:shouldBeTurning()
end

function AutoSmokeCampfireLightUpAction:update()
    self.item:setJobDelta(self:getJobDelta())
    self.character:faceThisObject(self.campfire:getObject())
    self.character:setMetabolicTarget(Metabolics.UsingTools)
end

function AutoSmokeCampfireLightUpAction:start()
    self.item:setJobDelta(0.0)
    self:setActionAnim("Loot")
    self.character:SetVariable("LootPosition", "Low")
end

function AutoSmokeCampfireLightUpAction:stop()
    ISBaseTimedAction.stop(self)
    self.item:setJobDelta(0.0)
end

function AutoSmokeCampfireLightUpAction:perform()
    self.item:setJobDelta(0.0)

    self.nextAction = AutoSmokeCampfirePuffAction:new(self.character, self.item, 1)
    self:addAfter(self.nextAction)

    ISBaseTimedAction.perform(self)

    if self.nextAction ~= nil then
        AutoSmoke.currentAction = self.nextAction
    end
end

function AutoSmokeCampfireLightUpAction:new(character, campfire, item)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.character = character
    o.stopOnWalk = true
    o.stopOnRun = true
    o.campfire = campfire
    o.item = item
    o.maxTime = 50
    return o
end