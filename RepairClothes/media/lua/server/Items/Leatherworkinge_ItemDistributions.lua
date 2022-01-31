require "Items/Distributions"
require "Items/ProceduralDistributions"
require "Items/ItemPicker"	
--XX
if SuburbsDistributions.SewingKit then
	table.insert(SuburbsDistributions.SewingKit.items, "LeatherworkingAwl")
	table.insert(SuburbsDistributions.SewingKit.items, 0.4)
end			
	-- table.insert(SuburbsDistributions.storageunit.all.items, "LeatherworkingAwl")
	-- table.insert(SuburbsDistributions.storageunit.all.items, 0.4)

-- ProceduralDistributions.list.SewingStoreTools"] = ProceduralDistributions.list.SewingStoreTools"] or {
        -- rolls = 4,
        -- items = {}
    -- }
if ProceduralDistributions.list.CrateTailoring then
	table.insert(ProceduralDistributions.list.CrateTailoring.items, "LeatherworkingAwl")
	table.insert(ProceduralDistributions.list.CrateTailoring.items, 1)
end		


if ProceduralDistributions.list.SewingStoreTools then
	table.insert(ProceduralDistributions.list.SewingStoreTools.items, "LeatherworkingAwl")
	table.insert(ProceduralDistributions.list.SewingStoreTools.items, 1)
end	