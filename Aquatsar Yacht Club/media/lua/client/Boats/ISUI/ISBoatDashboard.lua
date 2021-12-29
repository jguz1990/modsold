-- --***********************************************************
-- --**        THE INDIE STONE/edited by iBrRus               **
-- --***********************************************************
-- require 'Vehicles/ISUI/ISVehicleDashboard'
require 'AquaConfig'
-- require "ISUI/ISPanel"

ISBoatDashboard = ISPanel:derive("ISBoatDashboard")

function ISBoatDashboard:createChildren()
	self.backgroundTex = ISImage:new(100,35, self.dashboardBG:getWidth(), self.dashboardBG:getHeight(), self.dashboardBG);
	self.backgroundTex:initialise();
	self.backgroundTex:instantiate();
	self:addChild(self.backgroundTex);


--	self.btn_partEngine = ISButton:new(100, 53, 35, 35, "", self, ISBoatDashboard.onMouseDown);
--	self.btn_partEngine:setTooltip("Engine");
--	self.btn_partEngine.internal = "ENGINE";
--	self.btn_partEngine:initialise();
--	self.btn_partEngine:instantiate();
--	self.btn_partEngine.borderColor = {r=1, g=1, b=1, a=0};
--	self.btn_partEngine:setImage(self.texEngine);
--	self:addChild(self.btn_partEngine);
	
	-- self.btn_partSpeed = ISLabel:new(100, 53, 24, "S", 1,1,1,0.85, UIFont.Small);
	-- self.btn_partSpeed:initialise();
	-- self.btn_partSpeed:instantiate();
	-- self.btn_partSpeed.tooltip = getText("Tooltip_Dashboard_Shift")
	-- self:addChild(self.btn_partSpeed);
	
	-- self.doorTex = ISImage:new(200,35, self.iconDoor:getWidthOrig(), self.iconDoor:getHeightOrig(), self.iconDoor);
	-- self.doorTex:initialise();
	-- self.doorTex:instantiate();
	-- self.doorTex.onclick = ISBoatDashboard.onClickDoors;
	-- self.doorTex.target = self;
	-- self.doorTex.mouseovertext = getText("Tooltip_Dashboard_LockedDoors")
	-- self:addChild(self.doorTex);

	-- self.engineTex = ISImage:new(100,35, self.iconEngine:getWidthOrig(), self.iconEngine:getHeightOrig(), self.iconEngine);
	-- self.engineTex:initialise();
	-- self.engineTex:instantiate();
	-- self.engineTex.onclick = ISBoatDashboard.onClickEngine;
	-- self.engineTex.mouseovertext = getText("Tooltip_Dashboard_Engine")
	-- self.engineTex.target = self;
	-- self:addChild(self.engineTex);
	
	-- self.lightsTex = ISImage:new(300,35, self.iconLights:getWidthOrig(), self.iconLights:getHeightOrig(), self.iconLights);
	-- self.lightsTex:initialise();
	-- self.lightsTex:instantiate();
	-- self.lightsTex.onclick = ISBoatDashboard.onClickHeadlights;
	-- self.lightsTex.mouseovertext = getText("Tooltip_Dashboard_Headlights")
	-- self.lightsTex.target = self;
	-- self:addChild(self.lightsTex);
	
	-- self.heaterTex = ISImage:new(400,35, self.iconHeater:getWidthOrig(), self.iconHeater:getHeightOrig(), self.iconHeater);
	-- self.heaterTex:initialise();
	-- self.heaterTex:instantiate();
	-- self.heaterTex.onclick = ISBoatDashboard.onClickHeater;
	-- self.heaterTex.mouseovertext = getText("Tooltip_Dashboard_Heater")
	-- self.heaterTex.target = self;
	-- self:addChild(self.heaterTex);
	
	x = 243
	y = 118
	self.ignitionTex = ISImage:new(300, 300, self.iconIgnition:getWidthOrig(), self.iconIgnition:getHeightOrig(), self.iconIgnition);
	self.ignitionTex:initialise();
	self.ignitionTex:instantiate();
	self.ignitionTex.onclick = ISBoatDashboard.onClickKeys;
	self.ignitionTex.target = self;
	self.ignitionTex.mouseovertext = getText("Tooltip_Dashboard_KeysIgnition")
	self:addChild(self.ignitionTex);
	
	-- self.batteryTex = ISImage:new(600,35, self.iconBattery:getWidthOrig(), self.iconBattery:getHeightOrig(), self.iconBattery);
	-- self.batteryTex:initialise();
	-- self.batteryTex:instantiate();
	-- self.batteryTex.mouseovertext = getText("Tooltip_Dashboard_Battery")
	-- self:addChild(self.batteryTex);
	
	-- self.trunkTex = ISImage:new(700,35, self.iconTrunk:getWidthOrig(), self.iconTrunk:getHeightOrig(), self.iconTrunk);
	-- self.trunkTex:initialise();
	-- self.trunkTex:instantiate();
	-- self.trunkTex.onclick = ISBoatDashboard.onClickTrunk;
	-- self.trunkTex.target = self;
	-- self:addChild(self.trunkTex);

	-- self.speedregulatorTex = ISImage:new(14, 93, self.iconSpeedRegulator:getWidthOrig(), self.iconSpeedRegulator:getHeightOrig(), self.iconSpeedRegulator);
	-- self.speedregulatorTex:initialise();
	-- self.speedregulatorTex:instantiate();
	-- self.speedregulatorTex.mouseovertext = getText("Tooltip_Dashboard_SpeedRegulator", Keyboard.getKeyName(Keyboard.KEY_LSHIFT), Keyboard.getKeyName(getCore():getKey("Forward")), Keyboard.getKeyName(getCore():getKey("Backward")))
	-- self:addChild(self.speedregulatorTex);

	-- Use DebugConsole font which font-mods can't override.
