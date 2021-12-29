local allowedCategories = {
    Literature = true
}

EHIFTB.isValidEHIFTBItem = function(item, action)
    local fullType = item:getFullType()
    local output = false
    local category = item:getCategory()
    if
        (allowedCategories[category] and not EHIFTB.Const.invalidItemTypes[fullType]) or (item.getMap and item:getMap()) or
            (item.IsMap and item:IsMap())
     then
        output = "type"
    elseif item:isRecordedMedia() then
        if action then
            local mediaDataType = item:getMediaData():getMediaType()
            local CFG = EHIFTB.Options
            if CFG.media[mediaDataType][action] then -- grab and showTooltip
                output = "mediaId"
            elseif action == "memorize" and (CFG.media[mediaDataType].showTooltip or CFG.media[mediaDataType].grab) then
                output = "mediaId"
            elseif action == "forget" then
                output = "mediaId"
            end
        else
            output = "mediaId"
        end
    end
    return output
end

EHIFTB.getItemIdentifier = function(item)
    local output
    if item:isRecordedMedia() then
        output = item:getMediaData():getId()
    else
        output = item:getFullType()
    end
    return output
end

EHIFTB.isItemMemorized = function(item)
    local identifier = EHIFTB.getItemIdentifier(item)
    if EHIFTB.memory.rememberedBooks[identifier] then
        return EHIFTB.memory.rememberedBooks[identifier]
    elseif EHIFTB.memory.redundantBooks[identifier] then
        return "redundant"
    end
    return false
end

EHIFTB.isValidItemInInventory = function(idType, identifier, item)
    local inv = EHIFTB.player:getInventory()
    local output
    if idType == "type" then
        output = inv:getFirstTypeRecurse(identifier)
    elseif idType == "mediaId" then
        local fullType = item:getFullType()
        local itemsOfType = inv:getAllTypeRecurse(fullType)
        for i = 0, itemsOfType:size() - 1 do
            local itemOfType = itemsOfType:get(i)
            if itemOfType:getMediaData():getId() == identifier then
                output = true
                break
            end
        end
    end
    return output
end
