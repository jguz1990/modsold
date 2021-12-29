--***********************************************************
--**              	  ROBERT JOHNSON                       **
--**            UI display with a question or text         **
--**          can display a yes/no button or ok btn        **
--***********************************************************

require "ISUI/ISPanelJoypad"

FiveDigitCode = ISPanelJoypad:derive("FiveDigitCode");


--************************************************************************--
--** FiveDigitCode:initialise
--**
--************************************************************************--

function FiveDigitCode:initialise()
	ISPanel.initialise(self);
    self.button1p = ISButton:new((self:getWidth() / 2) - 48, (self:getHeight() / 2) - 25, 16, 16, getText("^"), self, FiveDigitCode.onClick);
    self.button1p.internal = "B1PLUS";
    self.button1p:initialise();
    self.button1p:instantiate();
    self.button1p.borderColor = {r=1, g=1, b=1, a=0.1};
    self:addChild(self.button1p);

    self.number1 = ISTextEntryBox:new("0", self:getWidth() / 2 - 48, self:getHeight() / 2 -5, 18, 18);
    self.number1:initialise();
    self.number1:instantiate();
    self:addChild(self.number1);

    self.button1m = ISButton:new(self:getWidth() / 2 - 48, (self:getHeight() / 2) + 16, 16, 16, getText("v"), self, FiveDigitCode.onClick);
    self.button1m.internal = "B1MINUS";
    self.button1m:initialise();
    self.button1m:instantiate();
    self.button1m.borderColor = {r=1, g=1, b=1, a=0.1};
    self:addChild(self.button1m);

    --
    self.button2p = ISButton:new(self:getWidth() / 2 -28, (self:getHeight() / 2) - 25, 16, 16, getText("^"), self, FiveDigitCode.onClick);
    self.button2p.internal = "B2PLUS";
    self.button2p:initialise();
    self.button2p:instantiate();
    self.button2p.borderColor = {r=1, g=1, b=1, a=0.1};
    self:addChild(self.button2p);

    self.number2 = ISTextEntryBox:new("0", self:getWidth() / 2 -28, self:getHeight() / 2 -5, 18, 18);
    self.number2:initialise();
    self.number2:instantiate();
    self:addChild(self.number2);

    self.button2m = ISButton:new(self:getWidth() / 2 -28, (self:getHeight() / 2) + 16, 16, 16, getText("v"), self, FiveDigitCode.onClick);
    self.button2m.internal = "B2MINUS";
    self.button2m:initialise();
    self.button2m:instantiate();
    self.button2m.borderColor = {r=1, g=1, b=1, a=0.1};
    self:addChild(self.button2m);

    --
    self.button3p = ISButton:new(self:getWidth() / 2 -8, (self:getHeight() / 2) - 25, 16, 16, getText("^"), self, FiveDigitCode.onClick);
    self.button3p.internal = "B3PLUS";
    self.button3p:initialise();
    self.button3p:instantiate();
    self.button3p.borderColor = {r=1, g=1, b=1, a=0.1};
    self:addChild(self.button3p);

    self.number3 = ISTextEntryBox:new("0", self:getWidth() / 2 - 8, self:getHeight() / 2 - 5, 18, 18);
    self.number3:initialise();
    self.number3:instantiate();
    self:addChild(self.number3);

    self.button3m = ISButton:new(self:getWidth() / 2 - 8, (self:getHeight() / 2) + 16, 16, 16, getText("v"), self, FiveDigitCode.onClick);
    self.button3m.internal = "B3MINUS";
    self.button3m:initialise();
    self.button3m:instantiate();
    self.button3m.borderColor = {r=1, g=1, b=1, a=0.1};
    self:addChild(self.button3m);
    --
    self.button4p = ISButton:new(self:getWidth() / 2 + 12, (self:getHeight() / 2) - 25, 16, 16, getText("^"), self, FiveDigitCode.onClick);
    self.button4p.internal = "B4PLUS";
    self.button4p:initialise();
    self.button4p:instantiate();
    self.button4p.borderColor = {r=1, g=1, b=1, a=0.1};
    self:addChild(self.button4p);

    self.number4 = ISTextEntryBox:new("0", self:getWidth() / 2 + 12, self:getHeight() / 2 - 5, 18, 18);
    self.number4:initialise();
    self.number4:instantiate();
    self:addChild(self.number4);

    self.button4m = ISButton:new(self:getWidth() / 2 + 12, (self:getHeight() / 2) + 16, 16, 16, getText("v"), self, FiveDigitCode.onClick);
    self.button4m.internal = "B4MINUS";
    self.button4m:initialise();
    self.button4m:instantiate();
    self.button4m.borderColor = {r=1, g=1, b=1, a=0.1};
    self:addChild(self.button4m);
    --
    self.button5p = ISButton:new(self:getWidth() / 2 + 32, (self:getHeight() / 2) - 25, 16, 16, getText("^"), self, FiveDigitCode.onClick);
    self.button5p.internal = "B5PLUS";
    self.button5p:initialise();
    self.button5p:instantiate();
    self.button5p.borderColor = {r=1, g=1, b=1, a=0.1};
    self:addChild(self.button5p);

    self.number5 = ISTextEntryBox:new("0", self:getWidth() / 2 + 32, self:getHeight() / 2 - 5, 18, 18);
    self.number5:initialise();
    self.number5:instantiate();
    self:addChild(self.number5);

    self.button5m = ISButton:new(self:getWidth() / 2 + 32, (self:getHeight() / 2) + 16, 16, 16, getText("v"), self, FiveDigitCode.onClick);
    self.button5m.internal = "B5MINUS";
    self.button5m:initialise();
    self.button5m:instantiate();
    self.button5m.borderColor = {r=1, g=1, b=1, a=0.1};
    self:addChild(self.button5m);

    --
    self.ok = ISButton:new((self:getWidth() / 2) - 13, self:getHeight() - 20, 26, 15, getText("UI_Ok"), self, FiveDigitCode.onClick);
    self.ok.internal = "OK";
    self.ok:initialise();
    self.ok:instantiate();
    self.ok.borderColor = {r=1, g=1, b=1, a=0.1};
    self:addChild(self.ok);

    self:insertNewLineOfButtons(self.button1p, self.button2p, self.button3p, self.button4p, self.button5p)
    self:insertNewLineOfButtons(self.button1m, self.button2m, self.button3m, self.button4m, self.button5m)
    self:insertNewLineOfButtons(self.ok)
