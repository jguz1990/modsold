if BetLock == nil then BetLock = {} end
BetLock.Wires = {}

local field_height = 224
local red_x = 40
local blue_x = 100
local green_x = 160
local yellow_x = 220


function BetLock.Wires.addWires(parent)
    parent:addChild(BetLock_BigRedWire:new(parent))
    parent:addChild(BetLock_BigBlueWire:new(parent))
    parent:addChild(BetLock_BigGreenWire:new(parent))
    parent:addChild(BetLock_BigYellowWire:new(parent))
end


----------------
-- Red
----------------

BetLock_BigRedWire = ISWire:derive("ISWire")

function BetLock_BigRedWire:onMouseDown(x, y)
    self.parent:removeChild(self)
    self.parent:addChild(BetLock_UpRedWire:new())
    self.parent:addChild(BetLock_DownRedWire:new(self.parent))
	return true
end

function BetLock_BigRedWire:new(parent)
    local texture = getTexture("media/textures/wire/wire_red_big.png")
    local width = texture:getWidth()
    local height = texture:getHeight()

    local o = ISWire.new(self, red_x, 0, width, height)
    o.parent = parent
    o.texture = texture

	return o
end

----------------

BetLock_UpRedWire = ISWire:derive("ISWire")

function BetLock_UpRedWire:new()
    local texture = getTexture("media/textures/wire/wire_red_up.png")
    local width = texture:getWidth()
    local height = texture:getHeight()

    local o = ISWire.new(self, red_x, 0, width, height)
    o.texture = texture

	return o
end

----------------

BetLock_DownRedWire = ISWire:derive("ISWire")

function BetLock_DownRedWire:onMouseDown(x, y)
    if self.parent.selectedWire == nil then
        self.texture = getTexture("media/textures/wire/wire_red_select.png")
        self.parent.selectedWire = self
    else
        if self.parent.selectedWire == self then
            self.texture = getTexture("media/textures/wire/wire_red.png")
            self.parent.selectedWire = nil
        else
            if self.parent.selectedWire.name == "blue" then
                self.parent:addChild(BetLock_BlueRedWire:new(self.parent))
            elseif self.parent.selectedWire.name == "yellow" then
                self.parent:addChild(BetLock_YellowRedWire:new(self.parent))
            elseif self.parent.selectedWire.name == "green" then
                self.parent:addChild(BetLock_GreenRedWire:new(self.parent))
            end
            self.parent:wireConnected(self.parent.selectedWire.name, self.name)
            self.parent:removeChild(self.parent.selectedWire)
            self.parent:removeChild(self)
            self.parent.selectedWire = nil
        end
    end
	return true
end

function BetLock_DownRedWire:new(parent)
    local texture = getTexture("media/textures/wire/wire_red.png")
    local width = texture:getWidth()
    local height = texture:getHeight()

    local o = ISWire.new(self, red_x, field_height - height, width, height)
    o.parent = parent
    o.texture = texture
    o.name = "red"

	return o
end

----------------
-- Blue
----------------


BetLock_BigBlueWire = ISWire:derive("ISWire")

function BetLock_BigBlueWire:onMouseDown(x, y)
    self.parent:removeChild(self)
    self.parent:addChild(BetLock_UpBlueWire:new())
    self.parent:addChild(BetLock_DownBlueWire:new(self.parent))
	return true
end

function BetLock_BigBlueWire:new(parent)
    local texture = getTexture("media/textures/wire/wire_blue_big.png")
    local width = texture:getWidth()
    local height = texture:getHeight()

    local o = ISWire.new(self, blue_x, 0, width, height)
    o.parent = parent
    o.texture = texture

	return o
end

----------------

BetLock_UpBlueWire = ISWire:derive("ISWire")

function BetLock_UpBlueWire:new()
    local texture = getTexture("media/textures/wire/wire_blue_up.png")
    local width = texture:getWidth()
    local height = texture:getHeight()

    local o = ISWire.new(self, blue_x, 0, width, height)
    o.texture = texture

	return o
end

----------------

BetLock_DownBlueWire = ISWire:derive("ISWire")

function BetLock_DownBlueWire:onMouseDown(x, y)
    if self.parent.selectedWire == nil then
        self.texture = getTexture("media/textures/wire/wire_blue_select.png")
        self.parent.selectedWire = self
    else
        if self.parent.selectedWire == self then
            self.texture = getTexture("media/textures/wire/wire_blue.png")
            self.parent.selectedWire = nil
        else
            if self.parent.selectedWire.name == "red" then
                self.parent:addChild(BetLock_BlueRedWire:new(self.parent))
            elseif self.parent.selectedWire.name == "yellow" then
                self.parent:addChild(BetLock_YellowBlueWire:new(self.parent))
            elseif self.parent.selectedWire.name == "green" then
                self.parent:addChild(BetLock_BlueGreenWire:new(self.parent))
            end
            self.parent:wireConnected(self.parent.selectedWire.name, self.name)
            self.parent:removeChild(self.parent.selectedWire)
            self.parent:removeChild(self)
            self.parent.selectedWire = nil
        end
    end
	return true
