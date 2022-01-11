---
--- Mod: Mod Manager
--- Workshop: https://steamcommunity.com/sharedfiles/filedetails/?id=2694448564
--- Author: NoctisFalco
--- Profile: https://steamcommunity.com/id/NoctisFalco/
---
--- Redistribution of this mod without explicit permission from the creator is prohibited
--- under any circumstances. This includes, but not limited to, uploading this mod to the Steam Workshop
--- or any other site, distribution as part of another mod or modpack, distribution of modified versions.
---

require('ISUI/ISTickBox')

-- ******************************
-- MMTickBox
-- ******************************

MMTickBox = ISTickBox:derive("MMTickBox")

function MMTickBox:new(x, y, width, height, name, changeOptionTarget, changeOptionMethod, changeOptionArg1, changeOptionArg2)
    local o = ISTickBox:new(x, y, width, height, name, changeOptionTarget, changeOptionMethod, changeOptionArg1, changeOptionArg2)
    setmetatable(o, self)
    self.__index = self
    o.choicesColor = { r = 1, g = 1, b = 1, a = 1 }
    o.optionTooltip = {}
    return o
end

function MMTickBox:render()
    ISTickBox.render(self)

    if self.enable and self:isMouseOver() and self.mouseOverOption and self.mouseOverOption ~= 0
            and not self.disabledOptions[self.optionsIndex[self.mouseOverOption]]
            and self.optionTooltip[self.mouseOverOption] then
        local text = self.optionTooltip[self.mouseOverOption]

        if not self.tooltipRender then
            self.tooltipRender = ISToolTip:new()
            self.tooltipRender:setOwner(self)
            self.tooltipRender:setVisible(false)
            self.tooltipRender:setAlwaysOnTop(true)
        end
        if not self.tooltipRender:getIsVisible() then
            self.tooltipRender.maxLineWidth = 300
            self.tooltipRender:addToUIManager()
            self.tooltipRender:setVisible(true)
        end
        self.tooltipRender.description = text
        local y = self:getAbsoluteY() + self.itemHgt * self.mouseOverOption + 8
        self.tooltipRender:setDesiredPosition(getMouseX(), y)
    else
        if self.tooltipRender and self.tooltipRender:getIsVisible() then
            self.tooltipRender:setVisible(false)
            self.tooltipRender:removeFromUIManager()
        end
    end
end

function MMTickBox:clearOptions()
    ISTickBox.clearOptions(self)
    self.optionTooltip = {}
end

function MMTickBox:addOption(name, data, tooltip)
    self.optionTooltip[self.optionCount] = tooltip
    -- name, data, texture
    return ISTickBox.addOption(self, name, data, nil)
end