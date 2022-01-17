DTBaseGameCharacterDetails = {}

------------------------------------------------------------
----- NEW TRAITS / TRAITS REBALANCE / TRAITS EXLUCIONS -----
------------------------------------------------------------
DTBaseGameCharacterDetails.DoTraits = function()

    -- VANILLA TRAITS COST REBALANCE

    -- PROFESSION TRAITS
    TraitFactory.addTrait("Axeman", getText("UI_trait_axeman"), 0, getText("UI_trait_axemandesc"), true);
	TraitFactory.addTrait("Burglar", getText("UI_prof_Burglar"), 0, getText("UI_trait_BurglarDesc"), true);
    TraitFactory.addTrait("NightOwl", getText("UI_trait_nightowl"), 0, getText("UI_trait_nightowldesc"), true);
	TraitFactory.addTrait("Desensitized", getText("UI_trait_Desensitized"), 0, getText("UI_trait_DesensitizedDesc"), true);

    -- WEIGHT / STRENGTH / FITNESS TRAITS
    TraitFactory.addTrait("Emaciated", getText("UI_trait_emaciated"), -10, getText("UI_trait_emaciateddesc"), true);
    local unfit = TraitFactory.addTrait("Unfit", getText("UI_trait_unfit"), -10, getText("UI_trait_unfitdesc"), false);
    unfit:addXPBoost(Perks.Fitness, -4)
    local outof = TraitFactory.addTrait("Out of Shape", getText("UI_trait_outofshape"), -6, getText("UI_trait_outofshapedesc"), false);
    outof:addXPBoost(Perks.Fitness, -2)
	local fit = TraitFactory.addTrait("Fit", getText("UI_trait_fit"), 6, getText("UI_trait_fitdesc"), false);
    fit:addXPBoost(Perks.Fitness, 2)
    local ath = TraitFactory.addTrait("Athletic", getText("UI_trait_athletic"), 10, getText("UI_trait_athleticdesc"), false);
    ath:addXPBoost(Perks.Fitness, 4)
    local veryUnderweight = TraitFactory.addTrait("Very Underweight", getText("UI_trait_veryunderweight"), -10, getText("UI_trait_veryunderweightdesc"), false);
	veryUnderweight:addXPBoost(Perks.Fitness, -2)
	local underweight = TraitFactory.addTrait("Underweight", getText("UI_trait_underweight"), -6, getText("UI_trait_underweightdesc"), false);
	underweight:addXPBoost(Perks.Fitness, -1)
	local overweight = TraitFactory.addTrait("Overweight", getText("UI_trait_overweight"), -6, getText("UI_trait_overweightdesc"), false);
	overweight:addXPBoost(Perks.Fitness, -1)
    local obese = TraitFactory.addTrait("Obese", getText("UI_trait_obese"), -10, getText("UI_trait_obesedesc"), false);
	obese:addXPBoost(Perks.Fitness, -2)
    local strong = TraitFactory.addTrait("Strong", getText("UI_trait_strong"), 10, getText("UI_trait_strongdesc"), false);
    strong:addXPBoost(Perks.Strength, 4)
	local stout = TraitFactory.addTrait("Stout", getText("UI_trait_stout"), 6, getText("UI_trait_stoutdesc"), false);
    stout:addXPBoost(Perks.Strength, 2)
    local feeble = TraitFactory.addTrait("Feeble", getText("UI_trait_feeble"), -6, getText("UI_trait_feebledesc"), false);
    feeble:addXPBoost(Perks.Strength, -2)
    local weak = TraitFactory.addTrait("Weak", getText("UI_trait_weak"), -10, getText("UI_trait_weakdesc"), false);
    weak:addXPBoost(Perks.Strength, -5)

    -- PERKS & RECIPES TRAITS
    local handy = TraitFactory.addTrait("Handy", getText("UI_trait_handy"), 4, getText("UI_trait_handydesc"), false);
	handy:addXPBoost(Perks.Maintenance, 1)
	handy:addXPBoost(Perks.Woodwork, 1)
    local firstAid = TraitFactory.addTrait("FirstAid", getText("UI_trait_FirstAid"), 1, getText("UI_trait_FirstAidDesc"), false);
	firstAid:addXPBoost(Perks.Doctor, 1)
	local fisher = TraitFactory.addTrait("Fishing", getText("UI_trait_Fishing"), 1, getText("UI_trait_FishingDesc"), false);
	fisher:addXPBoost(Perks.Fishing, 1)
    fisher:getFreeRecipes():add("Make Fishing Rod");
    fisher:getFreeRecipes():add("Fix Fishing Rod");
	local gardener = TraitFactory.addTrait("Gardener", getText("UI_trait_Gardener"), 1, getText("UI_trait_GardenerDesc"), false);
    gardener:addXPBoost(Perks.Farming, 1)
    gardener:getFreeRecipes():add("Make Mildew Cure");
    gardener:getFreeRecipes():add("Make Flies Cure");
	local jogger = TraitFactory.addTrait("Jogger", getText("UI_trait_Jogger"), 1, getText("UI_trait_JoggerDesc"), false);
	jogger:addXPBoost(Perks.Sprinting, 1)
    local tailoring = TraitFactory.addTrait("Tailor", getText("UI_trait_Tailor"), 1, getText("UI_trait_TailorDesc"), false);
	tailoring:addXPBoost(Perks.Tailoring, 1)
    local cook = TraitFactory.addTrait("Cook", getText("UI_trait_Cook"), 4, getText("UI_trait_CookDesc"), false);
    cook:addXPBoost(Perks.Cooking, 2)
    cook:getFreeRecipes():add("Make Cake Batter");
    cook:getFreeRecipes():add("Make Pie Dough");
    cook:getFreeRecipes():add("Make Bread Dough");
    TraitFactory.addTrait("Cook2", getText("UI_trait_Cook"), 0, getText("UI_trait_Cook2Desc"), true);
    local herbalist = TraitFactory.addTrait("Herbalist", getText("UI_trait_Herbalist"), 2, getText("UI_trait_HerbalistDesc"), false);
    herbalist:getFreeRecipes():add("Herbalist");
	local barfighter = TraitFactory.addTrait("Brawler", getText("UI_trait_BarFighter"), 6, getText("UI_trait_BarFighterDesc"), false);
	barfighter:addXPBoost(Perks.Axe, 1)
	barfighter:addXPBoost(Perks.Blunt, 1)
    local formerscout = TraitFactory.addTrait("Formerscout", getText("UI_trait_Scout"), 4, getText("UI_trait_ScoutDesc"), false);
    formerscout:addXPBoost(Perks.Trapping, 1)
    formerscout:addXPBoost(Perks.PlantScavenging, 1)
	local baseball = TraitFactory.addTrait("BaseballPlayer", getText("UI_trait_PlaysBaseball"), 4, getText("UI_trait_PlaysBaseballDesc"), false);
	baseball:addXPBoost(Perks.Blunt, 1)
	local backpacker = TraitFactory.addTrait("Hiker", getText("UI_trait_Hiker"), 5, getText("UI_trait_HikerDesc"), false);
	backpacker:addXPBoost(Perks.PlantScavenging, 2)
	backpacker:addXPBoost(Perks.Trapping, 1)
    backpacker:getFreeRecipes():add("Make Stick Trap");
    backpacker:getFreeRecipes():add("Make Snare Trap");
    backpacker:getFreeRecipes():add("Make Wooden Cage Trap");
	local hunter = TraitFactory.addTrait("Hunter", getText("UI_trait_Hunter"), 6, getText("UI_trait_HunterDesc"), false);
	hunter:addXPBoost(Perks.Aiming, 1)
	hunter:addXPBoost(Perks.Trapping, 1)
	hunter:addXPBoost(Perks.Sneak, 1)
	hunter:addXPBoost(Perks.SmallBlade, 1)
    hunter:getFreeRecipes():add("Make Stick Trap");
    hunter:getFreeRecipes():add("Make Snare Trap");
    hunter:getFreeRecipes():add("Make Wooden Cage Trap");
    hunter:getFreeRecipes():add("Make Trap Box");
    hunter:getFreeRecipes():add("Make Cage Trap");
	local gym = TraitFactory.addTrait("Gymnast", getText("UI_trait_Gymnast"), 4, getText("UI_trait_GymnastDesc"), false);
	gym:addXPBoost(Perks.Lightfoot, 1)
	gym:addXPBoost(Perks.Nimble, 1)
	local carenthusiast = TraitFactory.addTrait("Mechanics", getText("UI_trait_Mechanics"), 3, getText("UI_trait_MechanicsDesc"), false);
	carenthusiast:addXPBoost(Perks.Mechanics, 1);
	carenthusiast:getFreeRecipes():add("Basic Mechanics");
	carenthusiast:getFreeRecipes():add("Intermediate Mechanics");
	TraitFactory.addTrait("Mechanics2", getText("UI_trait_Mechanics"), 0, getText("UI_trait_Mechanics2Desc"), true);

    -- OTHER TRAITS
    TraitFactory.addTrait("SpeedDemon", getText("UI_trait_SpeedDemon"), 1, getText("UI_trait_SpeedDemonDesc"), false);
	TraitFactory.addTrait("SundayDriver", getText("UI_trait_SundayDriver"), -1, getText("UI_trait_SundayDriverDesc"), false);
    TraitFactory.addTrait("Brave", getText("UI_trait_brave"), 4, getText("UI_trait_bravedesc"), false);
    TraitFactory.addTrait("Cowardly", getText("UI_trait_cowardly"), -2, getText("UI_trait_cowardlydesc"), false);
    TraitFactory.addTrait("Clumsy", getText("UI_trait_clumsy"), -4, getText("UI_trait_clumsydesc"), false);
    TraitFactory.addTrait("Graceful", getText("UI_trait_graceful"), 4, getText("UI_trait_gracefuldesc"), false);
    TraitFactory.addTrait("ShortSighted", getText("UI_trait_shortsigh"), -2, getText("UI_trait_shortsighdesc"), false);
	TraitFactory.addTrait("HardOfHearing", getText("UI_trait_hardhear"), -6, getText("UI_trait_hardheardesc"), false);
	TraitFactory.addTrait("Deaf", getText("UI_trait_deaf"), -12, getText("UI_trait_deafdesc"), false);
    TraitFactory.addTrait("KeenHearing", getText("UI_trait_keenhearing"), 6, getText("UI_trait_keenhearingdesc"), false);
    TraitFactory.addTrait("EagleEyed", getText("UI_trait_eagleeyed"), 4, getText("UI_trait_eagleeyeddesc"), false);
    TraitFactory.addTrait("Nutritionist", getText("UI_trait_nutritionist"), 4, getText("UI_trait_nutritionistdesc"), false);
    TraitFactory.addTrait("Nutritionist2", getText("UI_trait_nutritionist"), 0, getText("UI_trait_nutritionistdesc"), true);
    TraitFactory.addTrait("Agoraphobic", getText("UI_trait_agoraphobic"), -4, getText("UI_trait_agoraphobicdesc"), false);
    TraitFactory.addTrait("Claustophobic", getText("UI_trait_claustro"), -4, getText("UI_trait_claustrodesc"), false);
    TraitFactory.addTrait("Lucky", getText("UI_trait_lucky"), 4, getText("UI_trait_luckydesc"), false);
    TraitFactory.addTrait("Unlucky", getText("UI_trait_unlucky"), -4, getText("UI_trait_unluckydesc"), false);
	TraitFactory.addTrait("Outdoorsman", getText("UI_trait_outdoorsman"), 2, getText("UI_trait_outdoorsmandesc"), false);
	TraitFactory.addTrait("FastLearner", getText("UI_trait_FastLearner"), 6, getText("UI_trait_FastLearnerDesc"), false);
	TraitFactory.addTrait("FastReader", getText("UI_trait_FastReader"), 1, getText("UI_trait_FastReaderDesc"), false);
	TraitFactory.addTrait("AdrenalineJunkie", getText("UI_trait_AdrenalineJunkie"), 5, getText("UI_trait_AdrenalineJunkieDesc"), false);
	TraitFactory.addTrait("Inconspicuous", getText("UI_trait_Inconspicuous"), 4, getText("UI_trait_InconspicuousDesc"), false);
	TraitFactory.addTrait("NightVision", getText("UI_trait_NightVision"), 3, getText("UI_trait_NightVisionDesc"), false);
	TraitFactory.addTrait("Organized", getText("UI_trait_Packmule"), 6, getText("UI_trait_PackmuleDesc"), false);
	TraitFactory.addTrait("SlowLearner", getText("UI_trait_SlowLearner"), -6, getText("UI_trait_SlowLearnerDesc"), false);
	TraitFactory.addTrait("SlowReader", getText("UI_trait_SlowReader"), -1, getText("UI_trait_SlowReaderDesc"), false);
	TraitFactory.addTrait("Conspicuous", getText("UI_trait_Conspicuous"), -4, getText("UI_trait_ConspicuousDesc"), false);
	TraitFactory.addTrait("Disorganized", getText("UI_trait_Disorganized"), -6, getText("UI_trait_DisorganizedDesc"), false);
	TraitFactory.addTrait("Illiterate", getText("UI_trait_Illiterate"), -10, getText("UI_trait_IlliterateDesc"), false);
	TraitFactory.addTrait("Pacifist", getText("UI_trait_Pacifist"), -4, getText("UI_trait_PacifistDesc"), false);
    TraitFactory.addTrait("Smoker", getText("UI_trait_Smoker"), -4, getText("UI_trait_SmokerDesc"), false);
	TraitFactory.addTrait("Dextrous", getText("UI_trait_Dexterous"), 6, getText("UI_trait_DexterousDesc"), false);
	TraitFactory.addTrait("AllThumbs", getText("UI_trait_AllThumbs"), -6, getText("UI_trait_AllThumbsDesc"), false);
    TraitFactory.addTrait("WeakStomach", getText("UI_trait_WeakStomach"), -2, getText("UI_trait_WeakStomachDesc"), false);
    TraitFactory.addTrait("IronGut", getText("UI_trait_IronGut"), 2, getText("UI_trait_IronGutDesc"), false);
    TraitFactory.addTrait("Hemophobic", getText("UI_trait_Hemophobic"), -8, getText("UI_trait_HemophobicDesc"), false);

    -- VANILLA TRAITS REMOVED FROM THE CHARACTER CREATION.
    local sleepOK = (isClient() or isServer()) and getServerOptions():getBoolean("SleepAllowed") and getServerOptions():getBoolean("SleepNeeded")
    TraitFactory.addTrait("LightEater", getText("UI_trait_lighteater"), 0, getText("UI_trait_lighteaterdesc"), true);
    TraitFactory.addTrait("HeartyAppitite", getText("UI_trait_heartyappetite"), 0, getText("UI_trait_heartyappetitedesc"), true);
    TraitFactory.addTrait("LowThirst", getText("UI_trait_LowThirst"), 0, getText("UI_trait_LowThirstDesc"), true);
    TraitFactory.addTrait("HighThirst", getText("UI_trait_HighThirst"), 0, getText("UI_trait_HighThirstDesc"), true);
    TraitFactory.addTrait("Resilient", getText("UI_trait_resilient"), 0, getText("UI_trait_resilientdesc"), true);
    TraitFactory.addTrait("ProneToIllness", getText("UI_trait_pronetoillness"), 0, getText("UI_trait_pronetoillnessdesc"), true);
    TraitFactory.addTrait("SlowHealer", getText("UI_trait_SlowHealer"), 0, getText("UI_trait_SlowHealerDesc"), true);
    TraitFactory.addTrait("FastHealer", getText("UI_trait_FastHealer"), 0, getText("UI_trait_FastHealerDesc"), true);
    TraitFactory.addTrait("Asthmatic", getText("UI_trait_Asthmatic"), 0, getText("UI_trait_AsthmaticDesc"), true);
    TraitFactory.addTrait("ThickSkinned", getText("UI_trait_thickskinned"), 0, getText("UI_trait_thickskinneddesc"), true);
    TraitFactory.addTrait("Thinskinned", getText("UI_trait_ThinSkinned"), 0, getText("UI_trait_ThinSkinnedDesc"), true);
    TraitFactory.addTrait("NeedsLessSleep", getText("UI_trait_LessSleep"), 0, getText("UI_trait_LessSleepDesc"), true, not sleepOK);
    TraitFactory.addTrait("NeedsMoreSleep", getText("UI_trait_MoreSleep"), 0, getText("UI_trait_MoreSleepDesc"), true, not sleepOK);
    TraitFactory.addTrait("Insomniac", getText("UI_trait_Insomniac"), 0, getText("UI_trait_InsomniacDesc"), true, not sleepOK);

    -- NEW TRAITS
    TraitFactory.addTrait("Flimsy", getText("UI_trait_Flimsy"), 0, getText("UI_trait_FlimsyDesc"), true);
    TraitFactory.addTrait("Frail", getText("UI_trait_Frail"), 0, getText("UI_trait_FrailDesc"), true);
    --TraitFactory.addTrait("AddictedToCoffee", getText("UI_trait_AddictedToCoffee"), -4, getText("UI_trait_AddictedToCoffeeDesc"), false);
    TraitFactory.addTrait("Bloodlust", getText("UI_trait_Bloodlust"), -4, getText("UI_trait_BloodlustDesc"), false);
    local amateurElectrician = TraitFactory.addTrait("AmateurElectrician", getText("UI_trait_AmateurElectrician"), 2, getText("UI_trait_AmateurElectricianDesc"), false);
    amateurElectrician:getFreeRecipes():add("Generator");
    local amateurElectrician2 = TraitFactory.addTrait("AmateurElectrician2", getText("UI_trait_AmateurElectrician"), 0, getText("UI_trait_AmateurElectricianDesc"), true);
    amateurElectrician2:getFreeRecipes():add("Generator");
    TraitFactory.addTrait("Pluviophile", getText("UI_trait_Pluviophile"), 2, getText("UI_trait_PluviophileDesc"), false);
    TraitFactory.addTrait("Pluviophobia", getText("UI_trait_Pluviophobia"), -2, getText("UI_trait_PluviophobiaDesc"), false);
    TraitFactory.addTrait("Alcoholic", getText("UI_trait_Alcoholic"), -8, getText("UI_trait_AlcoholicDesc"), false);
    TraitFactory.addTrait("Anorexy", getText("UI_trait_Anorexy"), -10, getText("UI_trait_AnorexyDesc"), false);
    --TraitFactory.addTrait("Bigorexia", getText("UI_trait_Bigorexia"), -8, getText("UI_trait_BigorexiaDesc"), false);
    TraitFactory.addTrait("Prodigy", getText("UI_trait_Prodigy"), 6, getText("UI_trait_ProdigyDesc"), false);
    TraitFactory.addTrait("PhysicallyActive", getText("UI_trait_PhysicallyActive"), 3, getText("UI_trait_PhysicallyActiveDesc"), false);
    TraitFactory.addTrait("PhysicallyActive2", getText("UI_trait_PhysicallyActive"), 0, getText("UI_trait_PhysicallyActiveDesc"), true);
    TraitFactory.addTrait("Sedentary", getText("UI_trait_Sedentary"), -6, getText("UI_trait_SedentaryDesc"), false);
    TraitFactory.addTrait("Nightmares", getText("UI_trait_Nightmares"), -3, getText("UI_trait_NightmaresDesc"), false, not sleepOK);

    local handy2 = TraitFactory.addTrait("Handy2", getText("UI_trait_handy"), 0, getText("UI_trait_handydesc"), true);
	handy2:addXPBoost(Perks.Maintenance, 1)
	handy2:addXPBoost(Perks.Woodwork, 1)

    -- NEW TRAITS EXCLUSIONS & NEW EXCLUSIONS
    -- VANILLA EXCLUSIONS
    TraitFactory.setMutualExclusive("SpeedDemon", "SundayDriver");
	TraitFactory.setMutualExclusive("Dextrous", "AllThumbs");
    TraitFactory.setMutualExclusive("Nutritionist", "Nutritionist2");
    TraitFactory.setMutualExclusive("Cook", "Cook2");
	TraitFactory.setMutualExclusive("Mechanics", "Mechanics2");
	TraitFactory.setMutualExclusive("FastHealer", "SlowHealer");
	TraitFactory.setMutualExclusive("FastLearner", "SlowLearner");
	TraitFactory.setMutualExclusive("FastReader", "SlowReader");
    TraitFactory.setMutualExclusive("Illiterate", "SlowReader");
    TraitFactory.setMutualExclusive("Illiterate", "FastReader");
	TraitFactory.setMutualExclusive("NeedsLessSleep", "NeedsMoreSleep");
	TraitFactory.setMutualExclusive("ThickSkinned", "Thinskinned");
	TraitFactory.setMutualExclusive("LowThirst", "HighThirst");
	TraitFactory.setMutualExclusive("Conspicuous", "Inconspicuous");
	TraitFactory.setMutualExclusive("Weak", "Strong");
	TraitFactory.setMutualExclusive("Weak", "Stout");
	TraitFactory.setMutualExclusive("Weak", "Feeble");
	TraitFactory.setMutualExclusive("Stout", "Feeble");
	TraitFactory.setMutualExclusive("Strong", "Feeble");
    TraitFactory.setMutualExclusive("Strong", "Stout");
    TraitFactory.setMutualExclusive("Overweight", "Obese");
    TraitFactory.setMutualExclusive("Overweight", "Underweight");
    TraitFactory.setMutualExclusive("Very Underweight", "Underweight");
    TraitFactory.setMutualExclusive("Overweight", "Very Underweight");
    TraitFactory.setMutualExclusive("Overweight", "Emaciated");
    TraitFactory.setMutualExclusive("Obese", "Underweight");
    TraitFactory.setMutualExclusive("Obese", "Very Underweight");
    TraitFactory.setMutualExclusive("Obese", "Emaciated");
    TraitFactory.setMutualExclusive("Athletic", "Overweight");
    TraitFactory.setMutualExclusive("Athletic", "Fit");
    TraitFactory.setMutualExclusive("Athletic", "Obese");
    TraitFactory.setMutualExclusive("Athletic", "Out of Shape");
    TraitFactory.setMutualExclusive("Athletic", "Unfit");
    TraitFactory.setMutualExclusive("Athletic", "Very Underweight");
    TraitFactory.setMutualExclusive("Fit", "Out of Shape");
    TraitFactory.setMutualExclusive("Fit", "Unfit");
    TraitFactory.setMutualExclusive("Fit", "Overweight");
    TraitFactory.setMutualExclusive("Fit", "Obese");
    TraitFactory.setMutualExclusive("Unfit", "Out of Shape");
    TraitFactory.setMutualExclusive("Organized", "Disorganized");
    TraitFactory.setMutualExclusive("Resilient", "ProneToIllness");
    TraitFactory.setMutualExclusive("HardOfHearing", "KeenHearing");
    TraitFactory.setMutualExclusive("HeartyAppitite", "LightEater");
    TraitFactory.setMutualExclusive("Clumsy", "Graceful");
    TraitFactory.setMutualExclusive("Brave", "Cowardly");
    TraitFactory.setMutualExclusive("ShortSighted", "EagleEyed");
    TraitFactory.setMutualExclusive("Lucky", "Unlucky");
    TraitFactory.setMutualExclusive("Deaf", "HardOfHearing");
    TraitFactory.setMutualExclusive("Deaf", "KeenHearing");
    TraitFactory.setMutualExclusive("Desensitized", "Hemophobic");
    TraitFactory.setMutualExclusive("Desensitized", "Cowardly");
    TraitFactory.setMutualExclusive("Desensitized", "Brave");
    TraitFactory.setMutualExclusive("Desensitized", "Agoraphobic");
	TraitFactory.setMutualExclusive("Claustophobic", "Agoraphobic");
    TraitFactory.setMutualExclusive("Desensitized", "Claustophobic");
    TraitFactory.setMutualExclusive("Desensitized", "AdrenalineJunkie");
    TraitFactory.setMutualExclusive("IronGut", "WeakStomach");

    -- DYNAMIC TRAITS EXCLUSIONS
    -- TRAITS THAT CAN'T BE PICKED WITH "Obese" TRAIT.
    TraitFactory.setMutualExclusive("Obese","Inconspicuous");
    TraitFactory.setMutualExclusive("Obese","Conspicuous");
    TraitFactory.setMutualExclusive("Obese","Graceful");
    TraitFactory.setMutualExclusive("Obese","Clumsy");
    
    -- TRAITS THAT CAN'T BE PICKED WITH "Very Underweight" TRAIT.
    TraitFactory.setMutualExclusive("Very Underweight","Strong");
    TraitFactory.setMutualExclusive("Very Underweight","Stout");
    TraitFactory.setMutualExclusive("Very Underweight","Fit");

    -- TRAITS THAT CAN'T BE PICKED WITH "Underweight" TRAIT.
    TraitFactory.setMutualExclusive("Underweight","Strong");
    TraitFactory.setMutualExclusive("Underweight","Athletic");

    -- TRAITS THAT CAN'T BE PICKED WITH "Brave" TRAIT.
    TraitFactory.setMutualExclusive("Brave","Agoraphobic");
    TraitFactory.setMutualExclusive("Brave","Claustophobic");
    TraitFactory.setMutualExclusive("Brave","Hemophobic");

    -- TRAITS THAT CAN'T BE PICKED WITH "Bloodlust" TRAIT.
    TraitFactory.setMutualExclusive("Bloodlust","Cowardly");
    TraitFactory.setMutualExclusive("Bloodlust","Pacifist");
    TraitFactory.setMutualExclusive("Bloodlust","Hemophobic");

    -- "Pluviophile" && "Pluviophobia" EXCLUSION.
    TraitFactory.setMutualExclusive("Pluviophile","Pluviophobia");

    -- TRAITS THAT CAN'T BE PICKED WITH "Anorexy" TRAIT.
    TraitFactory.setMutualExclusive("Anorexy","Overweight");
    TraitFactory.setMutualExclusive("Anorexy","Obese");
    TraitFactory.setMutualExclusive("Anorexy","Strong");
    TraitFactory.setMutualExclusive("Anorexy","Athletic");

    -- TRAITS THAT CAN'T BE PICKED WITH "Sedentary" TRAIT.
    TraitFactory.setMutualExclusive("Sedentary","PhysicallyActive");
    TraitFactory.setMutualExclusive("Sedentary","PhysicallyActive2");
    TraitFactory.setMutualExclusive("Sedentary","Strong");
    TraitFactory.setMutualExclusive("Sedentary","Athletic");
    TraitFactory.setMutualExclusive("Sedentary","Fit");

    -- "PhysicallyActive" && "PhysicallyActive2" EXCLUSION.
    TraitFactory.setMutualExclusive("PhysicallyActive","PhysicallyActive2");

    -- "Desensitized" && "Pacifist" EXCLUSION.
    TraitFactory.setMutualExclusive("Desensitized","Pacifist");

    -- "Handy" && "Handy2" EXCLUSION.
    TraitFactory.setMutualExclusive("Handy", "Handy2");

    -- "Amateur Electrician" && "Amateur Electrician2" EXCLUSION.
    TraitFactory.setMutualExclusive("AmateurElectrician", "AmateurElectrician2");

    -- TRAITS THAT CAN'T BE PICKED WITH "Nightmares" TRAIT.
    TraitFactory.setMutualExclusive("Nightmares","Brave");
    TraitFactory.setMutualExclusive("Nightmares","Desensitized");

    -- "Pluviophobia" && "Outdoorsman" EXCLUSION.
    TraitFactory.setMutualExclusive("Outdoorsman","Pluviophobia");

    local traitList = TraitFactory.getTraits()
	for i=1,traitList:size() do
		local trait = traitList:get(i-1)
		BaseGameCharacterDetails.SetTraitDescription(trait)
	end
