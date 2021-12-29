
HotwireWindow = ISPanel:derive("HotwireWindow");

local WINDOW_WIDTH = 270
local WINDOW_HEIGHT = 284

local wires = {}
wires[1] = "red"
wires[2] = "blue"
wires[3] = "green"
wires[4] = "yellow"


function HotwireWindow:setVisible(visible)
    self.javaObject:setVisible(visible);
end

function HotwireWindow:prerender()
    ISPanel.prerender(self)
end


function HotwireWindow:render()
    self:drawText(getText("UI_Controls_Hotwire"), self.width/2 - (getTextManager():MeasureStringX(UIFont.Small, getText("UI_Controls_Hotwire")) / 2), 10, 1,1,1,1, UIFont.Small);
    self:drawRectBorder(0, 30, WINDOW_WIDTH, WINDOW_HEIGHT-60, 1, 0.4, 0.4, 0.4)

    if self.character:getVehicle() == nil then
        self:close()
    end
end

function HotwireWindow:onOptionMouseDown(button, x, y)
    if button.internal == "CANCEL" then
        self:setVisible(false);
        self:removeFromUIManager();
        self:close()
    end
end

function HotwireWindow:wireConnected(first, second)
    if first == wires[self.firstWire] and second == wires[self.secondWire]
        or second == wires[self.firstWire] and first == wires[self.secondWire] then
            sendClientCommand(self.character, "vehicle", "cheatHotwire", { vehicle = self.character:getVehicle():getId(), hotwired = true, broken = false })
            self:close()
    end
end

function HotwireWindow:close()
    ISPanel.close(self)
end


function HotwireWindow:createWindow(playerObj)
    local modal = HotwireWindow:new(Core:getInstance():getScreenWidth()/2 - WINDOW_WIDTH/2 + 400, Core:getInstance():getScreenHeight()/2 - 500/2, WINDOW_WIDTH, WINDOW_HEIGHT)
    modal.character = playerObj

    modal.firstWire = ZombRand(4) + 1
    modal.secondWire = ZombRand(4) + 1

    if modal.secondWire == modal.firstWire then
        if  modal.secondWire > 2 then
            modal.secondWire = modal.secondWire - 1
        else
            modal.secondWire = modal.secondWire + 1
        end        
    end

    modal:initialise()
    modal:addToUIManager()
end


function HotwireWindow:initialise()
    ISPanel.initialise(self);

    self.cancel = ISButton:new((self:getWidth() / 2) - 50, self:getHeight() - 25, 100, 20, getText("UI_Cancel"), self, HotwireWindow.onOptionMouseDown);
    self.cancel.internal = "CANCEL";
    self.cancel:initialise();
    self.cancel:instantiate();
    self.cancel.borderColor = {r=1, g=1, b=1, a=0.1};
    self:addChild(self.cancel);

    BetLock.Wires.addWires(self)
end


function HotwireWindow:new(x, y, width, height)
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