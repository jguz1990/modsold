


ISNewSalingBoatDashboard = ISPanel:derive("ISNewSalingBoatDashboard")
local fakeSpeed = 0.8


function ISNewSalingBoatDashboard:createChildren()
	self.backgroundTex = ISImage:new(300, 300, self.dashboardBG:getWidth(), self.dashboardBG:getHeight(), self.dashboardBG);
	self.backgroundTex:initialise();
	self.backgroundTex:instantiate();
	self:addChild(self.backgroundTex);
	
	-- Wind arrow gauge
	-- local x = 141
	-- local y = 135
	-- self.arrowWindTex = ISImage:new(x, y, self.windGaugeArrowTex:getWidthOrig(), self.windGaugeArrowTex:getHeightOrig(), self.windGaugeArrowTex);
	-- self.arrowWindTex:initialise();
	-- self.arrowWindTex:instantiate();
	-- self:addChild(self.arrowWindTex);

	
	x = 168
	y = 193
	self.btn_speedValue = ISImage:new(x, y, self.speedValueMph:getWidthOrig(), self.speedValueMph:getHeightOrig(), self.speedValueMph);	
	self.btn_speedValue:initialise();
	self.btn_speedValue:instantiate();
	self.btn_speedValue.onclick = ISNewSalingBoatDashboard.onClickSpeedValue;
	self.btn_speedValue.target = self;
	self.btn_speedValue.mouseovertext = getText("Tooltip_BoatDashboard_SpeedValueButton")
	self:addChild(self.btn_speedValue);

	
	-- Wind speed gauge
	x = 133
	y = 192
	self.speedWindTexTens = ISImage:new(x, y, self.speedGaugeTexNull:getWidthOrig(), self.speedGaugeTexNull:getHeightOrig(), self.speedGaugeTexNull);
	self.speedWindTexTens:initialise();
	self.speedWindTexTens:instantiate();
	self:addChild(self.speedWindTexTens);
	
	x = 143
	y = 192
	self.speedWindTexOnes = ISImage:new(x, y, self.speedGaugeTexNull:getWidthOrig(), self.speedGaugeTexNull:getHeightOrig(), self.speedGaugeTexNull);
	self.speedWindTexOnes:initialise();
	self.speedWindTexOnes:instantiate();
	self:addChild(self.speedWindTexOnes);
	
	x = 152
	y = 192
	self.speedWindTexPoint = ISImage:new(x, y, self.speedGaugeTexPoint:getWidthOrig(), self.speedGaugeTexPoint:getHeightOrig(), self.speedGaugeTexPoint);
	self.speedWindTexPoint:initialise();
	self.speedWindTexPoint:instantiate();
	self:addChild(self.speedWindTexPoint);
	
	x = 156
	y = 192
	self.speedWindTexFraction = ISImage:new(x, y, self.speedGaugeTexNull:getWidthOrig(), self.speedGaugeTexNull:getHeightOrig(), self.speedGaugeTexNull);
	self.speedWindTexFraction:initialise();
	self.speedWindTexFraction:instantiate();
	self:addChild(self.speedWindTexFraction);
	
	-- Boat speed gauge
	x = 133
	y = 211
	self.speedTexTens = ISImage:new(x, y, self.speedGaugeTexNull:getWidthOrig(), self.speedGaugeTexNull:getHeightOrig(), self.speedGaugeTexNull);
	self.speedTexTens:initialise();
	self.speedTexTens:instantiate();
	self:addChild(self.speedTexTens);
	
	x = 143
	y = 211
	self.speedTexOnes = ISImage:new(x, y, self.speedGaugeTexNull:getWidthOrig(), self.speedGaugeTexNull:getHeightOrig(), self.speedGaugeTexNull);
	self.speedTexOnes:initialise();
	self.speedTexOnes:instantiate();
	self:addChild(self.speedTexOnes);
	
	x = 152
	y = 211
	self.speedTexPoint = ISImage:new(x, y, self.speedGaugeTexPoint:getWidthOrig(), self.speedGaugeTexPoint:getHeightOrig(), self.speedGaugeTexPoint);
	self.speedTexPoint:initialise();
	self.speedTexPoint:instantiate();
	self:addChild(self.speedTexPoint);
	
	x = 156
	y = 211
	self.speedTexFraction = ISImage:new(x, y, self.speedGaugeTexNull:getWidthOrig(), self.speedGaugeTexNull:getHeightOrig(), self.speedGaugeTexNull);
	self.speedTexFraction:initialise();
	self.speedTexFraction:instantiate();
	self:addChild(self.speedTexFraction);
	
	-- x = 947
	-- y = 67
	-- self.speedGauge = ISVehicleGauge:new(x, y, self.speedGaugeTex, 73, 71, -225, 0) -- красная полоска скорости
	-- self.speedGauge:initialise()
	-- self.speedGauge:instantiate()
	-- self:addChild(self.speedGauge)
	
	
	x = 145
	y = 145
	self.sailGauge = ISVehicleGauge:new(x, y, self.windGaugeTex, 6, 5, 0, 180) -- красная полоска (x, y, angle start, angle finish)
	self.sailGauge:initialise()
	self.sailGauge:instantiate()
	self.sailGauge:setNeedleWidth(20)
	self:addChild(self.sailGauge)
	
	x = 145
	y = 145
	self.windGauge = ISVehicleGauge:new(x, y, self.windGaugeTex, 6, 5, -270, 90) -- красная полоска (x, y, angle start, angle finish)
	self.windGauge:initialise()
	self.windGauge:instantiate()
	self.windGauge:setNeedleWidth(115)
	self:addChild(self.windGauge)
	
	x = 145
	y = 145
	self.sailGaugeW = ISImage:new(x, y, 10, 10, self.windGaugeTex) -- красная полоска (x, y, angle start, angle finish)
	self.sailGaugeW:initialise()
	self.sailGaugeW:instantiate()
	self:addChild(self.sailGaugeW)
	
	-- self.windSpeedGauge = ISVehicleGauge:new(x, y, self.sailGaugeTex, 125, 125, -138, -42) -- красная полоска (x, y, angle start, angle finish)
	-- self.windSpeedGauge:initialise()
	-- self.windSpeedGauge:instantiate()
	-- self.windSpeedGauge:setNeedleWidth(50)
	-- self:addChild(self.windSpeedGauge)
	
	-- self.sailGauge = ISVehicleGauge:new(x, y, self.sailGaugeTex, 125, 125, 0, 180) -- красная полоска (x, y, angle start, angle finish)
	-- self.sailGauge:initialise()
	-- self.sailGauge:instantiate()
	-- self.sailGauge:setNeedleWidth(50)
	-- self:addChild(self.sailGauge)
	self:onResolutionChange()
