---
--- Mod: AutoSmoke
--- Workshop: https://steamcommunity.com/sharedfiles/filedetails/?id=2643751872
--- Author: NoctisFalco
--- Profile: https://steamcommunity.com/id/NoctisFalco/
---
--- Redistribution of this mod without explicit permission from the original creator is prohibited
--- under any circumstances. This includes, but not limited to, uploading this mod to the Steam Workshop
--- or any other site, distribution as part of another mod or modpack, distribution of modified versions.
--- You are free to do whatever you want with the mod provided you do not upload any part of it anywhere.
---

AutoSmoke = AutoSmoke or {}
AutoSmoke.supportedMods = {}
AutoSmoke.activeMod = {}
AutoSmoke.currentAction = nil

local nextCheckTime = 0
local previousTimeMultiplier = 1
local stressThreshold = 0.23

function AutoSmoke:smoke(cigarette)
    local itemRequired
    local itemRequiredSrcContainer
    ISInventoryPaneContextMenu.transferIfNeeded(self.player, cigarette)
    if cigarette:getRequireInHandOrInventory() then
        local types = cigarette:getRequireInHandOrInventory()
        for i = 1, types:size() do
            local fullType = moduleDotType(cigarette:getModule(), types:get(i - 1))
            itemRequired = self.player:getInventory():getFirstType(fullType)
            if not itemRequired then
                itemRequired = self.player:getInventory():getBestTypeEvalRecurse(fullType, AutoSmoke.Utils.drainableComparator)
            end
            if itemRequired then
                itemRequiredSrcContainer = itemRequired:getContainer()
                ISInventoryPaneContextMenu.transferIfNeeded(self.player, itemRequired)
                break
            end
        end
        if not itemRequired then
            if AutoSmoke.Options.characterSpeaks then
                AutoSmoke.Speak.noFireSource()
                AutoSmoke.pressedKey = false
            end
            return
        end
    end
    self.currentAction = AutoSmokePuffAction:new(self.player, cigarette, 1)
    ISTimedActionQueue.add(self.currentAction)
    if itemRequired and itemRequiredSrcContainer ~= self.player:getInventory() and itemRequired:getDrainableUsesInt() > 1 then
        ISTimedActionQueue.add(ISInventoryTransferAction:new(self.player, itemRequired, self.player:getInventory(), itemRequiredSrcContainer))
    end
end

function AutoSmoke:findCigaretteOrPack()
    for _, category in ipairs(AutoSmoke.activeMod.items) do
        local categoryTable = AutoSmoke.activeMod.items[category]
        if AutoSmoke.Options.reversePriority then
            categoryTable = AutoSmoke.Utils.reverseTable(categoryTable)
        end
        if AutoSmoke.activeMod.items.gum and not AutoSmoke.Options.gumOnly then
            if category == "gum" or category == "gumBlister" or category == "gumPack" then break end
        end
        for _, itemType in ipairs(categoryTable) do
            local item = self.player:getInventory():getBestTypeEvalRecurse(itemType, AutoSmoke.Utils.drainableComparator)
            if AutoSmoke.activeMod.items.gum and AutoSmoke.Options.gumOnly then
                if item and category == "gum" then
                    return item
                elseif item and (category == "gumBlister" or category == "gumPack") then
                    local nextItemType = AutoSmoke.activeMod.items[category][itemType]
                    return nil, item, nextItemType, category
                end
            else
                if item and category == "cigarettes" then
                    return item
                elseif item and category == "butts" then
                    if AutoSmoke.Options.smokeButts then
                        return item
                    end
                elseif item then
                    if AutoSmoke.activeMod.actions[category].isValid ~= nil then
                        if AutoSmoke.activeMod.actions[category].isValid(item) then
                            local nextItemType = AutoSmoke.activeMod.items[category][itemType]
                            return nil, item, nextItemType, category
                        end
                    else
                        local nextItemType = AutoSmoke.activeMod.items[category][itemType]
                        return nil, item, nextItemType, category
                    end
                end
            end
        end
    end
    return
