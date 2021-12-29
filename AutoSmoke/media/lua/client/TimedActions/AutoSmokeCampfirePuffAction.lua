require('TimedActions/AutoSmokePuffAction')

AutoSmokeCampfirePuffAction = AutoSmokePuffAction:derive("AutoSmokeCampfirePuffAction")

function AutoSmokeCampfirePuffAction:isValid()
    return true
end

function AutoSmokeCampfirePuffAction:perform()
    self.item:setRequireInHandOrInventory(nil)
    AutoSmokePuffAction.perform(self)
end

function AutoSmokeCampfirePuffAction:new(character, item, percentage)
    local o = AutoSmokePuffAction:new(character, item, percentage)
    setmetatable(o, self)
    self.__index = self
    return o
end