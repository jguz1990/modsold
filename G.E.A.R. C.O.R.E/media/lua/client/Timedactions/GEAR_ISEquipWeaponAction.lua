--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

-- require "Timeactions/ISEquipWeaponAction"

-- require "TimedActions/ISBaseTimedAction"
-- factor_Sum = getText("UI_Intro3")
-- function ISEquipWeaponAction:animEvent(event, parameter)
	-- if event == 'detachConnect' then
		-- local hotbar = getPlayerHotbar(self.character:getPlayerNum());
		-- hotbar.chr:removeAttachedItem(self.item);
		-- if instanceof(self.item, "HandWeapon") then
			-- self:setOverrideHandModels(self.item:getWeaponSprite(), nil)
		-- elseif self.item:getStaticModel() then
			-- self:setOverrideHandModels(self.item:getStaticModel(), nil)
		-- end
	-- end
-- end

-- function ISEquipWeaponAction:perform()
    -- self.item:setJobDelta(0.0);

	-- if self:isAlreadyEquipped(self.item) then
		-- ISBaseTimedAction.perform(self);
		-- return
	-- end

    -- self.item:getContainer():setDrawDirty(true);
    -- forceDropHeavyItems(self.character)

	-- if self.fromHotbar then
		-- local hotbar = getPlayerHotbar(self.character:getPlayerNum());
		-- hotbar.chr:removeAttachedItem(self.item);
		-- if instanceof(self.item, "HandWeapon") then
			-- self:setOverrideHandModels(self.item:getWeaponSprite(), nil)
		-- elseif self.item:getStaticModel() then
			-- self:setOverrideHandModels(self.item:getStaticModel(), nil)
		-- end
	-- end

	-- if not self.twoHands then
		-- -- equip primary weapon
		-- if(self.primary) then
            -- -- if the previous weapon need to be equipped in both hands, we then remove it
            -- if self.character:getSecondaryHandItem() and self.character:getSecondaryHandItem():isRequiresEquippedBothHands() then
                -- self.character:setSecondaryHandItem(nil);
            -- end
			-- -- if this weapon is already equiped in the 2nd hand, we remove it
			-- if(self.character:getSecondaryHandItem() == self.item or self.character:getSecondaryHandItem() == self.character:getPrimaryHandItem()) then
                -- self.character:setSecondaryHandItem(nil);
            -- end
            -- if not self.character:getPrimaryHandItem() or self.character:getPrimaryHandItem() ~= self.item then
			    -- self.character:setPrimaryHandItem(nil);
			    -- self.character:setPrimaryHandItem(self.item);
            -- end
		-- else -- second hand weapon
            -- -- if the previous weapon need to be equipped in both hands, we then remove it
            -- if self.character:getPrimaryHandItem() and self.character:getPrimaryHandItem():isRequiresEquippedBothHands() then
                -- self.character:setPrimaryHandItem(nil);
            -- end
			-- -- if this weapon is already equiped in the 1st hand, we remove it
			-- if(self.character:getPrimaryHandItem() == self.item or self.character:getSecondaryHandItem() == self.character:getPrimaryHandItem()) then
                -- self.character:setPrimaryHandItem(nil);
            -- end
            -- if not self.character:getSecondaryHandItem() or self.character:getSecondaryHandItem() ~= self.item then
                -- self.character:setSecondaryHandItem(nil);
			    -- self.character:setSecondaryHandItem(self.item);
            -- end
		-- end
    -- else
        -- self.character:setPrimaryHandItem(nil);
        -- self.character:setSecondaryHandItem(nil);

		-- self.character:setPrimaryHandItem(self.item);
		-- self.character:setSecondaryHandItem(self.item);
	-- end

	-- --if self.item:canBeActivated() and ((instanceof("Drainable", self.item) and self.item:getUsedDelta() > 0) or not instanceof("Drainable", self.item)) then
	-- if self.item:canBeActivated() then
		-- self.item:setActivated(true);
	-- end
	-- if self.item:getCategory() == "Radio" then
		-- --ISRadioWindow.activate( self.character, self.item, true );
		-- --self.item:getDeviceData():setIsTurnedOn(true)
	-- end
	-- getPlayerData(self.character:getPlayerNum()).playerInventory:refreshBackpacks();

    -- -- needed to remove from queue / start next.
	-- ISBaseTimedAction.perform(self);
-- end