end

function BetLock_DownBlueWire:new(parent)
    local texture = getTexture("media/textures/wire/wire_blue.png")
    local width = texture:getWidth()
    local height = texture:getHeight()

    local o = ISWire.new(self, blue_x, field_height - height, width, height)
    o.parent = parent
    o.texture = texture
    o.name = "blue"

	return o
end



----------------
-- Green
----------------




BetLock_BigGreenWire = ISWire:derive("ISWire")

function BetLock_BigGreenWire:onMouseDown(x, y)
    self.parent:removeChild(self)
    self.parent:addChild(BetLock_UpGreenWire:new())
    self.parent:addChild(BetLock_DownGreenWire:new(self.parent))
	return true
end

function BetLock_BigGreenWire:new(parent)
    local texture = getTexture("media/textures/wire/wire_green_big.png")
    local width = texture:getWidth()
    local height = texture:getHeight()

    local o = ISWire.new(self, green_x, 0, width, height)
    o.parent = parent
    o.texture = texture

	return o
end

----------------

BetLock_UpGreenWire = ISWire:derive("ISWire")

function BetLock_UpGreenWire:new()
    local texture = getTexture("media/textures/wire/wire_green_up.png")
    local width = texture:getWidth()
    local height = texture:getHeight()

    local o = ISWire.new(self, green_x, 0, width, height)
    o.texture = texture

	return o
end

----------------

BetLock_DownGreenWire = ISWire:derive("ISWire")

function BetLock_DownGreenWire:onMouseDown(x, y)
    if self.parent.selectedWire == nil then
        self.texture = getTexture("media/textures/wire/wire_green_select.png")
        self.parent.selectedWire = self
    else
        if self.parent.selectedWire == self then
            self.texture = getTexture("media/textures/wire/wire_green.png")
            self.parent.selectedWire = nil
        else
            if self.parent.selectedWire.name == "red" then
                self.parent:addChild(BetLock_GreenRedWire:new(self.parent))
            elseif self.parent.selectedWire.name == "yellow" then
                self.parent:addChild(BetLock_YellowGreenWire:new(self.parent))
            elseif self.parent.selectedWire.name == "blue" then
                self.parent:addChild(BetLock_BlueGreenWire:new(self.parent))
            end
            self.parent:wireConnected(self.parent.selectedWire.name, self.name)
            self.parent:removeChild(self.parent.selectedWire)
            self.parent:removeChild(self)
            self.parent.selectedWire = nil
        end
    end
	return true
end

function BetLock_DownGreenWire:new(parent)
    local texture = getTexture("media/textures/wire/wire_green.png")
    local width = texture:getWidth()
    local height = texture:getHeight()

    local o = ISWire.new(self, green_x, field_height - height, width, height)
    o.parent = parent
    o.texture = texture
    o.name = "green"

	return o
end






----------------
-- Yellow
----------------




BetLock_BigYellowWire = ISWire:derive("ISWire")

function BetLock_BigYellowWire:onMouseDown(x, y)
    self.parent:removeChild(self)
    self.parent:addChild(BetLock_UpYellowWire:new())
    self.parent:addChild(BetLock_DownYellowWire:new(self.parent))
	return true
end

function BetLock_BigYellowWire:new(parent)
    local texture = getTexture("media/textures/wire/wire_yellow_big.png")
    local width = texture:getWidth()
    local height = texture:getHeight()

    local o = ISWire.new(self, yellow_x, 0, width, height)
    o.parent = parent
    o.texture = texture

	return o
end

----------------

BetLock_UpYellowWire = ISWire:derive("ISWire")

function BetLock_UpYellowWire:new()
    local texture = getTexture("media/textures/wire/wire_yellow_up.png")
    local width = texture:getWidth()
    local height = texture:getHeight()

    local o = ISWire.new(self, yellow_x, 0, width, height)
    o.texture = texture

	return o
end

----------------

BetLock_DownYellowWire = ISWire:derive("ISWire")

function BetLock_DownYellowWire:onMouseDown(x, y)
    if self.parent.selectedWire == nil then
        self.texture = getTexture("media/textures/wire/wire_yellow_select.png")
        self.parent.selectedWire = self
    else
        if self.parent.selectedWire == self then
            self.texture = getTexture("media/textures/wire/wire_yellow.png")
            self.parent.selectedWire = nil
        else
            if self.parent.selectedWire.name == "red" then
                self.parent:addChild(BetLock_YellowRedWire:new(self.parent))
            elseif self.parent.selectedWire.name == "blue" then
                self.parent:addChild(BetLock_YellowBlueWire:new(self.parent))
            elseif self.parent.selectedWire.name == "green" then
                self.parent:addChild(BetLock_YellowGreenWire:new(self.parent))
            end
            self.parent:wireConnected(self.parent.selectedWire.name, self.name)
            self.parent:removeChild(self.parent.selectedWire)
            self.parent:removeChild(self)
            self.parent.selectedWire = nil
        end
    end
	return true
