require('mods/AutoSmokeHC')

function AutoSmoke.Hydrocraft.unpackCarton(player, item, nextItemType)
    -- Delete carton
    item:getContainer():DoRemoveItem(item)
    -- Create 10 full packs
    local newItems = player:getInventory():AddItems(nextItemType, 10)
    return newItems
end

function AutoSmoke.Hydrocraft.openPack(player, item, nextItemType)
    -- Delete closed pack
    item:getContainer():DoRemoveItem(item)
    -- Create cigarettes
    player:getInventory():AddItem(nextItemType)
    -- Item has count = 20. We didn't find any items of this type, thus only the newly created items will be returned.
    local newItems = player:getInventory():getAllType(nextItemType)
    return newItems
end