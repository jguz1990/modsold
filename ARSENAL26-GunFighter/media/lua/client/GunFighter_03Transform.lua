--[[ 	[Apply_Effect] handles the effects of Bayonets and Suppressors since migrating to the Vanilla
	Attachment method. Nullifies Scope range bonus while in melee mode. Handles Suppressor Effectiveness
	OPTION, and applies junkfactor to make improvised suppressors LESS effective. Applies visual Magazine
	function by assigning "Clip" slot with appropriate magazine type.

	MOST TRANSFORM FUNCTIONS ARE OBSOLETE WITH HOTKEYS, BUT REMAIN JUST IN CASE.

	***** ARSENAL[26] *****
]]

------------------------------------------------------------------
--  [SWAP BARREL]	NEF, TC, etc				--
------------------------------------------------------------------
function Swap_Barrel(items, result, player)
	local Gun
	for i=0,items:size() - 1 do
		if (instanceof(items:get(i),"HandWeapon")) then
			Gun = items:get(i)
		end
	end

	local	oldBarrel = nil

	if	string.find(Gun:getType(), "308") then
		oldBarrel = InventoryItemFactory.CreateItem('Barrel_308');
	elseif	string.find(Gun:getType(), "3006") then
		oldBarrel = InventoryItemFactory.CreateItem('Barrel_3006');
	elseif	string.find(Gun:getType(), "4570") then
		oldBarrel = InventoryItemFactory.CreateItem('Barrel_4570');

	elseif	string.find(Gun:getType(), "45LC") or string.find(Gun:getType(), "410") then
		if string.find(Gun:getType(), "Sawed") then
			oldBarrel = InventoryItemFactory.CreateItem('Barrel_45LC_Short');
		else
			oldBarrel = InventoryItemFactory.CreateItem('Barrel_45LC');
		end
	elseif	string.find(Gun:getType(), "357") or string.find(Gun:getType(), "38") then
		if string.find(Gun:getType(), "Sawed") then
			oldBarrel = InventoryItemFactory.CreateItem('Barrel_357_Short');
		else
			oldBarrel = InventoryItemFactory.CreateItem('Barrel_357');
		end
	end

	if oldBarrel ~= nil then
		player:getInventory():AddItem(oldBarrel)	-- ADD OLD BARREL TO INVENTORY
	end

--	======= TRANSFER CONDITION & MODE ======
	result:setCondition(Gun:getCondition());
	result:setFireMode(Gun:getFireMode());

--	====== TRANSFER AMMO MAG & CHAMBER =====
	if Gun:isContainsClip() == true then
		result:setContainsClip(true);
	end

--	====== TRANSFER MAG-TYPE =====				*** INCASE ITS USING EXTENDED MAG OPTION ***
--		result:setMagazineType(Gun:getMagazineType());
--		result:setMaxAmmo(Gun:getMaxAmmo());

--	result:setCurrentAmmoCount(Gun:getCurrentAmmoCount());

	if Gun:isRoundChambered() == true then
		result:setRoundChambered(true);
	end

--	====== TRANSFER WEAPON ATTACHMENTS SO THEY DO NOT AFFECT MELEE VERSION
	if 	(result:isAimedFirearm() and Gun:isAimedFirearm()) then		-- [GUN to GUN] LEAVE THIS ALONE
		result:attachWeaponPart(Gun:getWeaponPart("Scope"))
		result:attachWeaponPart(Gun:getWeaponPart("Canon"))
		result:attachWeaponPart(Gun:getWeaponPart("Clip"))
		result:attachWeaponPart(Gun:getWeaponPart("Stock"))
		result:attachWeaponPart(Gun:getWeaponPart("Sling"))
		result:attachWeaponPart(Gun:getWeaponPart("RecoilPad"))
	end

--	if (instanceof(result,"HandWeapon")) and result:getMaxRange() > 0 then	-- REMOVE isAimedFirearm() for BAYO (Mele)
	if (instanceof(result,"HandWeapon")) then
		player:setPrimaryHandItem(result) 
		if(result:isRequiresEquippedBothHands() or result:isTwoHandWeapon()) then
			player:setSecondaryHandItem(result)
		else	player:setSecondaryHandItem(nil)
		end
	end
end

------------------------------------------------------------------
--  [IMPROVISED FLAME THROWER]					--
------------------------------------------------------------------
function Improvised_FlameThrower(items, result, player)
	for i=0,items:size() - 1 do
		if	(items:get(i):getDisplayCategory() == "GunClean") then
			Gun = items:get(i)
		elseif	(items:get(i):getDisplayName() == "Lighter") then
			DebugSay(3,"LIGHT ITEM FOUND")
			Light = items:get(i)
		end
	end

	if (Light) then					-- JUST SAVE TRANSFER CURRENT LIGHTER DELTA
		DebugSay(3,"LIGHT SAVE DELTA")		-- DISPOSABLE WEAPON WILL NOT USE LIGHTER CAPACITY
		local LightFill = Light:getUsedDelta()
		result:getModData().Trajectory = LightFill	-- USE EXISTING VARIABLE
	end

	if (Gun) then
		local fill = Gun:getUsedDelta() * 10
		result:setCurrentAmmoCount(fill)
	end
end

function Scrap_Improvised_FlameThrower(items, result, player)
	for i=0,items:size() - 1 do
		if	(instanceof(items:get(i),"HandWeapon")) then
			Gun = items:get(i)
		end
	end

	local RB = InventoryItemFactory.CreateItem('RubberBand')
	local LT = InventoryItemFactory.CreateItem('Lighter')
	local fill = Gun:getCurrentAmmoCount()/10

	result:setUsedDelta(fill)				-- WD CAN

	if (Gun:getModData().Trajectory ~= nil) then		-- USE EXISTING VARIABLE
		DebugSay(3,"LIGHT SET DELTA")
		LT:setUsedDelta(Gun:getModData().Trajectory)	-- LIGHTER
	end

	player:getInventory():AddItem(LT)
	player:getInventory():AddItem(RB)
end

------------------------------------------------------------------
--  [DON & DOFF M2A1 FUEL TANK]					--
------------------------------------------------------------------
function DOFF_M2A1_Tank(items, result, player)
	local tank
	for i=0,items:size() - 1 do
		tank = items:get(i)
	end
	local	back	= player:getClothingItem_Back()
	if (back) then
		player:setWornItem(back:canBeEquipped(), nil)
		result:setCurrentAmmoCount(tank:getCurrentAmmoCount());
	end
end
function DON_M2A1_Tank(items, result, player)
	local tank
	for i=0,items:size() - 1 do
		tank = items:get(i)
	end
	local	back	= InventoryItemFactory.CreateItem('Bag_M2A1')
	player:setWornItem(back:canBeEquipped(), back)
	result:setCurrentAmmoCount(tank:getCurrentAmmoCount());
end

function DOFF_M2A1_Tank_Test(item)
	local	player	= getSpecificPlayer(0)
	local	back	= player:getClothingItem_Back()
	if	(back) and (back:getType() == "Bag_M2A1") then
		return true
	else	return false
	end
end
function DON_M2A1_Tank_Test(item)
	local	player	= getSpecificPlayer(0)
	local	back	= player:getClothingItem_Back()
	if	((back) and (back:getType() ~= "Bag_M2A1")) or (back == nil) then
		return true
	else	return false
	end
end

------------------------------------------------------------------
--  [FILL WATERGUN]						--
------------------------------------------------------------------
function Fill_LiquidAmmo(items, result, player)
	local	Gun
	local	Fill
	local	Rate = 0

	for i=0,items:size() - 1 do
		if	(instanceof(items:get(i),"HandWeapon")) or (items:get(i):getDisplayCategory() == "GunMag") then
			Gun = items:get(i)
		else	Fill = items:get(i)
		end
	end

	if	string.find(Fill:getType(), "Propane") then
		Rate = 10
	elseif	string.find(Fill:getType(), "Water") then
		Rate = 1
	end

	if (instanceof(result,"HandWeapon")) then
	--	======= TRANSFER CONDITION & MODE ======
		result:setCondition(Gun:getCondition());
		if	Gun:isRoundChambered() == true then
			result:setRoundChambered(true);
		end
	end

	result:setCurrentAmmoCount(Gun:getCurrentAmmoCount() + Rate);
	if result:getCurrentAmmoCount() > result:getMaxAmmo() then
		result:setCurrentAmmoCount(result:getMaxAmmo())
		if	Rate == 10 then
			Sound = player:getEmitter():playSound("OverFill")
		elseif	Rate == 1 then
			Sound = player:getEmitter():playSound("waterSplash")
		end
	end

	if (instanceof(result,"HandWeapon")) then	-- REMOVE isAimedFirearm() for BAYO (Mele)
		player:setPrimaryHandItem(result) 
		if(result:isRequiresEquippedBothHands() or result:isTwoHandWeapon()) then
			player:setSecondaryHandItem(result)
		else	player:setSecondaryHandItem(nil)
		end
	end
end

------------------------------------------------------------------
--  [MELEE MODE] GENERIC FOR ANY FIREARM			--
------------------------------------------------------------------
function Universal_Melee(items, result, player)
	local Gun
	for i=0,items:size() - 1 do
		if (instanceof(items:get(i),"HandWeapon")) then
			Gun = items:get(i)
		end
	end

--	======= TRANSFER CONDITION & MODE ======
	result:setCondition(Gun:getCondition());
	result:setFireMode(Gun:getFireMode());

--	====== TRANSFER AMMO MAG & CHAMBER =====
	if	Gun:isContainsClip() == true then
		result:setContainsClip(true);
	end

--	====== TRANSFER MAG-TYPE =====
	if	Gun:getMagazineType() == nil and Gun:getModData().ClipType ~= nil then
		result:setMagazineType(Gun:getModData().ClipType);
	elseif	result:getMagazineType() == Fixed then			-- FIXED MAG GUNS... SEEMS BACKWARDS ???
		player:Say("...")
	elseif	Gun:getMagazineType() ~= Fixed then			-- MAG FED GUNS
		result:setMagazineType(Gun:getMagazineType());
	end

	result:setMaxAmmo(Gun:getMaxAmmo());

	result:setCurrentAmmoCount(Gun:getCurrentAmmoCount());

	if	Gun:isRoundChambered() == true then
		result:setRoundChambered(true);
	end

--	====== TRANSFER WEAPON ATTACHMENTS SO THEY DO NOT AFFECT MELEE VERSION
	if 	(result:isAimedFirearm() and Gun:isAimedFirearm()) then		-- [GUN to GUN] LEAVE THIS ALONE
		result:attachWeaponPart(Gun:getWeaponPart("Scope"))
		result:attachWeaponPart(Gun:getWeaponPart("Canon"))
		result:attachWeaponPart(Gun:getWeaponPart("Clip"))
		result:attachWeaponPart(Gun:getWeaponPart("Stock"))
		result:attachWeaponPart(Gun:getWeaponPart("Sling"))
		result:attachWeaponPart(Gun:getWeaponPart("RecoilPad"))
	end

	local scriptItem = result:getScriptItem()
