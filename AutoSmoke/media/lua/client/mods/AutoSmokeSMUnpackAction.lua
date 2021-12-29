require('mods/BaseAutoSmokeUnpackAction')

AutoSmokeSMUnpackAction = BaseAutoSmokeUnpackAction:derive("AutoSmokeSMUnpackAction")

function AutoSmokeSMUnpackAction:doPerform()
    local itemType = self.item:getFullType()
    if AutoSmoke.Smoker.items.cartons[itemType] then
        local newItems = AutoSmoke.Smoker.unpackCarton(self.character, self.item, self.nextItemType)
        local nextItemType = AutoSmoke.Smoker.items.closedPacks[self.nextItemType]
        local time = AutoSmoke.Smoker.actions.closedPacks.time
        local jobType = AutoSmoke.Smoker.actions.closedPacks.jobType
        self:addAfter(AutoSmokeSMUnpackAction:new(self.character, newItems:get(0), self.srcContainer, nextItemType, time, jobType))
        for i = 1, newItems:size() - 1 do
            self:transferItemBack(newItems:get(i))
        end
    elseif AutoSmoke.Smoker.items.closedPacks[itemType] then
        local newItem = AutoSmoke.Smoker.openPack(self.character, self.item, self.nextItemType)
        local nextItemType = AutoSmoke.Smoker.items.openedPacks[self.nextItemType]
        local time = AutoSmoke.Smoker.actions.openedPacks.time
        local jobType = AutoSmoke.Smoker.actions.openedPacks.jobType
        self:addAfter(AutoSmokeSMUnpackAction:new(self.character, newItem, self.srcContainer, nextItemType, time, jobType))
    elseif AutoSmoke.Smoker.items.closedIncompletePacks[itemType] then
        local newItem = AutoSmoke.Smoker.openIncompletePack(self.character, self.item, self.nextItemType)
        local nextItemType = AutoSmoke.Smoker.items.openedPacks[self.nextItemType]
        local time = AutoSmoke.Smoker.actions.openedPacks.time
        local jobType = AutoSmoke.Smoker.actions.openedPacks.jobType
        if AutoSmoke.Smoker.actions.openedPacks.isValid(newItem) then
            self:addAfter(AutoSmokeSMUnpackAction:new(self.character, newItem, self.srcContainer, nextItemType, time, jobType))
        else
            AutoSmoke.currentAction = nil
            AutoSmoke:checkInventory()
        end
    elseif AutoSmoke.Smoker.items.openedPacks[itemType] then
        local newItem = AutoSmoke.Smoker.takeCigarette(self.character, self.item, self.nextItemType)
        self:transferItemBack(self.item)
        AutoSmoke:smoke(newItem)
    elseif AutoSmoke.Smoker.items.gumPack[itemType] then
        local newItem = AutoSmoke.Smoker.openGumPack(self.character, self.item, self.nextItemType)
        local nextItemType = AutoSmoke.Smoker.items.gumBlister[self.nextItemType]
        local time = AutoSmoke.Smoker.actions.gumBlister.time
        local jobType = AutoSmoke.Smoker.actions.gumBlister.jobType
        local sound = AutoSmoke.Smoker.actions.gumBlister.sound
        self:addAfter(AutoSmokeSMUnpackAction:new(self.character, newItem, self.srcContainer, nextItemType, time, jobType, sound))
        self:transferItemBack(self.item)
    elseif AutoSmoke.Smoker.items.gumBlister[itemType] then
        local newItem = AutoSmoke.Smoker.takeGum(self.character, self.item, self.nextItemType)
        self:transferItemBack(self.item)
        AutoSmoke:smoke(newItem)
    end
end

function AutoSmokeSMUnpackAction:new(character, item, srcContainer, nextItemType, time, jobType, sound)
    local o = BaseAutoSmokeUnpackAction:new(character, item, srcContainer, nextItemType, time, jobType, sound)
    setmetatable(o, self)
    self.__index = self
    return o
end