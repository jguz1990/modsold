--***********************************************************
--**            ROBERT JOHNSON (edited iBrRus)             **
--***********************************************************

ISWaterFloor = ISBuildingObject:derive("ISWaterFloor");

--************************************************************************--
--** ISWaterFloor:new
--**
--************************************************************************--
function ISWaterFloor:create(x, y, z, north, sprite)
	self.sq = getWorld():getCell():getGridSquare(x, y, z);
	self.javaObject = self.sq:addFloor(sprite);
	buildUtil.consumeMaterial(self);
    -- if self.sq:getZone() then
        -- self.sq:getZone():setHaveConstruction(true);
    -- end

    for i=0,self.sq:getObjects():size()-1 do
        local object = self.sq:getObjects():get(i);
        if object:getProperties() and object:getProperties():Is(IsoFlagType.canBeRemoved) then
            self.sq:transmitRemoveItemFromSquare(object)
            self.sq:RemoveTileObject(object);
            break
        end
    end
	
	self.sq:RecalcProperties()
	
    -- self.sq:disableErosion();
    -- local args = { x = self.sq:getX(), y = self.sq:getY(), z = self.sq:getZ() }
    -- sendClientCommand(nil, 'erosion', 'disableForSquare', args)
end

function ISWaterFloor:new(sprite)
	local o = {};
	setmetatable(o, self);
	self.__index = self;
	o:init();
	o:setSprite(sprite);
	o:setNorthSprite(sprite);
	o.buildLow = true;
	o.floor = true;
	return o;
end

function ISWaterFloor:isValid(square)
	if not self:haveMaterial(square) then return false end
	if square:getZ() > 0 then
		return false
	else 
		return square:connectedWithFloor()
	end
end

function ISWaterFloor:render(x, y, z, square)
	ISBuildingObject.render(self, x, y, z, square)
end