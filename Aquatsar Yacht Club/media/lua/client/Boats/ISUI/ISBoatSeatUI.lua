--***********************************************************
--**        THE INDIE STONE/edited by iBrRus               **
--***********************************************************

require "ISUI/ISPanelJoypad"
require 'CommonTemplates/CommonTemplates.lua'
require 'AquaConfig'

ISBoatSeatUI = ISPanelJoypad:derive("ISBoatSeatUI")

local FONT_HGT_MEDIUM = getTextManager():getFontHeight(UIFont.Medium)
local FONT_HGT_LARGE = getTextManager():getFontHeight(UIFont.Large)

function ISBoatSeatUI:createChildren()
	local btnWid = 100
	local btnHgt = 25
	local padBottom = 10

	self.richText = ISRichTextLayout:new(self.width)
	self.richText:setMargins(10, 0, 10, 0)

	self.close = ISButton:new((self:getWidth() - btnWid) / 2, self:getHeight() - padBottom - btnHgt,
							  btnWid, btnHgt, getText("UI_Cancel"), self, ISBoatSeatUI.closeSelf)
	self.close.internal = "CLOSE"
	self.close.anchorTop = false
	self.close.anchorBottom = true
	self.close:initialise()
	self.close:instantiate()
	self.close.borderColor = {r=1, g=1, b=1, a=0.1}
	self:addChild(self.close)
end

function ISBoatSeatUI:prerender()
	ISPanelJoypad.prerender(self)

	if not self.vehicle then return end
	local script = self.vehicle:getScript()

	if self.mouseOverExit then
		self:drawTextCentre(getText("IGUI_ExitVehicle"), self:getWidth() / 2, 6, 1, 1, 1, 1, UIFont.Medium)
		return
	end

	local playerSeat = self.vehicle:getSeat(self.character)

	local seat = self.joyfocus and (self.joypadSeat - 1) or self.mouseOverSeat
	if not seat then return end
	local seatname = 'Seat'..script:getPassenger(seat):getId()
	if getTextOrNull("IGUI_Boat" .. seatname) ~= nil then
		seatname = getText("IGUI_Boat" .. seatname);
	end
	self:drawTextCentre(seatname, self:getWidth() / 2, 6, 1, 1, 1, 1, UIFont.Medium)
	local str = nil
	-- FIXME: can player sit where there is no seat installed?
	if not self:isSeatInstalled(seat) then
		str = getText("IGUI_BoatSeat_Uninstalled")
	elseif self.vehicle:isSeatOccupied(seat) then
		if not ISVehicleMenu.moveItemsFromSeat(self.character, self.vehicle, seat, false, false) then
			str = getText("IGUI_BoatSeat_Items")
		else
			str = getText("IGUI_BoatSeat_MoveItems")
		end
		if self.characterSeat == seat then
			str = getText("IGUI_BoatSeat_Self")
		elseif self.vehicle:getCharacter(seat) then
			str = getText("IGUI_BoatSeat_Person")
		end
	elseif playerSeat ~= -1 and  not self.vehicle:canSwitchSeat(playerSeat, seat) then
		str = getText("IGUI_BoatSeat_ExitToSwitch")
	end
	if str then
		if str ~= self.seatText then
			self.seatText = str
			self.richText:setText(" <RED> <CENTRE> " .. str)
			self.richText.textDirty = true
		end
		self.richText:render(0, 6 + FONT_HGT_MEDIUM, self)
	end
end

local ImageScale = {}
ImageScale["temp_"] = 1.0

local SeatOffsetY = {}
SeatOffsetY["Base.BoatTemp"] = 4

local SeatOffsetX = {}
SeatOffsetX["Base.BoatTemp"] = 0;


