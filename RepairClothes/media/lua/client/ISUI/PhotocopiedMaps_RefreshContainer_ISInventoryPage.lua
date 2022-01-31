require "ISUI/ISPanel"
require "ISUI/ISButton"
require "ISUI/ISInventoryPane"
require "ISUI/ISResizeWidget"
require "ISUI/ISMouseDrag"
require "ISUI/ISLayoutManager"

require "Definitions/ContainerButtonIcons"

require "defines"


require "ISUI/ISInventoryPage"

local old_maps_ISInventoryPane_refreshContainer = ISInventoryPane.refreshContainer


function ISInventoryPane:refreshContainer()

    local it = self.inventory:getItems();
    for i = 0, it:size()-1 do
        local item = it:get(i);
		if item and item:getModData().copiedMap and not item:getMap() then
			print("Copied Map Re-mapped")
			item:setMap(item:getModData().copiedMap)	
		end
		
	end

	old_maps_ISInventoryPane_refreshContainer(self)
	
end