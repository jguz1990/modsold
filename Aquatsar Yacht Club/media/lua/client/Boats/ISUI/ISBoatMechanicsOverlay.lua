--
-- Created by IntelliJ IDEA.
-- User: RJ
-- Date: 25/01/2018
-- Time: 09:20
-- To change this template use File | Settings | File Templates.
--

--
-- Edit by Notepad++.
-- User: iBrRus
-- Date: 01/12/2020
-- Time: 22:18
--

ISBoatMechanicsOverlay = {};
ISBoatMechanicsOverlay.BoatList = {};
ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"] = {imgPrefix = "salingboatWS_", x=10,y=-30};
-- ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"] = {imgPrefix = "salingboatWS_", x=10,y=-30};
-- ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYachtWithSailsRight"] = {imgPrefix = "salingboatWS_", x=10,y=-30};
ISBoatMechanicsOverlay.BoatList["Base.BoatMotor"] = {imgPrefix = "motorboat_", x=10,y=-30};

ISBoatMechanicsOverlay.PartList = {};
ISBoatMechanicsOverlay.PartList["Sails"] = {img="sails", vehicles={}};
ISBoatMechanicsOverlay.PartList["Sails"].vehicles["salingboatWS_"] = {x=72+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y=93+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y,x2=131+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y2=260+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y};


ISBoatMechanicsOverlay.PartList["Battery"] = {img="battery", vehicles={}};
-- ISBoatMechanicsOverlay.PartList["Battery"].vehicles["salingboat_"] = {x=4+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y=373+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y,x2=47+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y2=403+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y};
ISBoatMechanicsOverlay.PartList["Battery"].vehicles["salingboatWS_"] = {x=4+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y=373+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y,x2=47+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y2=403+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y};
ISBoatMechanicsOverlay.PartList["Battery"].vehicles["motorboat_"] = {x=4+ISBoatMechanicsOverlay.BoatList["Base.BoatMotor"].x,y=373+ISBoatMechanicsOverlay.BoatList["Base.BoatMotor"].y,x2=47+ISBoatMechanicsOverlay.BoatList["Base.BoatMotor"].x,y2=403+ISBoatMechanicsOverlay.BoatList["Base.BoatMotor"].y};


ISBoatMechanicsOverlay.PartList["Engine"] = {img="engine", vehicles = {}};
-- ISBoatMechanicsOverlay.PartList["Engine"].vehicles["salingboat_"] = {x=5+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y=500+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y,x2=86+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y2=550+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y};
ISBoatMechanicsOverlay.PartList["Engine"].vehicles["salingboatWS_"] = {x=5+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y=500+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y,x2=86+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y2=550+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y};
ISBoatMechanicsOverlay.PartList["Engine"].vehicles["motorboat_"] = {x=6+ISBoatMechanicsOverlay.BoatList["Base.BoatMotor"].x,y=523+ISBoatMechanicsOverlay.BoatList["Base.BoatMotor"].y,x2=86+ISBoatMechanicsOverlay.BoatList["Base.BoatMotor"].x,y2=573+ISBoatMechanicsOverlay.BoatList["Base.BoatMotor"].y};

ISBoatMechanicsOverlay.PartList["GasTank"] = {img="gastank", vehicles = {}};
-- ISBoatMechanicsOverlay.PartList["GasTank"].vehicles["salingboat_"] = {x=186+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y=500+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y,x2=255+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y2=550+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y};
ISBoatMechanicsOverlay.PartList["GasTank"].vehicles["salingboatWS_"] = {x=186+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y=500+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y,x2=255+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y2=550+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y};
ISBoatMechanicsOverlay.PartList["GasTank"].vehicles["motorboat_"] = {x=186+ISBoatMechanicsOverlay.BoatList["Base.BoatMotor"].x,y=526+ISBoatMechanicsOverlay.BoatList["Base.BoatMotor"].y,x2=255+ISBoatMechanicsOverlay.BoatList["Base.BoatMotor"].x,y2=572+ISBoatMechanicsOverlay.BoatList["Base.BoatMotor"].y};

ISBoatMechanicsOverlay.PartList["LightFloodlightLeft"] = {img="headlight_left", vehicles = {}};
-- ISBoatMechanicsOverlay.PartList["LightFloodlightLeft"].vehicles["salingboat_"] = {x=103+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y=260+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y,x2=112+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y2=277+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y};
ISBoatMechanicsOverlay.PartList["LightFloodlightLeft"].vehicles["salingboatWS_"] = {x=103+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y=260+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y,x2=112+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y2=277+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y};
ISBoatMechanicsOverlay.PartList["LightFloodlightLeft"].vehicles["motorboat_"] = {x=127+ISBoatMechanicsOverlay.BoatList["Base.BoatMotor"].x,y=279+ISBoatMechanicsOverlay.BoatList["Base.BoatMotor"].y,x2=135+ISBoatMechanicsOverlay.BoatList["Base.BoatMotor"].x,y2=292+ISBoatMechanicsOverlay.BoatList["Base.BoatMotor"].y};

ISBoatMechanicsOverlay.PartList["LightFloodlightRight"] = {img="headlight_right", vehicles = {}};
-- ISBoatMechanicsOverlay.PartList["LightFloodlightRight"].vehicles["salingboat_"] = {x=150+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y=260+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y,x2=159+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y2=277+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y};
ISBoatMechanicsOverlay.PartList["LightFloodlightRight"].vehicles["salingboatWS_"] = {x=150+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y=260+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y,x2=159+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y2=277+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y};

