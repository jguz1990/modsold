
CrowbarWindow = ISPanel:derive("CrowbarWindow");

local WINDOW_WIDTH = 340
local WINDOW_HEIGHT = 150
----
local greenSize = 10
local yellowSize = 40
local shiftYellow = 90
local shiftGreen = 135
----
local xShift = 20
local yShift = 40

local MODE_VEHICLE_DOOR = 0
local MODE_WINDOW = 1
local MODE_BUILDING_DOOR = 2

local arrowTex = getTexture("media/textures/BetLock_arrow.png") --
local arrow_scale_step = 0
local arrowSpeed = 3
local arrow_dx = arrowSpeed
local arrow_step_to_x = (WINDOW_WIDTH - xShift*2)/100

local crowbarTimer = 0
local progressBarVal = 0

--------------

function CrowbarWindow:setVisible(visible)
    self.javaObject:setVisible(visible);
end

function CrowbarWindow:prerender()
    ISPanel.prerender(self)

    self:drawRect(xShift, yShift + 30, WINDOW_WIDTH - xShift*2, 20, 0.8, 1, 0, 0)
    self:drawRect(xShift + shiftYellow, yShift + 30, yellowSize*3, 20, 0.8, 1, 1, 0)
    self:drawRect(xShift + shiftGreen, yShift + 30, greenSize*3, 20, 0.8, 0, 1, 0)
    self:drawRectBorder(xShift, yShift + 30, WINDOW_WIDTH - xShift*2, 20, 1, 0.4, 0.4, 0.4)
end

local lastRenderMillis = nil
function CrowbarWindow:render()
    self:drawText(getText("UI_Controls_Crowbar"), self.width/2 - (getTextManager():MeasureStringX(UIFont.Small, getText("UI_Controls_Crowbar")) / 2), 10, 1,1,1,1, UIFont.Small);

    self:drawProgressBar(xShift, yShift, WINDOW_WIDTH - xShift*2, 20, progressBarVal, {r=0, g=0.6, b=0, a=0.8 })
    self:drawRectBorder(xShift, yShift, WINDOW_WIDTH - xShift*2, 20, 1, 0.4, 0.4, 0.4)

    self:drawTexture(arrowTex, xShift - arrowTex:getWidth()/2 + arrow_scale_step*arrow_step_to_x, 75+30, 1, 1, 1, 1)
    
    local currentMillis = math.floor(getTimeInMillis())
    local isNewTimeStep = false
    if lastRenderMillis ~= currentMillis then
        lastRenderMillis = currentMillis
        isNewTimeStep = true
    end


    if crowbarTimer > 0 then return end

    if isNewTimeStep then
        arrow_scale_step = arrow_scale_step + arrow_dx
        if arrow_scale_step >= 100 then
            arrow_scale_step = 100
            arrow_dx = -arrowSpeed
        elseif arrow_scale_step <= 0 then
            arrow_scale_step = 0
            arrow_dx = arrowSpeed
        end
    end
end

function CrowbarWindow:onOptionMouseDown(button, x, y)
    if button.internal == "CANCEL" then
        self:setVisible(false);
        self:removeFromUIManager();
        self:close()
    end
end

function CrowbarWindow:doUnlock()
    if self.mode == MODE_VEHICLE_DOOR then
        self.lockpick_object:getDoor():setLocked(false)
        self.lockpick_object:getDoor():setLockBroken(true)
        self.character:getEmitter():playSound("UnlockDoor");
        self.lockpick_object:setCondition(math.min(self.lockpick_object:getCondition(), ZombRand(50) + 25))
    elseif self.mode == MODE_WINDOW then
        self.lockpick_object:setIsLocked(false)

        local skill = self.character:getPerkLevel(Perks.Lockpicking)
        local level = self.lockpick_object:getModData().LockpickLevel.num
        local chanceBreak = BetLock.Utils.getChanceBreakLock(skill, level)

        if ZombRand(100) < chanceBreak then
            self.lockpick_object:Damage(100)
        end
    else
        self.lockpick_object:setLockedByKey(false);
        self.lockpick_object:setKeyId(-3);
        self.lockpick_object:Damage(50)

        if IsoDoor.getGarageDoorIndex(self.lockpick_object) ~= -1 then
            local doorPrev = IsoDoor.getGarageDoorPrev(self.lockpick_object)
            while doorPrev ~= nil do
                doorPrev:setLockedByKey(false);
                doorPrev = IsoDoor.getGarageDoorPrev(doorPrev)
            end
    
            local doorNext = IsoDoor.getGarageDoorNext(self.lockpick_object)
            while doorNext ~= nil do
                doorNext:setLockedByKey(false);
                doorNext = IsoDoor.getGarageDoorNext(doorNext)
            end
        end

        self.character:getEmitter():playSound("UnlockDoor");
    end
    self.character:getXp():AddXP(Perks.Lockpicking, self.addingXP);
