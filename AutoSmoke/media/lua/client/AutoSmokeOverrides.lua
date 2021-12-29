require('AutoSmoke')

if not AutoSmoke.original_ISInventoryPaneContextMenu_eatItem then
    AutoSmoke.original_ISInventoryPaneContextMenu_eatItem = ISInventoryPaneContextMenu.eatItem
end
function ISInventoryPaneContextMenu.eatItem(item, percentage, player)
    local foundCigarette
    if AutoSmoke.activeMod.modId then
        for _, itemType in ipairs(AutoSmoke.activeMod.items.cigarettes) do
            if item:getFullType() == itemType then
                foundCigarette = true
                break
            end
        end
    elseif item:getFullType() == "Base.Cigarettes" then
        foundCigarette = true
    end
    if not foundCigarette then
        AutoSmoke.original_ISInventoryPaneContextMenu_eatItem(item, percentage, player)
        return
    end

    local playerObj = getSpecificPlayer(player)
    local itemRequired
    local itemRequiredSrcContainer
    ISInventoryPaneContextMenu.transferIfNeeded(playerObj, item)
    if item:getRequireInHandOrInventory() then
        local types = item:getRequireInHandOrInventory()
        for i = 1, types:size() do
            local fullType = moduleDotType(item:getModule(), types:get(i - 1))
            itemRequired = playerObj:getInventory():getFirstType(fullType)
            if not itemRequired then
                itemRequired = playerObj:getInventory():getBestTypeEvalRecurse(fullType, AutoSmoke.Utils.drainableComparator)
            end
            if itemRequired then
                itemRequiredSrcContainer = itemRequired:getContainer()
                ISInventoryPaneContextMenu.transferIfNeeded(playerObj, itemRequired)
                break
            end
        end
        if not itemRequired then return end
    end

    AutoSmoke.currentAction = AutoSmokePuffAction:new(playerObj, item, percentage)
    ISTimedActionQueue.add(AutoSmoke.currentAction)
    if itemRequired and itemRequiredSrcContainer ~= playerObj:getInventory() and itemRequired:getDrainableUsesInt() > 1 then
        ISTimedActionQueue.add(ISInventoryTransferAction:new(playerObj, itemRequired, playerObj:getInventory(), itemRequiredSrcContainer))
    end
end