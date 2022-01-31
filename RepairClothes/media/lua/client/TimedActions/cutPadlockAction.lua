--***********************************************************
--**                    THE INDIE STONE                    **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISCutPadlockAction = ISBaseTimedAction:derive("ISCutPadlockAction");

function ISCutPadlockAction:isValid()
	
	if not self.character:hasEquippedTag("Boltcutters") then
		return false
	end
	return true;
end

function ISCutPadlockAction:waitToStart()
	self.character:faceThisObject(self.thump)
	return self.character:shouldBeTurning()
end

function ISCutPadlockAction:update()
	self.character:faceThisObject(self.thump)

    self.character:setMetabolicTarget(Metabolics.LightWork);
end

function ISCutPadlockAction:start()
        self:setActionAnim("BlowTorchMid")
end

function ISCutPadlockAction:stop()
    ISBaseTimedAction.stop(self);
end

function ISCutPadlockAction:perform()
    if self.sound then
        self.character:getEmitter():stopSound(self.sound)
        self.sound = nil
    end

	self.character:playSound("BreakMetalItem")
	addSound(self.character, self.character:getX(), self.character:getY(), self.character:getZ(), 10, 1)

	local cont = self.thump
	local mData = cont:getModData()
	
	local lock = nil
		
	if instanceof(cont, "IsoThumpable") then
		local lock = "Padlock_Snapped"
		cont:setLockedByPadlock(false);
		cont:setKeyId(-1);
		if cont:getLockedByCode() > 0 then
			lock = "CombinationPadlock_Cut"
		end
		cont:setLockedByCode(0)
	end
	if mData.padlocked  then
		lock = "Padlock_Cut"
	end
	if mData.combinationLocked and mData.combinationLocked > 0 then
		lock = "CombinationPadlock_Cut"
	end
	if mData and mData.locked then mData.locked = -1 end
	if mData and mData.combinationLocked then mData.combinationLocked = -1 end
		
	
	local tool = self.tool
	if tool and ZombRand(tool:getConditionLowerChance()) == 0 then
        tool:setCondition(tool:getCondition() - 1)
        ISWorldObjectContextMenu.checkWeapon(self.character);
    end	

		
	if lock then 
		local scrap = InventoryItemFactory.CreateItem(lock)
		--self.character:getInventory():AddItem(link)
		local square = self.character:getSquare()
		square:AddWorldInventoryItem(scrap, 0.0, 0.0, 0.0)	
	end			
		
	self.pdata.lootInventory:refreshBackpacks();
	self.pdata.playerInventory:refreshBackpacks();
	ISBaseTimedAction.perform(self);
end

function ISCutPadlockAction:new(character, thump, tool, pdata)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	o.character = character;
	o.thump = thump;
    o.tool = tool;
    o.pdata = pdata;
	o.stopOnWalk = true;
	o.stopOnRun = true;
	o.maxTime = 50;
	return o;
end
