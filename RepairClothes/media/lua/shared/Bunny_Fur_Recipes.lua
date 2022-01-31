
function Butcher_Rabbit(items, result, player)
    local anim = nil;
    for i=0,items:size() - 1 do
        if instanceof(items:get(i), "Food") then
            anim = items:get(i);
            break;
        end
    end
    if anim then
        local new_hunger = anim:getBaseHunger() * 1.05;
        if(new_hunger < -100) then
            new_hunger = -100;
        end
        result:setBaseHunger(new_hunger);
        result:setHungChange(new_hunger);

        result:setCustomWeight(true);
        result:setWeight(anim:getWeight() * 0.7);
        result:setActualWeight(anim:getActualWeight() * 0.7);

        result:setLipids(anim:getLipids() * 0.75);
        result:setProteins(anim:getProteins() * 0.75);
        result:setCalories(anim:getCalories() * 0.75);
        result:setCarbohydrates(anim:getCarbohydrates() * 0.75);
		player:getInventory():AddItem("Base.RabbitPelt");
		
    end
end

function Not_Rotten_Bunny(sourceItem, result)
	if sourceItem:getType()=="RabbitPelt" and sourceItem:isRotten() then return false end
	return true
end