require "CommonTemplates/CommonTemplates"

Trailers = {}
Trailers.CheckEngine = {}
Trailers.CheckOperate = {}
Trailers.ContainerAccess = {}
Trailers.Create = {}
Trailers.Init = {}
Trailers.InstallComplete = {}
Trailers.InstallTest = {}
Trailers.UninstallComplete = {}
Trailers.UninstallTest = {}
Trailers.Update = {}
Trailers.Use = {}

function Trailers.Update.GeneratorGasTank(trailer, part, elapsedMinutes)
	-- print("Trailers.Update.GeneratorGasTank")
	Vehicles.Update.GasTank(trailer, part, elapsedMinutes)
	local amount = part:getContainerContentAmount()
	if elapsedMinutes > 0 and amount > 0 and trailer:isEngineRunning() then
		if trailer:getModData()["generatorObject"] then
			trailer:getModData()["generatorObject"]:setFuel(amount/part:getContainerCapacity() * 100)
		end
	end
	if trailer:getModData()["generatorObject"] then
		trailer:getModData()["generatorObject"]:setCondition(trailer:getPartById("Engine"):getCondition())
		if trailer:getPartById("Engine"):getCondition() < 1 then
			trailer:getModData()["generatorObject"]:setActivated(false)
		end
	end
end

function Trailers.UninstallComplete.GeneratorGasTank(trailer, part, item)
	-- print("Trailers.UninstallComplete.GeneratorGasTank")
	if trailer:getModData()["generatorObject"] then
		trailer:getModData()["generatorObject"]:setFuel(0.0)
		trailer:getModData()["generatorObject"]:setActivated(false)
	end
end

function Trailers.SearchGenerator(trailer, dx, dy)
	local square = trailer:getSquare()
	if square == nil then return end
	-- print("Trailers.SearchGenerator")
	for y=square:getY() - dy, square:getY() + dy do
		for x=square:getX() - dx, square:getX() + dx do
            local square2 = getCell():getGridSquare(x, y, 0)
			if square2 ~= nil then
				-- print("Square ", x, " ", y)
				local sqGen = square2:getGenerator()
				if sqGen and sqGen:isConnected() then
					-- print(sqGen:getSprite():getName())
				-- and sqGen:getSprite() == "appliances_misc_01_10" then
					return sqGen
				end
			end
		end
	end
end

function Trailers.Init.EarthingOn (trailer, part)
	-- print("Trailers.Init.EarthingOn")
	-- print(trailer)
	-- print(trailer:getScript():getName())
	if not part:getLight() then
		CommonTemplates.createActivePart(part)
	end
	if part:getInventoryItem() then
		local gen = Trailers.SearchGenerator(trailer, 2, 2)
		if gen then
			-- print("AUTOTSAR: Generator found!")
			trailer:setMass(10000)
			part:setLightActive(true)
			-- print("AUTOTSAR: ", trailer:getMass())
			trailer:getModData()["generatorObject"] = gen
		else
			-- print("AUTOTSAR: Generator NOT found!")
			trailer:setMass(1000)
			part:setLightActive(false)
			trailer:getModData()["generatorObject"] = nil
			local item = part:getInventoryItem()
			-- trailer:getPartById("EarthingOff"):setInventoryItem(item)
			trailer:getPartById("EarthingOn"):setInventoryItem(nil)
		end
	end
end

function Trailers.Update.EarthingOn (trailer, part, elapsedMinutes)
	-- print("Trailers.Update.EarthingOn")
	if trailer:getModData()["generatorObject"] then
		-- print(trailer:getMass())
		if trailer:getMass() < 9000 then
			trailer:setMass(10000)
			part:setLightActive(false)
		end
	end
end

function Trailers.Create.EarthingOn(trailer, part)
	-- print("Trailers.Create.EarthingOn")
	local item = VehicleUtils.createPartInventoryItem(part);
	CommonTemplates.createActivePart(part)
	part:setInventoryItem(nil)
end

-- function Trailers.Create.EarthingOff(trailer, part)
	-- print("Trailers.Create.EarthingOff")
	-- local item = VehicleUtils.createPartInventoryItem(part);
	-- part:setInventoryItem(item)
-- end

-- function Trailers.Update.Earthing(trailer, part)

-- end

-- function Trailers.Update.GeneratorEngine(trailer, part, elapsedMinutes)
-- print("Trailers.Update.GeneratorEngine")
	-- Vehicles.Update.Engine(trailer, part, elapsedMinutes)
	-- if trailer:getModData()["generatorObject"] then
		-- trailer:getModData()["generatorObject"]:setCondition(part:getCondition())
	-- end
-- end