ISBoatMechanicsOverlay.PartList["WindowFrontLeft"] = {img="window_front_left", vehicles = {}};
-- ISBoatMechanicsOverlay.PartList["WindowFrontLeft"].vehicles["salingboat_"] = {x=84+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y=289+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y,x2=92+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y2=304+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y};
ISBoatMechanicsOverlay.PartList["WindowFrontLeft"].vehicles["salingboatWS_"] = {x=84+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y=289+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y,x2=92+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y2=304+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y};
ISBoatMechanicsOverlay.PartList["WindowFrontLeft"].vehicles["motorboat_"] = {x=84+ISBoatMechanicsOverlay.BoatList["Base.BoatMotor"].x,y=270+ISBoatMechanicsOverlay.BoatList["Base.BoatMotor"].y,x2=98+ISBoatMechanicsOverlay.BoatList["Base.BoatMotor"].x,y2=315+ISBoatMechanicsOverlay.BoatList["Base.BoatMotor"].y};

ISBoatMechanicsOverlay.PartList["WindowFrontRight"] = {img="window_front_right", vehicles = {}};
-- ISBoatMechanicsOverlay.PartList["WindowFrontRight"].vehicles["salingboat_"] = {x=169+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y=289+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y,x2=178+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y2=304+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y};
ISBoatMechanicsOverlay.PartList["WindowFrontRight"].vehicles["salingboatWS_"] = {x=169+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y=289+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y,x2=178+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y2=304+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y};
ISBoatMechanicsOverlay.PartList["WindowFrontRight"].vehicles["motorboat_"] = {x=164+ISBoatMechanicsOverlay.BoatList["Base.BoatMotor"].x,y=270+ISBoatMechanicsOverlay.BoatList["Base.BoatMotor"].y,x2=177+ISBoatMechanicsOverlay.BoatList["Base.BoatMotor"].x,y2=315+ISBoatMechanicsOverlay.BoatList["Base.BoatMotor"].y};

ISBoatMechanicsOverlay.PartList["WindowRearLeft"] = {img="window_rear_left", vehicles = {}};
-- ISBoatMechanicsOverlay.PartList["WindowRearLeft"].vehicles["salingboat_"] = {x=79+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y=320+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y,x2=87+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y2=340+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y};
ISBoatMechanicsOverlay.PartList["WindowRearLeft"].vehicles["salingboatWS_"] = {x=79+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y=320+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y,x2=87+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y2=340+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y};
ISBoatMechanicsOverlay.PartList["WindowRearLeft"].vehicles["motorboat_"] = {x=82+ISBoatMechanicsOverlay.BoatList["Base.BoatMotor"].x,y=327+ISBoatMechanicsOverlay.BoatList["Base.BoatMotor"].y,x2=88+ISBoatMechanicsOverlay.BoatList["Base.BoatMotor"].x,y2=379+ISBoatMechanicsOverlay.BoatList["Base.BoatMotor"].y};

ISBoatMechanicsOverlay.PartList["WindowRearRight"] = {img="window_rear_right", vehicles = {}};
-- ISBoatMechanicsOverlay.PartList["WindowRearRight"].vehicles["salingboat_"] = {x=174+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y=320+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y,x2=182+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y2=340+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y};
ISBoatMechanicsOverlay.PartList["WindowRearRight"].vehicles["salingboatWS_"] = {x=174+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y=320+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y,x2=182+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y2=340+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y};
ISBoatMechanicsOverlay.PartList["WindowRearRight"].vehicles["motorboat_"] = {x=174+ISBoatMechanicsOverlay.BoatList["Base.BoatMotor"].x,y=327+ISBoatMechanicsOverlay.BoatList["Base.BoatMotor"].y,x2=180+ISBoatMechanicsOverlay.BoatList["Base.BoatMotor"].x,y2=379+ISBoatMechanicsOverlay.BoatList["Base.BoatMotor"].y};

ISBoatMechanicsOverlay.PartList["Windshield"] = {img="window_windshield", vehicles = {}};
-- ISBoatMechanicsOverlay.PartList["Windshield"].vehicles["salingboat_"] = {x=120+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y=214+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y,x2=140+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y2=237+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y};
ISBoatMechanicsOverlay.PartList["Windshield"].vehicles["salingboatWS_"] = {x=132+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y=214+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y,x2=140+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y2=237+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y};
ISBoatMechanicsOverlay.PartList["Windshield"].vehicles["motorboat_"] = {x=101+ISBoatMechanicsOverlay.BoatList["Base.BoatMotor"].x,y=246+ISBoatMechanicsOverlay.BoatList["Base.BoatMotor"].y,x2=160+ISBoatMechanicsOverlay.BoatList["Base.BoatMotor"].x,y2=273+ISBoatMechanicsOverlay.BoatList["Base.BoatMotor"].y};

ISBoatMechanicsOverlay.PartList["Propeller"] = {img="propeller", vehicles = {}};
-- ISBoatMechanicsOverlay.PartList["Propeller"].vehicles["salingboat_"] = {x=106+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y=538+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y,x2=157+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y2=589+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y};
ISBoatMechanicsOverlay.PartList["Propeller"].vehicles["salingboatWS_"] = {x=106+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y=538+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y,x2=157+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].x,y2=589+ISBoatMechanicsOverlay.BoatList["Base.BoatSailingYacht"].y};
ISBoatMechanicsOverlay.PartList["Propeller"].vehicles["motorboat_"] = {x=106+ISBoatMechanicsOverlay.BoatList["Base.BoatMotor"].x,y=538+ISBoatMechanicsOverlay.BoatList["Base.BoatMotor"].y,x2=157+ISBoatMechanicsOverlay.BoatList["Base.BoatMotor"].x,y2=589+ISBoatMechanicsOverlay.BoatList["Base.BoatMotor"].y};

