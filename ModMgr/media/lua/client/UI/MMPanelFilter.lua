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

require('ISUI/ISPanelJoypad')

local ICON_FILTER_SAVE = getTexture("media/ui/MM_Button_FilterSave.png")
local ICON_FILTER_RESET = getTexture("media/ui/MM_Button_FilterReset.png")

local FONT_HGT_SMALL = getTextManager():getFontHeight(UIFont.Small)

local BUTTON_HGT = math.max(25, FONT_HGT_SMALL + 3 * 2)
local BUTTON_WDH = 100
local DX, DY = 8, 8

-- ******************************
-- MMPanelFilter
-- ******************************

MMPanelFilter = ISPanelJoypad:derive("MMPanelFilter")

function MMPanelFilter:new(x, y, width, height)
    local o = ISPanelJoypad:new(x, y, width, height)
    setmetatable(o, self)
    self.__index = self
    o.enable = true
    --[[
    o.settingsCategory
    ]]
    return o
end

function MMPanelFilter:setSettingsCategory(category)
    self.settingsCategory = category
end

function MMPanelFilter:setEnable(enable)
    self.enable = enable
    self.saveButton:setEnable(enable)
    self.resetButton:setEnable(enable)
    self.filter:setEnable(enable)
    self.order:setEnable(enable)
    self.search:setEnable(enable)
    self.searchEntryBox:setEditable(enable)
end

