if SuperSurvivor then

	local old_SuperSurvivor_update = SuperSurvivor.update



	function SuperSurvivor:update()
		local playerInv = self.player:getInventory()
		while playerInv:containsType("autopsySkull") or playerInv:containsType("autopsySkullInfected") or playerInv:containsType("token_Uninfected") or playerInv:containsType("token_Infected") do
			local skull = playerInv:getFirstType("autopsySkull") or playerInv:getFirstType("autopsySkullInfected") or playerInv:getFirstType("token_Uninfected") or playerInv:getFirstType("token_Infected") 
			playerInv:Remove(skull)
		end
		PerformInfectionCheck(self.player);
		old_SuperSurvivor_update(self)
	end

end
-- function SuperSurvivor:update()
	-- local playerInv = self.player:getInventory()
	-- while playerInv:containsType("autopsySkull") or playerInv:containsType("autopsySkullInfected") or playerInv:containsType("token_Uninfected") or playerInv:containsType("token_Infected") do
		-- local skull = playerInv:getFirstType("autopsySkull") or playerInv:getFirstType("autopsySkullInfected") or playerInv:getFirstType("token_Uninfected") or playerInv:getFirstType("token_Infected") 
		-- playerInv:Remove(skull)
	-- end
	-- PerformInfectionCheck(self.player);
	-- if(self:isDead()) then return false end
	
	-- self:Get():NPCSetAttack(false);
	-- self:CleanUp(0.97); -- reduce current blood/dirt by this percent 
	
	-- self.TriggerHeldDown = false
	-- if(not SurvivorHunger) then
		-- self.player:getStats():setThirst(0.0)
		-- self.player:getStats():setHunger(0.0)	
	-- --else
		-- --self.player:getStats():setThirst(self.player:getStats():getThirst() + 0.00005) -- survivor thirst does not move so manually incremnt it
	-- end
	
	-- self.player:getBodyDamage():setWetness(0.0);	
	-- self.player:getStats():setFatigue(0.0);	
	-- self.player:getStats():setBoredom(0.0);
	-- self.player:getStats():setIdleboredom(0.0);
	-- self.player:getStats():setMorale(0.5);
	-- self.player:getStats():setStress(0.0);
	-- self.player:getStats():setSanity(1);
	
	-- if(self.player:isOnFire()) then 
		-- --self.player:getBodyDamage():RestoreToFullHealth() -- temporarily give some fireproofing as they walk right through fire via pathfinding
		-- --self.player:setFireSpreadProbability(0); -- give some fireproofing as they walk right through fire via pathfinding	
	-- end
	

	-- local cs = self.player:getCurrentSquare()
	-- if(cs ~= nil) then
		-- if(self.LastSquare == nil) or (self.LastSquare ~= cs) then
			-- self.TicksSinceSquareChanged = 0
			-- self.LastSquare = cs
		-- elseif (self.LastSquare == cs) then
			-- self.TicksSinceSquareChanged = self.TicksSinceSquareChanged + 1
			-- --self:Speak(tostring(self.TicksSinceSquareChanged))
		-- end
	-- end
	
	-- --self.player:Say(tostring(self:isInAction()) ..",".. tostring(self.TicksSinceSquareChanged > 6) ..",".. tostring(self:inFrontOfLockedDoor()) ..",".. tostring(self:getTaskManager():getCurrentTask() ~= "Enter New Building") ..",".. tostring(self.TargetBuilding ~= nil))
	-- --print( self:getName()..": "..tostring((self.TargetBuilding ~= nil)))
	-- if ((self:inFrontOfLockedDoor())or(self:inFrontOfWindow())) and (self:getTaskManager():getCurrentTask() ~= "Enter New Building") and (self.TargetBuilding ~= nil) and ( ((self.TicksSinceSquareChanged > 6) and (self:isInAction() == false)) or (self:getCurrentTask() == "Pursue") ) then
		-- self:getTaskManager():AddToTop(AttemptEntryIntoBuildingTask:new(self, self.TargetBuilding))
		-- self.TicksSinceSquareChanged = 0
	-- end
	-- --self.player:Say(tostring(self:isInAction()) ..",".. tostring(self.TicksSinceSquareChanged > 6) ..",".. tostring((self:inFrontOfWindow())))
	
	-- if (self.TicksSinceSquareChanged > 9) and (self:isInAction() == false) and (self:inFrontOfWindow()) and (self:getCurrentTask() ~= "Enter New Building") then
		-- self.player:climbThroughWindow(self:inFrontOfWindow())
		-- self.TicksSinceSquareChanged = 0
	-- end
	
	-- if ((self.TicksSinceSquareChanged > 7) and (self:Get():getModData().bWalking == true)) then
		-- local xoff = self.player:getX() + ZombRand(-3,3)
		-- local yoff = self.player:getY() + ZombRand(-3,3)
		-- self:StopWalk()
		-- self:WalkToPoint(xoff,yoff,self.player:getZ())
		-- self:Wait(2)
		-- self.TicksSinceSquareChanged = 0
	-- end
		
	-- if(self.player:getBodyDamage():getInfectionLevel() <= 0) then
		-- local BPs = self.player:getBodyDamage():getBodyParts()
		-- for i=0, BPs:size()-1 do	
			-- if(BPs:get(i):bitten()) then 
				-- print("manually infecting "..self:getName())
				-- self.player:getBodyDamage():setInfectionLevel(100)
				-- self.player:getBodyDamage():setFakeInfectionLevel(100)
				-- self.player:getBodyDamage():setInf(true); -- remove infection if did not have before the blocked scratch
				-- self.player:getBodyDamage():setInfectionGrowthRate(1);	
			-- end
		-- end
	-- end
	
	-- self:DoVision()
	-- --self:Speak(tostring(self:isInBase()))
	
	-- self.MyTaskManager:update()
	-- if(self.Reducer % 480 == 0) then 
		-- self:setSneaking(false)
		-- local group = self:getGroup()
		-- if(group) then group:checkMember(self:getID()) end
		-- self:SaveSurvivor()
		-- if(self:Get():getPrimaryHandItem() ~= nil) and (((self:Get():getPrimaryHandItem():getDisplayName()=="Corpse") and (self:getCurrentTask() ~= "Pile Corpses")) or (self:Get():getPrimaryHandItem():isBroken()) ) then
			
			-- ISTimedActionQueue.add(ISDropItemAction:new(self:Get(),self:Get():getPrimaryHandItem(),30))
			-- self:Get():setPrimaryHandItem(nil)
			-- self:Get():setSecondaryHandItem(nil)
		-- end
		-- if(self:Get():getPrimaryHandItem() == nil) and (self:getWeapon()) then self:Get():setPrimaryHandItem(self:getWeapon()) end
		
		-- self:ManageXP()
		
		-- self.player:getModData().hitByCharacter = false
		-- self.player:getModData().semiHostile = false	
		
	-- else self:SaveSurvivorOnMap() end
	
	-- if( self.GoFindThisCounter > 0 ) then self.GoFindThisCounter = self.GoFindThisCounter -1 end

-- end