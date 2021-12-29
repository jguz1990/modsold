require "Boats/ISUI/ISBoatMenu"
require 'AquaConfig'

local oldGetBestBButtonAction = ISButtonPrompt.getBestAButtonAction
local oldGetBestLBButtonAction = ISButtonPrompt.getBestLBButtonAction
local oldGetBestRBButtonAction = ISButtonPrompt.getBestRBButtonAction

function ISButtonPrompt:getBestAButtonAction(dir)
	local playerObj = getSpecificPlayer(self.player)
	oldGetBestBButtonAction(self, dir)
	
	local boat = ISBoatMenu.getBoatInside(playerObj)
    if boat then
		if boat:getPartById("InCabin" .. seatNameTable[boat:getSeat(playerObj)+1]) then
			self:setAPrompt(nil, nil, nil)
		else
			self:setAPrompt(getText("IGUI_ExitBoat"), self.cmdExitBoat, playerObj)
		end
        return
    end
	boat = ISBoatMenu.getBoatToInteractWith(playerObj)
	if boat then
		self:setAPrompt(getText("IGUI_EnterBoat"), self.cmdEnterBoat, playerObj, boat)
		return
	end
	if (playerObj:isSprinting() or playerObj:isRunning()) and 
			not playerObj:getSquare():Is(IsoFlagType.water) then
		self:setAPrompt(getText("IGUI_JumpInWater"), fastSwimJoypad, Keyboard.KEY_SPACE, nil, nil)
        return
    end
end

function ISButtonPrompt:getBestLBButtonAction(dir)
	local playerObj = getSpecificPlayer(self.player)
	oldGetBestLBButtonAction(self, dir)
	local boat = playerObj:getVehicle()
	if boat and AquaConfig.Boat(boat) and 
			boat:getDriver() == playerObj and 
			boat:getPartById("Sails") then
		self:setLBPrompt(getText("IGUI_SailLeft"), self.joypadSailAngleLeft, playerObj, boat);
	end
end

function ISButtonPrompt:getBestRBButtonAction(dir)
	local playerObj = getSpecificPlayer(self.player)
	oldGetBestRBButtonAction(self, dir)
	local boat = playerObj:getVehicle()
	if boat and AquaConfig.Boat(boat) and 
			boat:getDriver() == playerObj and 
			boat:getPartById("Sails") then
		self:setRBPrompt(getText("IGUI_SailRight"), self.joypadSailAngleRight, playerObj, boat);
	end
end

function ISButtonPrompt:joypadSailAngleLeft(playerObj, boat)
    local sailAngle = boat:getModData()["sailAngle"]
	if sailAngle == nil then
		sailAngle = 0
		boat:getModData()["sailAngle"] = 0
	end
	if sailAngle < 90 then
		sailAngle = sailAngle + 6
		if sailAngle > 90 then sailAngle = 90 end
	end
	boat:getModData()["sailAngle"] = sailAngle
	playerObj:getStats():setEndurance(playerObj:getStats():getEndurance() - 0.01)
end

function ISButtonPrompt:joypadSailAngleRight(playerObj, boat)
    local sailAngle = boat:getModData()["sailAngle"]
	if sailAngle == nil then
		sailAngle = 0
		boat:getModData()["sailAngle"] = 0
	end
	if sailAngle > -90 then
		sailAngle = sailAngle - 6
		if sailAngle < -90 then sailAngle = -90 end
	end
	boat:getModData()["sailAngle"] = sailAngle
	playerObj:getStats():setEndurance(playerObj:getStats():getEndurance() - 0.01)
end

function ISButtonPrompt:cmdExitBoat(playerObj)
    ISBoatMenu.onExit(playerObj)
end

function ISButtonPrompt:cmdEnterBoat(playerObj, boat)
    ISBoatMenu.onEnter(playerObj, boat)
end

-- function ISDPadWheels.onDisplayUp(joypadData)
-- -- print("ISDPadWheels.onDisplayUp")
	-- local playerObj = getSpecificPlayer(joypadData.player)
	-- local boat = ISBoatMenu.getBoatInside(playerObj)
	-- if boat then
		-- -- print("ISDPadWheels.onDisplayUp BOAT")
		-- ISBoatMenu.showRadialMenu(playerObj)
		-- return
	-- end
	-- boat = ISBoatMenu.getBoatToInteractWith(playerObj)
	-- if boat then
		-- -- print("ISDPadWheels.onDisplayUp BOAT STREET")
		-- ISBoatMenu.showRadialMenuOutside(playerObj)
		-- return
	-- end
	-- local vehicle = ISVehicleMenu.getVehicleToInteractWith(playerObj)
	-- ISVehicleMenu.showRadialMenu(playerObj)
	-- -- print(vehicle:getScript():getName())
	-- if vehicle ~= nil and AquaConfig.Trailers[vehicle:getScript():getName()] then
		-- -- print("ISDPadWheels.onDisplayUp BOAT TRAILER")
		-- if AquaConfig.Trailers[vehicle:getScript():getName()].isWithBoat then
			-- ISVehicleMenuForTrailerWithBoat.launchRadialMenu(playerObj, vehicle)
		-- else
			-- ISVehicleMenuForTrailerWithBoat.loadOntoTrailerRadialMenu(playerObj, vehicle)
		-- end
	-- end
-- end

