EggonsMU.config.enableEvent("OnAfterItemTransfer")

function EHIFTB.memorizeItem(player, item, srcContainer, destContainer)
    if EHIFTB.isValidEHIFTBItem(item, "memorize") then
        local memory = EHIFTB.getPlayerMemory(player)
        local identifier = EHIFTB.getItemIdentifier(item)

        if EggonsMU.functions.isACarriedContainer(destContainer) then
            if not memory.rememberedBooks[identifier] then
                memory.rememberedBooks[identifier] = {}
            end
        end
    end
end
Events.OnAfterItemTransfer.Add(EHIFTB.memorizeItem)
