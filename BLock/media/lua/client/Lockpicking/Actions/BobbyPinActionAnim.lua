require "TimedActions/ISBaseTimedAction"

BobbyPinActionAnim = ISBaseTimedAction:derive("BobbyPinActionAnim")

function BobbyPinActionAnim:isValid()
	return true
end

function BobbyPinActionAnim:update()
	local uispeed = UIManager.getSpeedControls():getCurrentGameSpeed()
    if uispeed ~= 1 then
        UIManager.getSpeedControls():SetCurrentGameSpeed(1)
    end
end

function BobbyPinActionAnim:start()
	self:setActionAnim("Picklock")
end

function BobbyPinActionAnim:stop()
	ISBaseTimedAction.stop(self)
end

function BobbyPinActionAnim:perform()
	ISBaseTimedAction.perform(self)
end

function BobbyPinActionAnim:new(character)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.maxTime = 50000
	
	return o
end




