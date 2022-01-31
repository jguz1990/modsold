local old_ISPadlockAction_perform = ISPadlockAction.perform

function ISPadlockAction:perform()

	self.character:playSound("UnlockDoor")
	if self.thump:isDoor() and self.thump:getSprite():getProperties():Is("DoubleDoor") then
		if self.lock == false then
		
		else
	-- local paramIsoObject = self.thump	
    -- local i = getDoubleDoorIndex(self.thump);
    -- if (i == -1) then
		-- return false; 
	 -- end
    -- if (i == 1 or i == 4) then 
		-- --IsoObject = getDoubleDoorObject(paramIsoObject, (i == 1) ? 2 : 3);
		-- if i == 1 then local value =2 else local value = 3 end
		-- IsoObject = getDoubleDoorObject(paramIsoObject, value);
		-- if (instanceof(isoObject, IsoDoor)) then
			-- self.thump:setLockedByPadlock(true);
			-- self.thump:setKeyId(self.padlock:getKeyId());
		--end
		--end		
		end
	end
	--print("TEST-1")
	if self.lock == false then
		--print("TEST-2")
		if self.thump:isDoor() then
			self.thump:setLockedByPadlock(false);
			self.thump:setLockedByKey(false);
		end
    end
	
    old_ISPadlockAction_perform(self)
end