ISBuildMenu.buildFloorMenu = function(subMenu, player)
	-- simple wooden floor
    local floorSprite = ISBuildMenu.getWoodenFloorSprites(player);
	local floorOption = subMenu:addOption(getText("ContextMenu_Wooden_Floor"), worldobjects, ISBuildMenu.onWoodenFloor, square, floorSprite, player);
	local tooltip = ISBuildMenu.canBuild(1,1,0,0,0,1,floorOption, player);
	tooltip:setName(getText("ContextMenu_Wooden_Floor"));
	tooltip.description = getText("Tooltip_craft_woodenFloorDesc") .. tooltip.description;
	tooltip:setTexture(floorSprite.sprite);
	ISBuildMenu.requireHammer(floorOption)
	-- floor construction above water
	ISBuildMenu.buildBridgeMenu(subMenu, player)
end

ISBuildMenu.buildBridgeMenu = function(subMenu, player)
	-- simple wooden floor
    local floorSprite = ISBuildMenu.getWoodenFloorSprites(player);
	local floorOption = subMenu:addOption(getText("ContextMenu_Wooden_Pantone"), worldobjects, ISBuildMenu.onWoodenFloorUnderWater, square, floorSprite, player);
	local tooltip = ISBuildMenu.newCanBuild(4,5,10,1,5,floorOption, player);
	tooltip:setName(getText("ContextMenu_Wooden_Pantone"));
	tooltip.description = getText("Tooltip_craft_woodenFloorDesc") .. tooltip.description;
	tooltip:setTexture(floorSprite.sprite);
	ISBuildMenu.requireHammer(floorOption)
end

ISBuildMenu.onWoodenFloorUnderWater = function(worldobjects, square, sprite, player)
	-- sprite, northSprite
	local foor = ISWoodenFloorUnderWater:new(sprite.sprite, sprite.northSprite)
	foor.modData["need:Base.Log"] = "4";
	foor.modData["need:Base.Plank"] = "5";
	foor.modData["need:Base.Nails"] = "10";
	foor.modData["need:Aquatsar.TireTube"] = "1";
	foor.modData["xp:Woodwork"] = 5;
	foor.player = player
	getCell():setDrag(foor, player);
end

ISBuildMenu.newCanBuild = function(logNb, plankNb, nailsNb, tireTubeNb, carpentrySkill, option, player)
	-- create a new tooltip
	local tooltip = ISBuildMenu.addToolTip();
	-- add it to our current option
	option.toolTip = tooltip;
	local result = true;
	tooltip.description = "<LINE> <LINE>" .. getText("Tooltip_craft_Needs") .. ": <LINE>";
	ISBuildMenu.log = ISBuildMenu.countMaterial(player, "Base.Log")
	ISBuildMenu.tireTube = ISBuildMenu.countMaterial(player, "Aquatsar.TireTube")
	
	-- now we gonna test all the needed material, if we don't have it, they'll be in red into our toolip
	
	if ISBuildMenu.log < logNb then
		tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.Log") .. " " .. ISBuildMenu.log .. "/" .. logNb .. " <LINE>";
		result = false;
	elseif logNb > 0 then
		tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.Log") .. " " .. ISBuildMenu.log .. "/" .. logNb .. " <LINE>";
	end

	if ISBuildMenu.planks < plankNb then
		tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.Plank") .. " " .. ISBuildMenu.planks .. "/" .. plankNb .. " <LINE>";
		result = false;
	elseif plankNb > 0 then
		tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.Plank") .. " " .. ISBuildMenu.planks .. "/" .. plankNb .. " <LINE>";
	end
	
	if ISBuildMenu.nails < nailsNb then
		tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Base.Nails") .. " " .. ISBuildMenu.nails .. "/" .. nailsNb .. " <LINE>";
		result = false;
	elseif nailsNb > 0 then
		tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Base.Nails") .. " " .. ISBuildMenu.nails .. "/" .. nailsNb .. " <LINE>";
	end
	
	if ISBuildMenu.tireTube < tireTubeNb then
		tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getItemNameFromFullType("Aquatsar.TireTube") .. " " .. ISBuildMenu.tireTube .. "/" .. tireTubeNb .. " <LINE>";
		result = false;
	elseif tireTubeNb > 0 then
		tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getItemNameFromFullType("Aquatsar.TireTube") .. " " .. ISBuildMenu.tireTube .. "/" .. tireTubeNb .. " <LINE>";
	end
	
	if getSpecificPlayer(player):getPerkLevel(Perks.Woodwork) < carpentrySkill then
		tooltip.description = tooltip.description .. " <RGB:1,0,0>" .. getText("IGUI_perks_Carpentry") .. " " .. getSpecificPlayer(player):getPerkLevel(Perks.Woodwork) .. "/" .. carpentrySkill .. " <LINE>";
		result = false;
	elseif carpentrySkill > 0 then
		tooltip.description = tooltip.description .. " <RGB:1,1,1>" .. getText("IGUI_perks_Carpentry") .. " " .. getSpecificPlayer(player):getPerkLevel(Perks.Woodwork) .. "/" .. carpentrySkill .. " <LINE>";
	end
	if ISBuildMenu.cheat then
		return tooltip;
	end
	if not result then
		option.onSelect = nil;
		option.notAvailable = true;
	end
	tooltip.description = " " .. tooltip.description .. " "
	return tooltip;
end
