require 'Definitions/HairOutfitDefinitions'

-- define possible haircut based on outfit
-- if nothing is defined for a outfit, we just pick a random one
-- the haircuts in ZombiesZoneDefinitions take precedence over this!
-- this is used mainly for stories, so when i spawn a punk, i want more chance to have a mohawk on him..

HairOutfitDefinitions.haircutOutfitDefinition = {};
local cat = {};
cat.outfit = "Banshee";
cat.haircut = "Long2:100;";
table.insert(HairOutfitDefinitions.haircutOutfitDefinition, cat);