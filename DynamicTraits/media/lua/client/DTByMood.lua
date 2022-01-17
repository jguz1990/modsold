function traitsByMoods(player)
    -- Gain trait "Needs More Sleep" when being "Very bored" and is removed when the Boredom is restored.
    if player:getMoodles():getMoodleLevel(MoodleType.Bored) >= 2 then
        if not player:HasTrait("NeedsMoreSleep") then
            if player:HasTrait("NeedsLessSleep") then
                player:getTraits():remove("NeedsLessSleep");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_LessSleep"), false, HaloTextHelper.getColorRed());
            end
            player:getTraits():add("NeedsMoreSleep");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_MoreSleep"), true, HaloTextHelper.getColorRed());
        end
    else
        if player:HasTrait("NeedsMoreSleep") then
            player:getTraits():remove("NeedsMoreSleep");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_MoreSleep"), false, HaloTextHelper.getColorGreen());
        end
    end
    -- Gain trait "Insomniac" when being "Depressed" or "Very Hungry/Starvation" and is removed when the Depression is restored or the character is well fed.
    if player:getMoodles():getMoodleLevel(MoodleType.Unhappy) >= 3 or player:getMoodles():getMoodleLevel(MoodleType.Hungry) >= 3 then
        if not player:HasTrait("Insomniac") then
            if player:HasTrait("NeedsLessSleep") then
                player:getTraits():remove("NeedsLessSleep");
                HaloTextHelper.addTextWithArrow(player, getText("UI_trait_LessSleep"), false, HaloTextHelper.getColorRed());
            end
            player:getTraits():add("Insomniac");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Insomniac"), true, HaloTextHelper.getColorRed());
        end
    else
        if player:HasTrait("Insomniac") then
            player:getTraits():remove("Insomniac");
            HaloTextHelper.addTextWithArrow(player, getText("UI_trait_Insomniac"), false, HaloTextHelper.getColorGreen());
        end
    end
end
Events.OnPlayerUpdate.Add(traitsByMoods);