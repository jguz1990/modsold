require('mods/AutoSmokeSM')

AutoSmoke.Smoker.OnTest = {}

function AutoSmoke.Smoker.OnTest.isPackNotEmpty(item)
    for _, itemType in ipairs(AutoSmoke.Smoker.items.openedPacks) do
        if item:getFullType() == itemType then
            return item:getUsedDelta() > 0
        end
    end
    return false
end

function AutoSmoke.Smoker.unpackCarton(player, item, nextItemType)
    -- Delete carton
    item:getContainer():DoRemoveItem(item)
    -- Create 10 full packs
    local newItems = player:getInventory():AddItems(nextItemType, 10)
    return newItems
end

function AutoSmoke.Smoker.openPack(player, item, nextItemType)
    -- Delete closed pack
    item:getContainer():DoRemoveItem(item)
    -- Create opened pack
    local newItem = player:getInventory():AddItem(nextItemType)
    --newItem:setUsedDelta(1)
    local DATASmokerCigarettePack = newItem:getModData()
    DATASmokerCigarettePack.Smoker = true
    return newItem
end

function AutoSmoke.Smoker.openIncompletePack(player, item, nextItemType)
    -- Delete closed incomplete pack
    item:getContainer():DoRemoveItem(item)

    -- Original code from Smoker
    local NumCigarettesInPack = ZombRand(0, 20) / 20
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
        newItem = player:getInventory():AddItem(AutoSmoke.Smoker.misc.closedIncompletePacks[item:getFullType()])
    else
        -- Create opened pack
        newItem = player:getInventory():AddItem(nextItemType)
        newItem:setUsedDelta(NumCigarettesInPack)
        local DATASmokerCigarettePack = newItem:getModData()
        DATASmokerCigarettePack.Smoker = true
    end
    return newItem
end

function AutoSmoke.Smoker.takeCigarette(player, item, nextItemType)
    -- Take one
    item:Use()
    -- Create cigarette
    local newItem = player:getInventory():AddItem(nextItemType)
    return newItem
end

function AutoSmoke.Smoker.openGumPack(player, item, nextItemType)
    -- Take one
    item:Use()
    -- Create blister
    local newItem = player:getInventory():AddItem(nextItemType)
    return newItem
end

function AutoSmoke.Smoker.takeGum(player, item, nextItemType)
    -- Take one
    item:Use()
    -- Create gum
    local newItem = player:getInventory():AddItem(nextItemType)
    return newItem
end