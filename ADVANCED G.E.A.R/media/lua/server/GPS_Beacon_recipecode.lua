function LockWaypoint(items, result, player)
	-- local Beacon = nil
  -- for i=0, items:size()-1 do
	-- local item = items:get(i)
	-- if item:getType() == "Beacon_Transmitter" then
		-- Beacon = item
	-- end
  -- end
  --print("Lock Beacon?")
  for i=0, items:size()-1 do
	local item = items:get(i)
	print(item:getType())
	local modData = item:getModData()
	--if item:getType() == "Beacon_Receiver" or modData.WayPoint then
	if  modData.WayPoint then
		local modData = item:getModData()
		modData.beaconLock = true
		modData.beaconLock_X = player:getX()
		modData.beaconLock_Y = player:getY()
		--print("BEACON LOCKED!")
	end
  end
	player:playSound("Beep1")

end

function UseBeaconTest (item, result)

	local modData = item:getModData()
	--if item:getType() == "Beacon_Receiver" or modData.WayPoint then
	if  modData.WayPoint then
		--local modData = item:getModData()
		--if ( not item:isActivated() )
		--or item:getUsedDelta() = 0
		if item:getUsedDelta() > 0
		and item:isActivated()
		then
			return true
		end
		return false
	end

  return true
end
function SetWaypointTest (item, result)
	--print("Set Waypoint Test")
	local modData = item:getModData()
	if modData.beaconLock then return false end
	--if item:getType() == "Beacon_Receiver" or modData.WayPoint then
	if  modData.WayPoint then
		--local modData = item:getModData()
		--if ( not item:isActivated() )
		--or item:getUsedDelta() = 0
		if item:getUsedDelta() > 0
		and item:isActivated()
		
		then
			return true
		end
		return false
	end

  return true
end
function WipeWaypointTest1 (item, result)

	local modData = item:getModData()
	--if item:getType() == "Beacon_Receiver" or modData.WayPoint then
	if  modData.WayPoint then
		--local modData = item:getModData()
		if modData.beaconLock and item:isActivated() and item:getUsedDelta() > 0 then return true end
	end

  return false
end

function SetWaypointTestb (item, result)
	--print("Set Waypoint Test")
	local modData = item:getModData()
	if modData.beaconLock then return false end
	--if item:getType() == "Beacon_Receiver" or modData.WayPoint then
	if  modData.WayPoint then
		--local modData = item:getModData()
		--if ( not item:isActivated() )
		--or item:getUsedDelta() = 0
		if item:isActivated()
		
		then
			return true
		end
		return false
	end

  return true
end
function WipeWaypointTest1b (item, result)

	local modData = item:getModData()
	--if item:getType() == "Beacon_Receiver" or modData.WayPoint then
	if  modData.WayPoint then
		--local modData = item:getModData()
		if modData.beaconLock and item:isActivated()  then return true end
	end

  return false
end
function WipeWaypoint1(items, result, player)
	player:playSound("Beep2")
  for i=0, items:size()-1 do
	local item = items:get(i)
	local modData = item:getModData()
	--if item:getType() == "Beacon_Receiver" or modData.WayPoint then
	if  modData.WayPoint then
		local modData = item:getModData()
		modData.beaconLock = nil
		modData.beaconLock_X = nil
		modData.beaconLock_Y = nil
		--print("BEACON WIPE!")
	end
  end
	--player:playSound("Beep2")
end


function WipeBeaconTest2 (item, result)

	if item:getType() == "Beacon_Receiver" then
		local modData = item:getModData()
		if modData.beaconCode and item:isActivated() and item:getUsedDelta() > 0 then return true end
	end

  return false
end

function WipeBeacon2(items, result, player)
  for i=0, items:size()-1 do
	local item = items:get(i)
	if item:getType() == "Beacon_Receiver" then
		local modData = item:getModData()
		modData.beaconCode = nil
		--print("BEACON WIPED!")
	end
  end
	player:playSound("Beep2")
end



function LockBeacon2(items, result, player)
	local BeaconCode = nil
	--print("Beacon Lock?")
  for i=0, items:size()-1 do
	local item = items:get(i)
	if item:getType() == "Beacon_Transmitter" then
		BeaconCode = ZombRand(0,10000)
		if not item:getModData().beaconCode then
			item:getModData().beaconCode = BeaconCode
		else
			BeaconCode = item:getModData().beaconCode
		end
		--print("Code: " .. tostring(BeaconCode))
		--print("Transmitter Found")
	end
  end
  for i=0, items:size()-1 do
	local item = items:get(i)
	if item:getType() == "Beacon_Receiver" and BeaconCode then
		local modData = item:getModData()
		modData.beaconCode = BeaconCode
		--print("Receiver Found")
		--print("BEACON 2 LOCKED!")
	end
  end
	player:playSound("Beep1")


end