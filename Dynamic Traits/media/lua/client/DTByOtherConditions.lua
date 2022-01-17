require "TimedActions/ISBaseTimedAction"

-- MAIN METHOD TO CALL OTHERS
function DTMain(player)
    -- INITIALIZATIONS FOR AN EXISTING CHARACTER
    DTBaseGameCharacterDetails.DoExistingCharacterInitializations(player);

    -- CALL TO OTHER METHODS THAT RUNS BASED ON THE OnPlayerUpdate FUNCTION
    if not player:HasTrait("Dextrous") or not player:HasTrait("Organized") then
        traitsByMovingObjects(player);
    end
    if not player:HasTrait("Outdoorsman") then
        outdoorsmanTrait(player);
    end
    if not player:HasTrait("NightVision") then
        catsEyes(player);
    end
    rainTraits(player);
    if player:HasTrait("Agoraphobic") or player:HasTrait("Claustophobic") then
        agoraphobicClaustrophobicTraits(player);
    end
end
Events.OnPlayerUpdate.Add(DTMain);

-- DEXTROUS/ALL THUMBS AND ORGANIZED/DISORGANIZED TRAITS
function ISInventoryTransferAction:update()
    local player = self.character;
    if not player:HasTrait("Dextrous") or not player:HasTrait("Organized") then
        -- CHECK IF THE PLAYER IS OBESE OR VERY UNDERWEIGHT
        if player:HasTrait("Obese") or player:HasTrait("Very Underweight") or player:HasTrait("Emaciated") then
            if not player:HasTrait("Dextrous") then -- CHECK IF THE PLAYER HAVEN'T OBTAINED DEXTROUS YET, IF DON'T, THEN THE CODE IS EXECUTED
                player:getModData().DTatdTraits = player:getModData().DTatdTraits + 0.06;
            end
            if not player:HasTrait("Organized") then -- CHECK IF THE PLAYER HAVEN'T OBTAINED ORGANIZED YET, IF DON'T, THEN THE CODE IS EXECUTED
                player:getModData().DTdoTraits = player:getModData().DTdoTraits + 0.07;
            end
        -- CHECK IF THE PLAYER IS OVERWEIGHT OR UNDERWEIGHT
        elseif player:HasTrait("Overweight") or player:HasTrait("Underweight") then
            if not player:HasTrait("Dextrous") then -- CHECK IF THE PLAYER HAVEN'T OBTAINED DEXTROUS YET, IF DON'T, THEN THE CODE IS EXECUTED
                player:getModData().DTatdTraits = player:getModData().DTatdTraits + 0.08;
            end
            if not player:HasTrait("Organized") then -- CHECK IF THE PLAYER HAVEN'T OBTAINED ORGANIZED YET, IF DON'T, THEN THE CODE IS EXECUTED
                player:getModData().DTdoTraits = player:getModData().DTdoTraits + 0.09;
            end
        -- THE PLAYER DOESN'T HAVE WEIGHT PROBLEMS
        else
            if not player:HasTrait("Dextrous") then -- CHECK IF THE PLAYER HAVEN'T OBTAINED DEXTROUS YET, IF DON'T, THEN THE CODE IS EXECUTED
                player:getModData().DTatdTraits = player:getModData().DTatdTraits + 0.1;
            end
            if not player:HasTrait("Organized") then -- CHECK IF THE PLAYER HAVEN'T OBTAINED ORGANIZED YET, IF DON'T, THEN THE CODE IS EXECUTED
                player:getModData().DTdoTraits = player:getModData().DTdoTraits + 0.2;
            end
        end
    end
    -- reopen the correct container
	if self.selectedContainer then
		if self.selectedContainer:getParent() then
			self.character:faceThisObject(self.selectedContainer:getParent())
		end
		if self.character:shouldBeTurning() then
			getPlayerLoot(self.character:getPlayerNum()):setForceSelectedContainer(self.selectedContainer)
		end
		getPlayerLoot(self.character:getPlayerNum()):selectButtonForContainer(self.selectedContainer)
	end
    --    if self.updateDestCont then
    --        self.destContainer:setSourceGrid(self.character:getCurrentSquare());
    --    end
    --
    --    if self.updateSrcCont then
    --        self.srcContainer:setSourceGrid(self.character:getCurrentSquare());
    --    end
	self.item:setJobDelta(self.action:getJobDelta());

    self.character:setMetabolicTarget(Metabolics.LightWork);
