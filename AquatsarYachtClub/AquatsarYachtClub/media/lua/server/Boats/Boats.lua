--***********************************************************
--**              THE INDIE STONE / edited iBrRus          **
--***********************************************************

require 'CommonTemplates/CommonTemplates.lua'

Boats = {}
Boats.CheckEngine = {}
Boats.CheckOperate = {}
Boats.ContainerAccess = {}
Boats.Create = {}
Boats.Init = {}
Boats.InstallComplete = {}
Boats.InstallTest = {}
Boats.UninstallComplete = {}
Boats.UninstallTest = {}
Boats.Update = {}
Boats.Use = {}


--***********************************************************
--**                                                       **
--**                       Propeller                       **
--**                                                       **
--***********************************************************

function Boats.Create.Propeller(boat, part)
    local item = VehicleUtils.createPartInventoryItem(part)
    boat:transmitPartItem(part)
end

function Boats.Update.Propeller(boat, part, elapsedMinutes)
    BoatUtils.LowerEngineCondition(boat, part, elapsedMinutes);
end

function Boats.InstallTest.Propeller(boat, part, playerObj)
    if ISVehicleMechanics.cheat then return true; end
    if boat:isEngineRunning() then return false end
    return CommonTemplates.InstallTest.PartNotInCabin(boat, part, playerObj)
end

function Boats.UninstallTest.Propeller(boat, part, playerObj)
    if ISVehicleMechanics.cheat then return true; end
    if boat:isEngineRunning() then return false end
    return CommonTemplates.UninstallTest.PartNotInCabin(boat, part, playerObj)
end

function Boats.InstallComplete.Propeller(boat, part, item)
    local part = boat:getPartById("TireFrontLeft")
    part:setInventoryItem(InventoryItemFactory.CreateItem("Aquatsar.AirBagNormal3"), 10)
    part:setContainerContentAmount(35)
    boat:transmitPartItem(part)
    part = boat:getPartById("TireFrontRight")
    part:setInventoryItem(InventoryItemFactory.CreateItem("Aquatsar.AirBagNormal3"), 10)
    part:setContainerContentAmount(35)
    boat:transmitPartItem(part)
    part = boat:getPartById("TireRearLeft")
    part:setInventoryItem(InventoryItemFactory.CreateItem("Aquatsar.AirBagNormal3"), 10)
    part:setContainerContentAmount(35)
    boat:transmitPartItem(part)
    part = boat:getPartById("TireRearRight")
    part:setInventoryItem(InventoryItemFactory.CreateItem("Aquatsar.AirBagNormal3"), 10)
    part:setContainerContentAmount(35)
    boat:transmitPartItem(part)
    --part:setModelVisible("InflatedTirePlusWheel", true)
end

function Boats.UninstallComplete.Propeller(boat, part, item)
    local part = boat:getPartById("TireFrontLeft")
    part:setInventoryItem(nil)
    boat:transmitPartItem(part)
    part = boat:getPartById("TireFrontRight")
    part:setInventoryItem(nil)
    boat:transmitPartItem(part)
    part = boat:getPartById("TireRearLeft")
    part:setInventoryItem(nil)
    boat:transmitPartItem(part)
    part = boat:getPartById("TireRearRight")
    part:setInventoryItem(nil)
    boat:transmitPartItem(part)
    --part:setModelVisible("InflatedTirePlusWheel", false)
end

--***********************************************************
--**                                                       **
--**                 Sailing Yacht Name                    **
--**                                                       **
--***********************************************************

function Boats.SailingYachtName(boat, part, item)
    if item then
        if item:getType() == "SailingYachtName_Sakharov_Item" then
            part:setModelVisible("Sakharov", true)
            part:setModelVisible("La_Brigandine", false)
        elseif item:getType() == "SailingYachtName_La_Brigandine_Item" then
            part:setModelVisible("Sakharov", false)
            part:setModelVisible("La_Brigandine", true)
        else
            part:setModelVisible("Sakharov",false)
            part:setModelVisible("La_Brigandine", false)
        end
    else
        part:setModelVisible("Sakharov",false)
        part:setModelVisible("La_Brigandine", false)
    end
end

function Boats.Create.SailingYachtName(boat, part)
    local item = InventoryItemFactory.CreateItem("Base.SailingYachtName_Default_Item")
    part:setInventoryItem(item)
    Boats.SailingYachtName(boat, part, item)
    boat:transmitPartItem(part)
end