end

function FiveDigitCode:destroy()
	UIManager.setShowPausedMessage(true);
	self:setVisible(false);
	self:removeFromUIManager();
	if UIManager.getSpeedControls() then
		UIManager.getSpeedControls():SetCurrentGameSpeed(1);
	end
	self.code = self:getCode()
	GPSCode2 (self.player, self.device, self.text, self.code)
end

function FiveDigitCode:onClick(button)
	
	--getSpecificPlayer(self.player):playSound("Key1")
    if button.internal == "OK" then
		--getSpecificPlayer(self.player):playSound("Key2")
        self:destroy();
        if JoypadState.players[self.player+1] then
            setJoypadFocus(self.player, nil)
        end
        --if self.onclick ~= nil then
            --self.onclick(self.target, button, self.character, self.padlock, self.thumpable);
        --end
	else
		getSpecificPlayer(self.player):playSound("Key2")
    end
    if button.internal == "B1PLUS" then
        self:increment(self.number1);
    end
    if button.internal == "B1MINUS" then
        self:decrement(self.number1);
    end
    if button.internal == "B2PLUS" then
        self:increment(self.number2);
    end
    if button.internal == "B2MINUS" then
        self:decrement(self.number2);
    end
    if button.internal == "B3PLUS" then
        self:increment(self.number3);
    end
    if button.internal == "B3MINUS" then
        self:decrement(self.number3);
    end
    if button.internal == "B4PLUS" then
        self:increment(self.number4);
    end
    if button.internal == "B4MINUS" then
        self:decrement(self.number4);
    end
    if button.internal == "B5PLUS" then
        self:increment(self.number5);
    end
    if button.internal == "B5MINUS" then
        self:decrement(self.number5);
    end
end

