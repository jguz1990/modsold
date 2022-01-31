function Accept_Bullets(container, item)
	--print("TEST")
	--print(tostring(item:getDisplayCategory()))
	--print(tostring(item:getDisplayName():contains("Round") or item:getCategory()=="Ammo") and not (item:getDisplayName():contains("Rounds")) and not item:getDisplayName():contains("Shotgun"))
	--return ( (item:getDisplayName():contains("Round") or item:getCategory()=="Ammo") and not (item:getDisplayName():contains("Rounds")) and not item:getDisplayName():contains("Shotgun") )
	return  item:getDisplayCategory()=="Ammo" and not item:getDisplayName():contains("Shotgun")
end 

function Accept_Shells(container, item)
	--print("TEST")
	--print(item:getType() == "ShotgunShells")
	return item:getType() == "ShotgunShells"
end

local item = ScriptManager.instance:getItem("Base.AmmoStrap_Bullets")	
if item then 
	item:DoParam("Type = Container")
	item:DoParam("WeightReduction	=	100")
	item:DoParam("Capacity	=	1")
	item:DoParam("BodyLocation = AmmoStrap")
	item:DoParam("CanBeEquipped = AmmoStrap")
	item:DoParam("AcceptItemFunction = Accept_Bullets")
	item:DoParam("ClothingItemExtra = BulletBandolier")
	item:DoParam("ClothingItemExtraOption = ChangeSide")
	item:DoParam("ClothingExtraSubmenu =  Wear_AmmoStrap")
	item:DoParam("WorldStaticModel = AmmoStrap_Ground")
end
local item = ScriptManager.instance:getItem("Base.AmmoStrap_Shells")	
if item then 
	item:DoParam("Type = Container")
	item:DoParam("WeightReduction	=	100")
	item:DoParam("Capacity	=	1")
	item:DoParam("BodyLocation = AmmoStrap")
	item:DoParam("CanBeEquipped = AmmoStrap")
	item:DoParam("AcceptItemFunction = Accept_Shells")
	item:DoParam("ClothingItemExtra = ShotgunShellBandolier")
	item:DoParam("ClothingItemExtraOption = ChangeSide")
	item:DoParam("ClothingExtraSubmenu =  Wear_AmmoStrap")
	item:DoParam("WorldStaticModel = AmmoStrap_Ground")
end