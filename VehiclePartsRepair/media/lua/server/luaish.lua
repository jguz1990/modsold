function DismantleStuff_OnCreate(items, result, player, selectedItem)
    local success = 50 + (player:getPerkLevel(Perks.MetalWelding)*5);
    for i=1,ZombRand(1,3) do
        local r = ZombRand(1,4);
        if r==1 then
            player:getInventory():AddItem("Base.SmallSheetMetal");
        elseif r==2 then
            player:getInventory():AddItem("Base.MetalPipe");
        elseif r==3 then
            player:getInventory():AddItem("Base.MetalBar");
        end
    end
    if ZombRand(0,100)<success then
        player:getInventory():AddItem("Base.SheetMetal");
    end
    if ZombRand(0,100)<success then
        player:getInventory():AddItem("Base.ScrapMetal");
    end
    if ZombRand(0,100)<success then
        player:getInventory():AddItem("Base.SmallSheetMetal");
    end
end


function DismantleStuffSmall_OnCreate(items, result, player, selectedItem)
    local success = 50 + (player:getPerkLevel(Perks.MetalWelding)*5);
    for i=1,ZombRand(1,2) do
        local r = ZombRand(1,3);
        if r==1 then
            player:getInventory():AddItem("Base.SmallSheetMetal");
        elseif r==2 then
            player:getInventory():AddItem("Base.MetalPipe");
        elseif r==3 then
            player:getInventory():AddItem("Base.ScrapMetal");
        end
    end
    if ZombRand(0,100)<success then
        player:getInventory():AddItem("Base.SheetMetal");
    end
    if ZombRand(0,100)<success then
        player:getInventory():AddItem("Base.SmallSheetMetal");
    end
end

function DismantleStuff_OnGiveXP(recipe, ingredients, result, player)
    player:getXp():AddXP(Perks.Mechanics, 3);
    player:getXp():AddXP(Perks.MetalWelding, 3);	
end