end

---------------------------------
----- PROFESSIONS REBALANCE -----
---------------------------------
DTBaseGameCharacterDetails.DoProfessions = function()
    -- PROFFESIONS REBALANCE AND REWORK
    -- FIRE OFFICER PROFESSION REBALANCE
    local fireofficer = ProfessionFactory.getProfession("fireofficer");
    fireofficer:setCost(-10);
    fireofficer:addFreeTrait("Axeman");

    -- CARPENTER PROFESSION REBALANCE
    local carpenter = ProfessionFactory.getProfession("carpenter");
    carpenter:setCost(0);
    carpenter:addFreeTrait("Handy2");

    -- BURGLAR PROFESSION REBALANCE
    if getActivatedMods():contains("WPA") and getActivatedMods():contains("betterLockpicking") then 
        local burglar = ProfessionFactory.getProfession("burglar");
        burglar:setCost(-12);
    elseif getActivatedMods():contains("WPA") or getActivatedMods():contains("betterLockpicking") then
        local burglar = ProfessionFactory.getProfession("burglar");
        burglar:setCost(-11);
    else
        local burglar = ProfessionFactory.getProfession("burglar");
        burglar:setCost(-10);
    end

    -- FARMER PROFESSION REBALANCE
    if getActivatedMods():contains("LeGourmetRevolution") then
        local farmer = ProfessionFactory.getProfession("farmer");
        farmer:setCost(4);
        farmer:addXPBoost(Perks.Farming, 4);
    else
        local farmer = ProfessionFactory.getProfession("farmer");
        farmer:setCost(6);
        farmer:addXPBoost(Perks.Farming, 4);
    end

    -- FISHERMAN PROFESSION REBALANCE
    local fisherman = ProfessionFactory.getProfession("fisherman");
    fisherman:setCost(6);

    -- DOCTOR PROFESSION REBALANCE
    local doctor = ProfessionFactory.getProfession("doctor");
    doctor:setCost(0);
	doctor:addXPBoost(Perks.Doctor, 5);
	doctor:addXPBoost(Perks.SmallBlade, 2);
    doctor:addFreeTrait("NightOwl");

    -- VETERAN PROFESSION REBALANCE
    if getActivatedMods():contains("AliceSPack") and getActivatedMods():contains("AmmoMaker") then
        local veteran = ProfessionFactory.getProfession("veteran");
        veteran:setCost(-10);
    elseif getActivatedMods():contains("AliceSPack") or getActivatedMods():contains("AmmoMaker") then
        local veteran = ProfessionFactory.getProfession("veteran");
        veteran:setCost(-9);
    else
        local veteran = ProfessionFactory.getProfession("veteran");
        veteran:setCost(-8);
    end

    -- NURSE PROFESSION REBALANCE
    local nurse = ProfessionFactory.getProfession("nurse");
    nurse:setCost(6);
    nurse:addFreeTrait("NightOwl");

    -- LUMBERBACK PROFESSION REBALANCE
    if getActivatedMods():contains("AliceSPack") then
        local lumberjack = ProfessionFactory.getProfession("lumberjack");
        lumberjack:setCost(-8);
    else
        local lumberjack = ProfessionFactory.getProfession("lumberjack");
        lumberjack:setCost(-6);
    end

    -- FITNESS INSTRUCTOR PROFESSION REBALANCE
    if getActivatedMods():contains("AliceSPack") then
        local fitnessInstructor = ProfessionFactory.getProfession("fitnessInstructor");
        fitnessInstructor:setCost(-8);
        fitnessInstructor:addFreeTrait("PhysicallyActive2");
    else
        local fitnessInstructor = ProfessionFactory.getProfession("fitnessInstructor");
        fitnessInstructor:setCost(-6);
        fitnessInstructor:addFreeTrait("PhysicallyActive2");
    end

    -- ELECTRICIAN PROFESSION REBALANCE
    local electrician = ProfessionFactory.getProfession("electrician");
    electrician:addXPBoost(Perks.Electricity, 4);
    electrician:setCost(0);
    electrician:addFreeTrait("AmateurElectrician2");

    -- ENGINEER PROFESSION REBALANCE
    if getActivatedMods():contains("WPA") and getActivatedMods():contains("AmmoMaker") then
        local engineer = ProfessionFactory.getProfession("engineer");
        engineer:setCost(-8);
        engineer:addXPBoost(Perks.Mechanics, 1);
        engineer:addXPBoost(Perks.MetalWelding, 1);
        engineer:addFreeTrait("Burglar");
    elseif getActivatedMods():contains("WPA") or getActivatedMods():contains("AmmoMaker") then
        local engineer = ProfessionFactory.getProfession("engineer");
        engineer:setCost(-7);
        engineer:addXPBoost(Perks.Mechanics, 1);
        engineer:addXPBoost(Perks.MetalWelding, 1);
        engineer:addFreeTrait("Burglar");
    else
        local engineer = ProfessionFactory.getProfession("engineer");
        engineer:setCost(-6);
        engineer:addXPBoost(Perks.Mechanics, 1);
        engineer:addXPBoost(Perks.MetalWelding, 1);
        engineer:addFreeTrait("Burglar");
    end

    -- METALWORKER PROFESSION REBALANCE
    local metalworker = ProfessionFactory.getProfession("metalworker");
    metalworker:setCost(-2);
    metalworker:addXPBoost(Perks.MetalWelding, 4);

    -- MECHANICS PROFESSION REBALANCE
    local mechanics = ProfessionFactory.getProfession("mechanics");
    mechanics:setCost(-6);
	mechanics:addXPBoost(Perks.Mechanics, 3);
	mechanics:addXPBoost(Perks.MetalWelding, 1);
    mechanics:addFreeTrait("Burglar");

    local profList = ProfessionFactory.getProfessions()
	for i=1,profList:size() do
		local prof = profList:get(i-1)
		BaseGameCharacterDetails.SetProfessionDescription(prof)
	end
