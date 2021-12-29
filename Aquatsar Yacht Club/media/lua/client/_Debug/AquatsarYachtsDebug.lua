-- debugScenarios = {}

local function getCountItem(playerObj, item, count)
	for i = 1, count do 
		playerObj:getInventory():AddItem(item);
	end
end

debugScenarios.iBrRusScenario_AquatsarYachts = {
	name = "Aquatsar Yachts Debug",
	isCustom = true,
	forceLaunch = true,
	--startLoc = {x=11840, y=6599, z=0 }, -- Возле прицепа с лодкой
	startLoc = {x=11827, y=6574, z=0 }, -- На причале
	setSandbox = function()
		
		SandboxVars.Speed = 3;
		SandboxVars.Zombies = 4; -- 5 = no zombies, 1 = insane (then 2 = low, 3 normal, 4 high..)
		SandboxVars.Distribution = 1;
		SandboxVars.Survivors = 1;
		SandboxVars.DayLength = 3;
		SandboxVars.StartYear = 1;
		SandboxVars.StartMonth = 7;
		SandboxVars.StartDay = 9;
		SandboxVars.StartTime = 2;
		SandboxVars.VehicleEasyUse = false;
		SandboxVars.WaterShutModifier = 14;
		SandboxVars.ElecShutModifier = 14;
		SandboxVars.WaterShut = 2;
		SandboxVars.ElecShut = 2;
		SandboxVars.FoodLoot = 2;
		SandboxVars.WeaponLoot = 2;
		SandboxVars.OtherLoot = 2;
		SandboxVars.Temperature = 3;
		SandboxVars.Rain = 3;
		SandboxVars.ErosionSpeed = 3;
		SandboxVars.XpMultiplier = 1.0;
		SandboxVars.StatsDecrease = 3;
		SandboxVars.NatureAbundance = 3;
		SandboxVars.Alarm = 4;
		SandboxVars.LockedHouses = 6;
		SandboxVars.FoodRotSpeed = 3;
		SandboxVars.FridgeFactor = 3;
		SandboxVars.Farming = 3;
		SandboxVars.LootRespawn = 1;
		SandboxVars.StarterKit = false;
		SandboxVars.Nutrition = true;
		SandboxVars.TimeSinceApo = 1;
		SandboxVars.PlantResilience = 3;
		SandboxVars.PlantAbundance = 3;
		SandboxVars.EndRegen = 3;
		SandboxVars.CarSpawnRate = 3;
		SandboxVars.LockedCar = 3;
		SandboxVars.CarAlarm = 2;
		SandboxVars.ChanceHasGas = 1;
		SandboxVars.InitialGas = 2;
		SandboxVars.CarGeneralCondition = 1;
		SandboxVars.RecentlySurvivorVehicles = 1;
		
		SandboxVars.ZombieLore = {
			Speed = 2,
			Strength = 2,
			Toughness = 2,
			Transmission = 1,
			Mortality = 5,
			Reanimate = 3,
			Cognition = 3,
			Memory = 2,
			Decomp = 1,
			Sight = 3,
			Hearing = 3,
			Smell = 2,
			ThumpNoChasing = 0,
		}
	end,
	onStart = function()
		-- climate
		if not start then
			start = true
			local clim = getClimateManager();
			local w = clim:getWeatherPeriod();
			if w:isRunning() then
				clim:stopWeatherAndThunder();
			end
			-- remove fog
			local var = clim:getClimateFloat(5);
			var:setEnableOverride(true);
			var:setOverride(0, 1);
			--------------------------------
		
			local playerObj = getPlayer();
			local inv = playerObj:getInventory();
			
			TDEBUG = true
			
			playerObj:setGhostMode(true);
			-- playerObj:setGodMod(true)
			
			-- Visual
			local visual = playerObj:getHumanVisual();
			playerObj:setFemale(false);
			playerObj:getDescriptor():setFemale(false);
			playerObj:getDescriptor():setForename("IBrRus")
			playerObj:getDescriptor():setSurname("")
			visual:setBeardModel("Full");
			visual:setHairModel("Bald");
			local immutableColor = ImmutableColor.new(0.105, 0.09, 0.086, 1)
			visual:setHairColor(immutableColor)
			visual:setBeardColor(immutableColor)
			visual:setSkinTextureIndex(2);
			playerObj:resetModel();

			local clothe = inv:AddItem("Base.Tshirt_DefaultTEXTURE_TINT");
			local color = ImmutableColor.new(0.25, 0.36, 0.36, 1)
			clothe:getVisual():setTint(color);
			playerObj:setWornItem(clothe:getBodyLocation(), clothe);
			clothe = inv:AddItem("Base.Trousers_Denim");
			clothe:getVisual():setTextureChoice(1);
			playerObj:setWornItem(clothe:getBodyLocation(), clothe);
			clothe = inv:AddItem("Base.Socks_Ankle");
			playerObj:setWornItem(clothe:getBodyLocation(), clothe);
			clothe = inv:AddItem("Base.Shoes_Black");
			playerObj:setWornItem(clothe:getBodyLocation(), clothe);
			--------------------------------------
			
			-- CheatCore.MadMax = false
			playerObj:getKnownRecipes():add("Basic Mechanics");
			playerObj:getKnownRecipes():add("Intermediate Mechanics");
			playerObj:getKnownRecipes():add("Advanced Mechanics");
			playerObj:getKnownRecipes():add("Powerboats Mechanics");
			playerObj:getKnownRecipes():add("Sailboats Mechanics");
			
			-- Items
			
			------------------ Понтон
			playerObj:getInventory():AddItem("Base.Hammer");
			getCountItem(playerObj, "Base.Log", 16)
			getCountItem(playerObj, "Base.Plank", 20)
			getCountItem(playerObj, "Base.Nails", 40)
			getCountItem(playerObj, "Aquatsar.TireTube", 4)
			for i=1, 5 do
				playerObj:LevelPerk(Perks.Woodwork);
			end
			------------------
			
			
			--playerObj:getInventory():AddItem("Base.EmptyPetrolCan");
			--playerObj:getInventory():AddItem("Base.PetrolCan");
			playerObj:getInventory():AddItem("Base.Wrench");
			
			-- playerObj:getInventory():AddItem("Base.Needle");
			-- playerObj:getInventory():AddItem("Base.Thread");
			-- playerObj:getInventory():AddItems("Base.RippedSheets", 10);
			-- playerObj:getInventory():AddItems("Base.LeatherStrips", 10);
			-- playerObj:getInventory():AddItems("Base.DenimStrips", 10);
			
			playerObj:getInventory():AddItem("Aquatsar.DivingMask");
			playerObj:getInventory():AddItem("Aquatsar.Lifebuoy");
			playerObj:getInventory():AddItem("Aquatsar.Compass");
			playerObj:getInventory():AddItem("Aquatsar.Sails");
		
		
			playerObj:getInventory():AddItem("Aquatsar.Paintbrush");
			playerObj:getInventory():AddItem("Aquatsar.PaintWhite");
			playerObj:getInventory():AddItem("Aquatsar.PaintBlack");

			playerObj:getInventory():AddItem("Aquatsar.BoatMag");
			playerObj:getInventory():AddItem("Aquatsar.SwimMag");
			-- playerObj:getInventory():AddItem("Base.SoupBowl");
			-- playerObj:getInventory():AddItem("Base.SoupBowl");
			playerObj:getInventory():AddItem("Base.Screwdriver");
			-- playerObj:getInventory():AddItem("Base.Crowbar");
			--playerObj:getInventory():AddItem("Radio.HamRadio2");
			-- playerObj:getInventory():AddItem("Base.AlarmClock2");
			for i=1, 10 do
				playerObj:LevelPerk(Perks.Mechanics);
			end
			
			--local boat = addVehicleDebug("Base.BoatZeroPatient", IsoDirections.S, nil, getCell():getGridSquare(11833, 6583, 0));
			--inv:AddItem(boat:createVehicleKey());
			
			--local boat2 = addVehicleDebug("Base.BoatSailingYachtWithSailsLeft", IsoDirections.S, nil, getCell():getGridSquare(11822, 6598, 0));
			--inv:AddItem(boat2:createVehicleKey());
			--boat2:repair();
			
			--local boat2 = addVehicleDebug("Base.BoatSailingYacht", IsoDirections.S, nil, getCell():getGridSquare(11839, 6598, 0));
			--inv:AddItem(boat2:createVehicleKey());
			--boat2:repair();
			
			local trailer = addVehicleDebug("Base.TrailerWithBoatSailingYacht", IsoDirections.S, nil, getCell():getGridSquare(11844, 6599, 0));
			local vehicle = addVehicleDebug("Base.CarStationWagon", IsoDirections.S, nil, getCell():getGridSquare(11844, 6606, 0));
			vehicle:repair();
			inv:AddItem(vehicle:createVehicleKey());
			inv:AddItem(vehicle:createVehicleKey());
			
			local trailer = addVehicleDebug("Base.TrailerWithBoatMotor", IsoDirections.S, nil, getCell():getGridSquare(11850, 6598, 0));
			local vehicle = addVehicleDebug("Base.CarStationWagon", IsoDirections.S, nil, getCell():getGridSquare(11850, 6606, 0));
			vehicle:repair();
			inv:AddItem(vehicle:createVehicleKey());
			inv:AddItem(vehicle:createVehicleKey());
		end

	end
}
-- debugScenarios = {}