end

function AutoSmoke:checkInventory()
    if ISTimedActionQueue.hasAction(self.currentAction) then return end

    local cigarette
    if AutoSmoke.activeMod.modId then
        local pack, nextItemType, category
        cigarette, pack, nextItemType, category = self:findCigaretteOrPack()
        if pack and nextItemType and category then
            local srcContainer = pack:getContainer()
            local time = AutoSmoke.activeMod.actions[category].time
            local jobType = AutoSmoke.activeMod.actions[category].jobType
            local sound = AutoSmoke.activeMod.actions[category].sound
            self.currentAction = AutoSmoke.activeMod.unpackAction(self.player, pack, srcContainer, nextItemType, time, jobType, sound)
            ISInventoryPaneContextMenu.transferIfNeeded(self.player, pack)
            ISTimedActionQueue.add(self.currentAction)
            return
        end
    else
        cigarette = self.player:getInventory():getFirstTypeRecurse("Base.Cigarettes")
    end
    if not cigarette then
        if AutoSmoke.Options.characterSpeaks then
            AutoSmoke.Speak.noCigarettes()
            AutoSmoke.pressedKey = false
        end
        return
    end

    self:smoke(cigarette)
end

function AutoSmoke:canSmoke()
    return not self.player:isStrafing() and not self.player:isRunning() and not self.player:isSprinting()
            and not self.player:isAiming() and not self.player:isAsleep()
end

function AutoSmoke.onStressCheck()
    local timeMultiplier = getGameTime():getTrueMultiplier()
    if getTimestampMs() < nextCheckTime and timeMultiplier == previousTimeMultiplier then return end
    nextCheckTime = getTimestampMs() + 10000 / timeMultiplier
    previousTimeMultiplier = timeMultiplier

    local stress = AutoSmoke.player:getStats():getStress()
    if stress >= stressThreshold and AutoSmoke:canSmoke() then
        AutoSmoke:checkInventory()
    end
end

function AutoSmoke.onCheckTrait()
    if AutoSmoke.player:HasTrait("Smoker") then
        if not AutoSmoke.previousCheckHadTrait then
            Events.OnTick.Add(AutoSmoke.onStressCheck)
        end
        AutoSmoke.previousCheckHadTrait = true
    else
        if AutoSmoke.previousCheckHadTrait then
            Events.OnTick.Remove(AutoSmoke.onStressCheck)
        end
        AutoSmoke.previousCheckHadTrait = false
    end
end

local function onKeyPressed(key)
    if AutoSmoke.player and key == AutoSmoke.Options.keySmoke.key then
        if AutoSmoke.Options.characterSpeaks then
            AutoSmoke.pressedKey = true
        end
        AutoSmoke:checkInventory()
    end
end

function AutoSmoke.start()
    AutoSmoke.player = getPlayer()
    if AutoSmoke.Options.autoSmoking then
        if AutoSmoke.player then
            Events.EveryTenMinutes.Add(AutoSmoke.onCheckTrait)
        end
    else
        Events.OnTick.Remove(AutoSmoke.onStressCheck)
        Events.EveryTenMinutes.Remove(AutoSmoke.onCheckTrait)
    end
    AutoSmoke.Speak.init()
end

local function init()
    if getActivatedMods():contains('eggonsHotkeys') then
        for i = #keyBinding, 1, -1 do
            if keyBinding[i].value == 'smoke' then
                table.remove(keyBinding, i)
                break
            end
        end
    end
    for _, entry in ipairs(AutoSmoke.supportedMods) do
        if getActivatedMods():contains(entry.modId) then
            AutoSmoke.activeMod = AutoSmoke[entry.modTable]
            break
        end
    end
    AutoSmoke.Options.init()
end

Events.OnKeyPressed.Add(onKeyPressed)
Events.OnGameStart.Add(AutoSmoke.start)
Events.OnGameBoot.Add(init)