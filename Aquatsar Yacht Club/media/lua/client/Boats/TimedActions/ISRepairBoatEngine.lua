--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISRepairBoatEngine = ISBaseTimedAction:derive("ISRepairBoatEngine")

function ISRepairBoatEngine:isValid()
--	return self.vehicle:isInArea(self.part:getArea(), self.character)
	return true;
end

function ISRepairBoatEngine:update()
	--self.character:faceThisObject(self.vehicle)
	self.item:setJobDelta(self:getJobDelta())

    self.character:setMetabolicTarget(Metabolics.MediumWork);
end

function ISRepairBoatEngine:start()
	self.item:setJobType(getText("IGUI_RepairEngine"))
	--self:setActionAnim("VehicleWorkOnMid")
end

function ISRepairBoatEngine:stop()
	self.item:setJobDelta(0)
	ISBaseTimedAction.stop(self)
end

function ISRepairBoatEngine:perform()
	ISBaseTimedAction.perform(self)
	self.item:setJobDelta(0)
	local skill = self.character:getPerkLevel(Perks.Mechanics) - self.vehicle:getScript():getEngineRepairLevel();
	local numberOfParts = self.character:getInventory():getNumberOfItem("EngineParts", false, true);
	local args = { vehicle = self.vehicle:getId(), condition = self.part:getCondition(), skillLevel = skill, numberOfParts = numberOfParts }
	args.giveXP = self.character:getMechanicsItem(self.part:getVehicle():getMechanicalID() .. "2") == nil
	sendClientCommand(self.character, 'vehicle', 'repairEngine', args)
--[[
	local skill = self.character:getPerkLevel(Perks.Mechanics) - self.vehicle:getScript():getEngineRepairLevel();
	local condPerPart = 1 + (skill/2);
	if condPerPart > 5 then condPerPart = 5; end
	local numberOfParts = self.character:getInventory():getNumberOfItem("EngineParts", false, true);
	local done = 0;
	for i=0,numberOfParts do
		self.part:setCondition(self.part:getCondition() + condPerPart);
		self.character:getInventory():RemoveOneOf("EngineParts");
		done = done + 1;
		if self.part:getCondition() >= 100 then
			self.part:setCondition(100);
			break;
		end
	end
	if isClient() then
		local args = { vehicle = self.vehicle:getId(), condition = self.part:getCondition() }
		sendClientCommand(self.character, 'vehicle', 'repairEngine', args)
	end
	if not self.character:getMechanicsItem(self.part:getVehicle():getMechanicalID() .. "2") then
		self.character:getXp():AddXP(Perks.Mechanics, done);
	end
--]]
	self.character:addMechanicsItem(self.part:getVehicle():getMechanicalID() .. "2", self.part, getGameTime():getCalender():getTimeInMillis());
end

function ISRepairBoatEngine:new(character, part, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.vehicle = part:getVehicle()
	o.part = part
	o.item = item
	o.maxTime = time
	o.jobType = getText("IGUI_RepairEngine")
	return o
end

