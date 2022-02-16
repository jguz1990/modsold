
if isClient() then return end

require 'AquaConfig'

local CommonCommands = {}
local Commands = {}

-- sendClientCommand(self.character, 'aquatsar', 'launchBoat', {trailer = self.trailer:getId(), x = self.square:getX(), y = self.square:getY()})
function Commands.launchBoat(playerObj, args)
    if args.trailer then
        local trailer = getVehicleById(args.trailer)
        local scriptName = AquaConfig.Trailers[trailer:getScript():getName()].boat
        local square = getSquare(args.x, args.y, 0)
        if square then
            local boat = addVehicleDebug(scriptName, IsoDirections.N, trailer:getSkinIndex(), square)
            boat:setDebugZ(0.75)
            boat:setAngles(trailer:getAngleX(), trailer:getAngleY(), trailer:getAngleZ())
            boat:setRust(trailer:getRust())
            local newTrailerName = AquaConfig.Trailers[trailer:getScript():getName()].emptyTrailer
            AquaConfig.exchangePartsVehicle(trailer, boat)
            -- if isServer() then
            trailer = AquaConfig.replaceVehicle(trailer, newTrailerName, 0)
            -- else
                -- AquaConfig.replaceVehicleScript(trailer, newTrailerName)
            -- end
            
            local boatNamePart = boat:getPartById("BoatName")
            if boatNamePart then
                VehicleUtils.callLua(boatNamePart:getLuaFunction("init"), boat, boatNamePart)
            end
            local sails = boat:getPartById("Sails")
            if sails then
                VehicleUtils.callLua(sails:getLuaFunction("init"), boat, sails)
            end
            
            -- Delete key
            local xx = boat:getX()
            local yy = boat:getY()

            for z=0, 3 do
                for i=xx - 15, xx + 15 do
                    for j=yy - 15, yy + 15 do
                        local tmpSq = getCell():getGridSquare(i, j, z)
                        if tmpSq ~= nil then
                            for k=0, tmpSq:getObjects():size()-1 do
                                local ttt =    tmpSq:getObjects():get(k)
                                if ttt:getContainer() ~= nil then
                                    local items = ttt:getContainer():getItems()
                                    for ii=0, items:size()-1 do
                                        if items:get(ii):getKeyId() == boat:getKeyId() then
                                            items:remove(ii)
                                        end
                                    end
                                elseif instanceof(ttt, "IsoWorldInventoryObject") then
                                    if ttt:getItem() and ttt:getItem():getContainer() then
                                        local items = ttt:getItem():getContainer():getItems()
                                        for ii=0, items:size()-1 do
                                            if items:get(ii):getKeyId() == boat:getKeyId() then
                                                items:remove(ii)
                                            end
                                        end
                                    end
                                    
                                    if ttt:getItem() and ttt:getItem():getKeyId() == boat:getKeyId() then
                                        tmpSq:removeWorldObject(ttt)
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

-- sendClientCommand(self.character, 'aquatsar', 'loadBoat', {trailer = self.trailer:getId(), boat = self.boat:getId()})
function Commands.loadBoat(playerObj, args)
    if args.trailer and args.boat then
        local trailer = getVehicleById(args.trailer)
        local boat = getVehicleById(args.boat)
        local newTrailerName = AquaConfig.Trailers[trailer:getScript():getName()].trailerWithBoatTable[boat:getScript():getName()]
        -- if isServer() then
        trailer = AquaConfig.replaceVehicle(trailer, newTrailerName, boat:getSkinIndex())
        -- else
            -- AquaConfig.replaceVehicleScript(trailer, newTrailerName)
        -- end
        AquaConfig.exchangePartsVehicle(boat, trailer)
        local boatNamePart = trailer:getPartById("BoatName")
        if boatNamePart then
            VehicleUtils.callLua(boatNamePart:getLuaFunction("init"), trailer, boatNamePart)
        end
        local sails = trailer:getPartById("Sails")
        if sails then
            VehicleUtils.callLua(sails:getLuaFunction("init"), trailer, sails)
        end
        trailer:setRust(boat:getRust())
        boat:permanentlyRemove()
    end
