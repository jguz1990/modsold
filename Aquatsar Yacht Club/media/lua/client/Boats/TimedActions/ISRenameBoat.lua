--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISRenameBoat = ISBaseTimedAction:derive("ISRenameBoat")

function ISRenameBoat:isValid()
	return true
end

function ISRenameBoat:update()
	--self.character:faceThisObject(self.vehicle)
	self.item:setJobDelta(self:getJobDelta())
    self.character:setMetabolicTarget(Metabolics.MediumWork);
end

function ISRenameBoat:start()
	self.item:setJobType(getText("IGUI_Install"))

	for _, j in pairs(self.part:getTable("install")["items"]) do 
		local item = self.character:getInventory():getItemFromType(j["type"])
		-- print(item)
		if item then
			if item:IsDrainable() then
				-- print(item:getUseDelta())
				item:Use()
			end
		else 
			self:forceStop();
		end
	end
	
	-- item:setUsedDelta(item:getUseDelta())
	-- if self.part:getWheelIndex() ~= -1 or self.part:getId():contains("Brake") then
		-- self:setActionAnim("VehicleWorkOnTire")
	-- else
		-- self:setActionAnim("VehicleWorkOnMid")
	-- end
--	self:setOverrideHandModels(nil, nil)
end

function ISRenameBoat:stop()
	self.item:setJobDelta(0)
	ISBaseTimedAction.stop(self)
end

function ISRenameBoat:perform()
	self.item:setJobDelta(0)
	
--	self.character:addMechanicsItem(self.item:getID() .. self.vehicle:getMechanicalID() .. "1", getGameTime():getCalender():getTimeInMillis());

	-- self.character:removeFromHands(self.item)
	-- self.character:getInventory():DoRemoveItem(self.item)

	local perksTable = VehicleUtils.getPerksTableForChr(self.part:getTable("install").skills, self.character)
	local args = { vehicle = self.vehicle:getId(), part = self.part:getId(),
					item = self.item,
					perks = perksTable,
					mechanicSkill = self.character:getPerkLevel(Perks.Mechanics) }
	sendClientCommand(self.character, 'vehicle', 'installPart', args)

	local pdata = getPlayerData(self.character:getPlayerNum());
	if pdata ~= nil then
		pdata.playerInventory:refreshBackpacks();
		pdata.lootInventory:refreshBackpacks();
	end
	-- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self)
end

function ISRenameBoat:new(character, part, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.vehicle = part:getVehicle()
	o.part = part
	o.item = item
	o.maxTime = time - (character:getPerkLevel(Perks.Mechanics) * (time/15));
	if character:isTimedActionInstant() then
		o.maxTime = 1;
	end
	if ISVehicleMechanics.cheat then o.maxTime = 1; end
	o.jobType = getText("Tooltip_Vehicle_Installing", item:getDisplayName());
	return o
end

