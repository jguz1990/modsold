require('mods/AutoSmokeCC')

function AutoSmoke.CigaretteCarton.unpackCarton(player, item, nextItemType)
    -- Delete carton
    item:getContainer():DoRemoveItem(item)
    -- Create 10 full packs
    local newItems = player:getInventory():AddItems(nextItemType, 10)
    return newItems
end

function AutoSmoke.CigaretteCarton.openPack(player, item, nextItemType)
    -- Delete closed pack
    item:getContainer():DoRemoveItem(item)
    -- Create 20 cigarettes
    local newItems = player:getInventory():AddItems(nextItemType, 20)
    return newItems
end