end

----------------------------------------------
----- INITIALIZATION FOR A NEW CHARACTER -----
----------------------------------------------
DTBaseGameCharacterDetails.DoNewCharacterInitializations = function(playernum, character)
    local player = getSpecificPlayer(playernum);

    -- TRAITS CHANGE
    if player:HasTrait("PhysicallyActive2") then
        player:getTraits():remove("PhysicallyActive2");
        player:getTraits():add("PhysicallyActive");
    end
    if player:HasTrait("Handy2") then
        player:getTraits():remove("Handy2");
        player:getTraits():add("Handy");
    end

    -- INITIALIZATION FOR KILLS PATH
    if player:getModData().DTKillsPath == nil then
        if player:HasTrait("Cowardly") then
            player:getModData().DTKillsPath = 1;
        elseif player:HasTrait("Brave") then
            player:getModData().DTKillsPath = 2;
        else
            player:getModData().DTKillsPath = 3;
        end
    end
    -- INITIALIZATION FOR KILLS SYSTEM
    if player:getModData().DTKillscheck2 == nil then
        player:getModData().DTKillscheck2 = 0;
    end
    -- INITIALIZATION FOR DEXTROUS/ALLTHUMBS
    if player:getModData().DTatdTraits == nil then
        if player:HasTrait("AllThumbs") then
            player:getModData().DTatdTraits = 0;
        elseif player:HasTrait("Dextrous") then
            player:getModData().DTatdTraits = 120000;
        else
            player:getModData().DTatdTraits = 60000;
        end
    end
    -- INITIALIZATION FOR ORGANIZED/DISORGANIZED TRAITS
    if player:getModData().DTdoTraits == nil then
        if player:HasTrait("Disorganized") then
            player:getModData().DTdoTraits = 0;
        elseif player:HasTrait("Organized") then
            player:getModData().DTdoTraits = 200000;
        else
            player:getModData().DTdoTraits = 100000;
        end
    end
    -- INITIALIZATION FOR OUTDOORSMAN TRAIT
    if player:getModData().DTOutdoorsCounter == nil then
        player:getModData().DTOutdoorsCounter = 0;
    end
    -- INITIALIZATION FOR CATSEYES TRAIT
    if player:getModData().DTCatsEyesCounter == nil then
        player:getModData().DTCatsEyesCounter = 0;
    end
    -- INITIALIZATION FOR RAIN TRAITS
    if player:getModData().DTRainTraits == nil then
        if player:HasTrait("Pluviophile") then
            player:getModData().DTRainTraits = 100000;
        elseif player:HasTrait("Pluviophobia") then
            player:getModData().DTRainTraits = 0;
        else
            player:getModData().DTRainTraits = 50000;
        end
    end
    -- INITIALIZATION FOR CLAUSTROPHOBIC AND AGORAPHOBIC TRAITS
    if player:getModData().DTagoraClaustroCounter == nil then
        player:getModData().DTagoraClaustroCounter = 0;
    end
    -- INITIALIZATION FOR SMOKER TRAIT
    if player:getModData().DTdaysSinceLastSmoke == nil then
        player:getModData().DTdaysSinceLastSmoke = 0;
    end
    -- INITIALIZATION FOR BLOODLUST TRAIT
    if player:getModData().DTKillscheck == nil then
        player:getModData().DTKillscheck = 0;
    end
    if player:getModData().DTtimesinceLastKill == nil then
        player:getModData().DTtimesinceLastKill = 0;
    end
    -- INITIALIZATION FOR ALCOHOLIC TRAIT
    if player:getModData().DThoursSinceLastDrink == nil then
        player:getModData().DThoursSinceLastDrink = 0;
    end
    if player:getModData().DTthresholdToObtainAlcoholic == nil then
        player:getModData().DTthresholdToObtainAlcoholic = 0;
    end
    -- INITIALIZATION FOR ANOREXIC TRAIT
    if player:getModData().DTthresholdToObtainLoseAnorexy == nil then
        if player:HasTrait("Anorexy") then
            player:getModData().DTthresholdToObtainLoseAnorexy = -720;
        else
            player:getModData().DTthresholdToObtainLoseAnorexy = 0;
        end
    end
    -- INITIALIZATION FOR PHYSICALLY ACTIVE/SEDENTARY TRAITS
    if player:getModData().DTObtainLoseActiveSedentary == nil then 
        if player:HasTrait("PhysicallyActive") then
            player:getModData().DTObtainLoseActiveSedentary = 60000;
        elseif player:HasTrait("Sedentary") then
            player:getModData().DTObtainLoseActiveSedentary = -60000;
        else
            player:getModData().DTObtainLoseActiveSedentary = 0;
        end
    end
    -- INITIALIZATION FOR HARD OF HEARING AND KEEN HEARING TRAITS
    if player:getModData().DTKeenHardOfHearing == nil then 
        local total = 0;
        -- AGILITY SKILLS
        total = total + player:getPerkLevel(Perks.Sneak);
        total = total + player:getPerkLevel(Perks.Lightfoot);
        total = total + player:getPerkLevel(Perks.Nimble);
        -- FIREARMS SKILLS
        total = total + player:getPerkLevel(Perks.Aiming);
        -- COMBAT SKILLS
        total = total + player:getPerkLevel(Perks.Axe);
        total = total + player:getPerkLevel(Perks.Blunt);
        total = total + player:getPerkLevel(Perks.SmallBlunt);
        total = total + player:getPerkLevel(Perks.LongBlade);
        total = total + player:getPerkLevel(Perks.SmallBlade);
        total = total + player:getPerkLevel(Perks.Spear);
        -- SURVIVALIST SKILLS
        total = total + player:getPerkLevel(Perks.PlantScavenging);
        -- MOD DATA = TOTAL
        player:getModData().DTKeenHardOfHearing = total;
        -- CHECKS IF THE PLAYER HAS THE NECESSARY TO REMOVE HARD OF HEARING OR OBTAIN KEEN HEARING
        if player:getModData().DTKeenHardOfHearing >= 30 and player:HasTrait("HardOfHearing") then
            player:getTraits():remove("HardOfHearing");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_hardhear"), false, HaloTextHelper.getColorGreen());
        end
        if player:getModData().DTKeenHardOfHearing >= 50 and not player:HasTrait("KeenHearing") and not player:HasTrait("Deaf") then
            player:getTraits():add("KeenHearing");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_keenhearing"), true, HaloTextHelper.getColorGreen());
        end
    end
    -- INITIALIZATION FOR SLOW LEARNER AND FAST LEARNER TRAITS
    if player:getModData().DTSlowFastLearner == nil then 
        local total = 0;
        -- CRAFTING SKILLS
        total = total + player:getPerkLevel(Perks.Woodwork);
        total = total + player:getPerkLevel(Perks.Cooking);
        total = total + player:getPerkLevel(Perks.Farming);
        total = total + player:getPerkLevel(Perks.Doctor);
        total = total + player:getPerkLevel(Perks.Electricity);
        total = total + player:getPerkLevel(Perks.MetalWelding);
        total = total + player:getPerkLevel(Perks.Mechanics);
        total = total + player:getPerkLevel(Perks.Tailoring);
        -- SURVIVALIST SKILLS
        total = total + player:getPerkLevel(Perks.Fishing);
        total = total + player:getPerkLevel(Perks.Trapping);
        total = total + player:getPerkLevel(Perks.PlantScavenging);
        -- MOD DATA = TOTAL
        player:getModData().DTSlowFastLearner = total;
        -- CHECKS IF THE PLAYER HAS THE NECESSARY TO REMOVE SLOW LEARNER OR OBTAIN FAST LEARNER
        if player:getModData().DTSlowFastLearner >= 30 and player:HasTrait("SlowLearner") then
            player:getTraits():remove("SlowLearner");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_SlowLearner"), false, HaloTextHelper.getColorGreen());
        end
        if player:getModData().DTSlowFastLearner >= 50 and not player:HasTrait("FastLearner") then
            player:getTraits():add("FastLearner");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_FastLearner"), true, HaloTextHelper.getColorGreen());
        end
    end