function Boats.Init.SailingYachtName(boat, part)
    local item = part:getInventoryItem()
    Boats.SailingYachtName(boat, part, item)
end

function Boats.InstallComplete.SailingYachtName(boat, part)
    local item = part:getInventoryItem()
    Boats.SailingYachtName(boat, part, item)
    boat:doDamageOverlay()
end

--***********************************************************
--**                                                       **
--**                 Motor Boat Name                       **
--**                                                       **
--***********************************************************

function Boats.MotorBoatName(boat, part, item)
    if item then
        if item:getType() == "BoatMotorName_NP_Item" then
            part:setModelVisible("NP", true)
            part:setModelVisible("Orianna", false)
        elseif item:getType() == "BoatMotorName_Orianna_Item" then
            part:setModelVisible("NP", false)
            part:setModelVisible("Orianna", true)
        else
            part:setModelVisible("NP", false)
            part:setModelVisible("Orianna", false)
        end
    else
        part:setModelVisible("NP", false)
        part:setModelVisible("Orianna", false)
    end
end


function Boats.Create.MotorBoatName(boat, part)
    local item = InventoryItemFactory.CreateItem("Base.BoatMotorName_Default_Item")
    part:setInventoryItem(item)
    Boats.MotorBoatName(boat, part, item)
    boat:transmitPartItem(part)
end

function Boats.Init.MotorBoatName(boat, part)
    local item = part:getInventoryItem()
    Boats.MotorBoatName(boat, part, item)
end

function Boats.InstallComplete.MotorBoatName(boat, part)
    local item = part:getInventoryItem()
    Boats.MotorBoatName(boat, part, item)
    boat:doDamageOverlay()
end

--***********************************************************
--**                                                       **
--**                         Sails                         **
--**                                                       **
--***********************************************************
function Boats.Create.Sails(boat, part)
-- print("Boats.Create.Sails")
    local item = VehicleUtils.createPartInventoryItem(part)
    CommonTemplates.createActivePart(part)
    part:getModData().sailCode = 0
    boat:transmitPartModData(part)
    if AquaConfig.Boat(boat) then
        part:setModelVisible("Boom", true)
        part:setModelVisible("SailCover", true)
        part:setModelVisible("SailLeft", false)
        part:setModelVisible("SailRight", false)
    else
        part:setModelVisible("Boom", false)
        part:setModelVisible("SailCover", false)
        part:setModelVisible("SailLeft", false)
        part:setModelVisible("SailRight", false)
    end
end

function Boats.Init.Sails(boat, part)
-- print("Boats.Init.Sails")
-- print("Boats.Init.Sails: ", boat:getX(), " ", boat:getY())
    if AquaConfig.Boat(boat) then
        -- print("AquaConfig.Boat(boat)!")
        local item = part:getInventoryItem()
        if not item then
            part:setModelVisible("Boom", true)
            part:setModelVisible("SailCover", false)
            part:setModelVisible("SailLeft", false)
            part:setModelVisible("SailRight", false)
            part:getModData().sailCode = 0
            boat:transmitPartModData(part)
            part:setLightActive(false)
        elseif part:getModData().sailCode == 1 then
            part:setModelVisible("Boom", false)
            part:setModelVisible("SailCover", false)
            part:setModelVisible("SailLeft", true)
            part:setModelVisible("SailRight", false)
            part:setLightActive(true)
        elseif part:getModData().sailCode == 2 then
            part:setModelVisible("Boom", false)
            part:setModelVisible("SailCover", false)
            part:setModelVisible("SailLeft", false)
            part:setModelVisible("SailRight", true)
            part:setLightActive(true)
        else
            part:getModData().sailCode = 0
            part:setModelVisible("Boom", true)
            part:setModelVisible("SailCover", true)
            part:setModelVisible("SailLeft", false)
            part:setModelVisible("SailRight", false)
            part:setLightActive(false)
        end
    else
        -- print("NOT AquaConfig.Boat(boat)!")
        part:getModData().sailCode = 0
        part:setModelVisible("Boom", false)
        part:setModelVisible("SailCover", false)
        part:setModelVisible("SailLeft", false)
        part:setModelVisible("SailRight", false)
    end
    boat:transmitPartModData(part)
end

-- function Boats.Init.SailsSet(boat, part)
    -- local item = VehicleUtils.createPartInventoryItem(part)
    -- CommonTemplates.createActivePart(part)
    -- part:setLightActive(true)