--	self.outsidetemp = ISLabel:new(700, 35, self.engineTex.height, "???", 1, 1, 1, 1, UIFont.DebugConsole, true)
--	self.outsidetemp:initialise();
--	self.outsidetemp:instantiate();
--	self.outsidetemp.backgroundColor = {r=0.9,g=0.9,b=0.9,a=0.85};
--	self.outsidetemp.tooltip = getText("Tooltip_Dashboard_OutsideTemp");
--	self:addChild(self.outsidetemp);

	x = 68
	y = 113
	self.fuelGauge = ISVehicleGauge:new(x, y, self.gaugeFull, 30, 30, -135, -45)
	self.fuelGauge:initialise()
	self.fuelGauge:instantiate()
	self.fuelGauge:setNeedleWidth(20)
	self:addChild(self.fuelGauge)
	
	x = 401
	y = 113
	self.batteryGauge = ISVehicleGauge:new(x, y, self.batteryFull, 30, 30, -135, -45)
	self.batteryGauge:initialise()
	self.batteryGauge:instantiate()
	self.batteryGauge:setNeedleWidth(20)
	self:addChild(self.batteryGauge)

	x = 128
	y = 22
	self.speedGauge = ISVehicleGauge:new(x, y, self.speedGaugeTex, 63, 63, -225, 0) -- красная полоска скорости
	self.speedGauge:initialise()
	self.speedGauge:instantiate()
	self:addChild(self.speedGauge)
	
	x = 275
	y = 22
	self.engineGauge = ISVehicleGauge:new(x, y, self.engineGaugeTex, 63, 63, -225, 45)
	self.engineGauge:initialise()
	self.engineGauge:instantiate()
	self:addChild(self.engineGauge)

	self:onResolutionChange()
end

function ISBoatDashboard.damageFlick(character)
	local dash = nil;
	if instanceof(character, 'IsoPlayer') and character:isLocalPlayer() then
		local boat = character:getVehicle()
		dash = getPlayerVehicleDashboard(character:getPlayerNum())
	end
	if dash then
		dash.flickAlpha = 0;
		dash.flickAlphaUp = true;
		dash.flickingTimer = 100;
	end
end

function ISBoatDashboard:getAlphaFlick(default)
	if self.flickingTimer > 0 then
		self.flickingTimer = self.flickingTimer - 1;
		
		if self.flickAlphaUp then
			self.flickAlpha = self.flickAlpha + 0.2;
			if self.flickAlpha >= 1 then
				self.flickAlpha = 0.8;
				self.flickAlphaUp = false;
			end
		else
			self.flickAlpha = self.flickAlpha - 0.2;
			if self.flickAlpha <= 0 then
				self.flickAlpha = 0.2;
				self.flickAlphaUp = true;
			end
		end
		
		return self.flickAlpha;
	else
		return default;
	end
end

