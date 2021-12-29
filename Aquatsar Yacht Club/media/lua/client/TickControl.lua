require 'AquaConfig'

TickControl = {}
TickTable = {}
TickTable.Wind = {}
TickTable.Swim = {}
TickTable.waterConstruction = nil

function TickControl.switchTheWind(emi, nameOfWind, volume)
	if emi:isPlaying(nameOfWind) then 
		-- AUD.insp("Boat", "TickTable.Wind[nameOfWind]:", TickTable.Wind[nameOfWind])
		emi:setVolume(TickTable.Wind[nameOfWind], volume)
		return 
	end
	for i, j in pairs(TickTable.Wind) do 
		emi:stopSoundByName(i)
	end
	local songId = emi:playAmbientLoopedImpl(nameOfWind)
	TickTable.Wind = {}
	TickTable.Wind[nameOfWind] = songId
	emi:setVolume(TickTable.Wind[nameOfWind], volume)
end

function TickControl.stopWeatherSound(emi)
	emi:stopSoundByName("BoatSailing")
	-- emi:stopSoundByName("BoatSailingByWind")
	for i, j in pairs(TickTable.Wind) do 
		emi:stopSoundByName(i)
	end
	TickTable.Wind = {}
end

function TickControl.isWater(square)
	if square and square:getProperties() then
		return square:getProperties():Is(IsoFlagType.water)
	else
		return false
	end
end

function TickControl.checkWaterBuild(paramIsoObject)
	-- print("TickControl.checkWaterBuild")
	if TickControl.isWater(paramIsoObject) then
		-- print(paramIsoObject:getSprite())
		-- print(paramIsoObject:getTextureName())
		local sq = paramIsoObject:getSquare()
		local floorTile = paramIsoObject:getTextureName()
		if not TickTable.waterConstruction then TickTable.waterConstruction  = {} end
		TickTable.waterConstruction[sq] = floorTile
		-- print("floorTile", floorTile)
		-- print(TickTable.waterConstruction)
		-- print(TickTable.waterConstruction[sq])
	end
end


function TickControl.wetItems(playerObj)
    local inv = playerObj:getInventory() -- inv = getPlayer():getInventory()    
    local items = {}

    for j=1, inv:getItems():size() do
        local item = inv:getItems():get(j-1);
        table.insert(items, item)
    end

    for i=1, #items do
        if items[i]:IsClothing() then
            items[i]:setWetness(100)
        elseif items[i]:IsLiterature() then
            local item = InventoryItemFactory.CreateItem("Aquatsar.TaintedLiterature");
            inv:AddItem(item)
            inv:DoRemoveItem(items[i])
        end
    end
end