-- end

-- function Boats.Init.SailsRemoved(boat, part)
    -- local item = VehicleUtils.createPartInventoryItem(part)
    -- CommonTemplates.createActivePart(part)
    -- part:setLightActive(false)
-- end

function Boats.Update.SailsSet(boat, part, elapsedMinutes)
    BoatUtils.LowerCondition(boat, part, elapsedMinutes);
    local windSpeed = getClimateManager():getWindspeedKph()
    if part:getInventoryItem() and windSpeed > AquaConfig.windVeryStrong then
        local partCondition = part:getCondition()
        if partCondition == 1 then
            part:setCondition(0)
            boat:transmitPartCondition(part)
            boat:getEmitter():playSound("boat_sails_torned2")
        elseif partCondition > 0 then
            part:setCondition(part:getCondition() - 1)
            boat:transmitPartCondition(part)
            boat:getEmitter():playSound("boat_sails_torn" .. ZombRand(8)+1)
        else
            part:setLightActive(false)
        end
    end
end

function Boats.InstallTest.Sails(boat, part, playerObj)
    if part:getModData().sailCode ~= 0 then return false end
    return CommonTemplates.InstallTest.PartNotInCabin(boat, part, playerObj)
end

function Boats.InstallComplete.Sails(vehicle, part)
    local item = part:getInventoryItem()
    if not item then return end
    part:setModelVisible("Boom", true)
    part:setModelVisible("SailCover", true)
    part:setModelVisible("SailLeft", false)
    part:setModelVisible("SailRight", false)
    vehicle:doDamageOverlay()
    -- vehicle:getPartById("BoatName"):setModelVisible("Sakharov", true)
    -- vehicle:getPartById("BoatName"):setModelVisible("LB", false)
    
end

function Boats.UninstallTest.Sails(boat, part, playerObj)
    if part:getModData().sailCode ~= 0 then return false end
    return CommonTemplates.UninstallTest.PartNotInCabin(boat, part, playerObj)
end

function Boats.UninstallComplete.Sails(vehicle, part, item)
    if not item then return end
    part:setModelVisible("Boom", true)
    part:setModelVisible("SailCover", false)
    part:setModelVisible("SailLeft", false)
    part:setModelVisible("SailRight", false)
    vehicle:doDamageOverlay()
end

--***********************************************************
--**                                                       **
--**                     ManualStarter                     **
--**                                                       **
--***********************************************************
function Boats.Create.ManualStarter(boat, part)
    local item = VehicleUtils.createPartInventoryItem(part)
end

function Boats.InstallComplete.ManualStarter(boat, part, item)
    boat:cheatHotwire(true, false)
end

function Boats.UninstallComplete.ManualStarter(boat, part, item)
    boat:cheatHotwire(false, false)
end

--***********************************************************
--**                                                       **
--**                     ApiBoatAirbag                     **
--**                                                       **
--***********************************************************
function Boats.Create.ApiBoatAirbag(boat, part)
-- print("Boats.Create.ApiBoatAirbag")
    local item = VehicleUtils.createPartInventoryItem(part)
    part:setCondition(100)
    part:setContainerContentAmount(part:getContainerCapacity()/2, false, true);
    boat:transmitPartCondition(part)
end

function Boats.Init.ApiBoatAirbag(boat, part)
-- print("Boats.Init.ApiBoatAirbag")
    local item = VehicleUtils.createPartInventoryItem(part)
    part:setCondition(100)
    part:setContainerContentAmount(part:getContainerCapacity()/2, false, true);
    boat:transmitPartCondition(part)
end

--***********************************************************
--**                                                       **
--**                            Anchor                       **
--**                                                       **
--***********************************************************
function Boats.Create.BoatAnchor(boat, part)
-- print("Boats.Create.ApiBoatAirbag")
    -- local item = VehicleUtils.createPartInventoryItem(part)
    part:setInventoryItem(nil)
    boat:transmitPartItem(part)
end

function Boats.Init.BoatAnchor(boat, part)
-- print("Boats.Init.ApiBoatAirbag")
    -- local item = VehicleUtils.createPartInventoryItem(part)
    -- part:setCondition(100)
    -- part:setContainerContentAmount(part:getContainerCapacity()/2, false, true);
end

