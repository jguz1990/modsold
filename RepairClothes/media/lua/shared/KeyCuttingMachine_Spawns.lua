local KeyCuttingMachineSpawnList = {

{7258, 8236, 0, 0}, -- Small Town Hardware
{6360, 5324, 0, 1}, -- Riverside Hardware
{11971, 6914, 0, 1}, -- Westpoint Hardware

}


function KeyCuttingMachineSpawn(square)
    square:getModData().KeyCuttingMachineSquare = true
    if not square then return end
 	--local cell = getCell()
	local xx = square:getX()
	local yy = square:getY()
	local zz = square:getZ()
	
	for i in pairs(KeyCuttingMachineSpawnList) do
		if xx==(KeyCuttingMachineSpawnList[i][1]) and yy==(KeyCuttingMachineSpawnList[i][2]) and zz==(KeyCuttingMachineSpawnList[i][3]) then
			local sprite_type = tostring("key_cutting_machine_" .. tostring(KeyCuttingMachineSpawnList[i][4]))
			if not sprite_type then return end	
			local newSprite = (IsoObject.new(getCell(), square, sprite_type));	
			if not newSprite then
				print("NO NEW SPRITE!")
				return false
			end	
			if newSprite and newSprite:getProperties() then 
				if newSprite:getProperties():Val("ContainerType") or newSprite:getProperties():Val("container") then
					newSprite:createContainersFromSpriteProperties() --end
				end
			end
			square:getObjects():add(newSprite);
			square:RecalcProperties();				
		end				
	end
end
