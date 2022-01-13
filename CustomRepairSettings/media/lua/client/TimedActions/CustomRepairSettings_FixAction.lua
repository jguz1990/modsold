function ISFixAction:perform()
	if self.item:getContainer() then
		self.item:getContainer():setDrawDirty(true);
	end
	self.item:setJobDelta(0.0);

	if ScriptManager.instance:FindItem(self.item:getFullType()):getDisplayCategory() == "VehicleMaintenance" then
		if SandboxVars.CustomRepairSettings.MaxCondPotentialRepairMechanics == 1 then
			FixingManager.fixItem(self.item, self.character, self.fixing, self.fixer);
		else
			local conditionBefore = self.item:getCondition();
			local conditionPercentRepaired = FixingManager.getCondRepaired(self.item, self.character, self.fixing, self.fixer);
			FixingManager.fixItem(self.item, self.character, self.fixing, self.fixer);
			local conditionAfter = self.item:getCondition();
			if conditionAfter > conditionBefore then
				local conditionMax = self.item:getConditionMax();
				local conditionRepaired = Math.round(conditionMax * (conditionPercentRepaired / 100));
				if conditionRepaired < 1.0 then
					conditionRepaired = 1.0;
				end
				local conditionNew = conditionBefore + conditionRepaired;
				if conditionNew <= conditionMax then
					self.item:setCondition(math.floor(conditionNew + 0.5));
				else
					self.item:setCondition(math.floor(conditionMax + 0.5));
				end
			end
		end
		if SandboxVars.CustomRepairSettings.NoPenaltiesMechanics then
			self.item:setHaveBeenRepaired(1);
		end
	else
		if SandboxVars.CustomRepairSettings.MaxCondPotentialRepairOther == 1 then
			FixingManager.fixItem(self.item, self.character, self.fixing, self.fixer);
		else
			local conditionBefore = self.item:getCondition();
			local conditionPercentRepaired = FixingManager.getCondRepaired(self.item, self.character, self.fixing, self.fixer);
			FixingManager.fixItem(self.item, self.character, self.fixing, self.fixer);
			local conditionAfter = self.item:getCondition();
			if conditionAfter > conditionBefore then
				local conditionMax = self.item:getConditionMax();
				local conditionRepaired = Math.round(conditionMax * (conditionPercentRepaired / 100));
				if conditionRepaired < 1.0 then
					conditionRepaired = 1.0;
				end
				local conditionNew = conditionBefore + conditionRepaired;
				if conditionNew <= conditionMax then
					self.item:setCondition(math.floor(conditionNew + 0.5));
				else
					self.item:setCondition(math.floor(conditionMax + 0.5));
				end
			end
		end
		if SandboxVars.CustomRepairSettings.NoPenaltiesOther then
			self.item:setHaveBeenRepaired(1);
		end
	end

	if self.vehiclePart then
		local part = self.vehiclePart
		if isClient() then
			-- The server should call FixingManager.fixItem() but doesn't have all the info it needs.
			local args = { vehicle = part:getVehicle():getId(), part = part:getId(),
				condition = self.item:getCondition(), haveBeenRepaired = self.item:getHaveBeenRepaired() }
			sendClientCommand(self.character, 'vehicle', 'fixPart', args)
		else
			part:setCondition(self.item:getCondition())
			part:doInventoryItemStats(self.item, part:getMechanicSkillInstaller())
			if part:isContainer() and not part:getItemContainer() then
				-- Changing condition might change capacity.
				-- This limits content amount to max capacity.
				part:setContainerContentAmount(part:getContainerContentAmount())
			end
			part:getVehicle():updatePartStats()
			part:getVehicle():updateBulletStats()
		end
	end
	-- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self);
end