end

function ISGrabItemAction:update()
    local player = self.character;
    if not player:HasTrait("Dextrous") or not player:HasTrait("Organized") then
        -- CHECK IF THE PLAYER IS OBESE OR VERY UNDERWEIGHT
        if player:HasTrait("Obese") or player:HasTrait("Very Underweight") or player:HasTrait("Emaciated") then
            if not player:HasTrait("Dextrous") then -- CHECK IF THE PLAYER HAVEN'T OBTAINED DEXTROUS YET, IF DON'T, THEN THE CODE IS EXECUTED
                player:getModData().DTatdTraits = player:getModData().DTatdTraits + 0.06;
            end
            if not player:HasTrait("Organized") then -- CHECK IF THE PLAYER HAVEN'T OBTAINED ORGANIZED YET, IF DON'T, THEN THE CODE IS EXECUTED
                player:getModData().DTdoTraits = player:getModData().DTdoTraits + 0.07;
            end
        -- CHECK IF THE PLAYER IS OVERWEIGHT OR UNDERWEIGHT
        elseif player:HasTrait("Overweight") or player:HasTrait("Underweight") then
            if not player:HasTrait("Dextrous") then -- CHECK IF THE PLAYER HAVEN'T OBTAINED DEXTROUS YET, IF DON'T, THEN THE CODE IS EXECUTED
                player:getModData().DTatdTraits = player:getModData().DTatdTraits + 0.08;
            end
            if not player:HasTrait("Organized") then -- CHECK IF THE PLAYER HAVEN'T OBTAINED ORGANIZED YET, IF DON'T, THEN THE CODE IS EXECUTED
                player:getModData().DTdoTraits = player:getModData().DTdoTraits + 0.09;
            end
        -- THE PLAYER DOESN'T HAVE WEIGHT PROBLEMS
        else
            if not player:HasTrait("Dextrous") then -- CHECK IF THE PLAYER HAVEN'T OBTAINED DEXTROUS YET, IF DON'T, THEN THE CODE IS EXECUTED
                player:getModData().DTatdTraits = player:getModData().DTatdTraits + 0.1;
            end
            if not player:HasTrait("Organized") then -- CHECK IF THE PLAYER HAVEN'T OBTAINED ORGANIZED YET, IF DON'T, THEN THE CODE IS EXECUTED
                player:getModData().DTdoTraits = player:getModData().DTdoTraits + 0.2;
            end
        end
    end
    self.item:getItem():setJobDelta(self:getJobDelta());
end

function traitsByMovingObjects(player)
    -- CHECK IF THE PLAYER ACHIEVED THE REQUIREMENTS TO REMOVE/GAIN THE TRAITS
    -- ALL THUMBS/DEXTROUS
    if player:getModData().DTatdTraits >= 60000 and player:HasTrait("AllThumbs") then
        player:getTraits():remove("AllThumbs");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_AllThumbs"), false, HaloTextHelper.getColorGreen());
    elseif player:getModData().DTatdTraits >= 120000 and not player:HasTrait("Dextrous") then
        player:getTraits():add("Dextrous");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Dexterous"), true, HaloTextHelper.getColorGreen());
    -- ORGANIZED/DISORGANIZED
    elseif player:getModData().DTdoTraits >= 100000 and player:HasTrait("Disorganized") then
        player:getTraits():remove("Disorganized");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Disorganized"), false, HaloTextHelper.getColorGreen());
    elseif player:getModData().DTdoTraits >= 200000 and not player:HasTrait("Organized") then
        player:getTraits():add("Organized");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Packmule"), true, HaloTextHelper.getColorGreen());
    end
    --print("player:getModData().DTatdTraits: " .. player:getModData().DTatdTraits);
    --print("player:getModData().DTdoTraits: " .. player:getModData().DTdoTraits);
end

