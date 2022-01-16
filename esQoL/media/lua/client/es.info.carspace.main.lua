local esInfoOptions = require("es.info.options");
local FONT_HGT_SMALL = getTextManager():getFontHeight(UIFont.Small);
local FONT_HGT_MEDIUM = getTextManager():getFontHeight(UIFont.Medium);

local baseISVMRenderPartDetail = ISVehicleMechanics.renderPartDetail;
function ISVehicleMechanics:renderPartDetail(part)
    baseISVMRenderPartDetail(self, part);

    if (esInfoOptions.getOption("carSpaceOn")) then
        local partItem;

        if (part:getItemType() and not part:getItemType():isEmpty() and part:getInventoryItem() and part:isContainer()) then
            partItem = InventoryItemFactory.CreateItem(part:getItemType():get(0));
        end

        if (partItem and partItem.getMaxCapacity) then
            local y = self:titleBarHeight() + 10 + FONT_HGT_MEDIUM + 5;
            local x = self.xCarTexOffset + (self.width - 10 - self.xCarTexOffset) / 2;
            local maxCapacity = partItem:getMaxCapacity();
            self:drawTextRight("[" .. maxCapacity .. "]", x - 6, y, 1, 1, 1, 1);
        end

        if (self.vehicle.getEnginePower and self.vehicle.getMass) then
            local enginePower = (self.vehicle:getEnginePower() / 10);
            local carMass = self.vehicle:getMass();
            local towingPower = (enginePower / carMass) * 100;
            towingPower = round(towingPower);

            local x = self.xCarTexOffset + 5;
            local y = self:titleBarHeight() + 10 + FONT_HGT_MEDIUM + 5;
            y = y + (FONT_HGT_SMALL * 4.5);
            self:drawText(getText("IGUI_mo_esqTowing", towingPower), x, y, 1, 1, 1, 1);
        end
    end

end