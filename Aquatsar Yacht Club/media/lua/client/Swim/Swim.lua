if not AquatsarYachts then AquatsarYachts = {} end
AquatsarYachts.Swim = {}

local SwimSayWords = {}
SwimSayWords.damage = {}
SwimSayWords.damage["IGUI_SwimWord_Damage1"] = 30
SwimSayWords.damage["IGUI_SwimWord_Damage2"] = 30
SwimSayWords.damage["IGUI_SwimWord_Damage3"] = 30
-- SwimSayWords.damage["IGUI_SwimWord_Damage4"] = 15
-- SwimSayWords.damage["IGUI_SwimWord_Damage5"] = 15
-- SwimSayWords.damage["IGUI_SwimWord_Damage6"] = 15

SwimSayWords.lostItems = {}
SwimSayWords.lostItems["IGUI_SwimWord_LostItems1"] = 33
SwimSayWords.lostItems["IGUI_SwimWord_LostItems2"] = 33
SwimSayWords.lostItems["IGUI_SwimWord_LostItems3"] = 34

SwimSayWords.success = {}
SwimSayWords.success["IGUI_SwimWord_Success1"] = 33
SwimSayWords.success["IGUI_SwimWord_Success2"] = 33
SwimSayWords.success["IGUI_SwimWord_Success3"] = 34

SwimSayWords.fail = {}
SwimSayWords.fail["IGUI_SwimWord_Fail1"] = 33
SwimSayWords.fail["IGUI_SwimWord_Fail2"] = 33
SwimSayWords.fail["IGUI_SwimWord_Fail3"] = 34

SwimSayWords.endurance = {}
SwimSayWords.endurance["IGUI_SwimWord_Endurance1"] = 10
SwimSayWords.endurance["IGUI_SwimWord_Endurance2"] = 10
SwimSayWords.endurance["IGUI_SwimWord_Endurance3"] = 10
SwimSayWords.endurance["IGUI_SwimWord_Endurance4"] = 10

SwimSayWords.LostItems = {"IGUI_SwimWord_LostItems1", "IGUI_SwimWord_LostItems2", "IGUI_SwimWord_LostItems3"}
SwimSayWords.Damage = {"IGUI_SwimWord_Damage1", "IGUI_SwimWord_Damage2", "IGUI_SwimWord_Damage3"}
SwimSayWords.Endurance = {"IGUI_SwimWord_Endurance1", "IGUI_SwimWord_Endurance2", "IGUI_SwimWord_Endurance3", "IGUI_SwimWord_Endurance4"}