-- OUTDOORSMAN TRAIT
function outdoorsmanTrait(player)
    local climateManager = getClimateManager();
    local rainIntensity = climateManager:getRainIntensity();
    local snowIntensity = climateManager:getSnowIntensity();
    local windIntensity = climateManager:getWindIntensity();
    local fogIntensity = climateManager:getFogIntensity();
    local isThunderstorming = climateManager:getIsThunderStorming();
    if player:isOutside() and player:getVehicle() == nil then -- THE PLAYER IS OUTSIDE AND NOT IN A VEHICLE SO IS GETTING THE OUTDOORSMAN TRAIT
        -- RAIN WEATHER
        if rainIntensity > 0 and rainIntensity <= 0.30 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 0.06;
        elseif rainIntensity > 0.30 and rainIntensity <= 0.50 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 0.07;
        elseif rainIntensity > 0.50 and rainIntensity <= 0.70 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 0.08;
        elseif rainIntensity > 0.70 and rainIntensity <= 0.90 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 0.09;
        elseif rainIntensity > 0.90 and rainIntensity <= 1 then 
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 0.1;
        end
        -- IS THUNDERSTORMING
        if isThunderstorming then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 0.1;
        end
        -- SNOW WEATHER
        if snowIntensity > 0 and snowIntensity <= 0.30 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 0.06;
        elseif snowIntensity > 0.30 and snowIntensity <= 0.50 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 0.07;
        elseif snowIntensity > 0.50 and snowIntensity <= 0.70 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 0.08;
        elseif snowIntensity > 0.70 and snowIntensity <= 0.90 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 0.09;
        elseif snowIntensity > 0.90 and snowIntensity <= 1 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 0.1;
        end
        -- WINDY WEATHER
        if windIntensity > 0 and windIntensity <= 0.30 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 0.04;
        elseif windIntensity > 0.30 and windIntensity <= 0.50 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 0.05;
        elseif windIntensity > 0.50 and windIntensity <= 0.70 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 0.06;
        elseif windIntensity > 0.70 and windIntensity <= 0.90 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 0.07;
        elseif windIntensity > 0.90 and windIntensity <= 1 then 
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 0.08;
        end
        -- FOG
        if fogIntensity > 0 and fogIntensity <= 0.30 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 0.01;
        elseif fogIntensity > 0.30 and fogIntensity <= 0.50 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 0.02;
        elseif fogIntensity > 0.50 and fogIntensity <= 0.70 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 0.03;
        elseif fogIntensity > 0.70 and fogIntensity <= 0.90 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 0.04;
        elseif fogIntensity > 0.90 and fogIntensity <= 1 then
            player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 0.05;
        end
    end
    if player:HasTrait("Pluviophile") then
        player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 0.01;
    end
    if player:HasTrait("Formerscout") then
        player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 0.01;
    end
    if player:HasTrait("Hiker") then
        player:getModData().DTOutdoorsCounter = player:getModData().DTOutdoorsCounter + 0.01;
    end
    -- CHECK IF THE PLAYER ACHIEVED THE NECESSARY TO WIN OUTDOORSMAN
    if player:getModData().DTOutdoorsCounter >= 300000 then
        player:getTraits():add("Outdoorsman");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_outdoorsman"), true, HaloTextHelper.getColorGreen());
    end
    --print("player:getModData().DTOutdoorsCounter: " .. player:getModData().DTOutdoorsCounter);
end

-- CATS EYES TRAIT
function catsEyes(player)
    local gameTime = getGameTime();
    local currentHour = gameTime:getHour();
    if not player:isAsleep() then
        if currentHour == 22 or currentHour == 23 or currentHour == 4 or currentHour == 5 then
            if player:isOutside() then
                player:getModData().DTCatsEyesCounter = player:getModData().DTCatsEyesCounter + 0.07;
            else
                player:getModData().DTCatsEyesCounter = player:getModData().DTCatsEyesCounter + 0.05;
            end
        elseif currentHour == 0 or currentHour == 1 or currentHour == 2 or currentHour == 3 then
            if player:isOutside() then
                player:getModData().DTCatsEyesCounter = player:getModData().DTCatsEyesCounter + 0.5;
            else
                player:getModData().DTCatsEyesCounter = player:getModData().DTCatsEyesCounter + 0.1;
            end
        end
    end
    -- CHECK IF THE PLAYER ACHIEVED THE NECESSARY TO WIN CATS EYES
    if player:getModData().DTCatsEyesCounter >= 120000 then
        player:getTraits():add("NightVision");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_NightVision"), true, HaloTextHelper.getColorGreen());
    end
    --print("player:getModData().DTCatsEyesCounter: " .. player:getModData().DTCatsEyesCounter);
