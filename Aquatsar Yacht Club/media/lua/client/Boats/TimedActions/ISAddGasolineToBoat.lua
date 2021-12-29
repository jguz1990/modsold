--***********************************************************
--**           THE INDIE STONE / edited iBrRus             **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISAddGasolineToBoat = ISBaseTimedAction:derive("ISAddGasolineToBoat")

function ISAddGasolineToBoat:isValid()
--	return self.vehicle:isInArea(self.part:getArea(), self.character)
	return true;
end

function ISAddGasolineToBoat:update()
	-- self.character:faceThisObject(self.vehicle)
	self.item:setJobDelta(self:getJobDelta())
	self.item:setJobType(getText("ContextMenu_VehicleAddGas"))
	local litres = self.tankStart + (self.tankTarget - self.tankStart) * self:getJobDelta()
	litres = math.floor(litres)
	if litres ~= self.amountSent then
		local args = { vehicle = self.vehicle:getId(), part = self.part:getId(), amount = litres }
		sendClientCommand(self.character, 'vehicle', 'setContainerContentAmount', args)
		self.amountSent = litres
	end
	local litresTaken = litres - self.tankStart
	local usedDelta = self.itemStart - litresTaken / Vehicles.JerryCanLitres
	self.item:setUsedDelta(usedDelta)

    self.character:setMetabolicTarget(Metabolics.HeavyDomestic);
end

function ISAddGasolineToBoat:start()
	self.tankStart = self.part:getContainerContentAmount()
	self.itemStart = self.item:getUsedDelta()
	local add = self.part:getContainerCapacity() - self.tankStart
	local take = math.min(add, self.itemStart * Vehicles.JerryCanLitres)
	self.tankTarget = self.tankStart + take
	self.itemTarget = self.itemStart - take / Vehicles.JerryCanLitres
	self.amountSent = self.tankStart

	self.action:setTime(take * 50)

	-- self:setActionAnim("refuelgascan")
	-- self:setOverrideHandModels(self.item:getStaticModel(), nil)
end

function ISAddGasolineToBoat:stop()
	self.item:setJobDelta(0)
	ISBaseTimedAction.stop(self)
end

function ISAddGasolineToBoat:perform()
	self.item:setJobDelta(0)
	self.item:setUsedDelta(self.itemTarget)
	local args = { vehicle = self.vehicle:getId(), part = self.part:getId(), amount = self.tankTarget }
	sendClientCommand(self.character, 'vehicle', 'setContainerContentAmount', args)
	if self.item:getUsedDelta() <= 0 then
		self.item:Use()
	end
	-- needed to remove from queue / start next.
	ISBaseTimedAction.perform(self)
end

function ISAddGasolineToBoat:new(character, part, item, time)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character
	o.vehicle = part:getVehicle()
	o.part = part
	o.item = item
	o.maxTime = time
	return o
end

