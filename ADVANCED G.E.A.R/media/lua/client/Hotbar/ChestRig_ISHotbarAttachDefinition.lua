require "Hotbar/ISHotbarAttachDefinition"
if not ISHotbarAttachDefinition then
    return
end

local ChestRig = {
	type = "ChestRig",
	name = "Chest Rig Left",
	animset = "belt left",
	attachments = {
		Mag = "Chest Rig Mag Left",
		Holster = "Chest Rig",
		Knife = "Chest Rig Knife",
		Gear = "Chest Rig Gear",
		ChestLight = "Chest Light",
		Walkie = "Chest Rig Walkie",
		Bottle = "Chest Rig Bottle",
		Screwdriver  = "Chest Rig Walkie",
	},
}
table.insert(ISHotbarAttachDefinition, ChestRig);

local ChestRigRight = {
	type = "ChestRigRight",
	name = "Chest Rig Right",
	animset = "belt right",
	attachments = {	
		Mag = "Chest Rig Mag Right",
		ChestLight = "Chest Light Right",
		Walkie = "Chest Rig Walkie Right",
		Bottle = "Chest Rig Bottle Right",
		Screwdriver  = "Chest Rig Walkie Right",
	},
}
table.insert(ISHotbarAttachDefinition, ChestRigRight);