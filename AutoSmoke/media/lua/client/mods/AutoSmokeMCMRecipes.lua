require('mods/AutoSmokeMCM')

AutoSmoke.MoreCigsMod.OnTest = {}

function AutoSmoke.MoreCigsMod.OnTest.isPackNotEmpty(item)
    for _, itemType in ipairs(AutoSmoke.MoreCigsMod.items.openedPacks) do
        if item:getFullType() == itemType then
            return item:getUsedDelta() > 0
        end
    end
    return false
end

function AutoSmoke.MoreCigsMod.unpackCarton(player, item, nextItemType)
    -- Delete carton
    item:getContainer():DoRemoveItem(item)
    -- Create empty carton
    player:getInventory():AddItem(AutoSmoke.MoreCigsMod.misc.cartons[item:getFullType()])
    -- Create 10 full packs
    local newItems = player:getInventory():AddItems(nextItemType, 10)
    return newItems
end

function AutoSmoke.MoreCigsMod.openPack(player, item, nextItemType)
    -- Delete closed pack
    item:getContainer():DoRemoveItem(item)
    -- Create opened pack
    local newItem = player:getInventory():AddItem(nextItemType)
    return newItem
end

function AutoSmoke.MoreCigsMod.openIncompletePack(player, item, nextItemType)
    -- Delete closed pack
    item:getContainer():DoRemoveItem(item)

    -- Original code from MoreCigsMod
    local NumCigarettesInPack = ZombRand(1, 20) / 20
    if NumCigarettesInPack == 0 then player:Say(getText("IGUI_Empty"))
    elseif NumCigarettesInPack == 0.05 then player:Say(getText("IGUI_One_cigarette"))
    elseif NumCigarettesInPack == 0.1 then player:Say(getText("IGUI_Two_cigarettes"))
    elseif NumCigarettesInPack >= 0.15 and NumCigarettesInPack <= 0.25 then player:Say(getText("IGUI_There_is_some"))
    elseif NumCigarettesInPack >= 0.25 and NumCigarettesInPack <= 0.35 then player:Say(getText("IGUI_Less_than_half"))
    elseif NumCigarettesInPack >= 0.4 and NumCigarettesInPack <= 0.6 then player:Say(getText("IGUI_Almost_half_a_pack"))
    elseif NumCigarettesInPack >= 0.65 and NumCigarettesInPack <= 0.8 then player:Say(getText("IGUI_More_than_a_half"))
    elseif NumCigarettesInPack >= 0.85 and NumCigarettesInPack <= 0.95 then player:Say(getText("IGUI_Almost_a_complete_pack"))
    elseif NumCigarettesInPack == 1 then player:Say(getText("IGUI_Full_pack"))
    end

    local newItem
    if NumCigarettesInPack == 0 then
        -- Create empty pack
        newItem = player:getInventory():AddItem(AutoSmoke.MoreCigsMod.misc.closedIncompletePacks[item:getFullType()])
    else
        -- Create opened pack
        newItem = player:getInventory():AddItem(nextItemType)
        newItem:setUsedDelta(NumCigarettesInPack)
    end

    return newItem
end

function AutoSmoke.MoreCigsMod.takeCigarette(player, item, nextItemType)
    -- Take one
    item:Use()
    -- Create cigarette
    local newItem = player:getInventory():AddItem(nextItemType)
    return newItem
end