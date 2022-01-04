require("TimedActions/ISBaseTimedAction");
local esAnimate = ISBaseTimedAction:derive("esAnimate");

function esAnimate:new(character, item, time)
    local o = {};
    setmetatable(o, self);
    self.__index = self;
    o.character = character;
    o.item = item;
    o.maxTime = time or 30;

    o.jobType = '';
    o.charActionAnim = CharacterActionAnims.Craft;
    o.extra = {};

    o.stopOnWalk = true;
    o.stopOnRun = true;
    o.stopOnAim = false;
    o.forceProgressBar = true;
    o.caloriesModifier = 1;
    o.v = { 1, "28-11-2021" };
    return o;
end

function esAnimate:setCaloriesModifier(calories)
    self.caloriesModifier = calories;
end

function esAnimate:setExtra(extraData)
    self.extra = extraData;
end

function esAnimate:isValid()
    return (self.item:getContainer() and self.item:getContainer():contains(self.item));
end

function esAnimate:doPerform()
    print('toDo');
end

function esAnimate:perform()
    self.item:setJobDelta(0.0);
    self:doPerform();
    ISBaseTimedAction.perform(self);
end

function esAnimate:update()
    self.item:setJobDelta(self:getJobDelta());
end

function esAnimate:start()
    self:setActionAnim(self.charActionAnim);
    self.item:setJobType(self.jobType);
    self.item:setJobDelta(0.0);
end

function esAnimate:stop()
    ISBaseTimedAction.stop(self);
    self.item:setJobDelta(0.0);
end

return esAnimate;