end
-- RAIN TRAITS
function rainTraits(player)
    local climateManager = getClimateManager();
    local rainIntensity = climateManager:getRainIntensity();
    if player:isOutside() and player:getVehicle() == nil and rainIntensity > 0 then -- THE PLAYER NEEDS TO BE OUTSIDE, NOT IN A VEHICLE AND IT MUST BE RAINING
        -- BASED ON THE RAIN LEVELS THE EFFECTS WILL BE STRONGER OR WEAKER
        if rainIntensity > 0 and rainIntensity <= 0.30 then
            if player:HasTrait("Pluviophile") then
                DTdecreaseStress(player, 0.00003);
                DTdecreaseStressFromCigarettes(player, 0.00003);
                DTdecreaseUnhappyness(player, 0.002);
            elseif player:HasTrait("Pluviophobia") then
                DTincreaseStress(player, 0.00003);
                DTincreaseUnhappyness(player, 0.002);
                player:getModData().DTRainTraits = player:getModData().DTRainTraits + 0.01;
            else
                player:getModData().DTRainTraits = player:getModData().DTRainTraits + 0.01;
            end
        elseif rainIntensity > 0.30 and rainIntensity <= 0.50 then
            if player:HasTrait("Pluviophile") then
                DTdecreaseStress(player, 0.00004);
                DTdecreaseStressFromCigarettes(player, 0.00004);
                DTdecreaseUnhappyness(player, 0.003);
            elseif player:HasTrait("Pluviophobia") then
                DTincreaseStress(player, 0.00004);
                DTincreaseUnhappyness(player, 0.003);
                player:getModData().DTRainTraits = player:getModData().DTRainTraits + 0.02;
            else
                player:getModData().DTRainTraits = player:getModData().DTRainTraits + 0.02;
            end
        elseif rainIntensity > 0.50 and rainIntensity <= 0.70 then
            if player:HasTrait("Pluviophile") then
                DTdecreaseStress(player, 0.00005);
                DTdecreaseStressFromCigarettes(player, 0.00005);
                DTdecreaseUnhappyness(player, 0.004);
            elseif player:HasTrait("Pluviophobia") then
                DTincreaseStress(player, 0.00005);
                DTincreaseUnhappyness(player, 0.004);
                player:getModData().DTRainTraits = player:getModData().DTRainTraits + 0.03;
            else
                player:getModData().DTRainTraits = player:getModData().DTRainTraits + 0.03;
            end 
        elseif rainIntensity > 0.70 and rainIntensity <= 0.90 then
            if player:HasTrait("Pluviophile") then
                DTdecreaseStress(player, 0.00006);
                DTdecreaseStressFromCigarettes(player, 0.00006);
                DTdecreaseUnhappyness(player, 0.005);
            elseif player:HasTrait("Pluviophobia") then
                DTincreaseStress(player, 0.00006);
                DTincreaseUnhappyness(player, 0.005);
                player:getModData().DTRainTraits = player:getModData().DTRainTraits + 0.04;
            else
                player:getModData().DTRainTraits = player:getModData().DTRainTraits + 0.04;
            end 
        elseif rainIntensity > 0.90 and rainIntensity <= 1 then 
            if player:HasTrait("Pluviophile") then
                DTdecreaseStress(player, 0.00007);
                DTdecreaseStressFromCigarettes(player, 0.00007);
                DTdecreaseUnhappyness(player, 0.006);
            elseif player:HasTrait("Pluviophobia") then
                DTincreaseStress(player, 0.00007);
                DTincreaseUnhappyness(player, 0.006);
                player:getModData().DTRainTraits = player:getModData().DTRainTraits + 0.05;
            else
                player:getModData().DTRainTraits = player:getModData().DTRainTraits + 0.05;
            end
        end
        -- IF THE PLAYER HAVEN'T OBTAINED PLUVIOPHILE, THEN SOME EXTRA POINTS ARE ADDED IF "Outdoorsman", "Former Scout" AND/OR "Hiker" ARE PRESENT
        if not player:HasTrait("Pluviophile") then
            if player:HasTrait("Outdoorsman") then
                player:getModData().DTRainTraits = player:getModData().DTRainTraits + 0.01;
            end
            if player:HasTrait("Formerscout") then
                player:getModData().DTRainTraits = player:getModData().DTRainTraits + 0.01;
            end
            if player:HasTrait("Hiker") then
                player:getModData().DTRainTraits = player:getModData().DTRainTraits + 0.01;
            end
        end
    end
    -- CHECK IF THE PLAYER ACHIEVED THE REQUIREMENTS TO REMOVE/GAIN THE TRAITS
    if player:getModData().DTRainTraits >= 50000 and player:HasTrait("Pluviophobia") then
        player:getTraits():remove("Pluviophobia");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Pluviophobia"), false, HaloTextHelper.getColorGreen());
    elseif player:getModData().DTRainTraits >= 100000 and not player:HasTrait("Pluviophile") then
        player:getTraits():add("Pluviophile");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Pluviophile"), true, HaloTextHelper.getColorGreen());
    end
    --print("player:getModData().DTRainTraits: " .. player:getModData().DTRainTraits);
