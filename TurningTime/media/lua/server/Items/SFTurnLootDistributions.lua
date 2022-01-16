require 'Items/SuburbsDistributions'

	local Banshee = {
            rolls = 1,
            items = {
		"Doll", 6,
		"ToyBear", 6,
                "Spiffo", 0.1,
            }
        }

	local Nemesis = {
            rolls = 0,
            items = {
            }
        }

SuburbsDistributions["all"].Outfit_Banshee = Banshee;
SuburbsDistributions["all"].Outfit_Nemesis = Nemesis;