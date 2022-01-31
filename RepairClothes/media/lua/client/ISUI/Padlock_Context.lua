function padlock_Context (player, context, worldobjects, test)
	local playerObj = getSpecificPlayer(player)
	local playerInv = playerObj:getInventory()
	
	for i,v in ipairs(worldobjects) do
		--if v:getSquare() and not doneSquare[v:getSquare()] then
			--doneSquare[v:getSquare()] = true
			--for n = 0,v:getSquare():getWorldObjects():size()-1 do
				-- local item = v:getSquare():getWorldObjects():get(n)
				-- local itemName = item:getName() or (item:getItem():getName() or "???")
				-- if not itemList[itemName] then itemList[itemName] = {} end
				-- table.insert(itemList[itemName], item)
			
				--if instanceof(v, "IsoThumpable") and v:isDoor() and (v:getSprite():getProperties():Is("DoubleDoor")) == false then			
				if instanceof(v, "IsoThumpable") and v:isDoor() then
					--print("DOOR")
					thump = v;            
					if  not v:isLockedByPadlock() and not v:isLockedByKey() and v:getLockedByCode() == 0 then
						padlockThump = v;
					end
					if v:isLockedByPadlock() then
						--print("LOCKED")
						padlockedThump = v;
					end
					if v:getLockedByCode() > 0 then
						digitalPadlockedThump = v;
					end					
				end					
			--end
		--end
	end
end

Events.OnPreFillWorldObjectContextMenu.Add(padlock_Context)	

function ISWorldObjectContextMenu:onSetDigitalCode(button, player, padlock, thumpable)
    local dialog = button.parent
    if button.internal == "OK" and dialog:getCode() ~= 0 then
        player:getInventory():Remove(padlock);
        thumpable:setLockedByCode(dialog:getCode());
        local pdata = getPlayerData(player:getPlayerNum());
        pdata.playerInventory:refreshBackpacks();
        pdata.lootInventory:refreshBackpacks()
		
		if thumpable:isDoor() then
			print("Locked?")
			thumpable:setLockedByKey(true)
			thumpable:setKeyId(dialog:getCode())
		end
		player:playSound("UnlockDoor")
    end
end


function ISWorldObjectContextMenu:onCheckDigitalCode(button, player, padlock, thumpable)
    local dialog = button.parent
    if button.internal == "OK" then
        if thumpable:getLockedByCode() == dialog:getCode() then
            thumpable:setLockedByCode(0);
            player:getInventory():AddItem("Base.CombinationPadlock");
            local pdata = getPlayerData(player:getPlayerNum());
            pdata.playerInventory:refreshBackpacks();
            pdata.lootInventory:refreshBackpacks()
			if thumpable:isDoor() then
				print("Unocked?")
				thumpable:setLockedByKey(false)
			end
			player:playSound("UnlockDoor")
        end
    end
end

-- ISWorldObjectContextMenu.onRemoveDigitalPadlock = function(worldobjects, player, thump)
    -- local playerObj = getSpecificPlayer(player)

    -- if luautils.walkAdj(playerObj, thump:getSquare()) then
		-- local modal = ISDigitalCode:new(0, 0, 230, 120, nil, ISWorldObjectContextMenu.onCheckDigitalCode, player, nil, thump, true);
		-- modal:initialise();
		-- modal:addToUIManager();
		-- if JoypadState.players[player+1] then
			-- setJoypadFocus(player, modal)
		-- end
    -- end
-- end

-- ISWorldObjectContextMenu.onPutDigitalPadlock = function(worldobjects, player, thump, padlock)

    -- local playerObj = getSpecificPlayer(player)

    -- if luautils.walkAdj(playerObj, thump:getSquare()) then
		-- local modal = ISDigitalCode:new(0, 0, 230, 120, nil, ISWorldObjectContextMenu.onSetDigitalCode, player, padlock, thump, true);
		-- modal:initialise();
		-- modal:addToUIManager();
		-- if JoypadState.players[player+1] then
			-- setJoypadFocus(player, modal)
		-- end
    -- end
-- end