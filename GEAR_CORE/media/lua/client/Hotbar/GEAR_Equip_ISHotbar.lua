require "ISUI/ISPanelJoypad"

function ISHotbar:activateSlot(slotIndex)
	local item = self.attachedItems[slotIndex]
	if not item then return end
	if item:getAttachedSlot() ~= slotIndex then
		error "item:getAttachedSlot() ~= slotIndex"
	end
	
	------ G.E.A.R. CLOTHING EQUIP -----------------\\
	if item:getCategory() == "Clothing" then
		if item:isEquipped() then
			ISTimedActionQueue.add(ISUnequipAction:new(self.chr, item, 50))
		else
			ISTimedActionQueue.add(ISWearClothing:new(self.chr, item, 50))
		end
		return
	end
	-----------------------------------------------//

	------ G.E.A.R. EAT FOOD -----------------------\\
	if item:IsFood() and item:getHungerChange() < 0 then
		if self.chr:getMoodles():getMoodleLevel(MoodleType.FoodEaten) < 3 or self.chr:getNutrition():getCalories() < 1000 then
			ISTimedActionQueue.add(ISEatFoodAction:new(self.chr, item, 0.25));
			return
		end
	end
	------------------------------------------------//


	if item:canBeActivated() then
		item:setActivated(not item:isActivated())
		return
	end
	self:equipItem(item)
end
