if BetLock == nil then BetLock = {} end
BetLock.Utils = {}

local LevelTable = {}
LevelTable[0] = {"UI_BetLock_VeryEasy", 0, 8}
LevelTable[1] = {"UI_BetLock_Easy", 2, 16}
LevelTable[2] = {"UI_BetLock_Average", 4, 32}
LevelTable[3] = {"UI_BetLock_Hard", 6, 64}
LevelTable[4] = {"UI_BetLock_VeryHard", 8, 128}


local roomLevel = {}
roomLevel["conveniencestore"] = {0, 2}
roomLevel["warehouse"] = {1, 2}
roomLevel["burgerkitchen"] = {0, 2}
roomLevel["medclinic"] = {1, 2}
roomLevel["medicalstorage"] = {2, 2}
roomLevel["zippeestore"] = {1, 2}
roomLevel["grocerystorage"] = {0, 3}
roomLevel["grocery"] = {0, 2}
roomLevel["gigamartkitchen"] = {1, 2}
roomLevel["gigamart"] = {0, 3}
roomLevel["fossoil"] = {2, 2}
roomLevel["bedroom"] = {0, 2}
roomLevel["loggingfactory"] = {1, 3}
roomLevel["all"] = {0, 2}
roomLevel["shed"] = {0, 2}
roomLevel["kitchen"] = {1, 2}
roomLevel["spiffosstorage"] = {2, 2}
roomLevel["spiffoskitchen"] = {1, 3}
roomLevel["kitchen_crepe"] = {1, 2}
roomLevel["plazastore1"] = {2, 2}
roomLevel["garagestorage"] = {3, 2}
roomLevel["garage"] = {2, 3}
roomLevel["bathroom"] = {0, 2}
roomLevel["pizzawhirled"] = {1, 3}
roomLevel["motelbedroom"] = {1, 2}
roomLevel["lobby"] = {1, 3}
roomLevel["bookstore"] = {2, 2}
roomLevel["grocers"] = {0, 3}
roomLevel["library"] = {0, 3}
roomLevel["toolstore"] = {0, 3}
roomLevel["bar"] = {1, 2}
roomLevel["barkitchen"] = {1, 3}
roomLevel["policestorage"] = {3, 2}
roomLevel["armystorage"] = {4, 1}
roomLevel["pharmacy"] = {1, 2}
roomLevel["pharmacystorage"] = {2, 3}
roomLevel["gunstore"] = {3, 2}
roomLevel["gunstorestorage"] = {4, 1}
roomLevel["mechanic"] = {2, 2}
roomLevel["bakery"] = {1, 3}
roomLevel["aesthetic"] = {2, 3}
roomLevel["clothesstore"] = {1, 3}
roomLevel["motelroom"] = {2, 2}
roomLevel["motelroomoccupied"] = {1, 3}
roomLevel["empty"] = {0, 2}
roomLevel["cafe"] = {1, 3}
roomLevel["cafekitchen"] = {2, 2}
roomLevel["pizzakitchen"] = {2, 2}
roomLevel["dining"] = {1, 3}
roomLevel["restaurant"] = {0, 3}
roomLevel["post"] = {2, 3}
roomLevel["poststorage"] = {2, 3}
roomLevel["dinnerkitchen"] = {2, 2}
roomLevel["restaurantkitchen"] = {1, 2}
roomLevel["jayschicken"] = {1, 2}
roomLevel["generalstorestorage"] = {2, 2}
roomLevel["generalstore"] = {0, 3}
roomLevel["freezer"] = {2, 2}
roomLevel["fridge"] = {2, 2}
roomLevel["laundry"] = {1, 3}
roomLevel["furniturestore"] = {2, 2}
roomLevel["furniturestorage"] = {2, 3}
roomLevel["storageunit"] = {3, 2}
roomLevel["fishingstorage"] = {2, 3}
roomLevel["theatre"] = {2, 3}
roomLevel["theatrekitchen"] = {2, 2}
roomLevel["theatrestorage"] = {3, 2}
roomLevel["cornerstore"] = {0, 3}
roomLevel["housewarestore"] = {1, 2}
roomLevel["shoestore"] = {2, 3}
roomLevel["sportstore"] = {1, 3}
roomLevel["sportstorage"] = {2, 2}
roomLevel["giftstorage"] = {2, 3}
roomLevel["giftstore"] = {1, 3}
roomLevel["candystore"] = {1, 3}
roomLevel["toystore"] = {1, 3}
roomLevel["electronicsstore"] = {2, 3}
roomLevel["sewingstore"] = {1, 3}
roomLevel["medical"] = {2, 3}
roomLevel["medicaloffice"] = {2, 3}
roomLevel["jewelrystore"] = {3, 2}
roomLevel["musicstore"] = {2, 3}
roomLevel["departmentstore"] = {1, 3}
roomLevel["hall"] = {2, 2}
roomLevel["icecreamkitchen"] = {0, 3}
roomLevel["gasstore"] = {2, 3}
roomLevel["gasstorage"] = {3, 2}
roomLevel["gardenstore"] = {1, 3}
roomLevel["farmstorage"] = {2, 2}
roomLevel["security"] = {3, 2}
roomLevel["armysurplus"] = {4, 1}
roomLevel["armyhanger"] = {4, 1}
roomLevel["knoxbutcher"] = {2, 3}
roomLevel["changeroom"] = {0, 4}
roomLevel["hunting"] = {3, 2}
roomLevel["camping"] = {1, 2}
roomLevel["campingstorage"] = {2, 3}
roomLevel["butcher"] = {1, 3}
roomLevel["optometrist"] = {2, 2}
roomLevel["clothingstore"] = {0, 3}
roomLevel["office"] = {0, 3}
roomLevel["bank"] = {3, 2}
roomLevel["livingroom"] = {0, 2}





