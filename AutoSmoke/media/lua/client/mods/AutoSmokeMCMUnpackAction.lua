require('mods/BaseAutoSmokeUnpackAction')

AutoSmokeMCMUnpackAction = BaseAutoSmokeUnpackAction:derive("AutoSmokeMCMUnpackAction")

function AutoSmokeMCMUnpackAction:doPerform()
    local itemType = self.item:getFullType()
    if AutoSmoke.MoreCigsMod.items.cartons[itemType] then
        local newItems = AutoSmoke.MoreCigsMod.unpackCarton(self.character, self.item, self.nextItemType)
        local nextItemType = AutoSmoke.MoreCigsMod.items.closedPacks[self.nextItemType]
        local time = AutoSmoke.MoreCigsMod.actions.closedPacks.time
        local jobType = AutoSmoke.MoreCigsMod.actions.closedPacks.jobType
        self:addAfter(AutoSmokeMCMUnpackAction:new(self.character, newItems:get(0), self.srcContainer, nextItemType, time, jobType))
        for i = 1, newItems:size() - 1 do
            self:transferItemBack(newItems:get(i))
        end
    elseif AutoSmoke.MoreCigsMod.items.closedPacks[itemType] then
        local newItem = AutoSmoke.MoreCigsMod.openPack(self.character, self.item, self.nextItemType)
        local nextItemType = AutoSmoke.MoreCigsMod.items.openedPacks[self.nextItemType]
        local time = AutoSmoke.MoreCigsMod.actions.openedPacks.time
        local jobType = AutoSmoke.MoreCigsMod.actions.openedPacks.jobType
        self:addAfter(AutoSmokeMCMUnpackAction:new(self.character, newItem, self.srcContainer, nextItemType, time, jobType))
    elseif AutoSmoke.MoreCigsMod.items.closedIncompletePacks[itemType] then
        local newItem = AutoSmoke.MoreCigsMod.openIncompletePack(self.character, self.item, self.nextItemType)
        local nextItemType = AutoSmoke.MoreCigsMod.items.openedPacks[self.nextItemType]
        local time = AutoSmoke.MoreCigsMod.actions.openedPacks.time
        local jobType = AutoSmoke.MoreCigsMod.actions.openedPacks.jobType
        if AutoSmoke.MoreCigsMod.actions.openedPacks.isValid(newItem) then
            self:addAfter(AutoSmokeMCMUnpackAction:new(self.character, newItem, self.srcContainer, nextItemType, time, jobType))
        else
            AutoSmoke.currentAction = nil
            AutoSmoke:checkInventory()
        end
    elseif AutoSmoke.MoreCigsMod.items.openedPacks[itemType] then
        local newItem = AutoSmoke.MoreCigsMod.takeCigarette(self.character, self.item, self.nextItemType)
        self:transferItemBack(self.item)
        AutoSmoke:smoke(newItem)
    end
end

function AutoSmokeMCMUnpackAction:new(character, item, srcContainer, nextItemType, time, jobType, sound)
    local o = BaseAutoSmokeUnpackAction:new(character, item, srcContainer, nextItemType, time, jobType, sound)
    setmetatable(o, self)
    self.__index = self
    return o
end