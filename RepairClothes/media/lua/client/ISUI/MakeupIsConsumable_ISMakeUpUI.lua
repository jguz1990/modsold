require "ISUI/ISCollapsableWindowJoypad"
require "ISUI/ISMakeUp"


function ISMakeUpUI:onSelectMakeUp()
	-- add previous makeup if we had one at this location
	if self.previousMakeUp then
		self.character:setWornItem(self.previousMakeUp:getBodyLocation(), self.previousMakeUp);
		self.needsUpdateAvatar = true;
	end
	print(tostring(self.item) .. " - " .. tostring(self.item:getUsedDelta()))
	if self.item:getUsedDelta() == 0 then return false end
	self.add.enable = false;
	-- remove previous makeup
	if self.makeUpSelected then
		self.character:removeWornItem(self.makeUpSelected);
		self.needsUpdateAvatar = true;
		self.makeUpSelected = nil;
	end
	local selected = self.comboMakeup.options[self.comboMakeup.selected].data;
	if not selected then
		return;
	end
	local makeup = InventoryItemFactory.CreateItem(selected.item)
	-- backup previous makeup at this location in case we close
	self.previousMakeUp = self.character:getWornItem(makeup:getBodyLocation());
	self.character:setWornItem(makeup:getBodyLocation(), makeup);
	self.makeUpSelected = makeup;
	self.add.enable = true;
	self.needsUpdateAvatar = true;
end


function ISMakeUpUI:onApplyMakeUp()
	--print(tostring(self.item) .. " - " .. tostring(self.item:getUsedDelta()))
	if self.item:getUsedDelta() == 0 then return false end
	self.item:setJobDelta(0.0)
	self.item:Use()
	self.add.enable = false;
	self.character:getInventory():AddItem(self.makeUpSelected);
	if self.previousMakeUp then
		self.character:getInventory():Remove(self.previousMakeUp);
	end
	self.previousMakeUp = nil;
	self.makeUpSelected = nil;

	self:reinitCombos();
end