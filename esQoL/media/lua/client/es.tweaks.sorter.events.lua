esSorterAction = esSorterAction or {};
local esSorter = require("es.tweaks.sorter.main");
local esSorterOptions = require("es.tweaks.options");

local baseISTimedActionQueue = ISTimedActionQueue.onCompleted;
function ISTimedActionQueue:onCompleted(action)
    baseISTimedActionQueue(self, action);

    if esSorterOptions.getOption("sorterOn") and self.current == nil and esSorterAction.action ~= nil then
        if (not esSorterOptions.getOption("sorterManualOn")) then
            esSorter.sort(self.character);
        end
        esSorterAction = {};
    end
end

local baseCraftAction = ISCraftAction.perform;
function ISCraftAction:perform()
    esSorterAction.action = "craft";
    baseCraftAction(self);
end

local baseISMoveablesAction = ISMoveablesAction.perform;
function ISMoveablesAction:perform()
    esSorterAction.action = "movable";
    baseISMoveablesAction(self);
end

local baseISWOnUnbarricade = ISWorldObjectContextMenu.onUnbarricade;
function ISWorldObjectContextMenu.onUnbarricade(worldobjects, window, player)
    esSorterAction.action = "unbarricade";
    baseISWOnUnbarricade(worldobjects, window, player);
end

local baseISWOnUnbarricadeMetal = ISWorldObjectContextMenu.onUnbarricadeMetal;
function ISWorldObjectContextMenu.onUnbarricadeMetal(worldobjects, window, player)
    esSorterAction.action = "unbarricade";
    baseISWOnUnbarricadeMetal(worldobjects, window, player);
end

local baseISWOnUnbarricadeMetalBar = ISWorldObjectContextMenu.onUnbarricadeMetalBar;
function ISWorldObjectContextMenu.onUnbarricadeMetalBar(worldobjects, window, player)
    esSorterAction.action = "unbarricade";
    baseISWOnUnbarricadeMetalBar(worldobjects, window, player);
end

local baseISWOnMetalBarBarricade = ISWorldObjectContextMenu.onMetalBarBarricade;
function ISWorldObjectContextMenu.onMetalBarBarricade(worldobjects, window, player)
    esSorterAction.action = "barricade";
    baseISWOnMetalBarBarricade(worldobjects, window, player);
end

local baseISWOnMetalBarricade = ISWorldObjectContextMenu.onMetalBarricade;
function ISWorldObjectContextMenu.onMetalBarricade(worldobjects, window, player)
    esSorterAction.action = "barricade";
    baseISWOnMetalBarricade(worldobjects, window, player);
end

local baseISWOnBarricade = ISWorldObjectContextMenu.onBarricade;
function ISWorldObjectContextMenu.onBarricade(worldobjects, window, player)
    esSorterAction.action = "barricade";
    baseISWOnBarricade(worldobjects, window, player);
end

