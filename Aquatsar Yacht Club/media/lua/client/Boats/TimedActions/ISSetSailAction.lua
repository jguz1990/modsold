--***********************************************************
--**                      AQUATSAR       	               **
--***********************************************************

require "TimedActions/ISBaseTimedAction"
require 'AquaConfig'

ISSetSailAction = ISBaseTimedAction:derive("ISSetSailAction")

function ISSetSailAction:isValid()
	if not self.boat:getPartById("Sails") or not self.boat:getPartById("Sails"):getInventoryItem() then 
		return false
	else
		return self.character:getVehicle() ~= nil
	end
end

function ISSetSailAction:update()
	-- speed 1 = 1, 2 = 5, 3 = 20, 4 = 40
    -- local uispeed = UIManager.getSpeedControls():getCurrentGameSpeed()
    -- if uispeed ~= 1 and self.isFirstSail  then
        -- UIManager.getSpeedControls():SetCurrentGameSpeed(1)
    -- end
    -- local speedCoeff = { [1] = 1, [2] = 5, [3] = 20, [4] = 40 }

	-- local timeLeftNow =  (1 - self:getJobDelta()) * self.maxTime

	-- if self.isFadeOut == false and timeLeftNow < 200 * speedCoeff[uispeed] then
		-- UIManager.FadeOut(self.playerNum, 1)
        -- self.isFadeOut = true
		-- -- saveGame()
	-- end
end

function ISSetSailAction:start()
	setGameSpeed(1)
    if not self.boat:getPartById("Sails"):getLight():getActive() then
		self.boat:getEmitter():playSound("boat_sails_set")
		if self.character:getModData()["isFirstSail"] == nil then
			self.character:getModData()["isFirstSail"] = false
			getSoundManager():StopMusic()
			self.sound = getSoundManager():playMusic("aquatsar_main_theme");
			self.isFirstSail = true
		end
    else
		self.maxTime = 200
		self.boat:getEmitter():playSound("boat_sails_change_direction")
	end
end

function ISSetSailAction:stop()
    -- if self.sound then
        -- getSoundManager():StopSound(self.sound)
    -- end
	self.boat:getEmitter():stopSoundByName("boat_sails_set")
    -- if self.isFadeOut == true then
		-- UIManager.FadeIn(self.playerNum, 1)
		-- UIManager.setFadeBeforeUI(self.playerNum, false)
	-- end
	ISBaseTimedAction.stop(self)
end

function ISSetSailAction:perform()
    local part = self.boat:getPartById("Sails")
	if self.dir == "LEFT" then
        part:setModelVisible("Boom", false)
		part:setModelVisible("SailCover", false)
		part:setModelVisible("SailLeft", true)
		part:setModelVisible("SailRight", false)
		self.boat:getModData().sailCode = 1
		part:setLightActive(true)
    elseif self.dir == "RIGHT" then
        part:setModelVisible("Boom", false)
		part:setModelVisible("SailCover", false)
		part:setModelVisible("SailLeft", false)
		part:setModelVisible("SailRight", true)
		self.boat:getModData().sailCode = 2
		part:setLightActive(true)
    end
	self.character:getStats():setEndurance(self.character:getStats():getEndurance() - 0.23)
	-- UIManager.FadeIn(self.playerNum, 1)
	-- UIManager.setFadeBeforeUI(self.playerNum, false)

	ISBaseTimedAction.perform(self)
end

function ISSetSailAction:new(character, boat, dir)
	local o = {}
	setmetatable(o, self)
	self.__index = self
    o.character = character
    o.playerNum = character:getPlayerNum()
    o.isFadeOut = false
	o.maxTime = 400
    o.boat = boat
    o.dir = dir

	return o
end

