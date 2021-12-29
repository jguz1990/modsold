

TrolleyList = {
"TMC.TrolleyContainer", 
"TMC.CartContainer", 
"TMC.TrolleyContainer2",
"TMC.CartContainer2",
}

local seatNameTable = {"SeatFrontLeft", "SeatFrontRight", "SeatMiddleLeft", "SeatMiddleRight", "SeatRearLeft", "SeatRearRight"}

function ISContextMenu:updateOptionTrolley(id, name, target, onSelect, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10)
	local option = self:allocOption(name, target, onSelect, param1, param2, param3, param4, param5, param6, param7, param8, param9, param10);
	self.options[id] = option;
	return option;
end

function ISContextMenu:removeOptionTrolley(option)
	if option then
		table.insert(self.optionPool, self.options[option.id])
		self.options[option.id] =  nil;
		for i = option.id, self.numOptions - 1 do
			self.options[i] = self.options[i+1]
			if self.options[i] then
				self.options[i].id = i
			end
		end
		self.numOptions = self.numOptions - 1;
		self:calcHeight()
	end
end


function onEquipTrolleyTick()
    local playersSum = getNumActivePlayers()
	for playerNum = 0, playersSum - 1 do
		local playerObj = getSpecificPlayer(playerNum)
		if playerObj then
			-- Выбрасывание лишней тележки
			local playerInv = playerObj:getInventory()
			if (playerInv:getItemCount(TrolleyList[1]) + 
					playerInv:getItemCount(TrolleyList[2]) + 
					playerInv:getItemCount(TrolleyList[3]) + 
					playerInv:getItemCount(TrolleyList[4])) > 1 then
				-- print("MORE Trolley")
				for i = 1, #TrolleyList do
					trolForDrop = nil
					itemsArray = playerInv:getItemsFromType(TrolleyList[i])
					-- itemsArray = playerInv:getItemsFromType("SAD")
					-- print(itemsArray:size())
					if itemsArray:size() > 0 then
						if not (playerObj:getPrimaryHandItem() == itemsArray:get(0)) then
							trolForDrop = itemsArray:get(0)
						elseif itemsArray:size() > 1 then
							trolForDrop = itemsArray:get(1)
						end
						if trolForDrop then
							-- print("trolForDrop")
							playerInv:Remove(trolForDrop)
							playerObj:removeFromHands(trolForDrop)
							local dropX,dropY,dropZ = ISInventoryTransferAction.GetDropItemOffset(playerObj, playerObj:getCurrentSquare(), trolForDrop)
							playerObj:getCurrentSquare():AddWorldInventoryItem(trolForDrop, dropX, dropY, dropZ)
							break
						end
					end
				end
			elseif (playerInv:getItemCount(TrolleyList[1]) == 1 or 
					playerInv:getItemCount(TrolleyList[2]) == 1 or 
					playerInv:getItemCount(TrolleyList[3]) == 1 or 
					playerInv:getItemCount(TrolleyList[4]) == 1) then
				for i = 1, #TrolleyList do
					trolForEquip = playerInv:getFirstType(TrolleyList[i])
					if trolForEquip then
						-- Замена на другой контейнер
						trolCont = trolForEquip:getItemContainer()
						if i <= (#TrolleyList / 2) and not trolCont:isEmpty() then
							playerInv:Remove(trolForEquip)
							trolForEquip = playerInv:AddItem(TrolleyList[i + #TrolleyList / 2])
							trolForEquip:setItemContainer(trolCont)
						elseif i > (#TrolleyList / 2) and trolCont:isEmpty() then
							playerInv:Remove(trolForEquip)
							trolForEquip = playerInv:AddItem(TrolleyList[i - #TrolleyList / 2])
							trolForEquip:setItemContainer(trolCont)
						end
						-- Тележка сразу берется в руки
						if playerObj:getPrimaryHandItem() ~= trolForEquip then
							playerObj:setPrimaryHandItem(trolForEquip)
							playerObj:setSecondaryHandItem(trolForEquip)
							getPlayerData(playerObj:getPlayerNum()).playerInventory:refreshBackpacks();
						end
						break
					end
				end
			end
			
			if playerObj:getVariableString("Weapon") ~= "trolley" then -- print(getPlayer():getVariableString("Weapon"))		
				-- Задание переменной для анимации
				local _item = playerObj:getPrimaryHandItem()
				if _item and (_item:getScriptItem():getName() == "TrolleyContainer" or 
							  _item:getScriptItem():getName() == "TrolleyContainer2" or 
							  _item:getScriptItem():getName() == "CartContainer" or 
							  _item:getScriptItem():getName() == "CartContainer2") then
					playerObj:setVariable("Weapon", "trolley")
				end
				-- Разблокировка меню эмоций
				if playerObj:getModData()["blockEmote"] or playerObj:getModData()["blockShout"] then
					getCore():addKeyBinding("Emote", playerObj:getModData()["blockEmote"])
					getCore():addKeyBinding("Shout", playerObj:getModData()["blockShout"])
					playerObj:getModData()["blockEmote"] = nil
					playerObj:getModData()["blockShout"] = nil
				end
			else
				-- Удаление задвоенной тележки
				local _item = playerObj:getPrimaryHandItem()
				if _item and not (_item:getContainer() == playerObj:getInventory()) then
					playerObj:setPrimaryHandItem(nil)
					playerObj:setSecondaryHandItem(nil)
				end
				-- Выбрасывание тележки при столкновениях и пр.
				-- print(playerObj:getCurrentState())
				if not (playerObj:getCurrentState() == IdleState.instance() or 
						playerObj:getCurrentState() == PlayerAimState.instance()) then
					local sqr = playerObj:getSquare()
					local trol = playerObj:getPrimaryHandItem()
					playerObj:getInventory():Remove(trol)
					local pdata = getPlayerData(playerObj:getPlayerNum());
					if pdata ~= nil then
						pdata.playerInventory:refreshBackpacks();
						pdata.lootInventory:refreshBackpacks();
					end
					playerObj:setPrimaryHandItem(nil);
					playerObj:setSecondaryHandItem(nil);
					sqr:AddWorldInventoryItem(trol, 0, 0, 0);
				end
				-- Блокировка меню эмоций
				if not playerObj:getModData()["blockEmote"] or not playerObj:getModData()["blockShout"] then
					playerObj:getModData()["blockEmote"] = getCore():getKey("Emote")
					playerObj:getModData()["blockShout"] = getCore():getKey("Shout")
					getCore():addKeyBinding("Emote", nil)
					getCore():addKeyBinding("Shout", nil)
				end
				-- Выбрасывание тележки в машине
				if playerObj:getVehicle() then
					local vehicle = playerObj:getVehicle()
					local areaCenter = vehicle:getAreaCenter(seatNameTable[vehicle:getSeat(playerObj)+1])
					-- print(areaCenter)
					if areaCenter then 
						local sqr = getCell():getGridSquare(areaCenter:getX(), areaCenter:getY(), vehicle:getZ())
						local trol = playerObj:getPrimaryHandItem()
						playerObj:getInventory():Remove(trol)
						local pdata = getPlayerData(playerObj:getPlayerNum());
						if pdata ~= nil then
							pdata.playerInventory:refreshBackpacks();
							pdata.lootInventory:refreshBackpacks();
						end
						playerObj:setPrimaryHandItem(nil);
						playerObj:setSecondaryHandItem(nil);
						sqr:AddWorldInventoryItem(trol, 0, 0, 0);
					end
				end
				
			end
		end
		-- print(playerObj:getCurrentState())
    end
end

-- function addTrolleyButton(invPage, state)
	-- if state == "buttonsAdded" then
		-- local playerObj = getSpecificPlayer(invPage.player)
		-- if invPage.onCharacter then
			-- local it = playerObj:getInventory():getItems()
			-- for i = 0, it:size()-1 do
				-- local item = it:get(i)
				-- if item:getType() == "Trolley" and playerObj:isEquipped(item) then
					-- if item:getContainer() then
						-- containerButton = invPage:addContainerButton(item:getContainer(), item:getTex(), item:getName(), item:getName())
					-- end
					-- if item:getRightClickContainer() then
						-- containerButton = invPage:addContainerButton(item:getRightClickContainer(), item:getTex(), item:getName(), item:getName())
					-- end
				-- end
			-- end	
		-- end
	-- end
-- end

function ISWorldObjectContextMenu.getWorldObjectsOnSquares(squares, worldObjects)
	for _,square in ipairs(squares) do
		local squareObjects = square:getWorldObjects()
		for i=1,squareObjects:size() do
			local worldObject = squareObjects:get(i-1)
			table.insert(worldObjects, worldObject)
		end
	end
end

function TrolleyOnFillWorldObjectContextMenu(player, context, worldobjects, test)
	local playerObj = getSpecificPlayer(player)
	local squares = {}
	local doneSquare = {}
	for i,v in ipairs(worldobjects) do
		if v:getSquare() and not doneSquare[v:getSquare()] then
			doneSquare[v:getSquare()] = true
			table.insert(squares, v:getSquare())
		end
	end
	if #squares == 0 then return false end
	
	local worldObjects = {}
	if JoypadState.players[player+1] then
		for _,square in ipairs(squares) do
			for i=1,square:getWorldObjects():size() do
				local worldObject = square:getWorldObjects():get(i-1)
				table.insert(worldObjects, worldObject)
			end
		end
	else
		local squares2 = {}
		for k,v in pairs(squares) do
			squares2[k] = v
		end
		local radius = 1
		for _,square in ipairs(squares2) do
			ISWorldObjectContextMenu.getSquaresInRadius(square:getX(), square:getY(), square:getZ(), radius, doneSquare, squares)
		end
		ISWorldObjectContextMenu.getWorldObjectsOnSquares(squares, worldObjects)
	end
	if #worldObjects == 0 then return false end
	for _,worldObject in ipairs(worldObjects) do
		local trolleyName = worldObject:getItem():getFullType()
		if (trolleyName == TrolleyList[1]) or (trolleyName == TrolleyList[2])
			or (trolleyName == TrolleyList[3]) or (trolleyName == TrolleyList[4]) then
			local old_option_update = context:getOptionFromName(getText("ContextMenu_Grab"))
			if old_option_update then
				context:updateOptionTrolley(old_option_update.id, getText("ContextMenu_GrabTrolley"), playerObj, ISWorldObjectContextMenu.equipTrolley, worldObject)
				return
			end				
		end
	end
end

ISWorldObjectContextMenu.equipTrolley = function(playerObj, WItem)
    if WItem:getSquare() and luautils.walkAdj(playerObj, WItem:getSquare()) then
		if playerObj:getPrimaryHandItem() then
			ISTimedActionQueue.add(ISUnequipAction:new(playerObj, playerObj:getPrimaryHandItem(), 50));
		end
		if playerObj:getSecondaryHandItem() and playerObj:getSecondaryHandItem() ~= playerObj:getPrimaryHandItem() then
			ISTimedActionQueue.add(ISUnequipAction:new(playerObj, playerObj:getSecondaryHandItem(), 50));
		end
		-- local time = ISWorldObjectContextMenu.grabItemTime(playerObj, WItem)
		ISTimedActionQueue.add(ISTakeTrolley:new(playerObj, WItem, 1))
	end
end

local oldForceDropHeavyItem = isForceDropHeavyItem
function isForceDropHeavyItem(item)
	if item and (item:getFullType() == TrolleyList[1] or item:getFullType() == TrolleyList[2] or item:getFullType() == TrolleyList[3] or item:getFullType() == TrolleyList[4]) then
		return true
	else
		return oldForceDropHeavyItem(item)
	end
end

local function trolleyBlockBuildOptions(player, context, worldobjects, test)
	local playerObj = getSpecificPlayer(player)
	if playerObj:getVariableString("Weapon") == "trolley" then
		context:removeOptionTrolley(context:getOptionFromName(getText("ContextMenu_MetalWelding")))
		context:removeOptionTrolley(context:getOptionFromName(getText("ContextMenu_Build")))
	end
end

Events.OnFillWorldObjectContextMenu.Add(trolleyBlockBuildOptions)

function onEquipTrolleyCallout(key)
	playerObj = getSpecificPlayer(0)
	if playerObj then
		if playerObj:getVariableString("Weapon") == "trolley" and key == playerObj:getModData()["blockShout"] then
			playerObj:Callout()
		end
	end
end

Events.OnFillWorldObjectContextMenu.Add(TrolleyOnFillWorldObjectContextMenu);
Events.OnTick.Add(onEquipTrolleyTick);
Events.OnKeyPressed.Add(onEquipTrolleyCallout)
-- Events.OnRefreshInventoryWindowContainers.Add(addTrolleyButton);