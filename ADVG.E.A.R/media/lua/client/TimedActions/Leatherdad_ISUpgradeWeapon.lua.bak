require "TimedActions/ISBaseTimedAction"

function ISUpgradeWeapon:isValid()
    if not self.character:getInventory():getItemFromType("Screwdriver")
	and not self.character:getInventory():getItemFromType("Multitool")
	then return false end
    if self.weapon:getWeaponPart(self.part:getPartType()) then return false end
    return self.character:getInventory():contains(self.part);
end