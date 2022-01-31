-- Timer ---------------------------------------------------------------------------
-- Enables use of real world seconds to time certain behavior. 

timer = {}
timer.__index = timer
function timer:new(limit, startWith) 
	o = {}
	setmetatable(o, timer)
	if startWith then
		o.clock = limit
	else
		o.clock = 0
	end
	o.limit = limit
	return o
end

function timer:tick() 
	local elapsedSec = getGameTime():getRealworldSecondsSinceLastUpdate()
	self.clock = self.clock + elapsedSec 

	if self.limit <= self.clock then
		self.clock = self.clock % self.limit
		return true;
	end 
	return false
end
