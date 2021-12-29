require('TimedActions/ISEatFoodAction')

AutoSmokePuffAction = ISEatFoodAction:derive("AutoSmokePuffAction")

function AutoSmokePuffAction:perform()
    local buttItemType = self.item:getReplaceOnUseFullType()

    ISEatFoodAction.perform(self)

    if AutoSmoke.Options.characterSpeaks then
        AutoSmoke.Speak.reset()
    end

    if buttItemType then
        local butts = self.character:getInventory():getAllType(buttItemType)
        local butt = butts:get(butts:size() - 1)
        if butt then
            butt:setFavorite(false)
            if AutoSmoke.Options.throwAwayButts then
                self.character:getInventory():DoRemoveItem(butt)
                local x, y = ZombRandFloat(0.1, 0.9), ZombRandFloat(0.1, 0.9)
                local z = self.character:getZ() - math.floor(self.character:getZ())
                self.character:getCurrentSquare():AddWorldInventoryItem(butt, x, y, z)
                triggerEvent("OnContainerUpdate")
            elseif AutoSmoke.Options.removeButts then
                self.character:getInventory():DoRemoveItem(butt)
            elseif AutoSmoke.activeMod.modId == "Smoker" and AutoSmoke.Options.buttsToAshtray then
                local ashtrays = self.character:getInventory():getAllType("SM.Ashtray")
                local ashtray
                for i = 0, ashtrays:size() - 1 do
                    local test = ashtrays:get(i):getItemContainer()
                    if test:hasRoomFor(self.character, butt) then
                        ashtray = test
                        break
                    end
                end
                if not ashtray then
                    local containers = getPlayerLoot(self.character:getPlayerNum()).inventoryPane.inventoryPage.backpacks
                    for _, v in ipairs(containers) do
                        local test = v.inventory
                        if test and test:getType() == "Ashtray" then
                            if test:hasRoomFor(self.character, butt) then
                                ashtray = test
                                break
                            end
                        end
                    end
                end

                if ashtray then
                    ashtray:AddItem(butt)
                    --ISTimedActionQueue.add(ISInventoryTransferAction:new(self.character, butt, self.character:getInventory(), ashtray))
                end
            end
        end
    end
end

function AutoSmokePuffAction:new(character, item, percentage)
    local o = ISEatFoodAction:new(character, item, percentage)
    setmetatable(o, self)
    self.__index = self
    return o
end
