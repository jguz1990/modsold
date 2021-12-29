EggonsMU.config.enableEvent("OnBeforeFirstInventoryTooltipDisplay")

local function isBookRedundant(item, identifier)
    local skill = item:getSkillTrained()
    if skill then
        local maxLevel = item:getMaxLevelTrained()
        -- print("skill", skill)
        local currentLevel = getPlayer():getPerkLevel(Perks[skill])
        if currentLevel >= maxLevel then
            EHIFTB.memory.redundantBooks[identifier] = true
            return true
        end
    end
    return false
end

local function isMagazineRedundant(magazine, identifier)
    local taughtRecipes = magazine:getTeachedRecipes()
    if getPlayer():getKnownRecipes():containsAll(taughtRecipes) then
        EHIFTB.memory.redundantBooks[identifier] = true
        return true
    end
    return false
end

local function createTooltip(item)
    local foundBooks = EHIFTB.memory.rememberedBooks
    local fullType = item:getFullType()
    local identifier = EHIFTB.getItemIdentifier(item)
    local foundBook = foundBooks[identifier]
    local itemName
    local staticModel = item:getStaticModel()
    if staticModel == "Book" then
        itemName = "book"
        if isBookRedundant(item, identifier) then
            return "I know all of this already!"
        end
    elseif staticModel == "Magazine" then
        itemName = "magazine"
        if not foundBook then
            if isMagazineRedundant(item, identifier) then
                return "I know all of this already!"
            end
        end
    elseif (item.getMap and item:getMap()) or (item.IsMap and item:IsMap()) then
        itemName = "map"
    elseif item:isRecordedMedia() then
        local mediaDataType = item:getMediaData():getMediaType()
        if mediaDataType == 0 then
            itemName = "CD"
        elseif mediaDataType == 1 then
            itemName = "tape"
        end
    else
        itemName = "item"
    end
    if not foundBook then
        return EHIFTB.Options.notFoundPrefix ..
            "Haven't found this " .. itemName .. " yet." .. EHIFTB.Options.notFoundSuffix
    end
    local currentlyInText = ""
    local currentlyOutText = ""
    local currentlyInCount = 0
    local currentlyOutCount = 0
    local output = EHIFTB.Options.foundPrefix .. "Found this " .. itemName .. " already." .. EHIFTB.Options.foundSuffix
    return output
end

function EHIFTB.prepareTooltipData(item, self)
    if EHIFTB.isValidEHIFTBItem(item, "showTooltip") then
        local newTooltip = createTooltip(item)
        item:setTooltip(newTooltip)
    end
end

Events.OnBeforeFirstInventoryTooltipDisplay.Add(EHIFTB.prepareTooltipData)

local function drawText(self)
    self:drawText(
        self.EHIFTB.message,
        16,
        self.EHIFTB.tooltipStartY,
        self.EHIFTB.red,
        self.EHIFTB.green,
        self.EHIFTB.blue,
        1,
        self.EHIFTB.font
    )
end
local function drawBorder(self)
    self:drawRectBorder(
        0,
        0,
        self.width,
        self.height,
        self.borderColor.a,
        self.EHIFTB.red,
        self.EHIFTB.green,
        self.EHIFTB.blue
    )
end

local function tooltipRender(self)
    self.EHIFTB = self.EHIFTB or {}
    if EHIFTB.isValidEHIFTBItem(self.item, "showTooltip") then
        self.EHIFTB.lastItem = self.item
        self.EHIFTB.font = ISToolTip.GetFont()
        self.EHIFTB.message = self.item:getTooltip()

        self.EHIFTB.lineHeight = getTextManager():getFontFromEnum(self.EHIFTB.font):getLineHeight()
        self.EHIFTB.numberOfTooltipLines = math.floor((self.height / self.EHIFTB.lineHeight) + 0.5)
        self.EHIFTB.tooltipStartY = self.height - self.EHIFTB.lineHeight - 5

        self.EHIFTB.blue = 0
        self:EHIFTB_Store_render()
        if EHIFTB.isItemMemorized(self.item) then
            self.EHIFTB.green = 1
            self.EHIFTB.red = 0
            if EHIFTB.Options.colorTooltipText and EHIFTB.Options.colorTooltipText_positive then
                drawText(self)
            end
            if EHIFTB.Options.colorTooltipBorder and EHIFTB.Options.colorTooltipText_positive then
                drawBorder(self)
            end
        else
            self.EHIFTB.green = 0
            self.EHIFTB.red = 1
            if EHIFTB.Options.colorTooltipText then
                drawText(self)
            end
            if EHIFTB.Options.colorTooltipBorder then
                drawBorder(self)
            end
        end
    else
        self:EHIFTB_Store_render()
    end
end

function EHIFTB.initTooltipOverride()
    print("initTooltipOverride")
    ISToolTipInv.EHIFTB_Store_render = ISToolTipInv.render
    ISToolTipInv.render = tooltipRender
end

function EHIFTB.disableTooltipOverride()
    print("disableTooltipOverride")
    ISToolTipInv.render = ISToolTipInv.EHIFTB_Store_render
    ISToolTipInv.EHIFTB_Store_render = nil
end

if EHIFTB.Options.colorTooltipText or EHIFTB.Options.colorTooltipBorder then
    EHIFTB.initTooltipOverride()
end
