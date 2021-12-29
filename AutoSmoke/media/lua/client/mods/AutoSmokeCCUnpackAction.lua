require('mods/BaseAutoSmokeUnpackAction')

AutoSmokeCCUnpackAction = BaseAutoSmokeUnpackAction:derive("AutoSmokeCCUnpackAction")

function AutoSmokeCCUnpackAction:doPerform()
    local itemType = self.item:getFullType()
    if AutoSmoke.CigaretteCarton.items.cartons[itemType] then
        local newItems = AutoSmoke.CigaretteCarton.unpackCarton(self.character, self.item, self.nextItemType)
        local nextItemType = AutoSmoke.CigaretteCarton.items.closedPacks[self.nextItemType]
        local time = AutoSmoke.CigaretteCarton.actions.closedPacks.time
        local jobType = AutoSmoke.CigaretteCarton.actions.closedPacks.jobType
        self:addAfter(AutoSmokeCCUnpackAction:new(self.character, newItems:get(0), self.srcContainer, nextItemType, time, jobType))
        for i = 1, newItems:size() - 1 do
            self:transferItemBack(newItems:get(i))
        end
    elseif AutoSmoke.CigaretteCarton.items.closedPacks[itemType] then
        local newItems = AutoSmoke.CigaretteCarton.openPack(self.character, self.item, self.nextItemType)
        for i = 1, newItems:size() - 1 do
            self:transferItemBack(newItems:get(i))
        end
        AutoSmoke:smoke(newItems:get(0))
    end
end

function AutoSmokeCCUnpackAction:new(character, item, srcContainer, nextItemType, time, jobType, sound)
    local o = BaseAutoSmokeUnpackAction:new(character, item, srcContainer, nextItemType, time, jobType, sound)
    setmetatable(o, self)
    self.__index = self
    return o
end