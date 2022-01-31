require "TimedActions/ISBaseTimedAction"

ISButcherCorpseAction = ISBaseTimedAction:derive("ISButcherCorpseAction");

function ISButcherCorpseAction:isValid()
    --if self.corpseBody:getStaticMovingObjectIndex() < 0 then
        --return false
    --end
	return true
end

function ISButcherCorpseAction:waitToStart()
	--self.character:faceThisObject(self.corpseBody)
	return self.character:shouldBeTurning()
end

function ISButcherCorpseAction:update()
	if not self.blood and not self.skeleton then
		if ZombRand(19) == 0 then self.character:playSound("SliceMeats") end	
		if ZombRand(19) == 0 then self.character:playSound("BloodSplatter") end
		if ZombRand(99) == 0 then 
			print("The Bleedening!")
			self.character:addBlood(null, false, true, false)
			triggerEvent("OnClothingUpdated",self.character)	
		end
	end

    self.corpse:setJobDelta(self:getJobDelta());
    --self.character:faceThisObject(self.corpseBody);

    self.character:setMetabolicTarget(Metabolics.MediumWork);
end

function ISButcherCorpseAction:start()
		self:setActionAnim("Loot");
		self.character:SetVariable("LootPosition", "Low");
    self.corpse:setJobType(getText("Butcher Corpse"));
    self.corpse:setJobDelta(0.0);
	if not self.blood and not self.skeleton then
			self.character:addBlood(null, false, true, false)
			triggerEvent("OnClothingUpdated",self.character)	
		self.character:playSound("SliceMeats");
		self.character:playSound("BloodSplatter");
		self.character:addBlood(Hand_L, true, false, false)
		self.character:addBlood(Hand_R, true, false, false)
	else
		self.character:playSound("ZombieScratch");
	end
end

function ISButcherCorpseAction:stop()
    ISBaseTimedAction.stop(self);
    self.corpse:setJobDelta(0.0);
end

