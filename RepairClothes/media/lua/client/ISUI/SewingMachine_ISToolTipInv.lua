local old_ISToolTipInv_render = ISToolTipInv.render

function ISToolTipInv:render()
	local data = self.item:getModData()
	
	if data and data.SewingMaterial then return false end
	
	old_ISToolTipInv_render(self)
end



local old_ISInventoryPaneContextMenu_doWearClothingTooltip = ISInventoryPaneContextMenu.doWearClothingTooltip

ISInventoryPaneContextMenu.doWearClothingTooltip = function(playerObj, newItem, currentItem, option)
	if newItem and newItem:getModData() then
		local data = newItem:getModData()
		
		if data and data.SewingMaterial then return false end
	end
	
	old_ISInventoryPaneContextMenu_doWearClothingTooltip(playerObj, newItem, currentItem, option)
end