function ISBoatDashboard:setVehicle(boat)
	self.boat = boat
	for _,gauge in ipairs(self.gauges) do
		gauge:setVisible(false)
	end
	self.gauges = {}
	if not boat then
		self:removeFromUIManager()
		return
	end
	
	local part = boat:getPartById("GasTank")
	if part and part:isContainer() and part:getContainerContentType() then
		self.gasTank = part
		if self.boat:isEngineRunning() then
			self.fuelValue = self.gasTank:getContainerContentAmount() / self.gasTank:getContainerCapacity()
		else
			self.fuelValue = 0.0
		end	
		self.fuelGauge:setVisible(true)
		table.insert(self.gauges, self.fuelGauge)
	else
		self.gasTank = nil
		self.fuelGauge:setVisible(false)
	end
	
	part = boat:getPartById("Battery")
	if part then
		self.battery = part
		if self.boat:isEngineRunning() then
			--self.initialBattery = part:getInventoryItem():getUsedDelta()
			-- print(getPlayer():getVehicle():getPartById("Battery"):getInventoryItem():getUsedDelta())
			self.batteryValue = part:getInventoryItem():getUsedDelta()
		else
			self.batteryValue = 0.0
		end
		self.batteryGauge:setVisible(true)
	else
		self.battery = nil
		self.batteryGauge:setVisible(false)
	end
	
	self.engineGauge:setVisible(true)
	table.insert(self.gauges, self.engineGauge)
	
	self.speedGauge:setVisible(true)
	table.insert(self.gauges, self.speedGauge)
	
	if #self.gauges > 0 then
		self:setVisible(true)
		self:addToUIManager()
		self:onResolutionChange()
	else
		self:removeFromUIManager()
	end
	if not ISUIHandler.allUIVisible then
		self:removeFromUIManager()
	end
end

