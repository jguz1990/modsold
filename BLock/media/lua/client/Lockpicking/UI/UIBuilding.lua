if BetLock == nil then BetLock = {} end
if BetLock.UI == nil then BetLock.UI = {} end


function BetLock.UI.goToDoorBobbyPin(playerObj, door, goToOpen)
    local sq = door:getSquare()
    if door:getOppositeSquare():DistTo(playerObj:getSquare()) < door:getSquare():DistTo(playerObj:getSquare()) then
        sq = door:getOppositeSquare()
    end

    ISTimedActionQueue.add(ISWalkToTimedAction:new(playerObj, sq));
    if playerObj:getPrimaryHandItem() then
        ISTimedActionQueue.add(ISUnequipAction:new(playerObj, playerObj:getPrimaryHandItem(), 50));
    end
    if playerObj:getSecondaryHandItem() and playerObj:getSecondaryHandItem() ~= playerObj:getPrimaryHandItem() then
        ISTimedActionQueue.add(ISUnequipAction:new(playerObj, playerObj:getSecondaryHandItem(), 50));
    end

    ISTimedActionQueue.add(EmptyAction:new(playerObj, BobbyPinWindow.createBuildingDoor, nil, playerObj, door, goToOpen))
end

function BetLock.UI.goToDoorCrowbar(playerObj, door)
    local sq = door:getSquare()
    if door:getOppositeSquare():DistTo(playerObj:getSquare()) < door:getSquare():DistTo(playerObj:getSquare()) then
        sq = door:getOppositeSquare()
    end

    ISTimedActionQueue.add(ISWalkToTimedAction:new(playerObj, sq));

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

    ISTimedActionQueue.add(EmptyAction:new(playerObj, CrowbarWindow.createBuildingDoor, nil, playerObj, door))
end

function BetLock.UI.goToWindowCrowbar(playerObj, window)
    local sq = window:getSquare()
    if window:getOppositeSquare():DistTo(playerObj:getSquare()) < window:getSquare():DistTo(playerObj:getSquare()) then
        sq = window:getOppositeSquare()
    end

    ISTimedActionQueue.add(ISWalkToTimedAction:new(playerObj, sq));
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

    ISTimedActionQueue.add(EmptyAction:new(playerObj, CrowbarWindow.createBuildingWindow, nil, playerObj, window))
end


