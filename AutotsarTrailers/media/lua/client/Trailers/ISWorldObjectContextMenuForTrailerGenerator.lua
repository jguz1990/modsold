require "CommonTemplates/ISUI/ISContextMenuExtension"

ISWorldObjectContextMenuForTrailerGenerator = {}
-- TrailerGeneratorList = {}


local function predicateNotEmpty(item)
	return item:getUsedDelta() > 0
end

-- function ISWorldObjectContextMenuForTrailerGenerator.launchRadialMenu(playerObj, trailer)
	-- local menu = getPlayerRadialMenu(playerObj:getPlayerNum())
	-- if trailer:getMass() > 9000 then
		-- menu:addSlice(getText("ContextMenu_GeneratorUnplug"), getTexture("media/ui/vehicles/vehicle_repair.png"), ISWorldObjectContextMenuForTrailerGenerator.generatorUnplug, nil, playerObj, trailer)
	-- else
		-- menu:addSlice(getText("ContextMenu_GeneratorPlug"), getTexture("media/ui/vehicles/vehicle_repair.png"), ISWorldObjectContextMenuForTrailerGenerator.generatorPlug, playerObj, trailer)
	-- end
-- end

-- function ISWorldObjectContextMenuForTrailerGenerator.replaceTrailer(trailer, newSriptName)
	-- local partsCondition = {}
	-- for i=1, trailer:getScript():getPartCount() do
		-- local part = trailer:getPartByIndex(i-1)
		-- partsCondition[part:getId()] = {}
		-- partsCondition[part:getId()]["InventoryItem"] = part:getInventoryItem()
		-- partsCondition[part:getId()]["Condition"] = part:getCondition()
	-- end
	-- trailer:setScriptName(newSriptName)
	-- trailer:scriptReloaded()
	-- for i=1, trailer:getScript():getPartCount() do
		-- local part = trailer:getPartByIndex(i-1)
		-- part:setInventoryItem(partsCondition[part:getId()]["InventoryItem"])
		-- part:setCondition(partsCondition[part:getId()]["Condition"])
	-- end
	-- return trailer
-- end

ISWorldObjectContextMenuForTrailerGenerator.generatorPlug = function(worldobjects, playerObj, trailer)
	if luautils.walkAdj(playerObj, trailer:getSquare()) then
		ISTimedActionQueue.add(ISPlugTrailerGenerator:new(playerObj, trailer, 300));
	end
end

function ISWorldObjectContextMenuForTrailerGenerator.generatorUnplug(worldobjects, playerObj, trailer)
	if luautils.walkAdj(playerObj, trailer:getSquare()) then
		ISTimedActionQueue.add(ISUnplugTrailerGenerator:new(playerObj, trailer, 300));
	end
end

