require "ISUI/ISInventoryPaneContextMenu"
--**                LEMMY/ROBERT JOHNSON                   **
--***********************************************************

-- require "ISUI/ISToolTip"

-- ISInventoryPaneContextMenu = {}
-- ISInventoryPaneContextMenu.tooltipPool = {}
-- ISInventoryPaneContextMenu.tooltipsUsed = {}

local FONT_HGT_SMALL = getTextManager():getFontHeight(UIFont.Small)

local function predicateNotBroken(item)
	return not item:isBroken()
end

local old_ISInventoryPaneContextMenu_doWearClothingTooltip = ISInventoryPaneContextMenu.doWearClothingTooltip
ISInventoryPaneContextMenu.doWearClothingTooltip = function(playerObj, newItem, currentItem, option)
	if not newItem then return false end
	return old_ISInventoryPaneContextMenu_doWearClothingTooltip(playerObj, newItem, currentItem, option)
	-- local replaceItems = {};
	-- local previousBiteDefense = 0;
	-- local previousScratchDefense = 0;
	-- local previousCombatModifier = 0;
	-- local wornItems = playerObj:getWornItems()
	-- local bodyLocationGroup = wornItems:getBodyLocationGroup()	
	-- local location = newItem:IsClothing() 
	-- and newItem:getBodyLocation() 
	-- or newItem:canBeEquipped()

	-- for i=1,wornItems:size() do
		-- local wornItem = wornItems:get(i-1)
		-- local item = wornItem:getItem()
		-- if (newItem:getBodyLocation() == wornItem:getLocation()) or bodyLocationGroup:isExclusive(location, wornItem:getLocation()) then
			-- if item ~= newItem and item ~= currentItem then
				-- table.insert(replaceItems, item);
			-- end
			-- if item:IsClothing() then
				-- previousBiteDefense = previousBiteDefense + item:getBiteDefense();
				-- previousScratchDefense = previousScratchDefense + item:getScratchDefense();
				-- previousCombatModifier = previousCombatModifier + item:getCombatSpeedModifier();
			-- end
		-- end
	-- end

	-- local newBiteDefense = 0;
	-- local newScratchDefense = 0;
	-- local newCombatModifier = 0;

	-- if newItem:IsClothing() then
		-- newBiteDefense = newItem:getBiteDefense();
		-- newScratchDefense = newItem:getScratchDefense();
		-- newCombatModifier = newItem:getCombatSpeedModifier();
	-- end

	-- if #replaceItems == 0 and newBiteDefense == 0 and newScratchDefense == 0 and previousBiteDefense == 0 and previousScratchDefense == 0 then
		-- return nil
	-- end
	
	-- local tooltip = ISInventoryPaneContextMenu.addToolTip();
	-- tooltip.maxLineWidth = 1000

	-- if #replaceItems > 0 then
		-- tooltip.description = tooltip.description .. getText("Tooltip_ReplaceWornItems") .. " <LINE> <INDENT:20> ";
		-- for _,item in ipairs(replaceItems) do
			-- tooltip.description = tooltip.description .. item:getDisplayName() .. " <LINE> ";
		-- end
		-- tooltip.description = tooltip.description .. " <INDENT:0> ";
	-- end

	-- local font = ISToolTip.GetFont()

	-- local labelWidth = 0
	-- labelWidth = math.max(labelWidth, getTextManager():MeasureStringX(font, getText("Tooltip_BiteDefense") .. ":"));
	-- labelWidth = math.max(labelWidth, getTextManager():MeasureStringX(font, getText("Tooltip_ScratchDefense") .. ":"));
-- --	labelWidth = math.max(labelWidth, getTextManager():MeasureStringX(font, getText("Tooltip_CombatSpeed") .. ":"));

	-- local text;

	-- -- bite defense
	-- if newBiteDefense > 0 or previousBiteDefense > 0 then
		-- local r,g,b = 0,1,0;
		-- local plus = "+";
		-- if previousBiteDefense > 0 and previousBiteDefense > newBiteDefense then
			-- r,g,b = 1,0,0;
			-- plus = "";
		-- end
		-- text = string.format(" <RGB:%.2f,%.2f,%.2f> %s: <SETX:%d> %d (%s%d) <LINE> ",
			-- r, g, b, getText("Tooltip_BiteDefense"), labelWidth + 10,
			-- newBiteDefense,
			-- plus,
			-- newBiteDefense - previousBiteDefense);
		-- tooltip.description = tooltip.description .. text;
	-- end
	
	-- -- scratch defense
	-- if newScratchDefense > 0 or previousScratchDefense > 0 then
		-- local r,g,b = 0,1,0;
		-- local plus = "+";
		-- if previousScratchDefense > 0 and previousScratchDefense > newScratchDefense then
			-- r,g,b = 1,0,0;
			-- plus = "";
		-- end
		-- text = string.format(" <RGB:%.2f,%.2f,%.2f> %s: <SETX:%d> %d (%s%d) <LINE> ",
			-- r, g, b, getText("Tooltip_ScratchDefense"), labelWidth + 10,
			-- newScratchDefense,
			-- plus,
			-- newScratchDefense - previousScratchDefense);
		-- tooltip.description = tooltip.description .. text;
	-- end

-- --[[
	-- -- combat speed -- TODO: Better calcul!
	-- if previousCombatModifier > 0 and previousCombatModifier > newCombatModifier then
		-- text = " <RGB:0,1,0> " .. getText("Tooltip_CombatSpeed") .. ": +";
		-- text = " <RGB:1,0,0> " .. getText("Tooltip_CombatSpeed") .. ": ";
	-- end
	-- tooltip.description = tooltip.description ..  text .. newCombatModifier-previousCombatModifier;
-- --]]

	-- option.toolTip = tooltip;

	-- return replaceItems;
end

