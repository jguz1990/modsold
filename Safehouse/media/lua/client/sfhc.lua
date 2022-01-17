-------------------------------------------------------------
--[[ project zomboid non-residential safehouse hack
    to be placed in the media/lua/client directory. Credit to /u/fenris_wolf-tt
 
]]
local function bypassClaimChecks(worldobjects, square, player)
    local def = square:getBuilding():getDef()
    SafeHouse.addSafeHouse(def:getX() - 2, def:getY() - 2, def:getW() + 2*2, def:getH() +2*2, getSpecificPlayer(player):getUsername(), false)
end
 
Events.OnFillWorldObjectContextMenu.Add(function(player, context, worldobjects, test)
    local option = nil
    for _, opt in pairs(context.options) do
        if opt.name == getText("ContextMenu_SafehouseClaim") then
            option = opt
            break
        end
    end
    if not option then return end
    if option.toolTip.description == getText("IGUI_Safehouse_NotHouse") then
        option.notAvailable = false
        option.toolTip = nil
        option.onSelect = bypassClaimChecks
    end
end)