end

function ISNewSalingBoatDashboard:onClickSpeedValue()
	if getGameSpeed() == 0 then return; end
	if getGameSpeed() > 1 then setGameSpeed(1); end
	if self.boat:getModData()["SpeedValueKph"] then
		self.boat:getModData()["SpeedValueKph"] = false
		self.btn_speedValue.texture = self.speedValueMph
	else
		self.boat:getModData()["SpeedValueKph"] = true
		self.btn_speedValue.texture = self.speedValueKph
	end
end

function ISNewSalingBoatDashboard:getAlphaFlick(default)
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

function ISNewSalingBoatDashboard:setVehicle(boat)
	self.boat = boat
	for _,gauge in ipairs(self.gauges) do
		gauge:setVisible(false)
	end
	self.gauges = {}
	if not boat then
		self:removeFromUIManager()
		return
	end
	
	if boat:getModData()["SpeedValueKph"] == nil then
		boat:getModData()["SpeedValueKph"] = false
	elseif boat:getModData()["SpeedValueKph"] then
		self.btn_speedValue.texture = self.speedValueKph
	end

	self.windGauge:setVisible(true)
	table.insert(self.gauges, self.windGauge)
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

function ISNewSalingBoatDashboard:setBoatSpeedValue(speed)
	speed = math.abs(speed)	* fakeSpeed
	local tens = math.floor(speed / 10)
	local ones = math.floor(speed % 10)
	local fraction = 0
	if ones > 0 or tens > 0 then
		fraction = math.floor(speed * 10 % 10)
	end
	self.speedTexOnes.texture = self.speedGaugesTex[ones+1]
	self.speedTexTens.texture = self.speedGaugesTex[tens+1]
	self.speedTexFraction.texture = self.speedGaugesTex[fraction+1]	
end

function ISNewSalingBoatDashboard:setWindSpeedValue(speed)
	speed = math.abs(speed)	* fakeSpeed
	local tens = math.floor(speed / 10)
	local ones = math.floor(speed % 10)
	local fraction = 0
	if ones > 0 or tens > 0 then
		fraction = math.floor(speed * 10 % 10)
	end
	self.speedWindTexOnes.texture = self.speedGaugesTex[ones+1]
	self.speedWindTexTens.texture = self.speedGaugesTex[tens+1]
	self.speedWindTexFraction.texture = self.speedGaugesTex[fraction+1]	