function TickControl.main()
	if TickTable.waterConstruction then 
		for sq, floorTile in pairs(TickTable.waterConstruction) do 
			if not floorTile then return end
			local old_tile = sq:getFloor():getTile()
			sq:addFloor(floorTile)
			sq:RecalcProperties()
			if string.match(old_tile, "carpentry_02") then
				sq:AddWorldInventoryItem("Base.Plank", ZombRandFloat(0,0.9), ZombRandFloat(0,0.9), 0)
			end
			getSoundManager():PlaySound("ThrowInWater", true, 0.0)
			getPlayer():Say(getText("IGUI_PlayerText_PontoonNeeded"))
		end
		TickTable.waterConstruction = nil
	end
	local playersSum = getNumActivePlayers()
	for playerNum = 0, playersSum - 1 do
		local playerObj = getSpecificPlayer(playerNum)
		if playerObj then
			local boat = playerObj:getVehicle()
			if boat ~= nil and AquaConfig.isBoat(boat) then
				local boatSpeed = boat:getCurrentSpeedKmHour()
				local emi = boat:getEmitter()
				if emi:isPlaying("VehicleSkid") then -- Удаление звука заноса на воде
					emi:stopSoundByName("VehicleSkid")
				end
				if emi:isPlaying("BoatSailing") then 
					local windSpeed = getClimateManager():getWindspeedKph()
					-- AUD.insp("Wind", "windSpeed (MPH):", windSpeed/1.60934)
					local volume = 0
					if windSpeed < AquaConfig.windVeryLight then
						-- AUD.insp("Wind", "windControlSpeed:", "windVeryLight")
						volume = 1
						TickControl.switchTheWind(emi, "WindLight", volume)
					elseif windSpeed < AquaConfig.windLight then
						-- AUD.insp("Wind", "windControlSpeed:", "windLight")
						volume = windSpeed/AquaConfig.windLight
						TickControl.switchTheWind(emi, "WindLight", volume)
					elseif windSpeed < AquaConfig.windMedium then
						-- AUD.insp("Wind", "windControlSpeed:", "windMedium")
						volume = windSpeed/AquaConfig.windMedium
						TickControl.switchTheWind(emi, "WindMedium", volume)
					elseif windSpeed < AquaConfig.windStrong then
						-- AUD.insp("Wind", "windControlSpeed:", "windStrong")
						volume = (windSpeed - 20 * 1.60934)/(AquaConfig.windStrong - 20 * 1.60934)
						TickControl.switchTheWind(emi, "WindStrong", volume)
					elseif windSpeed < AquaConfig.windVeryStrong then
						-- AUD.insp("Wind", "windControlSpeed:", "windVeryStrong")
						volume = (windSpeed - 18 * 1.60934)/(AquaConfig.windVeryStrong - 18 * 1.60934)
						TickControl.switchTheWind(emi, "WindVeryStrong", volume)
					else
						-- AUD.insp("Wind", "windControlSpeed:", "windStorm")
						volume = (windSpeed - 18 * 1.60934)/(AquaConfig.windVeryStrong - 18 * 1.60934)
						TickControl.switchTheWind(emi, "WindStorm", 1)
					end
					-- AUD.insp("Wind", "volume:", volume)
				end

				if boat:getPartById("ManualStarter") then
					if emi:isPlaying("VehicleStarted") then
						emi:stopSoundByName("VehicleStarted")
						emi:playSound("SuccessStartEngineManualy", boat)
					end
					if emi:isPlaying("VehicleFailingToStart") then
						emi:stopSoundByName("VehicleFailingToStart")
						emi:playSound("FailStartEngineManualy", playerObj)
					end
				end
			end
		
			local emiPl = playerObj:getEmitter()
			
			if boat then
				if emiPl:isPlaying("Swim") then
					emiPl:stopSoundByName("Swim")
					getSoundManager():PlaySound("LeaveWater", true, 0.0)
					playerObj:getSprite():getProperties():UnSet(IsoFlagType.invisible)
					playerObj:setNoClip(false)
				end
			elseif playerObj:getSquare() then			
				if playerObj:getSquare():Is(IsoFlagType.water) then
					playerObj:getBodyDamage():setWetness(100)
					if not playerObj:getSprite():getProperties():Is(IsoFlagType.invisible) then
						emiPl:playSound("Dive")
						TickControl.wetItems(playerObj)
						playerObj:getSprite():getProperties():Set(IsoFlagType.invisible)
						playerObj:setNoClip(true)
					else
						local moveDir = playerObj:getPlayerMoveDir()
						local x = playerObj:getX() + moveDir:getX()
						local y = playerObj:getY() + moveDir:getY()
						local sq = playerObj:getSquare()
						local sqDir = getCell():getGridSquare(playerObj:getX() + moveDir:getX(), 
															  playerObj:getY() + moveDir:getY(), 
															  playerObj:getZ())
						if sq:DistTo(sqDir) >= 1 then
							if sq:isWallTo(sqDir) or sq:isWindowTo(sqDir) then
								playerObj:setNoClip(false)
							elseif not playerObj:isNoClip() then
								-- moveDir:normalize()
								
								moveDir:rotate(3.14)
								local rearSqr = getCell():getGridSquare(playerObj:getX() + moveDir:getX()*2, 
														  playerObj:getY() + moveDir:getY()*2, 
														  playerObj:getZ())

								moveDir = playerObj:getForwardDirection()
								moveDir:rotate(1.57)
								local sideSqr1 = getCell():getGridSquare(playerObj:getX() + moveDir:getY(), 
															  playerObj:getY() + moveDir:getX(), 
															  playerObj:getZ())
								moveDir:rotate(3.14)							  
								local sideSqr2 = getCell():getGridSquare(playerObj:getX() + moveDir:getX(), 
															  playerObj:getY() + moveDir:getY(), 
															  playerObj:getZ())
								
								if sqDir:Is(IsoFlagType.water) and 
										not sq:isWallTo(sideSqr1) and 
										not sq:isWindowTo(sideSqr1) and 
										not sq:isWallTo(sideSqr2) and
										not sq:isWindowTo(sideSqr2) and
										sq:isWallTo(rearSqr) then
									playerObj:setNoClip(true)						
								end
							end
						end
					end
					
					if not emiPl:isPlaying("Swim") and not playerObj:isDead() then
						playerObj:playSound("Swim")
					end
				else
					if playerObj:getSprite():getProperties():Is(IsoFlagType.invisible) then
						emiPl:playSound("LeaveWater")
						playerObj:getSprite():getProperties():UnSet(IsoFlagType.invisible)
						playerObj:setNoClip(false)
					end
					if emiPl:isPlaying("Swim") then
						emiPl:stopSoundByName("Swim")
					end
				end
			end
		end
	end
end

local function onPlayerDeathStopSwimSound(playerObj)
	playerObj:getEmitter():stopSoundByName("Swim")
end

Events.OnTileRemoved.Add(TickControl.checkWaterBuild)
Events.OnTick.Add(TickControl.main)
Events.OnPlayerDeath.Add(onPlayerDeathStopSwimSound)