--	local maxDmg	= scriptItem:getMaxDamage()
--	local minDmg	= scriptItem:getMinDamage()
	local maxRange	= scriptItem:getMaxRange()	-- USE NON-MODIFIED ONLY WHEN MELEE
	local maxDmg	= result:getMaxDamage()		-- USE MODIFIED DAMAGE
	local minDmg	= result:getMinDamage()		-- USE MODIFIED DAMAGE
	local crit	= result:getCriticalChance()
	local impact	= result:getImpactSound()
	local canon	= result:getCanon()
	local scope	= result:getScope()
	local bayo	= 0

	if result:isAimedHandWeapon() then	-- DONT DO THIS GOING TO GUN MODE
		if canon then
			if string.find(canon:getType(), "Bayonet") then
				maxDmg	= 1.8
				minDmg	= 1.4
				crit	= 10
				bayo	= 0.4
				impact	= BladeHit
			end
		end
	--	if scope then
		local meleeRange = maxRange + bayo
		result:setMaxRange(meleeRange)
	--	end
	end

	if (instanceof(result,"HandWeapon")) then	-- REMOVE isAimedFirearm() for BAYO (Mele)
		player:setPrimaryHandItem(result) 
		if(result:isRequiresEquippedBothHands() or result:isTwoHandWeapon()) then
			player:setSecondaryHandItem(result)
		else	player:setSecondaryHandItem(nil)
		end
	end

	result:setMaxDamage(maxDmg)
	result:setMinDamage(minDmg)
	result:setCriticalChance(crit)
	result:setImpactSound(impact)
end

------------------------------------------------------------------
--  [MELEE_TEST] MAKE SURE THERE IS BAYONET ATTACHED		--
------------------------------------------------------------------
function Melee_Test(item)
	local canon = item:getCanon()
	if canon then
		if string.find(canon:getType(), "Bayonet") then
			return true
		else	return false
		end
	else	return true
	end
end


------------------------------------------------------------------
--  [INTEGRAL_BAYONET] USE WITH INTEGRAL FOLDING BAYONET ONLY	--
------------------------------------------------------------------
function Integral_Bayonet(items, result, player, action)
	local Gun
	for i=0,items:size() - 1 do
		if (instanceof(items:get(i),"HandWeapon")) then
			Gun = items:get(i)
		end
	end

--	======= TRANSFER CONDITION & MODE ======
	result:setCondition(Gun:getCondition());
	result:setFireMode(Gun:getFireMode());

--	====== TRANSFER AMMO MAG & CHAMBER =====
	if 	(Gun:isContainsClip() == true) then
		result:setContainsClip(true);
	end

--	====== TRANSFER MAG-TYPE =====				*** INCASE ITS USING EXTENDED MAG OPTION ***
		result:setMagazineType(Gun:getMagazineType());
		result:setMaxAmmo(Gun:getMaxAmmo());

	if Gun:isRoundChambered() == true then
		result:setRoundChambered(true);
	end
	result:setCurrentAmmoCount(Gun:getCurrentAmmoCount());

--	====== TRANSFER WEAPON ATTACHMENTS SO THEY DO NOT AFFECT MELEE VERSION
	if 	(result:isAimedFirearm() and Gun:isAimedFirearm()) then		-- [GUN to GUN] LEAVE THIS ALONE
		result:attachWeaponPart(Gun:getWeaponPart("Scope"))
		result:attachWeaponPart(Gun:getWeaponPart("Canon"))
		result:attachWeaponPart(Gun:getWeaponPart("Clip"))
		result:attachWeaponPart(Gun:getWeaponPart("Stock"))
		result:attachWeaponPart(Gun:getWeaponPart("Sling"))
		result:attachWeaponPart(Gun:getWeaponPart("RecoilPad"))
	end

	if result:isAimedHandWeapon() then
		local scriptItem = result:getScriptItem()
		local maxRange	= scriptItem:getMaxRange()	-- USE NON-MODIFIED ONLY WHEN MELEE
		result:setMaxRange(maxRange)
	end

	if (instanceof(result,"HandWeapon")) then	-- REMOVE isAimedFirearm() for BAYO (Mele)
		player:setPrimaryHandItem(result) 
		if(result:isRequiresEquippedBothHands() or result:isTwoHandWeapon()) then
			player:setSecondaryHandItem(result)
		else	player:setSecondaryHandItem(nil)
		end
	end
end

------------------------------------------------------------------
--  [BAYONET_TEST] MAKE SURE THERE IS NO SUPPRESSOR BLOCKING	--
------------------------------------------------------------------
function Bayonet_Test(item)
	local canon = item:getCanon()
	if canon then
		if string.find(canon:getType(), "Suppressor") then
			return false
		else	return true
		end
	else	return true
	end
end


------------------------------------------------------------------
--  [UNIVERSAL_STOCK] FOR SIMPLE TRANSFORMATION	(Stocks)	--
------------------------------------------------------------------
function Universal_Stock(items, result, player)
	local Gun
	for i=0,items:size() - 1 do
		if (instanceof(items:get(i),"HandWeapon")) then
			Gun = items:get(i)
		end
	end

--	======= TRANSFER CONDITION & MODE ======
	result:setCondition(Gun:getCondition());
	result:setFireMode(Gun:getFireMode());

--	====== TRANSFER AMMO MAG & CHAMBER =====
	if Gun:isContainsClip() == true then
		result:setContainsClip(true);
	end

--	====== TRANSFER MAG-TYPE =====				*** INCASE ITS USING EXTENDED MAG OPTION ***
		result:setMagazineType(Gun:getMagazineType());
		result:setMaxAmmo(Gun:getMaxAmmo());

	result:setCurrentAmmoCount(Gun:getCurrentAmmoCount());

	if Gun:isRoundChambered() == true then
		result:setRoundChambered(true);
	end

--	====== TRANSFER WEAPON ATTACHMENTS SO THEY DO NOT AFFECT MELEE VERSION
	if 	(result:isAimedFirearm() and Gun:isAimedFirearm()) then		-- [GUN to GUN] LEAVE THIS ALONE
		result:attachWeaponPart(Gun:getWeaponPart("Scope"))
		result:attachWeaponPart(Gun:getWeaponPart("Canon"))
		result:attachWeaponPart(Gun:getWeaponPart("Clip"))
		result:attachWeaponPart(Gun:getWeaponPart("Stock"))
		result:attachWeaponPart(Gun:getWeaponPart("Sling"))
		result:attachWeaponPart(Gun:getWeaponPart("RecoilPad"))
	end

--	if (instanceof(result,"HandWeapon")) and result:getMaxRange() > 0 then	-- REMOVE isAimedFirearm() for BAYO (Mele)
	if (instanceof(result,"HandWeapon")) then
		player:setPrimaryHandItem(result) 
		if(result:isRequiresEquippedBothHands() or result:isTwoHandWeapon()) then
			player:setSecondaryHandItem(result)
		else	player:setSecondaryHandItem(nil)
		end
	end
end


------------------------------------------------------------------
--  [UNIVERSAL_SAW-OFF] FOR SHOTGUN TRANSFORMATION		--
------------------------------------------------------------------
function Universal_Sawoff(items, result, player)
	local Gun
	for i=0,items:size() - 1 do
		if (instanceof(items:get(i),"HandWeapon")) then
			Gun = items:get(i)
		end
	end

--	======= TRANSFER CONDITION & MODE ======
	result:setCondition(Gun:getCondition());
	result:setFireMode(Gun:getFireMode());

--	====== TRANSFER AMMO MAG & CHAMBER =====
	if Gun:isContainsClip() == true then
		result:setContainsClip(true);
	end

--	====== TRANSFER MAG-TYPE =====				*** INCASE ITS USING EXTENDED MAG OPTION ***
		result:setMagazineType(Gun:getMagazineType());
		result:setMaxAmmo(Gun:getMaxAmmo());

	result:setCurrentAmmoCount(Gun:getCurrentAmmoCount());

	if Gun:isRoundChambered() == true then
		result:setRoundChambered(true);
	end

--	====== TRANSFER WEAPON ATTACHMENTS SO THEY DO NOT AFFECT MELEE VERSION
	if 	(result:isAimedFirearm() and Gun:isAimedFirearm()) then		-- [GUN to GUN] LEAVE THIS ALONE
		result:attachWeaponPart(Gun:getWeaponPart("Scope"))
		result:attachWeaponPart(Gun:getWeaponPart("Canon"))
		result:attachWeaponPart(Gun:getWeaponPart("Clip"))
		result:attachWeaponPart(Gun:getWeaponPart("Stock"))
		result:attachWeaponPart(Gun:getWeaponPart("Sling"))
		result:attachWeaponPart(Gun:getWeaponPart("RecoilPad"))
	end

	local canon	= Gun:getCanon()
	local recoil	= Gun:getRecoilpad()
	local sling	= Gun:getSling()

	if	string.find(result:getType(), "Pistol") then		-- NO XFER CANON, SLING, RECOIL
--		if canon then
--			result:detachWeaponPart(canon)
--			player:getInventory():AddItem(canon)		-- ADD REPLACED MAG TO INVENTORY
--			DebugSay(3,"Muzzle attachment removed...")
--		end
		if sling then
			result:detachWeaponPart(sling)
			player:getInventory():AddItem(sling)		-- ADD REPLACED MAG TO INVENTORY
			DebugSay(3,"Sling attachment removed...")
		end
		if recoil then
			result:detachWeaponPart(recoil)
			player:getInventory():AddItem(recoil)		-- ADD REPLACED MAG TO INVENTORY
			DebugSay(3,"Recoil attachment removed...")
		end
--	elseif	string.find(result:getType(), "Sawed") then			-- NO XFER CANON
--		if canon then
--			result:detachWeaponPart(canon)
--			player:getInventory():AddItem(canon)		-- ADD REPLACED MAG TO INVENTORY
--			DebugSay(3,"Muzzle attachment removed...")
--		end	
	end

--	if (instanceof(result,"HandWeapon")) and result:getMaxRange() > 0 then	-- REMOVE isAimedFirearm() for BAYO (Mele)
	if (instanceof(result,"HandWeapon")) then
		player:setPrimaryHandItem(result) 
		if(result:isRequiresEquippedBothHands() or result:isTwoHandWeapon()) then
			player:setSecondaryHandItem(result)
		else	player:setSecondaryHandItem(nil)
		end
	end
end


------------------------------------------------------------------
--  [FIXED_MAGTYPE] INSTALLS FIXED OR DETACHABLE MAG FOR SKS	--
------------------------------------------------------------------
function Fixed_MagType(items, result, player)
	local Gun
	local NewMag
	for i=0,items:size() - 1 do
	--	if (instanceof(items:get(i),"HandWeapon")) and ((items:get(i):getMagazineType() ~= nil) or (items:get(i):getModData().FixedMagType ~= nil)) then
		if (instanceof(items:get(i),"HandWeapon")) then
			Gun = items:get(i)

	--	elseif (items:get(i):getDisplayCategory() == "GunMag") or (items:get(i):getDisplayCategory() == "FixedMag") then
		elseif isMagazine(items:get(i)) then
			NewMag = items:get(i)
		end
	end

--	======= TRANSFER CONDITION & MODE ======
	result:setCondition(Gun:getCondition());
	result:setFireMode(Gun:getFireMode());

