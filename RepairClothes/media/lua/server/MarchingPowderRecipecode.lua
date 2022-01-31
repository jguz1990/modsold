function DoBump(items, result, character)
	character:getStats():setHunger(character:getStats():getHunger() - 1.25)
	character:getStats():setThirst(character:getStats():getThirst() - 1.25)
	character:getBodyDamage():setUnhappynessLevel(character:getBodyDamage():getUnhappynessLevel() - 1);
	character:getStats():setFatigue(character:getStats():getFatigue() - 2)
	character:getStats():setEndurance(character:getStats():getEndurance() + 2)
	character:getStats():setStress(character:getStats():getStress() + 2)
end

function DoKeyBump(items, result, character)
	character:getStats():setHunger(character:getStats():getHunger() - 2.5)
	character:getStats():setThirst(character:getStats():getThirst() - 2.5)
	character:getBodyDamage():setUnhappynessLevel(character:getBodyDamage():getUnhappynessLevel() - 2);
	character:getStats():setFatigue(character:getStats():getFatigue() - 4)
	character:getStats():setEndurance(character:getStats():getEndurance() + 4)
	character:getStats():setStress(character:getStats():getStress() + 4)
end