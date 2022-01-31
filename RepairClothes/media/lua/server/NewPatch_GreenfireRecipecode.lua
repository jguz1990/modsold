function OnSmoke_Cannabis2(food, character)
	if character:HasTrait("Smoker") then
		character:getBodyDamage():setUnhappynessLevel(character:getBodyDamage():getUnhappynessLevel() - 5);
		if character:getBodyDamage():getUnhappynessLevel() < 0 then
			character:getBodyDamage():setUnhappynessLevel(0);
		end
		character:getStats():setStress(character:getStats():getStress() - 5);
		if character:getStats():getStress() < 0 then
			character:getStats():setStress(0);
		end
		character:getStats():setStressFromCigarettes(0);
		character:setTimeSinceLastSmoke(0);
	end
	if character:getStats():getFatigue() >= 0.8 and character:getStats():getFatigue() < 1 then
		character:getStats():setFatigue(character:getStats():getFatigue() + 0.0125);
	end
	if character:getStats():getFatigue() >= 0.6 and character:getStats():getFatigue() < 0.8 then
		character:getStats():setFatigue(character:getStats():getFatigue() + 0.025);
	end
	if character:getStats():getFatigue() < 0.6 then
		character:getStats():setFatigue(0.3);
	end
	if character:getStats():getHunger() < 0.4 then
		character:getStats():setHunger(character:getStats():getHunger() + 0.05);
	end
	if character:getStats():getThirst() < 0.4 then
		character:getStats():setThirst(character:getStats():getThirst() + 0.05);
	end
	character:getBodyDamage():setFoodSicknessLevel(character:getBodyDamage():getFoodSicknessLevel() - 7);
	if character:getBodyDamage():getFoodSicknessLevel() < 0 then
		character:getBodyDamage():setFoodSicknessLevel(0);
	end
end

function OnEat_Spliff2(food, character)
    if character:HasTrait("Smoker") then
        character:getBodyDamage():setUnhappynessLevel(character:getBodyDamage():getUnhappynessLevel() - 5);
        if character:getBodyDamage():getUnhappynessLevel() < 0 then
            character:getBodyDamage():setUnhappynessLevel(0);
        end
        character:getStats():setStress(character:getStats():getStress() - 5);
        if character:getStats():getStress() < 0 then
            character:getStats():setStress(0);
        end
        character:getStats():setStressFromCigarettes(0);
        character:setTimeSinceLastSmoke(0);
    end
    if character:getStats():getThirst() < 0.4 then
        character:getStats():setThirst(character:getStats():getThirst() + 0.025);
    end
end
function OnEat_ButtSmoke(food, character)
    if character:HasTrait("Smoker") then
        character:getBodyDamage():setUnhappynessLevel(character:getBodyDamage():getUnhappynessLevel() - 5);
        if character:getBodyDamage():getUnhappynessLevel() < 0 then
            character:getBodyDamage():setUnhappynessLevel(0);
        end
        character:getStats():setStress(character:getStats():getStress() - 5);
        if character:getStats():getStress() then
            character:getStats():setStress(0);
        end
        character:getStats():setStressFromCigarettes(0);
        character:setTimeSinceLastSmoke(0);
        character:getBodyDamage():setFoodSicknessLevel(character:getBodyDamage():getFoodSicknessLevel() + 14);
        if character:getBodyDamage():getFoodSicknessLevel() > 100 then
            character:getBodyDamage():setFoodSicknessLevel(100);
        end       character:getBodyDamage():setUnhappynessLevel(character:getBodyDamage():getUnhappynessLevel() + 5);
       if character:getBodyDamage():getUnhappynessLevel() > 100 then
           character:getBodyDamage():setUnhappynessLevel(100);
       end
    else
       character:getBodyDamage():setUnhappynessLevel(character:getBodyDamage():getUnhappynessLevel() + 5);
       if character:getBodyDamage():getUnhappynessLevel() > 100 then
           character:getBodyDamage():setUnhappynessLevel(100);
       end
        character:getBodyDamage():setFoodSicknessLevel(character:getBodyDamage():getFoodSicknessLevel() + 14);
        if character:getBodyDamage():getFoodSicknessLevel() > 100 then
            character:getBodyDamage():setFoodSicknessLevel(100);
        end
    end
end