function ISBoatSeatUI:render()
	ISPanelJoypad.render(self)

	self.mouseOverSeat = nil
	self.mouseOverExit = nil

	if not self.vehicle then return end
	
	local script = self.vehicle:getScript()
	local scriptName = self.vehicle:getScriptName()
	local extents = script:getExtents()
	local ratio = extents:x() / extents:z() + 0.0
	local height = self.height * 0.7
	local width = height * ratio
	local ex = (self.width - width) / 2
	local ey = (self.height - height) / 2
	local imageName = AquaConfig.Boats[script:getName()].boatSeatUI_Image
	local imageScale = AquaConfig.Boats[script:getName()].boatSeatUI_Scale

	if imageName then
		local tex = getTexture("media/ui/boats/seatui/" .. imageName .. ".png")
		if tex then
			self:drawTextureScaledUniform(tex,
				(self.width - tex:getWidthOrig() * imageScale) / 2,
				(self.height - tex:getHeightOrig() * imageScale) / 2,
				imageScale, 1,1,1,1)
		else
			self:drawRect(ex, ey, width, height, 0.8, 0.0, 0.0, 0.0)
			self:drawRectBorder(ex, ey, width, height, 1.0, 1.0, 1.0, 1.0)
		end
	else
		self:drawRect(ex, ey, width, height, 0.8, 0.0, 0.0, 0.0)
		self:drawRectBorder(ex, ey, width, height, 1.0, 1.0, 1.0, 1.0)
	end

	local playerSeat = self.vehicle:getSeat(self.character)

	local shiftKey = isKeyDown(Keyboard.KEY_LSHIFT) or isKeyDown(Keyboard.KEY_RSHIFT)

	local scale = height / extents:z()
	local sizeX,sizeY = 41,59
	local playerInCabin = false
	if self.characterSeat then
		if self.vehicle:getPartById("InCabin" .. seatNameTable[self.characterSeat+1]) then
			playerInCabin = true
		end
	end
	for seat=1,self.vehicle:getMaxPassengers() do
		local pngr = script:getPassenger(seat-1)
		local posn = pngr:getPositionById("inside")

		local playerHaveAccesToCabin = self.vehicle:getModData()["AquaCabin_isUnlocked"]
		local isCabin = false
		
		if self.vehicle:getPartById("InCabin" .. seatNameTable[seat]) then
			isCabin = true
		end
		
		if posn then
			local offset = posn:getOffset()
			local x = self:getWidth() / 2 - offset:get(0) * scale - sizeX / 2
			local y = self:getHeight() / 2 - offset:get(2) * scale - sizeY / 2
			y = y + (AquaConfig.Boats[script:getName()].boatSeatUI_SeatOffsetY[pngr:getId()] or 0.0)
			x = x + (AquaConfig.Boats[script:getName()].boatSeatUI_SeatOffsetX[pngr:getId()] or 0.0)
		
			local mouseOver = (self:getMouseX() >= x and self:getMouseX() < x + sizeX and
					self:getMouseY() >= y and self:getMouseY() < y + sizeY) or
					(self.joyfocus and self.joypadSeat == seat)
			if mouseOver then
				self.mouseOverSeat = seat - 1
			end

			local fillR, fillG, fillB = 0.0, 0.0, 0.0
			local outlineR, outlineG, outlineB = 0.0, 1.0, 0.0
			local texName = "icon_vehicle_empty.png"
			local textRGB = 1.0
			local canSwitch = false
			if self.vehicle:isSeatOccupied(seat-1) then
				if self.vehicle:getCharacter(seat-1) then
					texName = "icon_vehicle_person.png"
					fillR = 0.0
					fillG = 0.0
					fillB = 1.0
				else
					fillR, fillG, fillB = 1.0, 1.0, 1.0
					textRGB = 0.0 -- black text on white background
					texName = "icon_vehicle_stuff.png"
					if ISVehicleMenu.moveItemsFromSeat(self.character, self.vehicle, seat-1, false, false) then
						canSwitch = true
					else
						
					end
				end
				if mouseOver then
					outlineR = 1.0
					outlineG = 0.0
					outlineB = 0.0
				end
			elseif self.vehicle:getPartForSeatContainer(seat-1) and
					not self.vehicle:getPartForSeatContainer(seat-1):getInventoryItem() then
				texName = "icon_vehicle_uninstalled.png"
				fillR = 0.5
				fillG = 0.5
				fillB = 0.5
				if mouseOver then
					outlineR = 1.0
					outlineG = 0.0
					outlineB = 0.0
				end
			elseif isCabin and not playerHaveAccesToCabin and not playerInCabin then
				texName = "icon_vehicle_uninstalled.png"
				fillR = 0.5
				fillG = 0.5
				fillB = 0.5
				if mouseOver then
					outlineR = 1.0
					outlineG = 0.0
					outlineB = 0.0
				end
				canSwitch = false
			elseif not isCabin and not playerHaveAccesToCabin and playerInCabin then
				texName = "icon_vehicle_uninstalled.png"
				fillR = 0.5
				fillG = 0.5
				fillB = 0.5
				if mouseOver then
					outlineR = 1.0
					outlineG = 0.0
					outlineB = 0.0
				end
				canSwitch = false
			else
				canSwitch = true
			end

			local seatRGB = 1.0
			if (playerSeat ~= -1) and (playerSeat ~= seat-1) and not self.vehicle:canSwitchSeat(playerSeat, seat - 1) then
				seatRGB = 0.5
				textRGB = textRGB * 0.5
			end
		
			local tex = getTexture("media/ui/boats/seatui/" .. texName)
			if tex then
				self:drawTextureScaledUniform(tex, x, y, 1, 1.0, seatRGB, seatRGB, seatRGB)
			else
				self:drawRect(x, y, sizeX, sizeY, 1.0, fillR, fillG, fillB)
				self:drawRectBorder(x, y, sizeX, sizeY, 1.0, 1.0, 1.0, 1.0)
			end

			if not shiftKey and canSwitch and not self.joyfocus then
				self:drawTextCentre(tostring(seat), x + sizeX / 2, y + sizeY / 2 - FONT_HGT_LARGE / 2, textRGB, textRGB, textRGB, 1, UIFont.Large)
			end
			
			if mouseOver then
				self:drawRectBorder(x - 2, y - 2, sizeX + 4, sizeY + 4, 1.0, outlineR, outlineG, outlineB)
			end

			if canSwitch and self.joyfocus and self.joypadSeat == seat then
				local tex = Joypad.Texture.AButton
				local texW,texH = tex:getWidth(),tex:getHeight()
				local x = self:getWidth() / 2 - offset:get(0) * scale - texW / 2
				local y = self:getHeight() / 2 - offset:get(2) * scale - texH / 2
				x = x + (SeatOffsetX[scriptName] or 0.0)
				y = y + (SeatOffsetY[scriptName] or 0.0)
				self:drawTextureScaledUniform(tex, x, y, 1, 1,1,1,1)
			end
		end

		-- Display available exits when inside.
		-- if playerSeat ~= -1 and not self.joyfocus then
			-- local canSwitch = self.vehicle:canSwitchSeat(playerSeat, seat - 1)
			-- if self.vehicle:isSeatOccupied(seat - 1) then
				-- canSwitch = false
				-- -- if you can't switch because of item we check you can still move them
				-- if not self.vehicle:getCharacter(seat-1) then
					-- canSwitch = ISVehicleMenu.moveItemsFromSeat(self.character, self.vehicle, seat-1, false, false)
				-- end
			-- end
			-- if playerSeat == seat - 1 then canSwitch = true end
			-- self.vehicle:updateHasExtendOffsetForExit(self.character)
			-- if self.vehicle:isExitBlocked(seat - 1) then canSwitch = false end
			-- self.vehicle:updateHasExtendOffsetForExitEnd(self.character)
			-- posn = pngr:getPositionById("outside")
			-- if canSwitch and posn then
				-- local offset = posn:getOffset()
				-- local tex = getTexture("media/ui/vehicles/vehicle_exit.png")
				-- local texW,texH = tex:getWidthOrig(),tex:getHeightOrig()
				-- local x = self:getWidth() / 2 - offset:get(0) * scale - texW / 2
				-- local y = self:getHeight() / 2 - offset:get(2) * scale - texH / 2
				-- y = y + (SeatOffsetY[scriptName] or 0.0)

				-- local mouseOver = (self:getMouseX() >= x and self:getMouseX() < x + texW and
						-- self:getMouseY() >= y and self:getMouseY() < y + texH) or
						-- (self.joyfocus and self.joypadSeat == seat)
				-- if mouseOver then
					-- self.mouseOverExit = seat - 1
				-- end

				-- if mouseOver or shiftKey then
					-- self:drawTextureScaledUniform(tex, x, y, 1, 1,1,1,1)
				-- else
					-- self:drawTextureScaledUniform(tex, x, y, 1, 0.2,1,1,1)
				-- end

				-- if shiftKey then
					-- self:drawRect(x + texW / 2 - 8, y + texH / 2 - FONT_HGT_LARGE / 2, 16, FONT_HGT_LARGE, 1, 0.1, 0.1, 0.1)
					-- self:drawTextCentre(tostring(seat), x + texW / 2, y + texH / 2 - FONT_HGT_LARGE / 2, 1, 1, 1, 1, UIFont.Large)
				-- end
			-- end
		-- end
		if playerSeat ~= -1 and self.joyfocus and seat == self.joypadSeat then
			local canSwitch = self.vehicle:canSwitchSeat(playerSeat, seat - 1)
			if self.vehicle:isSeatOccupied(seat - 1) then
				canSwitch = false
				-- if you can't switch because of item we check you can still move them
				if not self.vehicle:getCharacter(seat-1) then
					canSwitch = ISVehicleMenu.moveItemsFromSeat(self.character, self.vehicle, seat-1, false, false)
				end
			end
			if playerSeat == seat - 1 then canSwitch = true end
			self.vehicle:updateHasExtendOffsetForExit(self.character)
			if self.vehicle:isExitBlocked(seat - 1) then canSwitch = false end
			self.vehicle:updateHasExtendOffsetForExitEnd(self.character)
			posn = pngr:getPositionById("outside")
			if canSwitch and posn then
				local offset = posn:getOffset()
				local tex = Joypad.Texture.XButton
				local texW,texH = tex:getWidthOrig(),tex:getHeightOrig()
				local x = self:getWidth() / 2 - offset:get(0) * scale - texW / 2
				local y = self:getHeight() / 2 - offset:get(2) * scale - texH / 2
				y = y + (SeatOffsetY[scriptName] or 0.0)
				self:drawTextureScaledUniform(tex, x, y, 1, 1,1,1,1)
			end
		end
	end

	-- TODO: Allow choosing a seat to exit from
