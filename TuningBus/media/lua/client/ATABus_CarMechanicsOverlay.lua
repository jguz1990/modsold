ISCarMechanicsOverlay.CarList["Base.ATAArmyBus"] = {imgPrefix = "atabus_", x=0,y=0};
ISCarMechanicsOverlay.CarList["Base.ATAPrisonBus"] = {imgPrefix = "atabus_", x=0,y=0};
ISCarMechanicsOverlay.CarList["Base.ATASchoolBus"] = {imgPrefix = "atabus_", x=0,y=0};

if not ISCarMechanicsOverlay.PartList["Engine"].vehicles then
	ISCarMechanicsOverlay.PartList["Engine"].vehicles = {}
end
ISCarMechanicsOverlay.PartList["Engine"].vehicles["atabus_"] = {x=85,y=20,x2=185,y2=80};
ISCarMechanicsOverlay.PartList["EngineDoor"].vehicles["atabus_"] = {x=90,y=110,x2=175,y2=180};
ISCarMechanicsOverlay.PartList["Battery"].vehicles["atabus_"] = {x=205,y=20,x2=255,y2=55};
if not ISCarMechanicsOverlay.PartList["GasTank"].vehicles then
	ISCarMechanicsOverlay.PartList["GasTank"].vehicles = {}
end
ISCarMechanicsOverlay.PartList["GasTank"].vehicles["atabus_"] = {x=5,y=20,x2=65,y2=110};

if not ISCarMechanicsOverlay.PartList["Muffler"].vehicles then
	ISCarMechanicsOverlay.PartList["Muffler"].vehicles = {}
end

ISCarMechanicsOverlay.PartList["TireFrontLeft"].vehicles["atabus_"] = {x=55,y=120,x2=65,y2=180};
ISCarMechanicsOverlay.PartList["TireFrontRight"].vehicles["atabus_"] = {x=200,y=120,x2=210,y2=180};
ISCarMechanicsOverlay.PartList["TireRearLeft"].vehicles["atabus_"] = {x=55,y=390,x2=65,y2=450};
ISCarMechanicsOverlay.PartList["TireRearRight"].vehicles["atabus_"] = {x=200,y=390,x2=210,y2=450};

if not ISCarMechanicsOverlay.PartList["SuspensionFrontLeft"].vehicles then
	ISCarMechanicsOverlay.PartList["SuspensionFrontLeft"].vehicles = {}
end
if not ISCarMechanicsOverlay.PartList["SuspensionFrontRight"].vehicles then
	ISCarMechanicsOverlay.PartList["SuspensionFrontRight"].vehicles = {}
end
ISCarMechanicsOverlay.PartList["SuspensionFrontLeft"].vehicles["atabus_"] = {x=5,y=115,x2=50,y2=150};
ISCarMechanicsOverlay.PartList["SuspensionFrontRight"].vehicles["atabus_"] = {x=220,y=115,x2=260,y2=150};
ISCarMechanicsOverlay.PartList["SuspensionRearLeft"].vehicles["atabus_"] = {x=5,y=380,x2=50,y2=415};
ISCarMechanicsOverlay.PartList["SuspensionRearRight"].vehicles["atabus_"] = {x=220,y=380,x2=260,y2=415};

if not ISCarMechanicsOverlay.PartList["BrakeFrontLeft"].vehicles then
	ISCarMechanicsOverlay.PartList["BrakeFrontLeft"].vehicles = {}
end
if not ISCarMechanicsOverlay.PartList["BrakeFrontRight"].vehicles then
	ISCarMechanicsOverlay.PartList["BrakeFrontRight"].vehicles = {}
end
ISCarMechanicsOverlay.PartList["BrakeFrontLeft"].vehicles["atabus_"] = {x=5,y=150,x2=50,y2=190};
ISCarMechanicsOverlay.PartList["BrakeFrontRight"].vehicles["atabus_"] = {x=220,y=150,x2=260,y2=190};
ISCarMechanicsOverlay.PartList["BrakeRearLeft"].vehicles["atabus_"] = {x=5,y=415,x2=50,y2=455};
ISCarMechanicsOverlay.PartList["BrakeRearRight"].vehicles["atabus_"] = {x=220,y=415,x2=260,y2=455};

ISCarMechanicsOverlay.PartList["Windshield"].vehicles["atabus_"] = {x=75,y=180,x2=190,y2=190};
ISCarMechanicsOverlay.PartList["WindshieldRear"].vehicles["atabus_"] = {x=75,y=525,x2=190,y2=535};

ISCarMechanicsOverlay.PartList["Muffler"].vehicles["atabus_"] = {x=215,y=510,x2=255,y2=580};

ISCarMechanicsOverlay.PartList["DoorFrontRight"].vehicles["atabus_"] = {x=190,y=205,x2=200,y2=245};
ISCarMechanicsOverlay.PartList["WindowFrontLeft"].vehicles["atabus_"] = {x=65,y=205,x2=75,y2=245};
ISCarMechanicsOverlay.PartList["WindowRearLeft"].vehicles["atabus_"] = {x=65,y=250,x2=75,y2=495};
ISCarMechanicsOverlay.PartList["WindowRearRight"].vehicles["atabus_"] = {x=190,y=250,x2=200,y2=495};
