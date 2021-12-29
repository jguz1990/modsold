require('AutoSmoke')

AutoSmoke.Speak = {}

local cigarettePhrases = {
    'IGUI_AutoSmoke_Say_NoCigarettes_1',
    'IGUI_AutoSmoke_Say_NoCigarettes_2',
    'IGUI_AutoSmoke_Say_NoCigarettes_3',
}
local firePhrases = {
    'IGUI_AutoSmoke_Say_NoFire_1',
    'IGUI_AutoSmoke_Say_NoFire_2',
    'IGUI_AutoSmoke_Say_NoFire_3'
}
local fireSource = {
    'IGUI_AutoSmoke_Say_NoFire_Lighter',
    'IGUI_AutoSmoke_Say_NoFire_Matches'
}

local function shuffle(tbl)
    for i = #tbl, 2, -1 do
        local j = ZombRand(1, i)
        tbl[i], tbl[j] = tbl[j], tbl[i]
    end
end

local function sayNoCigarettes(phraseIndex)
    local phrase = getText(cigarettePhrases[phraseIndex])
    AutoSmoke.player:Say(phrase)
end

function AutoSmoke.Speak.noCigarettes()
    if AutoSmoke.pressedKey then
        sayNoCigarettes(ZombRand(#cigarettePhrases) + 1)
        return
    end

    local noCigsCount = AutoSmoke.player:getModData().autoSmoke.noCigsCount
    if noCigsCount == 0 then shuffle(cigarettePhrases) end
    if noCigsCount < 3 and ZombRand(1, noCigsCount * 2 + 1) == 1 then
        noCigsCount = noCigsCount + 1

        sayNoCigarettes(noCigsCount)
        AutoSmoke.player:getModData().autoSmoke.noCigsCount = noCigsCount
    end
end

local function sayNoFire(phraseIndex)
    local phrase = getText(firePhrases[phraseIndex], getText(fireSource[ZombRand(1, 3)]))
    AutoSmoke.player:Say(phrase)
end

function AutoSmoke.Speak.noFireSource()
    if AutoSmoke.pressedKey then
        sayNoFire(ZombRand(#firePhrases) + 1)
        return
    end

    local noFireCount = AutoSmoke.player:getModData().autoSmoke.noFireCount
    if noFireCount == 0 then shuffle(firePhrases) end
    if noFireCount < 3 and ZombRand(1, noFireCount * 2 + 1) == 1 then
        noFireCount = noFireCount + 1

        sayNoFire(noFireCount)
        AutoSmoke.player:getModData().autoSmoke.noFireCount = noFireCount
    end
end

function AutoSmoke.Speak.reset()
    AutoSmoke.player:getModData().autoSmoke.noCigsCount = 0
    AutoSmoke.player:getModData().autoSmoke.noFireCount = 0
end

function AutoSmoke.Speak.init()
    if not AutoSmoke.player:getModData().autoSmoke then
        AutoSmoke.player:getModData().autoSmoke = {
            noCigsCount = 0,
            noFireCount = 0
        }
    end
end