end

function BetLock_DownYellowWire:new(parent)
    local texture = getTexture("media/textures/wire/wire_yellow.png")
    local width = texture:getWidth()
    local height = texture:getHeight()

    local o = ISWire.new(self, yellow_x, field_height - height, width, height)
    o.parent = parent
    o.texture = texture
    o.name = "yellow"

	return o
end




----------------
-- Combination
----------------

BetLock_BlueRedWire = ISWire:derive("ISWire")

function BetLock_BlueRedWire:onMouseDown(x, y)
    self.parent:removeChild(self)
    self.parent:addChild(BetLock_DownRedWire:new(self.parent))
    self.parent:addChild(BetLock_DownBlueWire:new(self.parent))
	return true
end

function BetLock_BlueRedWire:new(parent)
    local texture = getTexture("media/textures/wire/wire_blue_red.png")
    local width = texture:getWidth()
    local height = texture:getHeight()

    local o = ISWire.new(self, blue_x, field_height-height, width, height)
    o.parent = parent
    o.texture = texture

	return o
end

--------------

BetLock_BlueGreenWire = ISWire:derive("ISWire")

function BetLock_BlueGreenWire:onMouseDown(x, y)
    self.parent:removeChild(self)
    self.parent:addChild(BetLock_DownGreenWire:new(self.parent))
    self.parent:addChild(BetLock_DownBlueWire:new(self.parent))
	return true
end

function BetLock_BlueGreenWire:new(parent)
    local texture = getTexture("media/textures/wire/wire_blue_green.png")
    local width = texture:getWidth()
    local height = texture:getHeight()

    local o = ISWire.new(self, blue_x, field_height-height, width, height)
    o.parent = parent
    o.texture = texture

	return o
end

--------------

BetLock_GreenRedWire = ISWire:derive("ISWire")

function BetLock_GreenRedWire:onMouseDown(x, y)
    self.parent:removeChild(self)
    self.parent:addChild(BetLock_DownRedWire:new(self.parent))
    self.parent:addChild(BetLock_DownGreenWire:new(self.parent))
	return true
end

function BetLock_GreenRedWire:new(parent)
    local texture = getTexture("media/textures/wire/wire_green_red.png")
    local width = texture:getWidth()
    local height = texture:getHeight()

    local o = ISWire.new(self, green_x, field_height-height, width, height)
    o.parent = parent
    o.texture = texture

	return o
end

--------------

BetLock_YellowBlueWire = ISWire:derive("ISWire")

function BetLock_YellowBlueWire:onMouseDown(x, y)
    self.parent:removeChild(self)
    self.parent:addChild(BetLock_DownYellowWire:new(self.parent))
    self.parent:addChild(BetLock_DownBlueWire:new(self.parent))
	return true
end

function BetLock_YellowBlueWire:new(parent)
    local texture = getTexture("media/textures/wire/wire_yellow_blue.png")
    local width = texture:getWidth()
    local height = texture:getHeight()

    local o = ISWire.new(self, blue_x, field_height-height, width, height)
    o.parent = parent
    o.texture = texture

	return o
end

--------------

BetLock_YellowGreenWire = ISWire:derive("ISWire")

function BetLock_YellowGreenWire:onMouseDown(x, y)
    self.parent:removeChild(self)
    self.parent:addChild(BetLock_DownYellowWire:new(self.parent))
    self.parent:addChild(BetLock_DownGreenWire:new(self.parent))
	return true
end

function BetLock_YellowGreenWire:new(parent)
    local texture = getTexture("media/textures/wire/wire_yellow_green.png")
    local width = texture:getWidth()
    local height = texture:getHeight()

    local o = ISWire.new(self, green_x, field_height-height, width, height)
    o.parent = parent
    o.texture = texture

	return o
end

--------------

BetLock_YellowRedWire = ISWire:derive("ISWire")

function BetLock_YellowRedWire:onMouseDown(x, y)
    self.parent:removeChild(self)
    self.parent:addChild(BetLock_DownRedWire:new(self.parent))
    self.parent:addChild(BetLock_DownYellowWire:new(self.parent))
	return true
end

function BetLock_YellowRedWire:new(parent)
    local texture = getTexture("media/textures/wire/wire_yellow_red.png")
    local width = texture:getWidth()
    local height = texture:getHeight()

    local o = ISWire.new(self, red_x, field_height-height, width, height)
    o.parent = parent
    o.texture = texture

	return o
end