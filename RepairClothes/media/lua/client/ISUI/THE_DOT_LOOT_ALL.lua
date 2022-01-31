function ISInventoryPane:lootAll()
	local playerObj = getSpecificPlayer(self.player)
	local playerInv = getPlayerInventory(self.player).inventory
	local items = {}
	local it = self.inventory:getItems();
	local heavyItem = nil
	if luautils.walkToContainer(self.inventory, self.player) then
		for i = 0, it:size()-1 do
			local item = it:get(i);
			if isForceDropHeavyItem(item) then
				heavyItem = item
			elseif item:getType() == "autopsySkull" or item:getType() == "autopsySkullInfected" 
			or item:getType() == "token_Uninfected"  or item:getType() == "token_Infected" then
				--item = nil			
			else
				table.insert(items, item)
			end
		end
		if heavyItem and it:size() == 1 then
			ISInventoryPaneContextMenu.equipHeavyItem(playerObj, heavyItem)
			return
		end
		self:transferItemsByWeight(items, playerInv)
	end
	self.selected = {};
	getPlayerLoot(self.player).inventoryPane.selected = {};
	getPlayerInventory(self.player).inventoryPane.selected = {};
end