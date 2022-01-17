local BURGLAR_ID = 'burglar';

local function initProfessions()
    local burglar = ProfessionFactory.getProfession(BURGLAR_ID);
    burglar:addFreeTrait("nimblefingers")
end

Events.OnGameBoot.Add(initProfessions);


local function onNewGame(player)
    if player:getDescriptor():getProfession() == "burglar" then       
        local proflist = {"Lockpicking"};
        local profskills = {};
        profskills["Lockpicking"] = {};
        profskills["Lockpicking"].level = 2
        profskills["Lockpicking"].boost = 3
        profskills["Lockpicking"].xp = 225
        player:getModData().proflist = proflist;
        player:getModData().profskills = profskills
    elseif player:HasTrait("nimblefingers2") then
        local proflist = {"Lockpicking"};
        local profskills = {};
        profskills["Lockpicking"] = {};
        profskills["Lockpicking"].level = 0
        profskills["Lockpicking"].boost = 2
        profskills["Lockpicking"].xp = 0
        player:getModData().proflist = proflist;
        player:getModData().profskills = profskills
    end
end

Events.OnNewGame.Add(onNewGame)

