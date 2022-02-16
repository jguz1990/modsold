
local item = ScriptManager.instance:getItem("Base.Bandaid")	
if item then 
	item:DoParam("ReplaceOnUse    =   BandaidDirty")
end