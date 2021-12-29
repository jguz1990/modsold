require "ISUI/ISPanelJoypad"

function ISHotbar:getSlotForKey(key)
	if key == getCore():getKey("Hotbar 1") then return 1; end
	if key == getCore():getKey("Hotbar 2") then return 2; end
	if key == getCore():getKey("Hotbar 3") then return 3; end
	if key == getCore():getKey("Hotbar 4") then return 4; end
	if key == getCore():getKey("Hotbar 5") then return 5; end

	if key == getCore():getKey("Hotbar 6") then return 6; end -- Adds GEAR's 10-15 slots
	if key == getCore():getKey("Hotbar 7") then return 7; end
	if key == getCore():getKey("Hotbar 8") then return 8; end
	if key == getCore():getKey("Hotbar 9") then return 9; end
	if key == getCore():getKey("Hotbar 10") then return 10; end
	if key == getCore():getKey("Hotbar 0") then return 10; end
	if key == getCore():getKey("Hotbar 11") then return 11; end
	if key == getCore():getKey("Hotbar 12") then return 12; end
	if key == getCore():getKey("Hotbar 13") then return 13; end
	if key == getCore():getKey("Hotbar 14") then return 14; end
	if key == getCore():getKey("Hotbar 15") then return 15; end
	if key == getCore():getKey("Hotbar 16") then return 16; end -- changes end here

	return -1
end
