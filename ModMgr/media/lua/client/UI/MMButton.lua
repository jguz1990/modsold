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

require('ISUI/ISButton')

-- ******************************
-- MMButton
-- ******************************

MMButton = ISButton:derive("MMButton")

function MMButton:new(x, y, width, height, text, clickTarget, onClick, onMouseDown, allowMouseUpProcessing)
    local o = ISButton:new(x, y, width, height, text, clickTarget, onClick, onMouseDown, allowMouseUpProcessing)
    setmetatable(o, self)
    self.__index = self
    o.borderColor = { r = 0.4, g = 0.4, b = 0.4, a = 1 }
    --[[
    o.onLongPressFunc = function
    o.processedLongPress = false/true
    ]]
    return o
end

function MMButton:setOnLongPressFunc(func)
    self.onLongPressFunc = func
end

function MMButton:setEnable(bEnabled)
    self.enable = bEnabled
    if not self.borderColorEnabled then
        self.borderColorEnabled = { r = self.borderColor.r, g = self.borderColor.g, b = self.borderColor.b, a = self.borderColor.a }
    end
    if bEnabled then
        self:setTextureRGBA(1, 1, 1, 1)
        self:setBorderRGBA(
                self.borderColorEnabled.r,
                self.borderColorEnabled.g,
                self.borderColorEnabled.b,
                self.borderColorEnabled.a)
    else
        self:setTextureRGBA(0.3, 0.3, 0.3, 1.0)
        self:setBorderRGBA(1, 1, 1, 0.1)
    end
end

function MMButton:update()
    ISUIElement.update(self)
    if self.enable and self.pressed and self.target and self.onLongPressFunc and not self.processedLongPress then
        if not self.pressedTime then
            self.pressedTime = getTimestampMs()
        else
            local ms = getTimestampMs()
            if ms - self.pressedTime > 500 then
                self.pressedTime = ms
                self.processedLongPress = true
                self:forceClick()
            end
        end
    else
        self.pressedTime = nil
    end
end

function MMButton:onMouseUp(x, y)
    if not self:getIsVisible() then
        return
    end

    local process = false
    if self.pressed == true then
        process = true
    end
    self.pressed = false
    if self.onclick == nil then
        return
    end
    if self.enable and not self.processedLongPress and (process or self.allowMouseUpProcessing) then
        getSoundManager():playUISound(self.sounds.activate)
        self.onclick(self.target, self, self.onClickArgs[1], self.onClickArgs[2], self.onClickArgs[3], self.onClickArgs[4])
    end
    self.processedLongPress = false
end

function MMButton:forceClick()
    if not self:getIsVisible() or not self.enable then
        return
    end

    getSoundManager():playUISound(self.sounds.activate)

    if self.processedLongPress then
        self.onLongPressFunc(self.target, self)
        return
    end
    self.onclick(self.target, self, self.onClickArgs[1], self.onClickArgs[2], self.onClickArgs[3], self.onClickArgs[4])
end