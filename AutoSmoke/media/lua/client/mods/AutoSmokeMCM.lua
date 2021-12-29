require('AutoSmoke')
require('mods/AutoSmokeGF')

AutoSmoke.MoreCigsMod = {}
AutoSmoke.MoreCigsMod.modId = "MoreCigsMod"
AutoSmoke.MoreCigsMod.modName = "MoreCigsMod"
AutoSmoke.MoreCigsMod.unpackAction = function(character, item, srcContainer, nextItemType, time, jobType, sound)
    return AutoSmokeMCMUnpackAction:new(character, item, srcContainer, nextItemType, time, jobType, sound)
end

AutoSmoke.MoreCigsMod.items = {
    "cigarettes", "openedPacks", "closedIncompletePacks", "closedPacks", "cartons", "butts",
    cigarettes = {
        "Cigs.CigsCigaretteReg",
        "Cigs.CigsCigaretteLite",
        "Cigs.CigsCigaretteMent",
        "Cigs.CigsCigaretteGold"
    },
    openedPacks = {
        "Cigs.CigsOpenPackReg",
        "Cigs.CigsOpenPackLite",
        "Cigs.CigsOpenPackMent",
        "Cigs.CigsOpenPackGold",
        ["Cigs.CigsOpenPackReg"] = "Cigs.CigsCigaretteReg",
        ["Cigs.CigsOpenPackLite"] = "Cigs.CigsCigaretteLite",
        ["Cigs.CigsOpenPackMent"] = "Cigs.CigsCigaretteMent",
        ["Cigs.CigsOpenPackGold"] = "Cigs.CigsCigaretteGold"
    },
    closedIncompletePacks = {
        "Base.Cigarettes",
        "Cigs.CigsSpawnPackLite",
        "Cigs.CigsSpawnPackMent",
        "Cigs.CigsSpawnPackGold",
        ["Base.Cigarettes"] = "Cigs.CigsOpenPackReg",
        ["Cigs.CigsSpawnPackLite"] = "Cigs.CigsOpenPackLite",
        ["Cigs.CigsSpawnPackMent"] = "Cigs.CigsOpenPackMent",
        ["Cigs.CigsSpawnPackGold"] = "Cigs.CigsOpenPackGold"
    },
    closedPacks = {
        "Cigs.CigsClosedPackReg",
        "Cigs.CigsClosedPackLite",
        "Cigs.CigsClosedPackMent",
        "Cigs.CigsClosedPackGold",
        ["Cigs.CigsClosedPackReg"] = "Cigs.CigsOpenPackReg",
        ["Cigs.CigsClosedPackLite"] = "Cigs.CigsOpenPackLite",
        ["Cigs.CigsClosedPackMent"] = "Cigs.CigsOpenPackMent",
        ["Cigs.CigsClosedPackGold"] = "Cigs.CigsOpenPackGold"
    },
    cartons = {
        "Cigs.CigsCartonReg",
        "Cigs.CigsCartonLite",
        "Cigs.CigsCartonMent",
        "Cigs.CigsCartonGold",
        ["Cigs.CigsCartonReg"] = "Cigs.CigsClosedPackReg",
        ["Cigs.CigsCartonLite"] = "Cigs.CigsClosedPackLite",
        ["Cigs.CigsCartonMent"] = "Cigs.CigsClosedPackMent",
        ["Cigs.CigsCartonGold"] = "Cigs.CigsClosedPackGold"
    },
    butts = {
        "Cigs.CigsButtReg",
        "Cigs.CigsButtLite",
        "Cigs.CigsButtMent",
        "Cigs.CigsButtGold"
    }
}

AutoSmoke.MoreCigsMod.actions = {
    openedPacks = {
        jobType = "Take Cigarette from Pack",
        time = 30.0,
        isValid = function(item) return AutoSmoke.MoreCigsMod.OnTest.isPackNotEmpty(item) end
    },
    closedIncompletePacks = {
        jobType = "Open Pack of Cigarettes",
        time = 30.0
    },
    closedPacks = {
        jobType = "Open Full Pack",
        time = 30.0
    },
    cartons = {
        jobType = "Unpack Cigarettes",
        time = 60.0
    }
}

AutoSmoke.MoreCigsMod.misc = {
    closedIncompletePacks = {
        ["Base.Cigarettes"] = "Cigs.CigsEmptyPackReg",
        ["Cigs.CigsSpawnPackLite"] = "Cigs.CigsEmptyPackLite",
        ["Cigs.CigsSpawnPackMent"] = "Cigs.CigsEmptyPackMent",
        ["Cigs.CigsSpawnPackGold"] = "Cigs.CigsEmptyPackGold"
    },
    cartons = {
        ["Cigs.CigsCartonReg"] = "Cigs.CigsCartonRegEmpty",
        ["Cigs.CigsCartonLite"] = "Cigs.CigsCartonLiteEmpty",
        ["Cigs.CigsCartonMent"] = "Cigs.CigsCartonMentEmpty",
        ["Cigs.CigsCartonGold"] = "Cigs.CigsCartonGoldEmpty"
    }
}

AutoSmoke.MoreCigsMod.options = {
    throwAwayButts = true,
    smokeButts = true,
    reversePriority = true
}

AutoSmoke.supportedMods[2] = {
    modId = "MoreCigsMod",
    modTable = "MoreCigsMod"
}