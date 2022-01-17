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

require('ISUI/ISModalDialog')

-- ******************************
-- MMModalDialog
-- ******************************

MMModalDialog = ISModalDialog:derive("MMModalDialog")

function MMModalDialog.show(text, centered, yesNo, x, y, width, height, target, onclick, param1, param2)
    local modal = MMModalDialog:new(text, centered, yesNo, x, y, width, height, target, onclick, param1, param2)
    modal:initialise()
    modal:addToUIManager()
    return modal
end

function MMModalDialog:new(text, centered, yesNo, x, y, width, height, target, onclick, param1, param2)
    x = x or 0
    y = y or 0
    width = width or 230
    height = height or 120
    if centered then
        x = getCore():getScreenWidth() * 0.5 - width * 0.5
        y = getCore():getScreenHeight() * 0.5 - height * 0.5
    end
    local o = ISModalDialog:new(x, y, width, height, text, yesNo, target, onclick, nil, param1, param2)
    setmetatable(o, self)
    self.__index = self
    o.backgroundColor = { r = 0, g = 0, b = 0, a = 1 }
    o.isCancelable = true
    return o
end

function MMModalDialog:initialise()
    ISModalDialog.initialise(self)

    self:setAlwaysOnTop(true)
    self:setCapture(true)
end

function MMModalDialog:onMouseDown(x, y)
    if not self:isMouseOver() then
        if self.isCancelable then
            self:destroy()
        end
    else
        ISModalDialog.onMouseDown(self, x, y)
    end
end