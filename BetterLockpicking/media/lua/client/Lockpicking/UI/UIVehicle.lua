if BetLock == nil then BetLock = {} end
if BetLock.UI == nil then BetLock.UI = {} end

-- Adding outside options
function BetLock.UI.addOutsideOptions(playerObj)
    local menu = getPlayerRadialMenu(playerObj:getPlayerNum())
    if menu == nil then return end

    local vehicle = playerObj:getUseableVehicle()
    if vehicle == nil then return end

    local part = vehicle:getUseablePart(playerObj)
    if part and part:getDoor()then
        if part:getDoor():isLocked() and playerObj:getKnownRecipes():contains("Lockpicking") then
            local playerSkill = playerObj:getPerkLevel(Perks.Lockpicking)
            if vehicle:getModData().LockpickLevel == nil then
                vehicle:getModData().LockpickLevel = BetLock.Utils.getLockpickingLevelVehicle(vehicle)
            end

            -- Bobby pin
            if not (playerObj:getInventory():containsType("BobbyPin") or playerObj:getInventory():containsType("HandmadeBobbyPin")) then
                menu:addSlice(getText("ContextMenu_Require", getItemNameFromFullType("BetLock.BobbyPin")), getTexture("media/textures/BetLock_lockpick_Icon.png"))
            elseif not playerObj:getInventory():containsType("Screwdriver") then
                menu:addSlice(getText("ContextMenu_Require", getItemNameFromFullType("Base.Screwdriver")), getTexture("media/textures/BetLock_lockpick_Icon.png"))
            else
                if part:getDoor():isLockBroken() then
                    menu:addSlice(getText("IGUI_PlayerText_VehicleLockIsBroken"), getTexture("media/textures/BetLock_lockpick_Icon.png"))
                else
                    local text = getText("UI_BetLock_LockpickDoorBobbyPin") .. " \n(" .. getText(vehicle:getModData().LockpickLevel.name) .. ")" 
                    menu:addSlice(text, getTexture("media/textures/BetLock_lockpick_Icon.png"), BetLock.UI.startLockpickingVehicleDoorBobbyPin, playerObj, part)
                end
            end

            -- Crowbar
            if not playerObj:getInventory():containsType("Crowbar") then
                menu:addSlice(getText("ContextMenu_Require", getItemNameFromFullType("Base.Crowbar")), getTexture("media/textures/BetLock_lockpick_Crowbar_Icon.png"))
            else
                local text = getText("UI_BetLock_LockpickDoorCrowBar") .. " \n(" .. getText(vehicle:getModData().LockpickLevel.name) .. ")" 
                menu:addSlice(text, getTexture("media/textures/BetLock_lockpick_Crowbar_Icon.png"), BetLock.UI.startLockpickingVehicleDoorCrowbar, playerObj, part)
            end
        end

        if part:getId() == "EngineDoor" and playerObj:getKnownRecipes():contains("Alarm check") then
            menu:addSlice(getText("UI_BetLock_CheckAlarm"), getTexture("media/textures/BetLock_alarmIcon.png"), BetLock.UI.alarmCheck, playerObj, vehicle, part)
        end
    end
end

-- Save default function for wrap it
if BetLock.UI.defaultShowRadialMenu == nil then
    BetLock.UI.defaultShowRadialMenu = ISVehicleMenu.showRadialMenu
end
  
-- Wrap default fuction
function ISVehicleMenu.showRadialMenu(playerObj)
    BetLock.UI.defaultShowRadialMenu(playerObj)
    
    if not playerObj:getVehicle() then
        BetLock.UI.addOutsideOptions(playerObj)
    end
end


-- Rewrite default hotwire
function ISVehicleMenu.onHotwire(playerObj)
	HotwireWindow:createWindow(playerObj)
end


-- Functions

function BetLock.UI.startLockpickingVehicleDoorBobbyPin(playerObj, part)
    local vehicle = part:getVehicle()
    playerObj:facePosition(vehicle:getX(), vehicle:getY())

    if playerObj:getPrimaryHandItem() then
        ISTimedActionQueue.add(ISUnequipAction:new(playerObj, playerObj:getPrimaryHandItem(), 50));
    end
    if playerObj:getSecondaryHandItem() and playerObj:getSecondaryHandItem() ~= playerObj:getPrimaryHandItem() then
        ISTimedActionQueue.add(ISUnequipAction:new(playerObj, playerObj:getSecondaryHandItem(), 50));
    end

    ISTimedActionQueue.add(EmptyAction:new(playerObj, BobbyPinWindow.createVehicleDoor, nil, playerObj, part))
end

function BetLock.UI.startLockpickingVehicleDoorCrowbar(playerObj, part)
    local vehicle = part:getVehicle()
    playerObj:facePosition(vehicle:getX(), vehicle:getY())
    
    if not playerObj:getPrimaryHandItem() or playerObj:getPrimaryHandItem():getType() ~= "Crowbar" then
        if playerObj:getPrimaryHandItem() then
            ISTimedActionQueue.add(ISUnequipAction:new(playerObj, playerObj:getPrimaryHandItem(), 50));
        end
        if playerObj:getSecondaryHandItem() and playerObj:getSecondaryHandItem() ~= playerObj:getPrimaryHandItem() then
            ISTimedActionQueue.add(ISUnequipAction:new(playerObj, playerObj:getSecondaryHandItem(), 50));
        end

        local item = playerObj:getInventory():getItemFromType("Crowbar")
        if item == nil then return end

        ISTimedActionQueue.add(ISEquipWeaponAction:new(playerObj, item, 50, true, item:isTwoHandWeapon()));
    end

    ISTimedActionQueue.add(EmptyAction:new(playerObj, CrowbarWindow.createVehicleDoor, nil, playerObj, part))
end

function BetLock.UI.alarmCheck(playerObj, vehicle, part)
    if not part:getDoor():isLocked() then
        ISTimedActionQueue.add(CheckAlarmVehicleAction:new(playerObj, vehicle));
    else
        playerObj:facePosition(vehicle:getX(), vehicle:getY())
        playerObj:getEmitter():playSound("DoorIsLocked")
    end
end