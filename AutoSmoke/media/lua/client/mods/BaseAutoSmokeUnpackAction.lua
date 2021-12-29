require('TimedActions/ISBaseTimedAction')
require('AutoSmoke')

BaseAutoSmokeUnpackAction = ISBaseTimedAction:derive("BaseAutoSmokeUnpackAction")

function BaseAutoSmokeUnpackAction:isValid()
    return true
end

function BaseAutoSmokeUnpackAction:update()
    self.item:setJobDelta(self:getJobDelta())
    self.character:setMetabolicTarget(Metabolics.UsingTools)
end

function BaseAutoSmokeUnpackAction:start()
    AutoSmoke.currentAction = self

    if self.sound then
        self.craftSound = self.character:getEmitter():playSound(self.sound)
    end
    self.item:setJobType(self.jobType)
    self.item:setJobDelta(0.0)
    self:setActionAnim(CharacterActionAnims.Craft)
end

function BaseAutoSmokeUnpackAction:stop()
    if self.craftSound and self.character:getEmitter():isPlaying(self.craftSound) then
        self.character:getEmitter():stopSound(self.craftSound)
    end
    self.item:setJobDelta(0.0)
    ISBaseTimedAction.stop(self)
end

function BaseAutoSmokeUnpackAction:doPerform()
    error("Must override BaseAutoSmokeUnpackAction.doPerform")
end

function BaseAutoSmokeUnpackAction:perform()
    if self.craftSound and self.character:getEmitter():isPlaying(self.craftSound) then
        self.character:getEmitter():stopSound(self.craftSound)
    end
    self.container:setDrawDirty(true)
    self.item:setJobDelta(0.0)

    self:doPerform()

    ISInventoryPage.dirtyUI()

    ISBaseTimedAction.perform(self)

    if self.nextAction ~= nil then
        AutoSmoke.currentAction = self.nextAction
    end
end

function BaseAutoSmokeUnpackAction:transferItemBack(item)
    if instanceof(item, "DrainableComboItem") and item:getDrainableUsesInt() == 0 then return end
    self:addAfter(ISInventoryTransferAction:new(self.character, item, self.inventory, self.srcContainer))
end

function BaseAutoSmokeUnpackAction:new(character, item, srcContainer, nextItemType, time, jobType, sound)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.stopOnWalk = false
    o.stopOnRun = true
    o.character = character
    o.item = item
    o.nextItemType = nextItemType
    o.maxTime = time
    o.jobType = getRecipeDisplayName(jobType)
    o.sound = sound
    o.srcContainer = srcContainer
    o.container = item:getContainer()
    o.inventory = character:getInventory()
    o.forceProgressBar = true

    return o
end