function ZRation_Open(items, result, player)
	--player:getInventory():AddItem("Base.5_DollarBill"); 

end
local MRE_Meals = {
	"MRE_PorkwithRiceinBBQSauce",
	"MRE_CornedBeefHash",
	"MRE_ChickenStew",
	"MRE_OmeletwithHam",
	"MRE_SpaghettiwithMeatSauce",
	"MRE_ChickenalaKing",
	"MRE_BeefStew",
	"MRE_HamSlice",
	"MRE_MeatballswithTomatoSauce",
	"MRE_TunawithNoodles",
	"MRE_ChickenwithRice",
	"MRE_EscallopedPotatoeswithHam",
}
local MRE_Sides = {
	"MRE_Applesauce",
	"MRE_Freezedriedfruit",
	"MRE_PotatoesAuGrautin",
	"MRE_OatmealCookieBar",
	"MRE_PoundCake",
	"MRE_BrownieChocCovered",
	"MRE_CookieChocCovered",
	"MRE_ChowMeinNoodles",
	"MRE_PotatoSticks",
}
local MRE_Drinks = {
	"MRE_Cocoa",
	"MRE_BevBasewithSugar",
	"MRE_SugarFreeBevBase",
	"MRE_Coffee",
}
local MRE_Spreads = {
	"MRE_Jelly",
	"MRE_PeanutButter",
	"MRE_Cheesespread",
}

function OpenMRE(items, result, player)
	player:getInventory():AddItem("MRE_FlamelessRationHeater")
	player:getInventory():AddItem("MRE_Crackers")
	local roll = ZombRand(0,#MRE_Meals)
	player:getInventory():AddItem(MRE_Meals[roll+1])
	local roll = ZombRand(0,#MRE_Sides)
	player:getInventory():AddItem(MRE_Sides[roll+1])
	local roll = ZombRand(0,#MRE_Drinks)
	player:getInventory():AddItem(MRE_Drinks[roll+1])
	
	local roll = ZombRand(0,#MRE_Spreads)
	player:getInventory():AddItem(MRE_Spreads[roll+1])
	
	--local roll = roll +1
	--local result = MRE_Spreads[roll]
	--player:getInventory():AddItem(result)
	--print("ROLL " .. tostring(roll) .. " - " .. tostring(result) )
	--tostring(MRE_Spreads[roll]))
end
function HeatMRE(items, result, player)
	player:getInventory():AddItem("MRE_FlamelessRationHeater_Trash")
    player:getInventory():AddItem("MRE_Meal_Carton_Trash")
	--result:setHeat(100)
	result:setHeat(3)
	--player:playSound("GetWater")
end
function FinishedMRE(items, result, player)
	player:getInventory():AddItem("MRE_FlamelessRationHeater_Trash")
    player:getInventory():AddItem("MRE_Meal_Carton_Trash")
	--result:setHeat(100)
	local item = items:get(0)
	result:setAge(item:getAge())
	local age = item:getAge() * 100
	print("--   AGE : " .. tostring(age))
	if age < 3 then 
		print("HOT FOOD!")
		local heat = math.floor(3 - age + 0.9)
		print("--   HEAT : " .. tostring(heat))
		
		result:setHeat(heat) 
	end
	--player:playSound("GetWater")
end
function StartMRE(items, result, player)
	--result:setHeat(5)
	--player:playSound("GetWater")
end
function OnEat_MRE(food, player)
    --player:getInventory():AddItem("MRE_Meal_Pouch_Trash")
    --player:getInventory():AddItem("MRE_Meal_Carton_Trash")
end
function SpreadMRE(items, result,  player)
    -- player:getInventory():AddItem("Base.MRE_Crackers_Trash")
    -- player:getInventory():AddItem("Base.MRE_Spread_Trash")
end
function MRE_Drink(items, result,  player)
    player:getInventory():AddItem("MRE_Drink_Trash")
end
function OpenMREMeal(items, result,  player)
    player:getInventory():AddItem("MRE_Meal_Carton_Trash")
end
function OpenMREAccessoryPacket(items, result,  player)
    player:getInventory():AddItem("MRE_AccessoryPacket_Trash")
end
function OpenMREBox(items, result,  player)
    player:getInventory():AddItem("Small_Cardboard_Box")
end
function Clean_Water_Bottle_Full(item)
    if item:isWaterSource() then
        if item:isTaintedWater() then return false; end
        if item:getUsedDelta() < 1 then return false; end
    end
    return true;
end
function MRE_NoVehicle(item, result)
	local cont = item:getContainer()
	-- if cont:getVehiclePart() then return false end
	local cont = cont:getOutermostContainer()
	-- if cont:getVehiclePart() then return false end
	local player = item:getParent()
	-- print("Parent " .. tostring(player))
	-- local player = getSpecificPlayer(0)
	-- print("Player " .. tostring(player))
	if player and player:getVehicle() then
		-- print("Vehicle!")
		return false
	end
    return true;
end
function MRE_NoVehicle2(item, player)
	-- local cont = item:getContainer()
	-- if cont:getVehiclePart() then return false end
	-- local cont = item:getOutermostContainer()
	-- -- if cont:getVehiclePart() then return false end
	-- local player = cont:getParent()
	-- print("Parent " .. tostring(player))
	-- local player = getSpecificPlayer(0)
	-- print("Player " .. tostring(player))
	if player and player:getVehicle() then
		-- print("Vehicle!")
		return false
	end
    return true;
end