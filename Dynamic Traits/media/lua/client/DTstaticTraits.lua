require "TimedActions/ISBaseTimedAction"

-- BLOODLUST TRAIT
function bloodlustTrait(player)
    for playerIndex = 0, getNumActivePlayers()-1 do
        local player = getSpecificPlayer(playerIndex);
        if player:HasTrait("Bloodlust") then
            if not player:isAsleep() then
                player:getModData().DTtimesinceLastKill = player:getModData().DTtimesinceLastKill + 1;
                -- IF PLAYER HAVEN'T KILLED ZOMBIES FOR 24 HOURS, THEN THE MOOD WILL BE AFFECTED EVERY HOUR
                if player:getModData().DTtimesinceLastKill > 24 then
                    -- STRESS
                    DTincreaseStress(player, 0.15);
                    -- BOREDOM
                    DTincreaseBoredom(player, 15);
                    -- UNHAPPYNESS
                    DTincreaseUnhappyness(player, 5);
                end
            end
        end
        --print("player:getModData().DTtimesinceLastKill: " .. player:getModData().DTtimesinceLastKill);
    end
end
function bloodlustTraitOnZombieKill(zombie)
    for playerIndex = 0, getNumActivePlayers()-1 do
        local player = getSpecificPlayer(playerIndex);
        if player:HasTrait("Bloodlust") then
            -- IF THE PLAYER KILLED A ZOMBIE THE NEGATIVE MOODS ARE REDUCED
            if player:getZombieKills() > player:getModData().DTKillscheck then
                -- STRESS
                DTdecreaseStress(player, 0.05);
                DTdecreaseStressFromCigarettes(player, 0.10);
                -- BOREDOM
                DTdecreaseBoredom(player, 5);
                -- UNHAPPYNESS
                DTdecreaseUnhappyness(player, 10);
                player:getModData().DTKillscheck = player:getZombieKills();
                player:getModData().DTtimesinceLastKill = 0;
            end
        end
    end
end
Events.EveryHours.Add(bloodlustTrait);
Events.OnZombieDead.Add(bloodlustTraitOnZombieKill);

-- NIGHTMARES TRAITS
function nightmaresTrait()
    for playerIndex = 0, getNumActivePlayers()-1 do
        local player = getSpecificPlayer(playerIndex);
        if player:HasTrait("Nightmares") and player:isAsleep() and ZombRand(100) == 0 then
            player:forceAwake();
            player:getStats():setPanic(95);
            DTincreaseStress(player, 0.5);
            DTincreaseWetness(player, ZombRand(99));
        end
    end
end
Events.EveryTenMinutes.Add(nightmaresTrait);