function BetLock.Utils.getLockpickLevelBuildingObj(obj)
    local sq1 = obj:getSquare()
    local sq2 = obj:getOppositeSquare()
    local name = nil

    if sq1 and sq1:getRoom() then
        name = sq1:getRoom():getName()
    elseif sq2 and sq2:getRoom() then
        name = sq2:getRoom():getName()
    end

    local level
    if name == nil or roomLevel[name] == nil then
        level = ZombRand(2)
        print("NO ", name)
    else
        level = roomLevel[name][1] + ZombRand(roomLevel[name][2])
        print(name, " ", level)
    end

    local tmp = {}
    tmp.name = LevelTable[level][1] 
    tmp.num = LevelTable[level][2]
    tmp.xp = LevelTable[level][3]

    return tmp
end

function BetLock.Utils.getLockpickingLevelVehicle(vehicle)
    local mechType = vehicle:getScript():getMechanicType()
    local level = 1

    if mechType == 1 then
        level = 1 + ZombRand(2)
    elseif mechType == 2 then
        level = 2 + ZombRand(2)
    elseif mechType == 3 then
        level = 3 + ZombRand(2)
    end

    local name = vehicle:getScript():getName():lower()

    if name:contains("police") or name:contains("fire") or name:contains("ranger") or name:contains("sheriff") then
        level = 2 + ZombRand(2)
    end

    local tmp = {}
    tmp.name = LevelTable[level][1] 
    tmp.num = LevelTable[level][2]
    tmp.xp = LevelTable[level][3]

    return tmp
end


local chanceBreakByLevel = {}
chanceBreakByLevel[0] = 100
chanceBreakByLevel[1] = 100
chanceBreakByLevel[2] = 90
chanceBreakByLevel[3] = 75
chanceBreakByLevel[4] = 55
chanceBreakByLevel[5] = 45
chanceBreakByLevel[6] = 35
chanceBreakByLevel[7] = 25
chanceBreakByLevel[8] = 5
chanceBreakByLevel[9] = 5
chanceBreakByLevel[10] = 4
chanceBreakByLevel[11] = 4
chanceBreakByLevel[12] = 3
chanceBreakByLevel[13] = 3
chanceBreakByLevel[14] = 2
chanceBreakByLevel[15] = 2
chanceBreakByLevel[16] = 1
chanceBreakByLevel[17] = 1
chanceBreakByLevel[18] = 0

function BetLock.Utils.getChanceBreakLock(playerLevel, lockLevel)
    return chanceBreakByLevel[playerLevel - lockLevel + 8]
end


local diffByLevel = {}
diffByLevel[0] = 0.005
diffByLevel[1] = 0.02
diffByLevel[2] = 0.04
diffByLevel[3] = 0.05
diffByLevel[4] = 0.1
diffByLevel[5] = 0.2
diffByLevel[6] = 0.4
diffByLevel[7] = 0.6
diffByLevel[8] = 0.8
diffByLevel[9] = 1.0
diffByLevel[10] = 1.2
diffByLevel[11] = 1.4
diffByLevel[12] = 1.6
diffByLevel[13] = 1.8
diffByLevel[14] = 2.0
diffByLevel[15] = 2.2
diffByLevel[16] = 2.4
diffByLevel[17] = 2.6
diffByLevel[18] = 2.8

function BetLock.Utils.getDiffAngleBobbyPin(skill, level)
    return diffByLevel[skill - level + 8]
end



local crowbarSizeByLevel = {}
crowbarSizeByLevel[0] = {1, 2}
crowbarSizeByLevel[1] = {2, 4}
crowbarSizeByLevel[2] = {2, 4}
crowbarSizeByLevel[3] = {3, 6}
crowbarSizeByLevel[4] = {3, 6}
crowbarSizeByLevel[5] = {4, 8}
crowbarSizeByLevel[6] = {6, 12}
crowbarSizeByLevel[7] = {8, 16}
crowbarSizeByLevel[8] = {10, 20}
crowbarSizeByLevel[9] = {12, 24}
crowbarSizeByLevel[10] = {14, 28}
crowbarSizeByLevel[11] = {16, 32}
crowbarSizeByLevel[12] = {18, 36}
crowbarSizeByLevel[13] = {20, 40}
crowbarSizeByLevel[14] = {22, 44}
crowbarSizeByLevel[15] = {25, 50}
crowbarSizeByLevel[16] = {30, 60}
crowbarSizeByLevel[17] = {35, 70}
crowbarSizeByLevel[18] = {40, 80}

function BetLock.Utils.getGreenYellowSize(skill, level)
    return crowbarSizeByLevel[skill - level + 8]
end