function AquatsarYachts.Swim.swimDifficultCoeff(playerObj)
    local canSwim = playerObj:isRecipeKnown("Swimming")
    
    local item1 = playerObj:getInventory():getItemFromType("Lifebuoy")
	local item2 = playerObj:getInventory():getItemFromType("TireTube")
    local haveLifebouy = (item1 and item1:isEquipped()) or (item2 and item2:isEquipped())

    local coeff = 5

    if canSwim or haveLifebouy then
        coeff = 2.0
    end

    local haveDivingMask = playerObj:getInventory():getItemFromType("DivingMask")
    if haveDivingMask and haveDivingMask:isEquipped() then 
        coeff = coeff * 0.9
    end

    local haveSwimGlasses = playerObj:getInventory():getItemFromType("Glasses_SwimmingGoggles")
    if haveSwimGlasses and haveSwimGlasses:isEquipped() then 
        coeff = coeff * 0.9
    end

    ------
    local haveSwimTrunks_Y = playerObj:getInventory():getItemFromType("SwimTrunks_Yellow")
    local haveSwimTrunks_R = playerObj:getInventory():getItemFromType("SwimTrunks_Red")
    local haveSwimTrunks_B = playerObj:getInventory():getItemFromType("SwimTrunks_Blue")
    local haveSwimTrunks_G = playerObj:getInventory():getItemFromType("SwimTrunks_Green")
    local haveSwimSuit = playerObj:getInventory():getItemFromType("Swimsuit_TINT")
    if haveSwimTrunks_Y and haveSwimTrunks_Y:isEquipped() 
        or haveSwimTrunks_R and haveSwimTrunks_R:isEquipped() 
        or haveSwimTrunks_B and haveSwimTrunks_B:isEquipped() 
        or haveSwimTrunks_G and haveSwimTrunks_G:isEquipped() 
        or haveSwimSuit and haveSwimSuit:isEquipped() then 
            coeff = coeff * 0.9
    end

    -----

    local equipWeight = round(playerObj:getInventory():getCapacityWeight(), 2)
    if equipWeight > 10 then
        coeff = coeff * (equipWeight/10)
    end
    
    local Unlucky = playerObj:HasTrait("Unlucky")
    if Unlucky then 
        coeff = coeff * 1.2
    end

    local Lucky = playerObj:HasTrait("Lucky")
    if Lucky then 
        coeff = coeff * 0.8
    end
    
    local Overweight = playerObj:HasTrait("Overweight")
    if Overweight then 
        coeff = coeff * 1.1
    end
    
    local Obese = playerObj:HasTrait("Obese")
    if Obese then 
        coeff = coeff * 1.2
    end
    
    local panic = playerObj:getMoodles():getMoodleLevel(MoodleType.Panic)
    coeff = coeff + panic*0.2

    local drunk = playerObj:getMoodles():getMoodleLevel(MoodleType.Drunk)
    coeff = coeff + drunk*0.2

    local endurance = playerObj:getMoodles():getMoodleLevel(MoodleType.Endurance)
    coeff = coeff + endurance*0.2

    local tired = playerObj:getMoodles():getMoodleLevel(MoodleType.Tired)
    coeff = coeff + tired*0.2

    local pain = playerObj:getMoodles():getMoodleLevel(MoodleType.Pain)
    coeff = coeff + pain*0.2

    local Fitness = playerObj:getPerkLevel(Perks.Fitness)
    coeff = coeff * (1.5 - Fitness/10)

    return coeff
end



local function compare(a,b)
    return a:getWeight() > b:getWeight()
end