function Boats.Use.BoatAnchor(boat)
    if boat then
        local part = boat:getPartById("BoatAnchor")
        if part:getInventoryItem() then
            part:setInventoryItem(nil)
        else
            local item = VehicleUtils.createPartInventoryItem(part)
        end
        boat:transmitPartItem(part)
    else
        print("AQUATSAR error: Boats.Use.BoatAnchor")
    end
end

--***********************************************************
--**                                                       **
--**                            BoatCabinLock                       **
--**                                                       **
--***********************************************************
function Boats.Create.BoatCabinLock(boat, part)
-- print("Boats.Create.ApiBoatAirbag")
    -- local item = VehicleUtils.createPartInventoryItem(part)
    part:setInventoryItem(nil)
    boat:transmitPartItem(part)
end

function Boats.Init.BoatCabinLock(boat, part)
-- print("Boats.Init.ApiBoatAirbag")
    -- local item = VehicleUtils.createPartInventoryItem(part)
    -- part:setCondition(100)
    -- part:setContainerContentAmount(part:getContainerCapacity()/2, false, true);
end

function Boats.Use.BoatCabinLock(boat)
    local part = boat:getPartById("BoatAnchor")
    if part:getInventoryItem() then
        part:setInventoryItem(nil)
    else
        local item = VehicleUtils.createPartInventoryItem(part)
    end
    boat:transmitPartItem(part)
end


--***********************************************************
--**                                                       **
--**                        GasTank                        **
--**                                                       **
--***********************************************************
function Boats.Update.GasTank(boat, part, elapsedMinutes)
    local invItem = part:getInventoryItem();
    if not invItem then return; end
    local amount = part:getContainerContentAmount()
    if elapsedMinutes > 0 and amount > 0 and boat:isEngineRunning() then
        local amountOld = amount
        local gasMultiplier = 90000;
        local heater = boat:getHeater();
        if heater and heater:getModData().active then
            gasMultiplier = gasMultiplier - 5000;
        end
        local qualityMultiplier = ((100 - boat:getEngineQuality()) / 200) + 1;
        -- local massMultiplier =  ((math.abs(1000 - boat:getScript():getMass())) / 300) + 1;
        
        -- AUD.insp("Boat", "getCurrentSpeedKmHour:", boat:getCurrentSpeedKmHour())
        speedMultiplier = 800;
        if math.abs(boat:getEngineSpeed()) > 1000 then
            gasMultiplier = (gasMultiplier / qualityMultiplier) / 2;
        else
            gasMultiplier = (gasMultiplier / qualityMultiplier) * 3;
        end

        local newAmount = (speedMultiplier / gasMultiplier) * AquaConfig.Boat(boat).multiplierFuelConsumption * SandboxVars.CarGasConsumption;
        newAmount =  newAmount * (boat:getEngineSpeed()/2500.0);
        -- AUD.insp("Boat", "newAmount:", newAmount)
        amount = amount - elapsedMinutes * newAmount;
        -- if your gas tank is in bad condition, you can simply lose fuel
        if part:getCondition() < 70 then
            if ZombRand(part:getCondition() * 2) == 0 then
                amount = amount - 0.01;
            end
        end
    
        part:setContainerContentAmount(amount, false, true);
        amount = part:getContainerContentAmount();
        local precision = (amount < 0.5) and 2 or 1
        if VehicleUtils.compareFloats(amountOld, amount, precision) then
            boat:transmitPartModData(part)
        end
    end
end

function Boats.ContainerAccess.BlockSeat(boat, part, playerObj)
    return false
end

--***********************************************************
--**                                                       **
--**                        BoatUtils                      **
--**                                                       **
--***********************************************************


BoatUtils = {}

function BoatUtils.LowerCondition(vehicle, part, elapsedMinutes)
    if part:getInventoryItem() then
        local chance = vehicle:getEngineSpeed()/ 1000
        if part:getCondition() > 0 and ZombRandFloat(0, 100) < chance then
            part:setCondition(part:getCondition() - 1);
            vehicle:transmitPartCondition(part);
            vehicle:updatePartStats();
        end
        return chance;
    end
    return 0;
end

function BoatUtils.LowerEngineCondition(vehicle, part, elapsedMinutes)
    if vehicle:isEngineRunning() and part:getInventoryItem() then
        local chance = vehicle:getEngineSpeed()/ 1000
        if part:getCondition() > 0 and ZombRandFloat(0, 100) < chance then
            part:setCondition(part:getCondition() - 1);
            vehicle:transmitPartCondition(part);
            vehicle:updatePartStats();
        end
        return chance;
    end
    return 0;
end
