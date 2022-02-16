function HN_IndicatorInitialise()
		if getPlayer() == nil then
				return
		end
		getPlayer():getModData().HN_Indicator = HN_IndicatorNew(getCore():getScreenWidth() - 210, 12, 32, 32, Texture.getSharedTexture("media/ui/Moodle_HNzombie.png") );
		HN_IndicatorUpdate();
end

function HN_IndicatorNew(x, y, width, height, texture)
    local self = {};
    self.image = ISImage:new( x, y, width, height, texture);
    self.image:initialise();
    self.image:setVisible(false);
    self.image:addToUIManager();
    return self
end

function HN_IndicatorUpdate()
		if getPlayer() == nil then
				return
		end
		local HN_Indicator = getPlayer():getModData().HN_Indicator;
		if HN_Indicator ~= nil then
				--Is the sandbox value true?
				local isEnableIndictor = SandboxVars.HordeNightMain.HordeNightIndicator;
				if isEnableIndictor == false then
						print("HN Indicator not on, don't show the indicator.");
						return
				end
				--Is the horde night day?
				local isTheHordeNightDay = false;
				local HNdaysPass = math.floor(HN_getActualSpawnAgeDay());
				if HNdaysPass >= SandboxVars.HordeNightMain.FirstHordeNightDay then
						if (HNdaysPass - SandboxVars.HordeNightMain.FirstHordeNightDay) % SandboxVars.HordeNightMain.HordeNightFrequency == 0 then
								isTheHordeNightDay = true;
						end
				end
				--set visible if all true
				if isTheHordeNightDay then
					print("it's the horde night day and Indicotor on, show the indicator.");
					HN_Indicator.image:setVisible(true);
				else
					print("not the horde night day, do not show the indicator.");
					HN_Indicator.image:setVisible(false);
				end
		else
				print("Indicator is nil for some reason.");
		end
end

Events.EveryDays.Add(HN_IndicatorUpdate)
Events.OnGameStart.Add(HN_IndicatorInitialise);