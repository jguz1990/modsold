
 
local function copierSpawn_Hook(square)
	--print("HOOK")
    if square:getModData().copierSquare then return end
    --if square:getModData().specialSquare then return end
	copierSpawn(square)

end


Events.LoadGridsquare.Add(copierSpawn_Hook) -- every time a grid square is loaded, checks for any vehicle spawn list entries

