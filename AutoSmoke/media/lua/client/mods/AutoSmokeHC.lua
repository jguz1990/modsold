require('AutoSmoke')

AutoSmoke.Hydrocraft = {}
AutoSmoke.Hydrocraft.modId = "Hydrocraft"
AutoSmoke.Hydrocraft.modName = "Hydrocraft"
AutoSmoke.Hydrocraft.unpackAction = function(character, item, srcContainer, nextItemType, time, jobType, sound)
    return AutoSmokeHCUnpackAction:new(character, item, srcContainer, nextItemType, time, jobType, sound)
end

AutoSmoke.Hydrocraft.items = {
    "cigarettes", "closedPacks", "cartons",
    cigarettes = {
        "Base.Cigarettes",
        "Hydrocraft.HCCigaretteslights",
        "Hydrocraft.HCCigarettesmenthol"
    },
    closedPacks = {
        "Hydrocraft.HCCigarettepack",
        "Hydrocraft.HCCigarettepacklights",
        "Hydrocraft.HCCigarettepackmenthol",
        ["Hydrocraft.HCCigarettepack"] = "Base.Cigarettes",
        ["Hydrocraft.HCCigarettepacklights"] = "Hydrocraft.HCCigaretteslights",
        ["Hydrocraft.HCCigarettepackmenthol"] = "Hydrocraft.HCCigarettesmenthol",
    },
    cartons = {
        "Hydrocraft.HCCigarettecarton",
        "Hydrocraft.HCCigarettecartonlights",
        "Hydrocraft.HCCigarettecartonmenthol",
        ["Hydrocraft.HCCigarettecarton"] = "Hydrocraft.HCCigarettepack",
        ["Hydrocraft.HCCigarettecartonlights"] = "Hydrocraft.HCCigarettepacklights",
        ["Hydrocraft.HCCigarettecartonmenthol"] = "Hydrocraft.HCCigarettepackmenthol"
    }
}

AutoSmoke.Hydrocraft.actions = {
    closedPacks = {
        jobType = "Open Cigarette Pack",
        time = 50.0
    },
    cartons = {
        jobType = "Open Cigarette Carton",
        time = 50.0
    }
}

AutoSmoke.Hydrocraft.options = {
    throwAwayButts = true
}

AutoSmoke.supportedMods[4] = {
    modId = "Hydrocraft",
    modTable = "Hydrocraft"
}