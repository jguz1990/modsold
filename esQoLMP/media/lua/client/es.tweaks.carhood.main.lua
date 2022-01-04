local esCarHoodOptions = require("es.tweaks.options");

local baseISOpenMechanicsUIActionNew = ISOpenMechanicsUIAction.new;
function ISOpenMechanicsUIAction:new(character, vehicle, part, ...)
    local openHoodAction = baseISOpenMechanicsUIActionNew(self, character, vehicle, part, ...);

    if (esCarHoodOptions.getOption("carhoodOn")) then
        if (vehicle:getModData()["maxTime"] ~= nil) then
            openHoodAction.maxTime = vehicle:getModData()["maxTime"];
        end
    end

    return openHoodAction;
end

local baseISVehicleMenuOnMechanic = ISVehicleMenu.onMechanic;
function ISVehicleMenu.onMechanic(playerObj, vehicle)
    if (esCarHoodOptions.getOption("carhoodOn")) then
        local openHoodAction = ISOpenMechanicsUIAction:new(playerObj, vehicle);
        return ISTimedActionQueue.add(openHoodAction);
    end

    return baseISVehicleMenuOnMechanic(playerObj, vehicle);
end

local baseISOpenMechanicsUIActionPerform = ISOpenMechanicsUIAction.perform;
function ISOpenMechanicsUIAction:perform()
    if (esCarHoodOptions.getOption("carhoodOn")) then
        local maxTime = self.vehicle:getModData()["maxTime"] or self.maxTime;
        maxTime = round(maxTime * 0.80);
        if (maxTime < 50) then maxTime = 50; end
        self.vehicle:getModData()["maxTime"] = maxTime;
    end

    return baseISOpenMechanicsUIActionPerform(self);
end