end

-- CLAUSTROPHOBIC AND AGORAPHOBIC TRAITS
function agoraphobicClaustrophobicTraits(player)
    if player:isOutside() and player:HasTrait("Agoraphobic") then
        player:getModData().DTagoraClaustroCounter = player:getModData().DTagoraClaustroCounter + 0.04;
    elseif not player:isOutside() and player:HasTrait("Claustophobic") then
        player:getModData().DTagoraClaustroCounter = player:getModData().DTagoraClaustroCounter + 0.08;
    end
    -- CHECK IF THE PLAYER ACHIEVED THE NECESSARY TO REMOVE CLAUSTROPHOBIC OR AGORAPHOBIC TRAITS
    if player:getModData().DTagoraClaustroCounter >= 500000 then
        if player:HasTrait("Agoraphobic") then
            player:getTraits():remove("Agoraphobic");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_agoraphobic"), false, HaloTextHelper.getColorGreen());
        elseif player:HasTrait("Claustophobic") then
            player:getTraits():remove("Claustophobic");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_claustro"), false, HaloTextHelper.getColorGreen());
        end
    end
    --print("player:getModData().DTagoraClaustroCounter: " .. player:getModData().DTagoraClaustroCounter);
end
function luckyUnluckyEffectsForAgoraClaustroTraits()
    for playerIndex = 0, getNumActivePlayers()-1 do
        local player = getSpecificPlayer(playerIndex);
        if player:HasTrait("Agoraphobic") or player:HasTrait("Claustophobic") then
            if ZombRand(50) == 0 then
                player:getModData().DTagoraClaustroCounter = player:getModData().DTagoraClaustroCounter + DTluckyUnluckyModifier(player, 10);
            end
        end
    end
end
Events.EveryTenMinutes.Add(luckyUnluckyEffectsForAgoraClaustroTraits);

-- SMOKER TRAIT
function smokerTrait(player)
    for playerIndex = 0, getNumActivePlayers()-1 do
        local player = getSpecificPlayer(playerIndex);
        if player:HasTrait("Smoker") then
            local currentTimeSinceLastSmoke = player:getTimeSinceLastSmoke();
            if currentTimeSinceLastSmoke == 10 then
                player:getModData().DTdaysSinceLastSmoke = player:getModData().DTdaysSinceLastSmoke + 1;
                if ZombRand(25) == 0 then
                    player:getModData().DTdaysSinceLastSmoke = player:getModData().DTdaysSinceLastSmoke + DTluckyUnluckyModifier(player, 7);
                end
            else
                player:getModData().DTdaysSinceLastSmoke = player:getModData().DTdaysSinceLastSmoke - 5;
                if ZombRand(25) == 0 then
                    player:getModData().DTdaysSinceLastSmoke = player:getModData().DTdaysSinceLastSmoke + DTluckyUnluckyModifier(player, 7);
                end
            end
            -- CHECK THE VALUE TO KEEP IT INTO THE LIMITS
            if player:getModData().DTdaysSinceLastSmoke < 0 then
                player:getModData().DTdaysSinceLastSmoke = 0;
            end
            -- CHECK IF THE PLAYER ACHIEVED THE REQUIREMENTS TO REMOVE SMOKER
            if player:getModData().DTdaysSinceLastSmoke >= 720 then
                player:setTimeSinceLastSmoke(0);
                player:getStats():setStressFromCigarettes(0);
                player:getStats():setStress(1);
                player:getTraits():remove("Smoker");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Smoker"), false, HaloTextHelper.getColorGreen());
            end
        end
        --print("player:getModData().DTdaysSinceLastSmoke: " .. player:getModData().DTdaysSinceLastSmoke);
    end
end
Events.EveryHours.Add(smokerTrait);