function MMPanelFilter:createChildren()
    self.filter = MMPanelCompact:new(DX, DY, self.width - BUTTON_HGT - 3 * DX, BUTTON_HGT)
    self:addChild(self.filter)
    self.filter.createText = function(S)
        local options, P = {}, S.parent

        if P.locationTickBox.selected[1] and not P.locationTickBox.selected[2] then
            table.insert(options, getText("UI_ModManager_Filter_Workshop"))
        elseif not P.locationTickBox.selected[1] and P.locationTickBox.selected[2] then
            table.insert(options, getText("UI_ModManager_Filter_Local"))
        end

        if P.mapTickBox.selected[1] and not P.mapTickBox.selected[2] then
            table.insert(options, getText("UI_ModManager_Filter_WithMap"))
        elseif not P.mapTickBox.selected[1] and P.mapTickBox.selected[2] then
            table.insert(options, getText("UI_ModManager_Filter_WithoutMap"))
        end

        if P.translateTickBox.selected[1] and not P.translateTickBox.selected[2] then
            table.insert(options, getText("UI_ModManager_Filter_WithTranslation"))
        elseif not P.translateTickBox.selected[1] and P.translateTickBox.selected[2] then
            table.insert(options, getText("UI_ModManager_Filter_WithoutTranslation"))
        end

        if P.availabilityTickBox.selected[1] and not P.availabilityTickBox.selected[2] then
            table.insert(options, getText("UI_ModManager_Filter_Available"))
        elseif not P.availabilityTickBox.selected[1] and P.availabilityTickBox.selected[2] then
            table.insert(options, getText("UI_ModManager_Filter_Broken"))
        end

        if P.statusTickBox.selected[1] and not P.statusTickBox.selected[2] then
            table.insert(options, getText("UI_ModManager_Filter_Enabled"))
        elseif not P.statusTickBox.selected[1] and P.statusTickBox.selected[2] then
            table.insert(options, getText("UI_ModManager_Filter_Disabled"))
        end

        if not P.favorTickBox.selected[1] or not P.favorTickBox.selected[2] or not P.favorTickBox.selected[3] then
            if P.favorTickBox.selected[1] then
                table.insert(options, getText("UI_ModManager_Filter_Normal"))
            end
            if P.favorTickBox.selected[2] then
                table.insert(options, getText("UI_ModManager_Filter_Favorites"))
            end
            if P.favorTickBox.selected[3] then
                table.insert(options, getText("UI_ModManager_Filter_Hidden"))
            end
        end

        if #options == 0 then
            S.text = getText("UI_ModManager_Filter_Off")
        else
            S.text = getText("UI_ModManager_Filter_On", table.concat(options, ", "))
        end
    end
    self.filter.popup.resize = function(S)
        local P = S.parentPanel.parent

        -- Update labels, counts and Width
        local all = P.parent.listBox.count
        local counters = P.parent.counters

        P.allButton:setTitle(string.format("%s [%d]", getText("UI_ModManager_Filter_Button_All"), all))

        P.locationTickBox.options[1] = string.format("%s [%d]", getText("UI_ModManager_Filter_Workshop"), counters.workshop)
        P.locationTickBox.optionsIndex[1] = P.locationTickBox.options[1]
        P.locationTickBox.options[2] = string.format("%s [%d]", getText("UI_ModManager_Filter_Local"), all - counters.workshop)
        P.locationTickBox.optionsIndex[2] = P.locationTickBox.options[2]
        P.locationTickBox:setWidthToFit()

        P.mapTickBox.options[1] = string.format("%s [%d]", getText("UI_ModManager_Filter_WithMap"), counters.map)
        P.mapTickBox.optionsIndex[1] = P.mapTickBox.options[1]
        P.mapTickBox.options[2] = string.format("%s [%d]", getText("UI_ModManager_Filter_WithoutMap"), all - counters.map)
        P.mapTickBox.optionsIndex[2] = P.mapTickBox.options[2]
        P.mapTickBox:setWidthToFit()

        P.translateTickBox.options[1] = string.format("%s [%d]", getText("UI_ModManager_Filter_WithTranslation"), counters.translated)
        P.translateTickBox.optionsIndex[1] = P.translateTickBox.options[1]
        P.translateTickBox.options[2] = string.format("%s [%d]", getText("UI_ModManager_Filter_WithoutTranslation"), all - counters.translated)
        P.translateTickBox.optionsIndex[2] = P.translateTickBox.options[2]
        P.translateTickBox:setWidthToFit()

        P.availabilityTickBox.options[1] = string.format("%s [%d]", getText("UI_ModManager_Filter_Available"), counters.available)
        P.availabilityTickBox.optionsIndex[1] = P.availabilityTickBox.options[1]
        P.availabilityTickBox.options[2] = string.format("%s [%d]", getText("UI_ModManager_Filter_Broken"), all - counters.available)
        P.availabilityTickBox.optionsIndex[2] = P.availabilityTickBox.options[2]
        P.availabilityTickBox:setWidthToFit()

        P.statusTickBox.options[1] = string.format("%s [%d]", getText("UI_ModManager_Filter_Enabled"), counters.enabled)
        P.statusTickBox.optionsIndex[1] = P.statusTickBox.options[1]
        P.statusTickBox.options[2] = string.format("%s [%d]", getText("UI_ModManager_Filter_Disabled"), all - counters.enabled)
        P.statusTickBox.optionsIndex[2] = P.statusTickBox.options[2]
        P.statusTickBox:setWidthToFit()

        P.favorTickBox.options[1] = string.format("%s [%d]", getText("UI_ModManager_Filter_Normal"), all - counters.favorites - counters.hidden)
        P.favorTickBox.optionsIndex[1] = P.favorTickBox.options[2]
        P.favorTickBox.options[2] = string.format("%s [%d]", getText("UI_ModManager_Filter_Favorites"), counters.favorites)
        P.favorTickBox.optionsIndex[2] = P.favorTickBox.options[1]
        P.favorTickBox.options[3] = string.format("%s [%d]", getText("UI_ModManager_Filter_Hidden"), counters.hidden)
        P.favorTickBox.optionsIndex[3] = P.favorTickBox.options[3]
        P.favorTickBox:setWidthToFit()

        -- Update coordinates
        P.allButton:setWidth(S.width - 2 * DX)

        local w = {
            P.locationTickBox.width,
            P.mapTickBox.width,
            P.translateTickBox.width,
            P.availabilityTickBox.width,
            P.statusTickBox.width,
            P.favorTickBox.width,
        }
        local w32 = math.max(w[1], w[4]) + math.max(w[2], w[5]) + math.max(w[3], w[6])
        local w23 = math.max(w[1], w[2], w[3]) + math.max(w[4], w[5], w[6])

        if w32 + 4 * DX <= S.width then
            -- 3 columns, 2 rows
            local x1 = (S.width - w32) / 4
            local x2 = x1 + math.max(w[1], w[4]) + x1
            local x3 = x2 + math.max(w[2], w[5]) + x1
            local y1 = P.allButton:getBottom() + DY
            P.locationTickBox:setX(x1)
            P.locationTickBox:setY(y1)
            P.mapTickBox:setX(x2)
            P.mapTickBox:setY(y1)
            P.translateTickBox:setX(x3)
            P.translateTickBox:setY(y1)
            local y2 = P.translateTickBox:getBottom() + DY
            P.availabilityTickBox:setX(x1)
            P.availabilityTickBox:setY(y2)
            P.statusTickBox:setX(x2)
            P.statusTickBox:setY(y2)
            P.favorTickBox:setX(x3)
            P.favorTickBox:setY(y2)
        elseif w23 + 3 * DX <= S.width then
            -- 2 columns, 3 rows
            local dx = (S.width - w23) / 3
            local x1 = (S.width - w23) / 3
            local x2 = x1 + math.max(w[1], w[2], w[3]) + x1
            local y1 = P.allButton:getBottom() + DY
            P.locationTickBox:setX(x1)
            P.locationTickBox:setY(y1)
            P.availabilityTickBox:setX(x2)
            P.availabilityTickBox:setY(y1)
            local y2 = P.availabilityTickBox:getBottom() + DY
            P.mapTickBox:setX(x1)
            P.mapTickBox:setY(y2)
            P.statusTickBox:setX(x2)
            P.statusTickBox:setY(y2)
            local y3 = P.statusTickBox:getBottom() + DY
            P.translateTickBox:setX(x1)
            P.translateTickBox:setY(y3)
            P.favorTickBox:setX(x2)
            P.favorTickBox:setY(y3)
        else
            -- 1 column, 6 rows
            local dx = (S.width - math.max(w[1], w[2], w[3], w[4], w[5], w[6])) / 2
            P.locationTickBox:setX(dx)
            P.locationTickBox:setY(P.allButton:getBottom() + DY)
            P.mapTickBox:setX(dx)
            P.mapTickBox:setY(P.locationTickBox:getBottom() + DY)
            P.translateTickBox:setX(dx)
            P.translateTickBox:setY(P.mapTickBox:getBottom() + DY)
            P.availabilityTickBox:setX(dx)
            P.availabilityTickBox:setY(P.translateTickBox:getBottom() + DY)
            P.statusTickBox:setX(dx)
            P.statusTickBox:setY(P.availabilityTickBox:getBottom() + DY)
            P.favorTickBox:setX(dx)
            P.favorTickBox:setY(P.statusTickBox:getBottom() + DY)
        end

        S:setHeight(P.favorTickBox:getBottom() + DY)
    end

    local allButton = MMButton:new(
            DX, DY, 0, BUTTON_HGT, "", self,
            function(target)
                target.locationTickBox.selected = { true, true }
                target.mapTickBox.selected = { true, true }
                target.translateTickBox.selected = { true, true }
                target.availabilityTickBox.selected = { true, true }
                target.statusTickBox.selected = { true, true }
                target.favorTickBox.selected = { true, true, true }
                target.filter.text = getText("UI_ModManager_Filter_Off")
                target.parent.listBox:updateFilter()
            end
    )
    allButton.borderColor = { r = 1, g = 1, b = 1, a = 0.1 }
    self.filter.popup:addChild(allButton)
    self.allButton = allButton

    local locationTickBox = MMTickBox:new(
            0, 0, 0, 0, nil, self.filter,
            function(target, optionIndex, optionValue, arg1, arg2, tickBox)
                if not optionValue then tickBox.selected[3 - optionIndex] = true end
                target:createText()
                target.parent.parent.listBox:updateFilter()
            end
    )
    locationTickBox:addOption("", "filterFromWorkshop")
    locationTickBox:addOption("", "filterFromLocal", getText("UI_ModManager_Filter_Local_Tooltip"))
    locationTickBox.selected = { true, true }
    self.filter.popup:addChild(locationTickBox)
    self.locationTickBox = locationTickBox

    local mapTickBox = MMTickBox:new(
            0, 0, 0, 0, nil, self.filter,
            function(target, optionIndex, optionValue, arg1, arg2, tickBox)
                if not optionValue then tickBox.selected[3 - optionIndex] = true end
                target:createText()
                target.parent.parent.listBox:updateFilter()
            end
    )
    mapTickBox:addOption("", "filterWithMaps", getText("UI_ModManager_Filter_WithMap_Tooltip"))
    mapTickBox:addOption("", "filterWithoutMaps")
    mapTickBox.selected = { true, true }
    self.filter.popup:addChild(mapTickBox)
    self.mapTickBox = mapTickBox

    local translateTickBox = MMTickBox:new(
            0, 0, 0, 0, nil, self.filter,
            function(target, optionIndex, optionValue, arg1, arg2, tickBox)
                if not optionValue then tickBox.selected[3 - optionIndex] = true end
                target:createText()
                target.parent.parent.listBox:updateFilter()
            end
    )
    translateTickBox:addOption("", "filterTranslated", getText("UI_ModManager_Filter_WithTranslation_Tooltip"))
    translateTickBox:addOption("", "filterNotTranslated")
    translateTickBox.selected = { true, true }
    self.filter.popup:addChild(translateTickBox)
    self.translateTickBox = translateTickBox

    local availabilityTickBox = MMTickBox:new(
            0, 0, 0, 0, nil, self.filter,
            function(target, optionIndex, optionValue, arg1, arg2, tickBox)
                if not optionValue then tickBox.selected[3 - optionIndex] = true end
                target:createText()
                target.parent.parent.listBox:updateFilter()
            end
    )
    availabilityTickBox:addOption("", "filterAvailable")
    availabilityTickBox:addOption("", "filterNotAvailable")
    availabilityTickBox.selected = { true, true }
    self.filter.popup:addChild(availabilityTickBox)
    self.availabilityTickBox = availabilityTickBox

    local statusTickBox = MMTickBox:new(
            0, 0, 0, 0, nil, self.filter,
            function(target, optionIndex, optionValue, arg1, arg2, tickBox)
                if not optionValue then tickBox.selected[3 - optionIndex] = true end
                target:createText()
                target.parent.parent.listBox:updateFilter()
            end
    )
    statusTickBox:addOption("", "filterActive")
    statusTickBox:addOption("", "filterNotActive")
    statusTickBox.selected = { true, true }
    self.filter.popup:addChild(statusTickBox)
    self.statusTickBox = statusTickBox

    local favorTickBox = MMTickBox:new(
            0, 0, 0, 0, nil, self.filter,
            function(target, optionIndex, optionValue, arg1, arg2, tickBox)
                if not tickBox.selected[1] and not tickBox.selected[2] and not tickBox.selected[3] then
                    tickBox.selected[1] = true
                end
                target:createText()
                target.parent.parent.listBox:updateFilter()
            end
    )
    favorTickBox:addOption("", "filterNormal")
    favorTickBox:addOption("", "filterFavorite")
    favorTickBox:addOption("", "filterHidden")
    favorTickBox.selected = { true, true, false }
    self.filter.popup:addChild(favorTickBox)
    self.favorTickBox = favorTickBox

    self.filter:createText()

    -- Order
    self.order = MMPanelCompact:new(DX, self.filter:getBottom() + DY, self.width - BUTTON_HGT - 3 * DX, BUTTON_HGT)
    self:addChild(self.order)
    self.order.createText = function(S)
        local P = S.parent
        local operator1, operator2 = "", ""

        for i, name in ipairs(P.orderBy.options) do
            if P.orderBy.selected[i] then
                operator1 = name
            end
        end
        for i, name in ipairs(P.orderAs.options) do
            if P.orderAs.selected[i] then
                operator2 = name
            end
        end

        S.text = getText("UI_ModManager_Order_By", operator1, operator2)
    end
    self.order.popup.resize = function(S)
        local P = S.parentPanel.parent

        local w = {
            P.orderBy.width,
            P.orderAs.width,
        }
        local w2 = w[1] + w[2]
        local x1 = (S.width - w2) / 3
        local x2 = x1 + math.max(w[1], w[2]) + x1

        P.orderBy:setX(x1)
        P.orderBy:setY(DY)
        P.orderAs:setX(x2)
        P.orderAs:setY(DY)

        S:setHeight(math.max(P.orderBy:getBottom(), P.orderAs:getBottom()) + DY)
    end

    local orderBy = MMTickBox:new(
            0, 0, 0, 0, nil, self.order,
            function(target, optionIndex, optionValue, arg1, arg2, tickBox)
                tickBox.selected[optionIndex] = true
                for i = 1, tickBox.optionCount do
                    if i ~= optionIndex then tickBox.selected[i] = false end
                end

                target:createText()
                target.parent.parent.listBox:updateFilter()
            end
    )
    orderBy:addOption(getText("UI_ModManager_Order_Name"), "orderName")
    orderBy:addOption(getText("UI_ModManager_Order_Enabled"), "orderActive")
    orderBy:addOption(getText("UI_ModManager_Order_Recent"), "orderRecent")
    orderBy:setWidthToFit()
    orderBy.selected = { true, false, false }
    self.order.popup:addChild(orderBy)
    self.orderBy = orderBy

    local orderAs = MMTickBox:new(
            0, 0, 0, 0, nil, self.order,
            function(target, optionIndex, optionValue, arg1, arg2, tickBox)
                if optionValue then
                    tickBox.selected = {}
                    tickBox.selected[optionIndex] = true
                    tickBox.selected[3 - optionIndex] = false
                else
                    tickBox.selected[optionIndex] = true
                    tickBox.selected[3 - optionIndex] = false
                end
                target:createText()
                target.parent.parent.listBox:updateFilter()
            end
    )
    orderAs:addOption(getText("UI_ModManager_Order_Asc"), "orderAsc")
    orderAs:addOption(getText("UI_ModManager_Order_Desc"), "orderDesc")
    orderAs:setWidthToFit()
    orderAs.selected = { true, false }
    self.order.popup:addChild(orderAs)
    self.orderAs = orderAs

    self.order:createText()

    -- Search
    self.search = MMPanelCompact:new(DX, self.order:getBottom() + DY, self.width - BUTTON_HGT - 3 * DX, BUTTON_HGT)
    self:addChild(self.search)
    self.search.recalcChildren = function(S)
        local w = math.max(S.width - (10 + getTextManager():MeasureStringX(S.font, S.text) + 5 + 18), BUTTON_WDH)
        S.parent.searchEntryBox:setX(S.width - (w + 18))
        S.parent.searchEntryBox:setWidth(w)
    end
    self.search.createText = function(S)
        local options, P = {}, S.parent
        local operator1, operator2 = "", ""

        for i, name in ipairs(P.searchBy1.options) do
            if P.searchBy1.selected[i] then table.insert(options, name) end
        end
        for i, name in ipairs(P.searchBy2.options) do
            if P.searchBy2.selected[i] then table.insert(options, name) end
        end
        for i, name in ipairs(P.searchAs1.options) do
            if P.searchAs1.selected[i] then
                operator1 = getText("UI_ModManager_Search_OR")
                operator2 = name
            end
        end
        for i, name in ipairs(P.searchAs2.options) do
            if P.searchAs2.selected[i] then
                operator1 = getText("UI_ModManager_Search_AND")
                operator2 = name
            end
        end

        S.text = getText("UI_ModManager_Search_By", table.concat(options, operator1), operator2)
        S:recalcChildren()
    end
    self.search.popup.resize = function(S)
        local P = S.parentPanel.parent

        local w = {
            P.searchBy1.width,
            P.searchBy2.width,
            P.searchAs1.width,
            P.searchAs2.width,
        }
        local w12 = math.max(w[1], w[2])
        local w34 = math.max(w[3], w[4])

        if w[1] + w[2] + w[3] + w[4] + 5 * DX <= S.width then
            local dx = (S.width - (w[1] + w[2] + w[3] + w[4] + 5 * DX)) / 3
            P.searchBy1:setX(DX + dx)
            P.searchBy1:setY(DY)
            P.searchBy2:setX(P.searchBy1:getRight() + DX)
            P.searchBy2:setY(DY)
            P.searchAs1:setX(P.searchBy2:getRight() + DX + dx)
            P.searchAs1:setY(DY)
            P.searchAs2:setX(P.searchAs1:getRight() + DX)
            P.searchAs2:setY(DY)
        elseif w12 + w34 + 3 * DX <= S.width then
            local x1 = (S.width - (w12 + w34)) / 3
            local x2 = x1 + w12 + x1
            P.searchBy1:setX(x1)
            P.searchBy1:setY(DY)
            P.searchBy2:setX(x1)
            P.searchBy2:setY(P.searchBy1:getBottom() + DY)
            P.searchAs1:setX(x2)
            P.searchAs1:setY(DY)
            P.searchAs2:setX(x2)
            P.searchAs2:setY(P.searchAs1:getBottom() + DY)
        else
            local x = (S.width - math.max(w12, w34)) / 2
            P.searchBy1:setX(x)
            P.searchBy1:setY(DY)
            P.searchBy2:setX(x)
            P.searchBy2:setY(P.searchBy1:getBottom() + DY)
            P.searchAs1:setX(x)
            P.searchAs1:setY(P.searchBy2:getBottom() + DY)
            P.searchAs2:setX(x)
            P.searchAs2:setY(P.searchAs1:getBottom() + DY)
        end

        S:setHeight(math.max(P.searchBy2:getBottom(), P.searchAs2:getBottom()) + DY)
    end

    local searchBy1 = MMTickBox:new(
            0, 0, 0, 0, nil, self.search,
            function(target, optionIndex, optionValue, arg1, arg2, tickBox)
                if optionValue then
                    target.parent.searchBy2.selected = {}
                    target.parent.searchEntryBox.options = {}
                elseif not (tickBox.selected[1] or tickBox.selected[2] or tickBox.selected[3]) then
                    tickBox.selected[optionIndex] = true
                end
                target:createText()
                target.parent.parent.listBox:updateFilter()
            end
    )
    searchBy1:addOption(getText("UI_ModManager_Search_Name"))
    searchBy1:addOption(getText("UI_ModManager_Search_Description"))
    searchBy1:addOption(getText("UI_ModManager_Search_ModID"))
    searchBy1:setWidthToFit()
    searchBy1.selected = { true, true, true }
    self.search.popup:addChild(searchBy1)
    self.searchBy1 = searchBy1

    local searchBy2 = MMTickBox:new(
            0, 0, 0, 0, nil, self.search,
            function(target, optionIndex, optionValue, arg1, arg2, tickBox)
                if optionValue then
                    target.parent.searchBy1.selected = {}
                    tickBox.selected = {}
                    tickBox.selected[optionIndex] = true

                    target.parent.searchEntryBox.options = {}
                    if optionIndex == 3 then
                        local tags = {}
                        for i, j in pairs(target.parent.parent.counters.originalTags) do
                            tags[i] = j
                        end
                        for i, j in pairs(target.parent.parent.counters.customTags) do
                            tags[i] = (tags[i] or 0) + j
                        end
                        for i, j in pairs(tags) do
                            target.parent.searchEntryBox:addOption(i, j)
                        end
                    elseif optionIndex == 4 then
                        for i, j in pairs(target.parent.parent.counters.authors) do
                            target.parent.searchEntryBox:addOption(i, j)
                        end
                    end
                else
                    tickBox.selected[optionIndex] = true
                end
                target:createText()
                target.parent.parent.listBox:updateFilter()
            end
    )
    searchBy2:addOption(getText("UI_ModManager_Search_WorkshopID"))
    searchBy2:addOption(getText("UI_ModManager_Search_MapID"))
    searchBy2:addOption(getText("UI_ModManager_Search_Tags"))
    searchBy2:addOption(getText("UI_ModManager_Search_Author"))
    searchBy2:setWidthToFit()
    searchBy2.selected = {}
    self.search.popup:addChild(searchBy2)
    self.searchBy2 = searchBy2

    local searchAs1 = MMTickBox:new(
            0, 0, 0, 0, nil, self.search,
            function(target, optionIndex, optionValue, arg1, arg2, tickBox)
                if optionValue then
                    target.parent.searchEntryBox:setVisible(not (optionIndex == 3))
                    target.parent.searchAs2.selected = {}
                    tickBox.selected = {}
                    tickBox.selected[optionIndex] = true
                else
                    tickBox.selected[optionIndex] = true
                end
                target:createText()
                target.parent.parent.listBox:updateFilter()
            end
    )
    searchAs1:addOption(getText("UI_ModManager_Search_Equals"))
    searchAs1:addOption(getText("UI_ModManager_Search_Contains"))
    searchAs1:addOption(getText("UI_ModManager_Search_Empty"))
    searchAs1:setWidthToFit()
    searchAs1.selected = { false, true, false }
    self.search.popup:addChild(searchAs1)
    self.searchAs1 = searchAs1

    local searchAs2 = MMTickBox:new(
            0, 0, 0, 0, nil, self.search,
            function(target, optionIndex, optionValue, arg1, arg2, tickBox)
                if optionValue then
                    target.parent.searchEntryBox:setVisible(not (optionIndex == 3))
                    target.parent.searchAs1.selected = {}
                    tickBox.selected = {}
                    tickBox.selected[optionIndex] = true
                else
                    tickBox.selected[optionIndex] = true
                end
                target:createText()
                target.parent.parent.listBox:updateFilter()
            end
    )
    searchAs2:addOption(getText("UI_ModManager_Search_notEquals"))
    searchAs2:addOption(getText("UI_ModManager_Search_notContains"))
    searchAs2:addOption(getText("UI_ModManager_Search_notEmpty"))
    searchAs2:setWidthToFit()
    searchAs2.selected = {}
    self.search.popup:addChild(searchAs2)
    self.searchAs2 = searchAs2

    self.searchEntryBox = MMTextEntryList:new("", 0, 3, 0, self.search.height - 6)
    self.search:addChild(self.searchEntryBox)
    self.searchEntryBox:setClearButton(true)
    self.searchEntryBox.onTextChange = function(S)
        S.parent.parent.parent.listBox:updateFilter()
    end

    self.search:createText()

    -- Reset filter
    self:resetFilter()

    -- Buttons
    local btnHeight = (self.height - DY * 3) / 2
    self.saveButton = MMImageButton:new(self.filter:getRight() + DX, DY, BUTTON_HGT, btnHeight,
            self,
            function(target)
                target:updateSettings()
                ModManager.instance:saveSettings()
            end
    )
    self.saveButton:setImage(ICON_FILTER_SAVE)
    self.saveButton:setPadding(DX, DY)
    self.saveButton.textureColor = { r = 0.8, g = 0.8, b = 0.8, a = 1 }
    self.saveButton.textureColorMouseOver = { r = 0.6, g = 0.6, b = 0.6, a = 1 }
    self.saveButton.tooltip = getText("UI_ModManager_Filter_Button_Save_Tooltip")
    self:addChild(self.saveButton)

    self.resetButton = MMImageButton:new(
            self.filter:getRight() + DX, self.saveButton:getBottom() + DY, BUTTON_HGT, btnHeight,
            self,
            function(target)
                target:resetFilter(false)
            end
    )
    self.resetButton:setOnLongPressFunc(
            function(target)
                target:resetFilter(true)
            end
    )
    self.resetButton:setImage(ICON_FILTER_RESET)
    self.resetButton:setPadding(DX, DY)
    self.resetButton.textureColor = { r = 0.8, g = 0.8, b = 0.8, a = 1 }
    self.resetButton.textureColorMouseOver = { r = 0.6, g = 0.6, b = 0.6, a = 1 }
    self.resetButton.tooltip = getText("UI_ModManager_Filter_Button_Reset_Tooltip")
    self:addChild(self.resetButton)
