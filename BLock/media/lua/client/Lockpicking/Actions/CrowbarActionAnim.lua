require "TimedActions/ISBaseTimedAction"

CrowbarActionAnim = ISBaseTimedAction:derive("CrowbarActionAnim")

function CrowbarActionAnim:isValid()
	return true
end

function CrowbarActionAnim:update()
	local uispeed = UIManager.getSpeedControls():getCurrentGameSpeed()
    if uispeed ~= 1 then
        UIManager.getSpeedControls():SetCurrentGameSpeed(1)
	end
	
	if not self.sound or not self.sound:isPlaying() then
		self.sound = getSoundManager():PlayWorldSound("Crowbar_" .. (ZombRand(8)+1), self.character:getCurrentSquare(), 1, 25, 2, true)
	end
end

function CrowbarActionAnim:start()
	if self.isGarage then
		self:setActionAnim("CrowbarGarageAction")
	else
		self:setActionAnim("CrowbarAction")
	end
	self.sound = getSoundManager():PlayWorldSound("Crowbar_1", self.character:getCurrentSquare(), 1, 25, 2, true)
end

function CrowbarActionAnim:stop()
	if self.sound and self.sound:isPlaying() then
		getSoundManager():StopSound(self.sound)
    end

	ISBaseTimedAction.stop(self)
end

function CrowbarActionAnim:perform()
	if self.sound and self.sound:isPlaying() then
		getSoundManager():StopSound(self.sound)
    end

	ISBaseTimedAction.perform(self)
end

function CrowbarActionAnim:new(character, isGarage)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.maxTime = 50000
	o.isGarage = isGarage
	
	return o
end




