--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "ISUI/ISToolTipInv"

-- ISToolTipInv = ISPanel:derive("ISToolTipInv");


-- --************************************************************************--
-- --** ISToolTipInv:initialise
-- --**
-- --************************************************************************--

-- function ISToolTipInv:initialise()
	-- ISPanel.initialise(self);
-- end

-- function ISToolTipInv:setItem(item)
	-- self.item = item;
-- end

-- function ISToolTipInv:onMouseDown(x, y)
	-- return false
-- end

-- function ISToolTipInv:onMouseUp(x, y)
	-- return false
-- end

-- function ISToolTipInv:onMouseDownOutside(x, y)
    -- if self.followMouse then
        -- self:setVisible(false)
    -- end
-- end

-- function ISToolTipInv:onRightMouseDown(x, y)
	-- return false
-- end

-- function ISToolTipInv:onRightMouseUp(x, y)
	-- return false
-- end

-- --************************************************************************--
-- --** ISToolTipInv:render
-- --**
-- --************************************************************************--

-- function ISToolTipInv:prerender()
	-- if self.owner and not self.owner:isReallyVisible() then
		-- self:removeFromUIManager()
		-- self:setVisible(false)
		-- return
	-- end
-- end

local old_ISToolTipInv_render = ISToolTipInv.render



function ISToolTipInv:render()

	if self.item
	and instanceof( self.item, "Clothing")
	--and self.item:getBodyLocation() == "TorsoExtra"
	and self.item:getBodyLocation()
	--and getSpecificPlayer(0):getWornItem("TorsoExtra")
	and  getPlayer():getWornItem(self.item:getBodyLocation())
	--and instanceof( getSpecificPlayer(0):getWornItem("TorsoExtra"), "InventoryContainer")
	and instanceof(  getPlayer():getWornItem(self.item:getBodyLocation()), "InventoryContainer")
	then
		--print("VEST CONFLICT!!!!")
		return false 
	end
	old_ISToolTipInv_render(self)

end


-- function ISToolTipInv:adjustPositionToAvoidOverlap(avoidRect)
	-- local myRect = { x = self.x, y = self.y, width = self.width, height = self.height }
	-- if self:overlaps(myRect, avoidRect) then
		-- local r = self:placeRight(myRect, avoidRect)
		-- if self:overlaps(r, avoidRect) then
			-- r = self:placeAbove(myRect, avoidRect)
			-- if self:overlaps(r, avoidRect) then
				-- r = self:placeLeft(myRect, avoidRect)
			-- end
		-- end
		-- self.tooltip:setX(r.x)
		-- self.tooltip:setY(r.y)
		-- self:setX(r.x - 11)
		-- self:setY(r.y)
	-- end
-- end

-- function ISToolTipInv:overlaps(r1, r2)
	-- return r1.x + r1.width > r2.x and r1.x < r2.x + r2.width and
			-- r1.y + r1.height > r2.y and r1.y < r2.y + r2.height
-- end

-- function ISToolTipInv:placeLeft(r1, r2)
	-- local r = r1
	-- r.x = math.max(0, r2.x - r.width - 8)
	-- return r
-- end

-- function ISToolTipInv:placeRight(r1, r2)
	-- local r = r1
	-- r.x = r2.x + r2.width + 8
	-- r.x = math.min(r.x, getCore():getScreenWidth() - r.width)
	-- return r
-- end

-- function ISToolTipInv:placeAbove(r1, r2)
	-- local r = r1
	-- r.y = r2.y - r.height - 8
	-- r.y = math.max(0, r.y)
	-- return r
-- end

-- function ISToolTipInv:setOwner(ui)
	-- self.owner = ui
-- end

-- function ISToolTipInv:setCharacter(chr)
	-- self.tooltip:setCharacter(chr)
-- end

-- --************************************************************************--
-- --** ISToolTipInv:new
-- --**
-- --************************************************************************--
-- function ISToolTipInv:new(item)
   -- local o = {}
   -- o = ISPanel:new(0, 0, 0, 0);
   -- setmetatable(o, self)
   -- self.__index = self
   -- o.tooltip = ObjectTooltip.new();
   -- o.item = item;

   -- o.tooltip:setX(0);
   -- o.tooltip:setY(0);

   -- o.x = 0;
   -- o.y = 0;

   -- o.toolTipDone = false;

   -- o.backgroundColor = {r=0, g=0, b=0, a=0.5};
   -- o.borderColor = {r=0.4, g=0.4, b=0.4, a=1};
   -- o.width = 0;
   -- o.height = 0;
   -- o.anchorLeft = false;
   -- o.anchorRight = false;
   -- o.anchorTop = false;
   -- o.anchorBottom = false;

   -- o.owner = nil
   -- o.followMouse = true
   -- o.anchorBottomLeft = nil
   -- return o;
-- end
