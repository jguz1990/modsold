local function info()
--this chunk here is hell, i hate it so much, gas tank is a piece of...

ISCarMechanicsOverlay.CarList["Base.86oshkoshUSMC"] = {imgPrefix = "86oshkoshUSMC_", x=10,y=0};
--
ISCarMechanicsOverlay.PartList["Battery"].vehicles = ISCarMechanicsOverlay.PartList["Battery"].vehicles or {};
ISCarMechanicsOverlay.PartList["Battery"].vehicles["86oshkoshUSMC_"] = {img="battery", x=13 ,y=234,x2=58,y2=267};
--
ISCarMechanicsOverlay.PartList["SuspensionFrontLeft"].vehicles = ISCarMechanicsOverlay.PartList["SuspensionFrontLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["SuspensionFrontLeft"].vehicles["86oshkoshUSMC_"] = {img="suspension_front_left", x=13,y=148,x2=55,y2=186};
ISCarMechanicsOverlay.PartList["SuspensionFrontRight"].vehicles = ISCarMechanicsOverlay.PartList["SuspensionFrontRight"].vehicles or {};
ISCarMechanicsOverlay.PartList["SuspensionFrontRight"].vehicles["86oshkoshUSMC_"] = {img="suspension_front_right", x=229,y=148,x2=270,y2=186};
ISCarMechanicsOverlay.PartList["SuspensionRearLeft"].vehicles = ISCarMechanicsOverlay.PartList["SuspensionRearLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["SuspensionRearLeft"].vehicles["86oshkoshUSMC_"] = {img="suspension_rear_left", x=13,y=382,x2=55,y2=419};
ISCarMechanicsOverlay.PartList["SuspensionRearRight"].vehicles = ISCarMechanicsOverlay.PartList["SuspensionRearRight"].vehicles or {};
ISCarMechanicsOverlay.PartList["SuspensionRearRight"].vehicles["86oshkoshUSMC_"] = {img="suspension_rear_right", x=229,y=382,x2=270,y2=419};
-- 
ISCarMechanicsOverlay.PartList["BrakeFrontLeft"].vehicles = ISCarMechanicsOverlay.PartList["BrakeFrontLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["BrakeFrontLeft"].vehicles["86oshkoshUSMC_"] = {img="brake_front_left", x=13,y=186,x2=55,y2=223};
ISCarMechanicsOverlay.PartList["BrakeFrontRight"].vehicles = ISCarMechanicsOverlay.PartList["BrakeFrontRight"].vehicles or {};
ISCarMechanicsOverlay.PartList["BrakeFrontRight"].vehicles["86oshkoshUSMC_"] = {img="brake_front_right", x=229,y=186,x2=270,y2=223};
ISCarMechanicsOverlay.PartList["BrakeRearLeft"].vehicles = ISCarMechanicsOverlay.PartList["BrakeRearLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["BrakeRearLeft"].vehicles["86oshkoshUSMC_"] = {img="brake_rear_left", x=13,y=419,x2=55,y2=457};
ISCarMechanicsOverlay.PartList["BrakeRearRight"].vehicles = ISCarMechanicsOverlay.PartList["BrakeRearRight"].vehicles or {};
ISCarMechanicsOverlay.PartList["BrakeRearRight"].vehicles["86oshkoshUSMC_"] = {img="brake_rear_right", x=229,y=419,x2=270,y2=457};
--
ISCarMechanicsOverlay.PartList["DoorFrontLeft"].vehicles = ISCarMechanicsOverlay.PartList["DoorFrontLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["DoorFrontLeft"].vehicles["86oshkoshUSMC_"] = {x=64,y=111,x2=70,y2=153};
ISCarMechanicsOverlay.PartList["DoorFrontRight"].vehicles = ISCarMechanicsOverlay.PartList["DoorFrontRight"].vehicles or {};
ISCarMechanicsOverlay.PartList["DoorFrontRight"].vehicles["86oshkoshUSMC_"] = {x=213,y=111,x2=220,y2=153};
--
ISCarMechanicsOverlay.PartList["roofHatch"].vehicles = ISCarMechanicsOverlay.PartList["roofHatch"].vehicles or {};
ISCarMechanicsOverlay.PartList["roofHatch"].vehicles["86oshkoshUSMC_"] = {img="roofHatch", x=140,y=113,x2=187,y2=153};
--
ISCarMechanicsOverlay.PartList["Engine"].vehicles = ISCarMechanicsOverlay.PartList["Engine"].vehicles or {};
ISCarMechanicsOverlay.PartList["Engine"].vehicles["86oshkoshUSMC_"] = {x=168,y=521,x2=270,y2=583};
--
ISCarMechanicsOverlay.PartList["EngineDoor"].vehicles = ISCarMechanicsOverlay.PartList["EngineDoor"].vehicles or {};
ISCarMechanicsOverlay.PartList["EngineDoor"].vehicles["86oshkoshUSMC_"] = {img="hood", x=102,y=411,x2=182,y2=474};
--
ISCarMechanicsOverlay.PartList["HeadlightLeft"].vehicles = ISCarMechanicsOverlay.PartList["HeadlightLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["HeadlightLeft"].vehicles["86oshkoshUSMC_"] = {x=70,y=64,x2=90,y2=68};
ISCarMechanicsOverlay.PartList["HeadlightRight"].vehicles = ISCarMechanicsOverlay.PartList["HeadlightRight"].vehicles or {};
ISCarMechanicsOverlay.PartList["HeadlightRight"].vehicles["86oshkoshUSMC_"] = {x=194,y=64,x2=213,y2=68};
--
ISCarMechanicsOverlay.PartList["Muffler"].vehicles = ISCarMechanicsOverlay.PartList["Muffler"].vehicles or {};
ISCarMechanicsOverlay.PartList["Muffler"].vehicles["86oshkoshUSMC_"] = {x=118,y=521,x2=155,y2=590};
--
ISCarMechanicsOverlay.PartList["TireFrontLeft"].vehicles = ISCarMechanicsOverlay.PartList["TireFrontLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["TireFrontLeft"].vehicles["86oshkoshUSMC_"] = {x=64,y=153,x2=70,y2=217};
ISCarMechanicsOverlay.PartList["TireFrontRight"].vehicles = ISCarMechanicsOverlay.PartList["TireFrontRight"].vehicles or {};
ISCarMechanicsOverlay.PartList["TireFrontRight"].vehicles["86oshkoshUSMC_"] = {x=213,y=153,x2=220,y2=217};
ISCarMechanicsOverlay.PartList["TireRearLeft"].vehicles = ISCarMechanicsOverlay.PartList["TireRearLeft"].vehicles or {};
ISCarMechanicsOverlay.PartList["TireRearLeft"].vehicles["86oshkoshUSMC_"] = {x=64,y=387,x2=70,y2=452};
ISCarMechanicsOverlay.PartList["TireRearRight"].vehicles = ISCarMechanicsOverlay.PartList["TireRearRight"].vehicles or {};
ISCarMechanicsOverlay.PartList["TireRearRight"].vehicles["86oshkoshUSMC_"] = {x=213,y=387,x2=220,y2=452};
--
ISCarMechanicsOverlay.PartList["P19ABigTrunkCompartment0"] = {img="trunk", vehicles = {"86oshkoshUSMC_"}};
ISCarMechanicsOverlay.PartList["P19ABigTrunkCompartment0"].vehicles = ISCarMechanicsOverlay.PartList["P19ABigTrunkCompartment0"].vehicles or {};
ISCarMechanicsOverlay.PartList["P19ABigTrunkCompartment0"].vehicles["86oshkoshUSMC_"] = {x=213,y=246,x2=218,y2=373};
--
ISCarMechanicsOverlay.PartList["Windshield"].vehicles = ISCarMechanicsOverlay.PartList["Windshield"].vehicles or {};
ISCarMechanicsOverlay.PartList["Windshield"].vehicles["86oshkoshUSMC_"] = {x=74,y=77,x2=210,y2=90};
--

end


Events.OnInitWorld.Add(info);