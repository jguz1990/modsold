
function Compass_context2 (player, context, items)
	-- print("TESTING!!!!!!!!!!!!!!!!!!!!!!!!")

	local itemsCraft = {};
    local c = 0;
	local compass = nil

    local playerObj = getSpecificPlayer(player)

	ISInventoryPaneContextMenu.removeToolTip();

	getCell():setDrag(nil, player);

    local containerList = ISInventoryPaneContextMenu.getContainers(playerObj)
    local testItem = nil;
    local editItem = nil;
    for i,v in ipairs(items) do
        testItem = v;
		
        if not instanceof(v, "InventoryItem") then
            --print(#v.items);
            if #v.items == 2 then
                -- editItem = v.items[1];
            end
            testItem = v.items[1];
        else
            -- editItem = v
        end
		if ( testItem:getType():contains("Compass")  ) then
			-- print("Compass!")
			compass = testItem
		end
        c = c + 1;
    end

    --triggerEvent("OnPreFillInventoryObjectContextMenu", player, context, items);

    context.blinkOption = ISInventoryPaneContextMenu.blinkOption;




    if c == 0 then
        return;
    end

	if compass and compass:isEquipped() then
		local text = "Compass"
		--local direction = tostring(IsoDirections.fromAngle(getPlayer():getAngle()))
		--local direction = tostring((getPlayer():getAngle()))
			local direction = playerObj:getDirectionAngle()
			local directionText = nil
			if direction <= -157.5 then
				directionText = "West"				
			elseif direction > -157.5 and direction  <= -112.5 then
				directionText = "North West"			
			elseif direction > -112.5 and direction  <= -67.5 then
				directionText = "North"		
			elseif direction > -67.5 and direction  <= -22.5 then
				directionText = "North East"	
			elseif direction > -22.5 and direction  <= 22.5 then
				directionText = "East"
			elseif direction > 22.5 and direction  <= 67.5 then
				directionText = "South East"
			elseif direction > 67.5 and direction  <= 112.5 then
				directionText = "South"
			elseif direction > 112.5 and direction  <= 157.5 then
				directionText = "Sout West"
			elseif direction > 157.5 then
				directionText = "West"
			end
			  -- N  = "North",
          -- NE = "North East",
          -- NW = "North West",
          -- S  = "South",
          -- SW = "South West",
          -- SE = "South East",
          -- W  = "West",
          -- E  = "East"
       -- text = directions[direction] or "ERROR"
        text = directionText
		
		
		context:addOption(getText("Bearing: " .. text))-- , items, ISInventoryPaneContextMenu.onWearItems, player);
		text = nil
    end

	
end




