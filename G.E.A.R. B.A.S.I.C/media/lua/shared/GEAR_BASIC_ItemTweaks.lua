





TweakItem("Base.Bullets9mmBox", "StaticModel",  "pouch");
TweakItem("Base.Bullets9mmBox", "AttachmentType",  "Gear");

-- TweakItem("Base.9mmClip", "StaticModel",  "GunMagazine");
TweakItem("Base.9mmClip", "AttachmentType",  "Mag");

TweakItem("Base.Bullets45Box", "StaticModel",  "pouch");
TweakItem("Base.Bullets45Box", "AttachmentType",  "Gear");

-- TweakItem("Base.45Clip", "StaticModel",  "GunMagazine");
TweakItem("Base.45Clip", "AttachmentType",  "Mag");

TweakItem("Base.Bullets44Box", "StaticModel",  "pouch");
TweakItem("Base.Bullets44Box", "AttachmentType",  "Gear");

-- TweakItem("Base.44Clip", "StaticModel",  "GunMagazine");
TweakItem("Base.44Clip", "AttachmentType",  "Mag");

TweakItem("Base.Bullets38Box", "StaticModel",  "pouch");
TweakItem("Base.Bullets38Box", "AttachmentType",  "Gear");

TweakItem("Base.ShotgunShellsBox", "StaticModel",  "pouch");
TweakItem("Base.ShotgunShellsBox", "AttachmentType",  "Gear");

TweakItem("Base.223Box", "StaticModel",  "pouch");
TweakItem("Base.223Box", "AttachmentType",  "Gear");

-- TweakItem("Base.223Clip", "StaticModel",  "GunMagazine");
TweakItem("Base.223Clip", "AttachmentType",  "Mag");

TweakItem("Base.308Box", "StaticModel",  "pouch");
TweakItem("Base.308Box", "AttachmentType",  "Gear");

-- TweakItem("Base.308Clip", "StaticModel",  "GunMagazine");
TweakItem("Base.308Clip", "AttachmentType",  "Mag");

TweakItem("Base.556Box", "StaticModel",  "pouch");
TweakItem("Base.556Box", "AttachmentType",  "Gear");

-- TweakItem("Base.556Clip", "StaticModel",  "GunMagazine");
TweakItem("Base.556Clip", "AttachmentType",  "Mag");

TweakItem("Base.WaterBottleFull", "AttachmentType",  "Bottle");

TweakItem("Base.Pop", "AttachmentType",  "Bottle");

TweakItem("Base.Pop2", "AttachmentType",  "Bottle");

TweakItem("Base.Pop3", "AttachmentType",  "Bottle");

TweakItem("Base.PopBottle", "AttachmentType",  "Bottle");

TweakItem("Base.WaterPopBottle", "AttachmentType",  "Bottle");

TweakItem("Base.WhiskeyFull", "AttachmentType",  "Bottle");

TweakItem("Base.WaterBottleEmpty", "AttachmentType",  "Bottle");

TweakItem("Base.PopBottleEmpty", "AttachmentType",  "Bottle");

TweakItem("Base.WhiskeyEmpty", "AttachmentType",  "Bottle");

TweakItem("Base.Hat_GasMask", "AttachmentType",  "Gear");
TweakItem("Base.Hat_GasMask", "StaticModel",  "GasMask");

-- TweakItem("Base.HandTorch", "AttachmentType",  "Bottle");

TweakItem("Base.Saw", "primaryAnimMask",  "HoldingTorchRight");
TweakItem("Base.Saw", "secondaryAnimMask",  "HoldingTorchLeft");
TweakItem("Base.Saw", "StaticModel",  "HackSaw");
TweakItem("Base.Saw", "AttachmentType",  "Saw");

TweakItem("Base.BlowTorch", "primaryAnimMask",  "HoldingTorchRight");
TweakItem("Base.BlowTorch", "secondaryAnimMask",  "HoldingTorchLeft");
TweakItem("Base.BlowTorch", "AttachmentType",  "Tool");

TweakItem("Base.Bandaid", "StaticModel",  "pouchmed");
TweakItem("Base.Bandaid", "AttachmentType",  "Gear");

TweakItem("Base.Bandage", "StaticModel",  "pouchmed");
TweakItem("Base.Bandage", "AttachmentType",  "Gear");

TweakItem("Base.AlcoholBandage", "StaticModel",  "pouchmed");
TweakItem("Base.AlcoholBandage", "AttachmentType",  "Gear");

TweakItem("Base.SutureNeedle", "StaticModel",  "pouchmed");
TweakItem("Base.SutureNeedle", "AttachmentType",  "Gear");


TweakItem("Base.PetrolCan", "AttachmentType",  "Gas");
TweakItem("Base.EmptyPetrolCan", "AttachmentType",  "Gas");




local item = ScriptManager.instance:getItem("Base.MakeUp_GreenCamo")
if item then 
item:DoParam("OBSOLETE = true")
end

local item = ScriptManager.instance:getItem("Base.MakeUp_GreenCamo2")
if item then 
item:DoParam("OBSOLETE = true")
end