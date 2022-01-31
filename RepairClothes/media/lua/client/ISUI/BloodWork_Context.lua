function BloodWork_Context (player, context, worldobjects, test)
	local playerObj = getSpecificPlayer(player)
	local playerInv = playerObj:getInventory()
	--print("Test")
	if playerInv:containsType("SyringeEmpty") then	
		print("Jabber")
		if  playerObj:getPerkLevel(Perks.Doctor) >= 3 and ( playerObj:HasTrait("Hemophobic") == false and playerObj:HasTrait("Cowardly") == false and playerObj:HasTrait("WeakStomach") == false ) then
			local corpse2 = IsoObjectPicker.Instance:PickCorpse(context.x, context.y)
			if corpse2 then
			local vMod = corpse2:getModData();
			if vMod.bloodless   then
			else
					if corpse2:isSkeleton() == false then 
						if corpse2:isZombie() == false then
							context:addOption(getText("Fill Syringe With Blood"), worldobjects, ISWorldObjectContextMenu.FillSyringeWithBlood, corpse2, player);
						else
							context:addOption(getText("Fill Syringe With Blood"), worldobjects, ISWorldObjectContextMenu.FillSyringeWithZombieBlood, corpse2, player);
						end								
					end	
				end				
			end		
		end		
	end
end

Events.OnPreFillWorldObjectContextMenu.Add(BloodWork_Context)	

ISWorldObjectContextMenu.FillSyringeWithBlood = function(worldobjects, WItem, player)
	local playerObj = getSpecificPlayer(player) 
	local playerInv = playerObj:getInventory()  	
	local hammer = playerInv:getFirstType("SyringeEmpty")	    
	if WItem:getSquare() and luautils.walkAdj(playerObj, WItem:getSquare()) then
		ISWorldObjectContextMenu.equip(playerObj, playerObj:getPrimaryHandItem(), hammer, true);
        ISTimedActionQueue.add(ISButcherCorpseAction:new(playerObj, WItem, 250, false, false, true, false));
    end
end

ISWorldObjectContextMenu.FillSyringeWithZombieBlood = function(worldobjects, WItem, player)
	local playerObj = getSpecificPlayer(player) 
	local playerInv = playerObj:getInventory() 	
	local hammer = playerInv:getFirstType("SyringeEmpty")    
	if WItem:getSquare() and luautils.walkAdj(playerObj, WItem:getSquare()) then
		ISWorldObjectContextMenu.equip(playerObj, playerObj:getPrimaryHandItem(), hammer, true);
        ISTimedActionQueue.add(ISButcherCorpseAction:new(playerObj, WItem, 250, true, false, true, false));
    end
end

function InfectedFlesh(food, player)
	local bd = player:getBodyDamage();
	bd:setInf(true);
	bd:getBodyPart(BodyPartType.Head):SetInfected(true);
end

function OnSyringeHitCharacter(wielder, victim, weapon, damage)
	if weapon:getType() == "SyringeEmpty" then
			wielder:playSound("BreakMetalItem");
		--print("EMPTY SYRINGE")
		wielder:getInventory():Remove(weapon)
		local syringe = wielder:getInventory():AddItem("SyringeBroken")
		wielder:setPrimaryHandItem(syringe);
	elseif weapon:getType() == "SyringeBlood" then
			victim:playSound("ZombieScratch");
		--print("BLOOD SYRINGE")
		wielder:getInventory():Remove(weapon)
		local syringe = wielder:getInventory():AddItem("SyringeBroken")
		wielder:setPrimaryHandItem(syringe);
	elseif weapon:getType() == "SyringeZombieBlood" then
			victim:playSound("ZombieScratch");
		--print("ZOMBIE BLOOD SYRINGE")
		wielder:getInventory():Remove(weapon)
		local syringe = wielder:getInventory():AddItem("SyringeBroken")
		wielder:setPrimaryHandItem(syringe);
		if victim:isZombie() == false then
			local chance = 25
			if victim:HasTrait("ThickSkinned") then
				chance = chance / 2
			end
			if victim:HasTrait("ThinSkinned") then
				chance = chance * 2
			end
			print(tostring(chance))
			if ZombRand(0,100) < chance then
				print("YEP!")
				local bd = victim:getBodyDamage();
				--bd:getBodyPart(BodyPartType.Head):SetBitten(true);
				bd:setInf(true);
				bd:getBodyPart(BodyPartType.Head):SetInfected(true);
				--bd:setInfectionGrowthRate(1);	
				--bd:setInfectionLevel(100)
				--bd:setFakeInfectionLevel(100)
				--bd:getBodyPart(BodyPartType.Head):SetBitten(false);
			else
				print("NOPE " .. tostring(chance))
			end
		end
	end
end

Events.OnWeaponHitCharacter.Add(OnSyringeHitCharacter)