-- ALCOHOLIC TRAIT
function alcoholicTrait()
    for playerIndex = 0, getNumActivePlayers()-1 do
        local player = getSpecificPlayer(playerIndex);
        local currentDrunkenness = player:getStats():getDrunkenness();
        -- Drunkenness is greater than 0 which means the player recently had a drink.
        if currentDrunkenness > 0 then
            player:getModData().DThoursSinceLastDrink = player:getModData().DThoursSinceLastDrink - 72;
            player:getModData().DTthresholdToObtainAlcoholic = player:getModData().DTthresholdToObtainAlcoholic + 72;
            if ZombRand(25) == 0 then
                player:getModData().DThoursSinceLastDrink = player:getModData().DThoursSinceLastDrink + DTluckyUnluckyModifier(player, 20);
                player:getModData().DTthresholdToObtainAlcoholic = player:getModData().DTthresholdToObtainAlcoholic + DTluckyUnluckyModifier(player, 12);
            end
        -- Drunkenness is equal to 0 which means the player recently haven't had a drink.
        else
            player:getModData().DThoursSinceLastDrink = player:getModData().DThoursSinceLastDrink + 1;
            player:getModData().DTthresholdToObtainAlcoholic = player:getModData().DTthresholdToObtainAlcoholic - 1;
            if ZombRand(25) == 0 then
                player:getModData().DThoursSinceLastDrink = player:getModData().DThoursSinceLastDrink + DTluckyUnluckyModifier(player, 7);
                player:getModData().DTthresholdToObtainAlcoholic = player:getModData().DTthresholdToObtainAlcoholic - DTluckyUnluckyModifier(player, 7);
            end
            -- If the player has the Alcoholic trait and haven't drinked for the latest 48 hours the effects starts.
            if player:HasTrait("Alcoholic") and player:getModData().DThoursSinceLastDrink >= 48 then
                -- STRESS
                DTincreaseStress(player, 0.15);
                -- UNHAPPYNESS
                DTincreaseUnhappyness(player, 7);
                -- FATIGUE
                DTincreaseFatigue(player, ZombRand(3), 0.05);
                -- HEADACHE
                DTapplyPain(player, ZombRand(5), "Head", ZombRand(75));
                -- POISON
                DTincreasePoison(player, ZombRand(7), ZombRand(40));
            end
        end
        -- CHECK BOTH VALUES TO KEEP THEM INTO THE LIMITS
        if player:getModData().DThoursSinceLastDrink > 750 then
            player:getModData().DThoursSinceLastDrink = 750;
        elseif player:getModData().DThoursSinceLastDrink < 0 then
            player:getModData().DThoursSinceLastDrink = 0;
        end
        if player:getModData().DTthresholdToObtainAlcoholic > 750 then
            player:getModData().DTthresholdToObtainAlcoholic = 750;
        elseif player:getModData().DTthresholdToObtainAlcoholic < 0 then
            player:getModData().DTthresholdToObtainAlcoholic = 0;
        end
        -- CHECK IF THE PLAYER ACHIEVED THE REQUIREMENTS TO REMOVE/GAIN ALCOHOLIC
        if player:getModData().DThoursSinceLastDrink >= 504 and player:HasTrait("Alcoholic") then
            player:getTraits():remove("Alcoholic");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Alcoholic"), false, HaloTextHelper.getColorGreen());
            player:getModData().DTthresholdToObtainAlcoholic = 0;
        end
        if player:getModData().DTthresholdToObtainAlcoholic >= 750 and not player:HasTrait("Alcoholic") then
            player:getTraits():add("Alcoholic");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Alcoholic"), true, HaloTextHelper.getColorRed());
        end
        --print("player:getModData().DThoursSinceLastDrink: " .. player:getModData().DThoursSinceLastDrink);
        --print("player:getModData().DTthresholdToObtainAlcoholic: " .. player:getModData().DTthresholdToObtainAlcoholic);
    end
end
Events.EveryHours.Add(alcoholicTrait);

