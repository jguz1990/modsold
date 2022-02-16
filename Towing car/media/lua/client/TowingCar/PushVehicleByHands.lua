

local function pushVehicle(playerObj, vehicle, direction)
    local lenHalf = vehicle:getScript():getPhysicsChassisShape():z()/2
    local widthHalf = vehicle:getScript():getPhysicsChassisShape():x()/2
    local x = 0
    local z = 0
    
    if direction == "FRONT" then
        z = lenHalf
    elseif direction == "BEHIND" then
        z = -lenHalf
    elseif direction == "LEFT_FRONT" then
        z = lenHalf*0.8
        x = widthHalf
    elseif direction == "LEFT_BEHIND" then
        z = -lenHalf*0.8
        x = widthHalf
    elseif direction == "RIGHT_FRONT" then
        z = lenHalf*0.8
        x = -widthHalf
    elseif direction == "RIGHT_BEHIND" then
        z = -lenHalf*0.8
        x = -widthHalf
    end

    local pushPoint = vehicle:getWorldPos(x, 0, z, TowCarMod.Utils.tempVector1)
    ISTimedActionQueue.add(TACustomPathFind:pathToLocationF(playerObj, pushPoint:x(), pushPoint:y(), pushPoint:z()))

    -- Unequip item
    local storePrim = playerObj:getPrimaryHandItem()
    if storePrim ~= nil then
        ISTimedActionQueue.add(ISUnequipAction:new(playerObj, storePrim, 12));
    end

    ISTimedActionQueue.add(TAPushVehicle:new(playerObj, vehicle, direction))
end


local function addOptionPushVehicle(playerObj, context, vehicle)
    local pushOption = context:addOption(getText("UI_Text_PushByHands"))
    local subMenuMain = context:getNew(context)
    context:addSubMenu(pushOption, subMenuMain)

    local leftOption = subMenuMain:addOption(getText("UI_Text_PushByHands_Left"))
    local subMenuLeft = context:getNew(context)
    context:addSubMenu(leftOption, subMenuLeft)
    subMenuLeft:addOption(getText("UI_Text_PushByHands_Front"), playerObj, pushVehicle, vehicle, "LEFT_FRONT")
    subMenuLeft:addOption(getText("UI_Text_PushByHands_Behind"), playerObj, pushVehicle, vehicle, "LEFT_BEHIND")

    local rightOption = subMenuMain:addOption(getText("UI_Text_PushByHands_Right"))
    local subMenuRight = context:getNew(context)
    context:addSubMenu(rightOption, subMenuRight)
    subMenuRight:addOption(getText("UI_Text_PushByHands_Front"), playerObj, pushVehicle, vehicle, "RIGHT_FRONT")
    subMenuRight:addOption(getText("UI_Text_PushByHands_Behind"), playerObj, pushVehicle, vehicle, "RIGHT_BEHIND")

    subMenuMain:addOption(getText("UI_Text_PushByHands_Front"), playerObj, pushVehicle, vehicle, "FRONT")
    subMenuMain:addOption(getText("UI_Text_PushByHands_Behind"), playerObj, pushVehicle, vehicle, "BEHIND")
end


-- Wrap the original function
local defaultMenuOutsideVehicle
if not defaultMenuOutsideVehicle then
    defaultMenuOutsideVehicle = ISVehicleMenu.FillMenuOutsideVehicle
end

-- Override the original function
function ISVehicleMenu.FillMenuOutsideVehicle(player, context, vehicle, test)
    defaultMenuOutsideVehicle(player, context, vehicle, test)

    addOptionPushVehicle(getSpecificPlayer(player), context, vehicle)
end