end

function ISBoatSeatUI:update()
	ISPanelJoypad.update(self)
	self:centerOnScreen()
	if self.vehicle and self.character:DistTo(self.vehicle:getX(), self.vehicle:getY()) > 12 then
		self:closeSelf()
	end
end

function ISBoatSeatUI:onMouseDown(x, y)
	if self.mouseOverSeat then
		self:useSeat(self.mouseOverSeat)
		return
	end
	if self.mouseOverExit then
		self:exitSeat(self.mouseOverExit)
		return
	end
end

function ISBoatSeatUI:onMouseDownOutside(x, y)
	if self.playerNum == 0 then
		self:closeSelf()
	end
end

function ISBoatSeatUI:isSeatInstalled(seat)
	if not self.vehicle then return false end
	return self.vehicle:isSeatInstalled(seat)
end

function ISBoatSeatUI:useSeat(seat)
	if not self:isSeatInstalled(seat) then return end
	if self.vehicle:getCharacter(seat) then return end

	local playerHaveAccesToCabin = self.vehicle:getModData()["AquaCabin_isUnlocked"]
	local isCabin = false

	if self.vehicle:getPartById("InCabin" .. seatNameTable[seat+1]) then
		isCabin = true
	end

	local playerInCabin = false
	if self.characterSeat then
		if self.vehicle:getPartById("InCabin" .. seatNameTable[self.characterSeat+1]) then
			playerInCabin = true
		end
	end

	self:closeSelf()
	if self.character:getVehicle() then
		if self.vehicle:canSwitchSeat(self.vehicle:getSeat(self.character), seat) then
			if playerHaveAccesToCabin or (playerInCabin and isCabin) or (not playerInCabin and not isCabin) then
				if not ISVehicleMenu.moveItemsFromSeat(self.character, self.vehicle, seat, true, false) then return; end
				ISVehicleMenu.onSwitchSeat(self.character, seat)						   
			else
				self.character:Say(getText("IGUI_PlayerText_CabinIsLocked"))	
			end
		end
	else
		if (not isCabin or playerHaveAccesToCabin) then
			ISTimedActionQueue.add(ISEnterVehicle:new(self.character, self.vehicle, seat))
		else
			self.character:Say(getText("IGUI_PlayerText_CabinIsLocked"))
		end
	end
