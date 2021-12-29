require('AutoSmoke')

function AutoSmoke.doCampfireMenu(player, context, worldObjects, _)
    local playerObj = getSpecificPlayer(player)
    local playerInv = playerObj:getInventory()

    if playerObj:getVehicle() then return end

    local campfire
    for _, v in ipairs(worldObjects) do
        campfire = CCampfireSystem.instance:getLuaObjectOnSquare(v:getSquare())
        if campfire ~= nil and campfire.isLit then break end
    end

    if not campfire or not campfire.isLit then return end

    local cigarette
    if AutoSmoke.activeMod.modId then
        for _, itemType in ipairs(AutoSmoke.activeMod.items.cigarettes) do
            cigarette = playerInv:getFirstTypeRecurse(itemType)
            if cigarette then break end
        end
    else
        cigarette = playerInv:getFirstTypeRecurse("Base.Cigarettes")
    end

    if cigarette then
        context:addOption(cigarette:getCustomMenuOption(), player, AutoSmoke.lightUpFromCampfire, campfire, cigarette)
    end
end

function AutoSmoke.lightUpFromCampfire(player, campfire, cigarette)
    local playerObj = getSpecificPlayer(player)
    if ISCampingMenu.walkToCampfire(playerObj, campfire:getSquare()) then
        ISInventoryPaneContextMenu.transferIfNeeded(playerObj, cigarette)
        AutoSmoke.currentAction = AutoSmokeCampfireLightUpAction:new(playerObj, campfire, cigarette)
        ISTimedActionQueue.add(AutoSmoke.currentAction)
    end
end

Events.OnFillWorldObjectContextMenu.Add(AutoSmoke.doCampfireMenu)