--	====== TRANSFER AMMO MAG & CHAMBER =====
	if	Gun:getModData().FixedMagType and Gun:isContainsClip() == true then	-- DONT GIVE BACK IF INSTALLING FIXEDMAG
		local FixedMag
		local AmmoType = Gun:getAmmoType()
		local FixedMagAmmo = Gun:getCurrentAmmoCount()
		FixedMag = player:getInventory():AddItem(Gun:getModData().FixedMagType)	-- ADD REPLACE FIXED MAG TO INVENTORY
		FixedMag:setCurrentAmmoCount(FixedMagAmmo)					-- FILL IT
--		for i=1, FixedMagAmmo do
--			player:getInventory():AddItem(AmmoType)					-- ADD LOOSE ROUNDS (too many)... WTF ??
--		end
	elseif	Gun:isContainsClip() == true then
		local OldMag
		local OldMagAmmo = Gun:getCurrentAmmoCount()

		local	Clip = Gun:getModData().ClipType					-- DONT GIVE CLIP WITH 30 ROUNDS BACK!!!!
		local	Mag = Gun:getModData().MagType
		if (Gun:getMagazineType() == Clip or Gun:getMagazineType() == nil) and Mag then	-- IN CASE SINGLE LOAD MODE
			Gun:setMagazineType(Mag)
		end
		OldMag = player:getInventory():AddItem(Gun:getMagazineType())			-- ADD REPLACED MAG TO INVENTORY
		OldMag:setCurrentAmmoCount(OldMagAmmo)						-- FILL IT

	end

	if Gun:isRoundChambered() == true then
		result:setRoundChambered(true)
	end
	if result:getMagazineType() ~= nil then
		result:setContainsClip(true);					-- THIS IS THE NEW MAG TYPE
	end
	result:setCurrentAmmoCount(NewMag:getCurrentAmmoCount());

--	====== TRANSFER WEAPON ATTACHMENTS ======
	result:attachWeaponPart(Gun:getWeaponPart("Scope"))
	result:attachWeaponPart(Gun:getWeaponPart("Canon"))

--	local	Ext = Gun:getModData().ExtMagType
--	if NewMag:getMaxAmmo() > Gun:getMaxAmmo() then				-- getType DIDNT WORK FOR SOME REASON
--		MagPart = InventoryItemFactory.CreateItem('Extended_Mag');
--		if MagPart then
--			result:attachWeaponPart(MagPart)			-- OTHERWISE WILL BE BLANK FROM NEW RECIPE GUN
--			result:setMaxAmmo(NewMag:getMaxAmmo())
--			result:setMagazineType(Ext)
--		end
--	end
--	result:attachWeaponPart(Gun:getWeaponPart("Clip"))
	result:attachWeaponPart(Gun:getWeaponPart("Stock"))
	result:attachWeaponPart(Gun:getWeaponPart("Sling"))
	result:attachWeaponPart(Gun:getWeaponPart("RecoilPad"))

	if (instanceof(result,"HandWeapon")) then	-- REMOVE isAimedFirearm() for BAYO (Mele)
		player:setPrimaryHandItem(result) 
		if(result:isRequiresEquippedBothHands() or result:isTwoHandWeapon()) then
			player:setSecondaryHandItem(result)
		else	player:setSecondaryHandItem(nil)
		end
	end
end

------------------------------------------------------------------
--  [EXTENDED_MAGTYPE] HANDLES MAG TYPE SWITCH 			--
------------------------------------------------------------------
function Extended_MagType(items, result, player)
	local Gun
	for i=0,items:size() - 1 do
		if (instanceof(items:get(i),"HandWeapon")) then
			Gun = items:get(i)
		end
	end

--	======= TRANSFER CONDITION & MODE ======
	result:setCondition(Gun:getCondition());
	result:setFireMode(Gun:getFireMode());

--	====== TRANSFER AMMO MAG & CHAMBER =====
	if	Gun:getModData().FixedMagType and Gun:isContainsClip() == true then	-- DONT GIVE BACK IF INSTALLING FIXEDMAG
		local FixedMag
		local AmmoType = Gun:getAmmoType()
		local FixedMagAmmo = Gun:getCurrentAmmoCount()
		FixedMag = player:getInventory():AddItem(Gun:getModData().FixedMagType)	-- ADD REPLACE FIXED MAG TO INVENTORY
		FixedMag:setCurrentAmmoCount(FixedMagAmmo)					-- FILL IT

	elseif	Gun:isContainsClip() == true then
		local OldMag
		local OldMagAmmo = Gun:getCurrentAmmoCount()

		local	Clip = Gun:getModData().ClipType					-- DONT GIVE CLIP WITH 30 ROUNDS BACK!!!!
		local	Mag = Gun:getModData().MagType
		if Gun:getMagazineType() == Clip and Mag then
			Gun:setMagazineType(Mag)
		end
		OldMag = player:getInventory():AddItem(Gun:getMagazineType())			-- ADD REPLACED MAG TO INVENTORY
		OldMag:setCurrentAmmoCount(OldMagAmmo)						-- FILL IT
	end

	if Gun:isRoundChambered() == true then
		result:setRoundChambered(true)
	end

--	==== TESTING AUTO INSERT MAG SECTION ====
--	local NewMag = player:getInventory():FindAndReturn(Gun:getModData().ExtMagType)

--	if result:getMagazineType() ~= nil then							-- DO NOT AUTO INSERT NEW MAG
--		result:setContainsClip(true);							-- THIS IS THE NEW MAG TYPE
--	end
--	result:setCurrentAmmoCount(NewMag:getCurrentAmmoCount());



--	====== TRANSFER WEAPON ATTACHMENTS ======
	result:attachWeaponPart(Gun:getWeaponPart("Scope"))
	result:attachWeaponPart(Gun:getWeaponPart("Canon"))

	local	Ext = Gun:getModData().ExtMagType
	if Ext ~= Gun:getMagazineType() then
		MagPart = InventoryItemFactory.CreateItem('Extended_Mag');
		if MagPart then
			result:attachWeaponPart(MagPart)			-- OTHERWISE WILL BE BLANK FROM NEW RECIPE GUN
--			result:setMaxAmmo(NewMag:getMaxAmmo())
			result:setMagazineType(Ext)
		end
	end
--	result:attachWeaponPart(Gun:getWeaponPart("Clip"))
	result:attachWeaponPart(Gun:getWeaponPart("Stock"))
	result:attachWeaponPart(Gun:getWeaponPart("Sling"))
	result:attachWeaponPart(Gun:getWeaponPart("RecoilPad"))

	if (instanceof(result,"HandWeapon")) then	-- REMOVE isAimedFirearm() for BAYO (Mele)
		player:setPrimaryHandItem(result) 
		if(result:isRequiresEquippedBothHands() or result:isTwoHandWeapon()) then
			player:setSecondaryHandItem(result)
		else	player:setSecondaryHandItem(nil)
		end
	end
end

------------------------------------------------------------------
--  [DRUM_MAGTYPE] HANDLES MAG TYPE SWITCH 			--
------------------------------------------------------------------
function Drum_MagType(items, result, player)
	local Gun
	for i=0,items:size() - 1 do
		if (instanceof(items:get(i),"HandWeapon")) then
			Gun = items:get(i)
		end
	end

--	======= TRANSFER CONDITION & MODE ======
	result:setCondition(Gun:getCondition());
	result:setFireMode(Gun:getFireMode());

--	====== TRANSFER AMMO MAG & CHAMBER =====
	if	Gun:getModData().FixedMagType and Gun:isContainsClip() == true then	-- DONT GIVE BACK IF INSTALLING FIXEDMAG
		local FixedMag
		local AmmoType = Gun:getAmmoType()
		local FixedMagAmmo = Gun:getCurrentAmmoCount()
		FixedMag = player:getInventory():AddItem(Gun:getModData().FixedMagType)	-- ADD REPLACE FIXED MAG TO INVENTORY
		FixedMag:setCurrentAmmoCount(FixedMagAmmo)					-- FILL IT

	elseif	Gun:isContainsClip() == true then
		local OldMag
		local OldMagAmmo = Gun:getCurrentAmmoCount()

		local	Clip = Gun:getModData().ClipType					-- DONT GIVE CLIP WITH 30 ROUNDS BACK!!!!
		local	Mag = Gun:getModData().MagType
		if (Gun:getMagazineType() == Clip or Gun:getMagazineType() == nil) and Mag then	-- IN CASE SINGLE LOAD MODE
	--	if Gun:getMagazineType() == Clip and Mag then
			Gun:setMagazineType(Mag)
		end
		OldMag = player:getInventory():AddItem(Gun:getMagazineType())			-- ADD REPLACED MAG TO INVENTORY
		OldMag:setCurrentAmmoCount(OldMagAmmo)						-- FILL IT
	end

	if Gun:isRoundChambered() == true then
		result:setRoundChambered(true)
	end

--	==== TESTING AUTO INSERT MAG SECTION ====
--	local NewMag = player:getInventory():FindAndReturn(Gun:getModData().DrumMagType)

--	if result:getMagazineType() ~= nil then							-- DO NOT AUTO INSERT NEW MAG
--		result:setContainsClip(true);							-- THIS IS THE NEW MAG TYPE
--	end
--	result:setCurrentAmmoCount(NewMag:getCurrentAmmoCount());



--	====== TRANSFER WEAPON ATTACHMENTS ======
	result:attachWeaponPart(Gun:getWeaponPart("Scope"))
	result:attachWeaponPart(Gun:getWeaponPart("Canon"))

	local	Drum = Gun:getModData().DrumMagType
	if Drum ~= Gun:getMagazineType() then
		MagPart = InventoryItemFactory.CreateItem('Drum_Mag');
		if MagPart then
			result:attachWeaponPart(MagPart)			-- OTHERWISE WILL BE BLANK FROM NEW RECIPE GUN
--			result:setMaxAmmo(NewMag:getMaxAmmo())
--			result:setMagazineType(result:getModData().DrumMagType)
		end
	end
--	result:attachWeaponPart(Gun:getWeaponPart("Clip"))
	result:attachWeaponPart(Gun:getWeaponPart("Stock"))
	result:attachWeaponPart(Gun:getWeaponPart("Sling"))
	result:attachWeaponPart(Gun:getWeaponPart("RecoilPad"))

	if (instanceof(result,"HandWeapon")) then	-- REMOVE isAimedFirearm() for BAYO (Mele)
		player:setPrimaryHandItem(result) 
		if(result:isRequiresEquippedBothHands() or result:isTwoHandWeapon()) then
			player:setSecondaryHandItem(result)
		else	player:setSecondaryHandItem(nil)
		end
	end
end

function Use_Drum_Test(item, player)
	if item:getSubCategory() == "Firearm" then
		local Drum = item:getModData().DrumMagType
		if Drum == nil then
			return false
		elseif item:getMagazineType() == Drum then	-- ALREADY USING EXT MAG
			return false
		elseif Drum ~= nil and not getSpecificPlayer(0):getInventory():contains(Drum) then	-- MAG NOT IN INVENTORY
			return false
		else	return true
		end
	end
end

function Use_Extended_Test(item, player)
	if item:getSubCategory() == "Firearm" then
		local Ext = item:getModData().ExtMagType
		if Ext == nil then
			return false
		elseif item:getMagazineType() == Ext then	-- ALREADY USING EXT MAG
			return false
		elseif Ext ~= nil and not getSpecificPlayer(0):getInventory():contains(Ext) then	-- MAG NOT IN INVENTORY
			return false
		else	return true
		end
	end
