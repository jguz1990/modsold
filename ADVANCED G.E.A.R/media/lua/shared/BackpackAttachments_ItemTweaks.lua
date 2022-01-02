if  getActivatedMods():contains("ItemTweakerAPI")  then
require("ItemTweaker_Core");
else  return  end

TweakItem("Base.PetrolCan", "AttachmentType", "Gas");
TweakItem("Base.EmptyPetrolCan", "AttachmentType", "Gas");
