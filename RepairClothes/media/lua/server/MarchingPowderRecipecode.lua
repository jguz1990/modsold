function DoBump(items, result, character)
	-- character:getStats():setHunger(character:getStats():getHunger() - 1.25)
	-- character:getStats():setThirst(character:getStats():getThirst() - 1.25)
	character:getBodyDamage():setBoredomLevel(character:getBodyDamage():getBoredomLevel() - 5);
	character:getBodyDamage():setUnhappynessLevel(character:getBodyDamage():getUnhappynessLevel() - 5);
	character:getStats():setFatigue(character:getStats():getFatigue() - 4)
	character:getStats():setEndurance(character:getStats():getEndurance() + 4)
	character:getStats():setStress(character:getStats():getStress() + 1)
end

function DoKeyBump(items, result, character)
	-- character:getStats():setHunger(character:getStats():getHunger() - 2.5)
	-- character:getStats():setThirst(character:getStats():getThirst() - 2.5)
	character:getBodyDamage():setBoredomLevel(character:getBodyDamage():getBoredomLevel() - 10);
	character:getBodyDamage():setUnhappynessLevel(character:getBodyDamage():getUnhappynessLevel() - 10);
	character:getStats():setFatigue(character:getStats():getFatigue() - 8)
	character:getStats():setEndurance(character:getStats():getEndurance() + 8)
	character:getStats():setStress(character:getStats():getStress() + 2)
end
function DoLine(food, character)
	-- character:getBodyDamage():setBoredomLevel(character:getBodyDamage():getBoredomLevel() - 4);
	-- character:getStats():setStress(character:getStats():getStress() + 4)
end

local item = ScriptManager.instance:getItem("Base.Mirror")	
if item then 
	item:DoParam("StaticModel = Mirror")
end
local item = ScriptManager.instance:getItem("Base.CreditCard")	
if item then 
	item:DoParam("StaticModel = CreditCard")
end
function CokeBrick_OnCreate(items, result, player)
	player:getInventory():AddItem("Base.pa_CokeBrick2")
end