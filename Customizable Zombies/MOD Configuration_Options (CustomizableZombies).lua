-- Persistent Data (for CustomizableZombies)
local multiRefObjects = {

} -- multiRefObjects
local obj1 = {
	["FakeDead"] = {
		["ChanceToSpawn"] = 0;
		["HPMultiplier"] = 1000;
	};
	["Crawler"] = {
		["ChanceToSpawn"] = 50;
		["HPMultiplier"] = 1000;
	};
	["Shambler"] = {
		["ChanceToSpawn"] = 350;
		["HPMultiplier"] = 1000;
	};
	["FastShambler"] = {
		["ChanceToSpawn"] = 500;
		["HPMultiplier"] = 1000;
	};
	["Runner"] = {
		["ChanceToSpawn"] = 100;
		["HPMultiplier"] = 1000;
	};
	["Preset"] = {
		["PresetNum"] = 1;
	};
	["Version"] = "2.3.0";
}
return obj1
