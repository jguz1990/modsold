local original_ISInventoryTransferAction_isValid = ISInventoryTransferAction.isValid
function ISInventoryTransferAction:isValid()
	if self.destContainer:getType()=="Photocopier"  then
		if self.item:getType() ~= "CopyPaper" then
			return false
		end
	end
    return original_ISInventoryTransferAction_isValid(self);    
end