-- EXERCISE TRAIT EFFECTS
function ISFitnessAction:exeLooped()
    player = self.character;
    -- If the player has the trait "Prodigy", extra experience is added to Strength or/and Fitness on each loop (depending on the exercise)
    -- If the player has the trait "Active" the negative moods are reduced when when doing exercise
    -- If the player has the trait "Sedentary" extra pain is added the the bodyparts based on the exercise
    if self.exercise == "squats" then
        if player:HasTrait("Prodigy") then
            -- Adding 5.0XP
            player:getXp():AddXP(Perks.Fitness, (self.exeData.xpMod * 20));
        end 
        if player:HasTrait("Sedentary") then
            DTapplyPain(player, 0, "UpperLeg_L", ZombRand(7));
            DTapplyPain(player, 0, "UpperLeg_R", ZombRand(7));
            DTapplyPain(player, 0, "LowerLeg_L", ZombRand(7));
            DTapplyPain(player, 0, "LowerLeg_R", ZombRand(7));
        end
    elseif self.exercise == "pushups" then
        if player:HasTrait("Prodigy") then
            -- Adding 5.0XP
            player:getXp():AddXP(Perks.Strength, (self.exeData.xpMod * 20));
        end
        if player:HasTrait("Sedentary") then
            DTapplyPain(player, 0, "ForeArm_L", ZombRand(7));
            DTapplyPain(player, 0, "ForeArm_R", ZombRand(7));
            DTapplyPain(player, 0, "UpperArm_L", ZombRand(7));
            DTapplyPain(player, 0, "UpperArm_R", ZombRand(7));
        end
    elseif self.exercise == "situp" then
        if player:HasTrait("Prodigy") then
            -- Adding 5.0XP
            player:getXp():AddXP(Perks.Fitness, (self.exeData.xpMod * 20));
        end
        if player:HasTrait("Sedentary") then
            DTapplyPain(player, 0, "Torso_Lower", ZombRand(15));
        end
    elseif self.exercise == "burpees" then
        if player:HasTrait("Prodigy") then
            -- Adding 4.0XP
            player:getXp():AddXP(Perks.Fitness, (self.exeData.xpMod * 20));
            player:getXp():AddXP(Perks.Strength, (self.exeData.xpMod * 20));
        end
        if player:HasTrait("Sedentary") then
            DTapplyPain(player, 0, "UpperLeg_L", ZombRand(5));
            DTapplyPain(player, 0, "UpperLeg_R", ZombRand(5));
            DTapplyPain(player, 0, "LowerLeg_L", ZombRand(5));
            DTapplyPain(player, 0, "LowerLeg_R", ZombRand(5));
            DTapplyPain(player, 0, "ForeArm_L", ZombRand(5));
            DTapplyPain(player, 0, "ForeArm_R", ZombRand(5));
            DTapplyPain(player, 0, "UpperArm_L", ZombRand(5));
            DTapplyPain(player, 0, "UpperArm_R", ZombRand(5));
        end
    elseif self.exercise == "barbellcurl" then
        if player:HasTrait("Prodigy") then
            -- Adding 6.0XP
            player:getXp():AddXP(Perks.Strength, (self.exeData.xpMod * 20));
        end
        if player:HasTrait("Sedentary") then
            DTapplyPain(player, 0, "ForeArm_L", ZombRand(10));
            DTapplyPain(player, 0, "ForeArm_R", ZombRand(10));
            DTapplyPain(player, 0, "UpperArm_L", ZombRand(10));
            DTapplyPain(player, 0, "UpperArm_R", ZombRand(10));
        end
    elseif self.exercise == "dumbbellpress" then
        if player:HasTrait("Prodigy") then
            -- Adding 9.0XP
            player:getXp():AddXP(Perks.Strength, (self.exeData.xpMod * 20));
        end
        if player:HasTrait("Sedentary") then
            DTapplyPain(player, 0, "ForeArm_L", ZombRand(10));
            DTapplyPain(player, 0, "ForeArm_R", ZombRand(10));
            DTapplyPain(player, 0, "UpperArm_L", ZombRand(13));
            DTapplyPain(player, 0, "UpperArm_R", ZombRand(13));
        end
    elseif self.exercise == "bicepscurl" then
        if player:HasTrait("Prodigy") then
            -- Adding 9.0XP
            player:getXp():AddXP(Perks.Strength, (self.exeData.xpMod * 20));
        end
        if player:HasTrait("Sedentary") then
            DTapplyPain(player, 0, "ForeArm_L", ZombRand(10));
            DTapplyPain(player, 0, "ForeArm_R", ZombRand(10));
            DTapplyPain(player, 0, "UpperArm_L", ZombRand(13));
            DTapplyPain(player, 0, "UpperArm_R", ZombRand(13));
        end
    end
    if player:HasTrait("PhysicallyActive") then
        DTdecreaseStress(player, 0.05);
        DTdecreaseStressFromCigarettes(player, 0.05);
        DTdecreaseUnhappyness(player, 0.5);
        DTdecreaseBoredom(player, 5);
    elseif player:HasTrait("Sedentary") then
        DTincreaseBoredom(player, 7);
    end
    player:getModData().DTObtainLoseActiveSedentary = player:getModData().DTObtainLoseActiveSedentary + 10;
    if player:getModData().DTObtainLoseActiveSedentary > 70000 then
		player:getModData().DTObtainLoseActiveSedentary = 70000;
	end
    -- IF THE ROLL IS 0 THEN THE NEXT TRAITS ARE POSITIVELY AFFECTED: SMOKER, ALCOHOLIC, ANOREXIC
    if ZombRand(25) == 0 then
        -- SMOKER
        if player:HasTrait("Smoker") then
            player:getModData().DTdaysSinceLastSmoke = player:getModData().DTdaysSinceLastSmoke + ZombRand(5);
        end
        -- ALCOHOLIC
        player:getModData().DThoursSinceLastDrink = player:getModData().DThoursSinceLastDrink + ZombRand(3);
        player:getModData().DTthresholdToObtainAlcoholic = player:getModData().DTthresholdToObtainAlcoholic - ZombRand(3);
        -- ANOREXIC
        player:getModData().DTthresholdToObtainLoseAnorexy = player:getModData().DTthresholdToObtainLoseAnorexy + ZombRand(7);
    end
	self.repnb = self.repnb + 1;
	self.fitness:exerciseRepeat();
	self:setFitnessSpeed();
end