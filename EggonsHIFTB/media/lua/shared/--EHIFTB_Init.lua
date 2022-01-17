EHIFTB = EHIFTB or {Const = {}}
EHIFTB.Const.invalidItemTypes = {
    ["Base.Book"] = true,
    ["Base.ComicBook"] = true,
    ["Base.Doodle"] = true,
    ["Base.HottieZ"] = true,
    ["Base.Journal"] = true,
    ["Base.Magazine"] = true,
    ["Base.Newspaper"] = true,
    ["Base.Notebook"] = true,
    ["Base.SheetPaper2"] = true
}

function EHIFTB.getPlayerMemory(player)
    local playerModData = player:getModData()
    if not playerModData.EHIFTB then
        playerModData.EHIFTB = {
            libraries = {},
            lastLibraryNo = 0,
            rememberedBooks = {},
            redundantBooks = {}
        }
    else -- new feature, backward compatibility
        playerModData.EHIFTB.redundantBooks = playerModData.EHIFTB.redundantBooks or {}
    end
    return playerModData.EHIFTB
end

local function OnGameStart()
    EHIFTB.player = getPlayer()
    EHIFTB.memory = EHIFTB.getPlayerMemory(EHIFTB.player)
end
Events.OnGameStart.Add(OnGameStart)
