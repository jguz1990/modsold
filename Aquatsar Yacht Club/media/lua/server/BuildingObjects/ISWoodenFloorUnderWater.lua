--***********************************************************
--**            ROBERT JOHNSON (edited iBrRus)             **
--***********************************************************

ISWoodenFloorUnderWater = ISBuildingObject:derive("ISWoodenFloorUnderWater");

--************************************************************************--
--** ISWoodenFloorUnderWater:new
--**
--************************************************************************--
function ISWoodenFloorUnderWater:create(x, y, z, north, sprite)
	self.sq = getWorld():getCell():getGridSquare(x, y, z);
	self.javaObject = self.sq:addFloor(sprite);
	buildUtil.consumeMaterial(self);
    if self.sq:getZone() then
        self.sq:getZone():setHaveConstruction(true);
    end

    for i=0,self.sq:getObjects():size()-1 do
        local object = self.sq:getObjects():get(i);
        if object:getProperties() and object:getProperties():Is(IsoFlagType.canBeRemoved) then
            self.sq:transmitRemoveItemFromSquare(object)
            self.sq:RemoveTileObject(object);
            break
        end
    end

    self.sq:disableErosion();
    local args = { x = self.sq:getX(), y = self.sq:getY(), z = self.sq:getZ() }
    sendClientCommand(nil, 'erosion', 'disableForSquare', args)
	TickTable.waterConstruction[self.sq] = nil
end

function ISWoodenFloorUnderWater:new(sprite, northSprite)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o:init();
	o:setSprite(sprite);
	o:setNorthSprite(northSprite);
	o.buildLow = true;
	o.floor = true;
	return o;
end

function ISWoodenFloorUnderWater:isValid(square)
	if not self:haveMaterial(square) then return false end
	if square:getZ() > 0 then
		return false
	end
	if square:getFloor():getSprite():getProperties():Is(IsoFlagType.water) then
		return square:connectedWithFloor();
	else 
		return false
	end
end

function ISWoodenFloorUnderWater:render(x, y, z, square)
	ISBuildingObject.render(self, x, y, z, square)
end

local function isWater(paramIsoObject)
	local tileName = paramIsoObject:getTile()
	if not tileName then
		return false
	elseif string.match(string.lower(tileName), "blends_natural_02") then
		return true
	else
		return false
	end
end

-- function test1(paramIsoObject)
	-- print("OnObjectAboutToBeRemoved:, ", isWater(paramIsoObject))
-- end
-- a = 0 

-- function test2(paramIsoObject)
	-- if isWater(paramIsoObject) and a == 0 then
		-- local sq = paramIsoObject:getSquare()
        -- if sq then
			-- for i=0, sq:getObjects():size()-1 do
				-- local object = sq:getObjects():get(i);
				-- print(object)
				-- if object:getProperties() and not isWater(object) then
					-- sq:RemoveTileObject(object);
				-- end
			-- end
			-- sq:getObjects():add(paramIsoObject);
            -- sq:RecalcProperties();
        -- end
		-- a = a + 1
	-- end
-- end

-- Events.OnObjectAboutToBeRemoved.Add(test1)
-- Events.OnTileRemoved.Add(test2)
