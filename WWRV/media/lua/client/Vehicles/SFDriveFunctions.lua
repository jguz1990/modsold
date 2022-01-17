SFDriveFunctions = {};

--COOLER HERE DUDE
function SFDriveFunctions.onToggleCooler(playerObj)
	local vehicle = playerObj:getVehicle();
	local id = vehicle:getId();
	local fridgePart = vehicle:getPartById("Fridge");
	local active = fridgePart:getModData().coolerActive;
	if not vehicle then return end
	fridgePart:getModData().coolerActive = not active
	print(fridgePart:getItemContainer():getAgeFactor())

	if not active then
		fridgePart:getItemContainer():setAgeFactor(1.0)
	else
		fridgePart:getItemContainer():setAgeFactor(0.1)
	end
	vehicle:transmitPartModData(fridgePart); --Test for cooling trunks
end

--OVEN HERE DUDE
function SFDriveFunctions.onToggleOven(playerObj)
	local vehicle = playerObj:getVehicle();
	local id = vehicle:getId();
	local	oven = vehicle:getPartById("Oven");
	local active = oven:getModData().ovenActive;
	if not vehicle then return end
	oven:getModData().ovenActive = not active;
	-- oven:Toggle()
	vehicle:transmitPartModData(oven); --Test for cooling trunks
end

function SFDriveFunctions.SpawnFromCar(cont, character)
	if cont and cont:contains("CorpseToken") then
		local x = character:getSquare():getX() - 0.04;
		local x2 = character:getSquare():getX() + 0.04;
		local y = character:getSquare():getY() - 0.04;
		local y2 = character:getSquare():getY() + 0.04;
		local z = character:getSquare():getZ();
		local bodies = cont:getNumberOfItem("CorpseToken");
		if isClient() then
			sendClientCommand(getPlayer(), 'SFDrive', 'spawnFromCar', { x = x, y = y, x2 = x2, y2 = y2, z = z, bodies = bodies });
			cont:RemoveAll("CorpseToken");
		else
			spawnHorde(x, y, x2, y2, z, bodies);
			cont:RemoveAll("CorpseToken");
		end
	end
end