-- ANOREXY TRAIT
function anorexyTrait()
    for playerIndex = 0, getNumActivePlayers()-1 do
        local player = getSpecificPlayer(playerIndex);
        local currentWeight = player:getNutrition():getWeight();
        if currentWeight < 65 then
            -- Based on the Stress and Unhapyness the rate to obtain Anorexy is lower/higher.
            if player:getMoodles():getMoodleLevel(MoodleType.Unhappy) == 1 or player:getMoodles():getMoodleLevel(MoodleType.Stress) == 1 then
                player:getModData().DTthresholdToObtainLoseAnorexy = player:getModData().DTthresholdToObtainLoseAnorexy - 2;
            elseif player:getMoodles():getMoodleLevel(MoodleType.Unhappy) == 2 or player:getMoodles():getMoodleLevel(MoodleType.Stress) == 2 then
                player:getModData().DTthresholdToObtainLoseAnorexy = player:getModData().DTthresholdToObtainLoseAnorexy - 3;
            elseif player:getMoodles():getMoodleLevel(MoodleType.Unhappy) == 3 or player:getMoodles():getMoodleLevel(MoodleType.Stress) == 3 then
                player:getModData().DTthresholdToObtainLoseAnorexy = player:getModData().DTthresholdToObtainLoseAnorexy - 4;
            elseif player:getMoodles():getMoodleLevel(MoodleType.Unhappy) == 4 or player:getMoodles():getMoodleLevel(MoodleType.Stress) == 4 then
                player:getModData().DTthresholdToObtainLoseAnorexy = player:getModData().DTthresholdToObtainLoseAnorexy - 5;
            else
                player:getModData().DTthresholdToObtainLoseAnorexy = player:getModData().DTthresholdToObtainLoseAnorexy - 1;
            end
            -- Being Lucky or Unlucky may increase/decrease the counter to obtain/remove Anorexy.
            if ZombRand(25) == 0 then
                player:getModData().DTthresholdToObtainLoseAnorexy = player:getModData().DTthresholdToObtainLoseAnorexy + DTluckyUnluckyModifier(player, 7);
            end
        else
            if currentWeight >= 65 and currentWeight < 75 then
                if player:getMoodles():getMoodleLevel(MoodleType.Unhappy) == 0 and player:getMoodles():getMoodleLevel(MoodleType.Stress) == 0 then
                    player:getModData().DTthresholdToObtainLoseAnorexy = player:getModData().DTthresholdToObtainLoseAnorexy + 2;
                else
                    player:getModData().DTthresholdToObtainLoseAnorexy = player:getModData().DTthresholdToObtainLoseAnorexy + 1;
                end
            elseif currentWeight >= 75 then
                if player:getMoodles():getMoodleLevel(MoodleType.Unhappy) == 0 and player:getMoodles():getMoodleLevel(MoodleType.Stress) == 0 then
                    player:getModData().DTthresholdToObtainLoseAnorexy = player:getModData().DTthresholdToObtainLoseAnorexy + 3;
                else
                    player:getModData().DTthresholdToObtainLoseAnorexy = player:getModData().DTthresholdToObtainLoseAnorexy + 2;
                end
            end
            -- Being Lucky or Unlucky may increase/decrease the counter to obtain/remove Anorexy.
            if ZombRand(25) == 0 then
                player:getModData().DTthresholdToObtainLoseAnorexy = player:getModData().DTthresholdToObtainLoseAnorexy + DTluckyUnluckyModifier(player, 7);
            end
        end
        -- CHECK THE VALUE TO KEEP IT INTO THE LIMITS
        if player:getModData().DTthresholdToObtainLoseAnorexy < -1080 then
            player:getModData().DTthresholdToObtainLoseAnorexy = -1080;
        elseif player:getModData().DTthresholdToObtainLoseAnorexy > 1080 then
            player:getModData().DTthresholdToObtainLoseAnorexy = 1080;
        end 
        -- CHECK IF THE PLAYER ACHIEVED THE REQUIREMENTS TO OBTAIN OR REMOVE ANOREXY TRAIT
        if player:getModData().DTthresholdToObtainLoseAnorexy >= 720 and player:HasTrait("Anorexy") then
            player:getTraits():remove("Anorexy");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Anorexy"), false, HaloTextHelper.getColorGreen());
        elseif player:getModData().DTthresholdToObtainLoseAnorexy <= -720 and not player:HasTrait("Anorexy") then
            player:getTraits():add("Anorexy");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Anorexy"), true, HaloTextHelper.getColorRed());
        end
        --print("player:getModData().DTthresholdToObtainLoseAnorexy: " .. player:getModData().DTthresholdToObtainLoseAnorexy);
    end
end
Events.EveryHours.Add(anorexyTrait);

