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

require('UI/MMButton')

-- ******************************
-- MMImageButton
-- ******************************

MMImageButton = MMButton:derive("MMImageButton")

function MMImageButton:new(x, y, width, height, clickTarget, onClick, onMouseDown, allowMouseUpProcessing)
    local o = MMButton:new(x, y, width, height, "", clickTarget, onClick, onMouseDown, allowMouseUpProcessing)
    setmetatable(o, self)
    self.__index = self
    o.displayBackground = false
    o.borderColor = { r = 0.4, g = 0.4, b = 0.4, a = 1 }
    o.backgroundColor = { r = 0, g = 0, b = 0, a = 1 }
    o.backgroundColorMouseOver = { r = 0.3, g = 0.3, b = 0.3, a = 1 }
    o.textureColor = { r = 1, g = 1, b = 1, a = 1 }
    o.textureColorMouseOver = { r = 0.7, g = 0.7, b = 0.7, a = 1 }
    o.padX = 0
    o.padY = 0
    return o
end

function MMImageButton:prerender()
    if not self.enable and self.tooltipUI and self.tooltipUI:isVisible() then
        self.tooltipUI:setVisible(false)
        self.tooltipUI:removeFromUIManager()
    else
        self:updateTooltip()
    end
end

function MMImageButton:render()
    self.fade:setFadeIn((self.mouseOver and self:isMouseOver()) and self.enable or self.joypadFocused or false)
    self.fade:update()
    if self.displayBackground then
        local f = self.fade:fraction()
        local fill = self.backgroundColorMouseOver
        if self.pressed then
            self.backgroundColorPressed = self.backgroundColorPressed or {}
            self.backgroundColorPressed.r = self.backgroundColorMouseOver.r * 0.5
            self.backgroundColorPressed.g = self.backgroundColorMouseOver.g * 0.5
            self.backgroundColorPressed.b = self.backgroundColorMouseOver.b * 0.5
            self.backgroundColorPressed.a = self.backgroundColorMouseOver.a
            fill = self.backgroundColorPressed
        end
        self:drawRect(0, 0, self.width, self.height,
                fill.a * f + self.backgroundColor.a * (1 - f),
                fill.r * f + self.backgroundColor.r * (1 - f),
                fill.g * f + self.backgroundColor.g * (1 - f),
                fill.b * f + self.backgroundColor.b * (1 - f));
        self:drawRectBorder(0, 0, self.width, self.height, self.borderColor.a, self.borderColor.r, self.borderColor.g, self.borderColor.b);
    end
    if self.image ~= nil then
        local f = self.fade:fraction()
        local fill = self.textureColorMouseOver
        if self.pressed then
            self.textureColorPressed = self.textureColorPressed or {}
            self.textureColorPressed.r = self.textureColorMouseOver.r * 0.5
            self.textureColorPressed.g = self.textureColorMouseOver.g * 0.5
            self.textureColorPressed.b = self.textureColorMouseOver.b * 0.5
            self.textureColorPressed.a = self.textureColorMouseOver.a
            fill = self.textureColorPressed
        end

        self:drawTextureScaledAspect(
                self.image, self.padX / 2, self.padY / 2, self.width - self.padX, self.height - self.padY,
                fill.a * f + self.textureColor.a * (1 - f),
                fill.r * f + self.textureColor.r * (1 - f),
                fill.g * f + self.textureColor.g * (1 - f),
                fill.b * f + self.textureColor.b * (1 - f)
        )
    end
    -- Call the onMouseOverFunction
    if self.mouseOver and self.onmouseover then
        self.onmouseover(self.target, self)
    end
end

function MMImageButton:setPadding(padX, padY)
    self.padX, self.padY = padX, padY
end

function MMImageButton:setEnable(bEnabled)
    self.enable = bEnabled
    if not self.textureColorNormal then
        self.textureColorNormal = { r = self.textureColor.r, g = self.textureColor.g, b = self.textureColor.b, a = self.textureColor.a }
    end
    if not self.borderColorEnabled then
        self.borderColorEnabled = { r = self.borderColor.r, g = self.borderColor.g, b = self.borderColor.b, a = self.borderColor.a }
    end
    if bEnabled then
        self:setTextureRGBA(
                self.textureColorNormal.r,
                self.textureColorNormal.g,
                self.textureColorNormal.b,
                self.textureColorNormal.a)
        self:setBorderRGBA(
                self.borderColorEnabled.r,
                self.borderColorEnabled.g,
                self.borderColorEnabled.b,
                self.borderColorEnabled.a)
    else
        self:setTextureRGBA(0.3, 0.3, 0.3, 1.0)
        --self:setBorderRGBA(0.7, 0.1, 0.1, 0.7)
        self:setBorderRGBA(1, 1, 1, 0.1)
    end
end