require "TimedActions/ISBaseTimedAction"

ISLieOnWO = ISBaseTimedAction:derive("ISLieOnWO");

function ISLieOnWO:isValid()
-- print("ISLieOnWO:isValid")
	local chrSqr = self.character:getSquare()
	local itemSqr = self.item:getSquare()
	if chrSqr:isWallTo(itemSqr) or chrSqr:isWindowTo(itemSqr) then
		self.character:Say(getText("IGUI_PlayerText_TRUEA_need_come_closer"))
		return false
	else
		if not self.item:getModData().trueAction then
			return true
		elseif self.item:getModData().trueAction.occupied then
			return false
		else
			return true
		end
	end
end

function ISLieOnWO:waitToStart()
	if self.side == "R" then
		if self.direction == "E" then
			self.character:facePosition(self.item:getSquare():getX(), self.item:getSquare():getY() + 10)
		elseif self.direction == "S" then
			self.character:facePosition(self.item:getSquare():getX() - 10, self.item:getSquare():getY())
		elseif self.direction == "W" then
			self.character:facePosition(self.item:getSquare():getX(), self.item:getSquare():getY() - 10)
		elseif self.direction == "N" then
			self.character:facePosition(self.item:getSquare():getX() + 10, self.item:getSquare():getY())
		end
	elseif self.side == "L" then
		if self.direction == "E" then
			self.character:facePosition(self.item:getSquare():getX(), self.item:getSquare():getY() - 10)
		elseif self.direction == "S" then
			self.character:facePosition(self.item:getSquare():getX() + 10, self.item:getSquare():getY())
		elseif self.direction == "W" then
			self.character:facePosition(self.item:getSquare():getX(), self.item:getSquare():getY() + 10)
		elseif self.direction == "N" then
			self.character:facePosition(self.item:getSquare():getX() - 10, self.item:getSquare():getY())
		end
	else
		self:forceStop()
	end
	self.character:setX(self.item:getSquare():getX() + self.deltaX)
	self.character:setY(self.item:getSquare():getY() + self.deltaY)
	if self.side == "L" then
		if self.direction == "S" or self.direction == "N" then
			self.character:setVariable("SitWOAnim", "OnBedReversoS"); 
		elseif self.direction == "E" or self.direction == "W" then
			self.character:setVariable("SitWOAnim", "OnBedReversoE"); 
		end
	elseif self.side == "R" then
		self.character:setVariable("SitWOAnim", "OnBed"); 
	else
		self:forceStop()
	end
	return self.character:shouldBeTurning()
end

function ISLieOnWO:update()
-- print("ISLieOnWO:update")
	-- if not self.character:shouldBeTurning() and playerObj:getCurrentState() == IdleState.instance() then
		-- -- self:forceComplete()
		-- return
	-- end
end

function ISLieOnWO:start()
	-- print("ISLieOnWO:start")
	forceDropHeavyItems(self.character)
	self.character:setPrimaryHandItem(nil)
	self.character:setSecondaryHandItem(nil)	
end

function ISLieOnWO:stop()
	-- print("ISLieOnWO:stop")
    ISBaseTimedAction.stop(self);
end

function ISLieOnWO:perform()
	-- print("ISLieOnWO:perform")
	
	self.character:setPrimaryHandItem(nil)
	-- self.character:setHideWeaponModel(true)
	self.character:setSecondaryHandItem(nil)
	
	-- self.character:setVariable("NoBite", true); 
	self.character:setNoClip(true)
	self.character:setBlockMovement(true)
	self.item:getModData().trueActions = {}
	self.item:getModData().trueActions.occupied = self.character
	if not self.character:getModData().trueActions then
		self.character:getModData().trueActions = {}
	end
	self.character:getModData().trueActions.on = self.item
	self.character:reportEvent("EventSitOnGround");
	self.character:setVariable("forceGetUp", false);
	
    -- needed to remove from queue / start next.
    ISBaseTimedAction.perform(self);
end

function ISLieOnWO:new(character, item, dirData)
	-- print("ISLieOnWO:new")
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.character = character;
    o.item = item;
    o.side = dirData.side;
    o.direction = dirData.dir;
	o.deltaX = dirData.x;
	o.deltaY = dirData.y;
	o.maxTime = 1;
    o.stopOnWalk = true;
    o.stopOnRun = true;
    return o;
end
