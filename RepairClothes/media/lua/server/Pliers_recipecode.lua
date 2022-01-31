require "recipecode"

function Recipe.GetItemTypes.Pliers(scriptItems)
	scriptItems:addAll(getScriptManager():getItemsTag("Pliers"))
end