end

function Rem_Extended_Test(item, player)			-- DONT REQUIRE IN INVENTORY CAN ALWAYS SWITCH TO STANDARD
	if item:getSubCategory() == "Firearm" then
		local	Ext = item:getModData().ExtMagType
		local	Drum = item:getModData().DrumMagType
		if 	Ext ~= nil and item:getMagazineType() == Ext then	-- IS USING EXT MAG TYPE
			return true
		else	return false
		end
	end
end

function Rem_Drum_Test(item, player)				-- DONT REQUIRE IN INVENTORY CAN ALWAYS SWITCH TO STANDARD
	if item:getSubCategory() == "Firearm" then
		local	Drum = item:getModData().DrumMagType
		if	Drum ~= nil and item:getMagazineType() == Drum then	-- IS USING EXT MAG TYPE
			return true
		else	return false
		end
	end
end

------------------------------------------------------------------
--  Install Extended MagBase TEST (REPLACE WITH EMPTYMAG_TEST)	--
------------------------------------------------------------------
function MagBase_Test(item)
	if item:getCurrentAmmoCount() == 0 then
		return true
	else	return false
	end
end

------------------------------------------------------------------
--  Use AmmoCan on Minigun (Must be Empty)			--
------------------------------------------------------------------
function EmptyMag_Test(item)
	if item:getCurrentAmmoCount() == 0 then
		return true
	else	return false
	end
end

function EmptyCan_Test(item)
	local Can = nil
	local Contents = nil
	if instanceof(item,"InventoryContainer") then
		Can = item
		Contents = Can:getInventory()
		DebugSay(3,"CAN DEFINED")
	end

	if 	(Contents) and (Contents:getItems():size() ~= 0) then
		DebugSay(3,"Not Empty")
		return false
	else	DebugSay(3,"Empty")
		return true
	end
end

------------------------------------------------------------------
--  [TOGGLE_STRIPPERCLIP] SWITCH TO ALTERNATE LOADING METHOD	--
------------------------------------------------------------------
function Toggle_StripperClip(items, result, player)		-- FOR M14, VZ58, SKS30
	local Gun
	for i=0,items:size() - 1 do
		if (instanceof(items:get(i),"HandWeapon")) then
			Gun = items:get(i)
		end
	end

--	======= TOGGLE MAGAZINE TYPE ======
	if	Gun:isContainsClip() == true and (Gun:getMagazineType() == Gun:getModData().MagType or Gun:getMagazineType() == nil) then
		result:setMagazineType(Gun:getModData().ClipType)
		DebugSay(2,"Clip Mode...")
	--	result:setContainsClip(false)		-- PREVENT EJECTING STRIPPER CLIP... LOST MAG WHEN USE BAYO
	elseif	Gun:getMagazineType() == Gun:getModData().ClipType then
		result:setMagazineType(Gun:getModData().MagType)
		DebugSay(2,"Mag Mode...")
	--	result:setContainsClip(true)
	elseif	Gun:getMagazineType() == Gun:getModData().DrumMagType then
		DebugSay(2,"Cannot Alternate Load w/Drum...")
	else 	DebugSay(2,"Require Magazine")
	end

--	======= TRANSFER CONDITION & MODE ======
	result:setCondition(Gun:getCondition());
	result:setFireMode(Gun:getFireMode());

--	====== TRANSFER AMMO MAG & CHAMBER =====		-- JUST GIVE CLIP ALWAYS... DONT EJECT STRIPPER!!!
	if Gun:isContainsClip() == true then
		result:setContainsClip(true);
	end

	result:setCurrentAmmoCount(Gun:getCurrentAmmoCount());

	if Gun:isRoundChambered() == true then
		result:setRoundChambered(true);
	end

--	====== TRANSFER WEAPON ATTACHMENTS
	result:attachWeaponPart(Gun:getWeaponPart("Scope"))
	result:attachWeaponPart(Gun:getWeaponPart("Canon"))
	result:attachWeaponPart(Gun:getWeaponPart("Clip"))
	result:attachWeaponPart(Gun:getWeaponPart("Stock"))
	result:attachWeaponPart(Gun:getWeaponPart("Sling"))
	result:attachWeaponPart(Gun:getWeaponPart("RecoilPad"))

	if (instanceof(result,"HandWeapon")) then
		player:setPrimaryHandItem(result) 
		if(result:isRequiresEquippedBothHands() or result:isTwoHandWeapon()) then
			player:setSecondaryHandItem(result)
		else	player:setSecondaryHandItem(nil)
		end
	end
end


------------------------------------------------------------------
--  [UNIVERSAL_LAUNCHER] SWITCH PRIMARY & LAUNCHER MODES	--
------------------------------------------------------------------
function Universal_Launcher(items, result, player)
	local Gun
	for i=0,items:size() - 1 do
		if (instanceof(items:get(i),"HandWeapon")) then
			Gun = items:get(i)
		end
	end

--	======= TRANSFER CONDITION & MODE & CERTAIN ATTACHMENTS THAT SHARE BENEFIT ======
	result:setCondition(Gun:getCondition());

	result:attachWeaponPart(Gun:getWeaponPart("Canon"))		-- TEST NEW SYSTEM
	result:attachWeaponPart(Gun:getWeaponPart("Scope"))		-- TEST NEW SYSTEM
	result:attachWeaponPart(Gun:getWeaponPart("Stock"))		-- UNCOMMENT BELOW TO IGNORE 
	result:attachWeaponPart(Gun:getWeaponPart("Sling"))
	result:attachWeaponPart(Gun:getWeaponPart("Clip"))
	result:attachWeaponPart(Gun:getWeaponPart("RecoilPad"))


--	====== TRANSFER MOST WEAPON BECAUSE ITS A WHOLE DIFFERENT FIREARM WITH ITS OWN AMMO

-- 	[LAUNCHER to LAUNCHER] SAVE ATTACHMENT TO ModData.TempXXX
	if 	(Gun:isAimedFirearm() and isLauncher(Gun) and isLauncher(result)) then
		-- AMMO TYPE DATA
		result:getModData().TempFireMode		= (Gun:getModData().TempFireMode)	-- M203 TRANSFER TEMP for M16 SwitchBack
		result:getModData().TempContainsClip		= (Gun:getModData().TempContainsClip)	
		result:getModData().TempRoundChambered		= (Gun:getModData().TempRoundChambered)	
		result:getModData().TempCurrentAmmoCount	= (Gun:getModData().TempCurrentAmmoCount)	

		result:setFireMode(Gun:getFireMode())						-- M203 SET its own FROM other M203

		if Gun:isContainsClip() == true then						-- NEED FOR K11
			result:setContainsClip(true);
		end

		local Remove = Gun:getCurrentAmmoCount()					-- NOT TEMP... ACTUAL COUNT OF GUN GOING IN

		if Gun:getCurrentAmmoCount() > 0 then
			if	result:getAmmoType() == "Base.40INCRound" then			-- USE AMMOTYPE INSTEAD
				for i=1, Remove do
					player:getInventory():AddItem("Base.40HERound")		-- REMOVE HE, ADD TO INVENTORY
				end
				DebugSay(2,"Removing 40HE-Round")
			else	for i=1, Remove do
					player:getInventory():AddItem("Base.40INCRound")	-- REMOVE INC, ADD TO INVENTORY
				end
				DebugSay(2,"Removing 40INC-Round")
			end
			result:setCurrentAmmoCount(0);						-- NEVER LOADED FOR [LAUNCHER to LAUNCHER]
		end

--		result:getModData().TempScope = (Gun:getModData().TempScope)			-- M203 TRANSFER TEMP for M16 Attachments
--		result:getModData().TempCanon = (Gun:getModData().TempCanon)

-- 	[GUN to LAUNCHER] SAVE ATTACHMENT TO ModData.TempXXX
	elseif 	(Gun:isAimedFirearm() and isLauncher(result)) then
		-- AMMO TYPE DATA
		result:getModData().TempFireMode		= (Gun:getFireMode())		-- M203 SET TEMP for M16 SwitchBack
		result:getModData().TempContainsClip		= (Gun:isContainsClip())	
		result:getModData().TempRoundChambered		= (Gun:isRoundChambered())	
		result:getModData().TempCurrentAmmoCount 	= (Gun:getCurrentAmmoCount())	

		if	(Gun:getModData().TempFireMode) ~= nil then
			result:setFireMode(Gun:getModData().TempFireMode)			-- M203 SET its own FROM M16 TEMP
		end
		if	(Gun:getModData().TempContainsClip) then
			result:setContainsClip(Gun:getModData().TempContainsClip)
		end
		if	(Gun:getModData().TempRoundChambered) then
			result:setRoundChambered(Gun:getModData().TempRoundChambered)
		end

		local	Remove = Gun:getModData().TempCurrentAmmoCount				-- TEMP OF THE LAST LAUNCHER BECAUSE GUN IS M16 AMMO

		if	Gun:getModData().TempAmmoType == 1 and result:getAmmoType() == "Base.40INCRound" then	-- HE LOADED, [GUN to INC LAUNCHER]
			for i=1, Remove do
				player:getInventory():AddItem("Base.40HERound")					-- REMOVE HE, ADD TO INVENTORY
			end
			DebugSay(2,"Removing 40HE-Round")
			result:setCurrentAmmoCount(0);
		elseif	Gun:getModData().TempAmmoType == 2 and result:getAmmoType() == "Base.40HERound" then	-- INC LOADED, [GUN to HE LAUNCHER]
			for i=1, Remove do
				player:getInventory():AddItem("Base.40INCRound")				-- REMOVE INC, ADD TO INVENTORY
			end
			DebugSay(2,"Removing 40INC-Round")
			result:setCurrentAmmoCount(0);
		elseif	(Gun:getModData().TempCurrentAmmoCount) then				-- NO CROSS SWITCH
			result:setCurrentAmmoCount(Gun:getModData().TempCurrentAmmoCount)	-- LEAVE LOADED
		end

		-- ATTACHMENTS
	--	result:getModData().TempScope = (Gun:getWeaponPart("Scope"))			-- M203 SET TEMP for M16 Attachments
	--	result:getModData().TempCanon = (Gun:getWeaponPart("Canon"))			-- These will not give bonuses to
	--	result:getModData().TempStock = (Gun:getWeaponPart("Stock"))			-- SHARD ATTACHMENT BENEFIT
	--	result:getModData().TempClip = (Gun:getWeaponPart("Clip"))			-- SHARD ATTACHMENT BENEFIT
	--	result:getModData().TempSling = (Gun:getWeaponPart("Sling"))			-- SHARD ATTACHMENT BENEFIT
	--	result:getModData().TempRecoilPad = (Gun:getWeaponPart("RecoilPad"))		-- SHARD ATTACHMENT BENEFIT

