--------------------------------------------------------------------------
--  DISTANCE UTILITY FROM SUPERB-SURVIVORS (by Nolan Richie)		--
--------------------------------------------------------------------------
function getDistanceBetween(z1,z2)
	if(z1 == nil) or (z2 == nil) then
		return -1
	end
	local z1x = z1:getX();
	local z1y = z1:getY();
	local z2x = z2:getX();
	local z2y = z2:getY();
	local dx = z1x - z2x
	local dy = z1y - z2y
	return math.sqrt ( dx * dx + dy * dy )
end

function DebugSay(lvl,text)
	local level = (GUNFIGHTER.OPTIONS.options.dropdown17)
	if (lvl <= level) then
		getSpecificPlayer(0):Say(text)
	--	getTextManager():DrawString(UIFont.Medium, 100, 100, text, 1, 1, 1, 1.0);
	end
end


--------------------------------------------------------------------------
--  CHECK FOR LAUNCHER	INCLUDES ROCKETS				--
--------------------------------------------------------------------------
function isLauncher(weapon)
	if	(weapon:getAmmoType() == "Base.40HERound") or (weapon:getAmmoType() == "Base.40INCRound") or (weapon:getAmmoType() == "Base.HERocket") then
		return true
	else	return false
	end
end

--------------------------------------------------------------------------
--  CHECK FOR ROCKET OR MISSLE ONLY					--
--------------------------------------------------------------------------
function isRocket(weapon)
	if	(weapon:getAmmoType() == "Base.HERocket") then
		return true
	else	return false
	end
end

--------------------------------------------------------------------------
--  CHECK FOR FLAME THROWER OR LIQUID WEAPON				--
--------------------------------------------------------------------------
function isFlamer(weapon)
	if	(weapon:getAmmoType() == "Base.FlameFuel") or (weapon:getAmmoType() == "Base.WaterAmmo") then
		return true
	else	return false
	end
end

--------------------------------------------------------------------------
--  CHECK FOR BOW							--
--------------------------------------------------------------------------
function isBow(weapon)
	if	(weapon:getAmmoType() == "Base.Bolt_Bear") then
		return true
	else	return false
	end
end

--------------------------------------------------------------------------
--  CHECK FOR SHOTGUN 							--
--------------------------------------------------------------------------
function isShotgun(weapon)
--	if	(string.find(weapon:getAmmoType(), "ShotgunShells")) then
	if	(weapon:getAmmoType() == "Base.410gShotgunShells")	or
		(weapon:getAmmoType() == "Base.20gShotgunShells")	or
		(weapon:getAmmoType() == "Base.ShotgunShells")		or
		(weapon:getAmmoType() == "Base.10gShotgunShells")	or
		(weapon:getAmmoType() == "Base.4gShotgunShells")	then
		return true
	else	return false
	end
end

--------------------------------------------------------------------------
--  CHECK FOR ALTERNATE LOADING METHOD					--
--------------------------------------------------------------------------
function canUseClip(weapon)
	if	(weapon:getModData().ClipType ~= nil) then
		return true
	else	return false
	end
end

--------------------------------------------------------------------------
--  CHECK FOR SUPPRESSION						--
--------------------------------------------------------------------------
function isSuppressed(weapon)
	local	scriptItem = weapon:getScriptItem()
	local	canon = weapon:getCanon()
	if	(canon) and (string.find(canon:getType(), "Suppressor")) then
		return true
	elseif	(string.find(scriptItem:getSwingSound(), "SD")) then
		return true
	else	return false
	end
end


--------------------------------------------------------------------------
--  CHECK FOR INSERTED MAG						--
--------------------------------------------------------------------------
function showMag(weapon)
	local	clip	= weapon:getClip()
	local	Ext  	= weapon:getModData().ExtMagType
	local 	Drum 	= weapon:getModData().DrumMagType
	local	Loaded	= weapon:isContainsClip()
	local	Type	= weapon:getMagazineType()

	----------------------------------
	--	FOR EVERYTHING ELSE	--
	----------------------------------
	if	(isLauncher(weapon)) then				-- Workaround for K11
		DebugSay(3,"Launcher - Skip Visible Mag")
	elseif 	Loaded == true then
		if	Ext ~= nil and Type == Ext then		MagPart = InventoryItemFactory.CreateItem('Extended_Mag');
		elseif	Drum ~= nil and Type == Drum then	MagPart = InventoryItemFactory.CreateItem('Drum_Mag');
		elseif	Type ~= nil then			MagPart = InventoryItemFactory.CreateItem('Standard_Mag');
 		end
		if MagPart and clip == nil then
			weapon:attachWeaponPart(MagPart)
--			weapon:setWeaponPart("Mag",MagPart)
		end
	elseif	clip ~= nil then
		if	Ext ~= nil and (string.find(clip:getType(), "Extended_Mag")) then
				weapon:detachWeaponPart(weapon:getWeaponPart("Clip"))
--				weapon:setWeaponPart("Mag",nil)
		elseif	Drum ~= nil and (string.find(clip:getType(), "Drum_Mag")) then
				weapon:detachWeaponPart(weapon:getWeaponPart("Clip"))
--				weapon:setWeaponPart("Mag",nil)
		elseif	Type ~= nil and (string.find(clip:getType(), "Standard_Mag")) then
				weapon:detachWeaponPart(weapon:getWeaponPart("Clip"))
--				weapon:setWeaponPart("Mag",nil)
		end
	end


	----------------------------------
	--	FOR ROCKET LAUNCHERS	--
	----------------------------------
	if	(isLauncher(weapon)) and (weapon:getAmmoType() == "Base.HERocket") then
		if	(weapon:getCurrentAmmoCount() > 0) then
			MagPart = InventoryItemFactory.CreateItem('Standard_Mag');
			if MagPart then
				weapon:attachWeaponPart(MagPart)
			end
		else	weapon:detachWeaponPart(weapon:getWeaponPart("Clip"))
		end
	end

end


--------------------------------------------------------------------------
--  HOTBAR AFTER TRANSFORM FOR KBM PLAYERS (NO HOTBAR W/GAMEPAD)	--
--------------------------------------------------------------------------
function checkHotbar(weapon, result)
	local Hotbar = getPlayerHotbar(0)
--	if Hotbar ~= nil and Hotbar:isVisible() then			-- GAME PAD NOT VISIBLE
	if Hotbar ~= nil then						-- APPLY FOR GAMEPAD TOO
		local W_slot = weapon:getAttachedSlot()
		local slot = Hotbar.availableSlot[W_slot]
		if (slot) and (result) and (not Hotbar:isInHotbar(result)) and (Hotbar:canBeAttached(slot, result)) then
			Hotbar:removeItem(weapon, false)
			Hotbar:attachItem(result, slot.def.attachments[result:getAttachmentType()], W_slot, slot.def, false)
		end
	else	DebugSay (3,"Hotbar - N/A")
	end
end


--------------------------------------------------------------------------
--  CHECK IF ITEM IS MAGAZINE FOR COMPAT W/SORTING MODS			--
--------------------------------------------------------------------------
function isMagazine(item)
	if	(item:getDisplayCategory() == "GunMag") then
		DebugSay(3,"StandardCategory")
		return true
	elseif	(item:getDisplayCategory() == "FixedMag") then
		DebugSay(3,"StandardCategory")
		return true
	elseif	(item:getDisplayCategory() == "WepFAmmo_C") then
		DebugSay(3,"OnMineCategory")
		return true
	elseif	(item:getDisplayCategory() == "WepAmmoMag") then
		DebugSay(3,"BetterSortCategory")
		return true
	elseif	(item:getDisplayCategory() == "WepAmmoMagF") then
		DebugSay(3,"BetterSortCategory")
		return true
	else	return false
	end
end


----------------------------------------------------------------------------------
--  GET STOP-POWER RETURNS A VALUE BASED ON BULLET TYPE FOR VANILLA FUNCTIONS	--
--  NOT SURE WHAT FUNCTIONS THEY MIGHT BE, BUT HERE IT IS ANYWAYS		--
----------------------------------------------------------------------------------
function getStoppingPower(weapon)
	local	ammo = weapon:getAmmoType()
	local	value = 0

	if 	ammo == "Base.BB177" then		value = 0
	elseif 	ammo == "Base.Bullets22" then		value = 1
	elseif 	ammo == "Base.Bullets57" then		value = 4
	elseif	ammo == "Base.Bullets380" then		value = 3
	elseif	ammo == "Base.Bullets38" then		value = 5	-- Vanilla says 5
	elseif	ammo == "Base.Bullets9mm" then		value = 5	-- Vanilla says 5 Pistol1
	elseif	ammo == "Base.Bullets45" then		value = 7	-- Vanilla says 9 RevMed 7 1911
	elseif	ammo == "Base.Bullets357" then		value = 9
	elseif	ammo == "Base.Bullets45LC" then		value = 10
	elseif	ammo == "Base.Bullets44" then		value = 12	-- Vanilla says 12 RevLong 9 DE
	elseif	ammo == "Base.Bullets50MAG" then	value = 18
	elseif	ammo == "Base.Bullets4570" then		value = 20
	elseif	ammo == "Base.223Bullets" then		value = 6	-- Vanilla says 15 for Varmint
	elseif	ammo == "Base.556Bullets" then		value = 6	-- Vanilla says 2 for Assault2, 20 Hunting
	elseif	ammo == "Base.545x39Bullets" then	value = 7
	elseif	ammo == "Base.762x39Bullets" then	value = 8
	elseif	ammo == "Base.308Bullets" then		value = 10	-- Vanilla says 2 for Assault2
	elseif	ammo == "Base.762x51Bullets" then	value = 10
	elseif	ammo == "Base.762x54rBullets" then	value = 11
	elseif	ammo == "Base.3006Bullets" then		value = 12
	elseif	ammo == "Base.410gShotgunShells" then	value = 12
	elseif	ammo == "Base.20gShotgunShells" then	value = 16
	elseif	ammo == "Base.ShotgunShells" then	value = 20	-- Vanilla says 20/40 for Double
	elseif	ammo == "Base.10gShotgunShells" then	value = 24
	elseif	ammo == "Base.4gShotgunShells" then	value = 30
	elseif	ammo == "Base.50BMGBullets" then	value = 40
	end
	return	value
end


----------------------------------------------------------------------------------
--  GET RECOIL SHOCK RETURNS A VALUE BASED ON TYPE OF BULLET FIRED FOR VARIOUS	--
--  FUNCTIONS SUCH AS ATTACHMENT BREAKAGE.					--
----------------------------------------------------------------------------------
function getShockValue(weapon)
	local	ammo = weapon:getAmmoType()
	local	value = 0

	if 	ammo == "Base.BB177" then		value = 0
	elseif 	ammo == "Base.Bullets22" then		value = 1
	elseif 	ammo == "Base.Bullets57" then		value = 2
	elseif	ammo == "Base.Bullets380" then		value = 2
	elseif	ammo == "Base.Bullets38" then		value = 3
	elseif	ammo == "Base.Bullets9mm" then		value = 3
	elseif	ammo == "Base.Bullets45" then		value = 4
	elseif	ammo == "Base.Bullets357" then		value = 5
	elseif	ammo == "Base.Bullets45LC" then		value = 5.5
	elseif	ammo == "Base.Bullets44" then		value = 6
	elseif	ammo == "Base.Bullets50MAG" then	value = 6.3
	elseif	ammo == "Base.Bullets4570" then		value = 6.5
	elseif	ammo == "Base.223Bullets" then		value = 4
	elseif	ammo == "Base.556Bullets" then		value = 4
	elseif	ammo == "Base.545x39Bullets" then	value = 5
	elseif	ammo == "Base.762x39Bullets" then	value = 6
	elseif	ammo == "Base.308Bullets" then		value = 8
	elseif	ammo == "Base.762x51Bullets" then	value = 8
	elseif	ammo == "Base.762x54rBullets" then	value = 8
	elseif	ammo == "Base.3006Bullets" then		value = 8.5
	elseif	ammo == "Base.410gShotgunShells" then	value = 6.5
	elseif	ammo == "Base.20gShotgunShells" then	value = 7.5
	elseif	ammo == "Base.ShotgunShells" then	value = 8
	elseif	ammo == "Base.10gShotgunShells" then	value = 9
	elseif	ammo == "Base.4gShotgunShells" then	value = 10
	elseif	ammo == "Base.50BMGBullets" then	value = 10
	end
	return	value
end


----------------------------------------------------------------------------------
--  GET SUPPRESS FACTOR								--
----------------------------------------------------------------------------------
function getSuppressFactor(weapon)
	local 	canon = weapon:getCanon()
	local	ammo = weapon:getAmmoType()
	local	junk = 0
	local	value = 0

	if	(canon) then
		if	(string.find(canon:getType(), "Oil")) then junk = 0.1
		elseif	(string.find(canon:getType(), "Bottle")) then junk = 0.2
		end
	end

	if 	ammo == "Base.BB177" then		value = 0.35
	elseif 	ammo == "Base.Bullets22" then		value = 0.4
	elseif 	ammo == "Base.Bullets57" then		value = 0.4
	elseif	ammo == "Base.Bullets380" then		value = 0.41
	elseif	ammo == "Base.Bullets38" then		value = 0.42
	elseif	ammo == "Base.Bullets9mm" then		value = 0.42
	elseif	ammo == "Base.Bullets45" then		value = 0.44
	elseif	ammo == "Base.Bullets357" then		value = 0.44
	elseif	ammo == "Base.Bullets45LC" then		value = 0.45
	elseif	ammo == "Base.Bullets44" then		value = 0.45
	elseif	ammo == "Base.Bullets50MAG" then	value = 0.45
	elseif	ammo == "Base.Bullets4570" then		value = 0.45
	elseif	ammo == "Base.223Bullets" then		value = 0.4
	elseif	ammo == "Base.556Bullets" then		value = 0.4
	elseif	ammo == "Base.545x39Bullets" then	value = 0.4
	elseif	ammo == "Base.762x39Bullets" then	value = 0.4
	elseif	ammo == "Base.308Bullets" then		value = 0.4
	elseif	ammo == "Base.762x51Bullets" then	value = 0.4
	elseif	ammo == "Base.762x54rBullets" then	value = 0.4
	elseif	ammo == "Base.3006Bullets" then		value = 0.4
	elseif	ammo == "Base.410gShotgunShells" then	value = 0.4
	elseif	ammo == "Base.20gShotgunShells" then	value = 0.4
	elseif	ammo == "Base.ShotgunShells" then	value = 0.4
	elseif	ammo == "Base.10gShotgunShells" then	value = 0.4
	elseif	ammo == "Base.4gShotgunShells" then	value = 0.4
	elseif	ammo == "Base.50BMGBullets" then	value = 0.25
	end
	return	value + junk
end

----------------------------------------------------------------------------------
--  GET AMMO NAME INSTEAD OF ITEM NAME						--
----------------------------------------------------------------------------------
function getAmmoName(weapon)
	local	ammo = weapon:getAmmoType()
	local	value = "none"

	if 	ammo == "Base.BB177" then		value = ".177 bb"
	elseif 	ammo == "Base.Bullets22" then		value = ".22 lr"
	elseif 	ammo == "Base.Bullets57" then		value = "5.7x28mm"
	elseif	ammo == "Base.Bullets380" then		value = ".380 ACP"
	elseif	ammo == "Base.Bullets38" then		value = ".38 Spc"
	elseif	ammo == "Base.Bullets9mm" then		value = "9x19mm"
	elseif	ammo == "Base.Bullets45" then		value = ".45 ACP"
	elseif	ammo == "Base.Bullets357" then		value = ".357 Mag"
	elseif	ammo == "Base.Bullets45LC" then		value = ".45 LC"
	elseif	ammo == "Base.Bullets44" then		value = ".44 Mag"
	elseif	ammo == "Base.Bullets50MAG" then	value = ".50 Mag"
	elseif	ammo == "Base.Bullets4570" then		value = ".45-70 Gov"
	elseif	ammo == "Base.223Bullets" then		value = ".223 Rem"
	elseif	ammo == "Base.556Bullets" then		value = "5.56x45mm"
	elseif	ammo == "Base.545x39Bullets" then	value = "5.45x39mm"
	elseif	ammo == "Base.762x39Bullets" then	value = "7,62x39mm"
	elseif	ammo == "Base.308Bullets" then		value = ".308 Win"
	elseif	ammo == "Base.762x51Bullets" then	value = "7.62x51mm"
	elseif	ammo == "Base.762x54rBullets" then	value = "7.62x54mm R"
	elseif	ammo == "Base.3006Bullets" then		value = ".30-06 Spg"
	elseif	ammo == "Base.410gShotgunShells" then	value = "410g Shot"
	elseif	ammo == "Base.20gShotgunShells" then	value = "20g Shot"
	elseif	ammo == "Base.ShotgunShells" then	value = "12g Shot"
	elseif	ammo == "Base.10gShotgunShells" then	value = "10g Shot"
	elseif	ammo == "Base.4gShotgunShells" then	value = "4g Shot"
	elseif	ammo == "Base.50BMGBullets" then	value = ".50 BMG"
	elseif	ammo == "Base.40HERound" then		value = "HE-Round"
	elseif	ammo == "Base.40INCRound" then		value = "INC-Round"
	end
	return	value
end

