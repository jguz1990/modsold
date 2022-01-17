require "TimedActions/ISBaseTimedAction"

function ISRemoveWeaponUpgrade:isValid()
    if not self.character:getInventory():getItemFromType("Screwdriver") 
	and not self.character:getInventory():getItemFromType("Multitool") 
	then return false end
    if not self.character:getInventory():contains(self.weapon) then return false end
    return self.weapon:getWeaponPart(self.part:getPartType()) == self.part
end
