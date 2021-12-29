require "Vehicles/VehicleDistributions"
require "Vehicles/FRvehicledistributions"

if VehicleDistributions.Military then
	-- local distributionTable = VehicleDistributions[1]
	VehicleDistributions.MilitaryGloveBox = VehicleDistributions.MilitaryGloveBox or {
		rolls = 1,
		items = {
			"Cigarettes", 7,
			"HandTorch", 5,
			"Battery", 7,
			"BeefJerky", 7,
			"Pills", 5,
			"AlcoholWipes", 7,
			"Bandage", 5,
			"Radio.WalkieTalkie5", 5,
			"Pistol", 0.25,
			"Pistol2", 0.25,
			"HuntingKnife", 0.25,
			"Glasses_Sun", 0.25,
			"Glasses_Aviators", 0.1,
			"Gloves_LeatherGlovesBlack", 0.1,
			"Gloves_LeatherGloves", 0.25,
			"MuldraughMap", 5,
			"WestpointMap", 5,
			"MarchRidgeMap", 5,
			"RosewoodMap", 5,
			"RiversideMap", 5,
		},
		junk = {
			rolls = 1,
			items = {
				"Notebook", 10,
				"Magazine", 7,
				"Newspaper", 7,
				"Pen", 5,
				"BluePen", 5,
				"RedPen", 5,
				"Pencil", 5,
				"Eraser", 5,
				"RubberBand", 5,
				"Lighter", 5,
				"Matches", 7,
				"Paperclip", 5,
				"ToiletPaper", 3,
				"Cockroach", 1,
			}
		}
	}

	table.insert(VehicleDistributions.MilitaryGloveBox.items, "HolsterPLL2M")
	table.insert(VehicleDistributions.MilitaryGloveBox.items, 1)
	-- table.insert(VehicleDistributions.MilitaryGloveBox.items, "BeltRig")
	-- table.insert(VehicleDistributions.MilitaryGloveBox.items, 0.1)

	table.insert(VehicleDistributions.MilitaryGearTrunk.items, "Hat_Altyn")
	table.insert(VehicleDistributions.MilitaryGearTrunk.items, 0.1)
	-- table.insert(VehicleDistributions.MilitaryGearTrunk.items, "WetSuit")
	-- table.insert(VehicleDistributions.MilitaryGearTrunk.items, 0.5)	
	-- table.insert(VehicleDistributions.MilitaryGearTrunk.items, "Shoes_Rogue")
	-- table.insert(VehicleDistributions.MilitaryGearTrunk.items, 0.5)
	-- table.insert(VehicleDistributions.MilitaryGearTrunk.items, "Gloves_Rogue")
	-- table.insert(VehicleDistributions.MilitaryGearTrunk.items, 0.5)
	-- table.insert(VehicleDistributions.MilitaryGearTrunk.items, "RogueWaistBag_Military")
	-- table.insert(VehicleDistributions.MilitaryGearTrunk.items, 0.5)
	table.insert(VehicleDistributions.MilitaryGearTrunk.items, "Vest_RogueVest_Military")
	table.insert(VehicleDistributions.MilitaryGearTrunk.items, 0.5)
	table.insert(VehicleDistributions.MilitaryGearTrunk.items, "Vest_WitchyCarrier_Military")
	table.insert(VehicleDistributions.MilitaryGearTrunk.items, 0.6)	
	table.insert(VehicleDistributions.MilitaryGearTrunk.items, "RogueMask")
	table.insert(VehicleDistributions.MilitaryGearTrunk.items, 0.5)
	table.insert(VehicleDistributions.MilitaryGearTrunk.items, "strapchest_Military")
	table.insert(VehicleDistributions.MilitaryGearTrunk.items, 0.5)
	table.insert(VehicleDistributions.MilitaryGearTrunk.items, "MVest_Military")
	table.insert(VehicleDistributions.MilitaryGearTrunk.items, 0.5)
	table.insert(VehicleDistributions.MilitaryGearTrunk.items, "TacticalWaistBagBack_Military")
	table.insert(VehicleDistributions.MilitaryGearTrunk.items, 0.4)
	table.insert(VehicleDistributions.MilitaryGearTrunk.items, "TacticalWaistBagBackMed")
	table.insert(VehicleDistributions.MilitaryGearTrunk.items, 0.4)
	table.insert(VehicleDistributions.MilitaryGearTrunk.items, "HolsterPLL2M")
	table.insert(VehicleDistributions.MilitaryGearTrunk.items, 2)
	table.insert(VehicleDistributions.MilitaryGearTrunk.items, "medbag")
	table.insert(VehicleDistributions.MilitaryGearTrunk.items, 0.6)
	table.insert(VehicleDistributions.MilitaryGearTrunk.items, "medbag2")
	table.insert(VehicleDistributions.MilitaryGearTrunk.items, 0.6)
	table.insert(VehicleDistributions.MilitaryGearTrunk.items, "FlatCap")
	table.insert(VehicleDistributions.MilitaryGearTrunk.items, 1.5)
	-- table.insert(VehicleDistributions.MilitaryGearTrunk.items, "smallback")
	-- table.insert(VehicleDistributions.MilitaryGearTrunk.items, 0.8)
		
	table.insert(VehicleDistributions.MilitarySeat.items, "Hat_Altyn")
	table.insert(VehicleDistributions.MilitarySeat.items, 0.1)
	-- table.insert(VehicleDistributions.MilitarySeat.items, "WetSuit")
	-- table.insert(VehicleDistributions.MilitarySeat.items, 0.5)	
	-- table.insert(VehicleDistributions.MilitarySeat.items, "Shoes_Rogue")
	-- table.insert(VehicleDistributions.MilitarySeat.items, 0.5)
	-- table.insert(VehicleDistributions.MilitarySeat.items, "Gloves_Rogue")
	-- table.insert(VehicleDistributions.MilitarySeat.items, 0.5)
	-- table.insert(VehicleDistributions.MilitarySeat.items, "RogueWaistBag_Military")
	-- table.insert(VehicleDistributions.MilitarySeat.items, 0.5)
	table.insert(VehicleDistributions.MilitarySeat.items, "Vest_RogueVest_Military")
	table.insert(VehicleDistributions.MilitarySeat.items, 0.5)
	table.insert(VehicleDistributions.MilitarySeat.items, "Vest_WitchyCarrier_Military")
	table.insert(VehicleDistributions.MilitarySeat.items, 0.6)	
	table.insert(VehicleDistributions.MilitarySeat.items, "RogueMask")
	table.insert(VehicleDistributions.MilitarySeat.items, 0.5)
	table.insert(VehicleDistributions.MilitarySeat.items, "strapchest_Military")
	table.insert(VehicleDistributions.MilitarySeat.items, 0.5)
	table.insert(VehicleDistributions.MilitarySeat.items, "MVest")
	table.insert(VehicleDistributions.MilitarySeat.items, 0.5)
	table.insert(VehicleDistributions.MilitarySeat.items, "TacticalWaistBagBack_Military")
	table.insert(VehicleDistributions.MilitarySeat.items, 0.4)
	table.insert(VehicleDistributions.MilitarySeat.items, "TacticalWaistBagBackMed")
	table.insert(VehicleDistributions.MilitarySeat.items, 0.4)
	table.insert(VehicleDistributions.MilitarySeat.items, "HolsterPLL2M")
	table.insert(VehicleDistributions.MilitarySeat.items, 2)
	table.insert(VehicleDistributions.MilitarySeat.items, "medbag")
	table.insert(VehicleDistributions.MilitarySeat.items, 0.6)
	table.insert(VehicleDistributions.MilitarySeat.items, "medbag2")
	table.insert(VehicleDistributions.MilitarySeat.items, 0.6)
	table.insert(VehicleDistributions.MilitarySeat.items, "FlatCap")
	table.insert(VehicleDistributions.MilitarySeat.items, 1.5)
	-- table.insert(VehicleDistributions.MilitarySeat.items, "smallback")
	-- table.insert(VehicleDistributions.MilitarySeat.items, 0.8)
end