end

function ISNewSalingBoatDashboard:prerender()
	if not self.boat or not ISUIHandler.allUIVisible then return end
	local alpha = self:getAlphaFlick(0.65)
	local greyBg = {r=0.5, g=0.5, b=0.5, a=alpha}
	local speedValue = self.boat:getCurrentSpeedKmHour()
	if not self.boat:getModData()["SpeedValueKph"] then
		speedValue = speedValue/1.60934
	end
	self.setBoatSpeedValue(self, speedValue)
	
	local frontVector = Vector3f.new()
	local rearVector = Vector3f.new()
	self.boat:getAttachmentWorldPos("trailerfront", frontVector)
	self.boat:getAttachmentWorldPos("trailer", rearVector)
	local x = frontVector:x() - rearVector:x()
	local y = frontVector:y() - rearVector:y()
	local wind = getClimateManager():getWindAngleDegrees()
	local boatDirection = math.atan2(x,y) * 57.2958 + 180
	local newwind = 0
	local windOnBoat = 0
	if wind > boatDirection then
		windOnBoat = wind - boatDirection
	else
		windOnBoat = 360 - (boatDirection - wind)
	end
	if windOnBoat <= 180 then
		newwind = (180 - windOnBoat)/360
	else
		newwind = (540 - windOnBoat)/360
	end
	self.windGauge:setValue(newwind)
	
	local sailAngle = self.boat:getModData()["sailAngle"]
	if sailAngle == nil then
		sailAngle = 0
	end
	sailAngle = (sailAngle + 90)/180
	self.sailGauge:setValue(sailAngle)	
	
	local windSpeed = getClimateManager():getWindspeedKph()
	if not self.boat:getModData()["SpeedValueKph"] then
		windSpeed = windSpeed/1.60934
	end
	if windSpeed > 99 then windSpeed = 99 end
	self.setWindSpeedValue(self, windSpeed)
	--test = self.arrowWindTex
	--self.arrowWindTex.DrawTextureAngle(self.windGaugeArrowTex, 4, 4, newwind);
	--self.arrowWindTex.texture = self.windGaugeArrowTex
	--ISUIElement.render(self)
end
		
function ISNewSalingBoatDashboard:render()

end

function ISNewSalingBoatDashboard:ISNewSalingBoatDashboard()
	return true
end

function ISNewSalingBoatDashboard:onResolutionChange()

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
end

function ISNewSalingBoatDashboard:new(playerNum, chr)
	local o = ISPanel:new(300, 0, 300, 300)
	setmetatable(o, self)
	self.__index = self
	o.playerNum = playerNum
	o.character = chr;
	o.gauges = {}
	o.dashboardBG = getTexture("media/ui/boats/newsalingdashboard/boat_dashboard.png")
	o.windGaugeTex = getTexture("media/ui/boats/newsalingdashboard/boat_wind.png")
	o.speedGaugeTex = getTexture("media/ui/boats/newsalingdashboard/boat_speed_panel.png")
	o.speedGaugeTexNull = getTexture("media/ui/boats/newsalingdashboard/boat_null.png")
	o.speedGaugeTexPoint = getTexture("media/ui/boats/newsalingdashboard/boat_point.png")
	o.speedGaugesTex = {getTexture("media/ui/boats/newsalingdashboard/boat_0.png"), getTexture("media/ui/boats/newsalingdashboard/boat_1.png"),getTexture("media/ui/boats/newsalingdashboard/boat_2.png"),getTexture("media/ui/boats/newsalingdashboard/boat_3.png"),getTexture("media/ui/boats/newsalingdashboard/boat_4.png"),getTexture("media/ui/boats/newsalingdashboard/boat_5.png"),getTexture("media/ui/boats/newsalingdashboard/boat_6.png"),getTexture("media/ui/boats/newsalingdashboard/boat_7.png"),getTexture("media/ui/boats/newsalingdashboard/boat_8.png"),getTexture("media/ui/boats/newsalingdashboard/boat_9.png")}
	o.windGaugeArrowTex = getTexture("media/ui/boats/newsalingdashboard/boat_wind_arrow.png")
	o.speedValueKph = getTexture("media/ui/boats/newsalingdashboard/boat_speed_kph.png")
	o.speedValueMph = getTexture("media/ui/boats/newsalingdashboard/boat_speed_mph.png")
	o.flickingTimer = 0;
	o:setWidth(o.dashboardBG:getWidth());
	return o
end