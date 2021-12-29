require "Hotbar/ISHotbarAttachDefinition"
if not ISHotbarAttachDefinition then
    return
end

local CCVest = {
	type = "CCVest",
	name = "Concealed Carry Holster",
	animset = "belt left",
	attachments = {
		Holster  = "Concealed Carry Holster",
	},
}
table.insert(ISHotbarAttachDefinition, CCVest);
