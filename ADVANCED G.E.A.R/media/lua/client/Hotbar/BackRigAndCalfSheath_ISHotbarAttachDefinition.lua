require "Hotbar/ISHotbarAttachDefinition"
if not ISHotbarAttachDefinition then
    return
end

local CalfSheath = {
	type = "CalfSheath",
	name = "Calf Sheath",
	animset = "belt right",
	attachments = {
		Knife = "Calf Sheath",
		Screwdriver  = "Calf Sheath",
	},
}
table.insert(ISHotbarAttachDefinition, CalfSheath);

local Back2 = {
	type = "Back2",
	name = "Back",
	animset = "back",
	attachments = {
		SawnOff = "Rifle On Back2",
		BigBlade = "Blade On Back2",
	},
}
table.insert(ISHotbarAttachDefinition, Back2);