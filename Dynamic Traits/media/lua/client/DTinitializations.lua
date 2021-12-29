-- DYNAMIC TRAITS INITIALIZATIONS
function DTmodDataInitialization(playernum, character)
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
end
Events.OnCreatePlayer.Add(DTmodDataInitialization);

-- DYNAMIC TRAITS INITIALIZATIONS EXISTING GAMES
function existingGamesInitializations(player)
    -- SUPERB/SUBPAR SURVIVORS AND NPC MOD COMPATIBILITY
    if (player:getModData().DTKillsPath == nil or player:getModData().DTKillscheck2 == nil or player:getModData().DTatdTraits == nil or player:getModData().DTdoTraits == nil or player:getModData().DTOutdoorsCounter == nil or player:getModData().DTCatsEyesCounter == nil or player:getModData().DTRainTraits == nil or player:getModData().DTagoraClaustroCounter == nil or player:getModData().DTdaysSinceLastSmoke == nil or player:getModData().DTKillscheck == nil or player:getModData().DTtimesinceLastKill == nil or player:getModData().DThoursSinceLastDrink == nil or player:getModData().DTthresholdToObtainAlcoholic == nil or player:getModData().DTthresholdToObtainLoseAnorexy == nil or player:getModData().DTObtainLoseActiveSedentary == nil) then
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
    end
end
--Events.OnPlayerUpdate.Add(existingGamesInitializations);