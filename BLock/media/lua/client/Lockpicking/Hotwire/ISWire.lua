ISWire = ISUIElement:derive("ISWire")


function ISWire:render()
	self:drawTexture(self.texture, 0, 0, 1, 1, 1, 1)
end

function ISWire:new(x, y, width, height)
	local o = ISUIElement.new(self, x - width/2, y + 30, width, height)
	o.width = width
	o.height = height
	o.isShow = false

	return o
end