----------------------------------------------------------------------------------
--  GET BURST SOUND								--
----------------------------------------------------------------------------------
function getShotSound(weapon,round)
	local	ammo = weapon:getAmmoType()
	local	value = nil

	if	round == nil then
		round = 1
	end

	if	(not isSuppressed(weapon)) then
		if	weapon:getFireMode() == "[6]Rotary" then
			if	ammo == "Base.556Bullets" then		value = "[6]Minigun_556"
			elseif	ammo == "Base.308Bullets" then		value = "[6]Minigun_308"
			elseif	ammo == "Base.50BMGBullets" then	value = "[6]Minigun_50"
			end
		elseif	round == 1 then
			if	ammo == "Base.FlameFuel" then		value = "Flame_Fire"
			elseif	ammo == "Base.WaterAmmo" then		value = "waterSplash"
			elseif 	ammo == "Base.BB177" then		value = "[1]Shot_BB177"
			elseif 	ammo == "Base.Bullets22" then		value = "[1]Shot_22"
			elseif 	ammo == "Base.Bullets57" then		value = "[1]Shot_57"
			elseif	ammo == "Base.Bullets380" then		value = "[1]Shot_380"
			elseif	ammo == "Base.Bullets38" then		value = "[1]Shot_38"
			elseif	ammo == "Base.Bullets9mm" then		value = "[1]Shot_9"
			elseif	ammo == "Base.Bullets45" then		value = "[1]Shot_45"
			elseif	ammo == "Base.Bullets357" then		value = "[1]Shot_357"
			elseif	ammo == "Base.Bullets45LC" then		value = "[1]Shot_45LC"
			elseif	ammo == "Base.Bullets44" then		value = "[1]Shot_44"
			elseif	ammo == "Base.Bullets50MAG" then	value = "[1]Shot_50MAG"
			elseif	ammo == "Base.Bullets4570" then		value = "[1]Shot_4570"
			elseif	ammo == "Base.223Bullets" then		value = "[1]Shot_556"
			elseif	ammo == "Base.556Bullets" then		value = "[1]Shot_556"
			elseif	ammo == "Base.545x39Bullets" then	value = "[1]Shot_545"
			elseif	ammo == "Base.762x39Bullets" then	value = "[1]Shot_762x39"
			elseif	ammo == "Base.308Bullets" then		value = "[1]Shot_308"
			elseif	ammo == "Base.762x51Bullets" then	value = "[1]Shot_308"
			elseif	ammo == "Base.762x54rBullets" then	value = "[1]Shot_762x54r"
			elseif	ammo == "Base.3006Bullets" then		value = "[1]Shot_3006"
			elseif	ammo == "Base.410gShotgunShells" then	value = "[1]Shot_410g"
			elseif	ammo == "Base.20gShotgunShells" then	value = "[1]Shot_20g"
			elseif	ammo == "Base.ShotgunShells" then	value = "[1]Shot_12g"
			elseif	ammo == "Base.10gShotgunShells" then	value = "[1]Shot_10g"
			elseif	ammo == "Base.4gShotgunShells" then	value = "[1]Shot_4g"
			elseif	ammo == "Base.50BMGBullets" then	value = "[1]Shot_50"
			elseif	ammo == "Base.40HERound" then		value = "[1]Shot_40mm"
			elseif	ammo == "Base.40INCRound" then		value = "[1]Shot_40mm"
			else						value = weapon:getScriptItem():getSwingSound()
			end
		elseif	round == 2 then
			if 	ammo == "Base.BB177" then		value = "[2]Burst_BB177"
			elseif 	ammo == "Base.Bullets22" then		value = "[2]Burst_22"
			elseif 	ammo == "Base.Bullets57" then		value = "[2]Burst_57"
			elseif	ammo == "Base.Bullets380" then		value = "[2]Burst_380"
			elseif	ammo == "Base.Bullets38" then		value = "[2]Burst_38"
			elseif	ammo == "Base.Bullets9mm" then		value = "[2]Burst_9"
			elseif	ammo == "Base.Bullets45" then		value = "[2]Burst_45"
			elseif	ammo == "Base.Bullets357" then		value = "[2]Burst_357"
			elseif	ammo == "Base.Bullets45LC" then		value = "[2]Burst_45LC"
			elseif	ammo == "Base.Bullets44" then		value = "[2]Burst_44"
			elseif	ammo == "Base.Bullets50MAG" then	value = "[2]Burst_50MAG"
			elseif	ammo == "Base.Bullets4570" then		value = "[2]Burst_4570"
			elseif	ammo == "Base.223Bullets" then		value = "[2]Burst_556"
			elseif	ammo == "Base.556Bullets" then		value = "[2]Burst_556"
			elseif	ammo == "Base.545x39Bullets" then	value = "[2]Burst_545"
			elseif	ammo == "Base.762x39Bullets" then	value = "[2]Burst_762x39"
			elseif	ammo == "Base.308Bullets" then		value = "[2]Burst_308"
			elseif	ammo == "Base.762x51Bullets" then	value = "[2]Burst_308"
			elseif	ammo == "Base.762x54rBullets" then	value = "[2]Burst_762x54r"
			elseif	ammo == "Base.3006Bullets" then		value = "[2]Burst_3006"
			elseif	ammo == "Base.410gShotgunShells" then	value = "[2]Burst_12"
			elseif	ammo == "Base.20gShotgunShells" then	value = "[2]Burst_12"
			elseif	ammo == "Base.ShotgunShells" then	value = "[2]Burst_12"
			elseif	ammo == "Base.10gShotgunShells" then	value = "[2]Burst_12"
			elseif	ammo == "Base.4gShotgunShells" then	value = "[2]Burst_12"
			elseif	ammo == "Base.50BMGBullets" then	value = "[2]Burst_50"
			elseif	ammo == "Base.40HERound" then		value = nil
			elseif	ammo == "Base.40INCRound" then		value = nil
			end
		elseif	round == 3 then
			if 	ammo == "Base.BB177" then		value = "[3]Burst_BB177"
			elseif 	ammo == "Base.Bullets22" then		value = "[3]Burst_22"
			elseif 	ammo == "Base.Bullets57" then		value = "[3]Burst_57"
			elseif	ammo == "Base.Bullets380" then		value = "[3]Burst_380"
			elseif	ammo == "Base.Bullets38" then		value = "[3]Burst_38"
			elseif	ammo == "Base.Bullets9mm" then		value = "[3]Burst_9"
			elseif	ammo == "Base.Bullets45" then		value = "[3]Burst_45"
			elseif	ammo == "Base.Bullets357" then		value = "[3]Burst_357"
			elseif	ammo == "Base.Bullets45LC" then		value = "[3]Burst_45LC"
			elseif	ammo == "Base.Bullets44" then		value = "[3]Burst_44"
			elseif	ammo == "Base.Bullets50MAG" then	value = "[3]Burst_50MAG"
			elseif	ammo == "Base.Bullets4570" then		value = "[3]Burst_4570"
			elseif	ammo == "Base.223Bullets" then		value = "[3]Burst_556"
			elseif	ammo == "Base.556Bullets" then		value = "[3]Burst_556"
			elseif	ammo == "Base.545x39Bullets" then	value = "[3]Burst_545"
			elseif	ammo == "Base.762x39Bullets" then	value = "[3]Burst_762x39"
			elseif	ammo == "Base.308Bullets" then		value = "[3]Burst_308"
			elseif	ammo == "Base.762x51Bullets" then	value = "[3]Burst_308"
			elseif	ammo == "Base.762x54rBullets" then	value = "[3]Burst_762x54r"
			elseif	ammo == "Base.3006Bullets" then		value = "[3]Burst_3006"
			elseif	ammo == "Base.410gShotgunShells" then	value = "[3]Burst_12"
			elseif	ammo == "Base.20gShotgunShells" then	value = "[3]Burst_12"
			elseif	ammo == "Base.ShotgunShells" then	value = "[3]Burst_12"
			elseif	ammo == "Base.10gShotgunShells" then	value = "[3]Burst_12"
			elseif	ammo == "Base.4gShotgunShells" then	value = "[3]Burst_12"
			elseif	ammo == "Base.50BMGBullets" then	value = "[3]Burst_50"
			elseif	ammo == "Base.40HERound" then		value = nil
			elseif	ammo == "Base.40INCRound" then		value = nil
			end
		elseif	round == 5 then
			if 	ammo == "Base.BB177" then		value = "[5]Burst_BB177"
			elseif 	ammo == "Base.Bullets22" then		value = "[5]Burst_22"
			elseif 	ammo == "Base.Bullets57" then		value = "[5]Burst_57"
			elseif	ammo == "Base.Bullets380" then		value = "[5]Burst_380"
			elseif	ammo == "Base.Bullets38" then		value = "[5]Burst_38"
			elseif	ammo == "Base.Bullets9mm" then		value = "[5]Burst_9"
			elseif	ammo == "Base.Bullets45" then		value = "[5]Burst_45"
			elseif	ammo == "Base.Bullets357" then		value = "[5]Burst_357"
			elseif	ammo == "Base.Bullets45LC" then		value = "[5]Burst_45LC"
			elseif	ammo == "Base.Bullets44" then		value = "[5]Burst_44"
			elseif	ammo == "Base.Bullets50MAG" then	value = "[5]Burst_50MAG"
			elseif	ammo == "Base.Bullets4570" then		value = "[5]Burst_4570"
			elseif	ammo == "Base.223Bullets" then		value = "[5]Burst_556"
			elseif	ammo == "Base.556Bullets" then		value = "[5]Burst_556"
			elseif	ammo == "Base.545x39Bullets" then	value = "[5]Burst_545"
			elseif	ammo == "Base.762x39Bullets" then	value = "[5]Burst_762x39"
			elseif	ammo == "Base.308Bullets" then		value = "[5]Burst_308"
			elseif	ammo == "Base.762x51Bullets" then	value = "[5]Burst_308"
			elseif	ammo == "Base.762x54rBullets" then	value = "[5]Burst_762x54r"
			elseif	ammo == "Base.3006Bullets" then		value = "[5]Burst_3006"
			elseif	ammo == "Base.410gShotgunShells" then	value = "[5]Burst_12"
			elseif	ammo == "Base.20gShotgunShells" then	value = "[5]Burst_12"
			elseif	ammo == "Base.ShotgunShells" then	value = "[5]Burst_12"
			elseif	ammo == "Base.10gShotgunShells" then	value = "[5]Burst_12"
			elseif	ammo == "Base.4gShotgunShells" then	value = "[5]Burst_12"
			elseif	ammo == "Base.50BMGBullets" then	value = "[5]Burst_50"
			elseif	ammo == "Base.40HERound" then		value = nil
			elseif	ammo == "Base.40INCRound" then		value = nil
			end
		end
	elseif	isSuppressed(weapon) then
		if	round == 1 then
			if 	ammo == "Base.BB177" then		value = "SD[1]Shot_BB177"
			elseif 	ammo == "Base.Bullets22" then		value = "SD[1]Shot_22"
			elseif 	ammo == "Base.Bullets57" then		value = "SD[1]Shot_57"
			elseif	ammo == "Base.Bullets380" then		value = "SD[1]Shot_380"
			elseif	ammo == "Base.Bullets38" then		value = "SD[1]Shot_38"
			elseif	ammo == "Base.Bullets9mm" then		value = "SD[1]Shot_9"
			elseif	ammo == "Base.Bullets45" then		value = "SD[1]Shot_45"
			elseif	ammo == "Base.Bullets357" then		value = "SD[1]Shot_357"
			elseif	ammo == "Base.Bullets45LC" then		value = "SD[1]Shot_45LC"
			elseif	ammo == "Base.Bullets44" then		value = "SD[1]Shot_44"
			elseif	ammo == "Base.Bullets50MAG" then	value = "SD[1]Shot_50MAG" -- copy of 3006
			elseif	ammo == "Base.Bullets4570" then		value = "SD[1]Shot_4570"
			elseif	ammo == "Base.223Bullets" then		value = "SD[1]Shot_556"
			elseif	ammo == "Base.556Bullets" then		value = "SD[1]Shot_556"
			elseif	ammo == "Base.545x39Bullets" then	value = "SD[1]Shot_545"
			elseif	ammo == "Base.762x39Bullets" then	value = "SD[1]Shot_762x39"
			elseif	ammo == "Base.308Bullets" then		value = "SD[1]Shot_308"
			elseif	ammo == "Base.762x51Bullets" then	value = "SD[1]Shot_308"
			elseif	ammo == "Base.762x54rBullets" then	value = "SD[1]Shot_762x54r"
			elseif	ammo == "Base.3006Bullets" then		value = "SD[1]Shot_3006"
			elseif	ammo == "Base.410gShotgunShells" then	value = "SD[1]Shot_12"
			elseif	ammo == "Base.20gShotgunShells" then	value = "SD[1]Shot_12"
			elseif	ammo == "Base.ShotgunShells" then	value = "SD[1]Shot_12"
			elseif	ammo == "Base.10gShotgunShells" then	value = "SD[1]Shot_12"
			elseif	ammo == "Base.4gShotgunShells" then	value = "SD[1]Shot_12"
			elseif	ammo == "Base.50BMGBullets" then	value = "SD[1]Shot_50"
			elseif	ammo == "Base.40HERound" then		value = nil
			elseif	ammo == "Base.40INCRound" then		value = nll
			end
		elseif	round == 2 then
			if 	ammo == "Base.BB177" then		value = "SD[2]Burst_BB177"
			elseif 	ammo == "Base.Bullets22" then		value = "SD[2]Burst_22"
			elseif 	ammo == "Base.Bullets57" then		value = "SD[2]Burst_57"
			elseif	ammo == "Base.Bullets380" then		value = "SD[2]Burst_380"
			elseif	ammo == "Base.Bullets38" then		value = "SD[2]Burst_38"
			elseif	ammo == "Base.Bullets9mm" then		value = "SD[2]Burst_9"
			elseif	ammo == "Base.Bullets45" then		value = "SD[2]Burst_45"
			elseif	ammo == "Base.Bullets357" then		value = "SD[2]Burst_357"
			elseif	ammo == "Base.Bullets45LC" then		value = "SD[2]Burst_45LC"
			elseif	ammo == "Base.Bullets44" then		value = "SD[2]Burst_44"
			elseif	ammo == "Base.Bullets50MAG" then	value = "SD[2]Burst_50MAG" -- copy of 3006
			elseif	ammo == "Base.Bullets4570" then		value = "SD[2]Burst_4570"
			elseif	ammo == "Base.223Bullets" then		value = "SD[2]Burst_556"
			elseif	ammo == "Base.556Bullets" then		value = "SD[2]Burst_556"
			elseif	ammo == "Base.545x39Bullets" then	value = "SD[2]Burst_545"
			elseif	ammo == "Base.762x39Bullets" then	value = "SD[2]Burst_762x39"
			elseif	ammo == "Base.308Bullets" then		value = "SD[2]Burst_308"
			elseif	ammo == "Base.762x51Bullets" then	value = "SD[2]Burst_308"
			elseif	ammo == "Base.762x54rBullets" then	value = "SD[2]Burst_762x54r"
			elseif	ammo == "Base.3006Bullets" then		value = "SD[2]Burst_3006"
			elseif	ammo == "Base.410gShotgunShells" then	value = "SD[2]Burst_12"
			elseif	ammo == "Base.20gShotgunShells" then	value = "SD[2]Burst_12"
			elseif	ammo == "Base.ShotgunShells" then	value = "SD[2]Burst_12"
			elseif	ammo == "Base.10gShotgunShells" then	value = "SD[2]Burst_12"
			elseif	ammo == "Base.4gShotgunShells" then	value = "SD[2]Burst_12"
			elseif	ammo == "Base.50BMGBullets" then	value = "SD[2]Burst_50"
			elseif	ammo == "Base.40HERound" then		value = nil
			elseif	ammo == "Base.40INCRound" then		value = nil
			end
		elseif round == 3 then
			if 	ammo == "Base.BB177" then		value = "SD[3]Burst_BB177"
			elseif 	ammo == "Base.Bullets22" then		value = "SD[3]Burst_22"
			elseif 	ammo == "Base.Bullets57" then		value = "SD[3]Burst_57"
			elseif	ammo == "Base.Bullets380" then		value = "SD[3]Burst_380"
			elseif	ammo == "Base.Bullets38" then		value = "SD[3]Burst_38"
			elseif	ammo == "Base.Bullets9mm" then		value = "SD[3]Burst_9"
			elseif	ammo == "Base.Bullets45" then		value = "SD[3]Burst_45"
			elseif	ammo == "Base.Bullets357" then		value = "SD[3]Burst_357"
			elseif	ammo == "Base.Bullets45LC" then		value = "SD[3]Burst_45LC"
			elseif	ammo == "Base.Bullets44" then		value = "SD[3]Burst_44"
			elseif	ammo == "Base.Bullets50MAG" then	value = "SD[3]Burst_50MAG" -- copy of 3006
			elseif	ammo == "Base.Bullets4570" then		value = "SD[3]Burst_4570"
			elseif	ammo == "Base.223Bullets" then		value = "SD[3]Burst_556"
			elseif	ammo == "Base.556Bullets" then		value = "SD[3]Burst_556"
			elseif	ammo == "Base.545x39Bullets" then	value = "SD[3]Burst_545"
			elseif	ammo == "Base.762x39Bullets" then	value = "SD[3]Burst_762x39"
			elseif	ammo == "Base.308Bullets" then		value = "SD[3]Burst_308"
			elseif	ammo == "Base.762x51Bullets" then	value = "SD[3]Burst_308"
			elseif	ammo == "Base.762x54rBullets" then	value = "SD[3]Burst_762x54r"
			elseif	ammo == "Base.3006Bullets" then		value = "SD[3]Burst_3006"
			elseif	ammo == "Base.410gShotgunShells" then	value = "SD[3]Burst_12"
			elseif	ammo == "Base.20gShotgunShells" then	value = "SD[3]Burst_12"
			elseif	ammo == "Base.ShotgunShells" then	value = "SD[3]Burst_12"
			elseif	ammo == "Base.10gShotgunShells" then	value = "SD[3]Burst_12"
			elseif	ammo == "Base.4gShotgunShells" then	value = "SD[3]Burst_12"
			elseif	ammo == "Base.50BMGBullets" then	value = "SD[3]Burst_50"
			elseif	ammo == "Base.40HERound" then		value = nil
			elseif	ammo == "Base.40INCRound" then		value = nil
			end
		elseif round == 5 then
			if 	ammo == "Base.BB177" then		value = "SD[5]Burst_BB177"
			elseif 	ammo == "Base.Bullets22" then		value = "SD[5]Burst_22"
			elseif 	ammo == "Base.Bullets57" then		value = "SD[5]Burst_57"
			elseif	ammo == "Base.Bullets380" then		value = "SD[5]Burst_380"
			elseif	ammo == "Base.Bullets38" then		value = "SD[5]Burst_38"
			elseif	ammo == "Base.Bullets9mm" then		value = "SD[5]Burst_9"
			elseif	ammo == "Base.Bullets45" then		value = "SD[5]Burst_45"
			elseif	ammo == "Base.Bullets357" then		value = "SD[5]Burst_357"
			elseif	ammo == "Base.Bullets45LC" then		value = "SD[5]Burst_45LC"
			elseif	ammo == "Base.Bullets44" then		value = "SD[5]Burst_44"
			elseif	ammo == "Base.Bullets50MAG" then	value = "SD[5]Burst_50MAG"
			elseif	ammo == "Base.Bullets4570" then		value = "SD[5]Burst_4570"
			elseif	ammo == "Base.223Bullets" then		value = "SD[5]Burst_556"
			elseif	ammo == "Base.556Bullets" then		value = "SD[5]Burst_556"
			elseif	ammo == "Base.545x39Bullets" then	value = "SD[5]Burst_545"
			elseif	ammo == "Base.762x39Bullets" then	value = "SD[5]Burst_762x39"
			elseif	ammo == "Base.308Bullets" then		value = "SD[5]Burst_308"
			elseif	ammo == "Base.762x51Bullets" then	value = "SD[5]Burst_308"
			elseif	ammo == "Base.762x54rBullets" then	value = "SD[5]Burst_762x54r"
			elseif	ammo == "Base.3006Bullets" then		value = "SD[5]Burst_3006"
			elseif	ammo == "Base.410gShotgunShells" then	value = "SD[5]Burst_12"
			elseif	ammo == "Base.20gShotgunShells" then	value = "SD[5]Burst_12"
			elseif	ammo == "Base.ShotgunShells" then	value = "SD[5]Burst_12"
			elseif	ammo == "Base.10gShotgunShells" then	value = "SD[5]Burst_12"
			elseif	ammo == "Base.4gShotgunShells" then	value = "SD[5]Burst_12"
			elseif	ammo == "Base.50BMGBullets" then	value = "SD[5]Burst_50"
			elseif	ammo == "Base.40HERound" then		value = nil
			elseif	ammo == "Base.40INCRound" then		value = nil
			end
		end
	end
	return	value
