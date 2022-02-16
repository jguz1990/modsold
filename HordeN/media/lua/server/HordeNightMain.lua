local HN_TicksBeforeNextZed = 30;
local HN_outfitTable139 = {"AirCrew","AmbulanceDriver","ArmyCamoDesert","ArmyCamoGreen","ArmyServiceUniform","Bandit","BaseballFan_KY","BaseballFan_Rangers","BaseballFan_Z","BaseballPlayer_KY","BaseballPlayer_Rangers","BaseballPlayer_Z","Bathrobe","Bedroom","Biker","Bowling","BoxingBlue","BoxingRed","Camper","Chef","Classy","Cook_Generic","Cook_IceCream","Cook_Spiffos","Cyclist","Doctor","DressLong","DressNormal","DressShort","Farmer","Fireman","FiremanFullSuit","FitnessInstructor","Fossoil","Gas2Go","Generic_Skirt","Generic01","Generic02","Generic03","Generic04","Generic05","GigaMart_Employee","Golfer","HazardSuit","Hobbo","HospitalPatient","Jackie_Jaye","Joan","Jockey04","Jockey05","Kate","Kirsty_Kormick","Mannequin1","Mannequin2","Nurse","OfficeWorkerSkirt","Party","Pharmacist","Police","PoliceState","Postal","PrivateMilitia","Punk","Ranger","Redneck","Rocker","Santa","SantaGreen","ShellSuit_Black","ShellSuit_Blue","ShellSuit_Green","ShellSuit_Pink","ShellSuit_Teal","Ski Spiffo","SportsFan","StreetSports","StripperBlack","StripperPink","Student","Survivalist","Survivalist02","Survivalist03","Swimmer","Teacher","ThunderGas","TinFoilHat","Tourist","Trader","TutorialMom","Varsity","Waiter_Classy","Waiter_Diner","Waiter_Market","Waiter_PileOCrepe","Waiter_PizzaWhirled","Waiter_Restaurant","Waiter_Spiffo","Waiter_TachoDelPancho","WaiterStripper","Young","Bob","ConstructionWorker","Dean","Duke","Fisherman","Frank_Hemingway","Ghillie","Groom","HockeyPsycho","Hunter","Inmate","InmateEscaped","InmateKhaki","Jewelry","Jockey01","Jockey02","Jockey03","Jockey06","John","Judge_Matt_Hass","MallSecurity","Mayor_West_point","McCoys","Mechanic","MetalWorker","OfficeWorker","PokerDealer","PoliceRiot","Priest","PrisonGuard","Rev_Peter_Watts","Raider","Security","Sir_Twiggy","Thug","TutorialDad","Veteran","Waiter_TacoDelPancho","Woodcut"};

-- debug stuff, disabled in actual mod.
function HN_DebugCheck(keynum)
		if keynum == Keyboard.KEY_O then
				local ServerPlayer = getPlayer();
				ServerPlayer:Say("Debug!");
				local pLocation = ServerPlayer:getCurrentSquare();
				ServerPlayer:Say("Day Passed: " .. tostring(math.floor(HN_getActualSpawnAgeDay())));
				ServerPlayer:Say("Hour is: " .. tostring(getGameTime():getHour()));
				if getPlayer():getModData().DebugCount ~= nil then
						getPlayer():getModData().DebugCount = getPlayer():getModData().DebugCount + 1;
				else
						getPlayer():getModData().DebugCount = 1;
				end
				print("Count: " .. tostring(getPlayer():getModData().DebugCount));
				--HN_SpawnOneZombieAround(ServerPlayer);
				HN_StartHordeNight(0);

		end
		if keynum == Keyboard.KEY_U then
				local ServerPlayer = getSpecificPlayer(0);
				ServerPlayer:Say("Clear!");
				if getPlayer():getModData().DebugCount ~= nil then
						getPlayer():getModData().DebugCount = 0;
				end
				print("Count Clear: " .. tostring(getPlayer():getModData().DebugCount));
		end
end

--"getWorldAgeDays()" will got effected by sandbox value "TimeSinceApo", so need to clean it up a bit. Also "getWorldAgeDays()" start counting at spawn day 7:00, so +0.3 to get an accurate day passed.
function HN_getActualSpawnAgeDay()
		local worldAge =  getWorld():getWorldAgeDays() + 0.3;
		local sandMonthsAfter = getSandboxOptions():getTimeSinceApo() - 1;
		local actualSpawnAgeDay = worldAge - (sandMonthsAfter * 30);
		return math.max(0.0, actualSpawnAgeDay);