function ISBoatDashboard:prerender()
	if not self.boat or not ISUIHandler.allUIVisible then return end
	local alpha = self:getAlphaFlick(0.65);
	local greyBg = {r=0.5, g=0.5, b=0.5, a=alpha};
	if self.gasTank then
		local current = 0.0
		if self.boat:isEngineRunning() or self.boat:isKeysInIgnition() then
			current = self.gasTank:getContainerContentAmount() / self.gasTank:getContainerCapacity()
		end
		if self.fuelValue < current then
			self.fuelValue = math.min(self.fuelValue + 0.015 * (30 / getPerformance():getUIRenderFPS()), current)
		elseif self.fuelValue > current then
			self.fuelValue = math.max(self.fuelValue - 0.05 * (30 / getPerformance():getUIRenderFPS()), current)
		end
		if not self.boat:isEngineRunning() and not self.battery:getInventoryItem() then
			self.fuelValue = 0.0
		end
		self.fuelGauge:setValue(self.fuelValue)
		local engineSpeedValue = 0;
		local speedValue = 0;
		if self.boat:isEngineRunning() then
			engineSpeedValue = math.max(0,math.min(1,(self.boat:getEngineSpeed())/6000));
			speedValue = math.max(0,math.min(1,math.abs(self.boat:getCurrentSpeedKmHour())/138));
		end
		self.engineGauge:setValue(engineSpeedValue)
		-- RJ: Fake the speedometer a tad
		self.speedGauge:setValue(speedValue * BaseVehicle.getFakeSpeedModifier())
	end
	if self.battery and self.battery:getInventoryItem() then
		local current = 0.0
		if self.boat:isEngineRunning() or self.boat:isKeysInIgnition() then
			current = self.battery:getInventoryItem():getUsedDelta()
		end
		if self.batteryValue < current then
			self.batteryValue = math.min(self.batteryValue + 0.015 * (30 / getPerformance():getUIRenderFPS()), current)
		elseif self.batteryValue > current then
			self.batteryValue = math.max(self.batteryValue - 0.05 * (30 / getPerformance():getUIRenderFPS()), current)
		end
		self.batteryGauge:setValue(self.batteryValue)
	else
		self.batteryGauge:setValue(0)
	end
	
	
	-- self.batteryTex.backgroundColor = greyBg;
	-- if not self:checkEngineFull() and self.boat:isKeysInIgnition() and (not self.boat:isEngineRunning() and not self.boat:isEngineStarted()) then
		-- self.engineTex.backgroundColor = {r=1, g=0, b=0, a=alpha};
	-- else
		-- if self.boat:isEngineRunning() then
			-- self.engineTex.backgroundColor = {r=0, g=1, b=0, a=alpha};
			-- self.btn_partSpeed.name = self.boat:getTransmissionNumberLetter();
		-- elseif self.boat:isEngineStarted() then
			-- self.engineTex.backgroundColor = {r=1, g=0.5, b=0.1, a=alpha};
			-- self.btn_partSpeed.name = "P";
		-- else
			-- self.engineTex.backgroundColor = greyBg;
			-- self.btn_partSpeed.name = "P";
		-- end
	-- end
	-- if self.boat:isEngineRunning() or self.boat:isKeysInуу() then
		-- if self.boat:getBatteryCharge() > 0 then
			-- self.batteryTex.backgroundColor = {r=0, g=1, b=0, a=alpha};
		-- else
			-- self.batteryTex.backgroundColor = {r=1, g=0, b=0, a=alpha};
		-- end
	-- end
	if not self.boat:isKeysInIgnition() then
		if self.character:getInventory():haveThisKeyId(self.boat:getKeyId()) then
			self.ignitionTex.mouseovertext = getText("Tooltip_Dashboard_PutKeysInIgnition")
		else
			self.ignitionTex.mouseovertext = getText("Tooltip_Dashboard_NoKey")
		end
		if self.boat:isHotwired() then
			self.ignitionTex.mouseovertext = getText("Tooltip_Dashboard_Hotwired")
		end
	end
	if self.boat:isKeysInIgnition() and not self.boat:isHotwired() and not (self.boat:isEngineRunning() or self.boat:isStarting()) then
		self.ignitionTex.texture = self.iconIgnitionKey;
		self.ignitionTex.mouseovertext = getText("Tooltip_Dashboard_KeysIgnition")
	elseif (self.boat:isEngineRunning() or self.boat:isStarting()) and not self.boat:isHotwired() then
		self.ignitionTex.texture = self.iconIgnitionStarted;
	elseif self.boat:isHotwired() then
		self.ignitionTex.texture = self.iconIgnitionHotwired;
	else
		self.ignitionTex.texture = self.iconIgnition;
	end
	-- if self.boat:getHeadlightsOn() and not self.boat:getHeadlightCanEmmitLight() then
		-- self.lightsTex.backgroundColor = {r=1, g=0, b=0, a=alpha};
	-- elseif self.boat:getHeadlightsOn() then
		-- self.lightsTex.backgroundColor = {r=0, g=1, b=0, a=alpha};
	-- else
		-- self.lightsTex.backgroundColor = greyBg;
	-- end
	-- if self.boat:areAllDoorsLocked() then
		-- self.doorTex.backgroundColor = {r=0, g=1, b=0, a=alpha};
	-- elseif self.boat:isAnyDoorLocked() then
		-- self.doorTex.backgroundColor = {r=1, g=1, b=0, a=alpha};
	-- else
		-- self.doorTex.backgroundColor = greyBg;
	-- end
	-- if self.boat:getPartById("Heater") then
		-- if self.boat:getPartById("Heater"):getModData().active then
			-- self.heaterTex.backgroundColor = {r=0, g=1, b=0, a=alpha};
		-- else
			-- self.heaterTex.backgroundColor = greyBg;
		-- end
	-- end
	-- if self.boat:isRegulator() then
		-- self.speedregulatorTex.backgroundColor = {r=0, g=1, b=0, a=alpha};
	-- else
		-- self.speedregulatorTex.backgroundColor = greyBg;
	-- end
	-- self.trunkTex:setVisible(self.boat:getPartById("TruckBed") ~= nil)
	-- if self.boat:isTrunkLocked() then
		-- self.trunkTex.backgroundColor = {r=0, g=1, b=0, a=alpha};
		-- self.trunkTex.mouseovertext = getText("Tooltip_Dashboard_TrunkLocked")
	-- else
		-- self.trunkTex.backgroundColor = greyBg;
		-- self.trunkTex.mouseovertext = getText("Tooltip_Dashboard_TrunkUnlocked")
	-- end

	if (self.boat:isEngineRunning() or self.boat:isKeysInIgnition()) and self.boat:getRemainingFuelPercentage() < 15 then
		self.fuelGauge:setTexture(self.gaugeLow);
		if self.boat:getRemainingFuelPercentage() < 5 then
			self.fuelGauge:setTexture(self.gaugeEmpty);
		end
	else
		self.fuelGauge:setTexture(self.gaugeFull);
	end
	
	if (self.boat:isEngineRunning() or self.boat:isKeysInIgnition()) and self.battery:getInventoryItem() and self.battery:getInventoryItem():getUsedDelta() < 0.1 then
		if self.battery:getInventoryItem():getUsedDelta() == 0 then
			self.batteryGauge:setTexture(self.batteryEmpty)
		else
			self.batteryGauge:setTexture(self.batteryLow)
		end
	else
		self.batteryGauge:setTexture(self.batteryFull);
	end
	