end

function ISBoatSeatUI:exitSeat(seat)
	if not self:isSeatInstalled(seat) then return end
	local playerSeat = self.vehicle:getSeat(self.character)
	if playerSeat == -1 then return end
	self:closeSelf()
	if seat == playerSeat then
		ISVehicleMenu.onExit(self.character)
		return
	end
	if self.vehicle:isSeatOccupied(seat) then return end
	if self.character:getVehicle() then
		if self.vehicle:canSwitchSeat(playerSeat, seat) then
			ISVehicleMenu.onSwitchSeat(self.character, seat)
			ISVehicleMenu.onExit(self.character, seat)
		end
	end
end

function ISVehicleSeatUI:setVehicle(vehicle)
	self.vehicle = vehicle
	self.mouseOverSeat = nil
	self.characterSeat = nil
	self.joypadSeat = 1
	if self.character:getVehicle() == vehicle then
		self.characterSeat = self.vehicle:getSeat(self.character)
		self.joypadSeat = self.characterSeat + 1
	end
	self:setUIName("ISVehicleSeatUI")
end

function ISBoatSeatUI:closeSelf()
	local uis = UIManager.getUI()
	for i = 0, uis:size()-1 do 
		local ui = uis:get(i)
		if ui:getUIName() == "ISVehicleSeatUI" then
			UIManager.RemoveElement(ui)
		end
	end
	self:removeFromUIManager()
	if JoypadState.players[self.playerNum+1] then
		setJoypadFocus(self.playerNum, nil)
	end
