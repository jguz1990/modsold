require "TimedActions/ISBaseTimedAction"

EmptyAction = ISBaseTimedAction:derive("EmptyAction")

function EmptyAction:isValid()
	return true
end

function EmptyAction:update()
end

function EmptyAction:start()
end

function EmptyAction:stop()
	ISBaseTimedAction.stop(self)
end

function EmptyAction:perform()
    self.func(self.arg1, self.arg2, self.arg3, self.arg4)
	ISBaseTimedAction.perform(self)
end

function EmptyAction:new(character, func, arg1, arg2, arg3, arg4)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
    o.maxTime = 1
    
    o.func = func
    o.arg1 = arg1
    o.arg2 = arg2
    o.arg3 = arg3
    o.arg4 = arg4
    
	return o
end