--	[LAUNCHER to GUN] RESTORE ATTACHMENT FROM ModData.TempXXX
	elseif 	(isLauncher(Gun) and result:isAimedFirearm()) then
		-- AMMO TYPE DATA
		result:getModData().TempFireMode		= (Gun:getFireMode())		-- M16 SET TEMP for M203 Switchback
		result:getModData().TempContainsClip		= (Gun:isContainsClip())	
		result:getModData().TempRoundChambered		= (Gun:isRoundChambered())	
		result:getModData().TempCurrentAmmoCount	= (Gun:getCurrentAmmoCount())

		if	(Gun:getModData().TempFireMode) ~= nil then
			result:setFireMode(Gun:getModData().TempFireMode)			-- M16 SET its own FROM M203 TEMP
		end
		if	(Gun:getModData().TempContainsClip) then
			result:setContainsClip(Gun:getModData().TempContainsClip)
		end
		if	(Gun:getModData().TempRoundChambered) then
			result:setRoundChambered(Gun:getModData().TempRoundChambered)
		end
		if	(Gun:getModData().TempCurrentAmmoCount) then
			result:setCurrentAmmoCount(Gun:getModData().TempCurrentAmmoCount)
		end

		if Gun:getCurrentAmmoCount() > 0 then						-- STORE GRENADE TYPE IN M16 TEMP
			if	Gun:getAmmoType() == "Base.40HERound" then			-- USE AMMOTYPE INSTEAD
				result:getModData().TempAmmoType	= 1			-- INCENDIARY
			else	result:getModData().TempAmmoType	= 2			-- EXPLOSIVE
			end
		end

	--	result:setFireMode(Gun:getModData().FireMode)					-- M16 SET its own FROM M203 TEMP REDO ABOVE
	--	result:setContainsClip(Gun:getModData().ContainsClip)				-- TO PREVENT nil ERROR
	--	result:setRoundChambered(Gun:getModData().RoundChambered)		
	--	result:setCurrentAmmoCount(Gun:getModData().CurrentAmmoCount)		

		-- ATTACHMENTS									-- NOTE: WEIGHT INACCURATE IF NO ATTACH !!!
	--	result:attachWeaponPart(Gun:getModData().TempScope)				-- Attaching (to get Bonuses back)
	--	result:attachWeaponPart(Gun:getModData().TempCanon)				-- From M203 TEMP
	--	result:attachWeaponPart(Gun:getModData().TempStock)				-- SHARED ATTACHMENT BENEFIT
	--	result:attachWeaponPart(Gun:getModData().TempClip)				-- SHARED ATTACHMENT BENEFIT
	--	result:attachWeaponPart(Gun:getModData().TempSling)				-- SHARED ATTACHMENT BENEFIT
	--	result:attachWeaponPart(Gun:getModData().TempRecoilPad)				-- SHARED ATTACHMENT BENEFIT
	end

	if (instanceof(result,"HandWeapon")) then						-- REMOVE isAimedFirearm() for BAYO (Mele)
		player:setPrimaryHandItem(result) 
		if(result:isRequiresEquippedBothHands() or result:isTwoHandWeapon()) then
			player:setSecondaryHandItem(result)
		else	player:setSecondaryHandItem(nil)
		end
	end
end


function Launcher_Test(item)
	if item:getSubCategory() == "Firearm" then
		local sling = item:getSling()
		if (sling) and (string.find(sling:getType(), "Launcher")) then
			return true
		elseif	isLauncher(item) then
			return true
		else	return false
		end
	end
end

------------------------------------------------------------------
--  [CALIBER_WEAPON]	 					--
------------------------------------------------------------------
function Caliber_Weapon(items, result, player)
	local Gun
	for i=0,items:size() - 1 do
		if (instanceof(items:get(i),"HandWeapon")) then
			Gun = items:get(i)
		end
	end

--	======= TRANSFER CONDITION & MODE ======
	result:setCondition(Gun:getCondition());
	result:setFireMode(Gun:getFireMode());

--	====== TRANSFER AMMO MAG & CHAMBER =====
	if Gun:isContainsClip() == true then
		result:setContainsClip(true);
	end

--	====== REMOVE AMMO MAG & CHAMBER =====
	local Remove	= Gun:getCurrentAmmoCount()
	local Loaded	= Gun:getAmmoType()
	local Name

	if Gun:isRoundChambered() == true then
		Remove= Remove + 1
		result:setRoundChambered(false);
	end

	if Gun:getCurrentAmmoCount() > 0 then
		for i=1, Remove do
			local NewRound = InventoryItemFactory.CreateItem(Loaded)
			player:getInventory():AddItem(NewRound)
			if NewRound then
				Name = NewRound:getDisplayName()
			end
		end
		DebugSay(2,"Removing ("..tostring(Remove)..") "..tostring(Name))
		result:setCurrentAmmoCount(0);
	end

--	====== TRANSFER WEAPON ATTACHMENTS SO THEY DO NOT AFFECT MELEE VERSION
	if 	(result:isAimedFirearm() and Gun:isAimedFirearm()) then		-- [GUN to GUN] LEAVE THIS ALONE
		result:attachWeaponPart(Gun:getWeaponPart("Scope"))
		result:attachWeaponPart(Gun:getWeaponPart("Canon"))
		result:attachWeaponPart(Gun:getWeaponPart("Clip"))
		result:attachWeaponPart(Gun:getWeaponPart("Stock"))
		result:attachWeaponPart(Gun:getWeaponPart("Sling"))
		result:attachWeaponPart(Gun:getWeaponPart("RecoilPad"))
	end

--	if (instanceof(result,"HandWeapon")) and result:getMaxRange() > 0 then	-- REMOVE isAimedFirearm() for BAYO (Mele)
	if (instanceof(result,"HandWeapon")) then
		player:setPrimaryHandItem(result) 
		if(result:isRequiresEquippedBothHands() or result:isTwoHandWeapon()) then
			player:setSecondaryHandItem(result)
		else	player:setSecondaryHandItem(nil)
		end
	end
end


------------------------------------------------------------------
--  [CALIBER_MAGTYPE] SWITCH MAGAZINE AMMO TYPE			--
------------------------------------------------------------------
function Caliber_MagType(items, result, player)
	local Mag
	for i=0,items:size() - 1 do
	--	if (items:get(i):getDisplayCategory() == "GunMag") then
		if isMagazine(items:get(i)) then
			Mag = items:get(i)
		end
	end
	local Remove	= Mag:getCurrentAmmoCount()
	local Loaded	= Mag:getAmmoType()
	local Name

	if Mag:getCurrentAmmoCount() > 0 then
		for i=1, Remove do
			local NewRound = InventoryItemFactory.CreateItem(Loaded)
			player:getInventory():AddItem(NewRound)
			if NewRound then
				Name = NewRound:getDisplayName()
			end
		end
		DebugSay(2,"Removing ("..tostring(Remove)..") "..tostring(Name))
		result:setCurrentAmmoCount(0);
	end
end


------------------------------------------------------------------
--  [LAUNCHER RANGE] USES FIREMODE TO SET MAX RANGE		--
------------------------------------------------------------------
function Launcher_Range(player,weapon)
	local multiplier = GUNFIGHTER.OPTIONS.options.dropdown15
	local factor = 1
	if 	(multiplier ~= nil) then
		if	(multiplier == 1) then
			factor = 1.0
		elseif	(multiplier == 2) then
			factor = 1.5
		elseif	(multiplier == 3) then
			factor = 2.0
		elseif	(multiplier == 4) then
			factor = 2.5
		elseif	(multiplier == 5) then
			factor = 3.0
		end
	end

	if(player:isLocalPlayer() == true) then
		if (weapon ~= nil) and (instanceof(weapon,"HandWeapon")) and (weapon:isAimedFirearm()) then
			local scriptItem	= weapon:getScriptItem()
			local baseRange		= scriptItem:getMaxRange()	-- BASERANGE FLAMER WEAPONS CAN HAVE DIFFERENT MAX RANGE

			if (isRocket(weapon)) then				-- MIGRATE OFF FIREMODE FOR THIS
				if	weapon:getModData().Trajectory == "Short" then
					weapon:setMaxRange(24 * factor)
				elseif	weapon:getModData().Trajectory == "Medium" then
					weapon:setMaxRange(36 * factor)
				elseif	weapon:getModData().Trajectory == "Long" then
					weapon:setMaxRange(48 * factor)
				end
				local timer = (weapon:getMaxRange() * 2.5)	-- FASTER THAN NADES
				weapon:setTriggerExplosionTimer(timer)

			elseif (isLauncher(weapon)) then			-- MIGRATE OFF FIREMODE FOR THIS
				if	weapon:getModData().Trajectory == "Short" then
					weapon:setMaxRange(12 * factor)
				elseif	weapon:getModData().Trajectory == "Medium" then
					weapon:setMaxRange(18 * factor)
				elseif	weapon:getModData().Trajectory == "Long" then
					weapon:setMaxRange(24 * factor)
				end
				local timer = (weapon:getMaxRange() * 4)
				weapon:setTriggerExplosionTimer(timer)

			elseif (isFlamer(weapon)) then						--	MUSK	M2A1
				if weapon:getModData().Trajectory == "Short" then
					weapon:setMaxRange(baseRange + ZombRand(1))		--	6-7	8-9
				elseif weapon:getModData().Trajectory == "Medium" then
					weapon:setMaxRange(baseRange * 1.5 + ZombRand(2))	--	9-11	12-14
				elseif weapon:getModData().Trajectory == "Long" then
					weapon:setMaxRange(baseRange * 2 + ZombRand(3))		--	12-15	16-19
				end
				local timer = (weapon:getMaxRange() * 4)
				weapon:setTriggerExplosionTimer(timer)
				weapon:setFireMode("Auto")

				if (weapon:getMagazineType() == "Base.M2A1_Tank") then
					local back		= player:getClothingItem_Back()
					local noTank		= false

					if (back) then
						DebugSay(3,tostring(back:getType()))
						if (back:getCapacity() > 0) then	-- WORKS BUT NEED BETTER CHECK
							noTank = true
						end
					else	noTank = true
						DebugSay(3,"Nothing on Back")
					end

					if	noTank == true then
						weapon:setJammed(true)
						weapon:setMaxRange(ZombRand(2,4))
						Sound = player:getEmitter():playSound("OverFill")
						DebugSay(3,"!@#!! Ignition")
					end					-- NO NEED FOR ELSE, DEFAULTS TO SCRIPTITEM VALUE
				end
			end
		else	return false
		end
	end
end

Events.OnWeaponSwing.Add(Launcher_Range)	-- WONT UPDATE INFO WINDOW UNTIL FIRED, BUT WORKS IMMEDIATELY