end

function ISBoatSeatUI:onGainJoypadFocus(joypadData)
	ISPanelJoypad.onGainJoypadFocus(self, joypadData)
	self:setISButtonForB(self.close)
end

function ISBoatSeatUI:onJoypadDown(button)
	ISPanelJoypad.onJoypadDown(self, button)
	if button == Joypad.AButton then
		self:useSeat(self.joypadSeat - 1)
	end
	if button == Joypad.BButton then
--		self:closeSelf()
	end
	if button == Joypad.XButton then
		self:exitSeat(self.joypadSeat - 1)
	end
end

function ISBoatSeatUI:onJoypadDirUp()
	if not self.vehicle then return end
	local script = self.vehicle:getScript()
	if self.joypadSeat > 2 then
		self.joypadSeat = self.joypadSeat - 2
	end
end

function ISBoatSeatUI:onJoypadDirDown()
	if not self.vehicle then return end
	local script = self.vehicle:getScript()
	if self.joypadSeat <= script:getPassengerCount() - 2 then
		self.joypadSeat = self.joypadSeat + 2
	end
end

function ISBoatSeatUI:onJoypadDirLeft()
	if not self.vehicle then return end
	local script = self.vehicle:getScript()
	if self.joypadSeat % 2 == 0 then
		self.joypadSeat = self.joypadSeat - 1
	end
end

function ISBoatSeatUI:onJoypadDirRight()
	if not self.vehicle then return end
	local script = self.vehicle:getScript()
	if self.joypadSeat % 2 == 1 and self.joypadSeat < script:getPassengerCount() then
		self.joypadSeat = self.joypadSeat + 1
	end
end

function ISBoatSeatUI:setVehicle(vehicle)
	self.vehicle = vehicle
	self.mouseOverSeat = nil
	self.characterSeat = nil
	self.joypadSeat = 1
	if self.character:getVehicle() == vehicle then
		self.characterSeat = self.vehicle:getSeat(self.character)
		self.joypadSeat = self.characterSeat + 1
	end
end

function ISBoatSeatUI:isKeyConsumed(key)
	return true
	--[[
	return (key == Keyboard.KEY_ESCAPE) or
		(key == getCore():getKey("VehicleSwitchSeat")) or
		(key >= Keyboard.KEY_1 and key <= Keyboard.KEY_9)
	--]]
end

function ISBoatSeatUI:onKeyPress(key)
	if key == getCore():getKey("VehicleSwitchSeat") then
		self:closeSelf()
		return
	end
	if key == Keyboard.KEY_ESCAPE then
		self:closeSelf()
		GameKeyboard.eatKeyPress(key)
		return
	end
end

function ISBoatSeatUI:onKeyRelease(key)
	if not self.vehicle or not self.vehicle:getScript() then return end
	local numSeats = self.vehicle:getMaxPassengers()
	if key >= Keyboard.KEY_1 and key < Keyboard.KEY_1 + numSeats then
		if isKeyDown(Keyboard.KEY_LSHIFT) or isKeyDown(Keyboard.KEY_RSHIFT) then
			self:exitSeat(key - Keyboard.KEY_1)
		else
			self:useSeat(key - Keyboard.KEY_1)
		end
	end
end

function ISBoatSeatUI:centerOnScreen()
	local width = self:getWidth()
	local height = self:getHeight()
	local x = getPlayerScreenLeft(self.playerNum) + (getPlayerScreenWidth(self.playerNum) - width) / 2
	local y = getPlayerScreenTop(self.playerNum) + (getPlayerScreenHeight(self.playerNum) - height) / 2
	self:setX(x)
	self:setY(y)
end

function ISBoatSeatUI:new(x, y, character)
	local playerNum = character:getPlayerNum()
	local width = 300
	local height = 940
	if y == 0 then
		y = getPlayerScreenTop(playerNum) + (getPlayerScreenHeight(playerNum) - height) / 2
	end
	if x == 0 then
		x = getPlayerScreenLeft(playerNum) + (getPlayerScreenWidth(playerNum) - width) / 2
	end
	local o = ISPanelJoypad.new(self, x, y, width, height)
	o.backgroundColor.a = 0.9
	o.character = character
	o.playerNum = playerNum
	o:setWantKeyEvents(true)
	return o
end