function anorexyTraitHungerSymptoms()
    for playerIndex = 0, getNumActivePlayers()-1 do
        local player = getSpecificPlayer(playerIndex);
        if player:HasTrait("Anorexy") then
            if player:getMoodles():getMoodleLevel(MoodleType.FoodEaten) == 1 then
                -- UNHAPPYNESS
                DTincreaseUnhappyness(player, 0.5);
                -- STRESS
                DTincreaseStress(player, 0.05);
                -- POISON
                DTincreasePoison(player, ZombRand(8), ZombRand(10));
            elseif player:getMoodles():getMoodleLevel(MoodleType.FoodEaten) == 2 then
                -- UNHAPPYNESS
                DTincreaseUnhappyness(player, 0.6);
                -- STRESS
                DTincreaseStress(player, 0.06);
                -- POISON
                DTincreasePoison(player, ZombRand(7), ZombRand(15));
            elseif player:getMoodles():getMoodleLevel(MoodleType.FoodEaten) == 3 then
                -- UNHAPPYNESS
                DTincreaseUnhappyness(player, 0.7);
                -- STRESS
                DTincreaseStress(player, 0.07);
                -- POISON
                DTincreasePoison(player, ZombRand(6), ZombRand(20));
            elseif player:getMoodles():getMoodleLevel(MoodleType.FoodEaten) == 4 then
                -- UNHAPPYNESS
                DTincreaseUnhappyness(player, 0.8);
                -- STRESS
                DTincreaseStress(player, 0.08);
                -- POISON
                DTincreasePoison(player, ZombRand(5), ZombRand(25));
            end
        end
    end
end
Events.EveryTenMinutes.Add(anorexyTraitHungerSymptoms);

function anorexyTraitPassiveSymptoms()
    for playerIndex = 0, getNumActivePlayers()-1 do
        local player = getSpecificPlayer(playerIndex);
        if player:HasTrait("Anorexy") then
            if not player:isAsleep() then
                -- FATIGUE
                DTincreaseFatigue(player, 0, 0.07);
                -- ENDURANCE
                DTdecreaseEndurance(player, 0, 0.07);
                local currentWeight = player:getNutrition():getWeight();
                -- IF ANOREXY AND MORE THAN 65KG's
                if currentWeight >= 65 then
                    -- UNHAPPYNESS
                    DTincreaseUnhappyness(player, 7);
                    -- STRESS
                    DTincreaseStress(player, 0.15);
                end
            end
        end
    end
end
Events.EveryHours.Add(anorexyTraitPassiveSymptoms);

-- PHYSICALLY ACTIVE AND SEDENTARY TRAITS
function activeSedentaryTraits()
    for playerIndex = 0, getNumActivePlayers()-1 do
        local player = getSpecificPlayer(playerIndex);
        if not player:isAsleep() then
            player:getModData().DTObtainLoseActiveSedentary = player:getModData().DTObtainLoseActiveSedentary - 0.5;
        else
            player:getModData().DTObtainLoseActiveSedentary = player:getModData().DTObtainLoseActiveSedentary - 0.5;
        end
        if player:getModData().DTObtainLoseActiveSedentary < -70000 then
            player:getModData().DTObtainLoseActiveSedentary = -70000;
        end
        -- CHECK IF THE PLAYER ACHIEVED THE NECESSARY TO OBTAIN/REMOVE THE TRAITS
        if player:getModData().DTObtainLoseActiveSedentary <= -20000 and not player:HasTrait("Sedentary") then
            player:getTraits():add("Sedentary");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Sedentary"), true, HaloTextHelper.getColorRed());
        elseif player:getModData().DTObtainLoseActiveSedentary > -20000 and player:getModData().DTObtainLoseActiveSedentary < 40000 and (player:HasTrait("PhysicallyActive") or player:HasTrait("Sedentary")) then
            if player:HasTrait("PhysicallyActive") then
                player:getTraits():remove("PhysicallyActive");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_PhysicallyActive"), false, HaloTextHelper.getColorRed());
            elseif player:HasTrait("Sedentary") then
                player:getTraits():remove("Sedentary");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Sedentary"), false, HaloTextHelper.getColorGreen());
            end
        elseif player:getModData().DTObtainLoseActiveSedentary >= 40000 and not player:HasTrait("PhysicallyActive") then
            player:getTraits():add("PhysicallyActive");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_PhysicallyActive"), true, HaloTextHelper.getColorGreen());
        end
        --print("player:getModData().DTObtainLoseActiveSedentary: " .. player:getModData().DTObtainLoseActiveSedentary);
    end
end
Events.EveryTenMinutes.Add(activeSedentaryTraits);