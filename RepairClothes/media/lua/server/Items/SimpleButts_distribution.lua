require "Items/Distributions"
require "Items/ProceduralDistributions"
require "Vehicles/VehicleDistributions"

table.insert(SuburbsDistributions.all.bin.items, "SimpleButt")
table.insert(SuburbsDistributions.all.bin.items, 10)
table.insert(SuburbsDistributions.all.bin.items, "UsedLighter")
table.insert(SuburbsDistributions.all.bin.items, 4)

table.insert(VehicleDistributions.DriverSeat.items, "SimpleButt")
table.insert(VehicleDistributions.DriverSeat.items, 1)
table.insert(VehicleDistributions.Seat.items, "SimpleButt")
table.insert(VehicleDistributions.Seat.items, 1)
table.insert(VehicleDistributions.GloveBox.items, "SimpleButt")
table.insert(VehicleDistributions.GloveBox.items, 1)

table.insert(VehicleDistributions.Seat.items, "UsedLighter")
table.insert(VehicleDistributions.Seat.items, 1)
table.insert(VehicleDistributions.GloveBox.items, "UsedLighter")
table.insert(VehicleDistributions.GloveBox.items, 1)