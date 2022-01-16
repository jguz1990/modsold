esSorterAction = esSorterAction or {}
local esSortCorpse = {};
local esDismantleOptions = require("es.tweaks.options");
esSortCorpse.arrow = {};

function esSortCorpse.invalidate(player)
    local distance = esDismantleOptions.getOption("corpseMergeArrow");
    if (distance) then
        local sq = player:getCurrentSquare();
        for k, v in pairs(esSortCorpse.arrow) do
            if v ~= nil then
                local dist = IsoUtils.DistanceTo(sq:getX(), sq:getY(), v:getX() + 0.5, v:getY() + 0.5)
                if (dist > distance) then
                    esSortCorpse.removeArrow(v);
                end
            end
        end
    end

end

function esSortCorpse.removeArrow(square)
    if (esSortCorpse.arrow[square:getX() .. square:getY() .. square:getZ()] ~= nil) then
        esSortCorpse.arrow[square:getX() .. square:getY() .. square:getZ()]:remove();
        esSortCorpse.arrow[square:getX() .. square:getY() .. square:getZ()] = nil;
    end
end

function esSortCorpse.addArrow(square)
    if (esSortCorpse.arrow[square:getX() .. square:getY() .. square:getZ()] == nil) then
        esSortCorpse.arrow[square:getX() .. square:getY() .. square:getZ()] =
        getWorldMarkers():addDirectionArrow(getPlayer(), square:getX(), square:getY(), square:getZ(), nil, 1.0, 1.0, 1.0, 1.0);
    end
end

function esSortCorpse.onBackpackRefreshDone(inventoryPage, state)
    if (not esDismantleOptions.getOption("corpseMergeOn")) then return end;
    if state ~= "end" then return end;
    if (not inventoryPage.onCharacter) then
        local firstCorpse;
        local itemCollect = {};

        for i, c in ipairs(inventoryPage.backpacks) do
            if (c.inventory:getType() == "inventorymale" or c.inventory:getType() == "inventoryfemale") then
                if not c.inventory:isEmpty() then
                    if (firstCorpse == nil) then
                        firstCorpse = c.inventory;
                    else
                        local items = c.inventory:getItems();
                        local item = items:get(0) or nil;

                        while item ~= nil do
                            itemCollect[item:getID()] = item;
                            c.inventory:Remove(item);
                            if (items:size() < 1) then break end;
                            item = items:get(0);
                        end
                    end
                elseif (esDismantleOptions.getOption("corpseMergeArrow")) then
                    esSortCorpse.removeArrow(c.inventory:getParent():getCurrentSquare());
                end
            end
        end

        for i,c in pairs(itemCollect) do
            firstCorpse:AddItem(c);
        end

        if (firstCorpse and esDismantleOptions.getOption("corpseMergeArrow")) then
            esSortCorpse.addArrow(firstCorpse:getParent():getCurrentSquare());
        end

    end
end

Events.OnRefreshInventoryWindowContainers.Add(esSortCorpse.onBackpackRefreshDone);
Events.OnPlayerMove.Add(esSortCorpse.invalidate);