------------------------------------------------------------------
--  [APPLY EFFECT] OF SUPPRESSORS AND BAYONETS			--
------------------------------------------------------------------
local function Apply_Effect(player, weapon)
	if weapon == nil then
		return
	end
	if not weapon:IsWeapon() then
		return;
	end

	--	FLAME THROWER PACK
	if	(weapon:getAmmoType() == "Base.FlameFuel") and (weapon:getMagazineType() == "Base.M2A1_Tank") and (weapon:isContainsClip() == true) then
		local Cosmetic = InventoryItemFactory.CreateItem('Bag_M2A1')
		player:getInventory():AddItem(Cosmetic)
		player:setWornItem(Cosmetic:canBeEquipped(), Cosmetic)
		player:getInventory():DoRemoveItem(Cosmetic)		-- REMOVE COSMETIC PACK
	end

	if	isLauncher(weapon) or isFlamer(weapon) then					-- PREVENT GRENADE DROPS
		if weapon:getModData().Trajectory == nil then
			weapon:getModData().Trajectory = "Medium"
			DebugSay(2,"Medium")
		end
	end


	--	BLOCK NO-LAUNCHER INSTALLED
	if (weapon:getAmmoType() == "Base.40INCRound") or (weapon:getAmmoType() == "Base.40HERound") then
		local launcher	= weapon:getSling()
		local Integral	= weapon:getModData().Integral
		if	(string.find(weapon:getType(), "EX41")) or			-- NO STAND ALONE
			(string.find(weapon:getType(), "Federal")) or
			(string.find(weapon:getType(), "M32")) or
			(string.find(weapon:getType(), "GM94")) then
			DebugSay(3,"STAND ALONE LAUNCHER")
		elseif	( (launcher) and (string.find(launcher:getType(), "Launcher")) ) or
			( (Integral) and (Integral == "Launcher") ) then		-- HAS LAUNCHER
			DebugSay(3,"LAUNCHER INSTALLED")
		else	DebugSay(3,"LAUNCHER NOT INSTALLED")				-- NO LAUNCHER
			weapon:setCurrentAmmoCount(0)					-- PREVENT FIRING
			weapon:setMaxAmmo(0)						-- PREVENT LOADING
		end
	end

	local scriptItem	= weapon:getScriptItem()
	local soundVolume	= scriptItem:getSoundVolume()
	local soundRadius	= scriptItem:getSoundRadius()
	local suppressFactor	= 1
	local swingSound	= scriptItem:getSwingSound()
	if	not weapon:isAimedHandWeapon() then			-- NOT MELEE TAKE-DOWN, ETC...
		swingSound = getShotSound(weapon,1)
	end

	local ammo		= weapon:getAmmoType()
	local maxRange		= scriptItem:getMaxRange()
	local maxDmg		= scriptItem:getMaxDamage()
	local minDmg		= scriptItem:getMinDamage()
	local crit		= 0					-- getCriticalChance DONT WORK
	local impact		= scriptItem:getImpactSound()		-- DOES THIS EVEN MAKE A DIFFERENCE ?
	local canon		= weapon:getCanon()
	local clip		= weapon:getClip()
	local bayo		= 0
	local suppress		= 1


	------------------------------------------
	--	SUPPRESSION DROPDOWN13 OPTION	--
	------------------------------------------
	local suppresslevel	= GUNFIGHTER.OPTIONS.options.dropdown13
	local basesoundlevel	= GUNFIGHTER.OPTIONS.options.dropdown14
--	local suppresslevel	= player:getModData().SuppressLevel

--	if player:getVehicle() ~= nil then
--		DebugSay("IN CAR")
--	else	DebugSay("ON FOOT")
--	end


	if 	(suppresslevel ~= nil) then
		if	(suppresslevel == 1) then
			suppress = 1.5
		elseif	(suppresslevel == 2) then
			suppress = 1.25
		elseif	(suppresslevel == 3) then
			suppress = 1
		elseif	(suppresslevel == 4) then
			suppress = 0.75
		elseif	(suppresslevel == 5) then
			suppress = 0.5
		elseif	(suppresslevel == 6) then
			suppress = 0.25			-- MIGHT BE TOO LOW
		end
	end

	if 	(basesoundlevel ~= nil) then
		local baseboost	= 0
		if	(basesoundlevel == 1) then
			baseboost = 0
		elseif	(basesoundlevel == 2) then
			baseboost = 10
		elseif	(basesoundlevel == 3) then
			baseboost = 20
		elseif	(basesoundlevel == 4) then
			baseboost = 30
		elseif	(basesoundlevel == 5) then
			baseboost = 40
		elseif	(basesoundlevel == 6) then
			baseboost = 50
		elseif	(basesoundlevel == 7) then
			baseboost = 60
		elseif	(basesoundlevel == 8) then
			baseboost = 70
		elseif	(basesoundlevel == 9) then
			baseboost = 80
		elseif	(basesoundlevel == 10) then
			baseboost = 90
		elseif	(basesoundlevel == 11) then
			baseboost = 100
		elseif	(basesoundlevel == 12) then
			baseboost = 110
		elseif	(basesoundlevel == 13) then
			baseboost = 120
		elseif	(basesoundlevel == 14) then
			baseboost = 130
		elseif	(basesoundlevel == 15) then
			baseboost = 140
		elseif	(basesoundlevel == 16) then
			baseboost = 150
		elseif	(basesoundlevel == 17) then
			baseboost = 160
		elseif	(basesoundlevel == 18) then
			baseboost = 170
		elseif	(basesoundlevel == 19) then
			baseboost = 180
		elseif	(basesoundlevel == 20) then
			baseboost = 190
		elseif	(basesoundlevel == 21) then
			baseboost = 200
		end
		soundRadius = (soundRadius + baseboost)
	end


	if weapon:isRanged() then	-- DONT SILENCE LAUNCHERS
		if (isSuppressed(weapon)) and (not isLauncher(weapon)) then
			swingSound = getShotSound(weapon,1)
			suppressFactor = getSuppressFactor(weapon)
			if (suppressFactor) then
				soundVolume = soundVolume * suppressFactor * suppress
				soundRadius = soundRadius * suppressFactor * suppress
			end

--[[		if ((string.find(scriptItem:getSwingSound(),"SD") or (canon and string.find(canon:getType(), "Suppressor")))) and not isLauncher(weapon) then
			local	junkfactor = 0
			if	(canon and string.find(canon:getType(), "Oil")) then
				junkfactor = 0.1
			elseif	(canon and string.find(canon:getType(), "Bottle")) then
				junkfactor = 0.2		-- DECREASE FROM 25 DUE TO POSSIBLE NEGATIVE EFFECT @150% OPTION
			end

			if weapon:getAmmoType() == 	"Base.Bullets22" then			-- DO NOT GO OVER 0.45 !!!
				soundVolume = soundVolume * (0.4 + junkfactor) * suppress	-- (1)
				soundRadius = soundRadius * (0.4 + junkfactor) * suppress	-- 8.8
			--	swingSound = 'SD22Shot'
			elseif weapon:getAmmoType() == 	"Base.Bullets57" then
				soundVolume = soundVolume * (0.4 + junkfactor) * suppress	-- (1)
				soundRadius = soundRadius * (0.4 + junkfactor) * suppress	-- 18
			--	swingSound = 'SD223Shot'					-- NEED SOUND
			elseif weapon:getAmmoType() == 	"Base.Bullets380" then
				soundVolume = soundVolume * (0.41 + junkfactor) * suppress	-- (1)
				soundRadius = soundRadius * (0.41 + junkfactor) * suppress	-- 15.58
			--	swingSound = 'SD380Shot'
			elseif weapon:getAmmoType() == 	"Base.Bullets38" then
				soundVolume = soundVolume * (0.42 + junkfactor) * suppress	-- (1)
				soundRadius = soundRadius * (0.42 + junkfactor) * suppress	-- 15.96
			--	swingSound = 'SD38Shot'
			elseif weapon:getAmmoType() == 	"Base.Bullets357" then
				soundVolume = soundVolume * (0.43 + junkfactor) * suppress	-- (1)
				soundRadius = soundRadius * (0.43 + junkfactor) * suppress	-- 19.35
			--	swingSound = 'SD44Shot'						-- NEED SOUND
			elseif weapon:getAmmoType() ==	"Base.Bullets9mm" then
				soundVolume = soundVolume * (0.42 + junkfactor) * suppress	-- (1)
				soundRadius = soundRadius * (0.42 + junkfactor) * suppress	-- 16.8
			--	swingSound = 'SD9mmShot'
			elseif weapon:getAmmoType() ==	"Base.Bullets45" then
				soundVolume = soundVolume * (0.44 + junkfactor) * suppress	-- (1)
				soundRadius = soundRadius * (0.44 + junkfactor) * suppress	-- 18.92
			--	swingSound = 'SD45Shot'
			elseif weapon:getAmmoType() ==	"Base.Bullets45LC" then
				soundVolume = soundVolume * (0.45 + junkfactor) * suppress	-- (1)
				soundRadius = soundRadius * (0.45 + junkfactor) * suppress	-- 29.25
			--	swingSound = 'SD44Shot'						-- NEED SOUND
			elseif weapon:getAmmoType() ==	"Base.Bullets44" then
				soundVolume = soundVolume * (0.45 + junkfactor) * suppress	-- (1)
				soundRadius = soundRadius * (0.45 + junkfactor) * suppress	-- 29.25
			--	swingSound = 'SD44Shot'
			elseif weapon:getAmmoType() ==	"Base.Bullets50MAG" then
				soundVolume = soundVolume * (0.45 + junkfactor) * suppress	-- (1)
				soundRadius = soundRadius * (0.45 + junkfactor) * suppress	-- 29.25
			--	swingSound = 'SD44Shot'						-- NEED SOUND
			elseif weapon:getAmmoType() ==	"Base.Bullets4570" then
				soundVolume = soundVolume * (0.45 + junkfactor) * suppress	-- (1)
				soundRadius = soundRadius * (0.45 + junkfactor) * suppress	-- 29.25
			--	swingSound = 'SD44Shot'						-- NEED SOUND
			elseif weapon:getAmmoType() ==	"Base.223Bullets" then
				soundVolume = soundVolume * (0.4 + junkfactor) * suppress	-- (1)
				soundRadius = soundRadius * (0.4 + junkfactor) * suppress	-- 24
			--	swingSound = 'SD223Shot'
			elseif weapon:getAmmoType() ==	"Base.556Bullets" then
				soundVolume = soundVolume * (0.4 + junkfactor) * suppress	-- (1)
				soundRadius = soundRadius * (0.4 + junkfactor) * suppress	-- 24
			--	swingSound = 'SD556Shot'
			elseif weapon:getAmmoType() ==	"Base.545x39Bullets" then
				soundVolume = soundVolume * (0.4 + junkfactor) * suppress	-- (1)
				soundRadius = soundRadius * (0.4 + junkfactor) * suppress	-- 28
			--	swingSound = 'SD762x39Shot'					-- NEED SOUND
			elseif weapon:getAmmoType() ==	"Base.762x39Bullets" then
				soundVolume = soundVolume * (0.4 + junkfactor) * suppress	-- (1)
				soundRadius = soundRadius * (0.4 + junkfactor) * suppress	-- 28
			--	swingSound = 'SD762x39Shot'
			elseif weapon:getAmmoType() ==	"Base.308Bullets" then
				soundVolume = soundVolume * (0.4 + junkfactor) * suppress	-- (1)
				soundRadius = soundRadius * (0.4 + junkfactor) * suppress	-- 32
			--	swingSound = 'SD308Shot'
			elseif weapon:getAmmoType() ==	"Base.762x51Bullets" then
				soundVolume = soundVolume * (0.4 + junkfactor) * suppress	-- (1)
				soundRadius = soundRadius * (0.4 + junkfactor) * suppress	-- 32
			--	swingSound = 'SD308Shot'					-- NEED SOUND
			elseif weapon:getAmmoType() ==	"Base.762x54rBullets" then
				soundVolume = soundVolume * (0.4 + junkfactor) * suppress	-- (1)
				soundRadius = soundRadius * (0.4 + junkfactor) * suppress	-- 32
			--	swingSound = 'SD308Shot'					-- NEED SOUND
			elseif weapon:getAmmoType() ==	"Base.3006Bullets" then
				soundVolume = soundVolume * (0.4 + junkfactor) * suppress	-- (1)
				soundRadius = soundRadius * (0.4 + junkfactor) * suppress	-- 32
			--	swingSound = 'SD308Shot'					-- NEED SOUND
			elseif weapon:getAmmoType() ==	"Base.50BMGBullets" then
				soundVolume = soundVolume * (0.25 + junkfactor) * suppress	-- (1)
				soundRadius = soundRadius * (0.25 + junkfactor) * suppress	-- 50
			--	swingSound = 'SD50Shot'
			elseif weapon:getAmmoType() ==	"Base.410gShotgunShells" then
				soundVolume = soundVolume * (0.4 + junkfactor) * suppress	-- (1)
				soundRadius = soundRadius * (0.4 + junkfactor) * suppress	-- 27.4
			--	swingSound = 'SD12GShot'					-- NEED SOUND
			elseif weapon:getAmmoType() ==	"Base.20gShotgunShells" then
				soundVolume = soundVolume * (0.4 + junkfactor) * suppress	-- (1)
				soundRadius = soundRadius * (0.4 + junkfactor) * suppress	-- 27.4
			--	swingSound = 'SD12GShot'					-- NEED SOUND
			elseif weapon:getAmmoType() ==	"Base.ShotgunShells" then
				soundVolume = soundVolume * (0.4 + junkfactor) * suppress	-- (1)
				soundRadius = soundRadius * (0.4 + junkfactor) * suppress	-- 27.4
			--	swingSound = 'SD12GShot'
			elseif weapon:getAmmoType() ==	"Base.10gShotgunShells" then
				soundVolume = soundVolume * (0.4 + junkfactor) * suppress	-- (1)
				soundRadius = soundRadius * (0.4 + junkfactor) * suppress	-- 27.4
			--	swingSound = 'SD12GShot'					-- NEED SOUND
			elseif weapon:getAmmoType() ==	"Base.4gShotgunShells" then
				soundVolume = soundVolume * (0.4 + junkfactor) * suppress	-- (1)
				soundRadius = soundRadius * (0.4 + junkfactor) * suppress	-- 27.4
			--	swingSound = 'SD12GShot'					-- NEED SOUND
			end
]]

	--		INSERT NON-GENERIC SOUND FOR BURST MODE SITUATIONS (M4)
	--		local Alt = weapon:getModData().AltSwingSound
	--		if Alt ~= nil then
	--			swingSound = Alt
	--		end

		end
		if (scope) and (isLauncher(weapon)) then	-- NO SCOPE FOR LAUNCHER
			weapon:setMaxRange(maxRange)					-- USE NON-MODIFIED RANGE
		end
	elseif not weapon:isRanged() then						-- DONT DO THIS GOING TO GUN MODE
		if canon then
			if string.find(canon:getType(), "Bayonet") then			-- APPLY BAYONET STATS
				maxDmg = 1.8						-- BETWEEN MACHETTE/HUNTINGKNIFE SPEAR
				minDmg = 1.4						-- BETWEEN MACHETTE/HUNTINGKNIFE SPEAR
				crit = 20						-- SAME AS MOST SPEAR
				bayo = 0.4
				impact	= BladeHit
			end
			weapon:setMaxDamage(maxDmg)	-- MOVE TO BAYO SEGMENT TO LET CHOKE WORK
			weapon:setMinDamage(minDmg)	-- MOVE TO BAYO SEGMENT TO LET CHOKE WORK
			weapon:setCriticalChance(crit)	-- MOVE TO BAYO SEGMENT JUST IN CASE
		end
