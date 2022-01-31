--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

function ISAddItemInRecipe:perform()
    -- needed to remove from queue / start next.
    ISBaseTimedAction.perform(self);
    
    self.baseItem:setJobDelta(0.0);
    self.character:removeFromHands(self.baseItem)

    self.baseItem = self.recipe:addItem(self.baseItem, self.usedItem, self.character);
    
    ISAddItemInRecipe.checkName(self.baseItem, self.recipe);
	
	if self.usedItem:getOnEat() == "InfectedFlesh" then
		self.baseItem:setOnEat("InfectedFlesh")
	end
	
	if self.usedItem:getType() == "HumanFlesh" or self.usedItem:getType() == "InfectedHumanFlesh" then
		self.baseItem:setStressChange(self.baseItem:getStressChange() + 0.1667)
		self.baseItem:setUnhappyChange(self.baseItem:getUnhappyChange() + 16.67)
	end
	
	if self.usedItem:getType() == "ZombieFlesh" then
		self.baseItem:setStressChange(self.baseItem:getStressChange() + 0.5)
		self.baseItem:setUnhappyChange(self.baseItem:getUnhappyChange() + 50)
	end
	
end