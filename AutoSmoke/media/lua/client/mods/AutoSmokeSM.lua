require('AutoSmoke')

AutoSmoke.Smoker = {}
AutoSmoke.Smoker.modId = "Smoker"
AutoSmoke.Smoker.modName = "Smoker"
AutoSmoke.Smoker.hasGum = true
AutoSmoke.Smoker.unpackAction = function(character, item, srcContainer, nextItemType, time, jobType, sound)
    return AutoSmokeSMUnpackAction:new(character, item, srcContainer, nextItemType, time, jobType, sound)
end

AutoSmoke.Smoker.items = {
    "cigarettes", "openedPacks", "closedIncompletePacks", "closedPacks", "cartons", "butts",
    "gum", "gumBlister", "gumPack",
    cigarettes = {
        "SM.SMHomemadeCigarette2",
        "SM.SMHomemadeCigarette",
        "SM.SMCigarette",
        "SM.SMCigaretteLight",
        "SM.SMPCigaretteMenthol",
        "SM.SMPCigaretteGold"
    },
    openedPacks = {
        "SM.SMPack",
        "SM.SMPackLight",
        "SM.SMPackMenthol",
        "SM.SMPackGold",
        ["SM.SMPack"] = "SM.SMCigarette",
        ["SM.SMPackLight"] = "SM.SMCigaretteLight",
        ["SM.SMPackMenthol"] = "SM.SMPCigaretteMenthol",
        ["SM.SMPackGold"] = "SM.SMPCigaretteGold"
    },
    closedIncompletePacks = {
        "Base.Cigarettes",
        ["Base.Cigarettes"] = "SM.SMPack"
    },
    closedPacks = {
        "SM.SMFullPack",
        "SM.SMFullPackLight",
        "SM.SMFullPackMenthol",
        "SM.SMFullPackGold",
        ["SM.SMFullPack"] = "SM.SMPack",
        ["SM.SMFullPackLight"] = "SM.SMPackLight",
        ["SM.SMFullPackMenthol"] = "SM.SMPackMenthol",
        ["SM.SMFullPackGold"] = "SM.SMPackGold"
    },
    cartons = {
        "SM.SMCartonCigarettes",
        "SM.SMCartonCigarettesLight",
        "SM.SMCartonCigarettesMenthol",
        "SM.SMCartonCigarettesGold",
        ["SM.SMCartonCigarettes"] = "SM.SMFullPack",
        ["SM.SMCartonCigarettesLight"] = "SM.SMFullPackLight",
        ["SM.SMCartonCigarettesMenthol"] = "SM.SMFullPackMenthol",
        ["SM.SMCartonCigarettesGold"] = "SM.SMFullPackGold"
    },
    butts = {
        "SM.SMButt",
        "SM.SMButt2"
    },
    gum = {
        "SM.SMGum"
    },
    gumBlister = {
        "SM.SMNicorette",
        ["SM.SMNicorette"] = "SM.SMGum"
    },
    gumPack = {
        "SM.SMNicoretteBox",
        ["SM.SMNicoretteBox"] = "SM.SMNicorette"
    }
}

AutoSmoke.Smoker.actions = {
    openedPacks = {
        jobType = "Take Cigarette from Pack",
        time = 30.0,
        isValid = function(item) return AutoSmoke.Smoker.OnTest.isPackNotEmpty(item) end
    },
    closedIncompletePacks = {
        jobType = "Open Pack Cigarettes",
        time = 30.0
    },
    closedPacks = {
        jobType = "Open the full pack",
        time = 30.0
    },
    cartons = {
        jobType = "Unpack Cigarettes",
        time = 60.0
    },
    gumBlister = {
        jobType = "Pull out the chewing gum",
        time = 30.0,
        sound = "sm_blister"
    },
    gumPack = {
        jobType = "Pull out blister pack",
        time = 30.0,
        sound = "sm_blister"
    }
}

AutoSmoke.Smoker.misc = {
    closedIncompletePacks = {
        ["Base.Cigarettes"] = "SM.SMEmptyPack"
    }
}

AutoSmoke.Smoker.options = {
    throwAwayButts = true,
    smokeButts = true,
    reversePriority = true,
    gumOnly = true
}

AutoSmoke.supportedMods[1] = {
    modId = "Smoker",
    modTable = "Smoker"
}