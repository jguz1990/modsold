function BallPython_WillEat(sourceItem, result)
    if not sourceItem:getType():contains("BallPython") then
        if not sourceItem:isFresh() then return false end
        return true
    else return true end
end

function BallPython_Eats(items, result, player)
	--if ZombRand(0,1000) == 0 then
		--removeItem(result)
		--player:getInventory():AddItem("Base.BallPythonSickly")
		--result:setType("Base.BallPythonSickly")
	--end
end