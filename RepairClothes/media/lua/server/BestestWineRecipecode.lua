require "recipecode"


function Recipe.GetItemTypes.Corkscrew(scriptItems)
	scriptItems:addAll(getScriptManager():getItemsTag("Corkscrew"))
end


function OnCreate_CorkPop(items, result, player)
	player:playSound("Corkpop")
end