require('mods/BaseAutoSmokeUnpackAction')

AutoSmokeGFUnpackAction = BaseAutoSmokeUnpackAction:derive("AutoSmokeGFUnpackAction")

function AutoSmokeGFUnpackAction:doPerform()
    local itemType = self.item:getFullType()
    if AutoSmoke.GreenFire.items.cartons[itemType] then
        local newItems = AutoSmoke.GreenFire.unpackCarton(self.character, self.item, self.nextItemType)
        local nextItemType = AutoSmoke.GreenFire.items.closedPacks[self.nextItemType]
        local time = AutoSmoke.GreenFire.actions.closedPacks.time
        local jobType = AutoSmoke.GreenFire.actions.closedPacks.jobType
        self:addAfter(AutoSmokeGFUnpackAction:new(self.character, newItems:get(0), self.srcContainer, nextItemType, time, jobType))
        for i = 1, newItems:size() - 1 do
            self:transferItemBack(newItems:get(i))
        end
    elseif AutoSmoke.GreenFire.items.openedCartons[itemType] then
        local newItems = AutoSmoke.GreenFire.unpackOpenedCarton(self.character, self.item, self.nextItemType)
        local nextItemType = AutoSmoke.GreenFire.items.closedPacks[self.nextItemType]
        local time = AutoSmoke.GreenFire.actions.closedPacks.time
        local jobType = AutoSmoke.GreenFire.actions.closedPacks.jobType
        self:addAfter(AutoSmokeGFUnpackAction:new(self.character, newItems:get(0), self.srcContainer, nextItemType, time, jobType))
        for i = 1, newItems:size() - 1 do
            self:transferItemBack(newItems:get(i))
        end
    elseif AutoSmoke.GreenFire.items.closedPacks[itemType] then
        local newItems = AutoSmoke.GreenFire.openPack(self.character, self.item, self.nextItemType)
        for i = 1, newItems:size() - 1 do
            self:transferItemBack(newItems:get(i))
        end
        AutoSmoke:smoke(newItems:get(0))
    end
end

function AutoSmokeGFUnpackAction:new(character, item, nextItemType, time, jobType, sound)
    local o = BaseAutoSmokeUnpackAction:new(character, item, nextItemType, time, jobType, sound)
    setmetatable(o, self)
    self.__index = self
    return o
end