end

----------------------------------------------------------------------------------
--  CHECK FOR PIERCING AMMO							--
----------------------------------------------------------------------------------
function isAmmoPiercing(ammo)
	local	value = false

	if 	ammo == "Base.BB177" then		value = false
	elseif 	ammo == "Base.Bullets22" then		value = false
	elseif 	ammo == "Base.Bullets57" then		value = true
	elseif	ammo == "Base.Bullets380" then		value = false
	elseif	ammo == "Base.Bullets38" then		value = false
	elseif	ammo == "Base.Bullets9mm" then		value = false
	elseif	ammo == "Base.Bullets45" then		value = false
	elseif	ammo == "Base.Bullets357" then		value = false
	elseif	ammo == "Base.Bullets45LC" then		value = false
	elseif	ammo == "Base.Bullets44" then		value = false
	elseif	ammo == "Base.Bullets50MAG" then	value = true
	elseif	ammo == "Base.Bullets4570" then		value = true
	elseif	ammo == "Base.223Bullets" then		value = true
	elseif	ammo == "Base.556Bullets" then		value = true
	elseif	ammo == "Base.545x39Bullets" then	value = true
	elseif	ammo == "Base.762x39Bullets" then	value = true
	elseif	ammo == "Base.308Bullets" then		value = true
	elseif	ammo == "Base.762x51Bullets" then	value = true
	elseif	ammo == "Base.762x54rBullets" then	value = true
	elseif	ammo == "Base.3006Bullets" then		value = true
	elseif	ammo == "Base.410gShotgunShells" then	value = false
	elseif	ammo == "Base.20gShotgunShells" then	value = false
	elseif	ammo == "Base.ShotgunShells" then	value = false
	elseif	ammo == "Base.10gShotgunShells" then	value = false
	elseif	ammo == "Base.4gShotgunShells" then	value = false
	elseif	ammo == "Base.50BMGBullets" then	value = true
	end
	return	value
end

----------------------------------------------------------------------------------
--  GET LOADED WEIGHT UTILITY BECAUSE GETWEIGHT DOES NOT INCLUDE AMMO & MAG.	--
--  SINCE AIM-TIME, RECOIL, AND HIT-CHANCE IS HIGHLY INFLUENCED BY WEIGHT,	--
--  THIS MOD USES THIS WEIGHT FUNCTION INSTEAD... ARSENAL[26]			--
----------------------------------------------------------------------------------
function getLoadedWeight(weapon)
	local	weight 	= weapon:getWeight()
	local	clip	= weapon:getClip()
	local	magWT	= 0
	local	ammoWT	= 0
	local	ammo	= weapon:getAmmoType()
	local	ammoCT	= weapon:getCurrentAmmoCount()

	if clip then
		if	(string.find(clip:getType(), "Extended_Mag")) then
			mag	= weapon:getModData().ExtMagType
		elseif	(string.find(clip:getType(), "Drum_Mag")) then
			mag	= weapon:getModData().DrumMagType
		elseif	(string.find(clip:getType(), "Standard_Mag")) then
			mag	= weapon:getMagazineType()
		end
		if mag then
			TempMag = InventoryItemFactory.CreateItem(mag)
			magWT = TempMag:getWeight()
		end
	end

	if ammo then
		TempAmmo = InventoryItemFactory.CreateItem(ammo)
		ammoWT = ammoCT * TempAmmo:getWeight()
	end

	weight = weight + ammoWT + magWT
	return weight
end

--------------------------------------------------------------------------
--  MAGAZINE TOGGLE							--
--------------------------------------------------------------------------
local function FirearmMagazineToggle(keyNum)
	if getSpecificPlayer(0) == nil then return end			-- Good Lookin out go2008to

	local player	= getSpecificPlayer(0)
	local Gun	= player:getPrimaryHandItem()

	if (keyNum == 26) or (keyNum == 27) then 	-- '[' or ']'

		if	(Gun) and (instanceof(Gun,"HandWeapon")) and (Gun:isAimedFirearm()) then
			----------------------------------
			-- MAGAZINE TYPE		--
			----------------------------------
			local	result = InventoryItemFactory.CreateItem(Gun:getType());

			if (Gun:isContainsClip() == true) and (Gun:getMagazineType() ~= "Base.Fixed") then	-- FIRST PRESS EJECT IF NEEDED
			        ISTimedActionQueue.add(ISEjectMagazine:new(player, Gun))
			else
				local	Set	= Gun:getMagazineType()		-- WHAT IT IS NOW
				local	Std	= result:getMagazineType()	-- FRESH DEFAULT STD MAGTYPE SINCE RESULT IS SPAWNED
				local	Tog	= Gun:getMagazineType()		-- WHAT ITS TOGGLING TO
				local	Ext	= Gun:getModData().ExtMagType
				local	Drum	= Gun:getModData().DrumMagType

				if	(Ext == nil) and (Drum == nil) then
					DebugSay(2,"No Alt Mags")

				else	Sound = player:getEmitter():playSound("drawCard")

				--	======= TRANSFER CONDITION & MODE ======
					result:setCondition(Gun:getCondition());
					result:setFireMode(Gun:getFireMode());

					if	(Set == Std) then					-- USING STANDARD
						if	(Ext) and (keyNum == 27) then	Tog = Ext	-- TOGGLE TO EXT
						elseif	(Drum) and (keyNum == 26) then	Tog = Drum	-- TOGGLE TO DRUM
						end
					elseif	(Set == Ext) then					-- USING EXTENDED
						if	(Drum) and (keyNum == 27) then	Tog = Drum	-- TOGGLE TO DRUM
						elseif	(Std) and (keyNum == 26) then	Tog = Std	-- TOGGLE TO STD
						end
					elseif	(Set == Drum) then					-- USING DRUM
						if	(Std) and (keyNum == 27) then	Tog = Std	-- TOGGLE TO STD
						elseif	(Ext) and (keyNum == 26) then	Tog = Ext	-- TOGGLE TO EXT
						end
					end

					if Tog then
						TempPart = InventoryItemFactory.CreateItem(Tog);	-- JUST TO GET MAXAMMO
						result:setMagazineType(Tog)
						result:setMaxAmmo(TempPart:getMaxAmmo())
						DebugSay(1,"Use "..tostring(TempPart:getDisplayName()))
					end
				
					result:setCurrentAmmoCount(Gun:getCurrentAmmoCount());

					if	Gun:isRoundChambered() == true then
						result:setRoundChambered(true);
					end

					if	Gun:getModData().Trajectory ~= nil then
						result:getModData().Trajectory = Gun:getModData().Trajectory
					end

				--	====== TRANSFER WEAPON ATTACHMENTS SO THEY DO NOT AFFECT MELEE VERSION
					if 	(result:isAimedFirearm() and Gun:isAimedFirearm()) then		-- [GUN to GUN] LEAVE THIS ALONE
						result:attachWeaponPart(Gun:getWeaponPart("Scope"))
						result:attachWeaponPart(Gun:getWeaponPart("Canon"))
					--	result:attachWeaponPart(Gun:getWeaponPart("Clip"))
						result:attachWeaponPart(Gun:getWeaponPart("Stock"))
						result:attachWeaponPart(Gun:getWeaponPart("Sling"))
						result:attachWeaponPart(Gun:getWeaponPart("RecoilPad"))
					end

				-- 	[IF GUN HAS LAUNCHER FROM GUN TO MELEE MODE] SAVE ATTACHMENT TO ModData.TempXXX

					if 	( (sling) and (string.find(sling:getType(), "Launcher")) and (not isLauncher(Gun)) ) or
						( (Integral) and (Integral == "Launcher") and (not isLauncher(Gun)) ) then
						result:getModData().TempFireMode		= (Gun:getModData().TempFireMode)	-- M203 SET TEMP for M16 SwitchBack
						result:getModData().TempContainsClip		= (Gun:getModData().TempContainsClip)
						result:getModData().TempRoundChambered		= (Gun:getModData().TempRoundChambered)
						result:getModData().TempCurrentAmmoCount	= (Gun:getModData().TempCurrentAmmoCount)
						result:getModData().TempAmmoType		= (Gun:getModData().TempAmmoType)
					end

					player:getInventory():AddItem(result);
					checkHotbar(Gun, result)				-- CHECK HOTBAR
					local inv = player:getInventory()
					inv:DoRemoveItem(Gun);

					if (instanceof(result,"HandWeapon")) then
						player:setPrimaryHandItem(result) 
						if(result:isRequiresEquippedBothHands() or result:isTwoHandWeapon()) then
							player:setSecondaryHandItem(result)
						else	player:setSecondaryHandItem(nil)
						end
					end
				end
			end

		elseif	(Gun) and (instanceof(Gun,"HandWeapon")) then	-- MELEE WEAPON W/MULTI GRIP
			----------------------------------
			-- MELEE GRIP			--
			----------------------------------
			local	grip	= nil
			local 	Spear	= Gun:getModData().SpearGrip	-- MUST BE Base.XXX
			local 	Close	= Gun:getModData().CloseGrip
			local 	Wide	= Gun:getModData().WideGrip

			if	(keyNum == 26) then
				if	(Spear == nil) and (Wide) then grip = Wide
				elseif	(Close == nil) and (Spear) then grip = Spear
				elseif	(Wide == nil)  and (Close) then grip = Close
				end
			elseif	(keyNum == 27) then
				if	(Spear == nil) and (Close) then grip = Close
				elseif	(Close == nil) and (Wide) then grip = Wide
				elseif	(Wide == nil) and (Spear) then grip = Spear
				end
			else	grip = Gun:getType()	-- ERROR
			end

			if	grip == nil then	-- SHOULD NEVER HAPPEN SINCE ORIGINAL IS LAST CHOICE ABOVE
				DebugSay(2,"No Alt Grip")

			else	Sound = player:getEmitter():playSound("batswing")
				local result = InventoryItemFactory.CreateItem(grip);
				player:getInventory():AddItem(result);

			--	======= TRANSFER CONDITION & MODE ======
				result:setCondition(Gun:getCondition());

				player:getInventory():AddItem(result);
				checkHotbar(Gun, result)				-- CHECK HOTBAR
				local inv = player:getInventory()
				inv:DoRemoveItem(Gun);

				if (instanceof(result,"HandWeapon")) then
					player:setPrimaryHandItem(result)
					if(result:isRequiresEquippedBothHands() or result:isTwoHandWeapon()) then
						player:setSecondaryHandItem(result)
					else	player:setSecondaryHandItem(nil)
					end
				end
			end
		else	DebugSay(2,"Not Weapon")
		end

	elseif (keyNum == 51) or (keyNum == 52) then	-- [<] or [>]
		----------------------------------
		-- GRENADE TYPE			--
		----------------------------------
		if (Gun) and (instanceof(Gun,"HandWeapon")) and (Gun:isAimedFirearm()) then
			local sling	= Gun:getSling()
			local Melee	= Gun:getModData().Melee
			local Integral	= Gun:getModData().Integral
			if 	( (sling) and (string.find(sling:getType(), "Launcher")) and (not isLauncher(Gun)) ) or
				( (Integral) and (Integral == "Launcher") and (not isLauncher(Gun)) ) then

			        Sound = player:getEmitter():playSound("stormyRifleInsertRound")
			--	DebugSay(3,"Has Launcher")

			--	if (string.find(Gun:getType(), "Melee")) then		-- NOT SURE TO RESTRICT FROM MELEE OR NOT
			--		DebugSay(3,"From Melee Mode")
			--	end

				local HEMode = Gun:getModData().HEMode
				local INCMode = Gun:getModData().INCMode
				local launcher = nil

				if	Gun:getModData().TempContainsClip == true then		-- ALL LAUNCHER SHOULD USE THIS METHOD
					DebugSay(3,"Contains Clip")
					if 	Gun:getModData().TempAmmoType == 1 then
						DebugSay(3,"40HE - Code 1")
						launcher = HEMode
						DebugSay(2,"Launcher HE Mode")
					elseif	Gun:getModData().TempAmmoType == 2 then
						DebugSay(3,"40INC - Code 2")
						launcher = INCMode
						DebugSay(2,"Launcher INC Mode")
					else	DebugSay(3,"No Code")
						launcher = HEMode
						DebugSay(2,"Launcher HE Mode - Default")
					end
				elseif	(keyNum == 51) and (HEMode ~= nil) then
					launcher = HEMode
					DebugSay(2,"Launcher HE Mode")
				elseif	(keyNum == 52) and (INCMode ~= nil) then
					launcher = INCMode
					DebugSay(2,"Launcher INC Mode")
				end

				local result = InventoryItemFactory.CreateItem(launcher);

			--	======= TRANSFER CONDITION & MODE & CERTAIN ATTACHMENTS THAT SHARE BENEFIT ======
				result:setCondition(Gun:getCondition());

				result:attachWeaponPart(Gun:getWeaponPart("Canon"))		-- TEST NEW SYSTEM
				result:attachWeaponPart(Gun:getWeaponPart("Scope"))		-- TEST NEW SYSTEM
				result:attachWeaponPart(Gun:getWeaponPart("Stock"))		-- UNCOMMENT BELOW TO IGNORE 
				result:attachWeaponPart(Gun:getWeaponPart("Sling"))
				result:attachWeaponPart(Gun:getWeaponPart("Clip"))
				result:attachWeaponPart(Gun:getWeaponPart("RecoilPad"))

			-- 	[GUN to LAUNCHER] SAVE ATTACHMENT TO ModData.TempXXX
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
				if	(Gun:getModData().Trajectory) ~= nil then
					result:getModData().Trajectory = Gun:getModData().Trajectory
					DebugSay(3,"Trajectory - "..tostring(result:getModData().Trajectory))
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

				player:getInventory():AddItem(result);
				checkHotbar(Gun, result)				-- CHECK HOTBAR
				local inv = player:getInventory()
				inv:DoRemoveItem(Gun);

				if (instanceof(result,"HandWeapon")) then
					player:setPrimaryHandItem(result)
					if(result:isRequiresEquippedBothHands() or result:isTwoHandWeapon()) then
						player:setSecondaryHandItem(result)
					else	player:setSecondaryHandItem(nil)
					end
				end
			else	----------------------------------
				-- COMPATIBLE AMMO		--
				----------------------------------
				local comp	= Gun:getModData().CompAmmo
				local Integral	= Gun:getModData().Integral

				if 	(comp) and (Gun:isContainsClip() == true) and (Gun:getMagazineType() ~= "Base.Fixed") then	-- FIRST PRESS EJECT IF NEEDED
				        ISTimedActionQueue.add(ISEjectMagazine:new(player, Gun))
					DebugSay(2,"Unload Current AmmoType Magazine")
				elseif	(comp) and (Gun:isRoundChambered() == true or Gun:getCurrentAmmoCount() > 0) then		-- FIRST UNLOAD OTHER AMMO
				--	ISTimedActionQueue.add(ISEjectMagazine:new(player, Gun))
					DebugSay(2,"Unload Current AmmoType Rounds")
				elseif	(comp ~= nil) then
				        Sound = player:getEmitter():playSound("drawCard")
					local result = InventoryItemFactory.CreateItem(comp);

					DebugSay(2,"Using "..getAmmoName(result))

				--	======= TRANSFER CONDITION & MODE ======
					result:setCondition(Gun:getCondition());
					result:setFireMode(Gun:getFireMode());

				--	====== TRANSFER WEAPON ATTACHMENTS SO THEY DO NOT AFFECT MELEE VERSION
					if 	(result:isAimedFirearm() and Gun:isAimedFirearm()) then		-- [GUN to GUN] LEAVE THIS ALONE
						result:attachWeaponPart(Gun:getWeaponPart("Scope"))
						result:attachWeaponPart(Gun:getWeaponPart("Canon"))
						result:attachWeaponPart(Gun:getWeaponPart("Clip"))
						result:attachWeaponPart(Gun:getWeaponPart("Stock"))
						result:attachWeaponPart(Gun:getWeaponPart("Sling"))
						result:attachWeaponPart(Gun:getWeaponPart("RecoilPad"))
					end

				-- 	[IF GUN HAS LAUNCHER FROM GUN TO MELEE MODE] SAVE ATTACHMENT TO ModData.TempXXX
					if 	( (sling) and (string.find(sling:getType(), "Launcher")) and (isLauncher(Gun)) ) or
						( (Integral) and (Integral == "Launcher") and (isLauncher(Gun)) ) then
						result:getModData().TempFireMode		= (Gun:getModData().TempFireMode)	-- M203 SET TEMP for M16 SwitchBack
						result:getModData().TempContainsClip		= (Gun:getModData().TempContainsClip)
						result:getModData().TempRoundChambered		= (Gun:getModData().TempRoundChambered)
						result:getModData().TempCurrentAmmoCount	= (Gun:getModData().TempCurrentAmmoCount)
						result:getModData().TempAmmoType		= (Gun:getModData().TempAmmoType)
					end

					if	Gun:getModData().Trajectory ~= nil then
						result:getModData().Trajectory = Gun:getModData().Trajectory
					end

					player:getInventory():AddItem(result);
					checkHotbar(Gun, result)				-- CHECK HOTBAR
					local inv = player:getInventory()
					inv:DoRemoveItem(Gun);

					if (instanceof(result,"HandWeapon")) then
						player:setPrimaryHandItem(result) 
						if(result:isRequiresEquippedBothHands() or result:isTwoHandWeapon()) then
							player:setSecondaryHandItem(result)
						else	player:setSecondaryHandItem(nil)
						end
					end
				else	DebugSay(2,"No Alt Ammo")
				end
			end
		else	DebugSay(2,"Not Firearm")
		end