end

-- sendClientCommand(self.character, 'aquatsar', 'setFerryman', {boat = boat:getId(), })
function Commands.setFerryman(playerObj, args)
    if args.boat then
        local boat = getVehicleById(args.boat)
        local boatEngine = boat:getPartById("Engine")
        if boatEngine then
            boatEngine:getModData()["aquaferryman"] = playerObj:getOnlineID()
            boat:transmitPartModData(boatEngine)
        end
    end
end

-- sendClientCommand(character, 'aquatsar', 'boatOnGround', {boat = boat:getId(), })
function Commands.boatOnGround(playerObj, args)
    if args.boat then
        local boat = getVehicleById(args.boat)
        -- if isServer() then
        boat = AquaConfig.replaceVehicle(boat, "Base.".. boat:getScript():getName() .. "_Ground", boat:getSkinIndex())
        -- else
            -- AquaConfig.replaceVehicleScript(boat, "Base.".. boat:getScript():getName() .. "_Ground")
        -- end
        boat:flipUpright()
        boat:setZ(0)
    end
end

-- sendClientCommand(arg_pl, 'aquatsar', 'unlockCabin', {boat = boat:getId(), })
function Commands.unlockCabin(playerObj, args)
    if args.boat then
        local boat = getVehicleById(args.boat)
        local cabinLock = boat:getPartById("CabinLock")
        if cabinLock then
            cabinLock:getModData()["AquaCabin_isUnlocked"] = true
            boat:transmitPartModData(cabinLock)
        end
    end
end

-- sendClientCommand(self.character, 'aquatsar', 'forceUnlockCabin', {boat = boat:getId(), })
function Commands.forceUnlockCabin(playerObj, args)
    if args.boat then
        local boat = getVehicleById(args.boat)
        local cabinLock = boat:getPartById("CabinLock")
        if cabinLock then
            cabinLock:getModData()["AquaCabin_isUnlocked"] = true
            cabinLock:getModData()["AquaCabin_isLockRuined"] = true
            boat:transmitPartModData(cabinLock)
        end
    end
end

-- sendClientCommand(arg_pl, 'aquatsar', 'lockCabin', {boat = boat:getId(), })
function Commands.lockCabin(playerObj, args)
    if args.boat then
        local boat = getVehicleById(args.boat)
        local cabinLock = boat:getPartById("CabinLock")
        if cabinLock then
            cabinLock:getModData()["AquaCabin_isUnlocked"] = false
            boat:transmitPartModData(cabinLock)
        end
    end
end

-- sendClientCommand(arg_pl, 'aquatsar', 'setSailCode', {boat = boat:getId(), sailCode = 1})
function Commands.setSailCode(playerObj, args)
    if args.boat and args.sailCode then
        local boat = getVehicleById(args.boat)
        local sails = boat:getPartById("Sails")
        if sails then
            sails:getModData().sailCode = args.sailCode
            boat:transmitPartModData(sails)
            VehicleUtils.callLua(sails:getLuaFunction("init"), boat, sails)
        end
    end
end

-- sendClientCommand(playerObj, 'aquatsar', 'useAnchor', {})
function Commands.useAnchor(playerObj, args)
    local boat = playerObj:getVehicle()
    if boat then
      local part = boat:getPartById("BoatAnchor")
      if part:getInventoryItem() then
        part:setInventoryItem(nil)
      else
        VehicleUtils.createPartInventoryItem(part)
      end
      boat:transmitPartItem(part)
    end
end

CommonCommands.OnClientCommand = function(module, command, playerObj, args)
    if module == 'aquatsar' and Commands[command] then
        local argStr = ''
        args = args or {}
        for k,v in pairs(args) do
            argStr = argStr..' '..k..'='..tostring(v)
        end
        Commands[command](playerObj, args)
    end
end

Events.OnClientCommand.Add(CommonCommands.OnClientCommand)