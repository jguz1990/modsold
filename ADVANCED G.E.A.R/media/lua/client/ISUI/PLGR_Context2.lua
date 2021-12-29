

function PLGR_context2 (player, context, items)
	--print("TESTING!!!!!!!!!!!!!!!!!!!!!!!!")

	local itemsCraft = {};
    local c = 0;
	local PLGR = nil
	local GPS = nil
	local waypoint = nil
	local canWaypoint = nil
	local Beacon = nil

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
		local modData = testItem:getModData()
		print("Test Item: " .. tostring(testItem:getType()))
		print("Test Item: " .. tostring(modData.ReceiveGPS))
		--if testItem:getType()=="PLGR" and testItem:isActivated() and testItem:getUsedDelta() > 0 then
		if modData.ReceiveGPS 
		and testItem:isActivated()
		--and testItem:getUsedDelta() > 0
		then
			print("Recieves GPS")
			PLGR = testItem
			GPS = testItem
		end
		if (  modData.WayPoint )and testItem:isActivated() 
		--and testItem:getUsedDelta() > 0 
		then
			print("Beacon!")
			--local modData = testItem:getModData()
			if modData.beaconLock then
				print("Beacon Has Data")
				waypoint = modData 
			end
		end
		if (  modData.WayPoint )and testItem:isActivated()
--		and testItem:getUsedDelta() > 0 
	then
			print("Beacon!")
			--local modData = testItem:getModData()
			if not modData.beaconLock then
				print("Beacon Can Input Data")
				canWaypoint = testItem 
			end
		end

        c = c + 1;
    end

    context.blinkOption = ISInventoryPaneContextMenu.blinkOption;




    if c == 0 then
        return;
    end
    

	--if PLGR then
	if GPS then
		local x = math.floor(playerObj:getX())
		local y = math.floor(playerObj:getY())
		local text = ("Coordinates: X: " .. tostring(x) .. ", Y: " .. tostring(y))
		-- local c = 0
		-- local text2 = {}
		-- for i=0, text:len()-1 do		
			-- if ZombRand(0,19) == 0 then
				-- local distort = string.char(ZombRand(0,127))
				-- if c == 0 then
					-- c = 1
					-- --text2[c]= replaceChar(i, text, distort)
					-- text2[1]= replaceChar(i, text, distort)
				-- else
					-- c = c + 1
					-- --text2[c]= replaceChar(i, text2[c-1], distort)
					-- text2[1]= replaceChar(i, text2[1], distort)
				-- end
			-- end	
		-- end
		-- if c > 0 then
			-- context:addOption(getText(text2[1]))
		-- else
		
		context:addOption(getText(distortText(text)))
		-- end
		--text = nil
		--text2 = nil
    end
	if waypoint then
		local x = math.abs(playerObj:getX()-waypoint.beaconLock_X)
		local y = math.abs(playerObj:getY()-waypoint.beaconLock_Y)
			local distance = ((x*x) + (y*y) )
			distance = math.floor(math.sqrt(distance))
		local kilos = false
		local kdistance = nil
		if distance > 1000 then			
			kilos = true
			kdistance = ((math.floor(distance/100)))
			kdistance = kdistance/10
		elseif distance > 100 then
			distance = ((math.floor(distance/10)) * 10)
		end
		
		
		
		local x = math.floor(waypoint.beaconLock_X)
		local y = math.floor(waypoint.beaconLock_Y)
		local text = ("Waypoint: " .. tostring(distance) .. " meters")
		if kilos then text = (("Waypoint: " .. tostring(kdistance) .. " km")) end
		local x = math.floor(playerObj:getX()-waypoint.beaconLock_X)
		local y =  math.floor(playerObj:getY()-waypoint.beaconLock_Y)
		local north = nil
		local south = nil
		local east = nil
		local west = nil
		if y < 0 then
			south = math.abs(y)
		end
		if y > 0 then
			north = math.abs(y)
		end
		if x > 0 then
			west = math.abs(x)
		end
		if x < 0 then
			east = math.abs(x)
		end
		if distance > 0 then
			if south then
				if west and west > (south*2) then
					text = (text .. " West")
				elseif west and west > (south/2) then
					text = (text .. " Southwest")
				elseif east and east > (south*2) then
					text = (text .. " East")
				elseif east and east > (south/2) then
					text = (text .. " Southeast")
				else
					text = (text .. " South")
				end
			elseif north then	
				if west and west > (north*2) then
					text = (text .. " West")
				elseif west and west > (north/2) then
					text = (text .. " Northwest")
				elseif east and east > (north*2) then
					text = (text .. " East")
				elseif east and east > (north/2) then
					text = (text .. " Northeast")
				else	
					text = (text .. " North")
				end
			elseif west then
					text = (text .. " West")
			elseif east then
				text = (text .. " East")
			end
		end
		--context:addOption(getText((text)))
		context:addOption(getText(distortText(text)))-- , items, ISInventoryPaneContextMenu.onWearItems, player);
					text = nil
    end
	if canWaypoint then
		
		context:addOption(getText("Set Waypoint Manually"), player, SetGPSCode, canWaypoint );
		
		--context:addOption(getText("Set Waypoint Manually"), SetGPSCode, player, canWaypoint);
	end
end


function distortText(text)
		--return text 
		local c = 0
		local text2 = {}
		for i=0, text:len()-1 do		
			if ZombRand(0,19) == 0 then
				local distort = string.char(ZombRand(0,127))
				if c == 0 then
					c = 1
					--text2[c]= replaceChar(i, text, distort)
					text2[1]= replaceChar(i, text, distort)
				else
					c = c + 1
					--text2[c]= replaceChar(i, text2[c-1], distort)
					text2[1]= replaceChar(i, text2[1], distort)
				end
			end	
		end
		if c > 0 then
			return text2[1]
		else
		
			return text
		end
end



function replaceChar(pos, str, r)
    return str:sub(1, pos-1) .. r .. str:sub(pos+1)
end

function SetGPSCode(player, device)
    local modal = FiveDigitCode:new(player,  device, "Set X Coordinate");
    modal:initialise();
    modal:addToUIManager();
    -- if JoypadState.players[player+1] then
        -- setJoypadFocus(player, modal)
    -- end
end


function GPSonSetDigitalCode1(device, code)
    --local dialog = button.parent
  -- if button.internal == "OK"
  -- and dialog:getCode() ~= 0 then
		local modData = device:getModData()
		--modData.beaconLock = true
		modData.beaconLock_X = code
		
		local modal = FiveDigitCode:new(player, nil, "Set Y Coordinate");
        -- player:getInventory():Remove(padlock);
        -- thumpable:setLockedByCode(dialog:getCode());
        -- local pdata = getPlayerData(player:getPlayerNum());
        -- pdata.playerInventory:refreshBackpacks();
        -- pdata.lootInventory:refreshBackpacks()
    --end
end
--function GPSonSetDigitalCode2(button, player, device, code)
function GPSonSetDigitalCode2(device, code)
    --local dialog = button.parent
    --if button.internal == "OK"
	--and dialog:getCode() ~= 0 then
		local modData = device:getModData()
		modData.beaconLock = true
		modData.beaconLock_Y = code
		
		-- local modal = FiveDigitCode:new(0, 0, 230, 120, nil, GPSonSetDigitalCode2, player, device, nil, true);
        -- player:getInventory():Remove(padlock);
        -- thumpable:setLockedByCode(dialog:getCode());
        -- local pdata = getPlayerData(player:getPlayerNum());
        -- pdata.playerInventory:refreshBackpacks();
        -- pdata.lootInventory:refreshBackpacks()
    --end
end