require('mods/AutoSmokeGF')

function AutoSmoke.GreenFire.unpackCarton(player, item, nextItemType)
    if AutoSmoke.GreenFire.compatHydrocraft and AutoSmoke.Hydrocraft.items.cartons[item:getFullType()] then
        return AutoSmoke.Hydrocraft.openPack(player, item, nextItemType)
    end
    -- Delete carton
    item:getContainer():DoRemoveItem(item)
    -- Create empty carton
    player:getInventory():AddItem(AutoSmoke.GreenFire.misc.cartons[item:getFullType()])
    -- Create 10 full packs
    local newItems = player:getInventory():AddItems(nextItemType, 10)
    return newItems
end

function AutoSmoke.GreenFire.unpackOpenedCarton(player, item, nextItemType)
    -- Delete carton
    item:getContainer():DoRemoveItem(item)
    -- Create empty carton
    player:getInventory():AddItem(AutoSmoke.GreenFire.misc.cartons[item:getFullType()])

    -- Original logic from GreenFire
    local count = ZombRand(1, 9)
    local newItems = player:getInventory():AddItems(nextItemType, count)
    return newItems
end

function AutoSmoke.GreenFire.openPack(player, item, nextItemType)
    if AutoSmoke.GreenFire.compatHydrocraft and AutoSmoke.Hydrocraft.items.closedPacks[item:getFullType()] then
        return AutoSmoke.Hydrocraft.openPack(player, item, nextItemType)
    end
    -- Delete closed pack
    item:getContainer():DoRemoveItem(item)
    -- Create 20 cigarettes
    local newItems newItems = player:getInventory():AddItems(nextItemType, 20)
    return newItems
end