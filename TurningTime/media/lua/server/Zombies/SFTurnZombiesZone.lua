require 'NPCs/ZombiesZoneDefinition'

-- set up population values based on their sandbox settings

Events.OnLoadedTileDefinitions.Add(function()

	local rare = 0.5; -- rarity multipliers
	local high = 2;
	local insane = 5;

	local bansheePop = 20; -- standard population value

	if SandboxVars.SFTurn.RarityBanshee == 2 then
		bansheePop = 20 * rare
		table.insert(ZombiesZoneDefinition.Default,{name = "Banshee", chance=bansheePop, gender="female", room="bathroom;bedroom;closet;kitchen;livingroom"});
	elseif SandboxVars.SFTurn.RarityBanshee == 3 then
		table.insert(ZombiesZoneDefinition.Default,{name = "Banshee", chance=bansheePop, gender="female", room="bathroom;bedroom;closet;kitchen;livingroom"});
	elseif SandboxVars.SFTurn.RarityBanshee == 4 then
		bansheePop = 20 * high
		table.insert(ZombiesZoneDefinition.Default,{name = "Banshee", chance=bansheePop, gender="female", room="bathroom;bedroom;closet;kitchen;livingroom"});
	elseif SandboxVars.SFTurn.RarityBanshee == 5 then
		bansheePop = 20 * insane
		table.insert(ZombiesZoneDefinition.Default,{name = "Banshee", chance=bansheePop, gender="female", room="bathroom;bedroom;closet;kitchen;livingroom"});
	end

	local nemesisPop = 1;

	if SandboxVars.SFTurn.RarityNemesis == 2 then
		nemesisPop = rare
		table.insert(ZombiesZoneDefinition.Default,{name = "Nemesis", chance=nemesisPop, gender="male"});
	elseif SandboxVars.SFTurn.RarityNemesis == 3 then
		table.insert(ZombiesZoneDefinition.Default,{name = "Nemesis", chance=nemesisPop, gender="male"});
	elseif SandboxVars.SFTurn.RarityNemesis == 4 then
		nemesisPop = high
		table.insert(ZombiesZoneDefinition.Default,{name = "Nemesis", chance=nemesisPop, gender="male"});
	elseif SandboxVars.SFTurn.RarityNemesis == 5 then
		nemesisPop = 10
		table.insert(ZombiesZoneDefinition.Default,{name = "Nemesis", chance=nemesisPop, gender="male"});
	end

end)