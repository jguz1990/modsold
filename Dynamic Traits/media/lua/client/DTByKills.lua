function traitsGainsByKills(zombie)
    for playerIndex = 0, getNumActivePlayers()-1 do
        local player = getSpecificPlayer(playerIndex);
        if player:HasTrait("Agoraphobic") or player:HasTrait("Claustophobic") then
            if ZombRand(15) == 0 then
                player:getModData().DTagoraClaustroCounter = player:getModData().DTagoraClaustroCounter + ZombRand(5);
            end
        end
        if player:getHoursSurvived() > 360 then
            if player:getZombieKills() > player:getModData().DTKillscheck2 then
                -- TRAITS GAINED/LOST BY KILLS BASED ON THE PATH
                ----- THE PLAYER STARTED WITH COWARDLY -----
                if player:getModData().DTKillsPath == 1 then
                    if player:HasTrait("Cowardly") then
                        -- AFTER EVERY ZOMBIE KILL THERE ARE CHANCES OF REMOVING COWARDLY (AT 2000 KILL IF THE TRAIT IS STILL THERE IT IS REMOVED)
                        if DTrandomNumberForKills(player, 2000) == 0 then
                            player:getTraits():remove("Cowardly");
                            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_cowardly"), false, HaloTextHelper.getColorGreen());
                        end
                    else
                        -- AFTER EVERY ZOMBIE KILL THERE ARE CHANCES OF REMOVING HEMOPHOBIC (AT 3000 KILL IF THE TRAIT IS STILL THERE IT IS REMOVED)
                        if player:HasTrait("Hemophobic") then
                            if DTrandomNumberForKills(player, 3000) == 0 then
                                player:getTraits():remove("Hemophobic");
                                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Hemophobic"), false, HaloTextHelper.getColorGreen());
                            end
                        else
                            -- AFTER EVERY ZOMBIE KILL THERE ARE CHANCES OF ADDING BRAVE (AT 4000 KILL IF THE TRAIT IS NOT THERE IT IS ADDED)
                            if not player:HasTrait("Brave") and not player:HasTrait("Desensitized") and not player:HasTrait("Agoraphobic") and not player:HasTrait("Claustophobic") then
                                if DTrandomNumberForKills(player, 4000) == 0 then
                                    player:getTraits():add("Brave");
                                    HaloTextHelper.addTextWithArrow(player, getText("UI_trait_brave"), true, HaloTextHelper.getColorGreen());
                                end
                            else
                                -- AFTER EVERY ZOMBIE KILL THERE ARE CHANCES OF ADDING DESENSITIZED (AT 6000 KILL IF THE TRAIT IS NOT THERE IT IS ADDED)
                                if not player:HasTrait("Desensitized") and not player:HasTrait("Agoraphobic") and not player:HasTrait("Claustophobic") then
                                    if DTrandomNumberForKills(player, 6000) == 0 then
                                        if player:HasTrait("AdrenalineJunkie") then
                                            player:getTraits():remove("AdrenalineJunkie");
                                            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_AdrenalineJunkie"), false, HaloTextHelper.getColorGreen());
                                        end
                                        if player:HasTrait("Pacifist") then
                                            player:getTraits():remove("Pacifist");
                                            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Pacifist"), false, HaloTextHelper.getColorGreen());
                                        end
                                        if player:HasTrait("Nightmares") then
                                            player:getTraits():remove("Nightmares");
                                            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Nightmares"), false, HaloTextHelper.getColorGreen());
                                        end
                                        player:getTraits():remove("Brave");
                                        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_brave"), false, HaloTextHelper.getColorGreen());
                                        player:getTraits():add("Desensitized");
                                        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Desensitized"), true, HaloTextHelper.getColorGreen());
                                    end
                                end
                            end
                        end
                    end
                ----- THE PLAYER STARTED WITH BRAVE ----- 
                elseif player:getModData().DTKillsPath == 2 then
                    -- AFTER EVERY ZOMBIE KILL THERE ARE CHANCES OF ADDING DESENSITIZED (AT 3000 KILL IF THE TRAIT IS NOT THERE IT IS ADDED)
                    if not player:HasTrait("Desensitized") and not player:HasTrait("Agoraphobic") and not player:HasTrait("Claustophobic") then
                        if DTrandomNumberForKills(player, 3000) == 0 then
                            if player:HasTrait("AdrenalineJunkie") then
                                player:getTraits():remove("AdrenalineJunkie");
                                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_AdrenalineJunkie"), false, HaloTextHelper.getColorGreen());
                            end
                            if player:HasTrait("Pacifist") then
                                player:getTraits():remove("Pacifist");
                                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Pacifist"), false, HaloTextHelper.getColorGreen());
                            end
                            if player:HasTrait("Nightmares") then
                                player:getTraits():remove("Nightmares");
                                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Nightmares"), false, HaloTextHelper.getColorGreen());
                            end
                            player:getTraits():remove("Brave");
                            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_brave"), false, HaloTextHelper.getColorGreen());
                            player:getTraits():add("Desensitized");
                            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Desensitized"), true, HaloTextHelper.getColorGreen());
                        end
                    end
                ----- THE PLAYER STARTED WITHOUT TRAITS -----
                else
                    -- AFTER EVERY ZOMBIE KILL THERE ARE CHANCES OF REMOVING HEMOPHOBIC (AT 2000 KILL IF THE TRAIT IS STILL THERE IT IS REMOVED)
                    if player:HasTrait("Hemophobic") then
                        if DTrandomNumberForKills(player, 2000) == 0 then
                            player:getTraits():remove("Hemophobic");
                            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Hemophobic"), false, HaloTextHelper.getColorGreen());
                        end
                    else
                        -- AFTER EVERY ZOMBIE KILL THERE ARE CHANCES OF ADDING BRAVE (AT 3000 KILL IF THE TRAIT IS NOT THERE IT IS ADDED)
                        if not player:HasTrait("Brave") and not player:HasTrait("Desensitized") and not player:HasTrait("Agoraphobic") and not player:HasTrait("Claustophobic") then
                            if DTrandomNumberForKills(player, 3000) == 0 then
                                player:getTraits():add("Brave");
                                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_brave"), true, HaloTextHelper.getColorGreen());
                            end
                        else
                            -- AFTER EVERY ZOMBIE KILL THERE ARE CHANCES OF ADDING DESENSITIZED (AT 5000 KILL IF THE TRAIT IS NOT THERE IT IS ADDED)
                            if not player:HasTrait("Desensitized") and not player:HasTrait("Agoraphobic") and not player:HasTrait("Claustophobic") then
                                if DTrandomNumberForKills(player, 5000) == 0 then
                                    if player:HasTrait("AdrenalineJunkie") then
                                        player:getTraits():remove("AdrenalineJunkie");
                                        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_AdrenalineJunkie"), false, HaloTextHelper.getColorGreen());
                                    end
                                    if player:HasTrait("Pacifist") then
                                        player:getTraits():remove("Pacifist");
                                        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Pacifist"), false, HaloTextHelper.getColorGreen());
                                    end
                                    if player:HasTrait("Nightmares") then
                                        player:getTraits():remove("Nightmares");
                                        HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Nightmares"), false, HaloTextHelper.getColorGreen());
                                    end
                                    player:getTraits():remove("Brave");
                                    HaloTextHelper.addTextWithArrow(player, getText("UI_trait_brave"), false, HaloTextHelper.getColorGreen());
                                    player:getTraits():add("Desensitized");
                                    HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Desensitized"), true, HaloTextHelper.getColorGreen());
                                end
                            end
                        end
                    end
                end
            end
            player:getModData().DTKillscheck2 = player:getZombieKills();
        end
    end
end
Events.OnZombieDead.Add(traitsGainsByKills);