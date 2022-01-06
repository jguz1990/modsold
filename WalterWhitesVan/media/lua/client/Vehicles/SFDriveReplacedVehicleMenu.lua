if WWVehicleMenu == nil then WWVehicleMenu = {} end
if WWVehicleMenu.UI == nil then WWVehicleMenu.UI = {} end

function WWVehicleMenu.UI.addOptions(playerObj)
	local menu = getPlayerRadialMenu(playerObj:getPlayerNum())
	if menu == nil then return end

	local vehicle = playerObj:getVehicle()
	if vehicle == nil then return end

	local seat = vehicle:getSeat(playerObj)

	if seat >=2 and (vehicle:getScriptName() == "Base.86bounder" or vehicle:getScriptName() == "Base.86econolinerv") then

		if vehicle:getPartById("Fridge") then
			if vehicle:getPartById("Fridge"):getModData().coolerActive then
				menu:addSlice(getText("ContextMenu_VehicleCoolerOff"), getTexture("media/textures/sfvehicle_cooleron.png"), SFDriveFunctions.onToggleCooler, playerObj)
			else
				menu:addSlice(getText("ContextMenu_VehicleCoolerOn"), getTexture("media/textures/sfvehicle_cooleroff.png"), SFDriveFunctions.onToggleCooler, playerObj)
			end
		end
		if vehicle:getPartById("Oven") then
			if vehicle:getPartById("Oven"):getModData().ovenActive then
				menu:addSlice(getText("ContextMenu_VehicleOvenOff"), getTexture("media/textures/sfvehicle_ovenon.png"), SFDriveFunctions.onToggleOven, playerObj)
			else
				menu:addSlice(getText("ContextMenu_VehicleOvenOn"), getTexture("media/textures/sfvehicle_ovenoff.png"), SFDriveFunctions.onToggleOven, playerObj)
			end
		end
		 -- only rear seats can access the TV
		for partIndex=1,vehicle:getPartCount() do
			local part = vehicle:getPartByIndex(partIndex-1)
			if part:getDeviceData() then
				if seat >= 2 and (part:getInventoryItem():getType() == "TvBlack" or part:getInventoryItem():getType() == "TvWideScreen") then
					menu:addSlice(getText("IGUI_DeviceOptions"), getTexture("media/textures/Item_Television.png"), ISVehicleMenu.onSignalDevice, playerObj, part)
				end
			end
		end
	end
end

-- Save default function for wrap it
if WWVehicleMenu.UI.defaultShowRadialMenu == nil then
    WWVehicleMenu.UI.defaultShowRadialMenu = ISVehicleMenu.showRadialMenu
end

-- Wrap default fuction
function ISVehicleMenu.showRadialMenu(playerObj)
		WWVehicleMenu.UI.defaultShowRadialMenu(playerObj)

    if playerObj:getVehicle() then
      WWVehicleMenu.UI.addOptions(playerObj)
    end
end
