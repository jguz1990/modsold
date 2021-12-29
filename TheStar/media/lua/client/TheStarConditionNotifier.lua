---
--- Mod: Weapon Condition Indicator
--- Workshop: https://steamcommunity.com/sharedfiles/filedetails/?id=2619072426
--- Author: NoctisFalco
--- Profile: https://steamcommunity.com/id/NoctisFalco/
---
--- Redistribution of this mod without explicit permission from the original creator is prohibited
--- under any circumstances. This includes, but not limited to, uploading this mod to the Steam Workshop
--- or any other site, distribution as part of another mod or modpack, distribution of modified versions.
--- You are free to do whatever you want with the mod provided you do not upload any part of it anywhere.
---
--- The QualityStar_n.png icons are the property of The Indie Stone.
--- The mod overrides parts of the ISHotbar.lua, ISEquippedItem.lua files by The Indie Stone.
---

TheStar = TheStar or {}
TheStar.ConditionNotifier = TheStar.ConditionNotifier or {}

-- Ticks passed since previous condition check
local ticksPassed
local previousConditionLevel

local function checkCondition(player, item)
    if item then
        if TheStar.Utils.isHandWeapon(item) and player:isLocalPlayer() then
            local conditionLevel =  item:getCondition() / item:getConditionMax()
            if conditionLevel < 0.0 then conditionLevel = 0.0 end
            if conditionLevel > 1.0 then conditionLevel = 1.0 end

            if not previousConditionLevel then previousConditionLevel = conditionLevel end
            -- Item was repaired
            if conditionLevel > previousConditionLevel then previousConditionLevel = conditionLevel end
            if conditionLevel < previousConditionLevel and conditionLevel <= TheStar.Options.overheadNotificationCondition then
                previousConditionLevel = conditionLevel
                HaloTextHelper.addTextWithArrow(player, item:getDisplayName(), false, HaloTextHelper.getColorRed())
            end
        end
    end
end

local function onTick()
    ticksPassed = ticksPassed + 1
    if (ticksPassed < 20) then return end

    ticksPassed = 0
    checkCondition(getPlayer(), getPlayer():getPrimaryHandItem())
end

local function onEquipPrimary(player, item)
    if item then
        if TheStar.Utils.isHandWeapon(item) and player:isLocalPlayer() then
            checkCondition(player, item)
            ticksPassed = 0
            Events.OnTick.Add(onTick)
            return
        end
    end

    previousConditionLevel = nil
    Events.OnTick.Remove(onTick)
end

function TheStar.ConditionNotifier.init()
    if TheStar.Options.showOverheadNotification then
        Events.OnEquipPrimary.Add(onEquipPrimary)
        --[[
        The OnEquipPrimary event will only be triggered for an item that has been equipped only after the save has loaded,
        therefore the notification will not be displayed for an item that has already been equipped.
        --]]
        if getPlayer() then
            onEquipPrimary(getPlayer(), getPlayer():getPrimaryHandItem())
        end
    else
        previousConditionLevel = nil
        Events.OnEquipPrimary.Remove(onEquipPrimary)
        Events.OnTick.Remove(onTick)
    end
end

Events.OnGameStart.Add(TheStar.ConditionNotifier.init)