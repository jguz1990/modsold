function Recipe.OnCreate.Bullbar2Blueprint(items, result, player)
	-- print(player:getKnownRecipes():contains("Make ATABusRoofBoxItem"))
    if not player:getKnownRecipes():contains("Make ATABusKengur2Item") then
		player:getInventory():AddItems("Autotsar.Bullbar2Blueprint", 1);
	end
end

function Recipe.OnCreate.Bullbar3Blueprint(items, result, player)
	if player:getKnownRecipes():contains("Make ATABusKengur2Item") and 
			not player:getKnownRecipes():contains("Make ATABusKengur3Item") then
		player:getInventory():AddItems("Autotsar.Bullbar3Blueprint", 1);
	end
end