--***********************************************************
--**                      AQUATSAR       	               **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISForceUnlockCabin = ISBaseTimedAction:derive("ISForceUnlockCabin")

function ISForceUnlockCabin:isValid()
	return self.character:getInventory():contains(self.opener) and (self.character:getVehicle() ~= nil)
end

function ISForceUnlockCabin:update()
	-- speed 1 = 1, 2 = 5, 3 = 20, 4 = 40
    local uispeed = UIManager.getSpeedControls():getCurrentGameSpeed()
    if uispeed ~= 1 and self.isFirstSail  then
        UIManager.getSpeedControls():SetCurrentGameSpeed(1)
    end
    local speedCoeff = { [1] = 1, [2] = 5, [3] = 20, [4] = 40 }

	local timeLeftNow =  (1 - self:getJobDelta()) * self.maxTime

	if self.isFadeOut == false and timeLeftNow < 300 * speedCoeff[uispeed] then
		UIManager.FadeOut(self.playerNum, 1)
        self.isFadeOut = true
	end
end

function ISForceUnlockCabin:start()
    
end

function ISForceUnlockCabin:stop()
    if self.isFadeOut == true then
		UIManager.FadeIn(self.playerNum, 1)
		UIManager.setFadeBeforeUI(self.playerNum, false)
	end
	ISBaseTimedAction.stop(self)
end

function ISForceUnlockCabin:perform()
    if ZombRand(100) < self.chance then
        self.boat:getModData()["AquaCabin_isUnlocked"] = true
        self.boat:getModData()["AquaCabin_isLockRuined"] = true
        self.character:getEmitter():playSound("UnlockDoor")				    
    else
        getSoundManager():PlayWorldSoundWav("PZ_MetalSnap", self.character:getCurrentSquare(), 1, 10, 2, true)
    end

    self.character:getStats():setEndurance(self.character:getStats():getEndurance() - 0.7)
    self.character:getBodyDamage():setBoredomLevel(self.character:getBodyDamage():getBoredomLevel() + 30)
    self.character:getBodyDamage():setUnhappynessLevel(self.character:getBodyDamage():getUnhappynessLevel() + 30)

	UIManager.FadeIn(self.playerNum, 1)
	UIManager.setFadeBeforeUI(self.playerNum, false)
	UIManager.getSpeedControls():SetCurrentGameSpeed(1)
	ISBaseTimedAction.perform(self)
end

function ISForceUnlockCabin:new(character, boat, opener, chance)
	local o = {}
	setmetatable(o, self)
	self.__index = self
    o.character = character
	o.opener = opener
	o.chance = chance
    o.playerNum = character:getPlayerNum()
    o.isFadeOut = false
	o.maxTime = 4000
    o.boat = boat

	return o
end

