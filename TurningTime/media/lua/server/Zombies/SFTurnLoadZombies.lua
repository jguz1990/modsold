SFTurn = {}

function SFTurn.BehaviorBanshee(zombie, items)
	local timer = SFTurn.CheckTimer(zombie, items)
	if timer == false then return end
	
	local chance = ZombRand(0,5);
	local x, y, z = zombie:getX(), zombie:getY(), zombie:getZ();
	if getPlayer():isGhostMode() == false and zombie:DistTo(getPlayer()) < 7 and zombie:CanSee(getPlayer()) == true and zombie:isUseless() == true and not zombie:isProne() then
		local test = SFTurn.TestSneak(getPlayer())
		if test == false then
			zombie:playSound("BansheeScream")
			addSound(null, x, y, z, 200, 200)
			zombie:changeSpeed(1)
			zombie:DoZombieStats()
			zombie:setForceEatingAnimation(false)
			zombie:setUseless(false)
			zombie:setAttachedItem("JawStab", InventoryItemFactory.CreateItem("Base.Token_Timer"))
			return
		end
	elseif zombie:isUseless() == false and zombie:isTargetLocationKnown() ~= true and chance < 4 then
		zombie:setUseless(true)
		zombie:setForceEatingAnimation(true)
		zombie:setAttachedItem("JawStab", InventoryItemFactory.CreateItem("Base.Token_Timer"))
	end
end

function SFTurn.BehaviorNemesis(zombie)
	local timer = SFTurn.CheckTimer(zombie, items)
	if timer == false then return end

	if zombie:getThumpTarget() ~= nil then
		local thump = zombie:getThumpTarget()
		if instanceof(thump, "IsoDoor") then
			thump:destroy()
			zombie:playSound("breakdoor")
			zombie:setAttachedItem("JawStab", InventoryItemFactory.CreateItem("Base.Token_Timer"))
		elseif instanceof(thump, "IsoBarricade") then
				thump:DamageBarricade(100)
		elseif instanceof(thump, "IsoWindow") then
			if thump:getBarricadeForCharacter(zombie) then
				local barricade = thump:getBarricadeForCharacter(zombie)
				barricade:DamageBarricade(100)
			else
				thump:Damage(100, zombie)
				local item = InventoryItemFactory.CreateItem("Base.Token_Timer")
				item:setUsedDelta(0.25)
				zombie:setAttachedItem("JawStab", item)
			end
		elseif instanceof(thump, "IsoThumpable") then
			thump:destroy()
			zombie:setAttachedItem("JawStab", InventoryItemFactory.CreateItem("Base.Token_Timer"))
		elseif instanceof(thump, "BaseVehicle") then

		end
	end
end

function SFTurn.CheckTimer(zombie, items)
    if items and items:size() > 0 then
        for j=0,items:size()-1 do
            local item = items:getItemByIndex(j)
				if item and item:getType() == "Token_Timer" then
					if item:getDrainableUsesInt() == 0 then
						zombie:removeAttachedItem(item)
						return true
					end
					item:Use()
					return false
				else
					return true
			end
		end
	end

end

function SFTurn.LoadZombies()

	local zombies = getPlayer():getCell():getZombieList()
	local cnt1 = zombies:size()-1;
	for i=0,cnt1 do
		local zombie = zombies:get(i);
		SFTurn.ReloadZombie(zombie);
	end
end

function SFTurn.ReloadZombie(zombie)
    local items = zombie:getAttachedItems()     
    if items and items:size() > 0 then
        for j=0,items:size()-1 do
            local item = items:getItemByIndex(j)
			if item and item:getType() == "Token_Banshee" then
				zombie:changeSpeed(1)
				--zombie:DoZombieStats()
			end
			if item and item:getType() == "Token_Crawler" and not zombie:isCrawling() then
				zombie:setBecomeCrawler(true)
			end
			if item and item:getType() == "Token_Inactive" then
				zombie:makeInactive(true)
			end
			if item and item:getType() == "Token_NoTeeth" then
				zombie:setNoTeeth(true)
			end
			if item and item:getType() == "Token_OnlyJawStab" then
				if SandboxVars.SFTurn.ImmortalNemesis == true then
					zombie:setOnlyJawStab(true)
				else
					zombie:setHealth(5000)
				end
				--zombie:changeSpeed(3)
				zombie:DoZombieStats()
				zombie:setCanCrawlUnderVehicle(false)
				print("Initialized a Nemesis")
			end
			if item and item:getType() == "Token_Skeleton" then
				zombie:setSkeleton(true)
			end
			if item and item:getType() == "Token_Useless" then
				zombie:setUseless(true)
			end
        end
    end
end

function SFTurn.TestSneak(player)
	local difficulty = 10
	local roll = ZombRand(0,12)
	local skill = player:getPerkLevel(Perks.Sneak)
	
	if not (player:isAiming() or player:isSneaking()) then
		difficulty = difficulty + 10
	end
	if player:getTorchStrength() > 0.0F then
		difficulty = difficulty + 3;
	end
	if player:HasTrait("Graceful") then
		skill = skill * 2;
	elseif player:HasTrait("Clumsy") then
		skill = skill * 0.5;
	end

	if (skill + roll) > difficulty then
		return true
	else
		return false
	end
end

function SFTurn.UpdateZombie(zombie)
    local items = zombie:getAttachedItems()     
    if items and items:size() > 0 then
        for j=0,items:size()-1 do
            local item = items:getItemByIndex(j)
			if item and item:getType() == "Token_Banshee" then
				SFTurn.BehaviorBanshee(zombie, items)
			end
			if item and item:getType() == "Token_OnlyJawStab" then
				if SandboxVars.SFTurn.ImmortalNemesis == true then
					zombie:setOnlyJawStab(true)
				else
					zombie:setHealth(5000)
				end
				--zombie:changeSpeed(3)
				--zombie:DoZombieStats()
				SFTurn.BehaviorNemesis(zombie)
			end
        end
    end
end

Events.OnZombieUpdate.Add(SFTurn.UpdateZombie)
Events.OnGameStart.Add(SFTurn.LoadZombies);