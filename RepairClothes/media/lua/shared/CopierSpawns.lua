local copierSpawnList = {

{5571, 12498, 0, 0}, -- Secret Base

{11974, 6943, 0, 1}, --WP Office complex

{10629, 9686, 1, 1}, --Muldraugh Bank

{7702, 11879, 0, 1}, --Rosewood Prison

{8326, 11596, 0, 0}, --Rosewood School

{10014, 12747, 0, 0}, --March Ridge Community Center--

{11529, 10015, 0, 1}, --Trainyard

{12869, 4868, 0, 0}, --Valley Station Academy

{13894, 5884, 0, 3}, --Mall Security Office--

{5498, 9584, 0, 3}, --Smaller Town Medical

{7250, 8383, 0, 0}, --Small Town Police

{3692, 8492, 0, 0}, --Truck Stop Gas Station

{5541, 5911, 0, 0}, --Riverside Factory Office

{6421, 5424, 0, 0}, --Riverside School

}


function copierSpawn(square)
    square:getModData().copierSquare = true
    if not square then return end
 	--local cell = getCell()
	local xx = square:getX()
	local yy = square:getY()
	local zz = square:getZ()
	
	for i in pairs(copierSpawnList) do
		if xx==(copierSpawnList[i][1]) and yy==(copierSpawnList[i][2]) and zz==(copierSpawnList[i][3]) then
			local sprite_type = tostring("photocopier_x_" .. tostring(copierSpawnList[i][4]))
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