end

-- Find a place around some tiles away from player, make sure it's spawnable and outside, and spawn a zombie, make it pathfind to player's location.
function HN_SpawnOneZombieAround(cPlayer)
		local pLocation = cPlayer:getCurrentSquare();
		local zLocationX = 0;
		local zLocationY = 0;
		local canSpawn = false;
		local sandboxDistance = SandboxVars.HordeNightMain.HordeNightZombieSpawnDistance;
		for i=0, 100 do
				if ZombRand(2) == 0 then
						zLocationX = ZombRand(10) - 10 + sandboxDistance;
						zLocationY = ZombRand(sandboxDistance*2) - sandboxDistance;
						if ZombRand(2) == 0 then
								zLocationX = 0 - zLocationX;
						end
				else
						zLocationY = ZombRand(10) - 10 + sandboxDistance;
						zLocationX = ZombRand(sandboxDistance*2) - sandboxDistance;
						if ZombRand(2) == 0 then
								zLocationY = 0 - zLocationY;
						end
				end
				zLocationX = zLocationX + pLocation:getX();
				zLocationY = zLocationY + pLocation:getY();
				local spawnSpace = getWorld():getCell():getGridSquare(zLocationX, zLocationY, 0);
				if spawnSpace then
						local isSafehouse = SafeHouse.getSafeHouse(spawnSpace);
						if spawnSpace:isSafeToSpawn() and spawnSpace:isOutside() and isSafehouse == nil then
								canSpawn = true;
								print("Success finding a place for zombie to spawn. ".."x: "..tostring(zLocationX).." y: "..tostring(zLocationY)) 
								break
						end
				else
						print("Warning: Zombie Spawn Space not Loaded.");
				end
				if i == 100 then 
						print("Search 100 times and still can't find a place to spawn zombie.") 
				end
		end
		if canSpawn then
				local outfit = HN_outfitTable139[ZombRand(139)+1];
				if isClient() then
						print("Player is client");
						sendClientCommand(cPlayer, "HNmodule", "HNLetServerSpawn", {outfit = HN_outfitTable139[ZombRand(139)+1], x = zLocationX, y = zLocationY});
						return
				else
						print("Not server or client, this is singleplayer");
						addZombiesInOutfit(zLocationX, zLocationY, 0, 1, outfit, 50, false, false, false, false, 1.5);
						return
				end
		end
end

-- Server receive Client command, spawn zombies around.
function HN_onSpawnCommand( HN_module, HN_command, HN_player, HN_args)
		--print("Player has send ClientCommand, module: "..HN_module.."  command: "..HN_command);
    if HN_module ~= "HNmodule" then         
        --print("module is not HNmodule");
        return
    end
    if HN_command == "HNLetServerSpawn" then
				local HNLocationX = HN_args["x"];
				local HNLocationY = HN_args["y"];
    		local outfit = HN_args["outfit"];
    		--print("server has receive HNLetServerSpawn command.");
    		addZombiesInOutfit(HNLocationX, HNLocationY, 0, 1, outfit, 50, false, false, false, false, 1.5);
    end
end


-- Every hour check if it's the time to start spawning horde. 
function HN_CheckStartHordeNight()
		if getGameTime():getHour() % 24 == SandboxVars.HordeNightMain.HordeNightHour then
				local daysPass = math.floor(HN_getActualSpawnAgeDay());
				print("It's the hour for HordeNight, day: "..tostring(daysPass));
				if daysPass >= SandboxVars.HordeNightMain.FirstHordeNightDay then
						local dayAfterFirst = daysPass - SandboxVars.HordeNightMain.FirstHordeNightDay;
						if dayAfterFirst % SandboxVars.HordeNightMain.HordeNightFrequency == 0 then
								local countsHN = dayAfterFirst / SandboxVars.HordeNightMain.HordeNightFrequency;
								print("And it's the day for HordeNight, the " .. tostring(countsHN) .. "th time");
								HN_StartHordeNight(countsHN);
						else
								if ZombRand(100) < SandboxVars.HordeNightMain.RandomHordeNightChance * 100 then
										print("today is not the day, but the random chance Horde Night started.");
										local countsRHN = dayAfterFirst / SandboxVars.HordeNightMain.HordeNightFrequency;
										local countsRHN = countsRHN + 1;
										HN_StartHordeNight(countsRHN);
								else
										print("not the day for Horde Night, today is day "..tostring(daysPass));
								end
						end
				end
		end
