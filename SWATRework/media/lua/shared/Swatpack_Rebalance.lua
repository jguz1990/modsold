local item = ScriptManager.instance:getItem("Base.Hat_SwatGasMask")	
if item then 
	item:DoParam("Insulation = 0.75")
	item:DoParam("WindResistance = 0.60")
	item:DoParam("WaterResistance = 1.0")
	item:DoParam("BiteDefense = 50")
	item:DoParam("ScratchDefense = 60")
end

local item = ScriptManager.instance:getItem("Base.Hat_GasMask")	
if item then 
	item:DoParam("BiteDefense = 25")
	item:DoParam("ScratchDefense = 30")
end

local item = ScriptManager.instance:getItem("Base.Trousers_Swat")	
if item then 
	item:DoParam("BiteDefense = 10")
	item:DoParam("ScratchDefense = 20")
	item:DoParam("RunSpeedModifier = 1")
	item:DoParam("Insulation = 0.60")
	item:DoParam("WindResistance = 0.30")
	item:DoParam("WaterResistance = 0.35")
end
local item = ScriptManager.instance:getItem("Base.Gloves_SwatGloves")	
if item then 
	item:DoParam("ScratchDefense = 30")
	item:DoParam("BiteDefense = 15")
	item:DoParam("Insulation = 0.25")
	item:DoParam("WindResistance = 0.3")
end
local item = ScriptManager.instance:getItem("Base.Hat_SwatHelmet")	
if item then 
	item:DoParam("Insulation = 0.25")
	item:DoParam("WaterResistance = 0.2")
end
local item = ScriptManager.instance:getItem("Base.Vest_BulletSwat")	
if item then 
	item:DoParam("WorldStaticModel = BulletVest_Ground")
end
local item = ScriptManager.instance:getItem("Base.Jacket_Swat")	
if item then 
	item:DoParam("BiteDefense = 30")
	item:DoParam("ScratchDefense = 50")
	item:DoParam("Insulation = 0.6")
	item:DoParam("WindResistance = 0.45")
	item:DoParam("NeckProtectionModifier = 0.5")
end
local item = ScriptManager.instance:getItem("Base.Glasses_SwatGoggles")	
if item then 
	item:DoParam("BiteDefense = 10")
	item:DoParam("ScratchDefense = 10")
end	
local item = ScriptManager.instance:getItem("Base.Hat_Balaclava_Swat")	
if item then 
	item:DoParam("WaterResistance = 0.5")
end	






