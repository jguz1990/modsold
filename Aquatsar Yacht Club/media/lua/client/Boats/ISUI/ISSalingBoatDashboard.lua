


ISSalingBoatDashboard = ISPanel:derive("ISSalingBoatDashboard")

function ISSalingBoatDashboard:createChildren()
	self.backgroundTex = ISImage:new(1000,350, self.dashboardBG:getWidth(), self.dashboardBG:getHeight(), self.dashboardBG);
	self.backgroundTex:initialise();
	self.backgroundTex:instantiate();
	self:addChild(self.backgroundTex);

	local x = 947
	local y = 67
	self.speedGauge = ISVehicleGauge:new(x, y, self.speedGaugeTex, 73, 71, -225, 0) -- красная полоска скорости
	self.speedGauge:initialise()
	self.speedGauge:instantiate()
	self:addChild(self.speedGauge)
	
	x = 90
	y = 50
	self.windGauge = ISVehicleGauge:new(x, y, self.windGaugeTex, 125, 125, -270, 90) -- красная полоска (x, y, angle start, angle finish)
	self.windGauge:initialise()
	self.windGauge:instantiate()
	self.windGauge:setNeedleWidth(100)
	self:addChild(self.windGauge)
	
	self.windSpeedGauge = ISVehicleGauge:new(x, y, self.sailGaugeTex, 125, 125, -138, -42) -- красная полоска (x, y, angle start, angle finish)
	self.windSpeedGauge:initialise()
	self.windSpeedGauge:instantiate()
	self.windSpeedGauge:setNeedleWidth(50)
	self:addChild(self.windSpeedGauge)
	
	self.sailGauge = ISVehicleGauge:new(x, y, self.sailGaugeTex, 125, 125, 0, 180) -- красная полоска (x, y, angle start, angle finish)
	self.sailGauge:initialise()
	self.sailGauge:instantiate()
	self.sailGauge:setNeedleWidth(50)
	self:addChild(self.sailGauge)
	
	

	self:onResolutionChange()
end

function ISSalingBoatDashboard:getAlphaFlick(default)
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

function ISSalingBoatDashboard:setVehicle(boat)
	self.boat = boat
	for _,gauge in ipairs(self.gauges) do
		gauge:setVisible(false)
	end
	self.gauges = {}
	if not boat then
		self:removeFromUIManager()
		return
	end
	
	self.speedGauge:setVisible(true)
	table.insert(self.gauges, self.speedGauge)
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

function ISSalingBoatDashboard:prerender()
	if not self.boat or not ISUIHandler.allUIVisible then return end
	local alpha = self:getAlphaFlick(0.65);
	local greyBg = {r=0.5, g=0.5, b=0.5, a=alpha};
	local speedValue = math.max(0,math.min(1,math.abs(self.boat:getCurrentSpeedKmHour())/138));
	self.speedGauge:setValue(speedValue * BaseVehicle.getFakeSpeedModifier())

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
		self.windGauge:setValue((180 - windOnBoat)/360)
	else
		self.windGauge:setValue((540 - windOnBoat)/360)
	end
	
	local sailAngle = self.boat:getModData()["sailAngle"]
	if sailAngle == nil then
		sailAngle = 15
	end
	sailAngle = (sailAngle + 90)/180
	self.sailGauge:setValue(sailAngle)
	
	local windSpeed = getClimateManager():getWindIntensity()*getClimateManager():getMaxWindspeedKph()
	if windSpeed > 100 then windSpeed = 100 end
	self.windSpeedGauge:setValue(windSpeed/100)
	
end
		
function ISSalingBoatDashboard:render()

end

function ISSalingBoatDashboard:ISSalingBoatDashboard()
	return true
end

function ISSalingBoatDashboard:onResolutionChange()

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

function ISSalingBoatDashboard:new(playerNum, chr)
	local o = ISPanel:new(1000, 1000, 2000, 2000)
	setmetatable(o, self)
	self.__index = self
	o.playerNum = playerNum
	o.character = chr;
	o.gauges = {}
	o.dashboardBG = getTexture("media/ui/boats/salingdashboard/boat_dashboard.png");
	o.speedGaugeTex = getTexture("media/ui/boats/salingdashboard/boat_spedometer.png")
	o.windGaugeTex = getTexture("media/ui/boats/salingdashboard/boat_wind.png")
	o.sailGaugeTex = getTexture("media/ui/boats/salingdashboard/boat_sail.png")
	o.flickingTimer = 0;
	o:setWidth(o.dashboardBG:getWidth());
	return o
end