end


function CrowbarWindow:close()
    self.lockpick_object:getModData()["BetLock_crowbarProgressBar"] = progressBarVal

    getCore():addKeyBinding("Left", self.character:getModData()["Lockpick_Left"])
    self.character:getModData()["Lockpick_Left"] = nil
    getCore():addKeyBinding("Right", self.character:getModData()["Lockpick_Right"])
    self.character:getModData()["Lockpick_Right"] = nil
    getCore():addKeyBinding("Forward", self.character:getModData()["Lockpick_Forward"])
    self.character:getModData()["Lockpick_Forward"] = nil
    getCore():addKeyBinding("Backward", self.character:getModData()["Lockpick_Backward"])
    self.character:getModData()["Lockpick_Backward"] = nil
    getCore():addKeyBinding("Melee", self.character:getModData()["Lockpick_Melee"])
    self.character:getModData()["Lockpick_Melee"] = nil
    
    ISTimedActionQueue.clear(self.character)

    CrowbarWindow.instance = nil
    ISPanel.close(self)
end

--------------------------
-- Creating window
--------------------------

function CrowbarWindow:createVehicleDoor(playerObj, part)
    local modal = CrowbarWindow:new(Core:getInstance():getScreenWidth()/2 - WINDOW_WIDTH/2 + 300, Core:getInstance():getScreenHeight()/2 - 500/2, WINDOW_WIDTH, WINDOW_HEIGHT)
    modal.lockpick_object = part
    modal.mode = MODE_VEHICLE_DOOR
    modal.character = playerObj
    modal.diffLevel = part:getVehicle():getModData().LockpickLevel.num
    modal.addingXP = part:getVehicle():getModData().LockpickLevel.xp
    modal.isGarage = false

    modal:initialise()
    modal:addToUIManager()
end

function CrowbarWindow:createBuildingWindow(playerObj, window)
    local dx = window:getSquare():getX() - playerObj:getSquare():getX()
    local dy = window:getSquare():getY() - playerObj:getSquare():getY()
    local zGood = math.abs(window:getSquare():getZ() - playerObj:getSquare():getZ()) < 2
    local dist = math.sqrt(dx*dx + dy*dy)
    
    
    if not zGood or dist > 2 then 
        return
    end

    if not window:isLocked() then
        playerObj:Say(getText("UI_window_is_unlocked"))
        return
    end
    
    local modal = CrowbarWindow:new(Core:getInstance():getScreenWidth()/2 - WINDOW_WIDTH/2 + 300, Core:getInstance():getScreenHeight()/2 - 500/2, WINDOW_WIDTH, WINDOW_HEIGHT)

    modal.lockpick_object = window
    modal.mode = MODE_WINDOW
    modal.character = playerObj
    modal.diffLevel = window:getModData().LockpickLevel.num
    modal.addingXP = window:getModData().LockpickLevel.xp
    modal.isGarage = false

    local pos = window:getFacingPosition(playerObj:getPlayerMoveDir())
    if not window:getNorth() then
        playerObj:facePosition(pos:getX(), pos:getY()+1)
    else
        playerObj:facePosition(pos:getX()+1, pos:getY())
    end

    modal:initialise()
    modal:addToUIManager()
end

function CrowbarWindow:createBuildingDoor(playerObj, door)
    local dx = door:getSquare():getX() - playerObj:getSquare():getX()
    local dy = door:getSquare():getY() - playerObj:getSquare():getY()
    local zGood = math.abs(door:getSquare():getZ() - playerObj:getSquare():getZ()) < 2
    local dist = math.sqrt(dx*dx + dy*dy)
    
    if not zGood or dist > 2 then 
        return
    end

    if not door:isLocked() then
        playerObj:Say(getText("UI_door_is_unlocked"))
        return
    end

    local modal = CrowbarWindow:new(Core:getInstance():getScreenWidth()/2 - WINDOW_WIDTH/2 + 300, Core:getInstance():getScreenHeight()/2 - 500/2, WINDOW_WIDTH, WINDOW_HEIGHT)
    modal.lockpick_object = door
    modal.mode = MODE_BUILDING_DOOR
    modal.character = playerObj
    modal.addingXP = door:getModData().LockpickLevel.xp
    modal.diffLevel = door:getModData().LockpickLevel.num
    modal.isGarage = IsoDoor.getGarageDoorIndex(door) ~= -1

    local pos = door:getFacingPosition(playerObj:getPlayerMoveDir())
    if not door:getNorth() then
        playerObj:facePosition(pos:getX(), pos:getY()+1)
    else
        playerObj:facePosition(pos:getX()+1, pos:getY())
    end

    modal:initialise()
    modal:addToUIManager()