function AquatsarYachts.Swim.dropItems(playerObj)
    local inv = playerObj:getInventory()    
    local items = {}

    for j=1, inv:getItems():size() do
        local item = inv:getItems():get(j-1);
        table.insert(items, item)
    end

    local dropNum = ZombRand(#items * 0.4)
    table.sort(items, compare)

    for i=1, dropNum do
        if not items[i]:isEquipped() then
            inv:DoRemoveItem(items[i])
        end
		if round(playerObj:getInventory():getCapacityWeight(), 2) < 10 then
			break
		end
    end
	local currentNum = ZombRand(#SwimSayWords["LostItems"])+1
	playerObj:Say(getText(SwimSayWords["LostItems"][currentNum]))
end

------
-- Fast swim

function fastSwim(key, joypadKey)
    if (key == Keyboard.KEY_SPACE and (isShiftKeyDown() or isKeyDown(Keyboard.KEY_LMENU))) then
        local player = getSpecificPlayer(0)
        local dir = player:getForwardDirection()
        local x = player:getX() + dir:getX()
        local y = player:getY() + dir:getY()
		local sq = player:getSquare()
        local sqDir = getCell():getGridSquare(x, y, player:getZ())
        if sqDir and 
		sqDir:Is(IsoFlagType.water) and 
		not sq:Is(IsoFlagType.water) and 
		not sq:isWallTo(sqDir) and 
		not sq:isWindowTo(sqDir) then 
            player:setX(x)
            player:setY(y)
        end 
    end
end

function fastSwimJoypad(joypadData, joypadKey)
	-- print(joypadData.player)
    if joypadKey == Keyboard.KEY_SPACE then
        local player = getSpecificPlayer(joypadData.player)
        local dir = player:getForwardDirection()
        local x = player:getX() + dir:getX()
        local y = player:getY() + dir:getY()
		local sq = player:getSquare()
        local sqDir = getCell():getGridSquare(x, y, player:getZ())
        if sqDir and 
		sqDir:Is(IsoFlagType.water) and 
		not sq:Is(IsoFlagType.water) and 
		not sq:isWallTo(sqDir) and 
		not sq:isWindowTo(sqDir) then 
            player:setX(x)
            player:setY(y)
        end 
    end
end

-- function AquatsarYachts.Swim.Say(situation, chaceToSay)
    -- if ZombRand(374) <= chaceToSay then
        -- local currentChance = ZombRand(100)
        -- local count = 0
        -- for word, chance in pairs(SwimSayWords[situation]) do
            -- if currentChance >= count and currentChance < (count + chance) then
                -- getPlayer():Say(getText(word))
                -- break
            -- end
            -- count = count + chance
        -- end
	-- end
-- end

function AquatsarYachts.Swim.newSay(playerObj, situation, chanceToSay)
	local maxCount = ZombRand(10000)
	local updateChance = maxCount*chanceToSay/1000
	local check = ZombRand(maxCount)
	if check <= updateChance then
		local currentNum = ZombRand(#SwimSayWords[situation])+1
		playerObj:Say(getText(SwimSayWords[situation][currentNum]))
	end
end

function AquatsarYachts.Swim.OnPlayerMove(playerObj)
    -- local playerObj = getPlayer()
	-- print(playerObj)
    if playerObj == nil then return end
    if not playerObj:getVehicle() and playerObj:getSquare():Is(IsoFlagType.water) then
        local coeff = AquatsarYachts.Swim.swimDifficultCoeff(playerObj)
		if playerObj:isAiming() then
			playerObj:getStats():setEndurance(playerObj:getStats():getEndurance() - 0.00001*coeff)
		else
			playerObj:getStats():setEndurance(playerObj:getStats():getEndurance() - 0.00015*coeff)
		end
        playerObj:getXp():AddXP(Perks.Fitness, 0.05)
		
		local newEndurance = playerObj:getStats():getEndurance()
		
        local eqWeight = round(playerObj:getInventory():getCapacityWeight(), 2)
        if eqWeight > 20 and ZombRand(100) < 20 and newEndurance < 0.3 then
            AquatsarYachts.Swim.dropItems(playerObj)
        elseif eqWeight > 10 and ZombRand(100) < 5 and newEndurance < 0.3 then
            AquatsarYachts.Swim.dropItems(playerObj)
        end
        if newEndurance < 0.05 then
            if ZombRand(100) < 5 then
                local part = ZombRand(6)
                if part == 0 then
                    playerObj:getBodyDamage():getBodyPart(BodyPartType.Torso_Upper):AddDamage(3)
                elseif part == 1 then
                    playerObj:getBodyDamage():getBodyPart(BodyPartType.Torso_Lower):AddDamage(3)
                elseif part == 2 then
                    playerObj:getBodyDamage():getBodyPart(BodyPartType.UpperLeg_L):AddDamage(3)
                elseif part == 3 then
                    playerObj:getBodyDamage():getBodyPart(BodyPartType.UpperLeg_R):AddDamage(3)
                elseif part == 4 then
                    playerObj:getBodyDamage():getBodyPart(BodyPartType.UpperArm_L):AddDamage(3)
                elseif part == 5 then
                    playerObj:getBodyDamage():getBodyPart(BodyPartType.UpperArm_R):AddDamage(3)
                end
				AquatsarYachts.Swim.newSay(playerObj, "Damage", 25)
            end
		elseif newEndurance < 0.5 then 
			AquatsarYachts.Swim.newSay(playerObj, "Endurance", 1)
        end
    end
end

Events.OnPlayerMove.Add(AquatsarYachts.Swim.OnPlayerMove)
Events.OnKeyStartPressed.Add(fastSwim)
-- Events.OnFillWorldObjectContextMenu.Add(swimToPoint)
