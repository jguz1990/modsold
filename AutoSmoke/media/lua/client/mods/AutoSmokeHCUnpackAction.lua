require('mods/BaseAutoSmokeUnpackAction')

AutoSmokeHCUnpackAction = BaseAutoSmokeUnpackAction:derive("AutoSmokeHCUnpackAction")

function AutoSmokeHCUnpackAction:doPerform()
    local itemType = self.item:getFullType()
    if AutoSmoke.Hydrocraft.items.cartons[itemType] then
        local newItems = AutoSmoke.Hydrocraft.unpackCarton(self.character, self.item, self.nextItemType)
        local nextItemType = AutoSmoke.Hydrocraft.items.closedPacks[self.nextItemType]
        local time = AutoSmoke.Hydrocraft.actions.closedPacks.time
        local jobType = AutoSmoke.Hydrocraft.actions.closedPacks.jobType
        self:addAfter(AutoSmokeHCUnpackAction:new(self.character, newItems:get(0), self.srcContainer, nextItemType, time, jobType))
        for i = 1, newItems:size() - 1 do
            self:transferItemBack(newItems:get(i))
        end
    elseif AutoSmoke.Hydrocraft.items.closedPacks[itemType] then
        local newItems = AutoSmoke.Hydrocraft.openPack(self.character, self.item, self.nextItemType)
        for i = 1, newItems:size() - 1 do
            self:transferItemBack(newItems:get(i))
        end
        AutoSmoke:smoke(newItems:get(0))
    end
end

function AutoSmokeHCUnpackAction:new(character, item, nextItemType, time, jobType, sound)
    local o = BaseAutoSmokeUnpackAction:new(character, item, nextItemType, time, jobType, sound)
    setmetatable(o, self)
    self.__index = self
    return o
end