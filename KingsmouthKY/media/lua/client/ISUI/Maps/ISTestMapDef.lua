require 'Maps/ISMapDefinitions'

LootMaps.Init.KingsmouthMap = function(mapUI)
    print("kingsmouth map")
	local mapAPI = mapUI.javaObject:getAPIv1()

	-- Add XML data from base-game map directories.
	MapUtils.initDirectoryMapData(mapUI, 'media/maps/Kingsmouth')

	-- Specify the appearance of the map.
	MapUtils.initDefaultStyleV1(mapUI)

	-- Use solid color for water instead of a texture.
	replaceWaterStyle(mapUI)

	-- Show only this area from the full map.
	--mapAPI:setBoundsInSquares(3000, 5400, 4200, 4200)
    mapAPI:setBoundsInSquares(3005, 4205, 4187, 5380)

	-- Add the town-name PNG.
	--overlayPNG(mapUI, 9769, 12492, 0.666, "badge", "media/textures/worldMap/MarchRidgeBadge.png")

	-- Add the legend PNG.
	--overlayPNG(mapUI, 10103, 12846, 0.666, "legend", "media/textures/worldMap/Legend.png")

	-- Draw a paper-like texture overtop the map.
	MapUtils.overlayPaper(mapUI)

	-- The original loot map texture, used to position things correctly.
--	overlayPNG(mapUI, 32*300+55, 41*300+155, 0.666, "lootMapPNG", "media/ui/LootableMaps/marchridgemap.png", 0.5)
    print("kingsmouth map")
end