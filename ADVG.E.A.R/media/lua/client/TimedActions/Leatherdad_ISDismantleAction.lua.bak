
function ISDismantleAction:isValid()
	return (self.character:getInventory():contains("Saw") or self.character:getInventory():contains("GardenSaw")) and
			(self.character:getInventory():contains("Screwdriver") or self.character:getInventory():contains("Screwdriver"))
			and
			self.thumpable:getObjectIndex() ~= -1
end
