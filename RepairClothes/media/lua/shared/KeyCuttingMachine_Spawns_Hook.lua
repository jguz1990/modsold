
 
local function KeyCuttingMachine_Hook(square)
	--print("HOOK")
    if square:getModData().KeyCuttingMachineSquare then return end
    --if square:getModData().specialSquare then return end
	KeyCuttingMachineSpawn(square)

end


Events.LoadGridsquare.Add(KeyCuttingMachine_Hook) -- every time a grid square is loaded, checks for any vehicle spawn list entries

