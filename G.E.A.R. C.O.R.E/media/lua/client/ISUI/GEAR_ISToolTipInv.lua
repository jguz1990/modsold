--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "ISUI/ISToolTipInv"


local old_ISToolTipInv_render = ISToolTipInv.render



function ISToolTipInv:render()

	local item = self.item
	local player = getPlayer()

	if item
	and instanceof( item, "Clothing")
	and item:getBodyLocation()
	and  player:getWornItem(item:getBodyLocation())
	and instanceof(  player:getWornItem(item:getBodyLocation()), "InventoryContainer")
	then
		return false 
	end
	-- if item
	-- and instanceof( item, "InventoryContainer")
	-- and item:getBodyLocation()
	-- and  player:getWornItem(item:getBodyLocation())
	-- and instanceof(  player:getWornItem(item:getBodyLocation()), "Clothing")
	-- and player:getWornItem(item:getBodyLocation()):getType()
	-- and player:getWornItem(item:getBodyLocation()):getType() ~= "Container"
	-- then
		-- print("Type " .. tostring(player:getWornItem(item:getBodyLocation()):getType()))
		-- return false 
	-- end
	old_ISToolTipInv_render(self)

end