--		if scope then								-- NO SCOPE FOR MELEE
		weapon:setMaxRange(maxRange + bayo)					-- USE NON-MODIFIED RANGE
--		end
	end

	if clip then									-- NOT NEEDED FOR ATTACHMENT
		if	(string.find(clip:getType(), "Extended_Mag")) then
			theMag	= weapon:getModData().ExtMagType
		elseif	(string.find(clip:getType(), "Drum_Mag")) then
			theMag	= weapon:getModData().DrumMagType
		elseif	(string.find(clip:getType(), "Standard_Mag")) then
			theMag	= weapon:getModData().MagazineType			-- WILL THIS WORK ??????
		end
		if theMag then
			TempPart = InventoryItemFactory.CreateItem(theMag);		-- JUST TO GET MAXAMMO FROM TEMP ITEM
			weapon:setMagazineType(theMag)
			weapon:setMaxAmmo(TempPart:getMaxAmmo())
		end
	end


	showMag(weapon)			-- LOCATED IN GUNFIGHTER_FUNCTION.LUA ALSO CALLED FROM INSERT AND EJECT TIMED ACTIONS


	if weapon:isAimedFirearm() and weapon:isRanged() then	-- OR ATTACHMENTS RESULT IN NO RECOIL !??
		calcRecoilDelay(weapon)
	end
--	weapon:getModData().TempRecoilDelay = weapon:getRecoilDelay()	-- WAS USING THIS
--	calcRecoilDelay(weapon)		-- PREVENT NIL SITUATIONS DAMNIT THIS BREAKS MELEE & TAKE DOWN MODES


	--------------------------------------------------------------------------	
	--  FLASHLIGHT MODULE - CREATED BETTER WEAPONLIGHT CODE IN FUNCTIONS	--
	--------------------------------------------------------------------------
--[[	local stock = weapon:getStock()
	if (stock) and (string.find(stock:getType(), "Light")) then
		weapon:setCanBeActivated(true)				-- MAKES IT A FLASHLIGHT
	else	weapon:setCanBeActivated(false)				-- SUCKS ALWAYS STARTS ON
	end								-- DUE TO VANILLA ONEQUIP
]]

	weapon:setSoundVolume(soundVolume)
	weapon:setSoundRadius(soundRadius)
	weapon:setSwingSound(swingSound)
--	weapon:setMaxDamage(maxDmg)		-- MOVE TO BAYO SEGMENT TO LET CHOKE WORK
--	weapon:setMinDamage(minDmg)		-- MOVE TO BAYO SEGMENT TO LET CHOKE WORK
--	weapon:setCriticalChance(crit)		-- MOVE TO BAYO SEGMENT JUST IN CASE
	weapon:setImpactSound(impact)


	----------------------
	--  OPTIONS BOX 18   --
	----------------------
	if (GUNFIGHTER.OPTIONS.options.box18) == true then
		if weapon:isAimedFirearm() then
			if weapon:isRanged() then
				weapon:setPushBackMod(0)
				weapon:setKnockBackOnNoDeath(false)
				weapon:setKnockdownMod(0)
				weapon:setCriticalChance(0)
			end
		end
	end

	----------------------
	--  OPTIONS BOX 19   --
	----------------------
	if (GUNFIGHTER.OPTIONS.options.box19) == true then
		if weapon:isAimedFirearm() and weapon:getModData().EasyAngle == nil then	-- APPLY ONCE
			if weapon:isRanged() then
				weapon:getModData().EasyAngle = weapon:getMinAngle()
				weapon:setMinAngle(scriptItem:getMinAngle()-0.1)
			end
		end
	elseif	(GUNFIGHTER.OPTIONS.options.box19) == false and weapon:isAimedFirearm() and weapon:getModData().EasyAngle ~= nil then	-- APPLY ONCE
		weapon:setMinAngle(weapon:getModData().EasyAngle)
		weapon:getModData().EasyAngle = nil
	end

	----------------------
	--  OPTIONS BOX 3   --
	----------------------
--	if (GUNFIGHTER.OPTIONS.options.dropdown3) > 1 then
	if (GUNFIGHTER.OPTIONS.options.dropdown3) >= 2 then
		local ShowItem	=	weapon:getType()
		local ShowMaxD	=	round(weapon:getMaxDamage(),1)
		local ShowMinD	=	round(weapon:getMinDamage(),1)
		local ShowMaxR	=	round(weapon:getMaxRange(),1)
		local ShowMinR	=	round(weapon:getMinRange(),1)
		local ShowWt	=	round(getLoadedWeight(weapon),1)
		local ShowCrit	=	round(weapon:getCriticalChance(),1)
		local ShowAng	=	round(weapon:getMinAngle(),1)
		local ShowKnok	=	weapon:isKnockBackOnNoDeath()
		local ShowKick	=	round(weapon:getKnockdownMod(),1)
		local ShowPush	=	round(weapon:getPushBackMod(),1)

		if weapon:isAimedFirearm() then
			if weapon:isRanged() then
				calcRecoilDelay(weapon)
				weapon:getModData().TempHitChance = weapon:getHitChance()

				local ShowHit	=	weapon:getModData().TempHitChance
				local ShowRec	=	round(weapon:getRecoilDelay(),1)
				local ShowAim	=	70 - weapon:getAimingTime()
				local ShowRel	=	round(weapon:getReloadTime(),1)
				local ShowVol	=	round(weapon:getSoundRadius(),1)

			--[[	local ITM = "TEST"	-- tostring(weapon:getType())
				local HIT = "TEST"	-- tostring(weapon:getModData().TempHitChance)
				local REC = "TEST"	-- tostring(weapon:getRecoilDelay())
				local AIM = "TEST"	-- tostring(70 - weapon:getAimingTime())
				local REL = "TEST"	-- tostring(round(weapon:getReloadTime(),1))
				local DMG = "TEST"	-- tostring(round(weapon:getMaxDamage(),1))
				local RNG = "TEST"	-- tostring(round(weapon:getMaxRange(),1))
				local WGT = "TEST"	-- tostring(round(getLoadedWeight(weapon),1))
				local SND = "TEST"	-- tostring(weapon:getSoundRadius())

				local r2 =	1.0
				local g2 =	1.0
				local b2 = 	1.0

				getTextManager():DrawString(UIFont.Small, 100, 190, ITM, r2, g2, b2, 1.0);
				getTextManager():DrawString(UIFont.Small, 100, 200, HIT, r2, g2, b2, 1.0);
				getTextManager():DrawString(UIFont.Small, 100, 210, REC, r2, g2, b2, 1.0);
				getTextManager():DrawString(UIFont.Small, 100, 220, AIM, r2, g2, b2, 1.0);
				getTextManager():DrawString(UIFont.Small, 100, 230, REL, r2, g2, b2, 1.0);
				getTextManager():DrawString(UIFont.Small, 100, 240, DMG, r2, g2, b2, 1.0);
				getTextManager():DrawString(UIFont.Small, 100, 250, RNG, r2, g2, b2, 1.0);
				getTextManager():DrawString(UIFont.Small, 100, 260, WGT, r2, g2, b2, 1.0);
				getTextManager():DrawString(UIFont.Small, 100, 270, SND, r2, g2, b2, 1.0);
			]]


				DebugSay(3,
					"NoD - "..tostring(ShowKnok)..
					"\n".."Kck - "..tostring(ShowKick)..
					"\n".."Psh - "..tostring(ShowPush)
					)
				DebugSay(1,
		--			"Firearm Mode"..
					tostring(ShowItem)..
					"\n".."Hit - "..tostring(ShowHit)..
					"\n".."Rec - "..tostring(ShowRec)..
					"\n".."Aim - "..tostring(ShowAim)..
					"\n".."Dmg - "..tostring(ShowMaxD).." / "..tostring(ShowMinD)..
					"\n".."Rng - "..tostring(ShowMaxR).." / "..tostring(ShowMinR)
					)
				DebugSay(1,
					"Rel - "..tostring(ShowRel)..
					"\n".."Ang - "..tostring(ShowAng)..
					"\n".."Crt - "..tostring(ShowCrit)..
					"\n".."Wt - "..tostring(ShowWt)..
					"\n".."Vol - "..tostring(ShowVol)
					)

			elseif	(GUNFIGHTER.OPTIONS.options.dropdown3) >= 3 then
				DebugSay(1,
		--			"Melee Mode"..
					tostring(ShowItem)..
					"\n".."Dmg - "..tostring(ShowMaxD).." / "..tostring(ShowMinD)..
					"\n".."Rng - "..tostring(ShowMaxR).." / "..tostring(ShowMinR)..
					"\n".."Ang - "..tostring(ShowAng)..
					"\n".."Crt - "..tostring(ShowCrit)..
					"\n".."Wt - "..tostring(ShowWt)
					)
			end
		elseif	(GUNFIGHTER.OPTIONS.options.dropdown3) >= 3 then
			DebugSay(1,
		--		"Melee Weapon"..
				tostring(ShowItem)..
				"\n".."Dmg - "..tostring(ShowMaxD).." / "..tostring(ShowMinD)..
				"\n".."Rng - "..tostring(ShowMaxR).." / "..tostring(ShowMinR)..
				"\n".."Ang - "..tostring(ShowAng)..
				"\n".."Crt - "..tostring(ShowCrit)..
				"\n".."Wt - "..tostring(ShowWt)
				)
		end
	end

	if getActivatedMods():contains("BetterSortCC_A26C") then
		DebugSay(1,
			"[BETTER SORTING COMPATIBILITY MOD]\n"..
			"IS *NOT* COMPATIBLE. DISABLE IT!!"
		)
	end