end

function ISBoatDashboard:checkEngineFull()
	for i=0,self.boat:getPartCount() do
		local part = self.boat:getPartByIndex(i);
		if part and part:getLuaFunction("checkEngine") and not VehicleUtils.callLua(part:getLuaFunction("checkEngine"), self.boat, part) then
			return false;
		end
	end
	return true;
end
		
function ISBoatDashboard:render()
	if not self.boat then return end
	-- if self.boat:isRegulator() then
		-- self:drawText(self.boat:getRegulatorSpeed() .. "", self.speedregulatorTex.x + self.speedregulatorTex:getWidth() + 5, self.speedregulatorTex.y, 0, 1, 0, 0.8, UIFont.Medium);
	-- else
		-- self:drawText(self.boat:getRegulatorSpeed() .. "", self.speedregulatorTex.x + self.speedregulatorTex:getWidth() + 5, self.speedregulatorTex.y, 1, 1, 1, 0.3, UIFont.Medium);
	-- end
--	self:onResolutionChange();
--	if self.outsidetemp then
--		local engine = self.boat:getPartById("Engine");
--		if engine then
--			self.outsidetemp.name = Temperature.getTemperatureString(engine:getModData().temperature); --round(getWorld():getGlobalTemperature(),1) .. "";
--			self.outsidetemp:setWidthToName()
--		end
--	end
end

function ISBoatDashboard:isBoatDashboard()
	return true
end

function ISBoatDashboard:onResolutionChange()

	local screenLeft = getPlayerScreenLeft(self.playerNum)
	local screenTop = getPlayerScreenTop(self.playerNum)
	local screenWidth = getPlayerScreenWidth(self.playerNum)
	local screenHeight = getPlayerScreenHeight(self.playerNum)

	if self.backgroundTex == nil then
		return;
	end
	
	self:setHeight(self.backgroundTex:getHeight());
	self:setX(screenLeft + (screenWidth - self.backgroundTex:getWidth()) / 2);
	self:setY(screenTop + screenHeight);

	if self.backgroundTex then
		self.backgroundTex:setX(0)
		self.backgroundTex:setY(0)
	end
	
	local x = self:getX();

	-- if self.btn_partSpeed ~= nil then
		-- self.btn_partSpeed:setX(self.backgroundTex:getX() + 60);
		-- self.btn_partSpeed:setY(self.backgroundTex:getY() + 55);
	-- end
	
	-- if self.engineTex then
		-- self.engineTex:setX(self.backgroundTex:getX() + 105);
		-- self.engineTex:setY(self.backgroundTex:getY() + 26);
	-- end
	
	-- if self.batteryTex then
		-- self.batteryTex:setX(self.engineTex:getX() + 32); --36
		-- self.batteryTex:setY(self.engineTex:getY());
	-- end
	
--	if self.outsidetemp then
--		self.outsidetemp:setX(self.batteryTex:getX() + 26); --34
--		self.outsidetemp:setY(self.batteryTex:getY());
--	end
	
	-- if self.doorTex then
		-- self.doorTex:setX(self.batteryTex:getX() + 32);
		-- self.doorTex:setY(self.batteryTex:getY());
	-- end
	
	-- if self.lightsTex then
		-- self.lightsTex:setX(self.engineTex:getX() + 255);
		-- self.lightsTex:setY(self.engineTex:getY());
	-- end
	
	-- if self.heaterTex then
		-- self.heaterTex:setX(self.lightsTex:getX() + 32);
		-- self.heaterTex:setY(self.lightsTex:getY());
	-- end
	
	-- if self.trunkTex then
		-- self.trunkTex:setX(self.heaterTex:getX() + 31);
		-- self.trunkTex:setY(self.heaterTex:getY());
	-- end

	if self.ignitionTex then
		local x = 243
		local y = 118
		self.ignitionTex:setX(x);
		self.ignitionTex:setY(y);
	end
end

