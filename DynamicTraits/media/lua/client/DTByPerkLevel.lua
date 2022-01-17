-- Traits gains based on skills levels are going to be handled in this function.
function traitsGainsByLevel(player, perk, perkLevel, addBuffer)
    -- CALL TO INITIALIZATIONS METHOD TO PREVENT LUA ERRORS WHEN A CHARACTER IS CREATED AND HAS PERK LEVELS (THE LEVEL PERK EVENT IS CALLED WHEN THE ASSIGNING THE STARTING PERK LEVELS)
    if player:getModData().DTSlowFastLearner == nil or player:getModData().DTKeenHardOfHearing == nil then
        DTBaseGameCharacterDetails.DoExistingCharacterInitializations(player);
    end
    --------------- AGILITY SKILLS ---------------
    -- SPRINTING
    if perk == Perks.Sprinting then
        -- Gaining Trait "Jogger" when reaching Sprinting Lv4
        if perkLevel >= 4 and not player:HasTrait("Jogger") then
            player:getTraits():add("Jogger");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Jogger"), true, HaloTextHelper.getColorGreen());
            player:getXp():addXpMultiplier(Perks.Sprinting, 2, perkLevel, 10);
        end    
        -- Remove XP Multipliers at Lv10
        if perkLevel == 10 then
            player:getXp():addXpMultiplier(Perks.Sprinting, 1, perkLevel, 10); -- NPC MOD LUA ERROR FIX WHEN NPC SPAWN
            player:getXp():getMultiplierMap():remove(Perks.Sprinting);
        end
    end

    -- SNEAK
    if perk == Perks.Sneak then
        -- Gain trait "Hunter" if the next requirements are met: Lv3 of Aiming, Lv3 of Trapping, Lv3 of Sneak, Lv3 of SmallBlade.
        -- Case 3 Leveling Up Sneak
        if perkLevel >= 3 and player:getPerkLevel(Perks.Aiming) >= 3 and player:getPerkLevel(Perks.Trapping) >= 3 and player:getPerkLevel(Perks.SmallBlade) >= 3 and not player:HasTrait("Hunter") then
            player:getTraits():add("Hunter");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Hunter"), true, HaloTextHelper.getColorGreen());
        end
        -- Losing Trait "Conspicuous" when reaching Sneak Lv3
        if perkLevel >= 3 and player:HasTrait("Conspicuous") then
            player:getTraits():remove("Conspicuous");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Conspicuous"), false, HaloTextHelper.getColorGreen());
        end    
        -- Gaining Trait "Inconspicuous" when reaching Sneak Lv5
        if perkLevel >= 5 and not player:HasTrait("Inconspicuous") then
            if player:HasTrait("Conspicuous") then
                player:getTraits():remove("Conspicuous");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Conspicuous"), false, HaloTextHelper.getColorGreen());
            end
            player:getTraits():add("Inconspicuous");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Inconspicuous"), true, HaloTextHelper.getColorGreen());
        end
        player:getModData().DTKeenHardOfHearing = player:getModData().DTKeenHardOfHearing + 1;
    end
    -- LIGHTFOOT
    if perk == Perks.Lightfoot then
        -- Losing Trait "Clumsy" when reaching Lightfoot Lv3
        if perkLevel >= 3 and player:HasTrait("Clumsy") then
            player:getTraits():remove("Clumsy");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_clumsy"), false, HaloTextHelper.getColorGreen());
        end
        -- Gaining Trait "Graceful" when reaching Lightfoot Lv5
        if perkLevel >= 5 and not player:HasTrait("Graceful") then
            if player:HasTrait("Clumsy") then
                player:getTraits():remove("Clumsy");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_clumsy"), false, HaloTextHelper.getColorGreen());
            end
            player:getTraits():add("Graceful");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_graceful"), true, HaloTextHelper.getColorGreen());
        end
        -- Gain Trait "Gymnast" when reaching Nimble Lv4 and Lightfoot Lv6.
        -- Case 1: Leveling Up Lightfoot.
        if perkLevel >= 6 and player:getPerkLevel(Perks.Nimble) >= 4 and not player:HasTrait("Gymnast") then 
            player:getTraits():add("Gymnast");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Gymnast"), true, HaloTextHelper.getColorGreen());
            player:getXp():addXpMultiplier(Perks.Lightfoot, 2, perkLevel, 10);
            if player:getPerkLevel(Perks.Nimble) < 10 then
                player:getXp():addXpMultiplier(Perks.Nimble, 2, player:getPerkLevel(Perks.Nimble), 10);
            end
        end
        -- Remove XP Multipliers at Lv10
        if perkLevel == 10 then
            player:getXp():addXpMultiplier(Perks.Lightfoot, 1, perkLevel, 10); -- NPC MOD LUA ERROR FIX WHEN NPC SPAWN
            player:getXp():getMultiplierMap():remove(Perks.Lightfoot);
        end
        player:getModData().DTKeenHardOfHearing = player:getModData().DTKeenHardOfHearing + 1;
    end

    -- NIMBLE
    if perk == Perks.Nimble then
        -- Gain trait "Burglar" if the next requirements are met: Lv2 of Mechanics, Lv1 of Electronics, Lv1 of Nimble.
        -- Case 3: Leveling Up Nimble.
        if perkLevel >= 1 and player:getPerkLevel(Perks.Electricity) >= 1 and player:getPerkLevel(Perks.Mechanics) >= 2 and not player:HasTrait("Burglar") then
            player:getTraits():add("Burglar");
            HaloTextHelper.addTextWithArrow(player, getText("UI_prof_Burglar"), true, HaloTextHelper.getColorGreen());
        end
        -- Gain Trait "Gymnast" when reaching Nimble Lv4 and Lightfoot Lv6.
        -- Case 2: Leveling Up Nimble.
        if perkLevel >= 4 and player:getPerkLevel(Perks.Lightfoot) >= 6 and not player:HasTrait("Gymnast") then 
            player:getTraits():add("Gymnast");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Gymnast"), true, HaloTextHelper.getColorGreen());
            player:getXp():addXpMultiplier(Perks.Nimble, 2, perkLevel, 10);
            if player:getPerkLevel(Perks.Lightfoot) < 10 then
                player:getXp():addXpMultiplier(Perks.Lightfoot, 2, player:getPerkLevel(Perks.Lightfoot), 10);
            end
        end
        -- Remove XP Multipliers at Lv10
        if perkLevel == 10 then
            player:getXp():addXpMultiplier(Perks.Nimble, 1, perkLevel, 10); -- NPC MOD LUA ERROR FIX WHEN NPC SPAWN
            player:getXp():getMultiplierMap():remove(Perks.Nimble);
        end
        player:getModData().DTKeenHardOfHearing = player:getModData().DTKeenHardOfHearing + 1;
    end

    --------------- FIREARMS SKILLS ---------------
    -- AIMING
    if perk == Perks.Aiming then
        -- Gain trait "Hunter" if the next requirements are met: Lv3 of Aiming, Lv3 of Trapping, Lv3 of Sneak, Lv3 of SmallBlade.
        -- Case 1 Leveling Up Aiming
        if perkLevel >= 3 and player:getPerkLevel(Perks.Trapping) >= 3 and player:getPerkLevel(Perks.Sneak) >= 3 and player:getPerkLevel(Perks.SmallBlade) >= 3 and not player:HasTrait("Hunter") then
            player:getTraits():add("Hunter");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Hunter"), true, HaloTextHelper.getColorGreen());
        end
        -- Gain Trait "EagleEyed" when reaching Aiming Lv5.
        if perkLevel >= 5 and not player:HasTrait("EagleEyed") and not player:HasTrait("ShortSighted") then
            player:getTraits():add("EagleEyed");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_eagleeyed"), true, HaloTextHelper.getColorGreen());
        end
        player:getModData().DTKeenHardOfHearing = player:getModData().DTKeenHardOfHearing + 1;
    end

    --------------- COMBAT SKILLS ---------------
    -- AXE
    if perk == Perks.Axe then
        -- Gain Trait "Brawler" when reaching Axe Lv5 and Long Blunt Lv6.
        -- Case 1: Leveling Up Axe.
        if perkLevel >= 5 and player:getPerkLevel(Perks.Blunt) >= 6 and not player:HasTrait("Brawler") then 
            player:getTraits():add("Brawler");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_BarFighter"), true, HaloTextHelper.getColorGreen());
            player:getXp():getMultiplierMap():remove(Perks.Blunt);
            player:getXp():addXpMultiplier(Perks.Axe, 2, perkLevel, 10);
            if player:getPerkLevel(Perks.Blunt) < 10 then
                player:getXp():addXpMultiplier(Perks.Blunt, 3, player:getPerkLevel(Perks.Blunt), 10);
            end
        end
        -- Gain Trait "Axeman" when reaching Axe Lv7
        if perkLevel >= 7 and not player:HasTrait("Axeman") then
            player:getTraits():add("Axeman");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_axeman"), true, HaloTextHelper.getColorGreen());
        end
        -- Remove XP Multipliers at Lv10
        if perkLevel == 10 then
            player:getXp():addXpMultiplier(Perks.Axe, 1, perkLevel, 10); -- NPC MOD LUA ERROR FIX WHEN NPC SPAWN
            player:getXp():getMultiplierMap():remove(Perks.Axe);
        end
        player:getModData().DTKeenHardOfHearing = player:getModData().DTKeenHardOfHearing + 1;
    end

    -- LONG BLUNT
    if perk == Perks.Blunt then
        -- Gain Trait "Baseball player" when reaching Long blunt Lv4
        if perkLevel >= 4 and not player:HasTrait("BaseballPlayer") then
            player:getTraits():add("BaseballPlayer");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_PlaysBaseball"), true, HaloTextHelper.getColorGreen());
            player:getXp():addXpMultiplier(Perks.Blunt, 2, perkLevel, 10);
        end
        -- Gain Trait "Brawler" when reaching Axe Lv5 and Long Blunt Lv6.
        -- Case 2: Leveling Up Long Blunt.
        if perkLevel >= 6 and player:getPerkLevel(Perks.Axe) >= 5 and not player:HasTrait("Brawler") then 
            player:getTraits():add("Brawler");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_BarFighter"), true, HaloTextHelper.getColorGreen());
            player:getXp():getMultiplierMap():remove(Perks.Blunt);
            player:getXp():addXpMultiplier(Perks.Blunt, 3, perkLevel, 10);
            if player:getPerkLevel(Perks.Axe) < 10 then
                player:getXp():addXpMultiplier(Perks.Axe, 2, player:getPerkLevel(Perks.Axe), 10);
            end
        end
        -- Remove XP Multipliers at Lv10
        if perkLevel == 10 then
            player:getXp():addXpMultiplier(Perks.Blunt, 1, perkLevel, 10); -- NPC MOD LUA ERROR FIX WHEN NPC SPAWN
            player:getXp():getMultiplierMap():remove(Perks.Blunt);
        end
        player:getModData().DTKeenHardOfHearing = player:getModData().DTKeenHardOfHearing + 1;
    end

    -- SMALL BLUNT
    if perk == Perks.SmallBlunt then
        player:getModData().DTKeenHardOfHearing = player:getModData().DTKeenHardOfHearing + 1;
    end

    -- LONG BLADE
    if perk == Perks.LongBlade then
        player:getModData().DTKeenHardOfHearing = player:getModData().DTKeenHardOfHearing + 1;
    end

    -- SMALL BLADE
    if perk == Perks.SmallBlade then
        -- Gain trait "Hunter" if the next requirements are met: Lv3 of Aiming, Lv3 of Trapping, Lv3 of Sneak, Lv3 of SmallBlade.
        -- Case 4 Leveling Up SmallBlade
        if perkLevel >= 3 and player:getPerkLevel(Perks.Aiming) >= 3 and player:getPerkLevel(Perks.Trapping) >= 3 and player:getPerkLevel(Perks.Sneak) >= 3 and not player:HasTrait("Hunter") then
            player:getTraits():add("Hunter");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Hunter"), true, HaloTextHelper.getColorGreen());
        end
        player:getModData().DTKeenHardOfHearing = player:getModData().DTKeenHardOfHearing + 1;
    end

    -- SPEAR
    if perk == Perks.Spear then
        player:getModData().DTKeenHardOfHearing = player:getModData().DTKeenHardOfHearing + 1;
    end

    --------------- CRAFTING SKILLS ---------------
    -- CARPENTRY
    if perk == Perks.Woodwork then
        -- Gain Trait "Handy" when reaching Carpentry Lv8
        if perkLevel >= 8 and not player:HasTrait("Handy") then
            player:getTraits():add("Handy");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_handy"), true, HaloTextHelper.getColorGreen());
        end
        player:getModData().DTSlowFastLearner = player:getModData().DTSlowFastLearner + 1;
    end

    -- COOKING
    if perk == Perks.Cooking then
        -- Gain Trait "Cook" when reaching Cooking Lv7
        if perkLevel >= 7 and not player:HasTrait("Cook") then
            player:getTraits():add("Cook");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Cook"), true, HaloTextHelper.getColorGreen());
        end
        -- Gain Trait "Nutritionist" when reaching Cooking Lv10
        if perkLevel == 10 and not player:HasTrait("Nutritionist") then
            player:getTraits():add("Nutritionist");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_nutritionist"), true, HaloTextHelper.getColorGreen());
        end
        player:getModData().DTSlowFastLearner = player:getModData().DTSlowFastLearner + 1;
    end

    -- FARMING
    if perk == Perks.Farming then
        if perkLevel >= 8 and not player:HasTrait("Gardener") then
            player:getTraits():add("Gardener");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Gardener"), true, HaloTextHelper.getColorGreen());
        end
        player:getModData().DTSlowFastLearner = player:getModData().DTSlowFastLearner + 1;
    end

    -- DOCTOR
    if perk == Perks.Doctor then
        player:getModData().DTSlowFastLearner = player:getModData().DTSlowFastLearner + 1;
    end

    -- ELECTRONIC
    if perk == Perks.Electricity then
        -- Gain trait "Burglar" if the next requirements are met: Lv2 of Mechanics, Lv1 of Electronics, Lv1 of Nimble.
        -- Case 2: Leveling Up Electronics
        if perkLevel >= 1 and player:getPerkLevel(Perks.Mechanics) >= 2 and player:getPerkLevel(Perks.Nimble) >= 1 and not player:HasTrait("Burglar") then
            player:getTraits():add("Burglar");
            HaloTextHelper.addTextWithArrow(player, getText("UI_prof_Burglar"), true, HaloTextHelper.getColorGreen());
        end
        -- Gain Trait "AmateurElectrician" when reaching Electronic Lv3
        if perkLevel >= 3 and not player:HasTrait("AmateurElectrician") then
            player:getTraits():add("AmateurElectrician");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_AmateurElectrician"), true, HaloTextHelper.getColorGreen());
            playerRecipes = player:getKnownRecipes();
            if not playerRecipes:contains("Generator") then
                playerRecipes:add("Generator");
            end
        end
        player:getModData().DTSlowFastLearner = player:getModData().DTSlowFastLearner + 1;
    end

    -- METALWELDING
    if perk == Perks.MetalWelding then
        player:getModData().DTSlowFastLearner = player:getModData().DTSlowFastLearner + 1;
    end

    -- MECHANICS
    if perk == Perks.Mechanics then
        -- Gain trait "Burglar" if the next requirements are met: Lv2 of Mechanics, Lv1 of Electronics, Lv1 of Nimble.
        -- Case 1: Leveling Up Mechanics
        if perkLevel >= 2 and player:getPerkLevel(Perks.Electricity) >= 1 and player:getPerkLevel(Perks.Nimble) >= 1 and not player:HasTrait("Burglar") then
            player:getTraits():add("Burglar");
            HaloTextHelper.addTextWithArrow(player, getText("UI_prof_Burglar"), true, HaloTextHelper.getColorGreen());
        end
        player:getModData().DTSlowFastLearner = player:getModData().DTSlowFastLearner + 1;
    end

    -- TAILORING
    if perk == Perks.Tailoring then
        player:getModData().DTSlowFastLearner = player:getModData().DTSlowFastLearner + 1;
    end

    --------------- SURVIVALIST SKILLS ---------------
    -- FISHING
    if perk == Perks.Fishing then
        player:getModData().DTSlowFastLearner = player:getModData().DTSlowFastLearner + 1;
    end

    -- TRAPPING
    if perk == Perks.Trapping then
        -- Gain trait "Formerscout" if the next requirements are met: Lv2 of PlantScavenging, Lv2 of Trapping.
        -- Case 2: Leveling Up Trapping
        if perkLevel >= 2 and player:getPerkLevel(Perks.PlantScavenging) >= 2 and not player:HasTrait("Formerscout") then
            player:getTraits():add("Formerscout");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Scout"), true, HaloTextHelper.getColorGreen());
        end
        -- Gain trait "Hiker" if the next requirements are met: Lv4 of PlantScavenging, Lv2 of Trapping.
        -- Case 2: Leveling Up Trapping
        if perkLevel >= 2 and player:getPerkLevel(Perks.PlantScavenging) >= 4 and not player:HasTrait("Hiker") then
            player:getTraits():add("Hiker");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Hiker"), true, HaloTextHelper.getColorGreen());
        end
        -- Gain trait "Hunter" if the next requirements are met: Lv3 of Aiming, Lv3 of Trapping, Lv3 of Sneak, Lv3 of SmallBlade.
        -- Case 2 Leveling Up Trapping
        if perkLevel >= 3 and player:getPerkLevel(Perks.Aiming) >= 3 and player:getPerkLevel(Perks.Sneak) >= 3 and player:getPerkLevel(Perks.SmallBlade) >= 3 and not player:HasTrait("Hunter") then
            player:getTraits():add("Hunter");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Hunter"), true, HaloTextHelper.getColorGreen());
        end
        player:getModData().DTSlowFastLearner = player:getModData().DTSlowFastLearner + 1;
    end

    -- FORAGING
    if perk == Perks.PlantScavenging then
        -- Gain trait "Formerscout" if the next requirements are met: Lv2 of PlantScavenging, Lv2 of Trapping.
        -- Case 1: Leveling Up Plant Scavenging.
        if perkLevel >= 2 and player:getPerkLevel(Perks.Trapping) >= 2 and not player:HasTrait("Formerscout") then
            player:getTraits():add("Formerscout");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Scout"), true, HaloTextHelper.getColorGreen());
        end
        -- Gain trait "Hiker" if the next requirements are met: Lv4 of PlantScavenging, Lv2 of Trapping.
        -- Case 1: Leveling Up PlantScavenging
        if perkLevel >= 4 and player:getPerkLevel(Perks.Trapping) >= 2 and not player:HasTrait("Hiker") then
            player:getTraits():add("Hiker");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Hiker"), true, HaloTextHelper.getColorGreen());
        end
        -- Gain Trait "Herbalist" when reaching Foraging Lv4
        if perkLevel >= 4 and not player:HasTrait("Herbalist") then
            player:getTraits():add("Herbalist");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Herbalist"), true, HaloTextHelper.getColorGreen());
            playerRecipes = player:getKnownRecipes();
            if not playerRecipes:contains("Herbalist") then
                playerRecipes:add("Herbalist");
            end
        end
        player:getModData().DTKeenHardOfHearing = player:getModData().DTKeenHardOfHearing + 1;
        player:getModData().DTSlowFastLearner = player:getModData().DTSlowFastLearner + 1;
    end
    -- CHECKS IF THE PLAYER HAS THE NECESSARY TO REMOVE SLOW LEARNER OR OBTAIN FAST LEARNER
    if player:getModData().DTSlowFastLearner >= 30 and player:HasTrait("SlowLearner") then
        player:getTraits():remove("SlowLearner");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_SlowLearner"), false, HaloTextHelper.getColorGreen());
    end
    if player:getModData().DTSlowFastLearner >= 50 and not player:HasTrait("FastLearner") then
        player:getTraits():add("FastLearner");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_FastLearner"), true, HaloTextHelper.getColorGreen());
    end
    -- CHECKS IF THE PLAYER HAS THE NECESSARY TO REMOVE HARD OF HEARING OR OBTAIN KEEN HEARING
    if player:getModData().DTKeenHardOfHearing >= 30 and player:HasTrait("HardOfHearing") then
        player:getTraits():remove("HardOfHearing");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_hardhear"), false, HaloTextHelper.getColorGreen());
    end
    if player:getModData().DTKeenHardOfHearing >= 50 and not player:HasTrait("KeenHearing") and not player:HasTrait("Deaf") then
        player:getTraits():add("KeenHearing");
        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_keenhearing"), true, HaloTextHelper.getColorGreen());
    end
    --[[ local playerTraits = player:getTraits();
    local array = {};
    for i=0, playerTraits:size()-1 do
        local trait = playerTraits:get(i);
        array[i] = trait;
        print(array[i]);
    end
    player:applyTraits(array); ]]
    --print("player:getModData().DTKeenHardOfHearing: " .. player:getModData().DTKeenHardOfHearing);
    --print("player:getModData().DTSlowFastLearner: " .. player:getModData().DTSlowFastLearner);
end
Events.LevelPerk.Add(traitsGainsByLevel);