end

Events.OnEquipPrimary.Add(Apply_Effect);

Events.OnGameStart.Add(function()
	local player = getPlayer()
	Apply_Effect(player, player:getPrimaryHandItem())
end)










------------------------------------------------------------------
--  		OBSOLETE SCRIPT FOR REFERENCE			--
--  [UNIVERSAL_TRANSFORM] USE WHEN RECLAIMING ITEM IS REQUIRED	--
------------------------------------------------------------------
function Universal_Transform(items, result, player, action)
	local Gun
	for i=0,items:size() - 1 do
		if (instanceof(items:get(i),"HandWeapon")) then
			Gun = items:get(i)
		end
	end

	if (Gun:isAimedFirearm()) then
		if 	(Gun:getModData().TransformType == "Pistol") then	-- ADD SUPPRESSOR TYPES HERE
			player:getInventory():AddItem("Base.PistolSuppressor")
		elseif	(Gun:getModData().TransformType == "Rifle") then
			player:getInventory():AddItem("Base.RifleSuppressor")
		elseif	(Gun:getModData().TransformType == "Large") then
			player:getInventory():AddItem("Base.LargeSuppressor")
		end
	else
		if	(Gun:getModData().TransformType == "Bayonet") then	-- ADD BAYONET TYPES HERE
			player:getInventory():AddItem("Base.Bayonet")
		elseif	(Gun:getModData().TransformType == "AKBayonet") then
			player:getInventory():AddItem("Base.AKBayonet")
		elseif	(Gun:getModData().TransformType == "M1917Bayonet") then
			player:getInventory():AddItem("Base.M1917Bayonet")
		end
	end


--	======= TRANSFER CONDITION & MODE ======
	result:setCondition(Gun:getCondition());
	result:setFireMode(Gun:getFireMode());

--	====== TRANSFER AMMO MAG & CHAMBER =====
	if 	(Gun:isContainsClip() == true) then
		result:setContainsClip(true);
	end
	if Gun:isRoundChambered() == true then
		result:setRoundChambered(true);
	end
	result:setCurrentAmmoCount(Gun:getCurrentAmmoCount());

--	====== TRANSFER WEAPON ATTACHMENTS SO THEY DO NOT AFFECT MELEE VERSION
	if 	(result:isAimedFirearm() and Gun:isAimedFirearm()) then		-- [GUN to GUN] LEAVE THIS ALONE
		result:attachWeaponPart(Gun:getWeaponPart("Scope"))
		result:attachWeaponPart(Gun:getWeaponPart("Canon"))
		result:attachWeaponPart(Gun:getWeaponPart("Clip"))
		result:attachWeaponPart(Gun:getWeaponPart("Stock"))
		result:attachWeaponPart(Gun:getWeaponPart("Sling"))
		result:attachWeaponPart(Gun:getWeaponPart("RecoilPad"))
	elseif 	(not Gun:isAimedFirearm() and result:isAimedFirearm()) then	-- [MELEE to GUN] RESTORE ATTACHMENT FROM ModData.TempXXX
		result:attachWeaponPart(Gun:getModData().TempScope)
		result:attachWeaponPart(Gun:getModData().TempCanon)
		result:attachWeaponPart(Gun:getModData().TempClip)
		result:attachWeaponPart(Gun:getModData().TempStock)
		result:attachWeaponPart(Gun:getModData().TempSling)
		result:attachWeaponPart(Gun:getModData().TempRecoilPad)
	elseif 	(Gun:isAimedFirearm() and not result:isAimedFirearm()) then	-- [GUN to MELEE] SAVE ATTACHMENT TO ModData.TempXXX
		result:getModData().TempScope = (Gun:getWeaponPart("Scope"))
		result:getModData().TempCanon = (Gun:getWeaponPart("Canon"))
		result:getModData().TempClip  = (Gun:getWeaponPart("Clip"))
		result:getModData().TempStock = (Gun:getWeaponPart("Stock"))
		result:getModData().TempSling = (Gun:getWeaponPart("Sling"))
		result:getModData().TempRecoilPad = (Gun:getWeaponPart("RecoilPad"))
	end

	if (instanceof(result,"HandWeapon")) then	-- REMOVE isAimedFirearm() for BAYO (Mele)
		player:setPrimaryHandItem(result) 
		if(result:isRequiresEquippedBothHands() or result:isTwoHandWeapon()) then
			player:setSecondaryHandItem(result)
		else	player:setSecondaryHandItem(nil)
		end
	end
end


------------------------------------------------------------------
--  		OBSOLETE SCRIPT FOR REFERENCE			--
--  [UNIVERSAL_STRIPPERCLIP] USE VIA CONTEXT MENU (OBSOLETE)	--
------------------------------------------------------------------
function Universal_StripperClip(items, result, player)
	local Gun
	local Clip
	local ClipAmmo
	local Sound
	for i=0,items:size() - 1 do
		if (instanceof(items:get(i),"HandWeapon")) and (items:get(i):isAimedFirearm()) then
			Gun = items:get(i)
		elseif (items:get(i):getDisplayCategory() == "GunMag") and (items:get(i):getCurrentAmmoCount() > 0) then
			Clip = items:get(i)
		end
	end

	local LoadedGun = player:getInventory():AddItem(Gun)		-- ADD REPLACED GUN TO INVENTORY
	local Current = Gun:getCurrentAmmoCount()
	local Max = Gun:getMaxAmmo()
	if Clip then
		ClipAmmo = Clip:getCurrentAmmoCount()
	else	ClipAmmo = 0
	end

	if	((Gun:getMagazineType() ~= nil) and (Gun:isContainsClip() == false)) then
		player:Say("No Magazine...")
	        Sound = player:getEmitter():playSound("ZeroClip")
		result:setCurrentAmmoCount(ClipAmmo)			-- RETURN ALL AMMO
	elseif 	(Clip == nil) then
		player:Say("Clip Empty("..tostring(Current)..")")
	        Sound = player:getEmitter():playSound("ZeroClip")
	else								-- MATH
		local CanFit = Max - Current
		local LeftOnClip = ClipAmmo - CanFit
		local GoIn = 0
		if LeftOnClip <= 0 then
			GoIn = ClipAmmo
		else	GoIn = ClipAmmo - LeftOnClip
		end
		local Total = Current + GoIn
		local GoBack = 0
		if LeftOnClip <= 0 then
			GoBack = 0
		else	GoBack = LeftOnClip
		end

		result:setCurrentAmmoCount(GoBack)
		LoadedGun:setCurrentAmmoCount(Current + GoIn);

		if	Current == Max then					-- CAN MAKE AS DETAILED AS YOU WANT
		        Sound = player:getEmitter():playSound("ZeroClip")	-- EXAMPLE SHOWS (3) DIFFERENT RESULTS
			player:Say("Mag Full("..tostring(Current)..")")
		elseif	GoIn == 0 then
		        Sound = player:getEmitter():playSound("ZeroClip")
			player:Say("Clip Empty("..tostring(Current)..")")
		elseif	GoIn < 5 then
		        Sound = player:getEmitter():playSound("PartialClip")
			player:Say("+"..tostring(GoIn).."("..tostring(Current + GoIn)..")")
		elseif	GoIn >= 5 then
		        Sound = player:getEmitter():playSound("StripClip")
			player:Say("+"..tostring(GoIn).."("..tostring(Current + GoIn)..")")
		end
	end

        local radius = 5							-- NOT EVEN SURE IF LOADING SHOULD ATTRACT ZOMBIES
        addSound(player, player:getX(), player:getY(), player:getZ(), radius, radius)

	if (instanceof(LoadedGun,"HandWeapon")) then
		player:setPrimaryHandItem(LoadedGun) 
		if(LoadedGun:isRequiresEquippedBothHands() or result:isTwoHandWeapon()) then
			player:setSecondaryHandItem(LoadedGun)
		else	player:setSecondaryHandItem(nil)
		end
	end
end

------------------------------------------------------------------
--  		OBSOLETE SCRIPT FOR REFERENCE			--
--  [LAUNCHER_MAGTYPE] OBSOLETE	USE CALIBER_MAGTYPE INSTEAD	--
------------------------------------------------------------------
function Launcher_MagType(items, result, player)
	local Mag
	for i=0,items:size() - 1 do
		if (items:get(i):getDisplayCategory() == "GunMag") then
			Mag = items:get(i)
		end
	end
		local Remove = Mag:getCurrentAmmoCount()

	if Mag:getCurrentAmmoCount() > 0 then
		if	result:getModData().TransformType == "INC" then			-- WITH ONLY 2 TYPES, ALWAYS UNLOAD
			for i=1, Remove do
				player:getInventory():AddItem("Base.40HERound")		-- REMOVE HE, ADD TO INVENTORY
			end
			player:Say("Removing 40HE-Round")
		else	for i=1, Remove do
				player:getInventory():AddItem("Base.40INCRound")	-- REMOVE INC, ADD TO INVENTORY
			end
			player:Say("Removing 40INC-Round")
		end
		result:setCurrentAmmoCount(0);						-- NEVER LOADED FOR [LAUNCHER to LAUNCHER]
	end
end