function ISButcherCorpseAction:perform()
    forceDropHeavyItems(self.character)
    self.corpse:setJobDelta(0.0);
    self.character:getInventory():setDrawDirty(true);
	-- if self.blood == false then
		-- self.character:splatBloodFloorBig(0.9)
		-- self.character:splatBloodFloorBig(0.9)
		-- self.character:splatBloodFloorBig(0.9)
		-- self.character:splatBloodFloorBig(0.9)
		-- self.character:splatBloodFloorBig(0.9)
		-- self.character:splatBloodFloorBig(0.9)
		-- self.character:splatBloodFloorBig(0.9)
		-- self.character:splatBloodFloorBig(0.9)
		-- self.character:splatBloodFloorBig(0.9)
		-- self.character:splatBloodFloorBig(0.9)
	-- end	

	local obj = self.corpseBody
	local sq = obj:getSquare();
	if self.rotten and ZombRand(0,99) == 0 then
		obj:reanimateNow()
		ISBaseTimedAction.perform(self);
		return
	end	
	
	if self.brain then
		--print("BRAIN")
		local vMod = self.corpseBody:getModData();
		vMod.brainless = true
		local pdata = getPlayerData(self.character:getPlayerNum());
		if pdata ~= nil then
			local vMod = self.corpseBody:getModData();
			vMod.brainless = true
			self.character:getInventory():AddItem("Brain")
			pdata.playerInventory:refreshBackpacks();
			pdata.lootInventory:refreshBackpacks();
			ISBaseTimedAction.perform(self);
		end
		return			
	end
	
	if self.blood then
		local pdata = getPlayerData(self.character:getPlayerNum());
		if pdata ~= nil then		
			local vMod = self.corpseBody:getModData();
			if ZombRand(0,99) == 0 then
				vMod.bloodless = true
			end
			
			local hammer =self.character:getInventory():getFirstType("SyringeEmpty")
			self.character:getInventory():Remove(hammer)
		
			if self.rotten or obj:getContainer():contains("autopsySkullInfected") or obj:getContainer():contains("token_Infected") then		
				newSyringe = self.character:getInventory():AddItem("Base.SyringeZombieBlood");
			else	
				newSyringe = self.character:getInventory():AddItem("Base.SyringeBlood");
			end
			self.character:setPrimaryHandItem(newSyringe);
			pdata.playerInventory:refreshBackpacks();
			pdata.lootInventory:refreshBackpacks();
		end
		-- needed to remove from queue / start next.
		ISBaseTimedAction.perform(self);
		return	
	end	
	
	if self.skeleton then
		if self.rotten then	
			 local sq = self.character:getSquare();
			 sq:AddWorldInventoryItem("Base.InfectedBonePieces", 0.3, 0.3, 0.0)
			 sq:AddWorldInventoryItem("Base.InfectedBone", 0.3, 0.3, 0.0)
			 sq:AddWorldInventoryItem("Base.InfectedBone", 0.3, 0.3, 0.0)
			 sq:AddWorldInventoryItem("Base.InfectedSkull", 0.3, 0.3, 0.0)
			 sq:AddWorldInventoryItem("Base.InfectedBonePieces", 0.3, 0.3, 0.0)
			 sq:AddWorldInventoryItem("Base.InfectedBone", 0.3, 0.3, 0.0)
			 sq:AddWorldInventoryItem("Base.InfectedBone", 0.3, 0.3, 0.0)
		else	
			local sq = self.character:getSquare();
			sq:AddWorldInventoryItem("Base.BonePieces", 0.3, 0.3, 0.0)
			sq:AddWorldInventoryItem("Base.Bone", 0.3, 0.3, 0.0)
			sq:AddWorldInventoryItem("Base.Bone", 0.3, 0.3, 0.0)
			sq:AddWorldInventoryItem("Base.Skull", 0.3, 0.3, 0.0)
			sq:AddWorldInventoryItem("Base.BonePieces", 0.3, 0.3, 0.0)
			sq:AddWorldInventoryItem("Base.Bone", 0.3, 0.3, 0.0)
			sq:AddWorldInventoryItem("Base.Bone", 0.3, 0.3, 0.0)
		end		
	else
		self.character:addBlood(null, false, true, false)
		triggerEvent("OnClothingUpdated",self.character)		
		if self.rotten then
			local meat = self.character:getInventory():AddItem("Base.ZombieFlesh");
			--meat:setStressChange(1)
			--meat:setUnhappyChange(30)
			local meat2 = self.character:getInventory():AddItem("Base.ZombieFlesh");
			--meat2:setStressChange(1)
			--meat2:setUnhappyChange(30)
			local meat3 = self.character:getInventory():AddItem("Base.ZombieFlesh");
			--meat3:setStressChange(1)
			--meat3:setUnhappyChange(30)
			--local meat4 = self.character:getInventory():AddItem("Base.ZombieFlesh");
			--meat4:setStressChange(1)
			--meat4:setUnhappyChange(30)			
			if self.character:getPerkLevel(Perks.Cooking) > 2 then
				local meat5 = self.character:getInventory():AddItem("Base.ZombieFlesh");
				--meat5:setStressChange(1)
				--meat5:setUnhappyChange(30)			
			end			
			if self.character:getPerkLevel(Perks.Cooking) > 4 then
				local meat5 = self.character:getInventory():AddItem("Base.ZombieFlesh");
				--meat5:setStressChange(1)
				--meat5:setUnhappyChange(30)			
			end			
			if self.character:getPerkLevel(Perks.Cooking) > 6 then
				local meat5 = self.character:getInventory():AddItem("Base.ZombieFlesh");
				--meat5:setStressChange(1)
				--meat5:setUnhappyChange(30)			
			end			
			if self.character:getPerkLevel(Perks.Cooking) > 8 then
				local meat5 = self.character:getInventory():AddItem("Base.ZombieFlesh");
				--meat5:setAge(24)				meat5:setStressChange(1)
				--meat5:setUnhappyChange(30)			
			end
		else			
			if obj:getContainer():contains("autopsySkullInfected") or obj:getContainer():contains("token_Infected") then
				--print("Infected")
				self.character:getInventory():AddItem("Base.InfectedHumanFlesh");
				self.character:getInventory():AddItem("Base.InfectedHumanFlesh");
				self.character:getInventory():AddItem("Base.InfectedHumanFlesh");
				self.character:getInventory():AddItem("Base.InfectedHumanLiver");
				if self.character:getPerkLevel(Perks.Cooking) >= 3 then
					self.character:getInventory():AddItem("Base.InfectedHumanFlesh");
				end			
				if self.character:getPerkLevel(Perks.Cooking) >= 5 then
					self.character:getInventory():AddItem("Base.InfectedHumanFlesh");
				end			
				if self.character:getPerkLevel(Perks.Cooking) >= 7 then
					self.character:getInventory():AddItem("Base.InfectedHumanFlesh");
				end			
				if self.character:getPerkLevel(Perks.Cooking) >= 9 then
					self.character:getInventory():AddItem("Base.InfectedHumanFlesh");
				end
			
			else
				--print("Not Tainted")
				self.character:getInventory():AddItem("Base.HumanFlesh");
				self.character:getInventory():AddItem("Base.HumanFlesh");
				self.character:getInventory():AddItem("Base.HumanFlesh");
				self.character:getInventory():AddItem("Base.HumanLiver");			
				if self.character:getPerkLevel(Perks.Cooking) >= 3 then
					self.character:getInventory():AddItem("Base.HumanFlesh");
				end			
				if self.character:getPerkLevel(Perks.Cooking) >= 5 then
					self.character:getInventory():AddItem("Base.HumanFlesh");
				end			
				if self.character:getPerkLevel(Perks.Cooking) >= 7 then
					self.character:getInventory():AddItem("Base.HumanFlesh");
				end			
				if self.character:getPerkLevel(Perks.Cooking) >= 9 then
					self.character:getInventory():AddItem("Base.HumanFlesh");
				end			
			end
		end	
	end	
	

	for i=1,obj:getContainerCount() do
	local container = obj:getContainerByIndex(i-1)
	local sq = obj:getSquare();
		
	for j=1,container:getItems():size() do
		if container:getItems():get(j-1):getType() ~= "autopsySkullInfected" and container:getItems():get(j-1):getType() ~= "autopsySkull" 
		and container:getItems():get(j-1):getType() ~= "token_Infected" and container:getItems():get(j-1):getType() ~= "token_Uninfected"
		and not container:getItems():get(j-1):getType():contains("Wound")
		and not container:getItems():get(j-1):getType():contains("Bandage_")
		and container:getItems():get(j-1):getType() ~= ("GMP")  
		and container:getItems():get(j-1):getDisplayName() ~= "Blooo" then
		
			local item = sq:AddWorldInventoryItem(container:getItems():get(j-1), 0.0, 0.0, 0.0)

			end
		end
	end
	
	addZombiesEating( self.corpseBody:getX(), self.corpseBody:getY(), self.corpseBody:getZ(), 0, true )
	self.corpseBody:getSquare():removeCorpse(self.corpseBody, false);
	self.corpseBody:getSquare():getObjects():remove(self.corpseBody);
	
    local pdata = getPlayerData(self.character:getPlayerNum());
    if pdata ~= nil then
        pdata.playerInventory:refreshBackpacks();
        pdata.lootInventory:refreshBackpacks();
    end
    -- needed to remove from queue / start next.
    ISBaseTimedAction.perform(self);
end

function ISButcherCorpseAction:new (character, corpse, time, rotten, skeleton, blood, brain)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.character = character;
    o.corpse = corpse:getItem();
    o.corpseBody = corpse;
    o.stopOnWalk = true;
    o.stopOnRun = true;
    o.maxTime = time;
	o.rotten = rotten;
	o.skeleton = skeleton;
	o.blood = blood;
	o.brain = brain;
    if character:isTimedActionInstant() then
        o.maxTime = 1;
    end
    return o
end
