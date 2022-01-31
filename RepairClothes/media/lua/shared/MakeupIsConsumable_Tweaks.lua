local item = ScriptManager.instance:getItem("Base.Lipstick")	
if item then 
	item:DoParam("Type	=	Drainable")
	item:DoParam("UseDelta	=	0.1")
	item:DoParam("ReplaceOnUse    =   Lipstick_Used")
end

local item = ScriptManager.instance:getItem("Base.MakeupEyeshadow")	
if item then 
	item:DoParam("Type	=	Drainable")
	item:DoParam("UseDelta	=	0.1")
	item:DoParam("ReplaceOnUse    =   MakeupEyeshadow_Used")
end

local item = ScriptManager.instance:getItem("Base.MakeupFoundation")	
if item then 
	item:DoParam("Type	=	Drainable")
	item:DoParam("UseDelta	=	0.1")
	item:DoParam("ReplaceOnUse    =   MakeupFoundation_Used")
end