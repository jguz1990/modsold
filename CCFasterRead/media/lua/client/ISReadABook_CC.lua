require ('ISReadABook');

function ISReadABook:new(character, item, time)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.character = character;
    o.item = item;
    o.stopOnWalk = true;
    o.stopOnRun = true;

    local numPages
    if item:getNumberOfPages() > 0 then
        ISReadABook.checkLevel(character, item)
        item:setAlreadyReadPages(character:getAlreadyReadPages(item:getFullType()))
        o.startPage = item:getAlreadyReadPages()
        numPages = item:getNumberOfPages() -- item:getAlreadyReadPages()
    else
        numPages = 5
    end
    if isClient() then
        o.minutesPerPage = getServerOptions():getFloat("MinutesPerPage") or 1.0
        if o.minutesPerPage < 0.0 then o.minutesPerPage = 1.0 end
    else
        o.minutesPerPage = 2.0
    end
    local f = 1 / getGameTime():getMinutesPerDay() / 2
    time = numPages * o.minutesPerPage / f
	time = time / 100

    if(character:HasTrait("FastReader")) then
        time = time * 0.7;
    end
    if(character:HasTrait("SlowReader")) then
        time = time * 1.3;
    end

    if SkillBook[item:getSkillTrained()] then
        if item:getLvlSkillTrained() == 1 then
            o.maxMultiplier = SkillBook[item:getSkillTrained()].maxMultiplier1;
        elseif item:getLvlSkillTrained() == 3 then
            o.maxMultiplier = SkillBook[item:getSkillTrained()].maxMultiplier2;
        elseif item:getLvlSkillTrained() == 5 then
            o.maxMultiplier = SkillBook[item:getSkillTrained()].maxMultiplier3;
        elseif item:getLvlSkillTrained() == 7 then
            o.maxMultiplier = SkillBook[item:getSkillTrained()].maxMultiplier4;
        elseif item:getLvlSkillTrained() == 9 then
            o.maxMultiplier = SkillBook[item:getSkillTrained()].maxMultiplier5;
        else
            o.maxMultiplier = 1
            print('ERROR: book has unhandled skill level ' .. item:getLvlSkillTrained())
        end
    end
    o.ignoreHandsWounds = true;
    o.maxTime = time;
    o.caloriesModifier = 0.5;
    o.pageTimer = 0;
    o.forceProgressBar = true;
    if character:isTimedActionInstant() then
        o.maxTime = 1;
    end

    return o;
end
