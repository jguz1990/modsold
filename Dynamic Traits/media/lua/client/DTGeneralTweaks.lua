-- Additional tweaks when the player hit a tree
function tweaksToOnHitTree(player, weapon)
	if weapon:getCategories():contains("Axe") then
		player:getXp():AddXP(Perks.Axe, 1);
	end
	if player:HasTrait("Prodigy") then
		player:getXp():AddXP(Perks.Fitness, 1);
		player:getXp():AddXP(Perks.Strength, 1);
	end
	-- If the player has the trait "Active" the negative moods are reduced when chopping trees
	if player:HasTrait("PhysicallyActive") then
		DTdecreaseStress(player, 0.03);
        DTdecreaseStressFromCigarettes(player, 0.03);
        DTdecreaseUnhappyness(player, 0.3);
	-- If the player has the trait "Sedentary" little pain is given to the player when chopping trees
	elseif player:HasTrait("Sedentary") then
		DTapplyPain(player, ZombRand(10), "ForeArm_L", ZombRand(15));
		DTapplyPain(player, ZombRand(10), "ForeArm_R", ZombRand(15));
		DTapplyPain(player, ZombRand(10), "UpperArm_L", ZombRand(15));
		DTapplyPain(player, ZombRand(10), "UpperArm_R", ZombRand(15));
	end
	player:getModData().DTObtainLoseActiveSedentary = player:getModData().DTObtainLoseActiveSedentary + 3;
	if player:getModData().DTObtainLoseActiveSedentary > 70000 then
		player:getModData().DTObtainLoseActiveSedentary = 70000;
	end
end
Events.OnWeaponHitTree.Add(tweaksToOnHitTree);

-- Additional tweaks when the player swings the weapon
function tweaksToSwingWeapon(player, weapon)
	-- If the player has the trait "Prodigy" extra XP is given to the player for Strength and Fitness
	if weapon:getCategories():contains("Axe") or weapon:getCategories():contains("Blunt") then
		if player:HasTrait("Prodigy") then 
			player:getXp():AddXP(Perks.Fitness, 0.80);
			player:getXp():AddXP(Perks.Strength, 0.80);
		end
		if player:HasTrait("Sedentary") then
			DTapplyPain(player, ZombRand(10), "ForeArm_L", ZombRand(15));
			DTapplyPain(player, ZombRand(10), "ForeArm_R", ZombRand(15));
			DTapplyPain(player, ZombRand(10), "UpperArm_L", ZombRand(15));
			DTapplyPain(player, ZombRand(10), "UpperArm_R", ZombRand(15));
		end
		player:getModData().DTObtainLoseActiveSedentary = player:getModData().DTObtainLoseActiveSedentary + 4;
	elseif weapon:getCategories():contains("Spear") or weapon:getCategories():contains("LongBlade")then
		if player:HasTrait("Prodigy") then 
			player:getXp():AddXP(Perks.Fitness, 0.70);
			player:getXp():AddXP(Perks.Strength, 0.70);
		end
		if player:HasTrait("Sedentary") then
			DTapplyPain(player, ZombRand(10), "ForeArm_L", ZombRand(10));
			DTapplyPain(player, ZombRand(10), "ForeArm_R", ZombRand(10));
			DTapplyPain(player, ZombRand(10), "UpperArm_L", ZombRand(10));
			DTapplyPain(player, ZombRand(10), "UpperArm_R", ZombRand(10));
		end
		player:getModData().DTObtainLoseActiveSedentary = player:getModData().DTObtainLoseActiveSedentary + 3;
	elseif weapon:getCategories():contains("SmallBlunt") then
		if player:HasTrait("Prodigy") then 
			player:getXp():AddXP(Perks.Fitness, 0.60);
			player:getXp():AddXP(Perks.Strength, 0.60);
		end
		if player:HasTrait("Sedentary") then
			DTapplyPain(player, ZombRand(12), "ForeArm_L", ZombRand(10));
			DTapplyPain(player, ZombRand(12), "ForeArm_R", ZombRand(10));
			DTapplyPain(player, ZombRand(12), "UpperArm_L", ZombRand(10));
			DTapplyPain(player, ZombRand(12), "UpperArm_R", ZombRand(10));
		end
		player:getModData().DTObtainLoseActiveSedentary = player:getModData().DTObtainLoseActiveSedentary + 2;
	elseif weapon:getCategories():contains("SmallBlade") then
		if player:HasTrait("Prodigy") then 
			player:getXp():AddXP(Perks.Fitness, 0.50);
			player:getXp():AddXP(Perks.Strength, 0.50);
		end
		if player:HasTrait("Sedentary") then
			DTapplyPain(player, ZombRand(15), "ForeArm_L", ZombRand(8));
			DTapplyPain(player, ZombRand(15), "ForeArm_R", ZombRand(8));
			DTapplyPain(player, ZombRand(15), "UpperArm_L", ZombRand(8));
			DTapplyPain(player, ZombRand(15), "UpperArm_R", ZombRand(8));
		end
		player:getModData().DTObtainLoseActiveSedentary = player:getModData().DTObtainLoseActiveSedentary + 1;
	elseif weapon:getCategories():contains("Unarmed") then
		if player:HasTrait("Prodigy") then 
			player:getXp():AddXP(Perks.Fitness, 0.25);
			player:getXp():AddXP(Perks.Strength, 0.25);
		end
		player:getModData().DTObtainLoseActiveSedentary = player:getModData().DTObtainLoseActiveSedentary + 1;
	end
	-- If the player has the trait "Active" the negative moods are reduced when when fighting
	if player:HasTrait("PhysicallyActive") then
		DTdecreaseStress(player, 0.03);
        DTdecreaseStressFromCigarettes(player, 0.03);
        DTdecreaseUnhappyness(player, 0.3);
	end
	if player:getModData().DTObtainLoseActiveSedentary > 70000 then
		player:getModData().DTObtainLoseActiveSedentary = 70000;
	end
	--print("player:getModData().DTObtainLoseActiveSedentary: " .. player:getModData().DTObtainLoseActiveSedentary);