ISWorldObjectContextMenuForTrailerGenerator.OnFillWorldObjectContextMenu = function(player, context, worldobjects, test)
	local playerObj = getSpecificPlayer(player)
	local vehicle = playerObj:getVehicle()
	if not vehicle then
		if JoypadState.players[player+1] then
			local px = playerObj:getX()
			local py = playerObj:getY()
			local pz = playerObj:getZ()
			local sqs = {}
			sqs[1] = getCell():getGridSquare(px, py, pz)
			local dir = playerObj:getDir()
			if (dir == IsoDirections.N) then        sqs[2] = getCell():getGridSquare(px-1, py-1, pz); sqs[3] = getCell():getGridSquare(px, py-1, pz);   sqs[4] = getCell():getGridSquare(px+1, py-1, pz);
			elseif (dir == IsoDirections.NE) then   sqs[2] = getCell():getGridSquare(px, py-1, pz);   sqs[3] = getCell():getGridSquare(px+1, py-1, pz); sqs[4] = getCell():getGridSquare(px+1, py, pz);
			elseif (dir == IsoDirections.E) then    sqs[2] = getCell():getGridSquare(px+1, py-1, pz); sqs[3] = getCell():getGridSquare(px+1, py, pz);   sqs[4] = getCell():getGridSquare(px+1, py+1, pz);
			elseif (dir == IsoDirections.SE) then   sqs[2] = getCell():getGridSquare(px+1, py, pz);   sqs[3] = getCell():getGridSquare(px+1, py+1, pz); sqs[4] = getCell():getGridSquare(px, py+1, pz);
			elseif (dir == IsoDirections.S) then    sqs[2] = getCell():getGridSquare(px+1, py+1, pz); sqs[3] = getCell():getGridSquare(px, py+1, pz);   sqs[4] = getCell():getGridSquare(px-1, py+1, pz);
			elseif (dir == IsoDirections.SW) then   sqs[2] = getCell():getGridSquare(px, py+1, pz);   sqs[3] = getCell():getGridSquare(px-1, py+1, pz); sqs[4] = getCell():getGridSquare(px-1, py, pz);
			elseif (dir == IsoDirections.W) then    sqs[2] = getCell():getGridSquare(px-1, py+1, pz); sqs[3] = getCell():getGridSquare(px-1, py, pz);   sqs[4] = getCell():getGridSquare(px-1, py-1, pz);
			elseif (dir == IsoDirections.NW) then   sqs[2] = getCell():getGridSquare(px-1, py, pz);   sqs[3] = getCell():getGridSquare(px-1, py-1, pz); sqs[4] = getCell():getGridSquare(px, py-1, pz);
			end
			for _,sq in ipairs(sqs) do
				vehicle = sq:getVehicleContainer()
				if vehicle and string.lower(vehicle:getScript():getName()) == "trailergenerator" then
					return ISWorldObjectContextMenuForTrailerGenerator.FillMenuOutsideVehicle(player, context, vehicle, test)
				end
			end
			return
		end
		vehicle = IsoObjectPicker.Instance:PickVehicle(getMouseXScaled(), getMouseYScaled())
		if vehicle and string.lower(vehicle:getScript():getName()) == "trailergenerator" then
			return ISWorldObjectContextMenuForTrailerGenerator.FillMenuOutsideVehicle(player, context, vehicle, test)
		else
			if (context:getOptionFromName(getText("ContextMenu_GeneratorInfo")) and 
					(context:getOptionFromName(getText("ContextMenu_GeneratorPlug")) 
					or context:getOptionFromName(getText("ContextMenu_GeneratorUnplug")))) then
				-- print("INFO")
				local isGen = false
				for i,v in pairs(worldobjects) do
					-- print(i)
					-- print(v)
					if instanceof(v, "IsoGenerator") then
						isGen = true
					end
				end
				if not isGen then
					ISWorldObjectContextMenuForTrailerGenerator.changeGeneratorMenu(context)
				end
			end
		end
	end
end

ISWorldObjectContextMenuForTrailerGenerator.changeGeneratorMenu = function(context)
	context:removeOptionTsar(context:getOptionFromName(getText("ContextMenu_GeneratorInfo")))
	context:removeOptionTsar(context:getOptionFromName(getText("ContextMenu_Turn_On")))
	context:removeOptionTsar(context:getOptionFromName(getText("ContextMenu_Turn_Off")))
	context:removeOptionTsar(context:getOptionFromName(getText("ContextMenu_GeneratorPlug")))
	context:removeOptionTsar(context:getOptionFromName(getText("ContextMenu_GeneratorUnplug")))
	context:removeOptionTsar(context:getOptionFromName(getText("ContextMenu_GeneratorPlugTT")))
	context:removeOptionTsar(context:getOptionFromName(getText("ContextMenu_GeneratorFixTT")))
	context:removeOptionTsar(context:getOptionFromName(getText("ContextMenu_GeneratorFix")))
	context:removeOptionTsar(context:getOptionFromName(getText("ContextMenu_GeneratorAddFuel")))
	context:removeOptionTsar(context:getOptionFromName(getText("ContextMenu_GeneratorTake")))
end

ISWorldObjectContextMenuForTrailerGenerator.onToggleSpotlights = function(wo, trailer, playerObj)
    if luautils.walkAdj(playerObj, trailer:getSquare()) then
        ISTimedActionQueue.add(ISToggleSpotlights:new(playerObj, trailer, 0));
    end
end