function BetLock.UI.contextMenuOptions(player, context, worldobjects)
    local playerObj = getSpecificPlayer(player)
    local playerSkill = playerObj:getPerkLevel(Perks.Lockpicking)
    local window = nil
    local door = nil

	for _, v in ipairs(worldobjects) do
        if instanceof(v, "IsoDoor") then     
            door = v
        elseif instanceof(v, "IsoWindow") then
            window = v
        end
    end
    
    if door then
        if door:getModData().LockpickLevel == nil then
            door:getModData().LockpickLevel = BetLock.Utils.getLockpickLevelBuildingObj(door)
        end
        
        if playerObj:getKnownRecipes():contains("Alarm check") and door:isExteriorDoor(playerObj) then
            context:addOption(getText("UI_BetLock_CheckAlarm"), playerObj, BetLock.UI.checkBuildingAlarm, door:getSquare(), door:getOppositeSquare(), door)
        end

        if playerObj:getKnownRecipes():contains("Lockpicking") then
            local lockpickingMenuOption = context:addOption(getText("UI_Lockpick"))
            local subMenuLockpicking = context:getNew(context)
            context:addSubMenu(lockpickingMenuOption, subMenuLockpicking)

            local option = subMenuLockpicking:addOption(getText("UI_Lockpick_bobbypin") .. " (" .. getText("ContextMenu_Open_door") .. ")", playerObj, BetLock.UI.goToDoorBobbyPin, door, true)
            option.toolTip = ISToolTip:new();
            option.toolTip:initialise();
            option.toolTip:setVisible(false);
            option.toolTip:setName(getText(door:getModData().LockpickLevel.name))

            local color
            if playerSkill >= door:getModData().LockpickLevel.num then
                color = " <RGB:1,1,1> "
            else
                color = " <RGB:0.9,0.5,0> "
            end
            option.toolTip.description = color .. getText("Tooltip_vehicle_recommendedSkill", playerSkill .. "/" .. door:getModData().LockpickLevel.num, "") .. " <LINE> "

            option.toolTip.description = option.toolTip.description .. " <RGB:1,1,1> " .. getText("UI_chance_break_lock") .. BetLock.Utils.getChanceBreakLock(playerSkill, door:getModData().LockpickLevel.num) .. "%" .. " <LINE> "

            if not (playerObj:getInventory():containsType("BobbyPin") or playerObj:getInventory():containsType("HandmadeBobbyPin")) then
                color = " <RGB:0.9,0,0> "
                option.toolTip.description = option.toolTip.description .. color .. getText("ContextMenu_Require", getItemNameFromFullType("BetLock.BobbyPin")) .. " <LINE> "
                option.notAvailable = true
            end

            if not playerObj:getInventory():containsType("Screwdriver") then
                color = " <RGB:0.9,0,0> "
                option.toolTip.description = option.toolTip.description .. color .. getText("ContextMenu_Require", getItemNameFromFullType("Base.Screwdriver")) .. " <LINE> "
                option.notAvailable = true
            end

            if door:getKeyId() == -3 then
                color = " <RGB:0.9,0,0> "
                option.toolTip.description = option.toolTip.description .. color .. getText("IGUI_LockBroken")
                option.notAvailable = true
            end

            ----
            option = subMenuLockpicking:addOption(getText("UI_Lockpick_bobbypin") .. " (" .. getText("ContextMenu_Close_door") .. ")", playerObj, BetLock.UI.goToDoorBobbyPin, door, false)
            option.toolTip = ISToolTip:new();
            option.toolTip:initialise();
            option.toolTip:setVisible(false);
            option.toolTip:setName(getText(door:getModData().LockpickLevel.name))

            local color
            if playerSkill >= door:getModData().LockpickLevel.num then
                color = " <RGB:1,1,1> "
            else
                color = " <RGB:0.9,0.5,0> "
            end
            option.toolTip.description = color .. getText("Tooltip_vehicle_recommendedSkill", playerSkill .. "/" .. door:getModData().LockpickLevel.num, "") .. " <LINE> "

            option.toolTip.description = option.toolTip.description .. " <RGB:1,1,1> " .. getText("UI_chance_break_lock") .. BetLock.Utils.getChanceBreakLock(playerSkill, door:getModData().LockpickLevel.num) .. "%".. " <LINE> "

            if not (playerObj:getInventory():containsType("BobbyPin") or playerObj:getInventory():containsType("HandmadeBobbyPin")) then
                color = " <RGB:0.9,0,0> "
                option.toolTip.description = option.toolTip.description .. color .. getText("ContextMenu_Require", getItemNameFromFullType("BetLock.BobbyPin")) .. " <LINE> "
                option.notAvailable = true
            end

            if not playerObj:getInventory():containsType("Screwdriver") then
                color = " <RGB:0.9,0,0> "
                option.toolTip.description = option.toolTip.description .. color .. getText("ContextMenu_Require", getItemNameFromFullType("Base.Screwdriver")) .. " <LINE> "
                option.notAvailable = true
            end

            if door:getKeyId() == -3 then
                color = " <RGB:0.9,0,0> "
                option.toolTip.description = option.toolTip.description .. color .. getText("IGUI_LockBroken")
                option.notAvailable = true
            end


            ----

            option = subMenuLockpicking:addOption(getText("UI_Lockpick_crowbar"), playerObj, BetLock.UI.goToDoorCrowbar, door)
            option.toolTip = ISToolTip:new()
            option.toolTip:initialise()
            option.toolTip:setVisible(false)
            option.toolTip:setName(getText(door:getModData().LockpickLevel.name))

            local color
            if playerSkill >= door:getModData().LockpickLevel.num then
                color = " <RGB:1,1,1> "
            else
                color = " <RGB:0.9,0.5,0> "
            end
            option.toolTip.description = color .. getText("Tooltip_vehicle_recommendedSkill", playerSkill .. "/" .. door:getModData().LockpickLevel.num, "") .. " <LINE> "


            if not playerObj:getInventory():containsType("Crowbar") then
                color = " <RGB:0.9,0,0> "
                option.toolTip.description = option.toolTip.description .. color .. getText("ContextMenu_Require", getItemNameFromFullType("Base.Crowbar"))
                option.notAvailable = true
            end
        end
    elseif window then
        if window:getModData().LockpickLevel == nil then
            window:getModData().LockpickLevel = BetLock.Utils.getLockpickLevelBuildingObj(window)
        end
        
        if playerObj:getKnownRecipes():contains("Alarm check") then
            context:addOption(getText("UI_BetLock_CheckAlarm"), playerObj, BetLock.UI.checkBuildingAlarm, window:getSquare(), window:getOppositeSquare(), window)
        end

        if playerObj:getKnownRecipes():contains("Lockpicking") and not window:isPermaLocked() then
            local lockpickingMenuOption = context:addOption(getText("UI_Lockpick"))
            local subMenuLockpicking = context:getNew(context)
            context:addSubMenu(lockpickingMenuOption, subMenuLockpicking)

            local option = subMenuLockpicking:addOption(getText("UI_Lockpick_crowbar"), playerObj, BetLock.UI.goToWindowCrowbar, window)
            option.toolTip = ISToolTip:new()
            option.toolTip:initialise()
            option.toolTip:setVisible(false)
            option.toolTip:setName(getText(window:getModData().LockpickLevel.name))

            local color
            if playerSkill >= window:getModData().LockpickLevel.num then
                color = " <RGB:1,1,1> "
            else
                color = " <RGB:0.9,0.5,0> "
            end
            option.toolTip.description = color .. getText("Tooltip_vehicle_recommendedSkill", playerSkill .. "/" .. window:getModData().LockpickLevel.num, "") .. " <LINE> "

            option.toolTip.description = option.toolTip.description .. " <RGB:1,1,1> " .. getText("UI_chance_break_window") .. BetLock.Utils.getChanceBreakLock(playerSkill, window:getModData().LockpickLevel.num) .. "%"

            if not playerObj:getInventory():containsType("Crowbar") then
                color = " <RGB:0.9,0,0> "
                option.toolTip.description = option.toolTip.description .. color .. getText("ContextMenu_Require", getItemNameFromFullType("Base.Crowbar"))
                option.notAvailable = true
            end
        end
    else
    end
end

Events.OnFillWorldObjectContextMenu.Add(BetLock.UI.contextMenuOptions);


function BetLock.UI.checkBuildingAlarm(playerObj, sq1, sq2, obj)
    local sq = sq1
    if sq2:DistTo(playerObj:getSquare()) < sq1:DistTo(playerObj:getSquare()) then
        sq = sq2
    end

    ISTimedActionQueue.add(ISWalkToTimedAction:new(playerObj, sq));
    ISTimedActionQueue.add(CheckAlarmBuildingAction:new(playerObj, sq1, sq2, obj));
end