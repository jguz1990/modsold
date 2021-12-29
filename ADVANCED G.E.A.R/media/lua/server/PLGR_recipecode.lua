
-- When creating item in result box of crafting panel.
function PLGRBatteryRemoval(items, result, player)
  for i=0, items:size()-1 do
	local item = items:get(i)
	-- we found the battery, we change his used delta according to the battery
	if item:getType() == "PLGR" then
		result:setUsedDelta(item:getUsedDelta());
		-- then we empty the torch used delta (his energy)
		item:setUsedDelta(0);
	end
  end


end

-- Return true if recipe is valid, false otherwise
function TestPLGRBatteryInsert(sourceItem, result)
	if sourceItem:getType() == "PLGR" then
		return sourceItem:getUsedDelta() == 0; -- Only allow the battery inserting if the flashlight has no battery left in it.
	end
	return true -- the battery
end

function CreatePLGRBatteryInsertX(items, result, player)
  for i=0, items:size()-1 do
	-- we found the battery, we change his used delta according to the battery
	if items:get(i):getType() == "Battery" then
		result:setUsedDelta(items:get(i):getUsedDelta());
	elseif items:get(i):getType() == "PLGR" then		
		if items:get(i):getAttachedSlot() >= -1 then
			result:setAttachedSlot(items:get(i):getAttachedSlot())
		end
	end
  end
end

function CreatePLGRBatteryInsert(items, result, player)
	local batteryCharge = nil
  for i=0, items:size()-1 do
	-- we found the battery, we change his used delta according to the battery
	if items:get(i):getType() == "Battery" then
		batteryCharge = (items:get(i):getUsedDelta());
		result:setUsedDelta(items:get(i):getUsedDelta());
	end
  end
  for i=0, items:size()-1 do
	-- we found the battery, we change his used delta according to the battery
	if items:get(i):getType() == "PLGR" and batteryCharge then		
		items:get(i):setUsedDelta(batteryCharge)
		--result = item	
		if items:get(i):getAttachedSlot() >= -1 then
			result:setAttachedSlot(items:get(i):getAttachedSlot())
		end
	end
  end
  
end


function DismantlePLGR(items, result, player, selectedItem)
    local success = 50 + (player:getPerkLevel(Perks.Electricity)*5);
    if ZombRand(0,100)<success then
        player:getInventory():AddItem("Base.LightBulbGreen");
    end

    for i=1,ZombRand(1,4) do
        local r = ZombRand(1,4);
        if r==1 then
            player:getInventory():AddItem("Base.ElectronicsScrap");
        elseif r==2 then
            player:getInventory():AddItem("Radio.ElectricWire");
        elseif r==3 then
            player:getInventory():AddItem("Base.Aluminum");
        end
    end
    if ZombRand(0,100)<success then
        player:getInventory():AddItem("Base.LightBulb");
    end
    if ZombRand(0,100)<success then
        player:getInventory():AddItem("Radio.RadioReceiver");
    end
    --if selectedItem then
        --print("Main item "..selectedItem:getName());
    --end
    for i=0,items:size()-1 do
        local item = items:get(i)
        if item:getType() == "PLGR" then
			if item:getUsedDelta() > 0 then
				local battery = player:getInventory():AddItem("Base.Battery")
				battery:setUsedDelta(item:getUsedDelta());
			end
        end
    end
end
