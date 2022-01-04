local esInfoOptions = require("es.info.options");
local baseISVMRenderPartDetail = ISVehicleMechanics.renderPartDetail;
function ISVehicleMechanics:renderPartDetail(part)
    baseISVMRenderPartDetail(self, part);

    if esInfoOptions.getOption("carSpaceOn") and part:getItemType() and part:getInventoryItem() and part:isContainer() then
        local FONT_HGT_MEDIUM = getTextManager():getFontHeight(UIFont.Medium)
        local y = self:titleBarHeight() + 10 + FONT_HGT_MEDIUM + 5;
        local x = self.xCarTexOffset + (self.width - 10 - self.xCarTexOffset) / 2;
        local invItem = VehicleUtils.createPartInventoryItem(part)
        local maxCapacity = invItem:getMaxCapacity();
        self:drawTextRight("[" .. maxCapacity .. "]", x - 6, y - 1, 1, 1, 1, 1);
    end

end