end

----------------------------------------------------
----- INITIALIZATION FOR AN EXISTING CHARACTER -----
----------------------------------------------------
DTBaseGameCharacterDetails.DoExistingCharacterInitializations = function(player)
    -- SUPERB/SUBPAR SURVIVORS AND NPC MOD COMPATIBILITY
    if (player:getModData().DTKillsPath == nil or player:getModData().DTKillscheck2 == nil or player:getModData().DTatdTraits == nil or player:getModData().DTdoTraits == nil or player:getModData().DTOutdoorsCounter == nil or player:getModData().DTCatsEyesCounter == nil or player:getModData().DTRainTraits == nil or player:getModData().DTagoraClaustroCounter == nil or player:getModData().DTdaysSinceLastSmoke == nil or player:getModData().DTKillscheck == nil or player:getModData().DTtimesinceLastKill == nil or player:getModData().DThoursSinceLastDrink == nil or player:getModData().DTthresholdToObtainAlcoholic == nil or player:getModData().DTthresholdToObtainLoseAnorexy == nil or player:getModData().DTObtainLoseActiveSedentary == nil or player:getModData().DTKeenHardOfHearing == nil or player:getModData().DTSlowFastLearner == nil) then

        -- TRAITS CHANGE
        if player:HasTrait("PhysicallyActive2") then
            player:getTraits():remove("PhysicallyActive2");
            player:getTraits():add("PhysicallyActive");
        end
        if player:HasTrait("Handy2") then
            player:getTraits():remove("Handy2");
            player:getTraits():add("Handy");
        end

        -- INITIALIZATION FOR KILLS PATH
        if player:getModData().DTKillsPath == nil then
            if player:HasTrait("Cowardly") then
                player:getModData().DTKillsPath = 1;
            elseif player:HasTrait("Brave") then
                player:getModData().DTKillsPath = 2;
            else
                player:getModData().DTKillsPath = 3;
            end
        end
        -- INITIALIZATION FOR KILLS SYSTEM
        if player:getModData().DTKillscheck2 == nil then
            player:getModData().DTKillscheck2 = 0;
        end
        -- INITIALIZATION FOR DEXTROUS/ALLTHUMBS
        if player:getModData().DTatdTraits == nil then
            if player:HasTrait("AllThumbs") then
                player:getModData().DTatdTraits = 0;
            elseif player:HasTrait("Dextrous") then
                player:getModData().DTatdTraits = 120000;
            else
                player:getModData().DTatdTraits = 60000;
                end
        end
        -- INITIALIZATION FOR ORGANIZED/DISORGANIZED TRAITS
        if player:getModData().DTdoTraits == nil then
            if player:HasTrait("Disorganized") then
                player:getModData().DTdoTraits = 0;
            elseif player:HasTrait("Organized") then
                player:getModData().DTdoTraits = 200000;
            else
                player:getModData().DTdoTraits = 100000;
            end
        end
        -- INITIALIZATION FOR OUTDOORSMAN TRAIT
        if player:getModData().DTOutdoorsCounter == nil then
            player:getModData().DTOutdoorsCounter = 0;
        end
        -- INITIALIZATION FOR CATSEYES TRAIT
        if player:getModData().DTCatsEyesCounter == nil then
            player:getModData().DTCatsEyesCounter = 0;
        end
        -- INITIALIZATION FOR RAIN TRAITS
        if player:getModData().DTRainTraits == nil then
            if player:HasTrait("Pluviophile") then
                player:getModData().DTRainTraits = 100000;
            elseif player:HasTrait("Pluviophobia") then
                player:getModData().DTRainTraits = 0;
            else
                player:getModData().DTRainTraits = 50000;
            end
        end
        -- INITIALIZATION FOR CLAUSTROPHOBIC AND AGORAPHOBIC TRAITS
        if player:getModData().DTagoraClaustroCounter == nil then
            player:getModData().DTagoraClaustroCounter = 0;
        end
        -- INITIALIZATION FOR SMOKER TRAIT
        if player:getModData().DTdaysSinceLastSmoke == nil then
            player:getModData().DTdaysSinceLastSmoke = 0;
        end
        -- INITIALIZATION FOR BLOODLUST TRAIT
        if player:getModData().DTKillscheck == nil then
            player:getModData().DTKillscheck = 0;
        end
        if player:getModData().DTtimesinceLastKill == nil then
            player:getModData().DTtimesinceLastKill = 0;
        end
        -- INITIALIZATION FOR ALCOHOLIC TRAIT
        if player:getModData().DThoursSinceLastDrink == nil then
            player:getModData().DThoursSinceLastDrink = 0;
        end
        if player:getModData().DTthresholdToObtainAlcoholic == nil then
            player:getModData().DTthresholdToObtainAlcoholic = 0;
        end
        -- INITIALIZATION FOR ANOREXIC TRAIT
        if player:getModData().DTthresholdToObtainLoseAnorexy == nil then
            if player:HasTrait("Anorexy") then
                player:getModData().DTthresholdToObtainLoseAnorexy = -720;
            else
                player:getModData().DTthresholdToObtainLoseAnorexy = 0;
            end
        end
        -- INITIALIZATION FOR PHYSICALLY ACTIVE/SEDENTARY TRAITS
        if player:getModData().DTObtainLoseActiveSedentary == nil then 
            if player:HasTrait("PhysicallyActive") then
                player:getModData().DTObtainLoseActiveSedentary = 60000;
            elseif player:HasTrait("Sedentary") then
                player:getModData().DTObtainLoseActiveSedentary = -60000;
            else
                player:getModData().DTObtainLoseActiveSedentary = 0;
            end
        end
        -- INITIALIZATION FOR HARD OF HEARING AND KEEN HEARING TRAITS
        if player:getModData().DTKeenHardOfHearing == nil then 
            local total = 0;
            -- AGILITY SKILLS
            total = total + player:getPerkLevel(Perks.Sneak);
            total = total + player:getPerkLevel(Perks.Lightfoot);
            total = total + player:getPerkLevel(Perks.Nimble);
            -- FIREARMS SKILLS
            total = total + player:getPerkLevel(Perks.Aiming);
            -- COMBAT SKILLS
            total = total + player:getPerkLevel(Perks.Axe);
            total = total + player:getPerkLevel(Perks.Blunt);
            total = total + player:getPerkLevel(Perks.SmallBlunt);
            total = total + player:getPerkLevel(Perks.LongBlade);
            total = total + player:getPerkLevel(Perks.SmallBlade);
            total = total + player:getPerkLevel(Perks.Spear);
            -- SURVIVALIST SKILLS
            total = total + player:getPerkLevel(Perks.PlantScavenging);
            -- MOD DATA = TOTAL
            player:getModData().DTKeenHardOfHearing = total;
            -- CHECKS IF THE PLAYER HAS THE NECESSARY TO REMOVE HARD OF HEARING OR OBTAIN KEEN HEARING
            if player:getModData().DTKeenHardOfHearing >= 30 and player:HasTrait("HardOfHearing") then
                player:getTraits():remove("HardOfHearing");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_hardhear"), false, HaloTextHelper.getColorGreen());
            end
            if player:getModData().DTKeenHardOfHearing >= 50 and not player:HasTrait("KeenHearing") and not player:HasTrait("Deaf") then
                player:getTraits():add("KeenHearing");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_keenhearing"), true, HaloTextHelper.getColorGreen());
            end
        end
        -- INITIALIZATION FOR SLOW LEARNER AND FAST LEARNER TRAITS
        if player:getModData().DTSlowFastLearner == nil then 
            local total = 0;
            -- CRAFTING SKILLS
            total = total + player:getPerkLevel(Perks.Woodwork);
            total = total + player:getPerkLevel(Perks.Cooking);
            total = total + player:getPerkLevel(Perks.Farming);
            total = total + player:getPerkLevel(Perks.Doctor);
            total = total + player:getPerkLevel(Perks.Electricity);
            total = total + player:getPerkLevel(Perks.MetalWelding);
            total = total + player:getPerkLevel(Perks.Mechanics);
            total = total + player:getPerkLevel(Perks.Tailoring);
            -- SURVIVALIST SKILLS
            total = total + player:getPerkLevel(Perks.Fishing);
            total = total + player:getPerkLevel(Perks.Trapping);
            total = total + player:getPerkLevel(Perks.PlantScavenging);
            -- MOD DATA = TOTAL
            player:getModData().DTSlowFastLearner = total;
            -- CHECKS IF THE PLAYER HAS THE NECESSARY TO REMOVE SLOW LEARNER OR OBTAIN FAST LEARNER
            if player:getModData().DTSlowFastLearner >= 30 and player:HasTrait("SlowLearner") then
                player:getTraits():remove("SlowLearner");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_SlowLearner"), false, HaloTextHelper.getColorGreen());
            end
            if player:getModData().DTSlowFastLearner >= 50 and not player:HasTrait("FastLearner") then
                player:getTraits():add("FastLearner");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_FastLearner"), true, HaloTextHelper.getColorGreen());
            end
        end
    end
end

Events.OnGameBoot.Add(DTBaseGameCharacterDetails.DoTraits);
Events.OnGameBoot.Add(DTBaseGameCharacterDetails.DoProfessions);
Events.OnCreatePlayer.Add(DTBaseGameCharacterDetails.DoNewCharacterInitializations);