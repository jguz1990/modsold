require 'Items/SuburbsDistributions'
require "Items/ProceduralDistributions"
table.insert(ProceduralDistributions.list.BookstoreStationery.items, "CopyPaper")
table.insert(ProceduralDistributions.list.BookstoreStationery.items, 1)	
table.insert(ProceduralDistributions.list.CrateOfficeSupplies.items, "CopyPaper")
table.insert(ProceduralDistributions.list.CrateOfficeSupplies.items, 10)	
table.insert(ProceduralDistributions.list.OfficeShelfSupplies.items, "CopyPaper")
table.insert(ProceduralDistributions.list.OfficeShelfSupplies.items, 10)


if SuburbsDistributions.all.officedrawers.items then
	table.insert(SuburbsDistributions.all.officedrawers.items, "CopyPaper")
	table.insert(SuburbsDistributions.all.officedrawers.items, 1)
	table.insert(SuburbsDistributions.all.officedrawers.items, "CopyPaper")
	table.insert(SuburbsDistributions.all.officedrawers.items, 1)
	table.insert(SuburbsDistributions.all.officedrawers.items, "CopyPaper")
	table.insert(SuburbsDistributions.all.officedrawers.items, 1)
end

if ProceduralDistributions.list.OfficeDrawers then
	table.insert(ProceduralDistributions.list.OfficeDrawers.items, "CopyPaper")
	table.insert(ProceduralDistributions.list.OfficeDrawers.items, 1)
	table.insert(ProceduralDistributions.list.OfficeDrawers.items, "CopyPaper")
	table.insert(ProceduralDistributions.list.OfficeDrawers.items, 1)
	table.insert(ProceduralDistributions.list.OfficeDrawers.items, "CopyPaper")
	table.insert(ProceduralDistributions.list.OfficeDrawers.items, 1)
end


	
	table.insert(ProceduralDistributions.list.ElectronicStoreMisc.items, "CopyPaper")
	table.insert(ProceduralDistributions.list.ElectronicStoreMisc.items, 1)	
	table.insert(ProceduralDistributions.list.ElectronicStoreMisc.items, "Photocopier_x")
	table.insert(ProceduralDistributions.list.ElectronicStoreMisc.items, 1)	
	
	   SuburbsDistributions.all.Photocopier = {
            rolls = 3,
            items = {
                "CopyPaper", 100,
                "CopyPaper", 100,
                "CopyPaper", 100,			
            },
            --fillRand = 0,
        }