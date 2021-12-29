BBSleepKey = "sleepin"; -- any item containing this string in the codename can be slept in/on


BBRestKey = BBSleepKey; --"restin"; 

require 'Camping/camping'
require "TimedActions/ISBaseTimedAction"
BBSleep = {};

BBSleep.doMenu = function(player, context, items)
	
	for i,v in ipairs(items) do
		local tempitem = v;
        if not instanceof(v, "InventoryItem") then
            tempitem = v.items[1];
        end
		if(getSpecificPlayer(player):getInventory():contains(tempitem) == false) then
			if (tempitem:getType().find(tempitem:getType(),BBSleepKey) ~= nil) then
				context:addOption(getText("ContextMenu_Sleep"), worldobjects, BBSleep.onSleep, player, sleep);
			end
			if (tempitem:getType().find(tempitem:getType(),BBRestKey) ~= nil) then
				context:addOption(getText("ContextMenu_Rest"), worldobjects, BBSleep.onRest, player, sleep);
			end
		end
	end
	
	
end


BBSleep.onRest = function(item, player)
	local playerObj = getSpecificPlayer(player)
	ISTimedActionQueue.clear(playerObj)
	ISTimedActionQueue.add(ISRestAction:new(playerObj));
end

BBSleep.onSleep = function(item, player)
	local playerObj = getSpecificPlayer(player)
	ISTimedActionQueue.clear(playerObj)
	ISWorldObjectContextMenu.onSleepWalkToComplete(player)
end



Events.OnFillInventoryObjectContextMenu.Add(BBSleep.doMenu);