--	elseif (keyNum == 33) or (keyNum == 34) then	-- [PGUP] or [PGDN]	DONT WORK
--	elseif (keyNum == 39) or (keyNum == 40) then	-- [;] or [']		WORKS BUT CLUTTERED
--	elseif (keyNum == 189) or (keyNum == 187) then	-- [-] or [+]		DONT WORK
	elseif (keyNum == 12) or (keyNum == 13) then	-- [-] or [+]
		----------------------------------
		-- GRENADE TRAJECTORY		--
		----------------------------------
		if	(Gun) and (isFlamer(Gun) or isLauncher(Gun)) and
			(not string.find(Gun:getType(), "WD_Flame")) then	-- EXCLUDE IMPROVISED WD_FLAME

			if	(keyNum == 12) then	-- [-]
				if	(Gun:getModData().Trajectory == "Short") then
					Gun:getModData().Trajectory = "Long"
					DebugSay(1,"Long")
				elseif	(Gun:getModData().Trajectory == "Medium") then
					Gun:getModData().Trajectory = "Short"
					DebugSay(1,"Short")
				elseif	(Gun:getModData().Trajectory == "Long") then
					Gun:getModData().Trajectory = "Medium"
					DebugSay(1,"Medium")
				else	Gun:getModData().Trajectory = "Medium"
				end
			elseif	(keyNum == 13) then	-- [+]
				if	(Gun:getModData().Trajectory == "Short") then
					Gun:getModData().Trajectory = "Medium"
					DebugSay(1,"Medium")
				elseif	(Gun:getModData().Trajectory == "Medium") then
					Gun:getModData().Trajectory = "Long"
					DebugSay(1,"Long")
				elseif	(Gun:getModData().Trajectory == "Long") then
					Gun:getModData().Trajectory = "Short"
					DebugSay(1,"Short")
				else	Gun:getModData().Trajectory = "Medium"
				end
			end
		----------------------------------
		-- FORCE CQB MODE		--
		----------------------------------
		elseif	(Gun) and (instanceof(Gun,"HandWeapon")) and (Gun:isAimedFirearm()) then
			local scriptItem	= Gun:getScriptItem()
			local baseRange		= scriptItem:getMaxRange()
			local aim		= player:getPerkLevel(Perks.FromString("Aiming"))
			local gunPerk		= Gun:getAimingPerkRangeModifier()
			local extra		= aim * gunPerk / 2.5
			local lvlRange		= baseRange + extra
			local set		= baseRange - (lvlRange - 10)

		--	ADJUSTABLE SCOPE SECTION
		--	local scope		= Gun:getScope()
		--	if	(scope) then
		--		max		= scope:getMaxRange()
		--	end

			if	(keyNum == 12) then	-- [-]
				if	(Gun:getModData().Trajectory ~= "CQB") and (lvlRange > 10) then
					Gun:getModData().Trajectory = "CQB"
					DebugSay(1,"CQB [ON]")
					Gun:setMaxRange(set)
					Gun:getModData().CQB	= lvlRange - 10
				else	DebugSay(1,"CQB [N/A]")
				end
			elseif	(keyNum == 13) then	-- [+]
				if	(Gun:getModData().Trajectory == "CQB") then
					Gun:getModData().Trajectory = nil
					Gun:setMaxRange(baseRange)
					DebugSay(1,"CQB [OFF]")
					Gun:getModData().CQB	= nil
				end
			end			
		end
	end
end

--------------------------------------------------------------------------
--  ALTERNATE LOADING METHOD TOGGLE					--
--------------------------------------------------------------------------
local function WeaponAltLoadToggle(keyNum)

	if getSpecificPlayer(0) == nil then return end			-- Good Lookin out go2008to

	local player	= getSpecificPlayer(0)
	local Gun	= player:getPrimaryHandItem()

	if (keyNum == 43) then	-- [\]
		----------------------------------
		-- ALTERNATE LOADING		--
		----------------------------------
		if (Gun) and (instanceof(Gun,"HandWeapon")) and (Gun:isAimedFirearm()) then

			local 	Clip	= Gun:getModData().ClipType
			local 	Mag	= Gun:getModData().MagType

			if	(Clip == nil) or (Mag == nil) or (Mag == "Base.SKSFixedBox") then	-- Preclude Fixed mag SKS
				DebugSay(2,"No Alt-load Mode")

			else	Sound = player:getEmitter():playSound("drawCard")

				local result = InventoryItemFactory.CreateItem(Gun:getType());

			--	======= TOGGLE MAGAZINE TYPE ======
				if	Gun:isContainsClip() == true and (Gun:getMagazineType() == Gun:getModData().MagType or Gun:getMagazineType() == nil) then
					result:setMagazineType(Gun:getModData().ClipType)
					DebugSay(2,"Use Clip")
				--	result:setContainsClip(false)		-- PREVENT EJECTING STRIPPER CLIP... LOST MAG WHEN USE BAYO
				elseif	Gun:getMagazineType() == Gun:getModData().ClipType then
					result:setMagazineType(Gun:getModData().MagType)
					DebugSay(2,"Use Mag")
				--	result:setContainsClip(true)
				elseif	Gun:getMagazineType() == Gun:getModData().DrumMagType then
					DebugSay(2,"No Alt-Load Drum")
				else 	DebugSay(2,"Req Mag")		-- NEED CONFIRM FOR TOGGLE NOT DEBUG
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

				player:getInventory():AddItem(result);
				checkHotbar(Gun, result)				-- CHECK HOTBAR
				local inv = player:getInventory()
				inv:DoRemoveItem(Gun);

				if (instanceof(result,"HandWeapon")) then
					player:setPrimaryHandItem(result) 
					if(result:isRequiresEquippedBothHands() or result:isTwoHandWeapon()) then
						player:setSecondaryHandItem(result)
					else	player:setSecondaryHandItem(nil)
					end
				end
			end
		else	DebugSay(2,"Not Firearm")
		end

	elseif (keyNum == 53) then	-- [?]
		----------------------------------
		-- FOLDING STOCK		--
		----------------------------------
		local tog	= nil

		if (Gun) and (instanceof(Gun,"HandWeapon")) and (Gun:isAimedFirearm()) then

			local fold	= Gun:getModData().Fold

			if	fold ~= nil then

			        Sound = player:getEmitter():playSound("stormyRifleInsertRound")
				tog = fold

				if	(string.find(Gun:getType(), "Fold")) or (string.find(tog, "Stock")) then	-- SOME ITEM NAMES ARE NOT FORMATTED
					DebugSay(2,"Deploy Stock")
				elseif	(string.find(Gun:getType(), "Stock")) or (string.find(tog, "Fold")) then
					DebugSay(2,"Fold Stock")
				end

				local result = InventoryItemFactory.CreateItem(tog);
				player:getInventory():AddItem(result);

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
					DebugSay(3,"...")
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

			-- 	[IF GUN HAS LAUNCHER FROM GUN TO MELEE MODE] SAVE ATTACHMENT TO ModData.TempXXX
				local sling = Gun:getSling()
				if 	( (sling) and (string.find(sling:getType(), "Launcher")) and (not isLauncher(Gun)) ) or
					( (Integral) and (Integral == "Launcher") and (not isLauncher(Gun)) ) then
					result:getModData().TempFireMode		= (Gun:getModData().TempFireMode)	-- M203 SET TEMP for M16 SwitchBack
					result:getModData().TempContainsClip		= (Gun:getModData().TempContainsClip)
					result:getModData().TempRoundChambered		= (Gun:getModData().TempRoundChambered)
					result:getModData().TempCurrentAmmoCount	= (Gun:getModData().TempCurrentAmmoCount)
					result:getModData().TempAmmoType		= (Gun:getModData().TempAmmoType)
				end

				if (instanceof(result,"HandWeapon")) then	-- REMOVE isAimedFirearm() for BAYO (Mele)
					player:setPrimaryHandItem(result) 
					if(result:isRequiresEquippedBothHands() or result:isTwoHandWeapon()) then
						player:setSecondaryHandItem(result)
					else	player:setSecondaryHandItem(nil)
					end

				checkHotbar(Gun, result)				-- CHECK HOTBAR
				local inv = player:getInventory()
				inv:DoRemoveItem(Gun);

				end
			else	DebugSay(2,"No Folding Stock")
			end
		else	DebugSay(2,"Not Firearm")
		end
	end
end


--------------------------------------------------------------------------
--  SELECTFIRE HOTKEY							--
--------------------------------------------------------------------------
local function WeaponSelectFire(keyNum)

	if getSpecificPlayer(0) == nil then return end			-- Good Lookin out go2008to

	if (keyNum == 14) then				-- [BACKSPACE] key
		local player	= getSpecificPlayer(0)
		local Gun	= player:getPrimaryHandItem()
		local auto	= nil
		local single	= nil
		local burst2	= nil
		local burst3	= nil
		local set	= nil
		local setMsg	= nil

		if (Gun) and (instanceof(Gun,"HandWeapon")) and (Gun:isAimedFirearm()) then
			local mode	= Gun:getFireMode()
			if Gun:getFireModePossibilities() then
				for i=0, Gun:getFireModePossibilities():size() - 1 do
					local firemode = Gun:getFireModePossibilities():get(i);
					if firemode == "Auto" then
						auto = firemode
					elseif firemode == "Single" then
						single = firemode
					elseif firemode == "[2]Burst" then
						burst2 = firemode
					elseif firemode == "[3]Burst" then
						burst3 = firemode
					end
				end

				----------------------------------
				--	TOGGLE ORDER		--
				--	SINGLE BURST AUTO	--
				----------------------------------
				if	(mode == single) and (burst2) then
					set = burst2
					setMsg = "--"
				elseif	(mode == single) and (burst3) then
					set = burst3
					setMsg = "---"
				elseif	(mode == single) and (auto) then
					set = auto
					setMsg = "----"

				elseif	(mode == burst2) and (burst3) then
					set = burst3
					setMsg = "---"
				elseif	(mode == burst2) and (auto) then
					set = auto
					setMsg = "----"
				elseif	(mode == burst2) and (single) then
					set = single
					setMsg = "-"

				elseif	(mode == burst3) and (auto) then
					set = auto
					setMsg = "----"
				elseif	(mode == burst3) and (single) then
					set = single
					setMsg = "-"
				elseif	(mode == burst3) and (burst2) then
					set = burst2
					setMsg = "--"

				elseif	(mode == auto) and (single) then
					set = single
					setMsg = "-"
				elseif	(mode == auto) and (burst2) then
					set = burst2
					setMsg = "--"
				elseif	(mode == auto) and (burst3) then
					set = burst3
					setMsg = "---"
				end

				if set ~= nil then
					Gun:setFireMode(set)
					player:playSound("weaponLight");
					DebugSay(2,setMsg)
				end
			else	DebugSay(2,"No Select Fire")
			end
		else	DebugSay(2,"No Gun")
		end
	end
end

--------------------------------------------------------------------------
--  FAKE SWITCHER JUST A RELOADER TO GET SCRIPT VERSION			--
--------------------------------------------------------------------------
local function WeaponReloadScript(keyNum)

	if getSpecificPlayer(0) == nil then return end			-- Good Lookin out go2008to

	if (keyNum == 44) then
		local player	= getSpecificPlayer(0)
		local Gun	= player:getPrimaryHandItem()

		if (Gun) and (instanceof(Gun,"HandWeapon")) and (Gun:isAimedFirearm()) then
			local clone	= Gun:getType()
			local result = InventoryItemFactory.CreateItem(clone);
			player:getInventory():AddItem(result);

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
				DebugSay(3,"...")
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

		-- 	[IF GUN HAS LAUNCHER FROM GUN TO MELEE MODE] SAVE ATTACHMENT TO ModData.TempXXX
			local sling = Gun:getSling()
			if 	( (sling) and (string.find(sling:getType(), "Launcher")) and (not isLauncher(Gun)) ) or
				( (Integral) and (Integral == "Launcher") and (not isLauncher(Gun)) ) then
				result:getModData().TempFireMode		= (Gun:getModData().TempFireMode)	-- M203 SET TEMP for M16 SwitchBack
				result:getModData().TempContainsClip		= (Gun:getModData().TempContainsClip)
				result:getModData().TempRoundChambered		= (Gun:getModData().TempRoundChambered)
				result:getModData().TempCurrentAmmoCount	= (Gun:getModData().TempCurrentAmmoCount)
				result:getModData().TempAmmoType		= (Gun:getModData().TempAmmoType)
			end

			result:setSwingSound(sound)

			if (instanceof(result,"HandWeapon")) then	-- REMOVE isAimedFirearm() for BAYO (Mele)
				player:setPrimaryHandItem(result) 
				if(result:isRequiresEquippedBothHands() or result:isTwoHandWeapon()) then
					player:setSecondaryHandItem(result)
				else	player:setSecondaryHandItem(nil)
				end

			checkHotbar(Gun, result)				-- CHECK HOTBAR
			local inv = player:getInventory()
			inv:DoRemoveItem(Gun);
			end
		end
	end
end

--------------------------------------------------------------------------
--  MELEE MODE TOGGLE							--
--------------------------------------------------------------------------
local function WeaponMeleeToggle(keyNum)

	if getSpecificPlayer(0) == nil then return end			-- Good Lookin out go2008to

	if (keyNum == 50) then	-- [M]

		local tog	= nil
		local player	= getSpecificPlayer(0)
		local Gun	= player:getPrimaryHandItem()

		if (Gun) and (instanceof(Gun,"HandWeapon")) and (Gun:isAimedFirearm()) then
			local Melee	= Gun:getModData().Melee
			local Integral	= Gun:getModData().Integral
			local sling	= Gun:getSling()
			if 	( (sling) and (string.find(sling:getType(), "Launcher")) and (isLauncher(Gun)) ) or
				( (Integral) and (Integral == "Launcher") and (isLauncher(Gun)) ) then	-- EXIT LAUNCHER MODE
			        Sound = player:getEmitter():playSound("stormyRifleInsertRound")
				DebugSay(3,"EXIT Launcher Mode")

			--	if (string.find(Gun:getType(), "Melee")) then		-- NOT SURE TO RESTRICT FROM MELEE OR NOT
			--		DebugSay(3,"From Melee Mode")
			--	end

				if	Melee ~= nil then
					tog = Melee
				end

				if	tog == nil then
					DebugSay(2,"No Melee Mode")
				end

				local result = InventoryItemFactory.CreateItem(tog);

			--	======= TRANSFER CONDITION & MODE & CERTAIN ATTACHMENTS THAT SHARE BENEFIT ======
				result:setCondition(Gun:getCondition());

				result:attachWeaponPart(Gun:getWeaponPart("Canon"))		-- TEST NEW SYSTEM
				result:attachWeaponPart(Gun:getWeaponPart("Scope"))		-- TEST NEW SYSTEM
				result:attachWeaponPart(Gun:getWeaponPart("Stock"))		-- UNCOMMENT BELOW TO IGNORE 
				result:attachWeaponPart(Gun:getWeaponPart("Sling"))
				result:attachWeaponPart(Gun:getWeaponPart("Clip"))
				result:attachWeaponPart(Gun:getWeaponPart("RecoilPad"))

			-- AMMO TYPE DATA
				result:getModData().TempFireMode		= (Gun:getFireMode())		-- M16 SET TEMP for M203 Switchback
				result:getModData().TempContainsClip		= (Gun:isContainsClip())	
				result:getModData().TempRoundChambered		= (Gun:isRoundChambered())	
				result:getModData().TempCurrentAmmoCount	= (Gun:getCurrentAmmoCount())
				result:getModData().TempAmmoType		= (Gun:getModData().TempAmmoType)

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
				if	(Gun:getModData().Trajectory) ~= nil then
					result:getModData().Trajectory = Gun:getModData().Trajectory
					DebugSay(3,"Trajectory - "..tostring(result:getModData().Trajectory))
				end

				if 	(Gun:getCurrentAmmoCount() > 0) or (Gun:isContainsClip() == true) then						-- STORE GRENADE TYPE IN M16 TEMP
					if	Gun:getAmmoType() == "Base.40HERound" then			-- USE AMMOTYPE INSTEAD
						result:getModData().TempAmmoType	= 1			-- INCENDIARY
					else	result:getModData().TempAmmoType	= 2			-- EXPLOSIVE
					end
				end

				player:getInventory():AddItem(result);
				checkHotbar(Gun, result)				-- CHECK HOTBAR
				local inv = player:getInventory()
				inv:DoRemoveItem(Gun);

				if (instanceof(result,"HandWeapon")) then						-- REMOVE isAimedFirearm() for BAYO (Mele)
					player:setPrimaryHandItem(result) 
					if(result:isRequiresEquippedBothHands() or result:isTwoHandWeapon()) then
						player:setSecondaryHandItem(result)
					else	player:setSecondaryHandItem(nil)
					end
				end

			elseif 	(isLauncher(Gun)) and
				(not string.find(Gun:getType(), "M72_LAW")) and		-- NOT STAND ALONE
				(not string.find(Gun:getType(), "EX41")) and
				(not string.find(Gun:getType(), "Federal")) and
				(not string.find(Gun:getType(), "GM94")) and
				(not string.find(Gun:getType(), "M32")) and		-- EXIT LAUNCHER MODE FOR UNINSTALLED LAUNCHER BUG
				(not string.find(Gun:getType(), "Soaker")) and
				(not string.find(Gun:getType(), "M2A1")) then

			        Sound = player:getEmitter():playSound("stormyRifleInsertRound")
				DebugSay(3,"EXIT Launcher Mode")

				if	Melee ~= nil then
					tog = Melee
				end

				if	tog == nil then
					DebugSay(2,"No Melee Mode")
				end

				local result = InventoryItemFactory.CreateItem(tog);

			--	======= TRANSFER CONDITION & MODE & CERTAIN ATTACHMENTS THAT SHARE BENEFIT ======
				result:setCondition(Gun:getCondition());

				result:attachWeaponPart(Gun:getWeaponPart("Canon"))		-- TEST NEW SYSTEM
				result:attachWeaponPart(Gun:getWeaponPart("Scope"))		-- TEST NEW SYSTEM
				result:attachWeaponPart(Gun:getWeaponPart("Stock"))		-- UNCOMMENT BELOW TO IGNORE 
				result:attachWeaponPart(Gun:getWeaponPart("Sling"))
				result:attachWeaponPart(Gun:getWeaponPart("Clip"))
				result:attachWeaponPart(Gun:getWeaponPart("RecoilPad"))

			-- AMMO TYPE DATA
				result:getModData().TempFireMode		= (Gun:getFireMode())		-- M16 SET TEMP for M203 Switchback
				result:getModData().TempContainsClip		= (Gun:isContainsClip())	
				result:getModData().TempRoundChambered		= (Gun:isRoundChambered())	
				result:getModData().TempCurrentAmmoCount	= (Gun:getCurrentAmmoCount())
				result:getModData().TempAmmoType		= (Gun:getModData().TempAmmoType)

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
				if	(Gun:getModData().Trajectory) ~= nil then
					result:getModData().Trajectory = Gun:getModData().Trajectory
					DebugSay(3,"Trajectory - "..tostring(result:getModData().Trajectory))
				end

				if 	(Gun:getCurrentAmmoCount() > 0) or (Gun:isContainsClip() == true) then						-- STORE GRENADE TYPE IN M16 TEMP
					if	Gun:getAmmoType() == "Base.40HERound" then			-- USE AMMOTYPE INSTEAD
						result:getModData().TempAmmoType	= 1			-- INCENDIARY
					else	result:getModData().TempAmmoType	= 2			-- EXPLOSIVE
					end
				end

				player:getInventory():AddItem(result);
				checkHotbar(Gun, result)				-- CHECK HOTBAR
				local inv = player:getInventory()
				inv:DoRemoveItem(Gun);

				if (instanceof(result,"HandWeapon")) then						-- REMOVE isAimedFirearm() for BAYO (Mele)
					player:setPrimaryHandItem(result) 
					if(result:isRequiresEquippedBothHands() or result:isTwoHandWeapon()) then
						player:setSecondaryHandItem(result)
					else	player:setSecondaryHandItem(nil)
					end
				end

			else					-- NORMAL MELEE ROUTINE

				if	Melee ~= nil then 
					tog = Melee
				end

				if tog == nil then
					DebugSay(2,"No Melee Mode")

				else	Sound = player:getEmitter():playSound("batSwing")

					local result = InventoryItemFactory.CreateItem(tog);
					player:getInventory():AddItem(result);

				--	======= TRANSFER CONDITION & MODE ======
					result:setCondition(Gun:getCondition());
					result:setFireMode(Gun:getFireMode());

				--	====== TRANSFER AMMO MAG & CHAMBER =====
					if	(Gun:isContainsClip() == true) and (result:getMagazineType() ~= nil) then
						result:setContainsClip(true);
					end

				--	====== TRANSFER MAG-TYPE =====
					if	Gun:getMagazineType() == nil and Gun:getModData().ClipType ~= nil then
						result:setMagazineType(Gun:getModData().ClipType);
					elseif	result:getMagazineType() == "Base.Fixed" then		-- FIXED MAG GUNS... SEEMS BACKWARDS ???
						result:setContainsClip(true);				-- ALWAYS TRUE
					elseif	Gun:getMagazineType() ~= "Base.Fixed" then		-- MAG FED GUNS
						result:setMagazineType(Gun:getMagazineType());
					end

					result:setMaxAmmo(Gun:getMaxAmmo());

					result:setCurrentAmmoCount(Gun:getCurrentAmmoCount());

					if	Gun:isRoundChambered() == true then
						result:setRoundChambered(true);
					end

					if	Gun:getModData().Trajectory ~= nil then
						result:getModData().Trajectory = Gun:getModData().Trajectory
						DebugSay(3,"Trajectory - "..tostring(result:getModData().Trajectory))
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

				-- 	[IF GUN HAS LAUNCHER FROM GUN TO MELEE MODE] SAVE ATTACHMENT TO ModData.TempXXX
					if 	( (sling) and (string.find(sling:getType(), "Launcher")) and (not isLauncher(Gun)) ) or
						( (Integral) and (Integral == "Launcher") and (not isLauncher(Gun)) ) then
						result:getModData().TempFireMode		= (Gun:getModData().TempFireMode)	-- M203 SET TEMP for M16 SwitchBack
						result:getModData().TempContainsClip		= (Gun:getModData().TempContainsClip)
						result:getModData().TempRoundChambered		= (Gun:getModData().TempRoundChambered)
						result:getModData().TempCurrentAmmoCount	= (Gun:getModData().TempCurrentAmmoCount)
						result:getModData().TempAmmoType		= (Gun:getModData().TempAmmoType)
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

						checkHotbar(Gun, result)				-- CHECK HOTBAR
						local inv = player:getInventory()
						inv:DoRemoveItem(Gun);

					end

					result:setMaxDamage(maxDmg)
					result:setMinDamage(minDmg)
					result:setCriticalChance(crit)
					result:setImpactSound(impact)
				end
			end
		else	DebugSay(2,"Not Firearm")
		end
	end
end


--------------------------------------------------------------------------
--  WEAPON LIGHT TOGGLE							--
--------------------------------------------------------------------------
local function WeaponLightToggle(keyNum)

	if getSpecificPlayer(0) == nil then return end			-- Good Lookin out go2008to

	if (keyNum == 33) or (keyNum == 55) then
		local attacker	= getSpecificPlayer(0)
		local weapon	= attacker:getPrimaryHandItem()
		local stock	= nil
		if (weapon) and (instanceof(weapon,"HandWeapon")) and (weapon:isAimedFirearm()) then
			stock	= weapon:getStock()
		end

		if (stock) and (string.find(stock:getType(), "Light")) then
			attacker:playSound("weaponLight");
			if weapon:getModData().LightOn == true then
				weapon:getModData().LightOn = false
				DebugSay(2,"Lite OFF")
			else	weapon:getModData().LightOn = true
				DebugSay(2,"Lite ON")
			end
		end
	end
end


--------------------------------------------------------------------------
--  WEAPON LIGHT BEAM BEHAVIOR						--
--------------------------------------------------------------------------
local function WeaponLightBeam()

	local attacker	= getSpecificPlayer(0)
	local weapon	= nil

	if attacker ~= nil then				-- PREVENT RESPAWN ERRORS
		weapon	= attacker:getPrimaryHandItem()
	end

	local stock	= nil
	if (weapon) and (instanceof(weapon,"HandWeapon")) and (weapon:isAimedFirearm()) then
		stock	= weapon:getStock()
	end

--	if (stock) and (string.find(stock:getType(), "Light")) and weapon:isActivated() then
	if (stock) and (string.find(stock:getType(), "Light")) and weapon:getModData().LightOn == true then
		if attacker:isAiming() then
			weapon:setTorchCone(true)
			if (string.find(stock:getType(), "Small")) then
				weapon:setLightDistance(10)
				weapon:setLightStrength(1.5)
			elseif (string.find(stock:getType(), "Large")) then
				weapon:setLightDistance(20)
				weapon:setLightStrength(1)
			end
		else	weapon:setTorchCone(false)
			if (string.find(stock:getType(), "Small")) then
				weapon:setLightDistance(2.5)
				weapon:setLightStrength(0.5)
			elseif (string.find(stock:getType(), "Large")) then
				weapon:setLightDistance(1.5)
				weapon:setLightStrength(2)
			end
		end
	elseif	(weapon) and (instanceof(weapon,"HandWeapon")) and (weapon:isAimedFirearm()) then	-- FIX FOR NORMAL LIGHTS GETTING FORCED OFF
			weapon:setTorchCone(false)
			weapon:setLightDistance(0)
			weapon:setLightStrength(0)
	end
end


--------------------------------------------------------------------------
--  BREAK ATTACHMENT ON MELEE						--
--------------------------------------------------------------------------
function BreakAttachmentOnMelee(weapon)
	----------------------
	--  OPTIONS BOX 11  --
	----------------------
	if (GUNFIGHTER.OPTIONS.options.dropdown11 < 5) then		-- 5 IS NEVER
		local attacker	= getSpecificPlayer(0)
		local weapon	= attacker:getPrimaryHandItem()
		local stock	= nil
		local scope	= nil
		local canon	= nil
		local option	= 1000 * GUNFIGHTER.OPTIONS.options.dropdown11

		if 	(weapon) and (instanceof(weapon,"HandWeapon")) and (weapon:isAimedHandWeapon()) then
			stock	= weapon:getStock()
			scope	= weapon:getScope()
			canon	= weapon:getCanon()

			if	(scope) then
				chance	= 0
				sound	= nil
				if	(string.find(scope:getType(), "Scope")) then
					chance = 10
					sound = "bottlesmash"
				elseif	(string.find(scope:getType(), "Sight")) then
					chance = 5
					sound = "bottlesmash"
				end
				if ZombRand(option) <= chance then
					weapon:detachWeaponPart(scope)
					attacker:playSound(sound)
					DebugSay(2,"Scope Broke...")
					attacker:setPrimaryHandItem(weapon) 
					if	(weapon:isRequiresEquippedBothHands() or weapon:isTwoHandWeapon()) then
						attacker:setSecondaryHandItem(weapon)
					else	attacker:setSecondaryHandItem(nil)
					end
				end
			end

			if	(canon) then
				chance	= 0
				sound	= nil
				if	(string.find(canon:getType(), "Suppressor")) then
					chance = 20
					sound = "PZ_MetalSnap"
				elseif	(string.find(canon:getType(), "Bayonet")) then
					chance = 1
					sound = "PZ_MetalSnap"
				end
				if ZombRand(option) <= chance then
					weapon:detachWeaponPart(canon)
					attacker:playSound(sound)
					DebugSay(2,"Muzzle Broke...")
					attacker:setPrimaryHandItem(weapon) 
					if	(weapon:isRequiresEquippedBothHands() or weapon:isTwoHandWeapon()) then
						attacker:setSecondaryHandItem(weapon)
					else	attacker:setSecondaryHandItem(nil)
					end
				end
			end

			if	(stock) then
				chance	= 0
				sound	= nil
				if	(string.find(stock:getType(), "Light")) then
					chance = 10
					sound = "PZ_MetalSnap"
				elseif	(string.find(stock:getType(), "Laser")) then
					chance = 5
					sound = "PZ_MetalSnap"
				end
				if ZombRand(option) <= chance then
					weapon:detachWeaponPart(stock)
					attacker:playSound(sound)
					DebugSay(2,"Light Broke...")
					attacker:setPrimaryHandItem(weapon) 
					if	(weapon:isRequiresEquippedBothHands() or weapon:isTwoHandWeapon()) then
						attacker:setSecondaryHandItem(weapon)
					else	attacker:setSecondaryHandItem(nil)
					end
				end
			end
		end
	end
end


--------------------------------------------------------------------------
--  BREAK ATTACHMENT ON FIRE						--
--------------------------------------------------------------------------
function BreakAttachmentOnFire(weapon)
	----------------------
	--  OPTIONS BOX 12  --
	----------------------
	if (GUNFIGHTER.OPTIONS.options.dropdown12 < 5) then		-- 5 IS NEVER
		local attacker	= getSpecificPlayer(0)
		local weapon	= attacker:getPrimaryHandItem()
		local stock	= nil
		local scope	= nil
		local canon	= nil
		local option	= 10000 * GUNFIGHTER.OPTIONS.options.dropdown12

		if 	(weapon) and (instanceof(weapon,"HandWeapon")) and (weapon:isAimedFirearm()) then
			stock	= weapon:getStock()
			scope	= weapon:getScope()
			canon	= weapon:getCanon()
			ammo	= weapon:getAmmoType()

			if	(scope) then
				chance	= 0
				sound	= nil
				if	(string.find(scope:getType(), "Scope")) then
					sound = "bottlesmash"
					chance = getShockValue(weapon) * 2

				elseif	(string.find(scope:getType(), "Sight")) then
					sound = "PZ_MetalSnap"
					chance = getShockValue(weapon)
				end
				if ZombRand(option) <= chance then
					weapon:detachWeaponPart(scope)
					attacker:playSound(sound)
					DebugSay(2,"Optic Broke...("..tostring(chance).."/"..tostring(option)..")")
					attacker:setPrimaryHandItem(weapon) 
					if	(weapon:isRequiresEquippedBothHands() or weapon:isTwoHandWeapon()) then
						attacker:setSecondaryHandItem(weapon)
					else	attacker:setSecondaryHandItem(nil)
					end
				end
			end

			if	(canon) then
				chance	= 0
				sound	= nil
				if	(string.find(canon:getType(), "Oil")) then
					chance = getShockValue(weapon) * 10
						-- 22	IS 10
						-- 380	IS 20
						-- 38	IS 30
						-- 9mm	IS 30
						-- 45	IS 40
						-- 44	IS 50
					sound = "PZ_MetalSnap"
				elseif	(string.find(canon:getType(), "Bottle")) then
					chance = getShockValue(weapon) * 400
						-- 22	IS 400
						-- 380	IS 800
						-- 38	IS 1200
						-- 9mm	IS 1200
						-- 45	IS 1600
						-- 44	IS 2000
					sound = "windowclose"
				elseif	(string.find(canon:getType(), "Suppressor")) then
					chance = getShockValue(weapon)
						-- 22	IS 1
						-- 380	IS 2
						-- 38	IS 3
						-- 9mm	IS 3
						-- 45	IS 4
						-- 44	IS 5
						-- 223	IS 4
						-- 556	IS 4
						-- 762	IS 6
						-- 308	IS 8
						-- 12g	IS 8
						-- 50	IS 10
					sound = "PZ_MetalSnap"
				end
				if ZombRand(option) <= chance then
					weapon:detachWeaponPart(canon)
					attacker:playSound(sound)
					DebugSay(2,"Muzzle Broke...("..tostring(chance).."/"..tostring(option)..")")
					attacker:setPrimaryHandItem(weapon) 
					if	(weapon:isRequiresEquippedBothHands() or weapon:isTwoHandWeapon()) then
						attacker:setSecondaryHandItem(weapon)
					else	attacker:setSecondaryHandItem(nil)
					end
				end
			end

			if	(stock) then
				chance	= 0
				sound	= nil
				if	(string.find(stock:getType(), "Light")) then
					chance = getShockValue(weapon) * 2
					sound = "PZ_MetalSnap"
				elseif	(string.find(stock:getType(), "Laser")) then
					chance = getShockValue(weapon)
					sound = "PZ_MetalSnap"
				end
				if ZombRand(option) <= chance then
					weapon:detachWeaponPart(stock)
					attacker:playSound(sound)
					DebugSay(2,"Light Broke...("..tostring(chance).."/"..tostring(option)..")")
					attacker:setPrimaryHandItem(weapon) 
					if	(weapon:isRequiresEquippedBothHands() or weapon:isTwoHandWeapon()) then
						attacker:setSecondaryHandItem(weapon)
					else	attacker:setSecondaryHandItem(nil)
					end
				end
			end
		end
	end
end

--------------------------------------------------------------------------
--  TEST NO JAM OPTION							--
--------------------------------------------------------------------------
function WeaponStatus(weapon)
	local attacker	= getSpecificPlayer(0)
	local weapon	= nil

	if attacker ~= nil then				-- PREVENT RESPAWN ERRORS
		weapon	= attacker:getPrimaryHandItem()
	end	

	local Moving	= attacker:getBeenMovingFor()

	if (weapon) and (instanceof(weapon,"HandWeapon")) and (weapon:isAimedFirearm()) and attacker:isAiming() and (not isFlamer(weapon)) then
		---------------------------
		--  OPTIONS DROPDOWN 9   --
		---------------------------
		if (GUNFIGHTER.OPTIONS.options.dropdown9 > 1) then
			local cycle = attacker:getModData().JamCycle
			if cycle == nil then cycle = 0 end
			if weapon:isJammed() and (cycle) and (cycle ~= weapon:getCurrentAmmoCount()) then
				local chance = GUNFIGHTER.OPTIONS.options.dropdown9
				local roll = ZombRand(4)+2
				if roll <= chance then		-- 0 DEFAULT 5 NEVERJAM
					DebugSay(3,"Jam Averted ("..tostring(roll)..")")
					weapon:setJammed(false)
				else
					DebugSay(3,"Jam Not Averted ("..tostring(roll)..")")
					attacker:getModData().JamCycle = weapon:getCurrentAmmoCount()
				end
			end
		end
		----------------------
		--  OPTIONS BOX 10  --
		----------------------
		if (GUNFIGHTER.OPTIONS.options.box10 == true) then
			weapon:setCondition(weapon:getConditionMax())
		end

		----------------------
		--  OPTIONS BOX 14  --
		----------------------
		if (GUNFIGHTER.OPTIONS.options.box16 == true) then
			local	penalized = weapon:getModData().aimingpenalized		-- MAKE SURE ONLY APPLIED ONCE
			local	penalty = 0
			local	aim	= weapon:getAimingTime()
			local	weight	= round(weapon:getWeight(),2)
			local	length = weapon:getModData().OAL
			if	length == nil then
				length = 0
			end

			penalty = (weight/2) + ( ((1+length)*(1+length)*(1+length)*(1+length)*(1+length)*(1+length)) / 250 )	-- BASIC PENALTY BY LENGTH

			if (weapon:isRequiresEquippedBothHands() or weapon:isTwoHandWeapon()) then	-- ADDITIONAL MODIFIER FOR CONVERSION
				if	(string.find(weapon:getType(), "Fold")) then
					penalty = penalty - 12				-- FOLDED RIFLE
			--	elseif	(string.find(weapon:getType(), "Sawed")) then
			--		penalty = penalty - 13				-- SAWED W/STOCK
				elseif	(string.find(weapon:getType(), "Pistol")) then
					penalty = penalty - 12				-- PISTOL CONVERSION
				end
			elseif	(string.find(weapon:getType(), "Stock")) then
					penalty = penalty + 12				-- PISTOL WITH STOCK
			end

--[[			if (weapon:isRequiresEquippedBothHands() or weapon:isTwoHandWeapon()) then
				if	(string.find(weapon:getType(), "Fold")) then
					penalty = 10 + weight				-- FOLDED RIFLE
				elseif	(string.find(weapon:getType(), "Sawed")) then
					penalty = 15 + weight				-- SAWED W/STOCK
				elseif	(string.find(weapon:getType(), "Bull")) then
					penalty = 10 + weight				-- BULLPUP
				elseif	(string.find(weapon:getType(), "Pistol")) then
					penalty = 5 + weight				-- PISTOL CONVERSION
				else	penalty = 25 + weight				-- FULL RIFLE
				end
			else		penalty = weight				-- NON-TWOHANDED FIREARMS
			end
]]

			if	(attacker:getVehicle()) and (penalized == nil) then
				DebugSay(3,"Vehicle AimTime Penalty "..tostring(round(penalty), 2).."Length "..tostring(length))
				weapon:setAimingTime(aim - penalty)
				weapon:getModData().aimingpenalized = penalty
			elseif	(attacker:getVehicle() == nil) and (penalized ~= nil) then
				weapon:setAimingTime(aim + penalized)
				weapon:getModData().aimingpenalized = nil


--[[	THIS WAY SUCKS		local size = getLoadedWeight(weapon) / 100
				if (weapon:isRequiresEquippedBothHands() or weapon:isTwoHandWeapon()) then
					if	(string.find(weapon:getType(), "Fold")) then
						attacker:setBeenMovingFor(Moving + size * 1.25)	-- RIFLES FOLDED
						DebugSay(3,"Folded AimTime Penalty "..tostring(round(size * 125), 2))
					elseif	(string.find(weapon:getType(), "Sawed")) then
						attacker:setBeenMovingFor(Moving + size * 2)	-- RIFLES SAWED
						DebugSay(3,"Sawed AimTime Penalty "..tostring(round(size * 200), 2))
					elseif	(string.find(weapon:getType(), "Pistol")) then
						attacker:setBeenMovingFor(Moving + size)	-- RIFLES PISTOL CONVERSION
						DebugSay(3,"Converted AimTime Penalty "..tostring(round(size * 100), 2))
					else	attacker:setBeenMovingFor(Moving + 0.3 + size * 2)	-- RIFLES NOT FOLDED or SAWED
						DebugSay(3,"Rifle AimTime Penalty "..tostring(round(size * 100 + 30), 2))
					end
				else		attacker:setBeenMovingFor(Moving + size)	-- NON-TWOHANDED FIREARMS
						DebugSay(3,"Pistol AimTime Penalty "..tostring(round(size * 100), 2))
				end
]]
			end
		end



--		attacker:Say(tostring(attacker:getBeenMovingFor()))		TESTING FOR SLOW ROF

	end
end

--------------------------------------------------------------------------
--  CALCULATES RECOIL DELAY FROM SCRATCH				--
--------------------------------------------------------------------------
function calcRecoilDelay(weapon)

	weapon:getModData().TempScope	= weapon:getWeaponPart("Scope")
	weapon:getModData().TempCanon	= weapon:getWeaponPart("Canon")
	weapon:getModData().TempClip	= weapon:getWeaponPart("Clip")
	weapon:getModData().TempStock	= weapon:getWeaponPart("Stock")
	weapon:getModData().TempSling	= weapon:getWeaponPart("Sling")
	weapon:getModData().TempRecoil	= weapon:getWeaponPart("RecoilPad")

	weapon:detachWeaponPart(weapon:getModData().TempScope)
	weapon:detachWeaponPart(weapon:getModData().TempCanon)
	weapon:detachWeaponPart(weapon:getModData().TempClip)
	weapon:detachWeaponPart(weapon:getModData().TempStock)
	weapon:detachWeaponPart(weapon:getModData().TempSling)
	weapon:detachWeaponPart(weapon:getModData().TempRecoil)

	local calc	= 0
	local base	= 30
	if weapon:isTwoHandWeapon() then	-- SLOW DOWN PISTOLS
		base 	= 30
	end
	local recoil	= 0
	local weight 	= getLoadedWeight(weapon)
	local stock	= 0
	local level	= getSpecificPlayer(0):getPerkLevel(Perks.Aiming) * 1		-- APPLY 1 PART AIM LEVEL BACK TO SLOW IT BACK DOWN AT HIGH LEVEL
	local reducer	= 0.5

	if	getSpecificPlayer(0):getVehicle() then			stock	= 0	-- NO STOCK BUFF IN VEHICLE
	elseif	string.find(weapon:getType(), "Fold") then		stock	= 0	-- NO STOCK BUFF FOLDED
	elseif	string.find(weapon:getType(), "Pistol") then		stock	= 0	-- NO STOCK BUFF SAWED
	elseif	string.find(weapon:getType(), "Stock") then		stock	= 6
	elseif	weapon:getSwingAnim() == "Rifle" then			stock	= 6	-- LAST CUZ SOME RIFLES CAN FOLD
	end

	if weapon:isRanged() then
		local ammo = weapon:getAmmoType()
		if	ammo	== "Base.BB177" then			recoil	= -10	-- 0
		elseif	ammo	== "Base.Bullets22" then		recoil	= -4	-- 0.5 * 2 USED TO BE 1
		elseif	ammo	== "Base.Bullets57" then		recoil	= -2	-- TEST AT -2
		elseif	ammo	== "Base.Bullets380" then		recoil	= 1	-- 1.0 * 2 USED TO BE 2
		elseif	ammo	== "Base.Bullets38" then		recoil	= 3	-- 1.5 * 2
		elseif	ammo	== "Base.Bullets9mm" then		recoil	= 4	-- 2.0 * 2
		elseif	ammo	== "Base.Bullets45" then		recoil	= 6	-- 3.0 * 2
		elseif	ammo	== "Base.Bullets357" then		recoil	= 8	-- 4.0 * 2
		elseif	ammo 	== "Base.Bullets45LC" then		recoil	= 10	-- TEST
		elseif	ammo	== "Base.Bullets44" then		recoil	= 12	-- 6.0 * 2
		elseif	ammo	== "Base.Bullets50MAG" then		recoil	= 16	-- TEST
		elseif	ammo	== "Base.Bullets4570" then		recoil	= 18	-- TEST		WAS 16
		elseif	ammo	== "Base.223Bullets" then		recoil	= 13	-- 6.5 * 2
		elseif	ammo	== "Base.556Bullets" then		recoil	= 14	-- 7.0 * 2
		elseif	ammo	== "Base.545x39Bullets" then		recoil	= 15	-- 8.0 * 2
		elseif	ammo	== "Base.762x39Bullets" then		recoil	= 16	-- 8.0 * 2
		elseif	ammo	== "Base.308Bullets" then		recoil	= 20	-- 10.0 * 2
		elseif	ammo 	== "Base.762x51Bullets" then		recoil	= 20	-- TEST
		elseif	ammo	== "Base.762x54rBullets" then		recoil	= 21	-- TEST
		elseif	ammo	== "Base.3006Bullets" then		recoil	= 22	-- TEST
		elseif	ammo	== "Base.410gShotgunShells" then	recoil	= 18	-- TEST
		elseif	ammo	== "Base.20gShotgunShells" then		recoil	= 24	-- TEST
		elseif	ammo	== "Base.ShotgunShells" then		recoil	= 26	-- 12.0 * 2
		elseif	ammo	== "Base.10gShotgunShells" then		recoil	= 30	-- TEST
		elseif	ammo	== "Base.4gShotgunShells" then		recoil	= 40	-- TEST AT 40
		elseif	ammo	== "Base.50BMGBullets" then		recoil	= 56	-- 14.0 * 2 = 28 CHEAT IT HIGHER FOR WEIGHT
		end

		calc = ((base + recoil - weight - stock) * reducer)		-- REMOVE LEVEL ELEMENT AFFECTS RECOIL STAT
	--	calc = ((base + recoil - weight - stock + level) * reducer)	-- THIS IS ACTUAL DELAY

		if	ammo	== "Base.FlameFuel" then		calc	= 0
		elseif	ammo	== "Base.WaterAmmo" then		calc	= 0
		end


		weapon:setRecoilDelay(calc)

		weapon:attachWeaponPart(weapon:getModData().TempScope)
		weapon:attachWeaponPart(weapon:getModData().TempCanon)
		weapon:attachWeaponPart(weapon:getModData().TempClip)
		weapon:attachWeaponPart(weapon:getModData().TempStock)
		weapon:attachWeaponPart(weapon:getModData().TempSling)
		weapon:attachWeaponPart(weapon:getModData().TempRecoil)

		local factor	= weapon:getRecoilDelay()
		local multi	= factor * 2 - (level * 0.5)		-- REMOVE LEVEL ELEMENT
	--	local multi	= factor * 2 - (level)			-- COMPENSATE FOR LEVEL APPLIED ON ACTUAL DELAY
		weapon:getModData().TempRecoilDelay = multi		-- USE MULTIPLIER TO OVERTAKE TIME... THIS IS APPLIED RECOIL NOT DELAY
	end
end

--------------------------------------------------------------------------
--  AIMTIME vs MOVETIME DISPLAY, SHOT SPREAD VISUALIZATION, SHOW AMMO	--
--------------------------------------------------------------------------
local function HeadsUpDisplay()

	local attacker	= getSpecificPlayer(0)
	local weapon	= nil

	if attacker ~= nil then				-- PREVENT RESPAWN ERRORS
		weapon	= attacker:getPrimaryHandItem()
	end


-- TEST LAST SPOTTED
	--	local target	= attacker:getTargetAlpha()
	--	local Tloc 	= target:getCurrentSquare()
	--	local Tloc 	= attacker:getAttackTargetSquare()
	--	local Aloc	= attacker:getCurrentSquare()
	--	local Dist	= getDistanceBetween(Tloc,Aloc)

	--	if attacker.JustMoved == true then
	--		attacker:Say("moved")
	--	end

		if weapon ~= nil and (instanceof(weapon,"HandWeapon")) and weapon:isRanged() then

		----------------------
		--  OPTIONS BOX 4  --
		----------------------
		if (GUNFIGHTER.OPTIONS.options.box4 == true) then
			local r2 = 0.8
			local g2 = 0.8
			local b2 = 0.8
			local chamber = weapon:isRoundChambered()
			local ammo = weapon:getCurrentAmmoCount()
			if chamber then
				ammo = ammo + 1
			end
			local rounds = " "

			if weapon:isJammed() then rounds = "    JAM"
				r2 = 1.0
				g2 = 0.0
				b2 = 0.0
			elseif	ammo == 1 then rounds	= "                       |"
			elseif	ammo == 2 then rounds	= "                       ||"
			elseif	ammo == 3 then rounds	= "                       |||"
			elseif	ammo == 4 then rounds	= "                       ||||"
			elseif	ammo == 5 then rounds	= "                       |||||"
			elseif	ammo == 6 then rounds	= "                       ||||||"
			elseif	ammo == 7 then rounds	= "                       |||||||"
			elseif	ammo == 8 then rounds	= "                       ||||||||"
			elseif	ammo == 9 then rounds	= "                       |||||||||"
			elseif	ammo == 10 then rounds	= "                       ||||||||||"
			elseif	ammo == 11 then rounds	= "                       |||||||||||"
			elseif	ammo == 12 then rounds	= "                       ||||||||||||"
			elseif	ammo == 13 then rounds	= "                       |||||||||||||"
			elseif	ammo == 14 then rounds	= "                       ||||||||||||||"
			elseif	ammo == 15 then rounds	= "                       |||||||||||||||"
			elseif	ammo == 16 then rounds	= "                       ||||||||||||||||"
			elseif	ammo == 17 then rounds	= "                       |||||||||||||||||"
			elseif	ammo == 18 then rounds	= "                       ||||||||||||||||||"
			elseif	ammo == 19 then rounds	= "                       |||||||||||||||||||"
			elseif	ammo == 20 then rounds	= "                       ||||||||||||||||||||"
			elseif	ammo == 21 then rounds	= "                       |||||||||||||||||||||"
			elseif	ammo == 22 then rounds	= "                       ||||||||||||||||||||||"
			elseif	ammo == 23 then rounds	= "                       |||||||||||||||||||||||"
			elseif	ammo == 24 then rounds	= "                       ||||||||||||||||||||||||"
			elseif	ammo == 25 then rounds	= "                       |||||||||||||||||||||||||"
			elseif	ammo == 26 then rounds	= "                       ||||||||||||||||||||||||||"
			elseif	ammo == 27 then rounds	= "                       |||||||||||||||||||||||||||"
			elseif	ammo == 28 then rounds	= "                       ||||||||||||||||||||||||||||"
			elseif	ammo == 29 then rounds	= "                       |||||||||||||||||||||||||||||"
			elseif	ammo == 30 then rounds	= "                       ||||||||||||||||||||||||||||||"
			elseif	ammo >= 91 then	rounds	= "                       ||||||||||||||||||||||||||||||+++++++"
			elseif	ammo >= 81 then	rounds	= "                       ||||||||||||||||||||||||||||||++++++"
			elseif	ammo >= 71 then	rounds	= "                       ||||||||||||||||||||||||||||||+++++"
			elseif	ammo >= 61 then	rounds	= "                       ||||||||||||||||||||||||||||||++++"
			elseif	ammo >= 51 then	rounds	= "                       ||||||||||||||||||||||||||||||+++"
			elseif	ammo >= 41 then	rounds	= "                       ||||||||||||||||||||||||||||||++"
			elseif	ammo >= 31 then rounds	= "                       ||||||||||||||||||||||||||||||+"
			else	rounds	= "EMPTY "
				r2 = 0.0
				g2 = 1.0
				b2 = 0.0
			end
			getTextManager():DrawString(UIFont.Small, 16, 25, rounds, r2, g2, b2, 1.0);
		end


		----------------------
		--  OPTIONS BOX 5  --
		----------------------
		if (GUNFIGHTER.OPTIONS.options.box5 == true) then
			local Moving	= attacker:getBeenMovingFor()
			local AimTime	= 0
			local AimLevel	= attacker:getPerkLevel(Perks.Aiming)

			AimTime = weapon:getAimingTime()
	
			local MoveTime
			if	Moving > (AimTime + AimLevel) then
				MoveTime = Moving - (AimTime + AimLevel)
			else	MoveTime = 0
			end

		--	if	Moving < (AimTime + AimLevel) then
		--		MoveTime = 0
		--	else	MoveTime = Moving - (AimTime + AimLevel)
		--	end

			if attacker:isAiming() then

				local data1 = "            +"
				local r = 0.0
				local g = 1.0
				local b = 0.0
				local zoom = getCore():getZoom(0)
				local height
				----------------------------------
				--	FOR RESOLUTION ADJ	--
				----------------------------------
				local sx = IsoUtils.XToScreen(attacker:getX(), attacker:getY(), attacker:getZ(), 0);
				local sy = IsoUtils.YToScreen(attacker:getX(), attacker:getY(), attacker:getZ(), 0);
				sx = sx - IsoCamera.getOffX() - attacker:getOffsetX();
				sy = sy - IsoCamera.getOffY() - attacker:getOffsetY();
				sy = sy - 82
				sx = sx / zoom - 40
				sy = sy / zoom

			--	DebugSay(3,"X "..tostring(sx).." Y"..tostring(sy).."ZM "..tostring(zoom))

				if	zoom <= 0.25 then	height = 60		-- 24
				elseif	zoom <= 0.375 then	height = 36		-- 10
				elseif	zoom <= 0.5 then	height = 24		-- 8
				elseif	zoom <= 0.625 then	height = 16		-- 4
				elseif	zoom <= 0.75 then	height = 12		-- 4
				elseif	zoom <= 0.875 then	height = 8		-- 2
				elseif	zoom <= 1.0 then	height = 6		-- 2
				elseif	zoom <= 1.125 then	height = 4		-- 2
				elseif	zoom <= 1.25 then	height = 2		-- 0
				else				height = 0
				end

				if	MoveTime > 65 then data1 = "-                        -"
					r = 1.0
					g = 0.0
					b = 0.0
				elseif	MoveTime > 60 then data1 = " -                      -"
					r = 1.0
					g = 0.0
					b = 0.0
				elseif	MoveTime > 55 then data1 = "  -                    -"
					r = 1.0
					g = 0.0
					b = 0.0
				elseif	MoveTime > 50 then data1 = "   -                  -"
					r = 1.0
					g = 0.0
					b = 0.0
				elseif	MoveTime > 45 then data1 = "    -                -"
					r = 1.0
					g = 0.2
					b = 0.0
				elseif	MoveTime > 40 then data1 = "     -              -"
					r = 1.0
					g = 0.4
					b = 0.0
				elseif	MoveTime > 35 then data1 = "     -             -"
					r = 1.0
					g = 0.6
					b = 0.0
				elseif	MoveTime > 30 then data1 = "      -           -"
					r = 1.0
					g = 0.8
					b = 0.0
				elseif	MoveTime > 25 then data1 = "       -         -"
					r = 1.0
					g = 1.0
					b = 0.0
				elseif	MoveTime > 20 then data1 = "        -       -"
					r = 0.8
					g = 1.0
					b = 0.0
				elseif	MoveTime > 15 then data1 = "         -     -"
					r = 0.6
					g = 1.0
					b = 0.0
				elseif	MoveTime > 10 then data1 = "          -   -"
					r = 0.4
					g = 1.0
					b = 0.0
				elseif	MoveTime > 5  then data1 = "           - -"
					r = 0.2
					g = 1.0
					b = 0.0
				elseif	MoveTime > 0  then data1 = "            -"
					r = 0.0
					g = 1.0
					b = 0.0
					color = "0.0, 1.0, 0.0"
				elseif	Moving == 0   then data1 = "            +"
					r = 0.0
					g = 1.0
					b = 0.0
				end

				if weapon:isJammed() then
					r = 1.0
					g = 0.0
					b = 0.0
				elseif (weapon:haveChamber() == false and weapon:getCurrentAmmoCount() == 0) or (weapon:haveChamber() ~= false and weapon:isRoundChambered() == false) then
					r = 1.0
					g = 1.0
					b = 1.0
				end

				getTextManager():DrawString(UIFont.Medium, sx, sy + height, data1, r, g, b, 1.0);
	--			getTextManager():DrawString(UIFont.Medium, sx, sy, data1, r, g, b, 1.0);
	-- FIX FOR RESOLUTION	getTextManager():DrawString(UIFont.Medium, 600, height, data1, r, g, b, 1.0);
	-- TESTED SMALL		getTextManager():DrawString(UIFont.Small, 610, height, data1, r, g, b, 1.0);
	-- TEST			attacker:Say(tostring(zoom))
			end
		end
	end
end

Events.OnGameStart.Add(function()
	Events.OnPostUIDraw.Add(HeadsUpDisplay);
end);

--------------------------------------------------------------------------
--  TEST LAUNCHER AIM AUTO TRANSFORM					--
--------------------------------------------------------------------------
function AutoTransform()
	local attacker = getSpecificPlayer(0)
	local weapon	= nil

	if attacker ~= nil then				-- PREVENT RESPAWN ERRORS
		weapon	= attacker:getPrimaryHandItem()
	end

	if (weapon) and (instanceof(weapon,"HandWeapon")) and (weapon:isAimedFirearm()) then
		local	scriptItem = weapon:getScriptItem()
		local	scope = weapon:getScope()


		------------------------------------
		--  ELIMINATE AUTO 1st SHOT LAG	  --
		------------------------------------
		if	weapon:getFireMode() == "Auto" and weapon:getRecoilDelay() ~= 0 then
			weapon:setRecoilDelay(0)
			DebugSay(3,"Delay 0")
		end

		------------------------------------
		--  LIMIT SHOTGUN RANGE VS SCOPE  --
		------------------------------------
		if	(scope ~= nil) then
			local	maxRange = weapon:getMaxRange()
			local	scopeRange = scope:getMaxRange()
			local	scriptRange = scriptItem:getMaxRange()
			if	(isShotgun(weapon)) and (maxRange ~= scriptRange) then		-- NERF SHOTGUN RANGE
				weapon:setMaxRange(scriptRange)
				DebugSay(3,"Scope Disabled "..tostring(weapon:getMaxRange()))
		--	elseif	(not isShotgun(weapon)) and (maxRange < scriptRange) then	-- RETURN IF RIFLE
			elseif	(not isShotgun(weapon)) and (maxRange < scriptRange) and (weapon:getModData().Trajectory ~= "CQB") then	-- RETURN IF RIFLE, ADD CQB CHECK
				weapon:setMaxRange(scriptRange)
				DebugSay(3,"Scope Restored "..tostring(weapon:getMaxRange()))
			end
		elseif	(scope == nil) and (isShotgun(weapon)) then				-- RETURN SHOTGUN IF NO SCOPE
			local	maxRange = weapon:getMaxRange()
			local	scriptRange = scriptItem:getMaxRange()
			if	maxRange < scriptRange then
				WeaponReloadScript(44)
				DebugSay(3,"Reload Script")
			end
		end


		------------------------------------
		--  ROCKET ARMED		  --
		------------------------------------
		if	isRocket(weapon) then
			Loaded	= weapon:getCurrentAmmoCount()
			Armed	= weapon:getClip()
			if	Loaded == 0 and Armed ~= nil then
				WeaponMeleeToggle(50)
			elseif	Loaded > 0 and Armed == nil then
				WeaponMeleeToggle(50)
			end
		end

		------------------------------------
		--  LAUNCHER PROJECTILE		  --
		------------------------------------
		if (not weapon:isAimedHandWeapon()) and (isLauncher(weapon) or isFlamer(weapon)) then
			local sling	= weapon:getSling()
			local Integral	= weapon:getModData().Integral
			Loaded		= weapon:getCurrentAmmoCount()

			if	( (sling) and (string.find(sling:getType(), "Launcher")) ) or
				( (Integral) and (Integral == "Launcher") ) then
				DebugSay(4,"Attachment... No Transform")
			elseif	attacker:isAiming() then
				if	(not string.find(weapon:getType(), "FIRE")) then
					WeaponMeleeToggle(50)
				elseif	(string.find(weapon:getType(), "FIRE")) and (Loaded == 0) and (weapon:getClip() ~= nil) and (isRocket(weapon)) then
					WeaponMeleeToggle(50)
				end
			else	
				if	(string.find(weapon:getType(), "FIRE")) then
					WeaponMeleeToggle(50)
				end
			end

		------------------------------------
		--  BURST SOUND	EXCLUDE		  --
		--  SHOTGUN, LAUNCHER, FLAMER	  --
		------------------------------------
		elseif	attacker:isAiming() and (not weapon:isAimedHandWeapon()) and (not isShotgun(weapon)) and (not isBow(weapon)) then
			local	mode = weapon:getFireMode()
			local	ammo = weapon:getAmmoType()
			local	current = weapon:getCurrentAmmoCount()
		--	local	canon = weapon:getCanon()
			local	script = scriptItem:getSwingSound()
			local	sound = weapon:getSwingSound()
			local	Alt1 = weapon:getModData().AltSwingSound1	-- NON SUPPRESSED BURST SOUND
			local	Alt2 = weapon:getModData().AltSwingSound2	-- SUPPRESSED BURST SOUND
			local	save = weapon:getModData().EquipSound
			local	supp = 0
			local	equip = nil
			local	newsound = nil

		--	TRY PUTTING HIGHER SO SHOTGUNS CAN RESET TOO
		--	if	weapon:getFireMode() == "Auto" and weapon:getRecoilDelay() ~= 0 then
		--		weapon:setRecoilDelay(0)
		--		DebugSay(3,"Delay 0")
		--	end

			if	isSuppressed(weapon) then
				supp = 1
			end
			--------------------------------------------------
			--	ONLY IF CURRENT AMMO CHANGES NEW SOUND 	--
			--	AND MAXHITCOUNT UPDATES. ALWAYS TURN	--
			--	OFF PIERCING TO ALLOW MULTIPLE TARGETS 	--
			--------------------------------------------------
			if	(mode == "[3]Burst" or mode == "Auto") and (current >= 2) then		-- GET GENERIC IF NOT DEFINED IN SCRIPT
				if	(supp == 1) and (Alt2 == nil) and (sound ~= getShotSound(weapon,3)) then
		--		if	(supp == 1) and (sound ~= getShotSound(weapon,3)) then
					Alt2 = getShotSound(weapon,3)
					DebugSay(3,"ASSIGN ALT2 Generic [3]SD Burst Sound "..tostring(Alt2))
				elseif	(supp == 0) and (Alt1 == nil) and (sound ~= getShotSound(weapon,3)) then
		--		elseif	(supp == 0) and (sound ~= getShotSound(weapon,3)) then
					Alt1 = getShotSound(weapon,3)
					DebugSay(3,"ASSIGN ALT1 Generic [3]Burst Sound "..tostring(Alt1))
				end

				if	(weapon:getMaxHitCount() ~= 2) or (weapon:isPiercingBullets() == true) then
					weapon:setMaxHitCount(2)
					weapon:setPiercingBullets(false)
					DebugSay(3,"Pierce "..tostring(weapon:isPiercingBullets()).." Hit "..tostring(weapon:getMaxHitCount()).." Mode "..tostring(weapon:getFireMode()))
				end
			elseif	(mode == "[2]Burst" and current >= 1) or ((mode == "[3]Burst" or mode == "Auto") and current == 1) then		-- GET GENERIC IF NOT DEFINED IN SCRIPT
				if	(supp == 1) and (Alt2 == nil) and (sound ~= getShotSound(weapon,2)) then
					Alt2 = getShotSound(weapon,2)
					DebugSay(3,"ASSIGN ALT2 Generic SD [2]Burst Sound "..tostring(Alt2))
				elseif	(supp == 0) and (Alt1 == nil) and (sound ~= getShotSound(weapon,2)) then
					Alt1 = getShotSound(weapon,2)
					DebugSay(3,"ASSIGN ALT1 Generic [2]Burst Sound "..tostring(Alt1))
				end

				if	(weapon:getMaxHitCount() ~= 2) or (weapon:isPiercingBullets() == true) then
					weapon:setMaxHitCount(2)
					weapon:setPiercingBullets(false)
					DebugSay(3,"Pierce "..tostring(weapon:isPiercingBullets()).." Hit "..tostring(weapon:getMaxHitCount()).." Mode "..tostring(weapon:getFireMode()))
				end
			elseif	(mode == "[2]Burst" and current == 0) or ((mode == "[3]Burst" or mode == "Auto") and current == 0) then
				if	(supp == 1) and (Alt2 == nil) and (sound ~= getShotSound(weapon,1)) then
					Alt2 = getShotSound(weapon,1)
					DebugSay(3,"ASSIGN ALT2 Generic SD [1]Burst Sound "..tostring(Alt2))
				elseif	(supp == 0) and (Alt1 == nil) and (sound ~= getShotSound(weapon,1)) then
					Alt1 = getShotSound(weapon,1)
					DebugSay(3,"ASSIGN ALT1 Generic [1]Burst Sound "..tostring(Alt1))
				end

				if	(weapon:getMaxHitCount() > current + 1) or (weapon:isPiercingBullets() == true) then
					weapon:setMaxHitCount(current + 1)
					weapon:setPiercingBullets(false)
					DebugSay(3,"Pierce "..tostring(weapon:isPiercingBullets()).." Hit "..tostring(weapon:getMaxHitCount()).." Mode "..tostring(weapon:getFireMode()))
				end

			elseif	(mode ~= "[6]Rotary") and ((weapon:isPiercingBullets() ~= isAmmoPiercing(ammo)) or (weapon:getMaxHitCount() ~= scriptItem:getMaxHitCount())) then
				weapon:setMaxHitCount(scriptItem:getMaxHitCount())	-- FOR PENETRATING ROUNDS
				weapon:setPiercingBullets(isAmmoPiercing(ammo))
				DebugSay(3,"Pierce "..tostring(weapon:isPiercingBullets()).." Hit "..tostring(weapon:getMaxHitCount()).." Mode "..tostring(weapon:getFireMode()))
			end
				
			--------------------------------------------------
			--	IF SOUND IS ASSIGNED THEN DO IT ONCE 	--
			--	ONLY IF NOT SAME USING AutoReload TAG	--
			--------------------------------------------------
			if	(isSuppressed(weapon)) then
			--	DebugSay (3,"SUPPRESSED")
				if	(sound ~= Alt2) and (mode == "[2]Burst" or mode == "[3]Burst" or mode == "Auto") then
					if Alt2 ~= nil then
						newsound = Alt2
						weapon:getModData().AutoReload = 1
					end
				elseif	((sound == Alt1) or (sound == Alt2) or (sound == script)) and (mode == "[2]Burst" or mode == "[3]Burst" or mode == "Auto") then
					if save ~= nil then
						newsound = save
						weapon:getModData().AutoReload = 1
					end
				end
			elseif	(not isSuppressed(weapon)) then
			--	DebugSay (3,"NOT SUPPRESSED")
				if	(sound ~= Alt1) and (mode == "[2]Burst" or mode == "[3]Burst" or mode == "Auto") then
					if Alt1 ~= nil then
						newsound = Alt1
						weapon:getModData().AutoReload = 1
					end
				elseif	((sound == Alt1) or (sound == Alt2)) and (mode == "[2]Burst" or mode == "[3]Burst" or mode == "Auto") then
					if script ~= nil then
						newsound = script
						weapon:getModData().AutoReload = 1
					end
				end

			else	DebugSay(3,"No Sound Change")
			end

			--------------------------------------------------
			--	EITHER ASSIGN THE SOUND IF ASSIGNED OR 	--
			--	RESET TO SCRIPT ITEM PARAMS		--
			--------------------------------------------------
			if	newsound ~= nil then
				weapon:setSwingSound(newsound)
				DebugSay(3,"New Sound "..tostring(newsound))
			elseif	(newsound == nil) and (mode ~= "[2]Burst") and (mode ~= "[3]Burst") and (mode ~= "Auto") and (weapon:getModData().AutoReload == 1) then
			--	weapon:setSwingSound(save)
				WeaponReloadScript(44)
				DebugSay(3,"Revert Sound "..tostring(newsound))
				weapon:getModData().AutoReload = 0
			end
		end
	end
end



--------------------------------------------------------------------------
--  PROCESS RECOIL DELAY TO ALLOW FULL AUTO WEAPONS TO ACTUALLY HAVE A	--
--  RECOIL STAT... THIS ALLOWS SINGLE SHOT MODE TO BE SLOW AND AUTO TO  --
--  BE RAPID. ADDS DYNAMIC RECOIL TAG TO APPLY (OnPlayerUpdate)		--
--------------------------------------------------------------------------
local function SendHit(attacker,weapon)

	------------------------------------
	--  FULL AUTO / RECOIL DELAY FIX  --
	------------------------------------
	if (weapon:isAimedFirearm()) and (not weapon:isAimedHandWeapon()) then
		if	weapon:getFireMode() == "FullAuto" or		-- WTF ?
			weapon:getFireMode() == "Auto" or
		--	weapon:getFireMode() == "Burst" or		-- OBSOLETE
		--	weapon:getFireMode() == "[2]Burst" or
		--	weapon:getFireMode() == "[3]Burst" or
			weapon:getFireMode() == "[3]Rotary" or		-- NOT USED MAYBE
			weapon:getFireMode() == "[6]Rotary" then
			weapon:setRecoilDelay(0)
		else	
			calcRecoilDelay(weapon)
		end
	end

	---------------------
	--  OPTIONS BOX 6  --
	---------------------
	if (GUNFIGHTER.OPTIONS.options.box6 == true) then
		if	weapon:getCurrentAmmoCount() > 0 then
			attacker:getModData().CheckFired = weapon:getCurrentAmmoCount()
		elseif	weapon:isRoundChambered() then
			attacker:getModData().CheckFired = 1
		else	attacker:getModData().CheckFired = nil
		end
	end

	--------------------
	--  LAUNCHER FIRE --
	--------------------

	--------------------------
	--  3 ROUND BURST 	--
	--  CALC AMMO ON PRESS	--
	--------------------------
	if 	(weapon:isAimedFirearm()) and (not weapon:isAimedHandWeapon()) and (not isShotgun(weapon)) and
		((weapon:haveChamber() ~= false and weapon:isRoundChambered() == true) or (weapon:haveChamber() == false)) then		-- NO DEDUCT IF NO AMMO
		local current = weapon:getCurrentAmmoCount()
		local fired = 0

		if	(weapon:getFireMode() == "[2]Burst") then
			fired = 1
		elseif	(weapon:getFireMode() == "[3]Burst") then
			fired = 2
		elseif	(weapon:getFireMode() == "[3]Rotary") then
			fired = 2
		elseif	(weapon:getFireMode() == "[6]Rotary") then
			fired = 5
		elseif	(weapon:getFireMode() == "Auto") then
			fired = 2
		end

		if 	(current < fired) then
			fired = current			-- PREVENT NEGATIVE AMMO
		end
		weapon:setCurrentAmmoCount(current-fired)

	--	if	(fired ~= 0) and (weapon:getModData().AutoReload == 1) then
	--		WeaponReloadScript(44)
	--		weapon:getModData().AutoReload = 0
	--	end

	end
end


--------------------------------------------------------------------------
--  PROCESSED BY (OnPlayerUpdate) APPLYING RECOIL TO (BeenMovingFor)	--
--  TO SIMULATE MUZZLE CLIMB, PENALIZING RAPID SUCCESSIVE SHOTS...	--
--------------------------------------------------------------------------
local function ApplyRecoil()
	local	attacker	= getSpecificPlayer(0)
	local	check		= attacker:getModData().CheckFired
	local	gun		= attacker:getPrimaryHandItem()
	local	Moving		= attacker:getBeenMovingFor()
	local	aimtime		= 0
	if	(instanceof(gun,"HandWeapon")) and gun:isAimedFirearm() then
		aimtime		= gun:getAimingTime()
	end
	local	support		= attacker:getSecondaryHandItem()

	if (attacker:isAiming()) then
		if gun ~= nil and (instanceof(gun,"HandWeapon")) then
			if	(gun:isAimedFirearm()) and (gun:isRanged()) then
				local	ammo		= gun:getCurrentAmmoCount()
				local	mode		= gun:getFireMode()
			--	if	(check) and (ammo == (check - 1)) then
				if	((check) and (ammo == (check - 1) or not gun:isRoundChambered())) or
					((check) and (mode == "Auto" or mode == "[3]Burst" or mode == "[2]Burst") and (ammo <= (check - 2) or not gun:isRoundChambered())) then
					local AimLevel	= attacker:getPerkLevel(Perks.Aiming)		-- ONLY 1x LEVEL APPLIED RECOIL.. TOO EASY
					local Delay 	= gun:getModData().TempRecoilDelay - (AimLevel)
			--		local AimLevel	= 0						-- DONT LEVEL APPLIED RECOIL.. TOO EASY
			--		local Delay 	= gun:getModData().TempRecoilDelay - (AimLevel * 2)
					if (support) and (gun ~= support) then
						Delay = Delay * 2
					end
					if mode == "[2]Burst" then Delay = Delay * 1.25
					elseif mode == "[3]Burst" then Delay = Delay * 1.5
					elseif mode == "Auto" then Delay = Delay * 1.5
					end

					attacker:setBeenMovingFor(Moving + Delay)
			--		attacker:getModData().CheckFired = gun:getCurrentAmmoCount()
					attacker:getModData().CheckFired = nil
				----------------------
				--  OPTIONS BOX 8  --
				----------------------
				elseif (GUNFIGHTER.OPTIONS.options.box8 == true) and ((attacker:getVariableBoolean("isLoading")) or (attacker:getVariableBoolean("isRacking")) or (attacker:getVariableBoolean("isUnloading"))) then
					if (Moving < 70 - aimtime) then
						attacker:setBeenMovingFor(70 - aimtime)
					end
				end
			end
		end
	----------------------
	--  OPTIONS BOX 8  --
	----------------------
	elseif (GUNFIGHTER.OPTIONS.options.box8 == true) then
		if (Moving < 70 - aimtime) then
			attacker:setBeenMovingFor(70 - aimtime)
		end
	end
end


--------------------------------------------------------------------------
--  PROCESS HIT CHANCE FOR DISPLAY PURPOSES, THEN FILTER MISSES IF	--
--  DYNAMIC RANGE IS ENABLED. ALSO TOGGLES RECOIL DELAY FROM 0 TO TEMP	--
--  FOR WORKING FIREMODE.						--
--------------------------------------------------------------------------
local function DynamicRangeModifier(attacker, target, weapon, damage)

	---------------------
	--  OPTIONS BOX 2  --
	--  OPTIONS BOX 7  --
	---------------------
	if (GUNFIGHTER.OPTIONS.options.box2 == true) or (GUNFIGHTER.OPTIONS.options.dropdown7 > 1) then
		if weapon:isAimedFirearm() and not weapon:isAimedHandWeapon() and not isLauncher(weapon) then
			------------------------------------------
			--  START WITH FRESH HITCHANCE VARIABLE	--
			------------------------------------------
			local	NewCalc = 0
			local	DFactor	= 0

			---------------------
			--  OPTIONS BOX 7  --
			---------------------
			if (GUNFIGHTER.OPTIONS.options.dropdown7 > 1) then
				local scriptItem = weapon:getScriptItem()
				if weapon:getFireMode() == "Auto" then
					weapon:setRecoilDelay(0)
				else	calcRecoilDelay(weapon)
				end
				---------------------
				--  DYNAMIC FACTOR --
				---------------------
				if	(GUNFIGHTER.OPTIONS.options.dropdown7 == 2) then DFactor = 2.5
				elseif	(GUNFIGHTER.OPTIONS.options.dropdown7 == 3) then DFactor = 5
				elseif	(GUNFIGHTER.OPTIONS.options.dropdown7 == 4) then DFactor = 7.5
				elseif	(GUNFIGHTER.OPTIONS.options.dropdown7 == 5) then DFactor = 10
				end
			end

			NewCalc	= weapon:getHitChance()
			
			local AimLevel	= attacker:getPerkLevel(Perks.Aiming)
			local AimMod	= weapon:getAimingPerkHitChanceModifier()
			local AimTime	= weapon:getAimingTime()
			local Moving	= attacker:getBeenMovingFor()
		--	local MoveTime
		--	if	Moving - AimTime <= 0 then
		--		MoveTime = 0
		--	else	MoveTime = Moving - AimTime
		--	end

			local CQB = 0
			if weapon:getModData().CQB ~= nil then
				CQB = weapon:getModData().CQB
			end

			local Max	= weapon:getMaxRange() + CQB
			local Min	= weapon:getMinRange()
			local RangeMod	= weapon:getAimingPerkRangeModifier()
			local Effective	= (RangeMod * AimLevel / 2.5) + Max
			local Tloc 	= target:getCurrentSquare()
			local Aloc	= attacker:getCurrentSquare()
			local Dist	= getDistanceBetween(Tloc,Aloc)
		--	local Factor	= (10-(Dist-Min)/Effective * 7.5) * 10		-- WHOLE NUMBER 100
		--	local Factor	= (10-(Dist-Min)/Effective * 10) * 10		-- WHOLE NUMBER 100
			local Factor	= (10-(Dist-Min)/Effective * DFactor) * 10	-- WHOLE NUMBER 100
			local Roll	= 0

			------------------------------------------
			--  CLONE OF VANILLA JAVA CALCULATIONS	--
			------------------------------------------
			NewCalc = NewCalc + ((AimMod / 2) * AimLevel)			-- AIM PERK LEVEL

			if attacker:HasTrait("Marksman") then				-- MARKSMAN TRAIT
				NewCalc = NewCalc + 20
			end

			if weapon:isRanged() then
				if	weapon:getMinRangeRanged() > 0 then		-- SCOPE MIN RANGE PENALTY
					if Dist < weapon:getMinRangeRanged() then
						NewCalc = NewCalc - 50
			--		elseif	Dist < Min then
			--			NewCalc = NewCalc - 50			-- I DID THIS WRONG
					end
				elseif	Dist < 1.5 then					-- POINT BLANK BONUS
					NewCalc = NewCalc + 15
				end
				if	Moving > (AimTime + AimLevel) then				-- MOVING PENALTY
			--		NewCalc = NewCalc - (Moving - (AimTime + AimLevel))		-- CLEARLY JAVA TAKES LESS NOW
					NewCalc = NewCalc - ( (Moving - (AimTime + AimLevel)) * 0.75)	-- HALF SEEMS CLOSER
				end
				if	NewCalc < 0 then				-- MIN IS ZERO, NOT 10
					NewCalc = 0
				end
				if	NewCalc > 100 then
					NewCalc = 100
				end
			end
											-- DO BODYPART PAIN CALC HERE

			---------------------------------------------------------------------------
			--  APPLY NEW RANGE PENALTY BASED ON (Factor) TO RE-CALCULATED HITCHANCE --
			---------------------------------------------------------------------------

			---------------------
			--  OPTIONS BOX 7  --
			---------------------
			if (GUNFIGHTER.OPTIONS.options.dropdown7 > 1) then
				NewCalc = (Factor) * (NewCalc/100)

				if weapon:isRanged() then
					Roll = ZombRand(100)
					if 	Roll > Factor then			-- NO 200% SEND DONT USE (NewCalc)
						target:setAvoidDamage(true)		-- NO HIT, NO DAMAGE
						--target:setNoDamage(true)		-- TAKES HIT, NO DAMAGE
						---------------------
						--  OPTIONS BOX 2  --
						---------------------
						if (GUNFIGHTER.OPTIONS.options.box2 == true) then
							attacker:Say("["..tostring(math.floor((Dist * 100) / 100)).."] "..tostring(round(NewCalc, 1)).."% Roll("..tostring(Roll).."/"..tostring(round(Factor,1))..") - Calculated Miss", 0.8, 0.8, 0.8, UIFont.Small, 30.0, "radio")
						end
						return
					end
				end
			end
			---------------------
			--  OPTIONS BOX 2  --
			---------------------
			if (GUNFIGHTER.OPTIONS.options.box2 == true) then
				attacker:Say("")
				attacker:Say("")
				attacker:Say("")
				attacker:Say("")
	--			attacker:Say("["..tostring(math.floor((Dist * 100) / 100)).."] "..tostring(round(Factor, 1)).."%", 0.8, 0.8, 0.8, UIFont.Small, 30.0, "radio")
	--			attacker:Say("["..tostring(math.floor((Dist * 100) / 100)).."] "..tostring(round(NewCalc, 1)).."%", 0.8, 0.8, 0.8, UIFont.Small, 30.0, "radio")
				attacker:Say("["..tostring(math.floor((Dist * 100) / 100)).."] "..tostring(round(NewCalc, 1)).."% Roll("..tostring(Roll).."/"..tostring(round(Factor,1))..")", 0.8, 0.8, 0.8, UIFont.Small, 30.0, "radio")
			end
		end
	end
end


--------------------------------------------------------------------------
--  SHOW DAMAGE ON HITS ONLY, BASED ON ZED HEALTH MOD by TommySticks	--
--  THIS DISPLAYS WEAPON DAMAGE, NOT TARGET HEALTH BECAUSE THERE MAY	--
--  BE SCALED (VELOCITY/DAMAGE LOSS) IMPLEMENTED AT A LATER TIME...	--
--------------------------------------------------------------------------
function ShowDamage()
	---------------------
	--  OPTIONS BOX 1  --
	---------------------
	if (GUNFIGHTER.OPTIONS.options.box1 == true) and (zTarget) and (zTarget ~= getSpecificPlayer(0)) then
--	if (getSpecificPlayer(0):getModData().ShowDamage == true) and (zTarget) and (getSpecificPlayer(0):canSee(zTarget)) then		TESTING ONLY
		if zedDown > 0 then
			zedDown = zedDown - 1;
			print(zedDown);
		end
		if zedDown == 2 then
			zhealth = zrnd(zTarget:getHealth());
			zhpmx = zrnd(zTarget:getModData().mHealth) * 0.01;
			if zhealth >= -666 then
				damage = zhealth - zTarget:getModData().newHealth;
				if damage < 0 then 
					damage = damage * -1		-- DONT CALL RANGE CALC MISSES
					if damage ~= 0 then
						zTarget:Say(tostring(damage), 1.0, 0.0, 0.0, UIFont.Small, 30.0, "radio")
					end
				end
			end
			if zhealth < -666 then
				zTarget:Say("!!!", 1.0, 0.0, 0.0, UIFont.Small, 30.0, "radio")
			end
		end	
	end
end

function TargetInfo(attacker, target, weapon, damage)
	if (GUNFIGHTER.OPTIONS.options.box1 == true) then
		zedDown = 4;
		zTarget = target;
		zTarget:getModData().newHealth = zrnd(zTarget:getHealth());
	end
end

local function ZombieHealth(zombie)
	if (GUNFIGHTER.OPTIONS.options.box1 == true) then		-- PREVENT FLASHING ??
		zMod = zombie:getModData();
		if zMod.hTag ~= true then
			zMod.hTag = true;
		zMod.mHealth = tostring(zrnd(zombie:getHealth()));
		end
	end
end

function zrnd(num)
	local number = num
	if number == nil then				-- SuperSurvivor Compat
		return 0
	else
		return math.floor(num * 100 + 0.5);
	end
end

zedDown = 0;


Events.OnZombieUpdate.Add(ZombieHealth)
Events.OnPlayerUpdate.Add(ApplyRecoil)
Events.OnPlayerUpdate.Add(ShowDamage)
Events.OnPlayerUpdate.Add(HeadsUpDisplay)
Events.OnPlayerUpdate.Add(WeaponLightBeam)
Events.OnKeyPressed.Add(WeaponLightToggle)
Events.OnKeyPressed.Add(WeaponMeleeToggle)
Events.OnKeyPressed.Add(FirearmMagazineToggle)
Events.OnKeyPressed.Add(WeaponAltLoadToggle)
Events.OnKeyPressed.Add(WeaponSelectFire)

Events.OnKeyPressed.Add(WeaponReloadScript)

Events.OnWeaponSwing.Add(SendHit)
Events.OnWeaponHitCharacter.Add(TargetInfo)
Events.OnWeaponHitCharacter.Add(DynamicRangeModifier)

Events.OnWeaponSwing.Add(BreakAttachmentOnFire)
Events.OnWeaponHitCharacter.Add(BreakAttachmentOnMelee)
Events.OnPlayerUpdate.Add(WeaponStatus)					-- THIS WORKS BETTER, BUT CONSTANT SCAN
Events.OnPlayerUpdate.Add(AutoTransform)




-- Events.OnWeaponSwingHitPoint.Add(BreakAttachmentOnMelee)
-- Events.OnWeaponSwing.Add(WeaponStatus)				-- MOMENTARY JAM
-- Events.OnWeaponHitCharacter.Add()
-- Events.OnWeaponSwingHitPoint.Add()
-- Events.OnWeaponSwing.Add();
-- Events.OnZombieUpdate.Add();
-- Events.OnPlayerUpdate.Add()













--[[	FIRST ATTEMPT FOR REFERENCE... NOT USED
------------------------------------------------------------------
--  DYNAMIC HITCHANCE CALCULATION USING SPECS IN WEAPON SCRIPT	--
------------------------------------------------------------------
local function ReCalculateHitChance(attacker, weapon)
	local Radius	= 0
	local Zoom	= 0
	local Stock	= 0
	local Spread	= 0
	local Recoil	= 0
	local Grip	= 0
	local Mass	= weapon:getWeight()

	if weapon:getModData().SightRadius ~= nil then
		Radius = weapon:getModData().SightRadius
	end
	if weapon:getModData().Magnification ~= nil then
		Zoom = weapon:getModData().Magnification
	end
	if weapon:getModData().StockBonus ~= nil then
		Stock = weapon:getModData().StockBonus
	end
	if weapon:getModData().SpreadBonus ~= nil then
		Spread = weapon:getModData().SpreadBonus
	end
	if weapon:getModData().CartridgeRecoil ~= nil then
		Recoil = weapon:getModData().CartridgeRecoil
	end
	if weapon:getModData().GripStability ~= nil then
		Grip = weapon:getModData().GripStability
	end

	local BaseHitChance = (15 + Radius + Zoom + Stock + Spread - (Recoil - (Mass * Grip))) * 1.5

	---------- TEST REVERSE MOVE AIM TIME PENALTY TO CALCULATE DIFFERENTLY -----------
	local Moving	= attacker:getBeenMovingFor()
	local AimTime	= weapon:getAimingTime()
	local AimLevel	= attacker:getPerkLevel(Perks.Aiming)
	local AimEffect	= weapon:getAimingPerkHitChanceModifier()

	if weapon:isRanged() and Moving > (AimTime + AimLevel) then
		BaseHitChance = BaseHitChance + (Moving - (AimTime + AimLevel))
	end

	----------- RE-APPLY NEW AIM TIME MOVEMENT PENALTY ---------------------
	if weapon:isRanged() and Moving > (AimTime + AimLevel) then		-- LOW AIMTIME = EASILY DISTURBED
		BaseHitChance = BaseHitChance - (Moving - (AimTime + AimLevel) * (AimEffect*3)/AimLevel)	-- HIGH AIMTIME = 
	end
	weapon:setHitChance(BaseHitChance)		-- LEVEL PERK IS DONE IN JAVA EACH SHOT
end
]]



--[[	JAVA
      if (weapon.getMinRangeRanged() > 0.0F)
      {
        if (dist < weapon.getMinRangeRanged()) {
          hitChance -= 50;
        }
      }
      else if ((dist < 1.5D) && (weapon.isRanged())) {
        hitChance += 15;
      }


      float armsPain = 0.0F;
      for (int x = BodyPartType.ToIndex(BodyPartType.Hand_L); x <= BodyPartType.ToIndex(BodyPartType.UpperArm_R); x++) {
        armsPain += ((BodyPart)owner.getBodyDamage().getBodyParts().get(x)).getPain();
      }
      if (armsPain > 0.0F) {
        hitChance = (int)(hitChance - armsPain / 10.0F);
      }
      if (hitChance <= 10) {
        hitChance = 10;
      }
      if ((hitChance > 100) || (!weapon.isRanged())) {
        hitChance = 100;
      }
]]