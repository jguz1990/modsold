-- Better towing
if getActivatedMods():contains("TowingCar") then
    require("TowingCar/TowingUI")

    local oldFunc = TowCarMod.UI.addParkingBrakeOptionToMenu
    function TowCarMod.UI.addParkingBrakeOptionToMenu(playerObj)
        if not AquaConfig.isBoat(playerObj:getVehicle()) then
            oldFunc(playerObj)
        end
    end
end