end
--Events.OnWeaponSwing.Add(tweaksToSwingWeapon);
Events.OnWeaponSwingHitPoint.Add(tweaksToSwingWeapon);

-- If the player is with a Heavy Load there are minimum chances of getting a fracture.
function fracturesIfHeavyLoad()
	local fracturesBodyPart = {"Hand_L", "Hand_R", "ForeArm_L", "ForeArm_R", "UpperArm_L", "UpperArm_R", "Torso_Lower", "Groin", "UpperLeg_L", "UpperLeg_R", "LowerLeg_L", "LowerLeg_R", "Foot_L", "Foot_R"};
	local randNumber = ZombRand(1, 15);
	local bodyPart = BodyPartType.FromString(fracturesBodyPart[randNumber]);
	for playerIndex = 0, getNumActivePlayers()-1 do
		local player = getSpecificPlayer(playerIndex);
		local playerBodyPart = player:getBodyDamage():getBodyPart(bodyPart);
		if player:getMoodles():getMoodleLevel(MoodleType.HeavyLoad) == 3 then
			if player:HasTrait("Flimsy") then
				if ZombRand(2700) == 0 then
					playerBodyPart:setFractureTime(ZombRand(30, 50));
				end
			elseif player:HasTrait("Frail") then
				if ZombRand(2400) == 0 then
					playerBodyPart:setFractureTime(ZombRand(30, 50));
				end
			elseif player:HasTrait("Anorexy") then
				if ZombRand(2100) == 0 then
					playerBodyPart:setFractureTime(ZombRand(30, 50));
				end
			elseif player:HasTrait("Flimsy") and player:HasTrait("Anorexy") then
				if ZombRand(1800) == 0 then
					playerBodyPart:setFractureTime(ZombRand(30, 50));
				end
			elseif player:HasTrait("Frail") and player:HasTrait("Anorexy") then
				if ZombRand(1500) == 0 then
					playerBodyPart:setFractureTime(ZombRand(30, 50));
				end
			else
				if ZombRand(3000) == 0 then
					playerBodyPart:setFractureTime(ZombRand(30, 50));
				end
			end
		elseif player:getMoodles():getMoodleLevel(MoodleType.HeavyLoad) == 4 then
			if player:HasTrait("Flimsy") then
				if ZombRand(2430) == 0 then
					playerBodyPart:setFractureTime(ZombRand(30, 50));
				end
			elseif player:HasTrait("Frail") then
				if ZombRand(2160) == 0 then
					playerBodyPart:setFractureTime(ZombRand(30, 50));
				end
			elseif player:HasTrait("Anorexy") then
				if ZombRand(1890) == 0 then
					playerBodyPart:setFractureTime(ZombRand(30, 50));
				end
			elseif player:HasTrait("Flimsy") and player:HasTrait("Anorexy") then
				if ZombRand(1620) == 0 then
					playerBodyPart:setFractureTime(ZombRand(30, 50));
				end
			elseif player:HasTrait("Frail") and player:HasTrait("Anorexy") then
				if ZombRand(1350) == 0 then
					playerBodyPart:setFractureTime(ZombRand(30, 50));
				end
			else
				if ZombRand(2700) == 0 then
					playerBodyPart:setFractureTime(ZombRand(30, 50));
				end
			end
		end
	end
end
Events.EveryTenMinutes.Add(fracturesIfHeavyLoad);