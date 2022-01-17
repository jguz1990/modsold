--[[

--***********************************************************
--**                    ROBERT JOHNSON                     **
--***********************************************************

require "TimedActions/ISBaseTimedAction"

ISReloadWeaponAction = ISBaseTimedAction:derive("ISReloadWeaponAction");

------------------------------------------------------------------
--	HARDCORE RELOADING SECTION by STORMTROOPER
------------------------------------------------------------------
function ISReloadWeaponAction.stopAfterEject()
	return false
end

ISReloadWeaponAction.addRackingAfter = function(self, player, gun)
	ISTimedActionQueue.addAfter(self, ISRackFirearm:new(player, gun))
end

ISReloadWeaponAction.fillMagazine = function(playerObj, magazine, ammoCount)
	ISTimedActionQueue.add(ISLoadBulletsInMagazine:new(playerObj, magazine, ammoCount))
end

function ISReloadWeaponAction.canFireSemi()
	return true
end

function ISReloadWeaponAction.noLongerCanFire()
	return
end

ISReloadWeaponAction.addRacking = function(player, gun)
	ISTimedActionQueue.add(ISRackFirearm:new(player, gun))
end
------------------------------------------------------------------


function ISReloadWeaponAction:isValid()
	return self.character:getPrimaryHandItem() == self.gun
end

function ISReloadWeaponAction:update()
	local remaining = self.ammoCount - (self.gun:getCurrentAmmoCount() - self.ammoCountStart)
	self.gun:setJobDelta((self.gun:getCurrentAmmoCount() - self.ammoCountStart) / self.ammoCount)
end

ISReloadWeaponAction.canRack = function(weapon)
	if not weapon:getMagazineType() and not weapon:getAmmoType() then
		return false
	end
	if weapon:isJammed() then
		return true
	end
	if weapon:haveChamber() and weapon:isRoundChambered() then
		return true
	end
	if weapon:haveChamber() and weapon:isSpentRoundChambered() then
		return true
	end
	if weapon:haveChamber() and not weapon:isRoundChambered() and weapon:getMagazineType() and weapon:getCurrentAmmoCount() > 0 then
		return true
	end
	if not weapon:haveChamber() and weapon:getCurrentAmmoCount() > 0 then
		return true
	end
	if not weapon:haveChamber() and weapon:getSpentRoundCount() > 0 then
		return true
	end
	if not weapon:getMagazineType() and weapon:getCurrentAmmoCount() >= weapon:getAmmoPerShoot() then
		return true;
	end
	return false;
end

function ISReloadWeaponAction:start()
	-- Setup IsPerformingAction & the current anim we want (check in AnimSets LoadHandgun.xml for example)
	self:setOverrideHandModels(self.gun, nil);
	self.character:setVariable("WeaponReloadType", self.gun:getWeaponReloadType())
	self.character:setVariable("isLoading", true);
	self.ammoCountStart = self.gun:getCurrentAmmoCount()
	self.gun:setJobType(getText("IGUI_JobType_LoadBulletsIntoFirearm"))
	self.gun:setJobDelta(0.0)
	self:initVars();
	self:setActionAnim(CharacterActionAnims.Reload);
	
	self.character:reportEvent("EventReloading");

	self:ejectSpentRounds()

	-- no bullets were found
	if not self.bullets then
		self:forceStop();
	end
end

-- This is used by other timed actions.
function ISReloadWeaponAction.setReloadSpeed(character, rack)
	local baseReloadSpeed = 1;
	if rack then
		-- reloading skill has less impact on racking, panic does nothing
		baseReloadSpeed = baseReloadSpeed + (character:getPerkLevel(Perks.Reloading) * 0.03);
	else
		baseReloadSpeed = baseReloadSpeed + (character:getPerkLevel(Perks.Reloading) * 0.07);
		baseReloadSpeed = baseReloadSpeed - (character:getMoodles():getMoodleLevel(MoodleType.Panic) * 0.05);
	end
	
	-- check for ammo straps
	local gun = character:getPrimaryHandItem();
	local strap = character:getWornItem("AmmoStrap");
	local strapFound = false;
	if gun and strap and strap:getClothingItem() then
		local shell = false;
		if gun:getAmmoType() == "Base.ShotgunShells" then
			shell = true;
		end
		if shell and strap:getClothingItemName() == "AmmoStrap_Shells" then
			strapFound = true;
		elseif not shell and  strap:getClothingItemName() == "AmmoStrap_Bullets" then
			strapFound = true;
		end
	end
	if strapFound then
		baseReloadSpeed = baseReloadSpeed * 1.15;
	end
	-- vehicles driver take bit longer to reload their weapon
	if character:getVehicle() and character:getVehicle():getDriver() == character then
		baseReloadSpeed = baseReloadSpeed * 0.8;
	end
	character:setVariable("ReloadSpeed", baseReloadSpeed * GameTime.getAnimSpeedFix());
end

-- Add some vars we gonna use, either magazine or the bullets
-- also decide the reload speed
function ISReloadWeaponAction:initVars()
	ISReloadWeaponAction.setReloadSpeed(self.character, false)
	-- Get the best magazine (the one with the most bullets)
	local ammoType = self.gun:getAmmoType()
	if ammoType then
		local ammoCount = self.character:getInventory():getItemCountRecurse(ammoType)
		ammoCount = math.min(ammoCount, self.gun:getMaxAmmo() - self.gun:getCurrentAmmoCount())
		local bullets = self.character:getInventory():getSomeType(self.gun:getAmmoType(), ammoCount);
		if bullets and not bullets:isEmpty() then
			self.bullets = bullets;
			self.ammoCount = ammoCount;
		end
	end
end

function ISReloadWeaponAction:stop()
	if self.gun:getInsertAmmoStopSound() then
		self.character:playSound(self.gun:getInsertAmmoStopSound());
	end
	self.gun:setJobDelta(0.0)
	-- this should already be cleared from event, but who knows right?
	self.character:clearVariable("isLoading");
	self.character:clearVariable("WeaponReloadType")
	ISBaseTimedAction.stop(self);
end

function ISReloadWeaponAction:perform()
	if self.gun:getInsertAmmoStopSound() then
		self.character:playSound(self.gun:getInsertAmmoStopSound());
	end
	self.gun:setJobDelta(0.0)
	self.character:clearVariable("isLoading");
	self.character:clearVariable("WeaponReloadType")
	ISBaseTimedAction.perform(self);
end

-- Our AnimSet trigger various event, we hook them here. Check LoadHandgun.xml for example.
function ISReloadWeaponAction:animEvent(event, parameter)
	-- Loading clip is done, we're moving to racking if needed
	if event == 'loadFinished' then
		self:loadAmmo();
		local chance = 3;
		local xp = 1;
		if self.character:getPerkLevel(Perks.Reloading) < 5 then
			chance = 1;
			xp = 4;
		end
		if ZombRand(chance) == 0 then
			self.character:getXp():AddXP(Perks.Reloading, xp);
		end
	end
	if event == 'playReloadSound' then
		if parameter == 'load' then
			if self.gun:getInsertAmmoSound() and self.gun:getCurrentAmmoCount() < self.gun:getMaxAmmo() then
				self.character:playSound(self.gun:getInsertAmmoSound());
			end
		elseif parameter == 'insertAmmoStart' then
			if not self.playedInsertAmmoStartSound and self.gun:getInsertAmmoStartSound() then
				self.playedInsertAmmoStartSound = true;
				self.character:playSound(self.gun:getInsertAmmoStartSound());
			end
		end
	end
	if event == 'changeWeaponSprite' then
		if parameter and parameter ~= '' then
			if parameter ~= 'original' then
				self:setOverrideHandModels(parameter, nil)
			else
				self:setOverrideHandModels(self.gun, nil)
			end
		end
	end
end

function ISReloadWeaponAction:loadAmmo()
	-- we insert a new clip only if we're in the motion of loading
	if self.bullets then -- insert bullets one by one
		if not self.bullets:isEmpty() and self.gun:getCurrentAmmoCount() < self.gun:getMaxAmmo() then
			local bullet = self.bullets:get(0);
			self.bullets:remove(bullet);
			self.character:getInventory():Remove(bullet);
			self.gun:setCurrentAmmoCount(self.gun:getCurrentAmmoCount() + 1);
		end
		-- fully loaded or no more bullet, we rack
		if self.bullets:isEmpty() or self.gun:getCurrentAmmoCount() >= self.gun:getMaxAmmo() then
			self.character:clearVariable("isLoading");
			-- we rack only if no round is chambered
			if self.gun:haveChamber() and not self.gun:isRoundChambered() then
				ISReloadWeaponAction.addRackingAfter(self, self.character, self.gun);
			end
			self:forceComplete();
		elseif self.gun:isInsertAllBulletsReload() then
			self:loadAmmo()
		end
	end
end

function ISReloadWeaponAction:ejectSpentRounds()
	if self.gun:getSpentRoundCount() > 0 then
		self.gun:setSpentRoundCount(0)
	elseif self.gun:isSpentRoundChambered() then
		self.gun:setSpentRoundChambered(false)
	else
		return
	end
	if self.gun:getShellFallSound() then
		self.character:getEmitter():playSound(self.gun:getShellFallSound())
	end
end

-- if reload is true we remove our current clip if we have one & equip a new one
-- if false we simply just remove the clip or ammos we have in our gun
function ISReloadWeaponAction:new(character, gun)
	local o = ISBaseTimedAction.new(self, character)
	o.stopOnAim = false;
	o.stopOnWalk = false;
	o.stopOnRun = true;
	o.gun = gun;
	o.reloading = true;
	o.maxTime = -1; -- we don't care about time, the anim is controlling the speed/time
	o.useProgressBar = false;
	return o;
end

ISReloadWeaponAction.ReloadBestMagazine = function(playerObj, gun)
	local magazine = gun:getBestMagazine(playerObj)
	if not magazine then
		magazine = playerObj:getInventory():getFirstTypeRecurse(gun:getMagazineType())
	end
	if not magazine then
		return
	end
	local ammoCount = ISInventoryPaneContextMenu.transferBullets(playerObj, magazine:getAmmoType(), magazine:getCurrentAmmoCount(), magazine:getMaxAmmo())
	if ammoCount == 0 then
		return
	end
	ISReloadWeaponAction.fillMagazine(playerObj, magazine, ammoCount)
	ISTimedActionQueue.add(ISInsertMagazine:new(playerObj, gun, magazine))
end

-- Called by ISFirearmRadialMenu.onKeyReleased()
ISReloadWeaponAction.BeginAutomaticReload = function(playerObj, gun)
	if gun:getMagazineType() then
-------------------------------------------------------------------------
-- ARSENAL26 GUNFIGHTER SECTION
-------------------------------------------------------------------------
		local mags = playerObj:getInventory():getAllTypeRecurse(gun:getMagazineType())
		local magazine = nil
		for i=1,mags:size() do
			local checkmag = mags:get(i-1)
			if checkmag and checkmag:getCurrentAmmoCount() > 0 then
				magazine = checkmag
			end
		end
		local	Clip = gun:getModData().ClipType
		local	Mag = gun:getModData().MagType
		local	Current = gun:getCurrentAmmoCount()
		local	Max = gun:getMaxAmmo()
-------------------------------------------------------------------------
-- [CLIP] Clip w/Ammo, CLIP MODE, MAG IN-GUN or INTEGRAL(1903, Revolver)
-------------------------------------------------------------------------
		if 	(magazine ~= nil) and (gun:getMagazineType() == Clip) and (gun:isContainsClip() or Mag == nil) then
--	DEBUG		playerObj:Say("Using Clip...")
			gun:setContainsClip(false)	-- REMOVE SO IT WILL LOAD NON-MAG WEAPONS LIKE REVOLVERS
			ISInventoryPaneContextMenu.transferIfNeeded(playerObj, magazine)
			ISTimedActionQueue.add(ISInsertMagazine:new(playerObj, gun, magazine))
			return
-------------------------------------------------------------------------
-- [STOP] Clip w/Ammo, CLIP MODE, NO MAG and REQUIRED (M14, VZ, SKS30)
-------------------------------------------------------------------------
		elseif	(magazine ~= nil) and (gun:getMagazineType()) == Clip and not gun:isContainsClip() and Mag ~= nil then
			playerObj:Say("No Magazine("..tostring(Current)..")")
		-- clip inside, pressing R will remove it, other wise we load another
-------------------------------------------------------------------------
-- [VANILLA] NOT CLIP MODE, MAG INSERTED and DOES NEED ONE (Normal Guns)
-------------------------------------------------------------------------
		elseif	(gun:isContainsClip()) and gun:getMagazineType() ~= Clip then	-- NOT EMPTY SO REMOVE THEN INSERT
			ISTimedActionQueue.add(ISEjectMagazine:new(playerObj, gun))
			if ISReloadWeaponAction.stopAfterEject() then
				return
			end
			-- insert a different non-empty magazine
			local mags = playerObj:getInventory():getAllTypeRecurse(gun:getMagazineType())
			for i=1,mags:size() do
				local magazine = mags:get(i-1)
				if magazine and magazine:getCurrentAmmoCount() > 0 then
					ISTimedActionQueue.add(ISInsertMagazine:new(playerObj, gun, magazine))
					return
				end
			end
			-- reload the ejected magazine and insert it
			ISTimedActionQueue.queueActions(playerObj, ISReloadWeaponAction.ReloadBestMagazine, gun)
			return
-------------------------------------------------------------------------
-- [CHANGE MAG-TYPE] CLIP MODE, NO Clips w/Ammo, MAG INSERTED or NOT REQUIRED (Single Load)
-------------------------------------------------------------------------
		elseif 	(gun:getMagazineType() == Clip) and (magazine == nil) and (gun:isContainsClip() or Mag == nil) then
			gun:setMagazineType(nil)
			playerObj:Say("Single Loading...")
	--		playerObj:setVariable("WeaponReloadType", "shotgun")
		end
-------------------------------------------------------------------------
-- [ALLOW INSERT EMPTY MAG]  NO MAG INSERTED AND NEEDS ONE, SO INSERT IF GOT MAG (EXCLUDE CLIP MODE)
-------------------------------------------------------------------------
		if 	gun:getMagazineType() and gun:getMagazineType() ~= Clip then
			local magazine = gun:getBestMagazine(playerObj)
			if magazine then
				ISInventoryPaneContextMenu.transferIfNeeded(playerObj, magazine)
				ISTimedActionQueue.add(ISInsertMagazine:new(playerObj, gun, magazine))
				return
			else	-- JUST USE EMPTY INCASE WEAPON CAN SINGLE LOAD
				local mags = playerObj:getInventory():getAllType(gun:getMagazineType())
				local magazine = nil
				for i=1,mags:size() do
					local checkmag = mags:get(i-1)
					if checkmag then
						magazine = checkmag
					end
				end
				if magazine then
					playerObj:Say("Inserting Empty Mag...")
					ISInventoryPaneContextMenu.transferIfNeeded(playerObj, magazine)
					ISTimedActionQueue.add(ISInsertMagazine:new(playerObj, gun, magazine))
					return
				end
			end
			-- check if we have an empty magazine for the current gun
			ISReloadWeaponAction.ReloadBestMagazine(playerObj, gun)
		end
-------------------------------------------------------------------------
--  NO MAG REQUIRED (MagazineType == nil)
-------------------------------------------------------------------------
	else
		-- if can't have more bullets, we don't do anything, this doesn't apply for magazine-type guns (you'll still remove the current clip)
		if gun:getCurrentAmmoCount() >= gun:getMaxAmmo() then
			return
		end
		-- can't load bullet into a jammed gun, clip works tho
		if gun:isJammed() then
			return
		end
		local ammoCount = ISInventoryPaneContextMenu.transferBullets(playerObj, gun:getAmmoType(), gun:getCurrentAmmoCount(), gun:getMaxAmmo())
		if ammoCount == 0 then
			return
		end
		ISTimedActionQueue.add(ISReloadWeaponAction:new(playerObj, gun))
	end
end

-- Called when pressing reload button when not already reloading, only called when you have an equipped weapon to reload (with available bullets or clip)
ISReloadWeaponAction.OnPressReloadButton = function(player, gun)
	if ISReloadWeaponAction.disableReloading then
		return;
	end
	-- If you press reloading while loading bullets, we stop and rack
	if player:getVariableBoolean("isLoading") then
		ISTimedActionQueue.clear(player);
		ISReloadWeaponAction.addRacking(player, gun);
	else
		-- See ISFirearmRadialMenu.onKeyReleased()
	end
-------------------------------------------------------------------------
-- REVERT BACK TO CLIP MODE SEEMS TO WORK HERE
-------------------------------------------------------------------------
	if gun:getMagazineType() == nil then
		local Mag = gun:getModData().MagType
		local Clip = gun:getModData().ClipType
		if 	canUseClip(gun) then
			if Clip ~= nil then
				local clips = player:getInventory():getAllTypeRecurse(Clip)
				for i=1,clips:size() do
					local gotclip = clips:get(i-1)
					if gotclip and gotclip:getCurrentAmmoCount() > 0 then
						player:Say("Use Clip")
						gun:setMagazineType(Clip)
					--	player:setVariable("WeaponReloadType", "boltaction")
					--	self:forceStop();
						return
					end
				end
			elseif Mag ~= nil then
				local mags = player:getInventory():getAllTypeRecurse(Mag)
				for i=1,mags:size() do
					local gotmag = mags:get(i-1)
					if gotmag and gotmag:getCurrentAmmoCount() > 0 then
						player:Say("Use Magazine")
						gun:setMagazineType(Mag)
					--	player:setVariable("WeaponReloadType", "boltaction")
					--	self:forceStop();
						return
					end
				end
			end
		end
	end
end

-- Called when pressing rack (if you rack while having a clip/bullets, we simply remove it and don't reload a new one)
ISReloadWeaponAction.OnPressRackButton = function(player, gun)
	if ISReloadWeaponAction.disableReloading then
		return;
	end
	if not ISReloadWeaponAction.canRack(gun) then
		return;
	end
	-- if you press rack while loading bullets, we stop and rack
	if player:getVariableBoolean("isLoading") and not gun:isRoundChambered() then
		ISTimedActionQueue.clear(player);
	end

--------------------------------------------------------------------------
--  CHANGE WeaponReloadType ANIMATION.... DONT WORK, TRY IN ONRACK	--
--------------------------------------------------------------------------
	local	Clip = gun:getModData().ClipType
	local	Mag = gun:getModData().MagType
	if gun:getMagazineType() == Clip then
		player:setVariable("WeaponReloadType", "boltactionnomag")
	end

	ISTimedActionQueue.add(ISRackFirearm:new(player, gun));
end

ISReloadWeaponAction.canShoot = function(weapon)
	if getDebug() and getDebugOptions():getBoolean("Cheat.Player.UnlimitedAmmo") then
		return true;
	end
	if weapon:isJammed() then
		return false;
	end
	if weapon:haveChamber() and not weapon:isRoundChambered() then
		return false;
	end
	if not weapon:haveChamber() and weapon:getCurrentAmmoCount() <= 0 then
		return false;
	end
	return true;
end

-- can we attack?
-- need a chambered round
ISReloadWeaponAction.attackHook = function(character, chargeDelta, weapon)
	ISTimedActionQueue.clear(character)
	if character:isAttackStarted() then return; end
	if instanceof(character, "IsoPlayer") and not character:isAuthorizeMeleeAction() then
		return;
	end
	if weapon:isRanged() and not character:isShoving() then
		if ISReloadWeaponAction.canShoot(weapon) and ISReloadWeaponAction.canFireSemi() then
			ISReloadWeaponAction.noLongerCanFire();
			character:playSound(weapon:getSwingSound());
			character:addWorldSoundUnlessInvisible(weapon:getSoundRadius(), weapon:getSoundVolume(), false);
			character:startMuzzleFlash()
			character:DoAttack(0);
		elseif ISReloadWeaponAction.canFireSemi() then
			ISReloadWeaponAction.noLongerCanFire();
			character:DoAttack(0);
			character:setRangedWeaponEmpty(true);
		end
	else
		ISTimedActionQueue.clear(character)
		if(chargeDelta == nil) then
			character:DoAttack(0);
		else
			character:DoAttack(chargeDelta);
		end
	end
end

-- shoot shoot bang bang
-- handle ammo removal, new chamber & jam chance
ISReloadWeaponAction.onShoot = function(player, weapon)
	if not weapon:isRanged() then return; end
	if getDebug() and getDebugOptions():getBoolean("Cheat.Player.UnlimitedAmmo") then
		return;
	end
	if weapon:haveChamber() then
		weapon:setRoundChambered(false);
	end
	if weapon:isRackAfterShoot() then
		-- shotgun need to be rack after each shot to rechamber round
		-- See ISReloadWeaponAction.OnPlayerAttackFinished()
		if weapon:haveChamber() then
			weapon:setSpentRoundChambered(true);
		end
	else
		-- automatic weapons eject the bullet cartridge
		if not weapon:isManuallyRemoveSpentRounds() then
			if weapon:getShellFallSound() then
				player:getEmitter():playSound(weapon:getShellFallSound())
			end
		end
		if weapon:getCurrentAmmoCount() >= weapon:getAmmoPerShoot() then
			-- remove ammo, add one to chamber if we still have some
			if weapon:haveChamber() then
				weapon:setRoundChambered(true);
			end
			weapon:setCurrentAmmoCount(weapon:getCurrentAmmoCount() - weapon:getAmmoPerShoot())
		end
	end
	if weapon:isManuallyRemoveSpentRounds() then
		weapon:setSpentRoundCount(weapon:getSpentRoundCount() + weapon:getAmmoPerShoot())
	end
	if weapon:getCondition() < weapon:getConditionMax() and weapon:getJamGunChance() > 0 and weapon:getCurrentAmmoCount() > 0 then
		local baseJamChance = weapon:getJamGunChance();
		if baseJamChance == 0 then
			return;
		end
		-- every condition loss increase the chance of jamming the gun
		baseJamChance = baseJamChance + ((weapon:getConditionMax() - weapon:getCondition()) / 4)
		if baseJamChance > 7 then
			baseJamChance = 7;
		end
		if ZombRand(100) < baseJamChance then
			weapon:setJammed(true);
		end
	end
end

ISReloadWeaponAction.OnPlayerAttackFinished = function(playerObj, weapon)
	if not playerObj or playerObj:isDead() then return end
	if getDebug() and getDebugOptions():getBoolean("Cheat.Player.UnlimitedAmmo") then
		return;
	end
	if weapon and weapon:isRanged() and weapon:isRackAfterShoot() then
		ISReloadWeaponAction.addRacking(playerObj, weapon);
	end
end

Events.OnPressReloadButton.Add(ISReloadWeaponAction.OnPressReloadButton);
Events.OnPressRackButton.Add(ISReloadWeaponAction.OnPressRackButton);
Events.OnWeaponSwingHitPoint.Add(ISReloadWeaponAction.onShoot);
Events.OnPlayerAttackFinished.Add(ISReloadWeaponAction.OnPlayerAttackFinished);
Hook.Attack.Add(ISReloadWeaponAction.attackHook);



---------------------------------- PREVENT INSERT FROM INVENTORY CONTEXT MENUS --------------------------------------
ISInventoryPaneContextMenu.onInsertMagazine = function(playerObj, weapon, magazine)
	local	Clip = weapon:getModData().ClipType
	local	Mag = weapon:getModData().MagType
	if 	Clip == nil or weapon:getMagazineType() ~= Clip then
		ISInventoryPaneContextMenu.transferIfNeeded(playerObj, magazine)
		ISInventoryPaneContextMenu.equipWeapon(weapon, true, false, playerObj:getPlayerNum())
		ISTimedActionQueue.add(ISInsertMagazine:new(playerObj, weapon, magazine));
	end
end

]]