end


function CrowbarWindow:initialise()
    if not self.character:getInventory():containsType("Crowbar") then 
        return
    end

    ISPanel.initialise(self);
    self:create();
    CrowbarWindow.instance = self

    --
    local skill = self.character:getPerkLevel(Perks.Lockpicking)
    local sizes = BetLock.Utils.getGreenYellowSize(skill, self.diffLevel)
    greenSize = sizes[1]
    yellowSize = sizes[2]

    shiftGreen = ZombRand(100-greenSize)*3
    shiftYellow = ZombRand(100-yellowSize)*3 
    --
    progressBarVal = self.lockpick_object:getModData()["BetLock_crowbarProgressBar"]
    if progressBarVal == nil then
        progressBarVal = 0
    end
    --

    self.character:getModData()["Lockpick_Left"] = getCore():getKey("Left")
    getCore():addKeyBinding("Left", nil)
    self.character:getModData()["Lockpick_Right"] = getCore():getKey("Right")
    getCore():addKeyBinding("Right", nil)
    self.character:getModData()["Lockpick_Forward"] = getCore():getKey("Forward")
    getCore():addKeyBinding("Forward", nil)
    self.character:getModData()["Lockpick_Backward"] = getCore():getKey("Backward")
    getCore():addKeyBinding("Backward", nil)
    self.character:getModData()["Lockpick_Melee"] = getCore():getKey("Melee")
    getCore():addKeyBinding("Melee", nil)

    ISTimedActionQueue.clear(self.character)
    ISTimedActionQueue.add(CrowbarActionAnim:new(self.character, self.isGarage))
end

function CrowbarWindow:create()
    self.cancel = ISButton:new((self:getWidth() / 2) - 50, self:getHeight() - 25, 100, 20, getText("UI_Cancel"), self, CrowbarWindow.onOptionMouseDown);
    self.cancel.internal = "CANCEL";
    self.cancel:initialise();
    self.cancel:instantiate();
    self.cancel.borderColor = {r=1, g=1, b=1, a=0.1};
    self:addChild(self.cancel);
end


function CrowbarWindow:new(x, y, width, height)
    local o = {};
    o = ISPanel:new(x, y, width, height);
    setmetatable(o, self);
    self.__index = self;
    o.variableColor={r=0.9, g=0.55, b=0.1, a=1};
    o.borderColor = {r=0.4, g=0.4, b=0.4, a=1};
    o.backgroundColor = {r=0, g=0, b=0, a=0.8};

    o.zOffsetSmallFont = 25;
    o.moveWithMouse = true;
    o:setWantKeyEvents(true)
    return o;
end

function CrowbarWindow:ActionKeyPressed()
    if crowbarTimer > 0 then return end

    if arrow_scale_step >= shiftGreen/3 and arrow_scale_step <= (shiftGreen/3 + greenSize) then
        progressBarVal = progressBarVal + 0.4
    elseif arrow_scale_step >= shiftYellow/3 and arrow_scale_step <= (shiftYellow/3 + yellowSize) then
        progressBarVal = progressBarVal + 0.2
    else
        progressBarVal = progressBarVal + 0.04
    end

    if progressBarVal >= 1.0 then
        self.isEnd = true
        self:doUnlock()
    end

    local strength = self.character:getPerkLevel(Perks.Strength)
    local endurance = self.character:getStats():getEndurance()
    if endurance < 0.1 then
        self:close()
        return
    end
    self.character:getStats():setEndurance(endurance - (20 - strength)/100)
    
    crowbarTimer = 50
end

CrowbarWindow.OnKeyStartPressed = function(key)
    if CrowbarWindow.instance == nil then return end
    local win = CrowbarWindow.instance

    if key == Keyboard.KEY_SPACE then
       win:ActionKeyPressed()
    end

    if key == Keyboard.KEY_ESCAPE then
        win:close()
    end
end

local lastMillis = nil
CrowbarWindow.onTick = function()
    local currentMillis = math.floor(getTimeInMillis()/50)
    if lastMillis ~= currentMillis then
        lastMillis = currentMillis

        if CrowbarWindow.instance == nil then return end

        if crowbarTimer > 0 then
            crowbarTimer = crowbarTimer - 1
            if crowbarTimer == 0 and CrowbarWindow.instance.isEnd then
                CrowbarWindow.instance:close()
            end
        end
    end
end


Events.OnKeyStartPressed.Add(CrowbarWindow.OnKeyStartPressed);
Events.OnTick.Add(CrowbarWindow.onTick);
