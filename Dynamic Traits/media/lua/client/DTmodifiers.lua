function DTincreasePoison(player, chance, poison)
    local currentFoodPoison = player:getBodyDamage():getFoodSicknessLevel();
    if chance == 0 then
        if player:HasTrait("WeakStomach") then
            player:getBodyDamage():setFoodSicknessLevel(currentFoodPoison + (poison * 1.3));
        elseif player:HasTrait("WeakStomach") and player:HasTrait("ProneToIllness") then
            player:getBodyDamage():setFoodSicknessLevel(currentFoodPoison + (poison * 1.5));
        elseif player:HasTrait("WeakStomach") and player:HasTrait("Resilient") then
            player:getBodyDamage():setFoodSicknessLevel(currentFoodPoison + (poison * 1.1));
        elseif player:HasTrait("ProneToIllness") then
            player:getBodyDamage():setFoodSicknessLevel(currentFoodPoison + (poison * 1.2));
        elseif player:HasTrait("ProneToIllness") and player:HasTrait("IronGut") then
            player:getBodyDamage():setFoodSicknessLevel(currentFoodPoison + (poison * 0.9));
        elseif player:HasTrait("IronGut") then
            player:getBodyDamage():setFoodSicknessLevel(currentFoodPoison + (poison * 0.7));
        elseif player:HasTrait("IronGut") and player:HasTrait("Resilient") then
            player:getBodyDamage():setFoodSicknessLevel(currentFoodPoison + (poison * 0.5));
        elseif player:HasTrait("Resilient") then
            player:getBodyDamage():setFoodSicknessLevel(currentFoodPoison + (poison * 0.8));
        else
            player:getBodyDamage():setFoodSicknessLevel(currentFoodPoison + poison);
        end
        if player:getBodyDamage():getFoodSicknessLevel() > 99 then
            player:getBodyDamage():setFoodSicknessLevel(99);
        end
    end
end

function DTincreaseStress(player, stress)
    local currentStress = player:getStats():getStress();
    player:getStats():setStress(currentStress + stress);
    if player:getStats():getStress() > 0.99 then
        player:getStats():setStress(0.99);
    end
end

function DTdecreaseStress(player, stress)
    local currentStress = player:getStats():getStress();
    player:getStats():setStress(currentStress - stress);
    if player:getStats():getStress() < 0 then
        player:getStats():setStress(0);
    end
end

function DTdecreaseStressFromCigarettes(player, stress)
    local currentStressByCigarettes = player:getStats():getStressFromCigarettes();
    player:getStats():setStressFromCigarettes(currentStressByCigarettes - stress);
    if player:getStats():getStressFromCigarettes() < 0 then
        player:getStats():setStressFromCigarettes(0);
    end
end

function DTincreaseUnhappyness(player, unhappyness)
    local currentUnhappyness = player:getBodyDamage():getUnhappynessLevel();
    player:getBodyDamage():setUnhappynessLevel(currentUnhappyness + unhappyness);
    if player:getBodyDamage():getUnhappynessLevel() > 99 then
        player:getBodyDamage():setUnhappynessLevel(99);
    end
end

function DTdecreaseUnhappyness(player, unhappyness)
    local currentUnhappyness = player:getBodyDamage():getUnhappynessLevel();
    player:getBodyDamage():setUnhappynessLevel(currentUnhappyness - unhappyness);
    if player:getBodyDamage():getUnhappynessLevel() < 0 then
        player:getBodyDamage():setUnhappynessLevel(0);
    end
end

function DTincreaseBoredom(player, boredom)
    local currentBoredom = player:getBodyDamage():getBoredomLevel();
    player:getBodyDamage():setBoredomLevel(currentBoredom + 15);
    if player:getBodyDamage():getBoredomLevel() > 99 then
        player:getBodyDamage():setBoredomLevel(99);
    end
end

function DTdecreaseBoredom(player, boredom)
    local currentBoredom = player:getBodyDamage():getBoredomLevel();
    player:getBodyDamage():setBoredomLevel(currentBoredom - 5);
    if player:getBodyDamage():getBoredomLevel() < 0 then
        player:getBodyDamage():setBoredomLevel(0);
    end
end

function DTincreaseFatigue(player, chance, fatigue)
    if chance == 0 then
        local currentFatigue = player:getStats():getFatigue();
        player:getStats():setFatigue(currentFatigue + fatigue);
        if player:getStats():getFatigue() > 0.99 then
            player:getStats():setFatigue(0.99);
        end
    end
end

function DTdecreaseEndurance(player, chance, endurance)
    if chance == 0 then
        local currentEndurance = player:getStats():getEndurance();
        player:getStats():setEndurance(currentEndurance - endurance);
        if player:getStats():getEndurance() < 0 then
            player:getStats():setEndurance(0);
        end
    end
end

function DTluckyUnluckyModifier(player, randomRange)
    if player:HasTrait("Lucky") then
        return ZombRand(randomRange)
    elseif player:HasTrait("Unlucky") then
        return (ZombRand(randomRange) * -1)
    else
        return 0
    end
end

function DTapplyPain(player, chance, bodyPart, pain)
    if chance == 0 then
        local bodyPartAux = BodyPartType.FromString(bodyPart);
        local playerBodyPart = player:getBodyDamage():getBodyPart(bodyPartAux);
        local currentPain = playerBodyPart:getPain();
        playerBodyPart:setAdditionalPain(currentPain + pain);
        if playerBodyPart:getPain() > 99 then
            playerBodyPart:setAdditionalPain(99);
        end
    end
end

function DTrandomNumberForKills(player, range)
    local randNum = ZombRand(range - player:getZombieKills() - player:getHoursSurvived() + (DTluckyUnluckyModifier(player, (range / 10)) * -1));
    if randNum < 0 then
        randNum = 0;
    end
    return randNum;
end

function DTincreaseWetness(player, wetness)
    local currentWetness = player:getBodyDamage():getWetness();
    player:getBodyDamage():setWetness(currentWetness + wetness);
    if player:getBodyDamage():getWetness() > 99 then
        player:getBodyDamage():setWetness(99);
    end
end