ISWorldObjectContextMenuForTrailerGenerator.FillMenuOutsideVehicle = function(player, context, trailer, test)
	local playerObj = getSpecificPlayer(player)
	local playerInv = playerObj:getInventory()
	local generator = trailer:getModData()["generatorObject"]
	if trailer:hasHeadlights() then
		if trailer:getHeadlightsOn() then
			context:addOptionOnTop(getText("ContextMenu_TrailerSpotlightOff"), nil , ISWorldObjectContextMenuForTrailerGenerator.onToggleSpotlights, trailer, playerObj)
		else
			context:addOptionOnTop(getText("ContextMenu_TrailerSpotlightOn"), nil, ISWorldObjectContextMenuForTrailerGenerator.onToggleSpotlights, trailer, playerObj)
		end
	end
	if generator then
		local old_options = context:getOptionFromName(getText("ContextMenu_GeneratorInfo"))
		
		if old_options then 
			--print("CLICK on GEN")
			if not generator:isActivated() then
				local old_option_update = context:getOptionFromName(getText("ContextMenu_GeneratorUnplug"))
				-- if generator:getCondition() > 1 then
				if old_option_update then
					context:updateOptionTsar(old_option_update.id, old_option_update.name, old_option_update.target, ISWorldObjectContextMenuForTrailerGenerator.generatorUnplug, playerObj, trailer)
				end	
				old_option_update = context:getOptionFromName(getText("ContextMenu_Turn_On_Generator"))
				if old_option_update then
					context:updateOptionTsar(old_option_update.id, old_option_update.name, trailer, ISWorldObjectContextMenuForTrailerGenerator.onActivateGenerator, true, generator, player)
				-- else
					-- context:addOptionOnTop(getText("ContextMenu_Turn_On_Generator"), trailer, ISWorldObjectContextMenuForTrailerGenerator.onActivateGenerator, true, generator, player);
				end
				old_option_update = context:getOptionFromName(getText("ContextMenu_Turn_On"))
				if old_option_update then
					context:removeOptionTsar(context:getOptionFromName(getText("ContextMenu_Turn_On")))
					context:addOption(getText("ContextMenu_Turn_On_Generator"), trailer, ISWorldObjectContextMenuForTrailerGenerator.onActivateGenerator, true, generator, player);
				end
				
				context:removeOptionTsar(context:getOptionFromName(getText("ContextMenu_GeneratorFix")))
				context:removeOptionTsar(context:getOptionFromName(getText("ContextMenu_GeneratorAddFuel")))
				-- else
					-- old_option_update = context:getOptionFromName(getText("ContextMenu_Turn_On_Generator"))
					-- context:updateOptionTsar(old_option_update.id, "ContextMenu_CheckGen", nil, nil)
				-- end
			else
				local old_option_update = context:getOptionFromName(getText("ContextMenu_Turn_Off"))
				context:updateOptionTsar(old_option_update.id, old_option_update.name, trailer, ISWorldObjectContextMenuForTrailerGenerator.onActivateGenerator, false, generator, player)
			end
		else 
			local option = context:addOptionOnTop(getText("ContextMenu_GeneratorInfo"), worldobjects, ISWorldObjectContextMenu.onInfoGenerator, generator, player);
			if generator:isActivated() then
				context:addOptionOnTop(getText("ContextMenu_Turn_Off"), trailer, ISWorldObjectContextMenuForTrailerGenerator.onActivateGenerator, false, generator, player);
			else
				-- if generator:getFuel() < 100 and playerInv:containsTypeEvalRecurse("PetrolCan", predicateNotEmpty) then
					-- local petrolCan = playerInv:getFirstTypeEvalRecurse("PetrolCan", predicateNotEmpty);
					-- context:addOptionOnTop(getText("ContextMenu_GeneratorAddFuel"), worldobjects, ISWorldObjectContextMenu.onAddFuel, petrolCan, generator, player);
				-- end
				-- if generator:getCondition() < 100 then
					-- local option = context:addOptionOnTop(getText("ContextMenu_GeneratorFix"), worldobjects, ISWorldObjectContextMenu.onFixGenerator, generator, player);
					-- if not playerObj:isRecipeKnown("Generator") then
						-- local tooltip = ISWorldObjectContextMenu.addToolTip();
						-- option.notAvailable = true;
						-- tooltip.description = getText("ContextMenu_GeneratorPlugTT");
						-- option.toolTip = tooltip;
					-- end
					-- if not playerInv:containsTypeRecurse("ElectronicsScrap") then
						-- local tooltip = ISWorldObjectContextMenu.addToolTip();
						-- option.notAvailable = true;
						-- tooltip.description = getText("ContextMenu_GeneratorFixTT");
						-- option.toolTip = tooltip;
					-- end
				-- end
				local option = context:addOptionOnTop(getText("ContextMenu_GeneratorUnplug"), worldobjects, ISWorldObjectContextMenuForTrailerGenerator.generatorUnplug, playerObj, trailer);
				
				-- if generator:getFuel() > 0 and generator:getCondition() > 1 then
					--print("generator:getCondition() ", generator:getCondition())
				option = context:addOptionOnTop(getText("ContextMenu_Turn_On_Generator"), trailer, ISWorldObjectContextMenuForTrailerGenerator.onActivateGenerator, true, generator, player);
				local doStats = playerObj:DistToSquared(generator:getX() + 0.5, generator:getY() + 0.5) < 2 * 2
				local description = ISGeneratorInfoWindow.getRichText(generator, doStats)
				if description ~= "" then
					local tooltip = ISWorldObjectContextMenu.addToolTip()
					tooltip:setName(getText("IGUI_Generator_TypeGas"))
					tooltip.description = description
					option.toolTip = tooltip
				end
				-- end
			end
		end
		-- context:removeOptionTsar(context:getOptionFromName(getText("ContextMenu_VehicleSiphonGas")))
		-- context:removeOptionTsar(context:getOptionFromName(getText("ContextMenu_VehicleRefuelFromPump")))
		-- context:removeOptionTsar(context:getOptionFromName(getText("ContextMenu_VehicleAddGas")))
		-- context:removeOptionTsar(context:getOptionFromName(getText("ContextMenu_VehicleMechanics")))
	else
		context:addOptionOnTop(getText("ContextMenu_GeneratorPlug"), nil, ISWorldObjectContextMenuForTrailerGenerator.generatorPlug, playerObj, trailer)
	end
