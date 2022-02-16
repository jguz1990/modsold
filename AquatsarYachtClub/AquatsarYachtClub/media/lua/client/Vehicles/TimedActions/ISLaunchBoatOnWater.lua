--**************************************************************
--**                    Developer: Aiteron                    **
--**************************************************************
require "AquaConfig"
require "TimedActions/ISBaseTimedAction"

ISLaunchBoatOnWater = ISBaseTimedAction:derive("ISLaunchBoatOnWater")


function ISLaunchBoatOnWater:isValid()
    return self.trailer and not self.trailer:isRemovedFromWorld();
end

function ISLaunchBoatOnWater:update()
    self.character:faceThisObject(self.trailer)

    -- speed 1 = 1, 2 = 5, 3 = 20, 4 = 40
    local uispeed = UIManager.getSpeedControls():getCurrentGameSpeed()
    local speedCoeff = { [1] = 1, [2] = 5, [3] = 20, [4] = 40 }

    local timeLeftNow =  (1 - self:getJobDelta()) * self.maxTime

    if self.isFadeOut == false and timeLeftNow < 115 * speedCoeff[uispeed] then
        -- UIManager.FadeOut(self.character:getPlayerNum(), 1)
        self.isFadeOut = true
        -- saveGame()
    end

    self.character:setMetabolicTarget(Metabolics.HeavyWork);
end

function ISLaunchBoatOnWater:start()
    setGameSpeed(1)
    self:setActionAnim("Loot")
    self.trailer:getEmitter():playSound("boat_launching")
end

function ISLaunchBoatOnWater:stop()
    if self.isFadeOut == true then
        -- UIManager.FadeIn(self.character:getPlayerNum(), 1)
        UIManager.setFadeBeforeUI(self.character:getPlayerNum(), false)
    end
    self.trailer:getEmitter():stopSoundByName("boat_launching")
    ISBaseTimedAction.stop(self)
end

function ISLaunchBoatOnWater:perform()
    local newTrailerName = AquaConfig.Trailers[self.trailer:getScript():getName()].emptyTrailer
    sendClientCommand(self.character, 'aquatsar', 'launchBoat', {trailer = self.trailer:getId(), x = self.square:getX(), y = self.square:getY()})
    local playerNum = self.character:getPlayerNum()
    UIManager.FadeIn(playerNum, 1)
    UIManager.setFadeBeforeUI(playerNum, false)
    setGameSpeed(1)
    -- self.trailer:getEmitter():stopSoundByName("boat_launching")
    ISBaseTimedAction.perform(self)
end


function ISLaunchBoatOnWater:new(character, trailer, sq)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.character = character
    o.trailer = trailer
    o.square = sq
    o.isFadeOut = false
    o.maxTime = 300;
    if character:isTimedActionInstant() then o.maxTime = 10 end
    return o
end

