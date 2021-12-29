--***********************************************************
--**            ROBERT JOHNSON / edited iBrRus             **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISTakeWaterActionFromBoat = ISBaseTimedAction:derive("ISTakeWaterActionFromBoat");

function ISTakeWaterActionFromBoat:isValid()
	-- If the player is very thirsty, the destination item may get drained while filling it.
	-- When drained, the item may turn into another "empty" item, removing the item we're filling
	-- from it's container.
    if self.oldItem ~= nil then
        if self.oldItem and not self.oldItem:getContainer() then return false end
        return self.waterObject:hasWater()
    end
	if self.item and not self.item:getContainer() then return false end
	return self.waterObject:hasWater()
end

-- function ISTakeWaterActionFromBoat:waitToStart()
    -- if self.waterObject then
        -- self.character:faceThisObject(self.waterObject)
    -- end
    -- return self.character:shouldBeTurning()
-- end

function ISTakeWaterActionFromBoat:update()
    if self.item ~= nil then
        self.item:setJobDelta(self:getJobDelta());
        self.item:setUsedDelta(self.startUsedDelta + (self.endUsedDelta - self.startUsedDelta) * self:getJobDelta());
    end
    -- if self.waterObject then
        -- self.character:faceThisObject(self.waterObject);
    -- end
end

function ISTakeWaterActionFromBoat:start()
    local waterAvailable = self.waterObject:getWaterAmount()
	self.character:getEmitter():playSound("ScoopUpWater")
    if self.oldItem ~= nil then
        self.character:getInventory():AddItem(self.item);
        if self.character:isPrimaryHandItem(self.oldItem) then
            self.character:setPrimaryHandItem(self.item);
        end
        if self.character:isSecondaryHandItem(self.oldItem) then
            self.character:setSecondaryHandItem(self.item);
        end
        self.character:getInventory():Remove(self.oldItem);
        self.oldItem = nil
    end
    self.item = self.item;
    if self.item ~= nil then
		self.item:setBeingFilled(true)
	    self.item:setJobType(getText("ContextMenu_Fill") .. self.item:getName());
	    self.item:setJobDelta(0.0);
        -- if instanceof(self.waterObject, "IsoThumpable") then -- play the drink sound for rain barrel
		self.character:playSound("ScoopUpWater");
--            getSoundManager():PlayWorldSoundWav("PZ_GetWater", self.character:getCurrentSquare(), 0, 2, 0.8, true);
        -- else
            -- self.character:playSound("GetWaterFromTap");
--            getSoundManager():PlayWorldSoundWav("PZ_Drinking", self.character:getCurrentSquare(), 0, 2, 0.8, true);
        -- end
		local destCapacity = (1 - self.item:getUsedDelta()) / self.item:getUseDelta()
		self.waterUnit = math.min(math.ceil(destCapacity - 0.001), waterAvailable)
		self.startUsedDelta = self.item:getUsedDelta()
		self.endUsedDelta = math.min(self.item:getUsedDelta() + self.waterUnit * self.item:getUseDelta(), 1.0)
		self.action:setTime((self.waterUnit * 10) + 30)
	
		-- self:setAnimVariable("FoodType", self.item:getEatType());
		-- self:setActionAnim("fill_container_tap");
		-- if not self.item:getEatType() then
			-- self:setOverrideHandModels(nil, self.item:getStaticModel())
		-- else
			-- self:setOverrideHandModels(self.item:getStaticModel(), nil)
		-- end
    else
        -- if instanceof(self.waterObject, "IsoThumpable") then -- play the drink sound for rain barrel
            self.character:playSound("DrinkingFromBottle");
--            getSoundManager():PlayWorldSoundWav("PZ_DrinkingFromBottle", self.character:getCurrentSquare(), 0, 2, 0.8, true);
        -- else
            -- self.character:playSound("DrinkingFromTap");
--            getSoundManager():PlayWorldSound("PZ_DrinkingFromTap", self.character:getCurrentSquare(), 0, 2, 0.8, true);
        -- end
		local thirst = self.character:getStats():getThirst()
		local waterNeeded = math.min(math.ceil(thirst / 0.1), 10)
		self.waterUnit = math.min(waterNeeded, waterAvailable)
		self.action:setTime((self.waterUnit * 10) + 15)
	
		-- self:setActionAnim("drink_tap")
		-- self:setOverrideHandModels(nil, nil)
    end
end

function ISTakeWaterActionFromBoat:stop()
    local used = self:getJobDelta() * self.waterUnit
    if used >= 1 then
		local obj = self.waterObject
		local args = {x=obj:getX(), y=obj:getY(), z=obj:getZ(), units=used}
		sendClientCommand(self.character, 'object', 'takeWater', args)
	end
    ISBaseTimedAction.stop(self);
    if self.item ~= nil then
		self.item:setBeingFilled(false)
        self.item:setJobDelta(0.0);
        if self.waterObject:isTaintedWater() then
            self.item:setTaintedWater(true);
        end
    end
end

function ISTakeWaterActionFromBoat:perform()

    if self.item ~= nil then
        self.item:setBeingFilled(false)
        self.item:getContainer():setDrawDirty(true);
        self.item:setJobDelta(0.0);
        if self.waterObject:isTaintedWater() then
            self.item:setTaintedWater(true);
        end
    --Without this setUsedDelta call, the final tick never goes through.
    -- the item's UsedDelta value is set at like .99
    --This means that the option to fill that container never goes away.
    --		if self.item:getUsedDelta() > 0.91 then
    --			self.item:setUsedDelta(1.0);
    --		end
    else
        local thirst = self.character:getStats():getThirst() - (self.waterUnit / 10)
        self.character:getStats():setThirst(math.max(thirst, 0.0));
        if self.waterObject:isTaintedWater() then
            self.character:getBodyDamage():setPoisonLevel(self.character:getBodyDamage():getPoisonLevel() + self.waterUnit);
        end
    end

    local obj = self.waterObject
    local args = {x=obj:getX(), y=obj:getY(), z=obj:getZ(), units=self.waterUnit}
    sendClientCommand(self.character, 'object', 'takeWater', args)
    -- needed to remove from queue / start next.
    ISBaseTimedAction.perform(self);
    end

function ISTakeWaterActionFromBoat:new (character, item, waterUnit, waterObject, time, oldItem)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
    o.oldItem = oldItem;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 10 -- will set this in start()
	o.waterUnit = waterUnit; -- will set this in start()
	o.waterObject = waterObject;
	return o
end