end

function MMPanelFilter:onResolutionChange()
    self.filter:setWidth(self.width - BUTTON_HGT - 3 * DX)
    self.order:setWidth(self.width - BUTTON_HGT - 3 * DX)
    self.search:setWidth(self.width - BUTTON_HGT - 3 * DX)
    self.search:recalcChildren()
    self.searchEntryBox:setHeight(self.search.height - 6)
    self.saveButton:setX(self.filter:getRight() + DX)
    self.resetButton:setX(self.filter:getRight() + DX)
end

function MMPanelFilter:render()
    ISPanelJoypad.render(self)

    if not self.enable then
        self:drawRect(1, 1, self.width - 2, self.height - 2, 0.3, 0, 0, 0)
    end
end

function MMPanelFilter:resetFilter(applyDefault)
    --if applyDefault then
    --    self.locationTickBox.selected = { true, true }
    --    self.mapTickBox.selected = { true, true }
    --    self.translateTickBox.selected = { true, true }
    --    self.availabilityTickBox.selected = { true, true }
    --    self.statusTickBox.selected = { true, true }
    --    self.favorTickBox.selected = { true, true, false }
    --    self.orderBy.selected = { true, false, false }
    --    self.orderAs.selected = { true, false }
    --else
        local manager = ModManager.instance
        manager:setTickBoxSelectionFromSettings(self.locationTickBox, self.settingsCategory, applyDefault)
        manager:setTickBoxSelectionFromSettings(self.mapTickBox, self.settingsCategory, applyDefault)
        manager:setTickBoxSelectionFromSettings(self.translateTickBox, self.settingsCategory, applyDefault)
        manager:setTickBoxSelectionFromSettings(self.availabilityTickBox, self.settingsCategory, applyDefault)
        manager:setTickBoxSelectionFromSettings(self.statusTickBox, self.settingsCategory, applyDefault)
        manager:setTickBoxSelectionFromSettings(self.favorTickBox, self.settingsCategory, applyDefault)
        manager:setTickBoxSelectionFromSettings(self.orderBy, self.settingsCategory, applyDefault)
        manager:setTickBoxSelectionFromSettings(self.orderAs, self.settingsCategory, applyDefault)
    --end
    self.searchBy1.selected = { true, true, true }
    self.searchBy2.selected = {}
    self.searchAs1.selected = { false, true, false }
    self.searchAs2.selected = {}
    self.searchEntryBox:setText("")

    if self.parent and self.parent.listBox then
        self.parent.listBox:updateFilter()
    end

    self.filter:createText()
    self.order:createText()
    self.search:createText()
end

function MMPanelFilter:updateSettings()
    local manager = ModManager.instance
    manager:updateSettingsFromTickBox(self.locationTickBox, self.settingsCategory)
    manager:updateSettingsFromTickBox(self.mapTickBox, self.settingsCategory)
    manager:updateSettingsFromTickBox(self.translateTickBox, self.settingsCategory)
    manager:updateSettingsFromTickBox(self.availabilityTickBox, self.settingsCategory)
    manager:updateSettingsFromTickBox(self.statusTickBox, self.settingsCategory)
    manager:updateSettingsFromTickBox(self.favorTickBox, self.settingsCategory)
    manager:updateSettingsFromTickBox(self.orderBy, self.settingsCategory)
    manager:updateSettingsFromTickBox(self.orderAs, self.settingsCategory)
end