-- function ISBoatDashboard:onClickEngine()
	-- if getGameSpeed() == 0 then return; end
	-- if getGameSpeed() > 1 then setGameSpeed(1); end
	-- if not self.boat then return end
	-- if self.boat:isEngineRunning() then
		-- ISVehicleMenu.onShutOff(self.character)
	-- else
		-- ISVehicleMenu.onStartEngine(self.character)
	-- end
-- end

-- function ISBoatDashboard:onClickHeadlights()
	-- if getGameSpeed() == 0 then return; end
	-- if getGameSpeed() > 1 then setGameSpeed(1); end
	-- ISVehicleMenu.onToggleHeadlights(self.character);
-- end

-- function ISBoatDashboard:onClickDoors()
	-- if getGameSpeed() == 0 then return; end
	-- if getGameSpeed() > 1 then setGameSpeed(1); end
	-- ISVehiclePartMenu.onLockDoors(self.character, self.boat, not self.boat:isAnyDoorLocked());
-- end

-- function ISBoatDashboard:onClickTrunk()
	-- if getGameSpeed() == 0 then return; end
	-- if getGameSpeed() > 1 then setGameSpeed(1); end
	-- ISVehicleMenu.onToggleTrunkLocked(self.character);
-- end

-- function ISBoatDashboard:onClickHeater()
	-- if getGameSpeed() == 0 then return; end
	-- if getGameSpeed() > 1 then setGameSpeed(1); end
	-- ISVehicleMenu.onToggleHeater(self.character)
-- end

function ISBoatDashboard:onClickKeys()
	if getGameSpeed() == 0 then return; end
	if getGameSpeed() > 1 then setGameSpeed(1); end
	if not self.boat then return end
	if self.boat:isEngineRunning() then
		ISVehicleMenu.onShutOff(self.character)
	elseif not self.boat:isEngineStarted() then
		self.boat:setKeysInIgnition(not self.boat:isKeysInIgnition());
	end
end

function ISBoatDashboard:new(playerNum, chr)
	local o = ISPanel:new(0, 0, 200, 200)
	setmetatable(o, self)
	self.__index = self
	o.playerNum = playerNum
	o.character = chr;
	o.gauges = {}
	--o.texEngine = getTexture("media/ui/vehicle/engine.png")
	--o.iconEngine = getTexture("media/ui/vehicles/icon_enginetrouble_light.png");
	--o.iconAirCondition = getTexture("media/ui/vehicles/icon_airconditioning_light.png");
	--o.iconDoor = getTexture("media/ui/vehicles/icon_doorslocked_light.png");
	--o.iconLights = getTexture("media/ui/vehicles/icon_headlights_light.png");
	--o.iconHeater = getTexture("media/ui/vehicles/icon_heating_light.png");
	--o.iconBattery = getTexture("media/ui/vehicles/icon_lowbattery_light.png");
	--o.iconTrunk = getTexture("media/ui/vehicles/icon_trunk_light.png")
	-- o.iconSpeedRegulator = getTexture("media/ui/vehicles/speedregulator_light.png")
	
	o.iconIgnition = getTexture("media/ui/boats/boat_ignition.png"); -- Ключ зажигания
	o.iconIgnitionKey = getTexture("media/ui/boats/boat_ignition_key_off.png");
	o.iconIgnitionStarted = getTexture("media/ui/boats/boat_ignition_key_on.png");
	o.iconIgnitionHotwired = getTexture("media/ui/boats/boat_ignition_hotwired.png");
	
	o.batteryFull = getTexture("media/ui/boats/boat_batteryguage.png")
	o.batteryLow = getTexture("media/ui/boats/boat_batteryguage_low.png")
	o.batteryEmpty = getTexture("media/ui/boats/boat_batteryguage_empty.png")
	
	o.gaugeFull = getTexture("media/ui/boats/boat_fuelguage_full.png");
	o.gaugeLow = getTexture("media/ui/boats/boat_fuelguage_low.png");
	o.gaugeEmpty = getTexture("media/ui/boats/boat_fuelguage_empty.png");
	
	o.engineGaugeTex = getTexture("media/ui/boats/boat_engineguage.png")
	o.dashboardBG = getTexture("media/ui/boats/boat_dashboard.png");
	
	o.speedGaugeTex = getTexture("media/ui/boats/boat_spedometer.png")
	o.flickingTimer = 0;
	o:setWidth(o.dashboardBG:getWidth());
	return o
