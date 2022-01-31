
function PerformInfectionCheck(player)
	if player:getBodyDamage():IsInfected() then
		player:getInventory():AddItem("Base.token_Infected");
	else
		player:getInventory():AddItem("Base.token_Uninfected");
	end
end
Events.OnPlayerDeath.Add(PerformInfectionCheck);

function ZombieToken(zombie)
	zombie:getInventory():AddItem("Base.token_Infected");
end
Events.OnZombieDead.Add(ZombieToken)