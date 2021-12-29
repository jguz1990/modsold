require('AutoSmoke')

AutoSmoke.CigaretteCarton = {}
AutoSmoke.CigaretteCarton.modId = "2207313208"
AutoSmoke.CigaretteCarton.modName = "CigaretteCarton"
AutoSmoke.CigaretteCarton.unpackAction = function(character, item, srcContainer, nextItemType, time, jobType, sound)
    return AutoSmokeCCUnpackAction:new(character, item, srcContainer, nextItemType, time, jobType, sound)
end

AutoSmoke.CigaretteCarton.items = {
    "cigarettes", "closedPacks", "cartons",
    cigarettes = {
        "CigaretteMod.CigarettesOne"
    },
    closedPacks = {
        "Base.Cigarettes",
        ["Base.Cigarettes"] = "CigaretteMod.CigarettesOne"
    },
    cartons = {
        "CigaretteMod.CigaretteCarton",
        ["CigaretteMod.CigaretteCarton"] = "Base.Cigarettes"
    }
}

AutoSmoke.CigaretteCarton.actions = {
    closedPacks = {
        jobType = "Open Packet",
        time = 30.0
    },
    cartons = {
        jobType = "Open Carton",
        time = 60.0
    }
}

AutoSmoke.supportedMods[5] = {
    modId = "2207313208",
    modTable = "CigaretteCarton"
}