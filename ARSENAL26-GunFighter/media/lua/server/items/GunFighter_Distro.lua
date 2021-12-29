
Distributions = Distributions or {};

local distributionTable = {
--------------------------------------------------
--	50 CALIBER AMMO-CAN CONTENTS		--
--------------------------------------------------
    AmmoCan50_223 = {
        rolls = 10,
        items = {
            "223Box",		200,
            "223Box",		200,
            "223Box",		200,
            "223Box",		200,
            "223Box",		200,
            "223Box",		200,
            "223Box",		200,
            "223Box",		200,
            "223Box",		200,
            "223Box",		200,
        },
    },
    AmmoCan50_556 = {
        rolls = 10,
        items = {
            "556Box",		200,
            "556Box",		200,
            "556Box",		200,
            "556Box",		200,
            "556Box",		200,
            "556Box",		200,
            "556Box",		200,
            "556Box",		200,
            "556Box",		200,
            "556Box",		200,
        },
    },
    AmmoCan50_545x39 = {
        rolls = 9,
        items = {
            "545x39Box",	200,
            "545x39Box",	200,
            "545x39Box",	200,
            "545x39Box",	200,
            "545x39Box",	200,
            "545x39Box",	200,
            "545x39Box",	200,
            "545x39Box",	200,
            "545x39Box",	200,
            "545x39Box",	200,
        },
    },
    AmmoCan50_762x39 = {
        rolls = 9,
        items = {
            "762x39Box",	200,
            "762x39Box",	200,
            "762x39Box",	200,
            "762x39Box",	200,
            "762x39Box",	200,
            "762x39Box",	200,
            "762x39Box",	200,
            "762x39Box",	200,
            "762x39Box",	200,
            "762x39Box",	200,
        },
    },
    AmmoCan50_308 = {
        rolls = 8,
        items = {
            "308Box",		200,
            "308Box",		200,
            "308Box",		200,
            "308Box",		200,
            "308Box",		200,
            "308Box",		200,
            "308Box",		200,
            "308Box",		200,
            "308Box",		200,
            "308Box",		200,
        },
    },
    AmmoCan50_762x51 = {
        rolls = 8,
        items = {
            "762x51Box",	200,
            "762x51Box",	200,
            "762x51Box",	200,
            "762x51Box",	200,
            "762x51Box",	200,
            "762x51Box",	200,
            "762x51Box",	200,
            "762x51Box",	200,
            "762x51Box",	200,
            "762x51Box",	200,
        },
    },
    AmmoCan50_762x54r = {
        rolls = 8,
        items = {
            "762x54rBox",	200,
            "762x54rBox",	200,
            "762x54rBox",	200,
            "762x54rBox",	200,
            "762x54rBox",	200,
            "762x54rBox",	200,
            "762x54rBox",	200,
            "762x54rBox",	200,
            "762x54rBox",	200,
            "762x54rBox",	200,
        },
    },
    AmmoCan50_3006 = {
        rolls = 8,
        items = {
            "3006Box",		200,
            "3006Box",		200,
            "3006Box",		200,
            "3006Box",		200,
            "3006Box",		200,
            "3006Box",		200,
            "3006Box",		200,
            "3006Box",		200,
            "3006Box",		200,
            "3006Box",		200,
        },
    },
    AmmoCan50_50 = {
        rolls = 6,
        items = {
            "50BMGBox",		200,
            "50BMGBox",		200,
            "50BMGBox",		200,
            "50BMGBox",		200,
            "50BMGBox",		200,
            "50BMGBox",		200,
            "50BMGBox",		200,
            "50BMGBox",		200,
            "50BMGBox",		200,
            "50BMGBox",		200,
        },
    },
    AmmoCan50_410 = {
        rolls = 5,
        items = {
            "410gShotgunShellsBox", 200,
            "410gShotgunShellsBox", 200,
            "410gShotgunShellsBox", 200,
            "410gShotgunShellsBox", 200,
            "410gShotgunShellsBox", 200,
            "410gShotgunShellsBox", 200,
            "410gShotgunShellsBox", 200,
            "410gShotgunShellsBox", 200,
            "410gShotgunShellsBox", 200,
            "410gShotgunShellsBox", 200,
        },
    },
    AmmoCan50_20 = {
        rolls = 5,
        items = {
            "20gShotgunShellsBox", 200,
            "20gShotgunShellsBox", 200,
            "20gShotgunShellsBox", 200,
            "20gShotgunShellsBox", 200,
            "20gShotgunShellsBox", 200,
            "20gShotgunShellsBox", 200,
            "20gShotgunShellsBox", 200,
            "20gShotgunShellsBox", 200,
            "20gShotgunShellsBox", 200,
            "20gShotgunShellsBox", 200,
        },
    },
    AmmoCan50_12 = {
        rolls = 5,
        items = {
            "ShotgunShellsBox", 200,
            "ShotgunShellsBox", 200,
            "ShotgunShellsBox", 200,
            "ShotgunShellsBox", 200,
            "ShotgunShellsBox", 200,
            "ShotgunShellsBox", 200,
            "ShotgunShellsBox", 200,
            "ShotgunShellsBox", 200,
            "ShotgunShellsBox", 200,
            "ShotgunShellsBox", 200,
        },
    },
    AmmoCan50_10 = {
        rolls = 5,
        items = {
            "10gShotgunShellsBox", 200,
            "10gShotgunShellsBox", 200,
            "10gShotgunShellsBox", 200,
            "10gShotgunShellsBox", 200,
            "10gShotgunShellsBox", 200,
            "10gShotgunShellsBox", 200,
            "10gShotgunShellsBox", 200,
            "10gShotgunShellsBox", 200,
            "10gShotgunShellsBox", 200,
            "10gShotgunShellsBox", 200,
        },
    },
    AmmoCan50_4 = {
        rolls = 6,
        items = {
            "4gShotgunShellsBox", 200,
            "4gShotgunShellsBox", 200,
            "4gShotgunShellsBox", 200,
            "4gShotgunShellsBox", 200,
            "4gShotgunShellsBox", 200,
            "4gShotgunShellsBox", 200,
            "4gShotgunShellsBox", 200,
            "4gShotgunShellsBox", 200,
            "4gShotgunShellsBox", 200,
            "4gShotgunShellsBox", 200,
        },
    },
    AmmoCan50_MIX = {
        rolls = 8,
        items = {
            "223Box",			150,
            "223Box",			150,
            "556Box",			150,
            "556Box",			150,
            "545x39Box",		150,
            "545x39Box",		150,
            "762x39Box",		150,
            "762x39Box",		150,
            "308Box",			150,
            "308Box",			150,
	    "762x54rBox",		150,
	    "762x54rBox",		150,
	    "3006Box",			150,
	    "3006Box",			150,
            "50BMGBox",			150,
            "50BMGBox",			150,
        },
    },
    AmmoCan50_SHOT = {
        rolls = 8,
        items = {
            "410gShotgunShellsBox",	200,
            "410gShotgunShellsBox",	200,
            "20gShotgunShellsBox",	200,
            "20gShotgunShellsBox",	200,
            "ShotgunShellsBox",		200,
            "ShotgunShellsBox",		200,
            "10gShotgunShellsBox",	200,
            "10gShotgunShellsBox",	200,
            "4gShotgunShellsBox",	200,
            "4gShotgunShellsBox",	200,
        },
    },
    AmmoCan50_HE = {
        rolls = 10,			-- ROUND COUNT 1 = 50
        items = {
            "40HERound",	200,
            "40HERound",	200,
            "40HERound",	200,
            "40HERound",	200,
            "40HERound",	200,
        },
    },
    AmmoCan50_INC = {
        rolls = 10,			-- ROUND COUNT 1 = 50
        items = {
            "40INCRound",	200,
            "40INCRound",	200,
            "40INCRound",	200,
            "40INCRound",	200,
            "40INCRound",	200,
        },
    },

--------------------------------------------------
--	30 CALIBER AMMO-CAN CONTENTS		--
--------------------------------------------------
    AmmoCan30_22 = {
        rolls = 5,
        items = {
            "Bullets22Box",	200,
            "Bullets22Box",	200,
            "Bullets22Box",	200,
            "Bullets22Box",	200,
            "Bullets22Box",	200,
            "Bullets22Box",	200,
            "Bullets22Box",	200,
            "Bullets22Box",	200,
            "Bullets22Box",	200,
            "Bullets22Box",	200,
        },
    },
    AmmoCan30_57 = {
        rolls = 5,
        items = {
            "Bullets57Box",	200,
            "Bullets57Box",	200,
            "Bullets57Box",	200,
            "Bullets57Box",	200,
            "Bullets57Box",	200,
            "Bullets57Box",	200,
            "Bullets57Box",	200,
            "Bullets57Box",	200,
            "Bullets57Box",	200,
            "Bullets57Box",	200,
        },
    },
    AmmoCan30_380 = {
        rolls = 5,
        items = {
            "Bullets380Box",	200,
            "Bullets380Box",	200,
            "Bullets380Box",	200,
            "Bullets380Box",	200,
            "Bullets380Box",	200,
            "Bullets380Box",	200,
            "Bullets380Box",	200,
            "Bullets380Box",	200,
            "Bullets380Box",	200,
            "Bullets380Box",	200,
        },
    },
    AmmoCan30_9 = {
        rolls = 5,
        items = {
            "Bullets9mmBox",	200,
            "Bullets9mmBox",	200,
            "Bullets9mmBox",	200,
            "Bullets9mmBox",	200,
            "Bullets9mmBox",	200,
            "Bullets9mmBox",	200,
            "Bullets9mmBox",	200,
            "Bullets9mmBox",	200,
            "Bullets9mmBox",	200,
            "Bullets9mmBox",	200,
        },
    },
    AmmoCan30_38 = {
        rolls = 5,
        items = {
            "Bullets38Box",	200,
            "Bullets38Box",	200,
            "Bullets38Box",	200,
            "Bullets38Box",	200,
            "Bullets38Box",	200,
            "Bullets38Box",	200,
            "Bullets38Box",	200,
            "Bullets38Box",	200,
            "Bullets38Box",	200,
            "Bullets38Box",	200,
        },
    },
    AmmoCan30_357 = {
        rolls = 5,
        items = {
            "Bullets357Box",	200,
            "Bullets357Box",	200,
            "Bullets357Box",	200,
            "Bullets357Box",	200,
            "Bullets357Box",	200,
            "Bullets357Box",	200,
            "Bullets357Box",	200,
            "Bullets357Box",	200,
            "Bullets357Box",	200,
            "Bullets357Box",	200,
        },
    },
    AmmoCan30_45 = {
        rolls = 5,
        items = {
            "Bullets45Box",	200,
            "Bullets45Box",	200,
            "Bullets45Box",	200,
            "Bullets45Box",	200,
            "Bullets45Box",	200,
            "Bullets45Box",	200,
            "Bullets45Box",	200,
            "Bullets45Box",	200,
            "Bullets45Box",	200,
            "Bullets45Box",	200,
        },
    },
    AmmoCan30_45LC = {
        rolls = 5,
        items = {
            "Bullets45LCBox",	200,
            "Bullets45LCBox",	200,
            "Bullets45LCBox",	200,
            "Bullets45LCBox",	200,
            "Bullets45LCBox",	200,
            "Bullets45LCBox",	200,
            "Bullets45LCBox",	200,
            "Bullets45LCBox",	200,
            "Bullets45LCBox",	200,
            "Bullets45LCBox",	200,
        },
    },
    AmmoCan30_44 = {
        rolls = 5,
        items = {
            "Bullets44Box",	200,
            "Bullets44Box",	200,
            "Bullets44Box",	200,
            "Bullets44Box",	200,
            "Bullets44Box",	200,
            "Bullets44Box",	200,
            "Bullets44Box",	200,
            "Bullets44Box",	200,
            "Bullets44Box",	200,
            "Bullets44Box",	200,
        },
    },
    AmmoCan30_4570 = {
        rolls = 5,
        items = {
            "Bullets4570Box",	200,
            "Bullets4570Box",	200,
            "Bullets4570Box",	200,
            "Bullets4570Box",	200,
            "Bullets4570Box",	200,
            "Bullets4570Box",	200,
            "Bullets4570Box",	200,
            "Bullets4570Box",	200,
            "Bullets4570Box",	200,
            "Bullets4570Box",	200,
        },
    },
    AmmoCan30_50MAG = {
        rolls = 5,
        items = {
            "Bullets50MAGBox",	200,
            "Bullets50MAGBox",	200,
            "Bullets50MAGBox",	200,
            "Bullets50MAGBox",	200,
            "Bullets50MAGBox",	200,
            "Bullets50MAGBox",	200,
            "Bullets50MAGBox",	200,
            "Bullets50MAGBox",	200,
            "Bullets50MAGBox",	200,
            "Bullets50MAGBox",	200,
        },
    },
    AmmoCan30_MIX = {
        rolls = 5,
        items = {
            "Bullets22Box",	100,
            "Bullets22Box",	100,
            "Bullets380Box",	100,
            "Bullets380Box",	100,
            "Bullets9mmBox",	100,
            "Bullets9mmBox",	100,
            "Bullets38Box",	100,
            "Bullets38Box",	100,
            "Bullets57Box",	100,
            "Bullets57Box",	100,
            "Bullets357Box",	100,
            "Bullets357Box",	100,
            "Bullets45Box",	100,
            "Bullets45Box",	100,
	    "Bullets45LCBox",	100,
	    "Bullets45LCBox",	100,
	    "Bullets4570Box",	100,
	    "Bullets4570Box",	100,
            "Bullets44Box",	100,
            "Bullets44Box",	100,
            "Bullets50MAGBox",	100,
            "Bullets50MAGBox",	100,
        },
    },

--------------------------------------------------
--	RED POLY-CAN CONTENTS			--
--------------------------------------------------
    PolyCan_Red_SPASClip = {		-- SHOTGUN
        rolls = 6,
        items = {
            "SPASClip",		200,
        },
    },
    PolyCan_Red_12gDrum = {		-- SHOTGUN
        rolls = 2,
        items = {
            "12gDrum",		200,
        },
    },
    PolyCan_Red_38Speed = {		-- SPEEDLOADER
        rolls = 10,
        items = {
            "38Speed",		200,
        },
    },
    PolyCan_Red_44Speed = {		-- SPEEDLOADER
        rolls = 10,
        items = {
            "44Speed",		200,
        },
    },

--------------------------------------------------
--	BLUE POLY-CAN CONTENTS			--
--------------------------------------------------
    PolyCan_Blue_9mmClip = {		-- PISTOL 9mm
        rolls = 8,
        items = {
            "9mmClip",		200,
        },
    },
    PolyCan_Blue_9mmExtClip = {		-- PISTOL 9mm
        rolls = 6,
        items = {
            "9mmExtClip",	200,
        },
    },
    PolyCan_Blue_9mmDrum = {		-- PISTOL 9mm
        rolls = 4,
        items = {
            "9mmDrum",		200,
        },
    },
    PolyCan_Blue_45DSClip = {		-- PISTOL 45
        rolls = 8,
        items = {
            "45DSClip",		200,
        },
    },
    PolyCan_Blue_45DSExtClip = {	-- PISTOL 45
        rolls = 6,
        items = {
            "45DSExtClip",	200,
        },
    },
    PolyCan_Blue_45Drum = {		-- PISTOL 45
        rolls = 4,
        items = {
            "45Drum",		200,
        },
    },
    PolyCan_Blue_45Clip = {		-- PISTOL 45 SingleStack
        rolls = 8,
        items = {
            "45Clip",		200,
        },
    },
    PolyCan_Blue_45ExtClip = {		-- PISTOL 45 SingleStack
        rolls = 6,
        items = {
            "45ExtClip",	200,
        },
    },


--------------------------------------------------
--	BROWN POLY-CAN CONTENTS			--
--------------------------------------------------
    PolyCan_Brown_556Clip = {		-- RIFLE
        rolls = 6,
        items = {
            "556Clip",		200,
        },
    },
    PolyCan_Brown_556Drum = {		-- RIFLE
        rolls = 4,
        items = {
            "556Drum",		200,
        },
    },
    PolyCan_Brown_AKClip = {		-- RIFLE
        rolls = 6,
        items = {
            "AKClip",		200,
        },
    },
    PolyCan_Brown_762Drum = {		-- RIFLE
        rolls = 4,
        items = {
            "762Drum",		200,
        },
    },
    PolyCan_Brown_545StdClip = {	-- RIFLE
        rolls = 6,
        items = {
            "545StdClip",	200,
        },
    },
    PolyCan_Brown_545Drum = {		-- RIFLE
        rolls = 4,
        items = {
            "545Drum",		200,
        },
    },

--------------------------------------------------
--	BEIGE POLY-CAN CONTENTS			--
--------------------------------------------------
    PolyCan_Beige_308StdClip = {	-- HEAVY
        rolls = 6,
        items = {
            "308StdClip",		200,
        },
    },
    PolyCan_Beige_308ExtClip = {	-- HEAVY
        rolls = 4,
        items = {
            "308ExtClip",	200,
        },
    },
    PolyCan_Beige_BMG = {		-- HEAVY
        rolls = 6,
        items = {
            "M82Clip",		200,
        },
    },
    PolyCan_Beige_K11 = {		-- HEAVY
        rolls = 4,
        items = {
            "K11HEClip",	200,
        },
    },
    PolyCan_Beige_SVDClip = {		-- HEAVY
        rolls = 6,
        items = {
            "SVDClip",		200,
        },
    },
    PolyCan_Beige_SKSClip = {		-- HEAVY
        rolls = 20,
        items = {
            "SKSClip",		200,
        },
    },
    PolyCan_Beige_M1Clip = {		-- HEAVY
        rolls = 20,
        items = {
            "M1Clip",		200,
        },
    },
    PolyCan_Beige_1903Clip = {		-- HEAVY
        rolls = 20,
        items = {
            "1903Clip",		200,
        },
    },
}

table.insert(Distributions, 1, distributionTable);