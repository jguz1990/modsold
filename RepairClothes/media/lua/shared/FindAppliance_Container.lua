function FindAppliance_Container(player, Appliance)
    --print("find worksbench")
    local station = nil
    local CustomName = nil
    local cell = player:getCell() -- the cell wont change. no need to getWorld():getCell() every step of the loop
    local x, y, z = player:getX(), player:getY(), player:getZ()
    local xx, yy, zz
    for xx =-1,1 do -- no rule says we need to start at index 1. skip the funky math

        for yy =-1,1 do

            local square = cell:getGridSquare(x+xx, y+yy, z)
            if square then

                local objects = square:getObjects()

                for index=0, objects:size()-1 do
                    local object = objects:get(index)
                    
                    
                    if object:getProperties():Val("CustomName") then
                        CustomName = object:getProperties():Val("CustomName")
						--print("Custom Name " .. tostring(CustomName))
                        if (CustomName:contains(Appliance) or Appliance:contains(CustomName))
						and object:getContainer()
						then
							--print("BINGO")
                            station = object
                            return station
                        end
                    end
                end
                
            end
        end
    end
    return station
end



