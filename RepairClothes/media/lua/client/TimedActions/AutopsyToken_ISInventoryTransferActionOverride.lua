local original_ISInventoryTransferAction_isValid = ISInventoryTransferAction.isValid
function ISInventoryTransferAction:isValid()
    if self.item:getType() == "autopsySkull" or self.item:getType() == "autopsySkullInfected"  or self.item:getType() == "token_Uninfected"  or self.item:getType() == "token_Infected" then
        return false
    else
        return original_ISInventoryTransferAction_isValid(self);
    end
end