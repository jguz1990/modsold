require "TimedActions/ISBaseTimedAction"

function ISInventoryTransferAction:new (character, item, srcContainer, destContainer, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.item = item;
	o.srcContainer = srcContainer;
	o.destContainer = destContainer;
	-- handle people right click the same item while eating it
	if not srcContainer or not destContainer then
		o.maxTime = 0;
		return o;
	end
--	o.stopOnWalk = ((not o.destContainer:isInCharacterInventory(o.character)) or (not o.srcContainer:isInCharacterInventory(o.character))) and (o.destContainer:getType() ~= "floor");
--	o.stopOnRun = o.destContainer:getType() ~= "floor";
	o.stopOnWalk = not o.destContainer:isInCharacterInventory(o.character) or (not o.srcContainer:isInCharacterInventory(o.character))
	if (o.srcContainer == character:getInventory()) and (o.destContainer:getType() == "floor") then
		o.stopOnWalk = false
	end
	o.stopOnRun = true;
    if destContainer:getType() ~= "TradeUI" and srcContainer:getType() ~= "TradeUI" then
        o.maxTime = 0;
        -- increase time for bigger objects or when backpack is more full.
        local destCapacityDelta = 1.0;

        if o.srcContainer == o.character:getInventory() then
            if o.destContainer:isInCharacterInventory(o.character) then
           --     self.item:setJobType("Packing");
                destCapacityDelta = o.destContainer:getCapacityWeight() / o.destContainer:getMaxWeight();
            else
             --   self.item:setJobType("Putting in container");
                o.maxTime = 0;
            end

        elseif not o.srcContainer:isInCharacterInventory(o.character) then
            if o.destContainer:isInCharacterInventory(o.character) then
             --   self.item:setJobType("Taking from container");
                o.maxTime = 0;
            end
        end

        if destCapacityDelta < 0.4 then
            destCapacityDelta = 0.4;
        end

        local w = item:getActualWeight();
        if w > 3 then w = 3; end;
        o.maxTime = o.maxTime * (w) * destCapacityDelta;

        if getCore():getGameMode()=="LastStand" then
            o.maxTime = o.maxTime * 0;
        end

        if o.destContainer:getType()=="floor" then
			if o.srcContainer == o.character:getInventory() then
				o.maxTime = o.maxTime * 0;
			elseif o.srcContainer:isInCharacterInventory(o.character) then
				-- Unpack -> drop
			else
				o.maxTime = o.maxTime * 0;
			end
		end

		if character:HasTrait("Dextrous") then
			o.maxTime = o.maxTime * 0
		end
		if character:HasTrait("AllThumbs") then
			o.maxTime = o.maxTime * 2.0
		end
    else
        o.maxTime = 0;
    end
    if time then
        o.maxTime = time;
    end
	if character:isTimedActionInstant() then
		o.maxTime = 0;
	end

    if item:isFavorite() and not o.destContainer:isInCharacterInventory(o.character) then o.maxTime = 0; end

	o.queueList = {};
	local queuedItem = {items = {o.item}, time = o.maxTime, type = o.item:getFullType()};
	table.insert(o.queueList, queuedItem);
	o.loopedAction = true

    return o
end

-- local old_fn = ISInventoryTransferAction.new;
-- function ISInventoryTransferAction:new(...)
--	local o = old_fn(self, ...);
--	if character:HasTrait("Dextrous") then
--		o.maxTime = o.maxTime * 0.01
--	end
--	if character:HasTrait("AllThumbs") then
--		o.maxTime = o.maxTime * 2.0
--	end
--	return o;
--  end