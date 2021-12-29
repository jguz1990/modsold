require('AutoSmoke')
require('mods/AutoSmokeHC')

AutoSmoke.GreenFire = {}
AutoSmoke.GreenFire.modId = "jiggasGreenfireMod"
AutoSmoke.GreenFire.modName = "Greenfire"
AutoSmoke.GreenFire.unpackAction = function(character, item, srcContainer, nextItemType, time, jobType, sound)
    return AutoSmokeGFUnpackAction:new(character, item, srcContainer, nextItemType, time, jobType, sound)
end

AutoSmoke.GreenFire.items = {
    "cigarettes", "closedPacks", "openedCartons", "cartons",
    cigarettes = {
        "Base.Cigarettes",
        "Greenfire.GFCigarette"
    },
    closedPacks = {
        "Greenfire.GFCigarettes",
        ["Greenfire.GFCigarettes"] = "Greenfire.GFCigarette"
    },
    openedCartons = {
        "Greenfire.GFUsedCigaretteCarton",
        ["Greenfire.GFUsedCigaretteCarton"] = "Greenfire.GFCigarettes"
    },
    cartons = {
        "Greenfire.GFCigaretteCarton",
        ["Greenfire.GFCigaretteCarton"] = "Greenfire.GFCigarettes"
    }
}

AutoSmoke.GreenFire.actions = {
    closedPacks = {
        jobType = "Open Pack of Cigarettes",
        time = 10.0
    },
    openedCartons = {
        jobType = "Open Used Cigarette Carton",
        time = 10.0
    },
    cartons = {
        jobType = "Open Cigarette Carton",
        time = 10.0
    }
}

AutoSmoke.GreenFire.misc = {
    cartons = {
        ["Greenfire.GFCigaretteCarton"] = "Greenfire.GFEmptyCigaretteCarton",
        ["Greenfire.GFUsedCigaretteCarton"] = "Greenfire.GFEmptyCigaretteCarton"
    }
}

if getActivatedMods():contains(AutoSmoke.Hydrocraft.modId) then
    AutoSmoke.GreenFire.compatHydrocraft = true

    table.insert(AutoSmoke.GreenFire.items.cigarettes, "Base.Cigarettes")
    AutoSmoke.GreenFire.items.closedPacks["Greenfire.GFCigarettes"] = "Base.Cigarettes"
    AutoSmoke.GreenFire.items.openedCartons["Greenfire.GFUsedCigaretteCarton"] = "Hydrocraft.HCCigarettepack"
    AutoSmoke.GreenFire.items.cartons["Greenfire.GFCigaretteCarton"] = "Hydrocraft.HCCigarettepack"
    AutoSmoke.Utils.mergeItems(AutoSmoke.GreenFire.items, AutoSmoke.Hydrocraft.items)
end

AutoSmoke.supportedMods[3] = {
    modId = "jiggasGreenfireMod",
    modTable = "GreenFire"
}