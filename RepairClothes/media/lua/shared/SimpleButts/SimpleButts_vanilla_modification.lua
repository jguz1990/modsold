local item = ScriptManager.instance:getItem("Base.Cigarettes")	
if item then 
	item:DoParam("ReplaceOnUse    =   SimpleButt")
end


local item = ScriptManager.instance:getItem("Base.Lighter")	
if item then 
	item:DoParam("ReplaceOnUse    =   UsedLighter")
end