function FiveDigitCode:increment(number)
    local newNumber = tonumber(number:getText()) + 1;
    if newNumber > 9 then
        newNumber = 9;
    end
    number:setText(newNumber .. "");
end

function FiveDigitCode:decrement(number)
    local newNumber = tonumber(number:getText()) - 1;
    if newNumber < 0 then
        newNumber = 0;
    end
    number:setText(newNumber .. "");
end

function FiveDigitCode:prerender()
	self:drawRect(0, 0, self.width, self.height, self.backgroundColor.a, self.backgroundColor.r, self.backgroundColor.g, self.backgroundColor.b);
	self:drawRectBorder(0, 0, self.width, self.height, self.borderColor.a, self.borderColor.r, self.borderColor.g, self.borderColor.b);

        self:drawTextCentre(getText(self.text), self:getWidth()/2, 10, 1, 1, 1, 1, UIFont.Small);

end

--************************************************************************--
--** FiveDigitCode:render
--**
--************************************************************************--
function FiveDigitCode:render()

end

function FiveDigitCode:update()
    ISPanelJoypad.update(self)
   -- if self.character:getX() ~= self.playerX or self.character:getY() ~= self.playerY then
   --     self:destroy()
   -- end
end

function FiveDigitCode:onGainJoypadFocus(joypadData)
	ISPanelJoypad.onGainJoypadFocus(self, joypadData)
	self.joypadIndexY = 1
	self.joypadIndex = 1
	self.joypadButtons = self.joypadButtonsY[self.joypadIndexY]
	self.joypadButtons[self.joypadIndex]:setJoypadFocused(true)
end

function FiveDigitCode:onJoypadDown(button)
	ISPanelJoypad.onJoypadDown(self, button)
	if button == Joypad.BButton then
		self:onClick(self.ok)
	end
end

function FiveDigitCode:getCode()
    local n1 = tonumber(self.number1:getText()) * 10000
	--print(tostring(n1))
    local n2 = tonumber(self.number2:getText()) * 1000
	--print(tostring(n2))
    local n3 = tonumber(self.number3:getText()) * 100
	--print(tostring(n3))
    local n4 = tonumber(self.number4:getText()) * 10
	--print(tostring(n4))
    local n5 = tonumber(self.number5:getText())
	--print(tostring(n5))
    return n1 + n2 + n3 + n4 + n5
end

--************************************************************************--
--** FiveDigitCode:new
--**
--************************************************************************--
function FiveDigitCode:new(player, device, text)
	local x = 0
	local y = 0
	local width = 230
	local height = 120
	local o = {}
	o = ISPanelJoypad:new(x, y, width, height);
	setmetatable(o, self)
    self.__index = self
	local playerObj = player and getSpecificPlayer(player) or nil
	local playerObj = player
    o.character = playerObj;
	o.name = nil;
    o.backgroundColor = {r=0, g=0, b=0, a=0.5};
    o.borderColor = {r=0.4, g=0.4, b=0.4, a=1};
    if y == 0 then
		o.y = getPlayerScreenTop(player) + (getPlayerScreenHeight(player) - height) / 2
        o:setY(o.y)
    end
    if x == 0 then
		o.x = getPlayerScreenLeft(player) + (getPlayerScreenWidth(player) - width) / 2
        o:setX(o.x)
    end
	o.width = width;
	o.height = height;
	o.anchorLeft = true;
	o.anchorRight = true;
	o.anchorTop = true;
	o.anchorBottom = true;
	o.target = target;
	o.onclick = onclick;
    o.player = player;
    o.playerX = getPlayer():getX()
    o.playerY = getPlayer():getY()
    o.new = new;
	o.code = nil
	o.text = text
	o.device = device
    return o;
    --return code;
end

function GPSCode2 (player, device, text, code)
	--print("GPSCODE@")
	if text == "Set X Coordinate" then
		local modData = device:getModData()
		modData.beaconLock_X = code
		getPlayer(player):playSound("Beep1")
		local modal = FiveDigitCode:new(player, device, "Set Y Coordinate");
		modal:initialise();
		modal:addToUIManager();

	else
		local modData = device:getModData()
		modData.beaconLock_Y = code
		modData.beaconLock = true
		getPlayer(player):playSound("Beep1")
	end

end