--***********************************************************
--**                   KI5 / bikinihorst                   **
--***********************************************************

M101A3 = {
	parts = {
		Cover = {
			M101A3Cover = {
				Cover1 = "M101A3Cover1_Item",
			},
		},
		Tarp = {
			M101A3Tarp = {
				Tarp1 = "M101A3Tarp1_Item",
			},
		},
		Spare = {
			M101A3Spare = {
				Spare1 = "M998SpareTireMount_Item",
			},
		},
	},
};

M101A3.parts.Cover.default = M101A3.parts.Cover.M101A3Cover.Cover1;

KI5:createVehicleConfig(M101A3);