end

-- Start the Horde Night
function HN_StartHordeNight(HNcounts)
		local HNZombieCounts = SandboxVars.HordeNightMain.FirstHordeNightZombiesCount + SandboxVars.HordeNightMain.HordeNightZombieIncrement * HNcounts;
		HNZombieCounts = math.min(HNZombieCounts, SandboxVars.HordeNightMain.HordeNightZombieCountMax)
		HN_AlarmEveryOne();
		if getPlayer() == nil then
				return
		end
		getPlayer():getModData().HNSpawnTick = HN_TicksBeforeNextZed;
		getPlayer():getModData().HNSpawnSwitch = true;
		getPlayer():getModData().HNHordeRemain = HNZombieCounts;
end

-- When start, alarm everyone online
function HN_AlarmEveryOne()
		local aPlayer = getPlayer();
		if aPlayer == nil then
				return
		end
		local rAlarmIndex = ZombRand(10);
		local rAlarmText = "IGUI_PlayerText_HNWarning0"..tostring(rAlarmIndex);
		aPlayer:Say(getText(rAlarmText));
		local rAlarmSound = "zombierand"..tostring(ZombRand(10));
		local aZed = getSoundManager():PlaySound(rAlarmSound,false,0);
    getSoundManager():PlayAsMusic(rAlarmSound,aZed,false,0);
    aZed:setVolume(0.1);
end

-- Every tick, if Spawb Switch is on, spawn azombie every 30 ticks, until the Horde Remain is 0, then turn off Spawn Switch.
function HN_CheckSpawnHordeZombies()
		if getPlayer() == nil then
				return
		end
		if getPlayer():getModData().HNSpawnSwitch then
				if getPlayer():getModData().HNHordeRemain <= 0 then
						getPlayer():getModData().HNSpawnSwitch = false;
						getPlayer():getModData().HNHordeRemain = 0;
						getPlayer():getModData().HNSpawnTick = HN_TicksBeforeNextZed;
						print("Horde Night Spawn Over");
						return
				else   
						if getPlayer():getModData().HNSpawnTick <= 0 then
								local hPlayer = getPlayer();
								if hPlayer == nil then
										return
								end
								HN_SpawnOneZombieAround(hPlayer);
								getWorldSoundManager():addSound(hPlayer, hPlayer:getCurrentSquare():getX(), hPlayer:getCurrentSquare():getY(), hPlayer:getCurrentSquare():getZ(), 200, 10);
								getPlayer():getModData().HNHordeRemain = getPlayer():getModData().HNHordeRemain - 1;
								getPlayer():getModData().HNSpawnTick = HN_TicksBeforeNextZed;
						else
								getPlayer():getModData().HNSpawnTick = getPlayer():getModData().HNSpawnTick - 1;
						end
				end
		end
end

-- If a zombie is HordeNight zombie, then it will always follow player.
-- For some reason, every zombies start follow player after the Horde Night, so it's disabled.
function HN_HordeNightZombieFollows(HN_zedFollower)
		if HN_zedFollower:getModData().bHN == nil then
				HN_zedFollower:getModData().bHN = false;
		end
		if HN_zedFollower:getModData().bHN == true then
				HN_zedFollower:pathToCharacter(HN_zedFollower:getModData().pHNfollower);
				print("Follow player");
		end
end


-- make sure all ModData variables are declared.
function HN_Setup()
		if getPlayer() == nil then
				return
		end
		if getPlayer():getModData().HNSpawnTick == nil then
				getPlayer():getModData().HNSpawnTick = HN_TicksBeforeNextZed;
		end
		if getPlayer():getModData().HNSpawnSwitch == nil then
				getPlayer():getModData().HNSpawnSwitch = false;
		end
		if getPlayer():getModData().HNHordeRemain == nil then
				getPlayer():getModData().HNHordeRemain = 0;
		end
end



Events.OnGameStart.Add(HN_Setup);
Events.EveryHours.Add(HN_CheckStartHordeNight);
Events.OnTick.Add(HN_CheckSpawnHordeZombies);
Events.OnClientCommand.Add(HN_onSpawnCommand);
--Events.OnKeyPressed.Add(HN_DebugCheck);