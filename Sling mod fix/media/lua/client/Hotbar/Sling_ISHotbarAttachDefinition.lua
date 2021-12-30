require "Hotbar/ISHotbarAttachDefinition"
if not ISHotbarAttachDefinition then
    return
end

local Sling = {
	type = "Sling",
	name = "Sling",
	animset = "belt left",
	attachments = {
		SawnOff = "Slinged Rifle",
		Rifle = "Slinged Rifle",
	},
}
table.insert(ISHotbarAttachDefinition, Sling);

local SlingAlt = {
	type = "SlingAlt",
	name = "Sling",
	animset = "belt left",
	attachments = {
		SawnOff = "Slinged Rifle2",
		Rifle = "Slinged Rifle2",
	},
}
table.insert(ISHotbarAttachDefinition, SlingAlt);

local SlingAlt2 = {
	type = "SlingAlt2",
	name = "Sling",
	animset = "belt left",
	attachments = {
		SawnOff = "Slinged Rifle3",
		Rifle = "Slinged Rifle3",
	},
}
table.insert(ISHotbarAttachDefinition, SlingAlt2);

local SlingAlt3 = {
	type = "SlingAlt3",
	name = "Sling",
	animset = "belt right",
	attachments = {
		SawnOff = "Slinged Rifle4",
		Rifle = "Slinged Rifle4",
	},
}
table.insert(ISHotbarAttachDefinition, SlingAlt3);

table.remove(ISHotbarAttachDefinition.replacements);
local BackReplacement = {
	type = "Bag",
	name = "Back",
	animset = "back",
	replacement = {
		--BigWeapon = "Big Weapon On Back",
		--BigBlade = "Blade On Back",
		Racket = "Racket Back with Bag",
		Shovel = "Shovel Back with Bag",
		Guitar = "null",
		GuitarAcoustic = "null",
		Pan = "Pan On Back with Bag";
		--Rifle = "Rifle On Back with Bag",
		Saucepan = "Saucepan Back with Bag",
	}
}
table.insert(ISHotbarAttachDefinition.replacements, BackReplacement);