end

function ISBoatDashboard.onEnterVehicle(character)
	local boat = character:getVehicle()
	if instanceof(character, 'IsoPlayer') and character:isLocalPlayer() and boat:isDriver(character) then
		if AquaConfig.isBoat(boat) then
			getPlayerVehicleDashboard(character:getPlayerNum()):setVehicle(nil)
			local data = getPlayerData(character:getPlayerNum())
			if AquaConfig.Boat(boat).dashboard == "ISSalingBoatDashboard" then
				data.vehicleDashboard = ISSalingBoatDashboard:new(character:getPlayerNum(), character)
			elseif AquaConfig.Boats[boat:getScript():getName()].dashboard == "ISNewSalingBoatDashboard" then
				data.vehicleDashboard = ISNewSalingBoatDashboard:new(character:getPlayerNum(), character)
			else
				data.vehicleDashboard = ISBoatDashboard:new(character:getPlayerNum(), character)
			end
			data.vehicleDashboard:initialise()
			data.vehicleDashboard:instantiate()
			data.vehicleDashboard:setVehicle(boat)
			return
		end
	end
end

function ISBoatDashboard.onExitVehicle(character)
	if instanceof(character, 'IsoPlayer') and character:isLocalPlayer() then
		if getPlayerVehicleDashboard(character:getPlayerNum()) then
			-- print(getPlayerVehicleDashboard(character:getPlayerNum()).dashboardBG:getName())
			if string.match(getPlayerVehicleDashboard(character:getPlayerNum()).dashboardBG:getName(), "boat_dashboard") then
				getPlayerVehicleDashboard(character:getPlayerNum()):setVehicle(nil)
				local data = getPlayerData(character:getPlayerNum())
				data.vehicleDashboard = ISVehicleDashboard:new(character:getPlayerNum(), character)
				data.vehicleDashboard:initialise()
				data.vehicleDashboard:instantiate()
			end
		end
	end
end

function ISBoatDashboard.onSwitchVehicleSeat(character)
	if instanceof(character, 'IsoPlayer') and character:isLocalPlayer() then
		local boat = character:getVehicle()
		if boat:isDriver(character) and AquaConfig.isBoat(boat) then
			local data = getPlayerData(character:getPlayerNum()) -- dataT = getPlayerData(getPlayer():getPlayerNum())
			if not string.match(getPlayerVehicleDashboard(character:getPlayerNum()).dashboardBG:getName(), "boat_dashboard") then
				getPlayerVehicleDashboard(character:getPlayerNum()):setVehicle(nil)
				if AquaConfig.Boat(boat).dashboard == "ISSalingBoatDashboard" then
					data.vehicleDashboard = ISSalingBoatDashboard:new(character:getPlayerNum(), character)
				elseif AquaConfig.Boats[boat:getScript():getName()].dashboard == "ISNewSalingBoatDashboard" then
					data.vehicleDashboard = ISNewSalingBoatDashboard:new(character:getPlayerNum(), character)
				else
					data.vehicleDashboard = ISBoatDashboard:new(character:getPlayerNum(), character)
				end
				data.vehicleDashboard:initialise()
				data.vehicleDashboard:instantiate()
			end
			data.vehicleDashboard:setVehicle(boat)
		elseif not boat:isDriver(character) then
			getPlayerVehicleDashboard(character:getPlayerNum()):setVehicle(nil)
		end
	end
end

-- function ISBoatDashboard.OnGameStart()
	-- if isServer() then return end
	-- for i=1,getNumActivePlayers() do
		-- local playerObj = getSpecificPlayer(i-1)
		-- if playerObj and not playerObj:isDead() and playerObj:getVehicle() then
			-- ISBoatDashboard.onEnterVehicle(playerObj)
		-- end
	-- end
-- end

-- LuaEventManager.AddEvent("OnExitVehicle")
-- LuaEventManager.AddEvent("OnSwitchVehicleSeat")
Events.OnEnterVehicle.Add(ISBoatDashboard.onEnterVehicle)
Events.OnExitVehicle.Add(ISBoatDashboard.onExitVehicle)
Events.OnSwitchVehicleSeat.Add(ISBoatDashboard.onSwitchVehicleSeat)
-- Events.OnGameStart.Add(ISBoatDashboard.OnGameStart)
-- Events.OnVehicleDamageTexture.Add(ISBoatDashboard.damageFlick)