end

ISWorldObjectContextMenuForTrailerGenerator.onActivateGenerator = function(trailer, enable, generator, player)
	local playerObj = getSpecificPlayer(player)
	if luautils.walkAdj(playerObj, generator:getSquare()) then
		ISTimedActionQueue.add(ISActivateTrailerGenerator:new(player, trailer, generator, enable, 30));
	end
end

-- ISWorldObjectContextMenuForTrailerGenerator.ClearGen = function()
	-- print("AUTOTSAR: OnSave")
	-- for trailer, generator in pairs(TrailerGeneratorList) do
		-- generator:remove()
		-- trailer:getPartById("EarthingOn"):setInventoryItem(nil)
		-- trailer:getPartById("EarthingOff"):setInventoryItem(VehicleUtils.createPartInventoryItem(trailer:getPartById("EarthingOff")))
	-- end
-- end

-- function ISWorldObjectContextMenuForTrailerGenerator.getGeneratorAroundSquare(dx, dy, square)
	-- if square == nil then return squares end
	-- for y=square:getY() - dy, square:getY() + dy do
		-- for x=square:getX() - dx, square:getX() + dx do
            -- local square2 = getCell():getGridSquare(x, y, 0)
			-- if square2 ~= nil then
				-- local sqGen = square2:getGenerator()
				-- if sqGen and sqGen:getSprite() == "appliances_misc_01_10" then
					-- return sqGen
				-- end
			-- end
		-- end
	-- end
-- end

-- function ISWorldObjectContextMenuForTrailerGenerator.searchTrailerGenerator()
	-- local vehicles = getCell():getVehicles()
	-- for i=0, vehicles:size()-1 do
		-- local trailer = vehicles:get(i)
		-- if trailer ~= nil and trailer:getScript():getName() == "TrailerGenerator" then
			-- local gen = ISWorldObjectContextMenuForTrailerGenerator.getGeneratorAroundSquare(2, 2, trailer:getSquare())
			-- trailer:getModData()["generatorObject"] = gen
		-- end
	-- end
-- end

-- local function OnGameBoot(object)
	-- print("OnGameBoot: ", object)
-- end

Events.OnFillWorldObjectContextMenu.Add(ISWorldObjectContextMenuForTrailerGenerator.OnFillWorldObjectContextMenu);

-- Events.OnSave.Add(ISWorldObjectContextMenuForTrailerGenerator.ClearGen)

