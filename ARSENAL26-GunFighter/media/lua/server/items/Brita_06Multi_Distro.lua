--[[	v1.1						
OPTION CONFIGURED MULTI-DISTRIBUTION METHOD SYSTEM DESIGNED BY ARSENAL[26].							
THIS IS A WORK IN PROGRESS, AND AS SUCH… NO PERMISSION IS GRANTED FOR USE OF							
ANY PORTION OF THIS FILE FOR 3RD PARTY MODS, TWEAKS, PATCHES, OR ANYTHING OF							
THE LIKE. THAT MEANS YOU DO NOT HAVE PERMISSION TO CHANGE A FEW NUMBERS							
AROUND AND POST ANY OF THIS AS YOUR OWN MOD.							
]]							
							
							
local	wBOW		-- TYPE				
local	wFLAME						
local	wGREN						
local	wMINI						
local	wLMG						
local	wSEMI						
local	wAUTO						
local	wSMG						
local	wLEVER						
local	wREV						
local	wPUMP						
local	wBOLT						
local	wBREAK						
local	wUSA		-- ORIGIN				
local	wSOV						
local	wKOR						
local	wPAC						
local	wCZE						
local	wEUR						
local	wISR						
local	wREST						
local	wBMG		-- CALIBER				
local	w4g						
local	w10g						
local	w12g						
local	w20g						
local	w3006						
local	w308						
local	w762x54r						
local	w545x39						
local	w762x39						
local	w556						
local	w223						
local	w4570						
local	w45LC						
local	w44						
local	w45						
local	w357						
local	w9						
local	w57						
local	w380						
local	w22						
local	wBB						
							
local	Case						
local	Suppress						
local	Optic						
local	Light						
local	Part						
local	AmmoCan						
local	AmmoBox						
local	StdMag						
local	ExtMag						
local	DrumMag						
local	PolyCan						
local	SmKnife						
local	LgKnife						
local	Sword						
local	Axe						
local	Blunt						
local	Spear						
local	Armor						
							
local	x90						
local	CIVxLEO						
local	CIVxMIL						
local	LEOxCIV						
local	LEOxMIL						
local	MILxNON						
local	SECxNON						
local	HNTxNON						
local	SURxNON						
							
local	GUNRollGUN						
local	GUNRollPART						
local	GUNRollAMMO						
local	GUNRollARMOR						
local	LEORollGUN						
--local	LEORollPART						
local	LEORollAMMO						
local	LEORollARMOR						
local	MILRollGUN						
--local	MILRollPART						
local	MILRollAMMO						
local	MILRollARMOR						
local	SECRollGUN						
--local	SECRollPART						
local	SECRollAMMO						
local	SECRollARMOR						
local	SURRollGUN						
local	SURRollPART						
local	SURRollAMMO						
local	SURRollARMOR						
local	HNTRollGUN						
local	HNTRollPART						
local	HNTRollAMMO						
local	HNTRollARMOR						
							
local	CIVx						
local	LEOx						
local	MILx						
local	SECx						
local	HNTx						
local	SURx						
local	CIVammo						
local	LEOammo						
local	MILammo						
local	SECammo						
local	HNTammo						
local	SURammo						
local	REGION						
							
local	xBOW	=	0				
local	xFLAME	=	0				
local	xGREN	=	0				
local	xMINI	=	0				
local	xLMG	=	0				
local	xSEMI	=	0				
local	xAUTO	=	0				
local	xSMG	=	0				
local	xLEVER	=	0				
local	xREV	=	0				
local	xPUMP	=	0				
local	xBOLT	=	0				
local	xBREAK	=	0				
local	xUSA	=	0				
local	xSOV	=	0				
local	xKOR	=	0				
local	xPAC	=	0				
local	xCZE	=	0				
local	xEUR	=	0				
local	xISR	=	0				
local	xREST	=	0				
local	xBMG	=	0				
local	x4g	=	0				
local	x10g	=	0				
local	x12g	=	0				
local	x20g	=	0				
local	x3006	=	0				
local	x308	=	0				
local	x762x54r	=	0				
local	x545x39	=	0				
local	x762x39	=	0				
local	x556	=	0				
local	x223	=	0				
local	x4570	=	0				
local	x45LC	=	0				
local	x44	=	0				
local	x45	=	0				
local	x357	=	0				
local	x9	=	0				
local	x57	=	0				
local	x380	=	0				
local	x22	=	0				
local	xBB	=	0				
							
local	xCase	=	0				
local	xSuppress	=	0				
local	xOptic	=	0				
local	xLight	=	0				
local	xPart	=	0				
local	xAmmoCan	=	0				
local	xAmmoBox	=	0				
local	xStdMag	=	0				
local	xExtMag	=	0				
local	xDrumMag	=	0				
local	xPolyCan	=	0				
local	xSmKnife	=	0				
local	xLgKnife	=	0				
local	xSword	=	0				
local	xAxe	=	0				
local	xBlunt	=	0				
local	xSpear	=	0				
local	xArmor	=	0				
							
local	MILxUSA	=	0				
local	MILxEUR	=	0				
local	MILxSOV	=	0				
local	MILxCZE	=	0				
local	MILxKOR	=	0				
local	MILxPAC	=	0				
local	MILxISR	=	0				
							
							
if ModOptions and ModOptions.getInstance then							
	print("MOD OPTIONS DETECTED - DISTRO")						
	local	settings	=	GUNFIGHTER.OPTIONS			
	ModOptions:loadFile()						
							
	wBOW	= round(((GUNFIGHTER.OPTIONS.options.dropdown20) - 1) / 10,1)					
	wFLAME	= round(((GUNFIGHTER.OPTIONS.options.dropdown21) - 1) / 10,1)					
	wGREN	= round(((GUNFIGHTER.OPTIONS.options.dropdown22) - 1) / 10,1)					
	wMINI	= round(((GUNFIGHTER.OPTIONS.options.dropdown23) - 1) / 10,1)					
	wLMG	= round(((GUNFIGHTER.OPTIONS.options.dropdown24) - 1) / 10,1)					
	wSEMI	= round(((GUNFIGHTER.OPTIONS.options.dropdown25) - 1) / 10,1)					
	wAUTO	= round(((GUNFIGHTER.OPTIONS.options.dropdown26) - 1) / 10,1)					
	wSMG	= round(((GUNFIGHTER.OPTIONS.options.dropdown27) - 1) / 10,1)					
	wLEVER	= round(((GUNFIGHTER.OPTIONS.options.dropdown28) - 1) / 10,1)					
	wREV	= round(((GUNFIGHTER.OPTIONS.options.dropdown29) - 1) / 10,1)					
	wPUMP	= round(((GUNFIGHTER.OPTIONS.options.dropdown30) - 1) / 10,1)					
	wBOLT	= round(((GUNFIGHTER.OPTIONS.options.dropdown31) - 1) / 10,1)					
	wBREAK	= round(((GUNFIGHTER.OPTIONS.options.dropdown32) - 1) / 10,1)					
	wUSA	= round(((GUNFIGHTER.OPTIONS.options.dropdown33) - 1) / 10,1)					
	wSOV	= round(((GUNFIGHTER.OPTIONS.options.dropdown34) - 1) / 10,1)					
	wKOR	= round(((GUNFIGHTER.OPTIONS.options.dropdown35) - 1) / 10,1)					
	wPAC	= round(((GUNFIGHTER.OPTIONS.options.dropdown36) - 1) / 10,1)					
	wCZE	= round(((GUNFIGHTER.OPTIONS.options.dropdown37) - 1) / 10,1)					
	wEUR	= round(((GUNFIGHTER.OPTIONS.options.dropdown38) - 1) / 10,1)					
	wISR	= round(((GUNFIGHTER.OPTIONS.options.dropdown39) - 1) / 10,1)					
	wREST	= round(((GUNFIGHTER.OPTIONS.options.dropdown40) - 1) / 10,1)					
	wBMG	= round(((GUNFIGHTER.OPTIONS.options.dropdown41) - 1) / 10,1)					
	w4g	= round(((GUNFIGHTER.OPTIONS.options.dropdown42) - 1) / 10,1)					
	w10g	= round(((GUNFIGHTER.OPTIONS.options.dropdown43) - 1) / 10,1)					
	w12g	= round(((GUNFIGHTER.OPTIONS.options.dropdown44) - 1) / 10,1)					
	w20g	= round(((GUNFIGHTER.OPTIONS.options.dropdown45) - 1) / 10,1)					
	w3006	= round(((GUNFIGHTER.OPTIONS.options.dropdown46) - 1) / 10,1)					
	w308	= round(((GUNFIGHTER.OPTIONS.options.dropdown47) - 1) / 10,1)					
	w762x54r	= round(((GUNFIGHTER.OPTIONS.options.dropdown48) - 1) / 10,1)					
	w545x39	= round(((GUNFIGHTER.OPTIONS.options.dropdown49) - 1) / 10,1)					
	w762x39	= round(((GUNFIGHTER.OPTIONS.options.dropdown50) - 1) / 10,1)					
	w556	= round(((GUNFIGHTER.OPTIONS.options.dropdown51) - 1) / 10,1)					
	w223	= round(((GUNFIGHTER.OPTIONS.options.dropdown52) - 1) / 10,1)					
	w45LC	= round(((GUNFIGHTER.OPTIONS.options.dropdown53) - 1) / 10,1)					
	w4570	= round(((GUNFIGHTER.OPTIONS.options.dropdown54) - 1) / 10,1)					
	w44	= round(((GUNFIGHTER.OPTIONS.options.dropdown55) - 1) / 10,1)					
	w45	= round(((GUNFIGHTER.OPTIONS.options.dropdown56) - 1) / 10,1)					
	w357	= round(((GUNFIGHTER.OPTIONS.options.dropdown57) - 1) / 10,1)					
	w9	= round(((GUNFIGHTER.OPTIONS.options.dropdown58) - 1) / 10,1)					
	w57	= round(((GUNFIGHTER.OPTIONS.options.dropdown59) - 1) / 10,1)					
	w380	= round(((GUNFIGHTER.OPTIONS.options.dropdown60) - 1) / 10,1)					
	w22	= round(((GUNFIGHTER.OPTIONS.options.dropdown61) - 1) / 10,1)					
	wBB	= round(((GUNFIGHTER.OPTIONS.options.dropdown62) - 1) / 10,1)					
							
--	xBOW	=	1 -	wBOW			
--	xFLAME	=	1 -	wFLAME			
--	xGREN	=	1 -	wGREN			
	xMINI	=	1 -	wMINI			
	xLMG	=	1 -	wLMG			
	xSEMI	=	1 -	wSEMI			
	xAUTO	=	1 -	wAUTO			
	xSMG	=	1 -	wSMG			
	xLEVER	=	1 -	wLEVER			
	xREV	=	1 -	wREV			
	xPUMP	=	1 -	wPUMP			
	xBOLT	=	1 -	wBOLT			
	xBREAK	=	1 -	wBREAK			
	xUSA	=	1 -	wUSA			
	xSOV	=	1 -	wSOV			
	xKOR	=	1 -	wKOR			
	xPAC	=	1 -	wPAC			
	xCZE	=	1 -	wCZE			
	xEUR	=	1 -	wEUR			
	xISR	=	1 -	wISR			
	xREST	=	1 -	wREST			
--	xBMG	=	1 -	wBMG			
--	x4g	=	1 -	w4g			
--	x10g	=	1 -	w10g			
--	x12g	=	1 -	w12g			
--	x20g	=	1 -	w20g			
--	x3006	=	1 -	w3006			
--	x308	=	1 -	w308			
--	x762x54r	=	1 -	w762x54r			
--	x545x39	=	1 -	w545x39			
--	x762x39	=	1 -	w762x39			
--	x556	=	1 -	w556			
--	x223	=	1 -	w223			
--	x4570	=	1 -	w45LC			
--	x45LC	=	1 -	w4570			
--	x44	=	1 -	w44			
--	x45	=	1 -	w45			
--	x357	=	1 -	w357			
--	x9	=	1 -	w9			
--	x57	=	1 -	w57			
--	x380	=	1 -	w380			
--	x22	=	1 -	w22			
--	xBB	=	1 -	wBB			
							
	Case	= (GUNFIGHTER.OPTIONS.options.dropdown63) * 0.01 - 0.01					
	Suppress 	= ((GUNFIGHTER.OPTIONS.options.dropdown64) - 1)					
	Optic	= ((GUNFIGHTER.OPTIONS.options.dropdown65) - 1)					
	Light	= ((GUNFIGHTER.OPTIONS.options.dropdown66) - 1)					
	Part	= ((GUNFIGHTER.OPTIONS.options.dropdown67) - 1)					
	AmmoCan	= ((GUNFIGHTER.OPTIONS.options.dropdown68) * 4) - 4					
	AmmoBox	= ((GUNFIGHTER.OPTIONS.options.dropdown69) * 4) - 4					
	StdMag	= ((GUNFIGHTER.OPTIONS.options.dropdown70) - 1)					
	ExtMag	= ((GUNFIGHTER.OPTIONS.options.dropdown71) - 1) 					
	DrumMag	= ((GUNFIGHTER.OPTIONS.options.dropdown72) - 1)					
	PolyCan	= round(((GUNFIGHTER.OPTIONS.options.dropdown73) - 1) /10,1)					
	SmKnife	= ((GUNFIGHTER.OPTIONS.options.dropdown74) - 1) / 2					
	LgKnife	= ((GUNFIGHTER.OPTIONS.options.dropdown75) - 1) / 2					
	Sword	= (GUNFIGHTER.OPTIONS.options.dropdown76) * 0.01 - 0.01					
	Axe	= ((GUNFIGHTER.OPTIONS.options.dropdown77) - 1) / 2					
	Blunt	= ((GUNFIGHTER.OPTIONS.options.dropdown78) - 1) / 2					
	Spear	= ((GUNFIGHTER.OPTIONS.options.dropdown79) - 1) / 2					
	Armor	= ((GUNFIGHTER.OPTIONS.options.dropdown80) - 1) / 10					
							
--	xCase	=	1 - round(((GUNFIGHTER.OPTIONS.options.dropdown63) - 1) / 10, 1)				
--	xSuppress	=	1 - round(((GUNFIGHTER.OPTIONS.options.dropdown64) - 1) / 10, 1)				
--	xOptic	=	1 - round(((GUNFIGHTER.OPTIONS.options.dropdown65) - 1) / 10, 1)				
--	xLight	=	1 - round(((GUNFIGHTER.OPTIONS.options.dropdown66) - 1) / 10, 1)				
--	xPart	=	1 - round(((GUNFIGHTER.OPTIONS.options.dropdown67) - 1) / 10, 1)				
--	xAmmoCan	=	1 - round(((GUNFIGHTER.OPTIONS.options.dropdown68) - 1) / 10, 1)				
--	xAmmoBox	=	1 - round(((GUNFIGHTER.OPTIONS.options.dropdown69) - 1) / 10, 1)				
--	xStdMag	=	1 - round(((GUNFIGHTER.OPTIONS.options.dropdown70) - 1) / 10, 1)				
--	xXExtMag	=	1 - round(((GUNFIGHTER.OPTIONS.options.dropdown71) - 1) / 10, 1)				
--	xDrumMag	=	1 - round(((GUNFIGHTER.OPTIONS.options.dropdown72) - 1) / 10, 1)				
--	xPolyCan	=	1 - round(((GUNFIGHTER.OPTIONS.options.dropdown73) - 1) / 10, 1)				
--	xSmKnife	=	1 - round(((GUNFIGHTER.OPTIONS.options.dropdown74) - 1) / 10, 1)				
--	xLgKnife	=	1 - round(((GUNFIGHTER.OPTIONS.options.dropdown75) - 1) / 10, 1)				
--	xSword	=	1 - round(((GUNFIGHTER.OPTIONS.options.dropdown76) - 1) / 10, 1)				
--	xAxe	=	1 - round(((GUNFIGHTER.OPTIONS.options.dropdown77) - 1) / 10, 1)				
--	xBlunt	=	1 - round(((GUNFIGHTER.OPTIONS.options.dropdown78) - 1) / 10, 1)				
--	xSpear	=	1 - round(((GUNFIGHTER.OPTIONS.options.dropdown79) - 1) / 10, 1)				
--	xArmor	=	1 - round(((GUNFIGHTER.OPTIONS.options.dropdown80) - 1) / 10, 1)				
							
	if wBOW <= 0 then xBOW = 100; wBOW = 1; print("REMOVED wBOW") end						
	if wFLAME <= 0 then xFLAME = 100; wFLAME = 1; print("REMOVED wFLAME") end						
	if wGREN <= 0 then xGREN = 100; wGREN = 1; print("REMOVED wGREN") end						
	if wMINI <= 0 then xMINI = 100; wMINI = 1; print("REMOVED wMINI") end						
	if wLMG <= 0 then xLMG = 100; wLMG = 1; print("REMOVED wLMG") end						
	if wSEMI <= 0 then xSEMI = 100; wSEMI = 1; print("REMOVED wSEMI") end						
	if wAUTO <= 0 then xAUTO = 100; wAUTO = 1; print("REMOVED wAUTO") end						
	if wSMG <= 0 then xSMG = 100; wSMG = 1; print("REMOVED wSMG") end						
	if wLEVER <= 0 then xLEVER = 100; wLEVER = 1; print("REMOVED wLEVER") end						
	if wREV <= 0 then xREV = 100; wREV = 1; print("REMOVED wREV") end						
	if wPUMP <= 0 then xPUMP = 100; wPUMP = 1; print("REMOVED wPUMP") end						
	if wBOLT <= 0 then xBOLT = 100; wBOLT = 1; print("REMOVED wBOLT") end						
	if wBREAK <= 0 then xBREAK = 100; wBREAK = 1; print("REMOVED wBREAK") end						
	if wUSA <= 0 then xUSA = 100; wUSA = 1; print("REMOVED wUSA") end						
	if wSOV <= 0 then xSOV = 100; wSOV = 1; print("REMOVED wSOV") end						
	if wKOR <= 0 then xKOR = 100; wKOR = 1; print("REMOVED wKOR") end						
	if wPAC <= 0 then xPAC = 100; wPAC = 1; print("REMOVED wPAC") end						
	if wCZE <= 0 then xCZE = 100; wCZE = 1; print("REMOVED wCZE") end						
	if wEUR <= 0 then xEUR = 100; wEUR = 1; print("REMOVED wEUR") end						
	if wISR <= 0 then xISR = 100; wISR = 1; print("REMOVED wISR") end						
	if wREST <= 0 then xREST = 100; wREST = 1; print("REMOVED wREST") end						
	if wBMG <= 0 then xBMG = 100; wBMG = 1; print("REMOVED wBMG") end						
	if w4g <= 0 then x4g = 100; w4g = 1; print("REMOVED w4g") end						
	if w10g <= 0 then x10g = 100; w10g = 1; print("REMOVED w10g") end						
	if w12g <= 0 then x12g = 100; w12g = 1; print("REMOVED w12g") end						
	if w20g <= 0 then x20g = 100; w20g = 1; print("REMOVED w20g") end						
	if w3006 <= 0 then x3006 = 100; w3006 = 1; print("REMOVED w3006") end						
	if w308 <= 0 then x308 = 100; w308 = 1; print("REMOVED w308") end						
	if w762x54r <= 0 then x762x54r = 100; w762x54r = 1; print("REMOVED w762x54r") end						
	if w545x39 <= 0 then x545x39 = 100; w545x39 = 1; print("REMOVED w545x39") end						
	if w762x39 <= 0 then x762x39 = 100; w762x39 = 1; print("REMOVED w762x39") end						
	if w556 <= 0 then x556 = 100; w556 = 1; print("REMOVED w556") end						
	if w223 <= 0 then x223 = 100; w223 = 1; print("REMOVED w223") end						
	if w4570 <= 0 then x4570 = 100; w4570 = 1; print("REMOVED w4570") end						
	if w45LC <= 0 then x45LC = 100; w45LC = 1; print("REMOVED w45LC") end						
	if w44 <= 0 then x44 = 100; w44 = 1; print("REMOVED w44") end						
	if w45 <= 0 then x45 = 100; w45 = 1; print("REMOVED w45") end						
	if w357 <= 0 then x357 = 100; w357 = 1; print("REMOVED w357") end						
	if w9 <= 0 then x9 = 100; w9 = 1; print("REMOVED w9") end						
	if w57 <= 0 then x57 = 100; w57 = 1; print("REMOVED w57") end						
	if w380 <= 0 then x380 = 100; w380 = 1; print("REMOVED w380") end						
	if w22 <= 0 then x22 = 100; w22 = 1; print("REMOVED w22") end						
	if wBB <= 0 then xBB = 100; wBB = 1; print("REMOVED wBB") end						
							
	if Case <= 0 then xCase = 100; Case = 1; print("REMOVED Case") end						
	if Suppress  <= 0 then xSuppress = 100; Suppress  = 1; print("REMOVED Suppress ") end						
	if Optic <= 0 then xOptic = 100; Optic = 1; print("REMOVED Optic") end						
	if Light <= 0 then xLight = 100; Light = 1; print("REMOVED Light") end						
	if Part <= 0 then xPart = 100; Part = 1; print("REMOVED Part") end						
	if AmmoCan <= 0 then xAmmoCan = 100; AmmoCan = 1; print("REMOVED AmmoCan") end						
	if AmmoBox <= 0 then xAmmoBox = 100; AmmoBox = 1; print("REMOVED AmmoBox") end						
	if StdMag <= 0 then xStdMag = 100; StdMag = 1; print("REMOVED StdMag") end						
	if ExtMag <= 0 then xExtMag = 100; ExtMag = 1; print("REMOVED ExtMag") end						
	if DrumMag <= 0 then xDrumMag = 100; DrumMag = 1; print("REMOVED DrumMag") end						
--	if PolyCan <= 0 then xPolyCan = 100; PolyCan = 1; print("REMOVED PolyCan") end						
	if SmKnife <= 0 then xSmKnife = 100; SmKnife = 1; print("REMOVED SmKnife") end						
	if LgKnife <= 0 then xLgKnife = 100; LgKnife = 1; print("REMOVED LgKnife") end						
	if Sword <= 0 then xSword = 100; Sword = 1; print("REMOVED Sword") end						
	if Axe <= 0 then xAxe = 100; Axe = 1; print("REMOVED Axe") end						
	if Blunt <= 0 then xBlunt = 100; Blunt = 1; print("REMOVED Blunt") end						
	if Spear <= 0 then xSpear = 100; Spear = 1; print("REMOVED Spear") end						
	if Armor <= 0 then xArmor = 100; Armor = 1; print("REMOVED Armor") end						
							
	x90	= (GUNFIGHTER.OPTIONS.options.dropdown81)					
	CIVxLEO	= (GUNFIGHTER.OPTIONS.options.dropdown82)					
	CIVxMIL	= (GUNFIGHTER.OPTIONS.options.dropdown83)					
	LEOxCIV	= (GUNFIGHTER.OPTIONS.options.dropdown84)					
	LEOxMIL	= (GUNFIGHTER.OPTIONS.options.dropdown85)					
	MILxNON	= (GUNFIGHTER.OPTIONS.options.dropdown86)					
	SECxNON	= (GUNFIGHTER.OPTIONS.options.dropdown87)					
	HNTxNON	= (GUNFIGHTER.OPTIONS.options.dropdown88)					
	SURxNON	= (GUNFIGHTER.OPTIONS.options.dropdown89)					
							
	if x90	== 1 then x90 =	100				
	elseif x90	== 2 then x90 =	0.75				
	elseif x90	== 3 then x90 =	0.5				
	elseif x90	== 4 then x90 =	0.25				
	elseif x90	== 5 then x90 =	0				
	end						
							
	if CIVxLEO	== 1 then CIVxLEO =	100				
	elseif CIVxLEO	== 2 then CIVxLEO =	0.75				
	elseif CIVxLEO	== 3 then CIVxLEO =	0.5				
	elseif CIVxLEO	== 4 then CIVxLEO =	0.25				
	elseif CIVxLEO	== 5 then CIVxLEO =	0				
	end						
							
	if CIVxMIL	== 1 then CIVxMIL =	100				
	elseif CIVxMIL	== 2 then CIVxMIL =	0.75				
	elseif CIVxMIL	== 3 then CIVxMIL =	0.5				
	elseif CIVxMIL	== 4 then CIVxMIL =	0.25				
	elseif CIVxMIL	== 5 then CIVxMIL =	0				
	end						
							
	if LEOxCIV	== 1 then LEOxCIV =	100				
	elseif LEOxCIV	== 2 then LEOxCIV =	0.75				
	elseif LEOxCIV	== 3 then LEOxCIV =	0.5				
	elseif LEOxCIV	== 4 then LEOxCIV =	0.25				
	elseif LEOxCIV	== 5 then LEOxCIV =	0				
	end						
							
	if LEOxMIL	== 1 then LEOxMIL =	100				
	elseif LEOxMIL	== 2 then LEOxMIL =	0.75				
	elseif LEOxMIL	== 3 then LEOxMIL =	0.5				
	elseif LEOxMIL	== 4 then LEOxMIL =	0.25				
	elseif LEOxMIL	== 5 then LEOxMIL =	0				
	end						
							
	if MILxNON	== 1 then MILxNON =	100				
	elseif MILxNON	== 2 then MILxNON =	0.75				
	elseif MILxNON	== 3 then MILxNON =	0.5				
	elseif MILxNON	== 4 then MILxNON =	0.25				
	elseif MILxNON	== 5 then MILxNON =	0				
	end						
							
	if SECxNON	== 1 then SECxNON =	100				
	elseif SECxNON	== 2 then SECxNON =	0.75				
	elseif SECxNON	== 3 then SECxNON =	0.5				
	elseif SECxNON	== 4 then SECxNON =	0.25				
	elseif SECxNON	== 5 then SECxNON =	0				
	end						
							
	if HNTxNON	== 1 then HNTxNON =	100				
	elseif HNTxNON	== 2 then HNTxNON =	0.75				
	elseif HNTxNON	== 3 then HNTxNON =	0.5				
	elseif HNTxNON	== 4 then HNTxNON =	0.25				
	elseif HNTxNON	== 5 then HNTxNON =	0				
	end						
							
	if SURxNON	== 1 then SURxNON =	100				
	elseif SURxNON	== 2 then SURxNON =	0.75				
	elseif SURxNON	== 3 then SURxNON =	0.5				
	elseif SURxNON	== 4 then SURxNON =	0.25				
	elseif SURxNON	== 5 then SURxNON =	0				
	end						
							
	GUNRollGUN		= (GUNFIGHTER.OPTIONS.options.dropdown90)				
	GUNRollAMMO		= (GUNFIGHTER.OPTIONS.options.dropdown91)				
	GUNRollPART		= (GUNFIGHTER.OPTIONS.options.dropdown92)				
	GUNRollARMOR		= (GUNFIGHTER.OPTIONS.options.dropdown93)				
	LEORollGUN		= (GUNFIGHTER.OPTIONS.options.dropdown94)				
	LEORollAMMO		= (GUNFIGHTER.OPTIONS.options.dropdown95)				
--	LEORollPART		= (GUNFIGHTER.OPTIONS.options.dropdown96)				
	LEORollARMOR		= (GUNFIGHTER.OPTIONS.options.dropdown97)				
	MILRollGUN		= (GUNFIGHTER.OPTIONS.options.dropdown98)				
	MILRollAMMO		= (GUNFIGHTER.OPTIONS.options.dropdown99)				
--	MILRollPART		= (GUNFIGHTER.OPTIONS.options.dropdown100)				
	MILRollARMOR		= (GUNFIGHTER.OPTIONS.options.dropdown101)				
	SECRollGUN		= (GUNFIGHTER.OPTIONS.options.dropdown102)				
	SECRollAMMO		= (GUNFIGHTER.OPTIONS.options.dropdown103)				
--	SECRollPART		= (GUNFIGHTER.OPTIONS.options.dropdown104)				
	SECRollARMOR		= (GUNFIGHTER.OPTIONS.options.dropdown105)				
	SURRollGUN		= (GUNFIGHTER.OPTIONS.options.dropdown106)				
	SURRollAMMO		= (GUNFIGHTER.OPTIONS.options.dropdown107)				
	SURRollPART		= (GUNFIGHTER.OPTIONS.options.dropdown108)				
	SURRollARMOR		= (GUNFIGHTER.OPTIONS.options.dropdown109)				
	HNTRollGUN		= (GUNFIGHTER.OPTIONS.options.dropdown110)				
	HNTRollAMMO		= (GUNFIGHTER.OPTIONS.options.dropdown111)				
	HNTRollPART		= (GUNFIGHTER.OPTIONS.options.dropdown112)				
	HNTRollARMOR		= (GUNFIGHTER.OPTIONS.options.dropdown113)				
							
	CIVx		= round((GUNFIGHTER.OPTIONS.options.dropdown114) / 10 + 1 - 0.1, 1)				
	LEOx		= round((GUNFIGHTER.OPTIONS.options.dropdown115) / 10 + 1 - 0.1, 1)				
	MILx		= round((GUNFIGHTER.OPTIONS.options.dropdown116) / 10 + 1 - 0.1, 1)				
	SECx		= round((GUNFIGHTER.OPTIONS.options.dropdown117) / 10 + 1 - 0.1, 1)				
	HNTx		= round((GUNFIGHTER.OPTIONS.options.dropdown118) / 10 + 1 - 0.1, 1)				
	SURx		= round((GUNFIGHTER.OPTIONS.options.dropdown119) / 10 + 1 - 0.1, 1)				
							
	if (GUNFIGHTER.OPTIONS.options.box120) == true then CIVammo = false else CIVammo = true end						
	if (GUNFIGHTER.OPTIONS.options.box121) == true then LEOammo = false else LEOammo = true end						
	if (GUNFIGHTER.OPTIONS.options.box122) == true then MILammo = false else MILammo = true end						
	if (GUNFIGHTER.OPTIONS.options.box123) == true then SECammo = false else SECammo = true end						
	if (GUNFIGHTER.OPTIONS.options.box124) == true then HNTammo = false else HNTammo = true end						
	if (GUNFIGHTER.OPTIONS.options.box125) == true then SURammo = false else SURammo = true end						
	REGION		= (GUNFIGHTER.OPTIONS.options.dropdown126)				
							
	if REGION == 1 then		-- ("United States")				
		MILxUSA = 100					
	elseif REGION == 2 then		-- ("Soviet Union")				
		MILxSOV = 100					
	elseif REGION == 3 then		-- ("Czech")				
		MILxCZE = 100					
	elseif REGION == 4 then		-- ("Korea")				
		MILxKOR = 100					
	elseif REGION == 5 then		-- ("China")				
		MILxPAC = 100					
	elseif REGION == 6 then		-- ("Europe")				
		MILxEUR = 100					
	elseif REGION == 7 then		-- ("Israel")				
		MILxISR = 100					
	end						
							
	print	("TYPE - Bow"	,	wBOW	,	xBOW	)
	print	("TYPE - Flamer"	,	wFLAME	,	xFLAME	)
	print	("TYPE - Launcher"	,	wGREN	,	xGREN	)
	print	("TYPE - Minigun"	,	wMINI	,	xMINI	)
	print	("TYPE - Machine-Gun"	,	wLMG	,	xLMG	)
	print	("TYPE - Auto Rifle Cal"	,	wAUTO	,	xAUTO	)
	print	("TYPE - Semi-Auto"	,	wSEMI	,	xSEMI	)
	print	("TYPE - Auto Pistol Cal"	,	wSMG	,	xSMG	)
	print	("TYPE - Lever-Action"	,	wLEVER	,	xLEVER	)
	print	("TYPE - Revolver"	,	wREV	,	xREV	)
	print	("TYPE - Pump-Action"	,	wPUMP	,	xPUMP	)
	print	("TYPE - Bolt-Action"	,	wBOLT	,	xBOLT	)
	print	("TYPE - Break-Barrel"	,	wBREAK	,	xBREAK	)
	print	("REGION - USA"	,	wUSA	,	xUSA	)
	print	("REGION - SOV"	,	wSOV	,	xSOV	)
	print	("REGION - KOR"	,	wKOR	,	xKOR	)
	print	("REGION - PAC"	,	wPAC	,	xPAC	)
	print	("REGION - CZE"	,	wCZE	,	xCZE	)
	print	("REGION - EUR"	,	wEUR	,	xEUR	)
	print	("REGION - ISR"	,	wISR	,	xISR	)
	print	("REGION - REST"	,	wREST	,	xREST	)
	print	("CALIBER - 50 BMG"	,	wBMG	,	xBMG	)
	print	("CALIBER - Shotgun 4g"	,	w4g	,	x4g	)
	print	("CALIBER - Shotgun 10g"	,	w10g	,	x10g	)
	print	("CALIBER - Shotgun 12g"	,	w12g	,	x12g	)
	print	("CALIBER - Shotgun 20g"	,	w20g	,	x20g	)
	print	("CALIBER - 30-06 SPG"	,	w3006	,	x3006	)
	print	("CALIBER - 308 WIN"	,	w308	,	x308	)
	print	("CALIBER - 762x54mm R"	,	w762x54r	,	x762x54r	)
	print	("CALIBER - 545x39mm"	,	w545x39	,	x545x39	)
	print	("CALIBER - 762x39mm"	,	w762x39	,	x762x39	)
	print	("CALIBER - 556x45mm"	,	w556	,	x556	)
	print	("CALIBER - 223 REM"	,	w223	,	x223	)
	print	("CALIBER - 45-70 GOV"	,	w4570	,	x4570	)
	print	("CALIBER - 45 LC"	,	w45LC	,	x45LC	)
	print	("CALIBER - 44 MAG"	,	w44	,	x44	)
	print	("CALIBER - 45 ACP"	,	w45	,	x45	)
	print	("CALIBER - 357 MAG"	,	w357	,	x357	)
	print	("CALIBER - 57x28mm"	,	w9	,	x9	)
	print	("CALIBER - 9x21mm"	,	w57	,	x57	)
	print	("CALIBER - 380 ACP"	,	w380	,	x380	)
	print	("CALIBER - 22 LR"	,	w22	,	x22	)
	print	("CALIBER - 177 BB"	,	wBB	,	xBB	)
	print	("Gun Case"	,	Case	,	xCase	)
	print	("Suppressor"	,	Suppress	,	xSuppress	)
	print	("Optic"	,	Optic	,	xOptic	)
	print	("Light"	,	Light	,	xLight	)
	print	("Part"	,	Part	,	xPart	)
	print	("Ammo Canister"	,	AmmoCan	,	xAmmoCan	)
	print	("Ammo Box"	,	AmmoBox	,	xAmmoBox	)
	print	("Std Mag"	,	StdMag	,	xStdMag	)
	print	("Ext Mag"	,	ExtMag	,	xExtMag	)
	print	("Drum Mag"	,	DrumMag	,	xDrumMag	)
	print	("Poly Canister"	,	PolyCan	,	xPolyCan	)
	print	("Melee Sml Knife"	,	SmKnife	,	xSmKnife	)
	print	("Melee Lrg Knife"	,	LgKnife	,	xLgKnife	)
	print	("Melee Sword"	,	Sword	,	xSword	)
	print	("Melee Axe"	,	Axe	,	xAxe	)
	print	("Melee Blunt"	,	Blunt	,	xBlunt	)
	print	("Melee Spear"	,	Spear	,	xSpear	)
	print	("Armor"	,	Armor	,	xArmor	)
	print	("x90"	,	x90)			
	print	("CIVxLEO"	,	CIVxLEO)			
	print	("CIVxMIL"	,	CIVxMIL)			
	print	("LEOxCIV"	,	LEOxCIV)			
	print	("LEOxMIL"	,	LEOxMIL)			
	print	("MILxNON"	,	MILxNON)			
	print	("SECxNON"	,	SECxNON)			
	print	("HNTxNON"	,	HNTxNON)			
	print	("SURxNON"	,	SURxNON)			
	print	("GUNRollGUN"	,	GUNRollGUN	)		
	print	("GUNRollPART"	,	GUNRollPART	)		
	print	("GUNRollAMMO"	,	GUNRollAMMO	)		
	print	("GUNRollARMOR"	,	GUNRollARMOR	)		
	print	("LEORollGUN"	,	LEORollGUN	)		
--	print	("LEORollPART"	,	LEORollPART	)		
	print	("LEORollAMMO"	,	LEORollAMMO	)		
	print	("LEORollARMOR"	,	LEORollARMOR	)		
	print	("MILRollGUN"	,	MILRollGUN	)		
--	print	("MILRollPART"	,	MILRollPART	)		
	print	("MILRollAMMO"	,	MILRollAMMO	)		
	print	("MILRollARMOR"	,	MILRollARMOR	)		
	print	("SECRollGUN"	,	SECRollGUN	)		
--	print	("SECRollPART"	,	SECRollPART	)		
	print	("SECRollAMMO"	,	SECRollAMMO	)		
	print	("SECRollARMOR"	,	SECRollARMOR	)		
	print	("SURRollGUN"	,	SURRollGUN	)		
	print	("SURRollPART"	,	SURRollPART	)		
	print	("SURRollAMMO"	,	SURRollAMMO	)		
	print	("SURRollARMOR"	,	SURRollARMOR	)		
	print	("HNTRollGUN"	,	HNTRollGUN	)		
	print	("HNTRollPART"	,	HNTRollPART	)		
	print	("HNTRollAMMO"	,	HNTRollAMMO	)		
	print	("HNTRollARMOR"	,	HNTRollARMOR	)		
	print	("CIVx"	,	CIVx)			
	print	("LEOx"	,	LEOx)			
	print	("MILx"	,	MILx)			
	print	("SECx"	,	SECx)			
	print	("HNTx"	,	HNTx)			
	print	("SURx"	,	SURx)			
	print	("CIVammo"	,	CIVammo)			
	print	("LEOammo"	,	LEOammo)			
	print	("MILammo"	,	MILammo)			
	print	("SECammo"	,	SECammo)			
	print	("HNTammo"	,	HNTammo)			
	print	("SURammo"	,	SURammo)			
	print	("MILITARY REGION"	,	REGION)			
end							


require "Items/SuburbsDistributions"											
require "Items/ProceduralDistributions"											
require "Vehicles/VehicleDistributions"											
require "Items/ItemPicker"											
											
----------------------------------------------------------											
--		GUN CASE CONTENTS			--						
----------------------------------------------------------											
											
	----------------------------------										
	--	CASE SMALL	CAP(2)	--							
	----------------------------------										
	SuburbsDistributions["Case_Small1"] = {				-- 22LR	500	points				
		rolls = 2,									
		items = {									
			"Base.Ruger_MK4",			100	- (100 * x90)	- (100 * xSEMI)	- (100 * xUSA)		,
			"Base.Buckmark",			100		- (100 * xSEMI)	- (100 * xUSA)		,
			"Base.Buckmark_Long",			100		- (100 * xSEMI)	- (100 * xUSA)		,
			"Base.HK4_22",			100		- (100 * xSEMI)	- (100 * xEUR)		,
			"Base.ZIP22",			100	- (100 * x90)	- (100 * xSEMI)	- (100 * xUSA)	- (100 * x90)	,
											
			"Base.22Clip",			50					,
			"Base.22Clip",			25					,
		},									
	};										
	SuburbsDistributions["Case_Small2"] = {				-- 380	900	points				
		rolls = 2,									
		items = {									
			"Base.G42",			100	- (100 * x90)	- (100 * xSEMI)	- (100 * xEUR)	- (100 * x90)	,
			"Base.LCP380",			100	- (100 * x90)	- (100 * xSEMI)	- (100 * xUSA)	- (100 * x90)	,
			"Base.BodyGuard380",			100	- (100 * x90)	- (100 * xSEMI)	- (100 * xUSA)	- (100 * x90)	,
			"Base.Bersa85F",			100		- (100 * xSEMI)	- (100 * xREST)		,
			"Base.Colt1903",			100		- (100 * xSEMI)	- (100 * xUSA)		,
			"Base.APS",			100		- (100 * xSMG)	- (100 * xSOV)		,
			"Base.Makarov380",			100		- (100 * xSEMI)	- (100 * xSOV)		,
			"Base.PPK",			100		- (100 * xSEMI)	- (100 * xEUR)		,
			"Base.HK4_380",			100		- (100 * xSEMI)	- (100 * xEUR)		,
											
			"Base.380Clip",			50					,
			"Base.380ExtClip",			25					,
											
			"Base.Suppressor_Pistol",			1					,
		},									
	};										
	SuburbsDistributions["Case_Small3"] = {				-- 9mm	1800	points				
		rolls = 2,									
		items = {									
			"Base.CZ75",			100		- (100 * xSEMI)	- (100 * xCZE)		,
			"Base.G17",			100		- (100 * xSMG)	- (100 * xEUR)		,
			"Base.G18",			100		- (100 * xSMG)	- (100 * xEUR)		,
			"Base.G34",			100	- (100 * x90)	- (100 * xSEMI)	- (100 * xEUR)	- (100 * x90)	,
			"Base.K5",			100		- (100 * xSEMI)	- (100 * xKOR)		,
			"Base.M9",			100		- (100 * xSEMI)	- (100 * xEUR)		,
			"Base.M9A3",			100	- (100 * x90)	- (100 * xSEMI)	- (100 * xEUR)	- (100 * x90)	,
			"Base.B93R",			100		- (100 * xSMG)	- (100 * xEUR)		,
			"Base.M5906",			100		- (100 * xSEMI)	- (100 * xUSA)		,
			"Base.XD9",			100	- (100 * x90)	- (100 * xSEMI)	- (100 * xUSA)	- (100 * x90)	,
 			"Base.MP9",			100	- (100 * x90)	- (100 * xSEMI)	- (100 * xUSA)	- (100 * x90)	,
			"Base.P226",			100		- (100 * xSEMI)	- (100 * xEUR)		,
			"Base.APS",			100		- (100 * xSMG)	- (100 * xSOV)		,
			"Base.Makarov",			100		- (100 * xSEMI)	- (100 * xSOV)		,
			"Base.PB",			100		- (100 * xSEMI)	- (100 * xEUR)		,
			"Base.Luger",			100		- (100 * xSEMI)	- (100 * xEUR)		,
			"Base.BT9_Fold",			100	- (100 * x90)	- (100 * xSMG)	- (100 * xEUR)	- (100 * x90)	,
			"Base.UZI_Micro",			100		- (100 * xSMG)	- (100 * xISR)		,
											
			"Base.9mmClip",			50					,
			"Base.9mmExtClip",			25					,
											
			"Base.Suppressor_Pistol",			1					,
		},									
	};										
	SuburbsDistributions["Case_Small4"] = {				-- 38/357	600	points				
		rolls = 2,									
		items = {									
			"Base.GP100_2",			100		- (100 * xREV)	- (100 * xUSA)		,
			"Base.GP100_4",			100		- (100 * xREV)	- (100 * xUSA)		,
			"Base.GP100_6",			100		- (100 * xREV)	- (100 * xUSA)		,
			"Base.Taurus856",			100	- (100 * x90)	- (100 * xREV)	- (100 * xREST)	- (100 * x90)	,
			"Base.Colt_Service38",			100		- (100 * xREV)	- (100 * xUSA)		,
			"Base.K6S",			100	- (100 * x90)	- (100 * xREV)	- (100 * xUSA)	- (100 * x90)	,
											
			"Base.38Speed",			50					,
			"Base.38Speed",			25					,
		},									
	};										
	SuburbsDistributions["Case_Small5"] = {				-- 45SS	500	points				
		rolls = 2,									
		items = {									
			"Base.AMT1911",			100		- (100 * xSEMI)	- (100 * xUSA)		,
			"Base.AMT1911_Long",			100		- (100 * xSEMI)	- (100 * xUSA)		,
			"Base.Colt1911",			100		- (100 * xSEMI)	- (100 * xUSA)		,
			"Base.Colt_Kimber",			100		- (100 * xSEMI)	- (100 * xUSA)	- (100 * x90)	,
			"Base.Colt_Commander",			100		- (100 * xSEMI)	- (100 * xUSA)		,
											
			"Base.45Clip",			50					,
			"Base.45ExtClip",			25					,
											
			"Base.Suppressor_Pistol",			1					,
		},									
	};										
	SuburbsDistributions["Case_Small6"] = {				-- 45DS	700	points				
		rolls = 2,									
		items = {									
			"Base.CZ97B",			100	- (100 * x90)	- (100 * xSEMI)	- (100 * xCZE)	- (100 * x90)	,
			"Base.G21",			100		- (100 * xSEMI)	- (100 * xEUR)		,
			"Base.XD4",			100	- (100 * x90)	- (100 * xSEMI)	- (100 * xUSA)	- (100 * x90)	,
			"Base.MP45",			100	- (100 * x90)	- (100 * xSEMI)	- (100 * xUSA)	- (100 * x90)	,
			"Base.P220",			100		- (100 * xSEMI)	- (100 * xUSA)		,
			"Base.M4506",			100		- (100 * xSEMI)	- (100 * xUSA)		,
			"Base.PARA1911",			100		- (100 * xSEMI)	- (100 * xUSA)		,
											
			"Base.45DSClip",			50					,
			"Base.45DSExtClip",			25					,
											
			"Base.Suppressor_Pistol",			1					,
		},									
	};										
	SuburbsDistributions["Case_Small7"] = {				-- 44	200	points				
		rolls = 2,									
		items = {									
			"Base.DEagle",			100		- (100 * xSEMI)	- (100 * xISR)		,
			"Base.Automag",			100		- (100 * xSEMI)	- (100 * xUSA)		,
											
			"Base.44Clip",			50					,
			"Base.Bullets44Box",			25					,
		},									
	};										
											
	----------------------------------										
	--	CASE MEDIUM	CAP(4)	--							
	----------------------------------										
	SuburbsDistributions["Case_Medium1"] = {				-- 380	300	points				
		rolls = 2,									
		items = {									
			"Base.BT380_Stock",			100	- (100 * x90)	- (100 * xSEMI)	- (100 * xEUR)	- (100 * x90)	,
			"Base.Vz61_Fixed",			100		- (100 * xSMG)	- (100 * xCZE)		,
			"Base.Vz61_Stock",			100		- (100 * xSMG)	- (100 * xCZE)		,
											
			"Base.380Clip",			50					,
			"Base.380ExtClip",			25					,
		},									
	};										
	SuburbsDistributions["Case_Medium2"] = {				-- 9mm	2400	points				
		rolls = 2,									
		items = {									
			"Base.UZI",			100		- (100 * xSMG)	- (100 * xISR)		,
			"Base.UZI_Wood",			100		- (100 * xSMG)	- (100 * xISR)		,
			"Base.UMP9_Stock",			100	- (100 * x90)	- (100 * xSMG)	- (100 * xISR)	- (100 * x90)	,
			"Base.SUB2000",			100	- (100 * x90)	- (100 * xSEMI)	- (100 * xUSA)	- (100 * x90)	,
			"Base.MP5_Fixed",			100		- (100 * xSMG)	- (100 * xEUR)		,
			"Base.MP5_Stock",			100		- (100 * xSMG)	- (100 * xEUR)		,
			"Base.MP5SD6_Fixed",			100		- (100 * xSMG)	- (100 * xEUR)		,
			"Base.MP5SD6_Stock",			100		- (100 * xSMG)	- (100 * xEUR)		,
			"Base.EVO_Stock",			100	- (100 * x90)	- (100 * xSMG)	- (100 * xCZE)	- (100 * x90)	,
			"Base.K7_Stock",			100		- (100 * xSMG)	- (100 * xKOR)		,
			"Base.AUG9",			100		- (100 * xSMG)	- (100 * xEUR)		,
			"Base.KG9",			100		- (100 * xSMG)	- (100 * xUSA)		,
			"Base.Calico_M900_Fold",			100		- (100 * xSMG)	- (100 * xUSA)		,
			"Base.Calico_M950_Pistol",			100		- (100 * xSMG)	- (100 * xUSA)		,
			"Base.M1Carbine",			100		- (100 * xSEMI)	- (100 * xUSA)		,
			"Base.M2Carbine",			100		- (100 * xSMG)	- (100 * xUSA)		,
			"Base.M635",			100		- (100 * xSMG)	- (100 * xUSA)		,
			"Base.M635S",			100		- (100 * xSMG)	- (100 * xUSA)		,
			"Base.M635SD",			100		- (100 * xSMG)	- (100 * xUSA)		,
			"Base.MP7",			100	- (100 * x90)	- (100 * xSMG)	- (100 * xEUR)	- (100 * x90)	,
			"Base.Jatimatic",			100		- (100 * xSMG)	- (100 * xEUR)		,
			"Base.Sten",			100		- (100 * xSMG)	- (100 * xEUR)		,
			"Base.Sten_MK2",			100		- (100 * xSMG)	- (100 * xEUR)		,
			"Base.Sten_MK2SD",			100		- (100 * xSMG)	- (100 * xEUR)		,
											
			"Base.9mmClip",			50					,
			"Base.9mmExtClip",			25					,
		},									
	};										
	SuburbsDistributions["Case_Medium3"] = {				-- 45DS	400	points				
		rolls = 2,									
		items = {									
			"Base.MAC10_Stock",			100		- (100 * xSMG)	- (100 * xUSA)		,
			"Base.UMP45_Stock",			100	- (100 * x90)	- (100 * xSMG)	- (100 * xEUR)	- (100 * x90)	,
			"Base.KRISS_Stock",			100	- (100 * x90)	- (100 * xSMG)	- (100 * xUSA)	- (100 * x90)	,
			"Base.Model55_Fold",			100		- (100 * xSMG)	- (100 * xUSA)		,
											
			"Base.45DSClip",			50					,
			"Base.45DSExtClip",			25					,
		},									
	};										
	SuburbsDistributions["Case_Medium4"] = {				-- 556	1000	points				
		rolls = 2,									
		items = {									
			"Base.XM8Compact_Pistol",			100	- (100 * x90)	- (100 * xAUTO)	- (100 * xEUR)	- (100 * x90)	,
			"Base.SCARSC_Stock",			100	- (100 * x90)	- (100 * xAUTO)	- (100 * xEUR)	- (100 * x90)	,
			"Base.XM117",			100		- (100 * xAUTO)	- (100 * xUSA)		,
			"Base.K1_1",			100		- (100 * xAUTO)	- (100 * xKOR)		,
			"Base.AUG",			100		- (100 * xAUTO)	- (100 * xEUR)		,
			"Base.M85_Fold",			100		- (100 * xAUTO)	- (100 * xSOV)		,
			"Base.L22",			100	- (100 * x90)	- (100 * xAUTO)	- (100 * xEUR)	- (100 * x90)	,
			"Base.F2000",			100	- (100 * x90)	- (100 * xAUTO)	- (100 * xEUR)	- (100 * x90)	,
			"Base.Tavor",			100	- (100 * x90)	- (100 * xAUTO)	- (100 * xISR)	- (100 * x90)	,
			"Base.QBZ_95",			100	- (100 * x90)	- (100 * xAUTO)	- (100 * xPAC)		,
											
			"Base.556Clip",			50					,
			"Base.556Drum",			25					,
		},									
	};										
	SuburbsDistributions["Case_Medium5"] = {				-- 762x39	400	points				
		rolls = 2,									
		items = {									
			"Base.AKMS_Fold",			100		- (100 * xAUTO)	- (100 * xSOV)		,
			"Base.MD65_Fold",			100		- (100 * xAUTO)	- (100 * xSOV)		,
			"Base.Vz58_Fold",			100		- (100 * xAUTO)	- (100 * xCZE)		,
			"Base.Vz58_Mini_Stock",			100		- (100 * xAUTO)	- (100 * xCZE)		,
											
			"Base.AKClip",			50					,
			"Base.762Drum",			25					,
		},									
	};										
	SuburbsDistributions["Case_Medium6"] = {				-- 12g	600	points				
		rolls = 2,									
		items = {									
			"Base.Coachgun_Pistol",			100		- (100 * xBREAK)	- (100 * xUSA)		,
			"Base.DT11_Pistol",			100		- (100 * xBREAK)	- (100 * xEUR)		,
			"Base.Shorty_Pistol",			100	- (100 * x90)	- (100 * xPUMP)	- (100 * xUSA)	- (100 * x90)	,
			"Base.KS23_S_Pistol",			100		- (100 * xPUMP)	- (100 * xSOV)		,
			"Base.M870_Breaching_Pistol",			100		- (100 * xPUMP)	- (100 * xUSA)		,
			"Base.M870_CQB",			100		- (100 * xPUMP)	- (100 * xUSA)		,
											
			"Base.ShotgunShellsBox",			50					,
			"Base.ShotgunShellsBox",			25					,
		},									
	};										
											
	----------------------------------										
	--	CASE LARGE	CAP(6)	--							
	----------------------------------										
	SuburbsDistributions["Case_Large1"] = {				-- MIX	2800	points				
		rolls = 2,									
		items = {									
			"Base.M40",			100		- (100 * xBOLT)	- (100 * xUSA)		,
			"Base.M40A1",			100		- (100 * xBOLT)	- (100 * xUSA)		,
			"Base.M40A2",			100		- (100 * xBOLT)	- (100 * xUSA)		,
			"Base.M40A3",			100		- (100 * xBOLT)	- (100 * xUSA)		,
			"Base.Marlin_1894",			100		- (100 * xLEVER)	- (100 * xUSA)		,
			"Base.Win_1894",			100		- (100 * xLEVER)	- (100 * xUSA)		,
			"Base.Win_1895",			100		- (100 * xLEVER)	- (100 * xUSA)		,
			"Base.NEF_Handi_38",			100		- (100 * xBREAK)	- (100 * xUSA)		,
			"Base.M2Hyde",			100		- (100 * xAUTO)	- (100 * xUSA)		,
			"Base.Model50",			100		- (100 * xAUTO)	- (100 * xUSA)		,
			"Base.Sako85",			100		- (100 * xBOLT)	- (100 * xEUR)	- (100 * x90)	,
			"Base.Savage12",			100		- (100 * xBOLT)	- (100 * xUSA)		,
			"Base.SVD",			100		- (100 * xSEMI)	- (100 * xSOV)		,
			"Base.SVDK",			100		- (100 * xSEMI)	- (100 * xSOV)		,
			"Base.M1",			100		- (100 * xSEMI)	- (100 * xUSA)		,
			"Base.M1903",			100		- (100 * xBOLT)	- (100 * xUSA)		,
			"Base.BAR",			100		- (100 * xAUTO)	- (100 * xUSA)		,
			"Base.BAR_Monitor",			100		- (100 * xAUTO)	- (100 * xUSA)		,
			"Base.Mosin",			100		- (100 * xBOLT)	- (100 * xSOV)		,
			"Base.WA2000",			100		- (100 * xBOLT)	- (100 * xEUR)		,
			"Base.Type38",			100		- (100 * xBOLT)	- (100 * xPAC)		,
			"Base.Type99",			100		- (100 * xBOLT)	- (100 * xPAC)		,
			"Base.Ruger_No1_308",			100		- (100 * xBREAK)	- (100 * xUSA)		,
			"Base.Ruger_No1_3006",			100		- (100 * xBREAK)	- (100 * xUSA)		,
			"Base.Ruger_No1_4570",			100		- (100 * xBREAK)	- (100 * xUSA)		,
			"Base.Thompson_Center_3006",			100		- (100 * xBREAK)	- (100 * xUSA)		,
			"Base.Viper",			100	- (100 * x90)	- (100 * xLEVER)	- (100 * xREST)	- (100 * x90)	,
			"Base.Federal_HE",			100		- (100 * xGREN)	- (100 * xUSA)		,
		},									
	};										
	SuburbsDistributions["Case_Large2"] = {				-- 545	500	points				
		rolls = 2,									
		items = {									
			"Base.AK74",			100		- (100 * xAUTO)	- (100 * xSOV)		,
			"Base.AKS74",			100		- (100 * xAUTO)	- (100 * xSOV)		,
			"Base.AKS74U",			100		- (100 * xAUTO)	- (100 * xSOV)		,
			"Base.AK74_Alpha",			100	- (100 * x90)	- (100 * xAUTO)	- (100 * xSOV)		,
			"Base.AK12",			100	- (100 * x90)	- (100 * xAUTO)	- (100 * xSOV)		,
			"Base.AK12_New",			100	- (100 * x90)	- (100 * xAUTO)	- (100 * xSOV)		,
			"Base.RPK74",			100		- (100 * xAUTO)	- (100 * xSOV)		,
			"Base.RPK16",			100	- (100 * x90)	- (100 * xAUTO)	- (100 * xSOV)		,
											
			"Base.545StdClip",			50					,
			"Base.545Drum",			25					,
											
			"Base.Suppressor_Rifle",			1					,
		},									
	};										
	SuburbsDistributions["Case_Large3"] = {				-- 556	3100	points				
		rolls = 2,									
		items = {									
			"Base.XM8",			100	- (100 * x90)	- (100 * xAUTO)	- (100 * xEUR)	- (100 * x90)	,
			"Base.SCARL",			100	- (100 * x90)	- (100 * xAUTO)	- (100 * xEUR)	- (100 * x90)	,
			"Base.G33",			100	- (100 * x90)	- (100 * xAUTO)	- (100 * xEUR)		,
			"Base.MK18",			100	- (100 * x90)	- (100 * xAUTO)	- (100 * xEUR)	- (100 * x90)	,
			"Base.M16A1",			100		- (100 * xAUTO)	- (100 * xUSA)		,
			"Base.M16A2",			100		- (100 * xAUTO)	- (100 * xUSA)		,
			"Base.M16A3",			100		- (100 * xAUTO)	- (100 * xUSA)		,
			"Base.M723",			100		- (100 * xAUTO)	- (100 * xUSA)		,
			"Base.H416",			100	- (100 * x90)	- (100 * xAUTO)	- (100 * xEUR)	- (100 * x90)	,
			"Base.M4",			100		- (100 * xAUTO)	- (100 * xUSA)		,
			"Base.M4A1",			100		- (100 * xAUTO)	- (100 * xUSA)		,
			"Base.ADAR",			100	- (100 * x90)	- (100 * xAUTO)	- (100 * xSOV)	- (100 * x90)	,
			"Base.K2C1_PH", 			100	- (100 * x90)	- (100 * xAUTO)	- (100 * xKOR)	- (100 * x90)	,
			"Base.K1DEV",			100		- (100 * xAUTO)	- (100 * xKOR)		,
			"Base.K2_C1",			100	- (100 * x90)	- (100 * xAUTO)	- (100 * xKOR)	- (100 * x90)	,
			"Base.K2_1",			100		- (100 * xAUTO)	- (100 * xKOR)		,
			"Base.K2_203",			100		- (100 * xAUTO)	- (100 * xKOR)		,
			"Base.LVOA_C",			100	- (100 * x90)	- (100 * xSEMI)	- (100 * xUSA)	- (100 * x90)	,
			"Base.ColtM16",			100		- (100 * xAUTO)	- (100 * xUSA)		,
			"Base.M16Wood",			100		- (100 * xAUTO)	- (100 * xUSA)		,
			"Base.M16Tape",			100		- (100 * xAUTO)	- (100 * xUSA)		,
			"Base.FAMAS",			100		- (100 * xAUTO)	- (100 * xEUR)		,
			"Base.FAMAS_G2",			100		- (100 * xAUTO)	- (100 * xEUR)		,
			"Base.FAMAS_Felin",			100		- (100 * xAUTO)	- (100 * xEUR)		,
			"Base.M85_Stock",			100		- (100 * xAUTO)	- (100 * xSOV)		,
			"Base.L85",			100		- (100 * xAUTO)	- (100 * xEUR)		,
			"Base.L85A2",			100	- (100 * x90)	- (100 * xAUTO)	- (100 * xEUR)	- (100 * x90)	,
			"Base.L86",			100		- (100 * xAUTO)	- (100 * xEUR)		,
			"Base.AR18",			100		- (100 * xAUTO)	- (100 * xUSA)		,
			"Base.Type20",			100	- (100 * x90)	- (100 * xAUTO)	- (100 * xPAC)		,
			"Base.Type89",			100		- (100 * xAUTO)	- (100 * xPAC)		,
			"Base.MCX_Spear",			100	- (100 * x90)	- (100 * xAUTO)	- (100 * xEUR)		,
											
			"Base.556Clip",			50					,
			"Base.556Drum",			25					,
											
			"Base.Suppressor_Rifle",			1					,
		},									
	};										
	SuburbsDistributions["Case_Large4"] = {				-- 762x39	1000	points				
		rolls = 2,									
		items = {									
			"Base.AK47",			100		- (100 * xAUTO)	- (100 * xSOV)		,
			"Base.AKM",			100		- (100 * xAUTO)	- (100 * xSOV)		,
			"Base.AK103",			100		- (100 * xAUTO)	- (100 * xSOV)	- (100 * x90)	,
			"Base.AKMS_Stock",			100		- (100 * xAUTO)	- (100 * xSOV)		,
			"Base.MD65_Stock",			100		- (100 * xAUTO)	- (100 * xSOV)		,
			"Base.Vz58",			100		- (100 * xAUTO)	- (100 * xCZE)		,
			"Base.Vz58_Stock",			100		- (100 * xAUTO)	- (100 * xCZE)		,
			"Base.SKS",			100		- (100 * xSEMI)	- (100 * xSOV)		,
			"Base.SKS_PARA",			100		- (100 * xSEMI)	- (100 * xSOV)		,
			"Base.MK47",			100	- (100 * x90)	- (100 * xSEMI)	- (100 * xUSA)	- (100 * x90)	,
											
			"Base.AKClip",			50					,
			"Base.762Drum",			25					,
											
			"Base.Suppressor_Rifle",			1					,
		},									
	};										
	SuburbsDistributions["Case_Large5"] = {				-- 308	1400	points				
		rolls = 2,									
		items = {									
			"Base.SCARH",			100	- (100 * x90)	- (100 * xAUTO)	- (100 * xEUR)	- (100 * x90)	,
			"Base.SCAR20",			100	- (100 * x90)	- (100 * xAUTO)	- (100 * xEUR)	- (100 * x90)	,
			"Base.G28",			100	- (100 * x90)	- (100 * xAUTO)	- (100 * xEUR)	- (100 * x90)	,
			"Base.G3",			100		- (100 * xAUTO)	- (100 * xEUR)		,
			"Base.FAL",			100		- (100 * xAUTO)	- (100 * xEUR)		,
			"Base.FAL_PARA_Stock",			100		- (100 * xAUTO)	- (100 * xEUR)		,
			"Base.FN_FNC",			100		- (100 * xAUTO)	- (100 * xEUR)		,
			"Base.M14EBR",			100		- (100 * xAUTO)	- (100 * xUSA)	- (100 * x90)	,
			"Base.M14",			100		- (100 * xAUTO)	- (100 * xUSA)		,
			"Base.MAS36",			100		- (100 * xAUTO)	- (100 * xEUR)		,
			"Base.MAS44",			100		- (100 * xAUTO)	- (100 * xEUR)		,
			"Base.MAS49",			100		- (100 * xAUTO)	- (100 * xEUR)		,
			"Base.Galil",			100		- (100 * xAUTO)	- (100 * xISR)		,
			"Base.Galil_Sniper",			100		- (100 * xAUTO)	- (100 * xISR)		,
			"Base.AK308",			100	- (100 * x90)	- (100 * xAUTO)	- (100 * xSOV)		,
											
			"Base.308StdClip",			50					,
			"Base.308Box",			25					,
											
			"Base.Suppressor_Rifle",			1					,
		},									
	};										
	SuburbsDistributions["Case_Large6"] = {				-- 12g_M	3100	points				
		rolls = 2,									
		items = {									
			"Base.SPAS12_Fold",			100		- (100 * xSEMI)	- (100 * xEUR)		,
			"Base.SPAS12_Fixed",			100		- (100 * xSEMI)	- (100 * xEUR)		,
			"Base.R11_87",			100		- (100 * xSEMI)	- (100 * xUSA)		,
			"Base.M870",			100		- (100 * xPUMP)	- (100 * xUSA)		,
			"Base.M1897",			100		- (100 * xPUMP)	- (100 * xUSA)		,
			"Base.DT11",			100		- (100 * xBREAK)	- (100 * xEUR)		,
			"Base.Coachgun",			100		- (100 * xBREAK)	- (100 * xUSA)		,
			"Base.SIX12",			100	- (100 * x90)	- (100 * xREV)	- (100 * xUSA)	- (100 * x90)	,
			"Base.SIX12SD",			100	- (100 * x90)	- (100 * xREV)	- (100 * xUSA)	- (100 * x90)	,
			"Base.M870_Wingmaster",			100		- (100 * xPUMP)	- (100 * xUSA)		,
			"Base.M870_Police",			100		- (100 * xPUMP)	- (100 * xUSA)		,
			"Base.M870_MCS",			100		- (100 * xPUMP)	- (100 * xUSA)		,
			"Base.M870_Express",			100		- (100 * xPUMP)	- (100 * xUSA)		,
			"Base.A400",			100	- (100 * x90)	- (100 * xSEMI)	- (100 * xEUR)	- (100 * x90)	,
			"Base.M1014",			100	- (100 * x90)	- (100 * xSEMI)	- (100 * xEUR)	- (100 * x90)	,
			"Base.M1014_Stock", 			100	- (100 * x90)	- (100 * xSEMI)	- (100 * xEUR)	- (100 * x90)	,
			"Base.M1014_Wick",			100	- (100 * x90)	- (100 * xSEMI)	- (100 * xEUR)	- (100 * x90)	,
			"Base.DAO12",			100		- (100 * xREV)	- (100 * xREST)		,
			"Base.M1887",			100		- (100 * xLEVER)	- (100 * xUSA)		,
			"Base.M1208",			100	- (100 * x90)	- (100 * xSEMI)	- (100 * xUSA)	- (100 * x90)	,
			"Base.M1212",			100	- (100 * x90)	- (100 * xSEMI)	- (100 * xUSA)	- (100 * x90)	,
			"Base.M1216",			100	- (100 * x90)	- (100 * xSEMI)	- (100 * xUSA)	- (100 * x90)	,
			"Base.KS23",			100		- (100 * xPUMP)	- (100 * xSOV)		,
			"Base.Triple_Crown",			100		- (100 * xBREAK)	- (100 * xEUR)		,
			"Base.TOZ106",			100		- (100 * xBOLT)	- (100 * xSOV)		,
			"Base.TOZ194_Pistol",			100		- (100 * xPUMP)	- (100 * xSOV)		,
			"Base.MP133",			100	- (100 * x90)	- (100 * xPUMP)	- (100 * xSOV)	- (100 * x90)	,
			"Base.MP133S_Pistol",			100	- (100 * x90)	- (100 * xPUMP)	- (100 * xSOV)	- (100 * x90)	,
			"Base.KSG",			100	- (100 * x90)	- (100 * xPUMP)	- (100 * xUSA)	- (100 * x90)	,
			"Base.KSG25",			100	- (100 * x90)	- (100 * xPUMP)	- (100 * xUSA)	- (100 * x90)	,
			"Base.UTS15",			100	- (100 * x90)	- (100 * xPUMP)	- (100 * xREST)	- (100 * x90)	,
			"Base.Shotgun",			100		- (100 * xPUMP)	- (100 * xUSA)		,
			"Base.DoubleBarrelShotgun", 			100		- (100 * xBREAK)	- (100 * xUSA)		,
											
			"Base.ShotgunShellsBox",			50					,
			"Base.Suppressor_Shotgun",			1					,
			"Base.Carrier_12g",			5					,
		},									
	};										
	SuburbsDistributions["Case_Large7"] = {				-- 12g_SA	600	points				
		rolls = 2,									
		items = {									
			"Base.SPAS_15",			100		- (100 * xSEMI)	- (100 * xEUR)		,
			"Base.USAS_12",			100		- (100 * xAUTO)	- (100 * xKOR)		,
			"Base.Origin",			100	- (100 * x90)	- (100 * xSEMI)	- (100 * xUSA)	- (100 * x90)	,
			"Base.AA12",			100	- (100 * x90)	- (100 * xAUTO)	- (100 * xUSA)	- (100 * x90)	,
			"Base.CAWS",			100		- (100 * xAUTO)	- (100 * xEUR)		,
			"Base.Saiga12_Tromix",			100	- (100 * x90)	- (100 * xAUTO)	- (100 * xSOV)	- (100 * x90)	,
											
			"Base.SPASClip",			50					,
			"Base.12gDrum",			25					,
											
			"Base.Suppressor_Shotgun",			1					,
			"Base.Carrier_12g",			5					,
		},									
	};										
											
											
	SuburbsDistributions["Case_Cute"] = {				-- 22LR	800	points				
		rolls = 2,									
		items = {									
			"Base.Ruger_1022",			100		- (100 * xSEMI)	- (100 * xUSA)		,
			"Base.Marlin_M70",			100		- (100 * xSEMI)	- (100 * xUSA)		,
			"Base.Cricket_22",			100		- (100 * xBOLT)	- (100 * xUSA)		,
			"Base.AR7",			100		- (100 * xSEMI)	- (100 * xUSA)		,
			"Base.Calico_22LR",			100		- (100 * xSMG)	- (100 * xUSA)		,
			"Base.American180",			100		- (100 * xSMG)	- (100 * xUSA)		,
			"Base.Winchester1903",			100		- (100 * xLEVER)	- (100 * xUSA)		,
			"Base.Buckmark_Carbine",			100		- (100 * xSEMI)	- (100 * xUSA)		,
											
			"Base.22Clip",			50					,
			"Base.22ExtClip",			25					,
			"Base.22Drum",			10					,
		},									
	};										
											
	----------------------------------										
	--	CASE HEAVY	CAP(12)	--							
	----------------------------------										
	SuburbsDistributions["Case_Heavy1"] = {				-- GREN	400	points				
		rolls = 2,									
		items = {									
			"Base.EX41_HE",			100		- (100 * xGREN)	- (100 * xUSA)		,
			"Base.M32_HE",			100		- (100 * xGREN)	- (100 * xUSA)		,
			"Base.GM94_HE",			100	- (100 * x90)	- (100 * xGREN)	- (100 * xSOV)	- (100 * x90)	,
			"Base.K11",			100	- (100 * x90)	- (100 * xGREN)	- (100 * xKOR)	- (100 * x90)	,
											
			"Base.40HERound",			40					,
			"Base.40HERound",			30					,
			"Base.40HERound",			20					,
			"Base.40HERound",			10					,
			"Base.40INCRound",			40					,
			"Base.40INCRound",			30					,
			"Base.40INCRound",			20					,
			"Base.40INCRound",			10					,
		},									
	};										
	SuburbsDistributions["Case_Heavy2"] = {				-- 556LMG	400	points				
		rolls = 2,									
		items = {									
			"Base.XM8LMG",			100	- (100 * x90)	- (100 * xLMG)	- (100 * xEUR)	- (100 * x90)	,
			"Base.M249",			100		- (100 * xLMG)	- (100 * xUSA)		,
			"Base.M249E3",			100		- (100 * xLMG)	- (100 * xUSA)		,
			"Base.K3LMG",			100		- (100 * xLMG)	- (100 * xKOR)		,
											
			"Base.556Belt",			50					,
			"Base.556Clip",			25					,
		},									
	};										
	SuburbsDistributions["Case_Heavy3"] = {				-- 308LMG	800	points				
		rolls = 2,									
		items = {									
			"Base.M240",			100		- (100 * xLMG)	- (100 * xUSA)		,
			"Base.G21LMG",			100	- (100 * x90)	- (100 * xLMG)	- (100 * xEUR)	- (100 * x90)	,
			"Base.K12",			100	- (100 * x90)	- (100 * xLMG)	- (100 * xKOR)	- (100 * x90)	,
			"Base.PKM",			100		- (100 * xLMG)	- (100 * xSOV)		,
			"Base.MG42",			100		- (100 * xLMG)	- (100 * xEUR)		,
			"Base.M60",			100		- (100 * xLMG)	- (100 * xUSA)		,
			"Base.MK43",			100	- (100 * x90)	- (100 * xLMG)	- (100 * xUSA)	- (100 * x90)	,
			"Base.RPD",			100		- (100 * xLMG)	- (100 * xSOV)		,
											
			"Base.308Belt",			50					,
			"Base.308StdClip",			25					,
		},									
	};										
	SuburbsDistributions["Case_Heavy4"] = {				-- 50BMG	600	points				
		rolls = 2,									
		items = {									
			"Base.BOAR",			100		- (100 * xBREAK)	- (100 * xUSA)		,
			"Base.M82",			100		- (100 * xSEMI)	- (100 * xUSA)		,
			"Base.EDM96_Fold",			100	- (100 * x90)	- (100 * xBOLT)	- (100 * xUSA)	- (100 * x90)	,
			"Base.BFG50",			100	- (100 * x90)	- (100 * xBREAK)	- (100 * xUSA)	- (100 * x90)	,
			"Base.Harris50",			100		- (100 * xBOLT)	- (100 * xUSA)		,
			"Base.TAC50",			100		- (100 * xBOLT)	- (100 * xUSA)		,
											
			"Base.M82Clip",			50					,
			"Base.M82Clip",			25					,
		--	"Base.50BMGBox",			20					,
			"Base.50BMGBox",			10					,
											
			"Base.Suppressor_BMG",			1					,
		},									
	};										
											
											
	----------------------------------										
	--	POLYMER CANISTER	--								
	----------------------------------										
	SuburbsDistributions["PolyCan_Beige"] = {										
		rolls = 2,									
		items = {									
			"Base.9mmClip",			20,					
			"Base.9mmClip",			20,					
			"Base.9mmExtClip",			20,					
			"Base.9mmExtClip",			20,					
			"Base.9mmDrum",			10,					
			"Base.9mmDrum",			10,					
		},									
	};										
	SuburbsDistributions["PolyCan_Blue"] = {										
		rolls = 2,									
		items = {									
			"Base.45Clip",			20,					
			"Base.45Clip",			20,					
			"Base.45ExtClip",			20,					
			"Base.45ExtClip",			20,					
			"Base.45Drum",			10,					
			"Base.45Drum",			10,					
		},									
	};										
	SuburbsDistributions["PolyCan_Brown"] = {										
		rolls = 2,									
		items = {									
			"Base.SPASClip",			20,					
			"Base.SPASClip",			20,					
			"Base.SPASClip",			20,					
			"Base.12gDrum",			20,					
			"Base.12gDrum",			20,					
			"Base.12gDrum",			20,					
		},									
	};										
	SuburbsDistributions["PolyCan_Red"] = {										
		rolls = 2,									
		items = {									
			"Base.AKClip",			20,					
			"Base.AKClip",			20,					
			"Base.AKClip",			20,					
			"Base.AKClip",			20,					
			"Base.762Drum",			20,					
			"Base.762Drum",			20,					
		},									
	};										
											
											
	----------------------------------										
	--	BAGS			--						
	----------------------------------										
	SuburbsDistributions["Bag_Police"] = {					-- <=== THIS WAY REPLACES ENTIRE LOOT IN BAG					
		rolls = 2,									
		items = {									
			"Base.9mmClip",			4,					
			"Base.45DSClip",			4,					
			"Base.223StdClip",			4,					
			"Base.9mmExtClip",			8,					
			"Base.45DSExtClip",			8,					
			"Base.223ExtClip",			8,					
			"Base.556Clip",			4,					
			"Base.357Speed",			8,					
			"Base.Bullets9mmBox",			10,					
			"Base.Bullets45Box",			10,					
			"Base.ShotgunShellsBox",			10,					
			"Base.223Box",			10,					
			"Base.Sling_2",			2,					
			"Base.Cleaning",			1,					
			"Base.WD",			1,					
			"Base.AmmoStrap_Shells",			2,					
			"Base.Gloves_LeatherGlovesBlack",			2,					
			"Base.Glasses_Shooting",			2,					
			"Base.SolventTrap_Adapter",			6,					
		},									
	};										

											
----------------------------------------------------------											
--		INSERTIONS			--						
----------------------------------------------------------											
											
----------------------------------------------------------											
--	ZOMBIE INVENTORY (CCW)				--						
----------------------------------------------------------											
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items,				"Base.Bersa85F"						);	
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items,				Case	- (Case * xREST)					);	
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items,				"Base.PPK"						);	
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items,				Case	- (Case * xEUR)					);	
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items,				"Base.G17"						);	
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items,				Case	- (Case * xEUR)					);	
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items,				"Base.M9"						);	
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items,				Case	- (Case * xEUR)					);	
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items,				"Base.Makarov380"						);	
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items,				Case	- (Case * xSOV)					);	
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items,				"Base.HK4_380"						);	
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items,				Case	- (Case * xEUR)					);	
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items,				"Base.GP100_2"						);	
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items,				Case	- (Case * xUSA)					);	
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items,				"Base.GP100_4"						);	
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items,				Case	- (Case * xUSA)					);	
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items,				"Base.M5906"						);	
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items,				Case	- (Case * xUSA)					);	
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items,				"Base.P226"						);	
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items,				Case	- (Case * xEUR)					);	
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items,				"Base.CZ75"						);	
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items,				Case	- (Case * xCZE)					);	
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items,				"Base.HK4_22"						);	
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items,				Case	- (Case * xEUR)					);	
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items,				"Base.Buckmark"						);	
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items,				Case	- (Case * xUSA)					);	
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items,				"Base.K5"						);	
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items,				Case	- (Case * xKOR)					);	
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items,				"Base.XD9"						);	
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items,				Case	- (Case * xUSA)				- (Case * x90)	);	
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items,				"Base.K6S"						);	
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items,				Case	- (Case * xUSA)				- (Case * x90)	);	
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items,				"Base.G42"						);	
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items,				Case	- (Case * xEUR)				- (Case * x90)	);	
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items,				"Base.LCP380"						);	
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items,				Case	- (Case * xUSA)				- (Case * x90)	);	
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items,				"Base.BodyGuard380"						);	
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items,				Case	- (Case * xUSA)				- (Case * x90)	);	
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items,				"Base.Taurus856"						);	
table.insert(SuburbsDistributions["all"]["inventoryfemale"].items,				Case	- (Case * xREST)				- (Case * x90)	);	
											
table.insert(SuburbsDistributions["all"]["inventorymale"].items,				"Base.CZ75"						);	
table.insert(SuburbsDistributions["all"]["inventorymale"].items,				Case	- (Case * xCZE)					);	
table.insert(SuburbsDistributions["all"]["inventorymale"].items,				"Base.P220"						);	
table.insert(SuburbsDistributions["all"]["inventorymale"].items,				Case	- (Case * xEUR)					);	
table.insert(SuburbsDistributions["all"]["inventorymale"].items,				"Base.P226"						);	
table.insert(SuburbsDistributions["all"]["inventorymale"].items,				Case	- (Case * xEUR)					);	
table.insert(SuburbsDistributions["all"]["inventorymale"].items,				"Base.G17"						);	
table.insert(SuburbsDistributions["all"]["inventorymale"].items,				Case	- (Case * xEUR)					);	
table.insert(SuburbsDistributions["all"]["inventorymale"].items,				"Base.G21"						);	
table.insert(SuburbsDistributions["all"]["inventorymale"].items,				Case	- (Case * xEUR)					);	
table.insert(SuburbsDistributions["all"]["inventorymale"].items,				"Base.M9"						);	
table.insert(SuburbsDistributions["all"]["inventorymale"].items,				Case	- (Case * xEUR)					);	
table.insert(SuburbsDistributions["all"]["inventorymale"].items,				"Base.GP100_2_357"						);	
table.insert(SuburbsDistributions["all"]["inventorymale"].items,				Case	- (Case * xUSA)					);	
table.insert(SuburbsDistributions["all"]["inventorymale"].items,				"Base.GP100_4_357"						);	
table.insert(SuburbsDistributions["all"]["inventorymale"].items,				Case	- (Case * xUSA)					);	
table.insert(SuburbsDistributions["all"]["inventorymale"].items,				"Base.Colt1911"						);	
table.insert(SuburbsDistributions["all"]["inventorymale"].items,				Case	- (Case * xUSA)					);	
table.insert(SuburbsDistributions["all"]["inventorymale"].items,				"Base.AMT1911"						);	
table.insert(SuburbsDistributions["all"]["inventorymale"].items,				Case	- (Case * xUSA)					);	
table.insert(SuburbsDistributions["all"]["inventorymale"].items,				"Base.AMT1911_Long"						);	
table.insert(SuburbsDistributions["all"]["inventorymale"].items,				Case	- (Case * xUSA)					);	
table.insert(SuburbsDistributions["all"]["inventorymale"].items,				"Base.Colt_Commander"						);	
table.insert(SuburbsDistributions["all"]["inventorymale"].items,				Case	- (Case * xUSA)					);	
table.insert(SuburbsDistributions["all"]["inventorymale"].items,				"Base.K5"						);	
table.insert(SuburbsDistributions["all"]["inventorymale"].items,				Case	- (Case * xKOR)					);	
table.insert(SuburbsDistributions["all"]["inventorymale"].items,				"Base.M4506"						);	
table.insert(SuburbsDistributions["all"]["inventorymale"].items,				Case	- (Case * xUSA)					);	
table.insert(SuburbsDistributions["all"]["inventorymale"].items,				"Base.M5906"						);	
table.insert(SuburbsDistributions["all"]["inventorymale"].items,				Case	- (Case * xUSA)					);	
table.insert(SuburbsDistributions["all"]["inventorymale"].items,				"Base.XD9"						);	
table.insert(SuburbsDistributions["all"]["inventorymale"].items,				Case	- (Case * xUSA)				- (Case * x90)	);	
table.insert(SuburbsDistributions["all"]["inventorymale"].items,				"Base.XD4"						);	
table.insert(SuburbsDistributions["all"]["inventorymale"].items,				Case	- (Case * xUSA)				- (Case * x90)	);	
table.insert(SuburbsDistributions["all"]["inventorymale"].items,				"Base.MP9"						);	
table.insert(SuburbsDistributions["all"]["inventorymale"].items,				Case	- (Case * xUSA)				- (Case * x90)	);	
table.insert(SuburbsDistributions["all"]["inventorymale"].items,				"Base.MP45"						);	
table.insert(SuburbsDistributions["all"]["inventorymale"].items,				Case	- (Case * xUSA)				- (Case * x90)	);	
table.insert(SuburbsDistributions["all"]["inventorymale"].items,				"Base.CZ97B"						);	
table.insert(SuburbsDistributions["all"]["inventorymale"].items,				Case	- (Case * xCZE)				- (Case * x90)	);	
table.insert(SuburbsDistributions["all"]["inventorymale"].items,				"Base.Colt_Kimber"						);	
table.insert(SuburbsDistributions["all"]["inventorymale"].items,				Case	- (Case * xUSA)				- (Case * x90)	);	
											
----------------------------------------------------------											
--	REGIONAL MILITARY PRESETS				--						
----------------------------------------------------------											
local	mGUN1	=	nil								
local	mGUN2	=	nil								
local	mGUN3	=	nil								
local	mGUN4	=	nil								
local	mGUN5	=	nil								
local	mMAG1	=	nil								
local	mMAG2	=	nil								
local	mMAG3	=	nil								
local	mCAN1	=	nil								
local	mCAN2	=	nil								
local	mCAN3	=	nil								
local	mCAN4	=	nil								
local	mPART1	=	nil								
local	mPART2	=	nil								
local	mPART3	=	nil								
local	mPART4	=	nil								
local	mMELE	=	nil								
local	mEXPL	=	"Base.AmmoCan50_HE"		-- << ALL MILITARY GETS GRENADES						
local	mINCEN	=	"Base.AmmoCan50_INC"		-- << ALL MILITARY GETS GRENADES						
											
if (REGION == 1) then		-- ("United States")									
	print	("MILITARY REGION - UNITED STATES")									
	mCAN1	=	"Base.AmmoCan30_45"								
	mCAN2	=	"Base.AmmoCan50_556"								
	mCAN3	=	"Base.AmmoCan50_556"								
	mCAN4	=	"Base.AmmoCan50_308"								
	mGUN1	=	"Base.Colt1911"								
	mGUN2	=	"Base.M16A1"								
	mGUN3	=	"Base.M16A2"								
	mGUN4	=	"Base.M14"								
	mGUN5	=	"Base.M249"								
	mMAG1	=	"Base.556Clip"								
	mMAG2	=	"Base.308ExtClip"								
	mMAG3	=	"Base.556Belt"								
	mPART1	=	"Base.Sight_Aimpoint"								
	mPART2	=	"Base.Sight_4xACOG"								
	mPART3	=	"Base.Bayonet_M4"								
	mPART4	=	"Base.Launcher"								
	mMELE	=	"Base.RamboKnife"								
elseif (REGION == 2) then		-- ("Soviet Union")									
	print	("MILITARY REGION - SOVIET UNION")									
	mCAN1	=	"Base.AmmoCan30_9"								
	mCAN2	=	"Base.AmmoCan50_762x39"								
	mCAN3	=	"Base.AmmoCan50_762x39"								
	mCAN4	=	"Base.AmmoCan50_762x54r"								
	mGUN1	=	"Base.Makarov"								
	mGUN2	=	"Base.AK47"								
	mGUN3	=	"Base.AKM"								
	mGUN4	=	"Base.PKM"								
	mGUN5	=	"Base.GM94_HE"								
	mMAG1	=	"Base.AKClip"								
	mMAG2	=	"Base.AKClip"								
	mMAG3	=	"Base.762x54rBelt"								
	mPART1	=	"Base.Sight_1P63"								
	mPART2	=	"Base.Sight_KOBRA"								
	mPART3	=	"Base.Scope_4xPSO"								
	mPART4	=	"Base.Bayonet_AK"								
	mMELE	=	"Base.RussianMachete"								
elseif (REGION == 3) then		-- ("Czech")									
	print	("MILITARY REGION - CZECH REPUBLIC")									
	mCAN1	=	"Base.AmmoCan30_9"								
	mCAN2	=	"Base.AmmoCan50_762x39"								
	mCAN3	=	"Base.AmmoCan30_380"								
	mCAN4	=	"Base.AmmoCan50_308"								
	mGUN1	=	"Base.CZ75"								
	mGUN2	=	"Base.Vz58"								
	mGUN3	=	"Base.Vz61_Fold"								
	mGUN4	=	"Base.M60"								
	mGUN5	=	"Base.M32_HE"								
	mMAG1	=	"Base.AKClip"								
	mMAG2	=	"Base.762Drum"								
	mMAG3	=	"Base.308Belt"								
	mPART1	=	"Base.Bayonet_M4"								
	mPART2	=	"Base.Sight_1P63"								
	mPART3	=	"Base.Sight_KOBRA"								
	mPART4	=	"Base.Scope_4xPSO"								
	mMELE	=	"Base.Bayonet_M4"								
elseif (REGION == 4) then		-- ("Korea")									
	print	("MILITARY REGION - KOREA")									
	mCAN1	=	"Base.AmmoCan30_9"								
	mCAN2	=	"Base.AmmoCan50_556"								
	mCAN3	=	"Base.AmmoCan50_556"								
	mCAN4	=	"Base.AmmoCan50_556"								
	mGUN1	=	"Base.K5"								
	mGUN2	=	"Base.K1_1"								
	mGUN3	=	"Base.K2_1"								
	mGUN4	=	"Base.K3LMG"								
	mGUN5	=	"Base.K11"								
	mMAG1	=	"Base.556Clip"								
	mMAG2	=	"Base.556Drum"								
	mMAG3	=	"Base.556Belt"								
	mPART1	=	"Base.Sight_Aimpoint_Dot"								
	mPART2	=	"Base.Scope_1-4x"								
	mPART3	=	"Base.Bayonet_M4"								
	mPART4	=	"Base.Launcher"								
	mMELE	=	"Base.RamboKnife"								
elseif (REGION == 5) then		-- ("China")									
	print	("MILITARY REGION - CHINA")									
	mCAN1	=	"Base.AmmoCan50_556"								
	mCAN2	=	"Base.AmmoCan50_762x39"								
	mCAN3	=	"Base.AmmoCan50_762x39"								
	mCAN4	=	"Base.AmmoCan50_762x54r"								
	mGUN1	=	"Base.SKS"								
	mGUN2	=	"Base.QBZ_95"								
	mGUN3	=	"Base.AK47"								
	mGUN4	=	"Base.RPD"								
	mGUN5	=	"Base.GM94_HE"								
	mMAG1	=	"Base.556Clip"								
	mMAG2	=	"Base.AKClip"								
	mMAG3	=	"Base.762x54rBelt"								
	mPART1	=	"Base.Bayonet_AK"								
	mPART2	=	"Base.Sight_1P63"								
	mPART3	=	"Base.Sight_KOBRA"								
	mPART4	=	"Base.SKSClip"								
	mMELE	=	"Base.CH_WarSword"								
elseif (REGION == 6) then		-- ("Europe")									
	print	("MILITARY REGION - UNITED KINGDOM")									
	mCAN1	=	"Base.AmmoCan30_9"								
	mCAN2	=	"Base.AmmoCan50_556"								
	mCAN3	=	"Base.AmmoCan50_556"								
	mCAN4	=	"Base.AmmoCan50_308"								
	mGUN1	=	"Base.P226"								
	mGUN2	=	"Base.L85"								
	mGUN3	=	"Base.FAL"								
	mGUN4	=	"Base.L86"								
	mGUN5	=	"Base.M32_HE"								
	mMAG1	=	"Base.556Clip"								
	mMAG2	=	"Base.308ExtClip"								
	mMAG3	=	"Base.556Drum"								
	mPART1	=	"Base.Sight_SUSAT"								
	mPART2	=	"Base.Sight_L2"								
	mPART3	=	"Base.Sight_6xELCAN"								
	mPART4	=	"Base.Bayonet_M4"								
	mMELE	=	"Base.RamboKnife"								
elseif (REGION == 7) then		-- ("Israel")									
	print	("MILITARY REGION - ISRAEL")									
	mCAN1	=	"Base.AmmoCan30_9"								
	mCAN2	=	"Base.AmmoCan50_556"								
	mCAN3	=	"Base.AmmoCan50_556"								
	mCAN4	=	"Base.AmmoCan50_308"								
	mGUN1	=	"Base.P226"								
	mGUN2	=	"Base.Tavor"								
	mGUN3	=	"Base.Galil"								
	mGUN4	=	"Base.Galil_Sniper"								
	mGUN5	=	"Base.EX41_HE"								
	mMAG1	=	"Base.556Clip"								
	mMAG2	=	"Base.308ExtClip"								
	mMAG3	=	"Base.308ExtClip"								
	mPART1	=	"Base.Sight_Mepro_M21"								
	mPART2	=	"Base.Sight_Mepro_MOR"								
	mPART3	=	"Base.Sight_6xELCAN"								
	mPART4	=	"Base.RamboKnife"								
	mMELE	=	"Base.MilitaryBaton"								
else	print	("MILITARY REGION - OTHER")									
	mCAN1	=	"Base.AmmoCan30_9"								
	mCAN2	=	"Base.AmmoCan50_556"								
	mCAN3	=	"Base.AmmoCan50_556"								
	mCAN4	=	"Base.AmmoCan50_308"								
	mGUN1	=	"Base.M9"								
	mGUN2	=	"Base.M16A1"								
	mGUN3	=	"Base.M4A1"								
	mGUN4	=	"Base.M60"								
	mGUN5	=	"Base.M32_HE"								
	mMAG1	=	"Base.556Clip"								
	mMAG2	=	"Base.556Drum"								
	mMAG3	=	"Base.308Belt"								
	mPART1	=	"Base.Sight_Brownells"								
	mPART2	=	"Base.Sight_4xACOG"								
	mPART3	=	"Base.Bayonet_M4"								
	mPART4	=	"Base.Launcher"								
	mMELE	=	"Base.RamboKnife"								
end											
											
--------------------------------------------------											
--		MILITARY VEHICLE		--							
--------------------------------------------------											
if getActivatedMods():contains("FRUsedCarsBETA") then											
	table.insert(VehicleDistributions.Military["TruckBed"].items,				"Base.Suppressor_Pistol"					);	
	table.insert(VehicleDistributions.Military["TruckBed"].items,				1					);	
	table.insert(VehicleDistributions.Military["TruckBed"].items,				"Base.Suppressor_Rifle"					);	
	table.insert(VehicleDistributions.Military["TruckBed"].items,				1					);	
	table.insert(VehicleDistributions.Military["TruckBed"].items,				 "Base.AmmoCan50_HE"					);	
	table.insert(VehicleDistributions.Military["TruckBed"].items,				1					);	
	table.insert(VehicleDistributions.Military["TruckBed"].items,				 "Base.AmmoCan50_INC"					);	
	table.insert(VehicleDistributions.Military["TruckBed"].items,				1					);	
	if (mCAN1 ~= nil) then										
		table.insert(VehicleDistributions.Military["TruckBed"].items,			mCAN1					);	
		table.insert(VehicleDistributions.Military["TruckBed"].items,			1					);	
	end										
	if (mCAN2 ~= nil) then										
		table.insert(VehicleDistributions.Military["TruckBed"].items,			mCAN2					);	
		table.insert(VehicleDistributions.Military["TruckBed"].items,			1					);	
	end										
	if (mCAN3 ~= nil) then										
		table.insert(VehicleDistributions.Military["TruckBed"].items,			mCAN3					);	
		table.insert(VehicleDistributions.Military["TruckBed"].items,			1					);	
	end										
	if (mCAN4 ~= nil) then										
		table.insert(VehicleDistributions.Military["TruckBed"].items,			mCAN4					);	
		table.insert(VehicleDistributions.Military["TruckBed"].items,			1					);	
	end										
	if (mGUN1 ~= nil) then										
		table.insert(VehicleDistributions.Military["TruckBed"].items,			mGUN1					);	
		table.insert(VehicleDistributions.Military["TruckBed"].items,			1					);	
	end										
	if (mGUN2 ~= nil) then										
		table.insert(VehicleDistributions.Military["TruckBed"].items,			mGUN2					);	
		table.insert(VehicleDistributions.Military["TruckBed"].items,			1					);	
	end										
	if (mGUN3 ~= nil) then										
		table.insert(VehicleDistributions.Military["TruckBed"].items,			mGUN3					);	
		table.insert(VehicleDistributions.Military["TruckBed"].items,			1					);	
	end										
	if (mGUN4 ~= nil) then										
		table.insert(VehicleDistributions.Military["TruckBed"].items,			mGUN4					);	
		table.insert(VehicleDistributions.Military["TruckBed"].items,			1					);	
	end										
	if (mGUN5 ~= nil) then										
		table.insert(VehicleDistributions.Military["TruckBed"].items,			mGUN5					);	
		table.insert(VehicleDistributions.Military["TruckBed"].items,			1					);	
	end										
	if (mMAG1 ~= nil) then										
		table.insert(VehicleDistributions.Military["TruckBed"].items,			mMAG1					);	
		table.insert(VehicleDistributions.Military["TruckBed"].items,			1					);	
	end										
	if (mMAG2 ~= nil) then										
		table.insert(VehicleDistributions.Military["TruckBed"].items,			mMAG2					);	
		table.insert(VehicleDistributions.Military["TruckBed"].items,			1					);	
	end										
	if (mMAG3 ~= nil) then										
		table.insert(VehicleDistributions.Military["TruckBed"].items,			mMAG3					);	
		table.insert(VehicleDistributions.Military["TruckBed"].items,			1					);	
	end										
	if (mPART1 ~= nil) then										
		table.insert(VehicleDistributions.Military["TruckBed"].items,			mPART1					);	
		table.insert(VehicleDistributions.Military["TruckBed"].items,			1					);	
	end										
	if (mPART2 ~= nil) then										
		table.insert(VehicleDistributions.Military["TruckBed"].items,			mPART2					);	
		table.insert(VehicleDistributions.Military["TruckBed"].items,			1					);	
	end										
	if (mPART3 ~= nil) then										
		table.insert(VehicleDistributions.Military["TruckBed"].items,			mPART3					);	
		table.insert(VehicleDistributions.Military["TruckBed"].items,			1					);	
	end										
	if (mPART4 ~= nil) then										
		table.insert(VehicleDistributions.Military["TruckBed"].items,			mPART4					);	
		table.insert(VehicleDistributions.Military["TruckBed"].items,			1					);	
	end										
	if (mMELE ~= nil) then										
		table.insert(VehicleDistributions.Military["TruckBed"].items,			mMELE					);	
		table.insert(VehicleDistributions.Military["TruckBed"].items,			1					);	
	end										
											
											
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items,				"Base.Suppressor_Pistol"					);	
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items,				0.3					);	
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items,				"Base.Suppressor_Rifle"					);	
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items,				0.5					);	
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items,				 "Base.AmmoCan50_HE"					);	
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items,				0.3					);	
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items,				 "Base.AmmoCan50_INC"					);	
	table.insert(VehicleDistributions.Military["TruckbedOpen"].items,				0.2					);	
	if (mCAN1 ~= nil) then										
		table.insert(VehicleDistributions.Military["TruckbedOpen"].items,			mCAN1					);	
		table.insert(VehicleDistributions.Military["TruckbedOpen"].items,			1					);	
	end										
	if (mCAN2 ~= nil) then										
		table.insert(VehicleDistributions.Military["TruckbedOpen"].items,			mCAN2					);	
		table.insert(VehicleDistributions.Military["TruckbedOpen"].items,			0.6					);	
	end										
	if (mCAN3 ~= nil) then										
		table.insert(VehicleDistributions.Military["TruckbedOpen"].items,			mCAN3					);	
		table.insert(VehicleDistributions.Military["TruckbedOpen"].items,			0.4					);	
	end										
	if (mCAN4 ~= nil) then										
		table.insert(VehicleDistributions.Military["TruckbedOpen"].items,			mCAN4					);	
		table.insert(VehicleDistributions.Military["TruckbedOpen"].items,			0.2					);	
	end										
	if (mGUN1 ~= nil) then										
		table.insert(VehicleDistributions.Military["TruckbedOpen"].items,			mGUN1					);	
		table.insert(VehicleDistributions.Military["TruckbedOpen"].items,			0.5					);	
	end										
	if (mGUN2 ~= nil) then										
		table.insert(VehicleDistributions.Military["TruckbedOpen"].items,			mGUN2					);	
		table.insert(VehicleDistributions.Military["TruckbedOpen"].items,			0.7					);	
	end										
	if (mGUN3 ~= nil) then										
		table.insert(VehicleDistributions.Military["TruckbedOpen"].items,			mGUN3					);	
		table.insert(VehicleDistributions.Military["TruckbedOpen"].items,			0.3					);	
	end										
	if (mGUN4 ~= nil) then										
		table.insert(VehicleDistributions.Military["TruckbedOpen"].items,			mGUN4					);	
		table.insert(VehicleDistributions.Military["TruckbedOpen"].items,			0.2					);	
	end										
	if (mGUN5 ~= nil) then										
		table.insert(VehicleDistributions.Military["TruckbedOpen"].items,			mGUN5					);	
		table.insert(VehicleDistributions.Military["TruckbedOpen"].items,			0.2					);	
	end										
	if (mMAG1 ~= nil) then										
		table.insert(VehicleDistributions.Military["TruckbedOpen"].items,			mMAG1					);	
		table.insert(VehicleDistributions.Military["TruckbedOpen"].items,			1					);	
	end										
	if (mMAG2 ~= nil) then										
		table.insert(VehicleDistributions.Military["TruckbedOpen"].items,			mMAG2					);	
		table.insert(VehicleDistributions.Military["TruckbedOpen"].items,			1					);	
	end										
	if (mMAG3 ~= nil) then										
		table.insert(VehicleDistributions.Military["TruckbedOpen"].items,			mMAG3					);	
		table.insert(VehicleDistributions.Military["TruckbedOpen"].items,			1					);	
	end										
	if (mPART1 ~= nil) then										
		table.insert(VehicleDistributions.Military["TruckbedOpen"].items,			mPART1					);	
		table.insert(VehicleDistributions.Military["TruckbedOpen"].items,			0.4					);	
	end										
	if (mPART2 ~= nil) then										
		table.insert(VehicleDistributions.Military["TruckbedOpen"].items,			mPART2					);	
		table.insert(VehicleDistributions.Military["TruckbedOpen"].items,			0.4					);	
	end										
	if (mPART3 ~= nil) then										
		table.insert(VehicleDistributions.Military["TruckbedOpen"].items,			mPART3					);	
		table.insert(VehicleDistributions.Military["TruckbedOpen"].items,			0.4					);	
	end										
	if (mPART4 ~= nil) then										
		table.insert(VehicleDistributions.Military["TruckbedOpen"].items,			mPART4					);	
		table.insert(VehicleDistributions.Military["TruckbedOpen"].items,			0.4					);	
	end										
	if (mMELE ~= nil) then										
		table.insert(VehicleDistributions.Military["TruckbedOpen"].items,			mMELE					);	
		table.insert(VehicleDistributions.Military["TruckbedOpen"].items,			0.7					);	
	end										
end											
											
------------------------------------------------------------------											
--		PROCEDURAL LIST	(ARMY LOCKER)			--					
------------------------------------------------------------------											
table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,					"Base.Suppressor_Pistol"				);		
table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,					0.2				);		
table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,					"Base.Suppressor_Rifle"				);		
table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,					0.2				);		
table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,					 "Base.AmmoCan50_HE"				);		
table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,					0.1				);		
table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,					 "Base.AmmoCan50_INC"				);		
table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,					0.1				);		
if (mCAN1 ~= nil) then											
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				mCAN1				);		
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				0.5				);		
end											
if (mCAN2 ~= nil) then											
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				mCAN2				);		
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				0.4				);		
end											
if (mCAN3 ~= nil) then											
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				mCAN3				);		
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				0.3				);		
end											
if (mCAN4 ~= nil) then											
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				mCAN4				);		
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				0.2				);		
end											
if (mGUN1 ~= nil) then											
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				mGUN1				);		
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				0.5				);		
end											
if (mGUN2 ~= nil) then											
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				mGUN2				);		
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				0.4				);		
end											
if (mGUN3 ~= nil) then											
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				mGUN3				);		
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				0.3				);		
end											
if (mGUN4 ~= nil) then											
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				mGUN4				);		
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				0.2				);		
end											
if (mGUN5 ~= nil) then											
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				mGUN5				);		
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				0.1				);		
end											
if (mMAG1 ~= nil) then											
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				mMAG1				);		
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				0.5				);		
end											
if (mMAG2 ~= nil) then											
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				mMAG2				);		
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				0.4				);		
end											
if (mMAG3 ~= nil) then											
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				mMAG3				);		
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				0.3				);		
end											
if (mPART1 ~= nil) then											
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				mPART1				);		
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				0.3				);		
end											
if (mPART2 ~= nil) then											
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				mPART2				);		
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				0.3				);		
end											
if (mPART3 ~= nil) then											
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				mPART3				);		
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				0.3				);		
end											
if (mPART4 ~= nil) then											
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				mPART4				);		
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				0.3				);		
end											
if (mMELE ~= nil) then											
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				mMELE				);		
	table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				0.5				);		
end											
											
											
--------------------------------------------------											
--		POLICE VEHICLE			--						
--------------------------------------------------											
table.insert(VehicleDistributions.Police["TruckBed"].items,					"Base.Bag_Police"					);	
table.insert(VehicleDistributions.Police["TruckBed"].items,					8					);	
table.insert(VehicleDistributions.Police["TruckBed"].items,					"Base.M870"					);	
table.insert(VehicleDistributions.Police["TruckBed"].items,					2					);	
table.insert(VehicleDistributions.Police["TruckBed"].items, 					"Base.MINI14_T"					);	
table.insert(VehicleDistributions.Police["TruckBed"].items,					2					);	
table.insert(VehicleDistributions.Police["TruckBed"].items,					"Base.Case_Small3"					);	-- 9mm
table.insert(VehicleDistributions.Police["TruckBed"].items,					1					);	
table.insert(VehicleDistributions.Police["TruckBed"].items,					"Base.Case_Large3"					);	-- 556
table.insert(VehicleDistributions.Police["TruckBed"].items,					1					);	
table.insert(VehicleDistributions.Police["TruckBed"].items,					"Base.Case_Medium2"					);	-- 9mm
table.insert(VehicleDistributions.Police["TruckBed"].items,					1					);	
table.insert(VehicleDistributions.Police["TruckBed"].items,					"Base.Vest_BulletPolice"					);	
table.insert(VehicleDistributions.Police["TruckBed"].items,					2					);	
table.insert(VehicleDistributions.Police["TruckBed"].items,					"Base.Shoes_ArmyBoots"					);	
table.insert(VehicleDistributions.Police["TruckBed"].items,					3					);	
											
--------------------------------------------------											
--		FIRE VEHICLE			--						
--------------------------------------------------											
table.insert(VehicleDistributions.Fire["TruckBed"].items,					"Base.DingDong"					);	
table.insert(VehicleDistributions.Fire["TruckBed"].items,					2					);	
table.insert(VehicleDistributions.Fire["TruckBed"].items,					"Base.Jacket_Fireman"					);	
table.insert(VehicleDistributions.Fire["TruckBed"].items,					2					);	
table.insert(VehicleDistributions.Fire["TruckBed"].items,					"Base.Trousers_Fireman"					);	
table.insert(VehicleDistributions.Fire["TruckBed"].items,					2					);	
table.insert(VehicleDistributions.Fire["TruckBed"].items,					"Base.Hat_Fireman"					);	
table.insert(VehicleDistributions.Fire["TruckBed"].items,					2					);	
table.insert(VehicleDistributions.Fire["TruckBed"].items,					"Base.Glasses_SafetyGoggles"					);	
table.insert(VehicleDistributions.Fire["TruckBed"].items,					1					);	
											
--------------------------------------------------											
--		FOSSOIL VEHICLE			--						
--------------------------------------------------											
table.insert(VehicleDistributions.Fossoil["TruckBed"].items,					"Base.Oil_Filter"					);	
table.insert(VehicleDistributions.Fossoil["TruckBed"].items,					10					);	
table.insert(VehicleDistributions.Fossoil["TruckBed"].items,					"Base.Oil_Filter"					);	
table.insert(VehicleDistributions.Fossoil["TruckBed"].items,					4					);	
											
											
--------------------------------------------------											
--		RANGER VEHICLE			--						
--------------------------------------------------											
table.insert(VehicleDistributions.Ranger["TruckBed"].items,					"Base.Case_Large1"					);	
table.insert(VehicleDistributions.Ranger["TruckBed"].items,					2					);	
table.insert(VehicleDistributions.Ranger["TruckBed"].items,					"Base.Case_Small4"					);	
table.insert(VehicleDistributions.Ranger["TruckBed"].items,					2		- (Case * xCase)			);	
table.insert(VehicleDistributions.Ranger["TruckBed"].items,					"Base.Light_Large"					);	
table.insert(VehicleDistributions.Ranger["TruckBed"].items,					1					);	
table.insert(VehicleDistributions.Ranger["TruckBed"].items,					"Base.RamboKnife"					);	
table.insert(VehicleDistributions.Ranger["TruckBed"].items,					1		- (LgKnife * xLgKnife)			);	
table.insert(VehicleDistributions.Ranger["TruckBed"].items,					"Base.Sling_2"					);	
table.insert(VehicleDistributions.Ranger["TruckBed"].items,					1					);	
table.insert(VehicleDistributions.Ranger["TruckBed"].items,					"Base.Scope_1-4x"					);	
table.insert(VehicleDistributions.Ranger["TruckBed"].items,					1					);	
table.insert(VehicleDistributions.Ranger["TruckBed"].items,					"Base.Scope_20x"					);	
table.insert(VehicleDistributions.Ranger["TruckBed"].items,					0.5					);	
											
--------------------------------------------------											
--		HUNTER VEHICLE			--						
--------------------------------------------------											
table.insert(VehicleDistributions.Hunter["TruckBed"].items,					"Base.Sako85"					);	
table.insert(VehicleDistributions.Hunter["TruckBed"].items,					2					);	
table.insert(VehicleDistributions.Hunter["TruckBed"].items,					"Base.Savage12"					);	
table.insert(VehicleDistributions.Hunter["TruckBed"].items,					2					);	
table.insert(VehicleDistributions.Hunter["TruckBed"].items,					"Base.DT11"					);	
table.insert(VehicleDistributions.Hunter["TruckBed"].items,					2					);	
table.insert(VehicleDistributions.Hunter["TruckBed"].items,					"Base.Ruger_No1_4570"					);	
table.insert(VehicleDistributions.Hunter["TruckBed"].items,					1					);	
table.insert(VehicleDistributions.Hunter["TruckBed"].items,					"Base.Thompson_Center_3006"					);	
table.insert(VehicleDistributions.Hunter["TruckBed"].items,					1					);	
table.insert(VehicleDistributions.Hunter["TruckBed"].items,					"Base.NEF_Handi_410"					);	
table.insert(VehicleDistributions.Hunter["TruckBed"].items,					1					);	
table.insert(VehicleDistributions.Hunter["TruckBed"].items,					"Base.RamboKnife"					);	
table.insert(VehicleDistributions.Hunter["TruckBed"].items,					2					);	
table.insert(VehicleDistributions.Hunter["TruckBed"].items,					"Base.Light_Large"					);	
table.insert(VehicleDistributions.Hunter["TruckBed"].items,					1					);	
table.insert(VehicleDistributions.Hunter["TruckBed"].items,					"Base.Choke_Full"					);	
table.insert(VehicleDistributions.Hunter["TruckBed"].items,					0.5					);	
table.insert(VehicleDistributions.Hunter["TruckBed"].items,					"Base.Carrier_12g"					);	
table.insert(VehicleDistributions.Hunter["TruckBed"].items,					0.5					);	
table.insert(VehicleDistributions.Hunter["TruckBed"].items,					"Base.Pad"					);	
table.insert(VehicleDistributions.Hunter["TruckBed"].items,					0.5					);	
table.insert(VehicleDistributions.Hunter["TruckBed"].items,					"Base.Scope_1-4x"					);	
table.insert(VehicleDistributions.Hunter["TruckBed"].items,					0.5					);	
table.insert(VehicleDistributions.Hunter["TruckBed"].items,					"Base.Scope_20x"					);	
table.insert(VehicleDistributions.Hunter["TruckBed"].items,					0.5					);	
											
--------------------------------------------------											
--		SURVIVALIST VEHICLE		--							
--------------------------------------------------											
table.insert(VehicleDistributions.Survivalist["TruckBed"].items,					"Base.RamboKnife"					);	
table.insert(VehicleDistributions.Survivalist["TruckBed"].items,					2		- (LgKnife * xLgKnife)			);	
table.insert(VehicleDistributions.Survivalist["TruckBed"].items,					"Base.Case_Small1"					);	
table.insert(VehicleDistributions.Survivalist["TruckBed"].items,					0.2		- (w22 * x22)			);	
table.insert(VehicleDistributions.Survivalist["TruckBed"].items,					"Base.Case_Small2"					);	
table.insert(VehicleDistributions.Survivalist["TruckBed"].items,					0.2		- (Case * xCase)			);	
table.insert(VehicleDistributions.Survivalist["TruckBed"].items,					"Base.Case_Small3"					);	
table.insert(VehicleDistributions.Survivalist["TruckBed"].items,					0.5		- (Case * xCase)			);	
table.insert(VehicleDistributions.Survivalist["TruckBed"].items,					"Base.Case_Small4"					);	
table.insert(VehicleDistributions.Survivalist["TruckBed"].items,					0.4		- (Case * xCase)			);	
table.insert(VehicleDistributions.Survivalist["TruckBed"].items,					"Base.Case_Small5"					);	
table.insert(VehicleDistributions.Survivalist["TruckBed"].items,					0.3		- (Case * xCase)			);	
table.insert(VehicleDistributions.Survivalist["TruckBed"].items,					"Base.Case_Small6"					);	
table.insert(VehicleDistributions.Survivalist["TruckBed"].items,					0.4		- (Case * xCase)			);	
table.insert(VehicleDistributions.Survivalist["TruckBed"].items,					"Base.Case_Small7"					);	
table.insert(VehicleDistributions.Survivalist["TruckBed"].items,					0.2		- (Case * xCase)			);	
table.insert(VehicleDistributions.Survivalist["TruckBed"].items,					"Base.Case_Medium3"					);	
table.insert(VehicleDistributions.Survivalist["TruckBed"].items,					0.5		- (Case * xCase)			);	
table.insert(VehicleDistributions.Survivalist["TruckBed"].items,					"Base.Case_Medium5"					);	
table.insert(VehicleDistributions.Survivalist["TruckBed"].items,					0.5		- (Case * xCase)			);	
table.insert(VehicleDistributions.Survivalist["TruckBed"].items,					"Base.Case_Large1"					);	
table.insert(VehicleDistributions.Survivalist["TruckBed"].items,					0.5					);	
table.insert(VehicleDistributions.Survivalist["TruckBed"].items,					"Base.Case_Large3"					);	
table.insert(VehicleDistributions.Survivalist["TruckBed"].items,					0.5		- (Case * xCase)			);	
table.insert(VehicleDistributions.Survivalist["TruckBed"].items,					"Base.Case_Large4"					);	
table.insert(VehicleDistributions.Survivalist["TruckBed"].items,					0.5		- (Case * xCase)			);	
table.insert(VehicleDistributions.Survivalist["TruckBed"].items,					"Base.Case_Large5"					);	
table.insert(VehicleDistributions.Survivalist["TruckBed"].items,					0.1		- (Case * xCase)			);	
table.insert(VehicleDistributions.Survivalist["TruckBed"].items,					"Base.Light_Large"					);	
table.insert(VehicleDistributions.Survivalist["TruckBed"].items,					0.5					);	
table.insert(VehicleDistributions.Survivalist["TruckBed"].items,					"Base.Light_Small"					);	
table.insert(VehicleDistributions.Survivalist["TruckBed"].items,					0.3					);	
table.insert(VehicleDistributions.Survivalist["TruckBed"].items,					"Base.Suppressor_Pistol"					);	
table.insert(VehicleDistributions.Survivalist["TruckBed"].items,					0.1					);	
table.insert(VehicleDistributions.Survivalist["TruckBed"].items,					"Base.Suppressor_Rifle"					);	
table.insert(VehicleDistributions.Survivalist["TruckBed"].items,					0.1					);	
table.insert(VehicleDistributions.Survivalist["TruckBed"].items,					"Base.AmmoCan30_MIX"					);	
table.insert(VehicleDistributions.Survivalist["TruckBed"].items,					1					);	
table.insert(VehicleDistributions.Survivalist["TruckBed"].items,					"Base.AmmoCan30_MIX"					);	
table.insert(VehicleDistributions.Survivalist["TruckBed"].items,					0.5					);	
table.insert(VehicleDistributions.Survivalist["TruckBed"].items,					 "Base.AmmoCan50_MIX"					);	
table.insert(VehicleDistributions.Survivalist["TruckBed"].items,					1					);	
table.insert(VehicleDistributions.Survivalist["TruckBed"].items,					 "Base.AmmoCan50_MIX"					);	
table.insert(VehicleDistributions.Survivalist["TruckBed"].items,					0.5					);	
											
--------------------------------------------------											
--		ALL GLOVEBOX (RARE)		--							
--------------------------------------------------											
table.insert(VehicleDistributions.GloveBox.items,					"Base.Case_Small1"					);	--22
table.insert(VehicleDistributions.GloveBox.items,					Case		- (w22 * x22)			);	
table.insert(VehicleDistributions.GloveBox.items,					"Base.Case_Small2"					);	--380
table.insert(VehicleDistributions.GloveBox.items,					Case		- (Case * xCase)			);	
table.insert(VehicleDistributions.GloveBox.items,					"Base.Case_Small3"					);	-- 9
table.insert(VehicleDistributions.GloveBox.items,					Case		- (Case * xCase)			);	
table.insert(VehicleDistributions.GloveBox.items,					"Base.Case_Small4"					);	--357
table.insert(VehicleDistributions.GloveBox.items,					Case		- (Case * xCase)			);	
table.insert(VehicleDistributions.GloveBox.items,					"Base.Case_Small5"					);	-- 45SS
table.insert(VehicleDistributions.GloveBox.items,					Case		- (Case * xCase)			);	
table.insert(VehicleDistributions.GloveBox.items,					"Base.Case_Small6"					);	-- 45DS
table.insert(VehicleDistributions.GloveBox.items,					Case		- (Case * xCase)			);	
table.insert(VehicleDistributions.GloveBox.items,					"Base.Case_Small7"					);	-- 44
table.insert(VehicleDistributions.GloveBox.items,					Case		- (Case * xCase)			);	
table.insert(VehicleDistributions.GloveBox.items,					"Base.RamboKnife"					);	
table.insert(VehicleDistributions.GloveBox.items,					Case		- (LgKnife * xLgKnife)			);	
table.insert(VehicleDistributions.GloveBox.items,					 "Base.Butterfly"					);	
table.insert(VehicleDistributions.GloveBox.items,					Case		- (SmKnife * xSmKnife)			);	
table.insert(VehicleDistributions.GloveBox.items,					"Base.PushDagger"					);	
table.insert(VehicleDistributions.GloveBox.items,					Case		- (SmKnife * xSmKnife)			);	
table.insert(VehicleDistributions.GloveBox.items,					"Base.Karambit"					);	
table.insert(VehicleDistributions.GloveBox.items,					Case		- (SmKnife * xSmKnife)			);	
											
--------------------------------------------------											
--		ALL TRUNK STANDARD (RARE)	--								
--------------------------------------------------											
table.insert(VehicleDistributions.TrunkStandard.items,					"Base.Case_Small2"					);	--380
table.insert(VehicleDistributions.TrunkStandard.items,					Case		- (Case * xCase)			);	
table.insert(VehicleDistributions.TrunkStandard.items,					"Base.Case_Small3"					);	--9
table.insert(VehicleDistributions.TrunkStandard.items,					Case		- (Case * xCase)			);	
table.insert(VehicleDistributions.TrunkStandard.items,					"Base.Case_Small4"					);	--357
table.insert(VehicleDistributions.TrunkStandard.items,					Case		- (Case * xCase)			);	
table.insert(VehicleDistributions.TrunkStandard.items,					"Base.Case_Small6"					);	--45DS
table.insert(VehicleDistributions.TrunkStandard.items,					Case		- (Case * xCase)			);	
											
--------------------------------------------------											
--		ALL TRUNK HEAVY	(RARE)		--						
--------------------------------------------------											
table.insert(VehicleDistributions.TrunkHeavy.items,					"Base.Case_Large1"					);	
table.insert(VehicleDistributions.TrunkHeavy.items,					Case					);	
table.insert(VehicleDistributions.TrunkHeavy.items,					"Base.Oil_Filter"					);	
table.insert(VehicleDistributions.TrunkHeavy.items,					0.1					);	
											
--------------------------------------------------											
--		ALL TRUNK SPORTS (RARE)		--							
--------------------------------------------------											
table.insert(VehicleDistributions.TrunkSports.items,					"Base.Case_Medium1"					);	
table.insert(VehicleDistributions.TrunkSports.items,					Case		- (Case * xCase)			);	
											
											
------------------------------------------------------------------											
--		PROCEDURAL LIST	(MELEE)				--				
------------------------------------------------------------------											
table.insert(ProceduralDistributions.list["MeleeWeapons"].items,					"Base.RussianMachete"					);	
table.insert(ProceduralDistributions.list["MeleeWeapons"].items,					0.5		- (LgKnife * xLgKnife)			);	
table.insert(ProceduralDistributions.list["MeleeWeapons"].items,					"Base.BGMachete"					);	
table.insert(ProceduralDistributions.list["MeleeWeapons"].items,					0.5		- (LgKnife * xLgKnife)			);	
table.insert(ProceduralDistributions.list["MeleeWeapons"].items,					"Base.RamboKnife"					);	
table.insert(ProceduralDistributions.list["MeleeWeapons"].items,					0.2		- (LgKnife * xLgKnife)			);	
table.insert(ProceduralDistributions.list["MeleeWeapons"].items,					"Base.Butterfly"					);	
table.insert(ProceduralDistributions.list["MeleeWeapons"].items,					0.5		- (SmKnife * xSmKnife)			);	
table.insert(ProceduralDistributions.list["MeleeWeapons"].items,					"Base.PushDagger"					);	
table.insert(ProceduralDistributions.list["MeleeWeapons"].items,					0.5		- (SmKnife * xSmKnife)			);	
table.insert(ProceduralDistributions.list["MeleeWeapons"].items,					"Base.Karambit"					);	
table.insert(ProceduralDistributions.list["MeleeWeapons"].items,					0.5		- (SmKnife * xSmKnife)			);	
table.insert(ProceduralDistributions.list["MeleeWeapons"].items,					"Base.Tactical_Axe"					);	
table.insert(ProceduralDistributions.list["MeleeWeapons"].items,					0.5		- (Axe * xAxe)			);	
table.insert(ProceduralDistributions.list["MeleeWeapons"].items,					"Base.Tactical_Sickle"					);	
table.insert(ProceduralDistributions.list["MeleeWeapons"].items,					0.5		- (Axe * xAxe)			);	
table.insert(ProceduralDistributions.list["MeleeWeapons"].items,					"Base.DingDong"					);	
table.insert(ProceduralDistributions.list["MeleeWeapons"].items,					0.5		- (Blunt * xBlunt)			);	
table.insert(ProceduralDistributions.list["MeleeWeapons"].items,					"Base.MilitaryBaton"					);	
table.insert(ProceduralDistributions.list["MeleeWeapons"].items,					0.5		- (Blunt * xBlunt)			);	
table.insert(ProceduralDistributions.list["MeleeWeapons"].items,					"Base.KillBill"					);	
table.insert(ProceduralDistributions.list["MeleeWeapons"].items,					0.001		- (Sword * xSword)			);	
table.insert(ProceduralDistributions.list["MeleeWeapons"].items,					"Base.CH_WarSword"					);	
table.insert(ProceduralDistributions.list["MeleeWeapons"].items,					0.001		- (Sword * xSword)			);	
table.insert(ProceduralDistributions.list["MeleeWeapons"].items,					"Base.Conan_Sword"					);	
table.insert(ProceduralDistributions.list["MeleeWeapons"].items,					0.001		- (Sword * xSword)			);	
											
table.insert(ProceduralDistributions.list["GarageCarpentry"].items,					"Base.Tactical_Axe"					);	
table.insert(ProceduralDistributions.list["GarageCarpentry"].items,						1	- (Axe * xAxe)			);	
											
table.insert(ProceduralDistributions.list["GardenStoreTools"].items,					"Base.Tactical_Axe"					);	
table.insert(ProceduralDistributions.list["GardenStoreTools"].items,						1	- (Axe * xAxe)			);	
table.insert(ProceduralDistributions.list["GardenStoreTools"].items,					"Base.Tactical_Sickle"					);	
table.insert(ProceduralDistributions.list["GardenStoreTools"].items,						1	- (Axe * xAxe)			);	
											
table.insert(ProceduralDistributions.list["GigamartFarming"].items,					"Base.RussianMachete"					);	
table.insert(ProceduralDistributions.list["GigamartFarming"].items,						1	- (LgKnife * xLgKnife)			);	
table.insert(ProceduralDistributions.list["GigamartFarming"].items,					"Base.BGMachete"					);	
table.insert(ProceduralDistributions.list["GigamartFarming"].items,						1	- (LgKnife * xLgKnife)			);	
table.insert(ProceduralDistributions.list["GigamartFarming"].items,					"Base.Tactical_Sickle"					);	
table.insert(ProceduralDistributions.list["GigamartFarming"].items,						1	- (Axe * xAxe)			);	
											
table.insert(ProceduralDistributions.list["GigamartTools"].items,					"Base.Tactical_Axe"					);	
table.insert(ProceduralDistributions.list["GigamartTools"].items,						1	- (Axe * xAxe)			);	
table.insert(ProceduralDistributions.list["GigamartTools"].items,					"Base.DingDong"					);	
table.insert(ProceduralDistributions.list["GigamartTools"].items,						0.5	- (Blunt * xBlunt)			);	
											
table.insert(ProceduralDistributions.list["ToolStoreTools"].items,					"Base.RussianMachete"					);	
table.insert(ProceduralDistributions.list["ToolStoreTools"].items,						1	- (LgKnife * xLgKnife)			);	
table.insert(ProceduralDistributions.list["ToolStoreTools"].items,					"Base.BGMachete"					);	
table.insert(ProceduralDistributions.list["ToolStoreTools"].items,						1	- (LgKnife * xLgKnife)			);	
table.insert(ProceduralDistributions.list["ToolStoreTools"].items,					"Base.RamboKnife"					);	
table.insert(ProceduralDistributions.list["ToolStoreTools"].items,						1	- (LgKnife * xLgKnife)			);	
table.insert(ProceduralDistributions.list["ToolStoreTools"].items,					"Base.Tactical_Axe"					);	
table.insert(ProceduralDistributions.list["ToolStoreTools"].items,						1	- (Axe * xAxe)			);	
table.insert(ProceduralDistributions.list["ToolStoreTools"].items,					"Base.Tactical_Sickle"					);	
table.insert(ProceduralDistributions.list["ToolStoreTools"].items,						1	- (Axe * xAxe)			);	
table.insert(ProceduralDistributions.list["ToolStoreTools"].items,					"Base.DingDong"					);	
table.insert(ProceduralDistributions.list["ToolStoreTools"].items,						0.5	- (Blunt * xBlunt)			);	
											
table.insert(ProceduralDistributions.list["ToolStoreFarming"].items,					"Base.Tactical_Axe"					);	
table.insert(ProceduralDistributions.list["ToolStoreFarming"].items,						1	- (Axe * xAxe)			);	
table.insert(ProceduralDistributions.list["ToolStoreFarming"].items,					"Base.Tactical_Sickle"					);	
table.insert(ProceduralDistributions.list["ToolStoreFarming"].items,						1	- (Axe * xAxe)			);	
											
table.insert(ProceduralDistributions.list["JaysKitchenButcher"].items,					"Base.KillBill"					);	
table.insert(ProceduralDistributions.list["JaysKitchenButcher"].items,						0.001	- (Sword * xSword)			);	
											
------------------------------------------------------------------											
--		PROCEDURAL LIST	(OIL FILTER, WD, CLEANING)			--					
------------------------------------------------------------------											
table.insert(ProceduralDistributions.list["StoreShelfMechanics"].items,					"Base.Oil_Filter"					);	
table.insert(ProceduralDistributions.list["StoreShelfMechanics"].items,					8					);	
table.insert(ProceduralDistributions.list["StoreShelfMechanics"].items,					"Base.WD"					);	
table.insert(ProceduralDistributions.list["StoreShelfMechanics"].items,					8					);	
											
table.insert(ProceduralDistributions.list["MechanicShelfTools"].items,					"Base.Oil_Filter"					);	
table.insert(ProceduralDistributions.list["MechanicShelfTools"].items,					8					);	
table.insert(ProceduralDistributions.list["MechanicShelfTools"].items,					"Base.WD"					);	
table.insert(ProceduralDistributions.list["MechanicShelfTools"].items,					8					);	
											
table.insert(ProceduralDistributions.list["CrateMechanics"].items,					"Base.Oil_Filter"					);	
table.insert(ProceduralDistributions.list["CrateMechanics"].items,					8					);	
table.insert(ProceduralDistributions.list["CrateMechanics"].items,					"Base.WD"					);	
table.insert(ProceduralDistributions.list["CrateMechanics"].items,					8					);	
											
-- 41.60 ERRORS WITH THIS table.insert(ProceduralDistributions.list["GarageMechanic"].items,					"Base.Oil_Filter"					);	
-- 41.60 ERRORS WITH THIS table.insert(ProceduralDistributions.list["GarageMechanic"].items,					8					);	
-- 41.60 ERRORS WITH THIS table.insert(ProceduralDistributions.list["GarageMechanic"].items,					"Base.WD"					);	
-- 41.60 ERRORS WITH THIS table.insert(ProceduralDistributions.list["GarageMechanic"].items,					8					);	
											
table.insert(ProceduralDistributions.list["GarageTools"].items,					"Base.Oil_Filter"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					8					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					"Base.WD"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					8					);	
											
table.insert(ProceduralDistributions.list["CrateTools"].items,					"Base.Cleaning"					);	
table.insert(ProceduralDistributions.list["CrateTools"].items,					5					);	
table.insert(ProceduralDistributions.list["CrateTools"].items,					"Base.Oil_Filter"					);	
table.insert(ProceduralDistributions.list["CrateTools"].items,					5					);	
table.insert(ProceduralDistributions.list["CrateTools"].items,					"Base.WD"					);	
table.insert(ProceduralDistributions.list["CrateTools"].items,					5					);	
											
--table.insert(ProceduralDistributions.list[""].items, "Base.");											
--table.insert(ProceduralDistributions.list[""].items, 0.5);											
--table.insert(ProceduralDistributions.list[""].items, "Base.");											
--table.insert(ProceduralDistributions.list[""].items, 0.5);											
											
------------------------------------------------------------------											
--		PROCEDURAL LIST	(TOYS)				--				
------------------------------------------------------------------											
table.insert(ProceduralDistributions.list["GigamartToys"].items,					"Base.UmarexSS"					);	
table.insert(ProceduralDistributions.list["GigamartToys"].items,					1		- (wBB * xBB)		- (wBB * CIVx * x90)	);	
table.insert(ProceduralDistributions.list["GigamartToys"].items,					"Base.Benjamin_M397"					);	
table.insert(ProceduralDistributions.list["GigamartToys"].items,					0.5		- (wBB * xBB)			);	
table.insert(ProceduralDistributions.list["GigamartToys"].items,					"Base.RWS_M34"					);	
table.insert(ProceduralDistributions.list["GigamartToys"].items,					0.5		- (wBB * xBB)		- (wBB * CIVx * x90)	);	
table.insert(ProceduralDistributions.list["GigamartToys"].items,					"Base.SS2000"					);	
table.insert(ProceduralDistributions.list["GigamartToys"].items,					0.5		- (wBB * xBB)			);	
table.insert(ProceduralDistributions.list["GigamartToys"].items,					"Base.BB177Box"					);	
table.insert(ProceduralDistributions.list["GigamartToys"].items,					2		- (wBB * xBB)			);	
											
table.insert(ProceduralDistributions.list["CrateToys"].items,					"Base.UmarexSS"					);	
table.insert(ProceduralDistributions.list["CrateToys"].items,					1		- (wBB * xBB)		- (wBB * CIVx * x90)	);	
table.insert(ProceduralDistributions.list["CrateToys"].items,					"Base.Benjamin_M397"					);	
table.insert(ProceduralDistributions.list["CrateToys"].items,					0.5		- (wBB * xBB)			);	
table.insert(ProceduralDistributions.list["CrateToys"].items,					"Base.RWS_M34"					);	
table.insert(ProceduralDistributions.list["CrateToys"].items,					0.5		- (wBB * xBB)		- (wBB * CIVx * x90)	);	
table.insert(ProceduralDistributions.list["CrateToys"].items,					"Base.SS2000"					);	
table.insert(ProceduralDistributions.list["CrateToys"].items,					0.5		- (wBB * xBB)			);	
table.insert(ProceduralDistributions.list["CrateToys"].items,					"Base.BB177Box"					);	
table.insert(ProceduralDistributions.list["CrateToys"].items,					2		- (wBB * xBB)			);	
											
table.insert(ProceduralDistributions.list["SchoolLockers"].items,					"Base.UmarexSS"					);	
table.insert(ProceduralDistributions.list["SchoolLockers"].items,					1		- (wBB * xBB)		- (wBB * CIVx * x90)	);	
table.insert(ProceduralDistributions.list["SchoolLockers"].items,					"Base.Benjamin_M397"					);	
table.insert(ProceduralDistributions.list["SchoolLockers"].items,					0.5		- (wBB * xBB)			);	
table.insert(ProceduralDistributions.list["SchoolLockers"].items,					"Base.RWS_M34"					);	
table.insert(ProceduralDistributions.list["SchoolLockers"].items,					0.5		- (wBB * xBB)		- (wBB * CIVx * x90)	);	
table.insert(ProceduralDistributions.list["SchoolLockers"].items,					"Base.SS2000"					);	
table.insert(ProceduralDistributions.list["SchoolLockers"].items,					1		- (wBB * xBB)			);	
table.insert(ProceduralDistributions.list["SchoolLockers"].items,					"Base.BB177Box"					);	
table.insert(ProceduralDistributions.list["SchoolLockers"].items,					1		- (wBB * xBB)			);	
table.insert(ProceduralDistributions.list["SchoolLockers"].items,					"Base.Butterfly"					);	
table.insert(ProceduralDistributions.list["SchoolLockers"].items,					0.1		- (SmKnife * xSmKnife)			);	
table.insert(ProceduralDistributions.list["SchoolLockers"].items,					"Base.ZIP22"					);	
table.insert(ProceduralDistributions.list["SchoolLockers"].items,					0.01		- (w22 * x22)			);	
											
table.insert(ProceduralDistributions.list["WardrobeChild"].items,					"Base.UmarexSS"					);	
table.insert(ProceduralDistributions.list["WardrobeChild"].items,					0.5		- (wBB * xBB)		- (wBB * CIVx * x90)	);	
table.insert(ProceduralDistributions.list["WardrobeChild"].items,					"Base.Benjamin_M397"					);	
table.insert(ProceduralDistributions.list["WardrobeChild"].items,					0.5		- (wBB * xBB)			);	
table.insert(ProceduralDistributions.list["WardrobeChild"].items,					"Base.RWS_M34"					);	
table.insert(ProceduralDistributions.list["WardrobeChild"].items,					0.5		- (wBB * xBB)		- (wBB * CIVx * x90)	);	
table.insert(ProceduralDistributions.list["WardrobeChild"].items,					"Base.SS2000"					);	
table.insert(ProceduralDistributions.list["WardrobeChild"].items,					0.5		- (wBB * xBB)			);	
table.insert(ProceduralDistributions.list["WardrobeChild"].items,					"Base.BB177Box"					);	
table.insert(ProceduralDistributions.list["WardrobeChild"].items,					1		- (wBB * xBB)			);	
											
											
------------------------------------------------------------------											
--		PROCEDURAL LIST	(PLANKSTASHGUN ) CASES		--						
--		NOTE : VANILLA CALLS FOR PLANKSTASHWEAPON	--								
--		WONT DO ANYTHING TILL THEY CHOOSE WHICH		--							
------------------------------------------------------------------											
table.insert(ProceduralDistributions.list["PlankStashGun"].items,					"Base.Case_Small1"					);	
table.insert(ProceduralDistributions.list["PlankStashGun"].items,					5		- (w22 * x22)			);	
table.insert(ProceduralDistributions.list["PlankStashGun"].items,					"Base.Case_Small2"					);	
table.insert(ProceduralDistributions.list["PlankStashGun"].items,					5		- (Case * xCase)			);	
table.insert(ProceduralDistributions.list["PlankStashGun"].items,					"Base.Case_Small3"					);	
table.insert(ProceduralDistributions.list["PlankStashGun"].items,					2		- (Case * xCase)			);	
table.insert(ProceduralDistributions.list["PlankStashGun"].items,					"Base.Case_Small4"					);	
table.insert(ProceduralDistributions.list["PlankStashGun"].items,					2		- (Case * xCase)			);	
table.insert(ProceduralDistributions.list["PlankStashGun"].items,					"Base.Case_Small5"					);	
table.insert(ProceduralDistributions.list["PlankStashGun"].items,					5		- (Case * xCase)			);	
table.insert(ProceduralDistributions.list["PlankStashGun"].items,					"Base.Case_Small6"					);	
table.insert(ProceduralDistributions.list["PlankStashGun"].items,					3		- (Case * xCase)			);	
table.insert(ProceduralDistributions.list["PlankStashGun"].items,					"Base.Case_Small7"					);	
table.insert(ProceduralDistributions.list["PlankStashGun"].items,					2		- (Case * xCase)			);	
											
------------------------------------------------------------------											
--		PROCEDURAL LIST	(GARAGETOOLS) CASE (RARE) 	--							
------------------------------------------------------------------											
table.insert(ProceduralDistributions.list["GarageTools"].items,					"Base.Case_Cute"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					Case		- (w22 * x22)			);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					"Base.Case_Small1"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					Case		- (w22 * x22)			);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					"Base.Case_Small2"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					Case		- (Case * xCase)			);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					"Base.Case_Small3"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					Case		- (Case * xCase)			);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					"Base.Case_Small4"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					Case		- (Case * xCase)			);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					"Base.Case_Small5"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					Case		- (Case * xCase)			);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					"Base.Case_Small6"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					Case		- (Case * xCase)			);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					"Base.Case_Small7"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					Case		- (Case * xCase)			);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					"Base.Case_Medium1"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					Case		- (Case * xCase)			);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					"Base.Case_Medium2"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					Case		- (Case * xCase)			);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					"Base.Case_Medium3"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					Case		- (Case * xCase)			);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					"Base.Case_Medium4"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					Case		- (Case * xCase)			);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					"Base.Case_Medium5"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					Case		- (Case * xCase)			);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					"Base.Case_Medium6"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					Case		- (Case * xCase)			);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					"Base.Case_Large1"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					Case		- (Case * xCase)			);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					"Base.Case_Large2"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					Case		- (Case * xCase)			);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					"Base.Case_Large3"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					Case		- (Case * xCase)			);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					"Base.Case_Large4"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					Case		- (Case * xCase)			);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					"Base.Case_Large5"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					Case		- (Case * xCase)			);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					"Base.Case_Large6"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					Case		- (Case * xCase)			);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					"Base.Case_Large7"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					Case		- (Case * xCase)			);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					"Base.Case_Heavy4"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					Case		- (Case * xCase)			);	
											
table.insert(ProceduralDistributions.list["GarageTools"].items,					 "Base.AmmoCan30_22"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,						Case	- (w22 * x22)			);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					 "Base.AmmoCan30_380"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,						Case	- (Case * xCase)			);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					 "Base.AmmoCan30_9"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,						Case	- (Case * xCase)			);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					 "Base.AmmoCan30_57"					);	-- REMOVE NOT 90
table.insert(ProceduralDistributions.list["GarageTools"].items,						Case	* w57		- (AmmoCan * x90)	);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					 "Base.AmmoCan30_38"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,						Case	- (Case * xCase)			);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					 "Base.AmmoCan30_357"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,						Case	- (Case * xCase)			);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					 "Base.AmmoCan30_45"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,						Case	- (Case * xCase)			);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					 "Base.AmmoCan30_45LC"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,						Case	* w4570			);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					 "Base.AmmoCan30_44"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,						Case	- (Case * xCase)			);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					 "Base.AmmoCan30_4570"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,						Case	* w4570			);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					 "Base.AmmoCan30_MIX"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,						Case				);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					 "Base.AmmoCan50_223"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,						Case	* w223			);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					 "Base.AmmoCan50_556"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,						Case	- (Case * xCase)			);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					 "Base.AmmoCan50_545x39"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,						Case	- (Case * xCase)			);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					 "Base.AmmoCan50_762x39"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,						Case	- (Case * xCase)			);	
-- table.insert(ProceduralDistributions.list["GarageTools"].items,					 "Base.AmmoCan50_762x51"					);	-- REMOVE NOT USED
-- table.insert(ProceduralDistributions.list["GarageTools"].items,						Case				);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					 "Base.AmmoCan50_762x54r"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,						Case	- (w762x54r * x762x54r)			);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					 "Base.AmmoCan50_308"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,						Case	- (w308 * x308)			);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					 "Base.AmmoCan50_3006"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,						Case	- (w3006 * x3006)			);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					 "Base.AmmoCan50_50"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,						Case	- (Case * xCase)			);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					 "Base.AmmoCan50_MIX"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,						Case				);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					 "Base.AmmoCan50_410"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,						Case	* w4570			);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					 "Base.AmmoCan50_20"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,						Case	* w12g			);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					 "Base.AmmoCan50_12"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,						Case	- (Case * xCase)			);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					 "Base.AmmoCan50_10"					);	-- LET OPTIONS DO IT
table.insert(ProceduralDistributions.list["GarageTools"].items,						Case	* w4g			);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					 "Base.AmmoCan50_4"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,						Case	* wBMG			);	
table.insert(ProceduralDistributions.list["GarageTools"].items,					 "Base.AmmoCan50_SHOT"					);	
table.insert(ProceduralDistributions.list["GarageTools"].items,						Case				);	
-- table.insert(ProceduralDistributions.list["GarageTools"].items,					 "Base.AmmoCan50_HE"					);	-- REMOVE MIL
-- table.insert(ProceduralDistributions.list["GarageTools"].items,						Case	- (Case * xCase)			);	
-- table.insert(ProceduralDistributions.list["GarageTools"].items,					 "Base.AmmoCan50_INC"					);	-- REMOVE MIL
-- table.insert(ProceduralDistributions.list["GarageTools"].items,						Case	- (Case * xCase)			);	
											
if (xArmor == 0) then					-- << MEANS ARMOR IS NOT DISABLED						
	print ("ARMOR DISTRO OVERRIDE OPTION ENABLED")										
	if getActivatedMods():contains("Brita_2") then									--	100
		print("Brita_2 DETECTED… RESETTING DISTRO… RE-INSERT DISTRO IN MIL VEHICLES & LOCKERS")									
		require "Items/Brita_Armor_Distributrions"									
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Ela_Jacket"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Ela_Pants"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Killa_Jacket"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Killa_Pants"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Gorka_Jacket"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Gorka_Jacket2"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Gorka_Jacket3"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Gorka_Pants"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Gorka_Pants2"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Gorka_Pants3"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Armor_Defender"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Armor_6B13"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Suit_Chempak"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Hat_Ela_Hat"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Hat_Ela_Hat_Only"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Hat_Killa"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Hat_Killa_Visor"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Hat_FAST_Opscore"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Hat_Beret_Tactical_Only"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Hat_Sordin"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Hat_Astrocom"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Hat_M1_Helmet"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Hat_M1_Helmet_Ori"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Hat_Maska"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Hat_Maska_Visor"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Hat_Maska_Visor2"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Hat_Gentex_Helmet"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Hat_Face_Shield"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Hat_Helmet_Headset"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Hat_Sam_NV"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Hat_PVS15_ON"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Hat_NV18_ON"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Hat_FM53"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Hat_M50"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Hat_M45_GasMask"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Hat_MCU_GasMask"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Glasses_X1000"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Glasses_Crewman_Goggles"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Glasses_Napier"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Bag_Plate_Carrier"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Bag_Blackhawk"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Bag_Duty_Belt_Front"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Bag_ST53_Set"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Bag_D3M"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Bag_Smersh_Vest"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Bag_Tactical_Belt_Front"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Bag_Sniper_Hood"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Bag_Sniper_Pack"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Bag_ARVN_Rucksack"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Bag_SSO"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Bag_Radio_Pack"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Bag_ZIP"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Bag_Savotta"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Bag_Bush"	, nil, true);					
		RemoveItemFromDistribution(ProceduralDistributions.list,			"Base.Bag_Hunting"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Ela_Jacket"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Ela_Pants"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Killa_Jacket"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Killa_Pants"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Gorka_Jacket"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Gorka_Jacket2"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Gorka_Jacket3"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Gorka_Pants"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Gorka_Pants2"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Gorka_Pants3"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Armor_Defender"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Armor_6B13"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Suit_Chempak"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Hat_Ela_Hat"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Hat_Ela_Hat_Only"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Hat_Killa"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Hat_Killa_Visor"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Hat_FAST_Opscore"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Hat_Beret_Tactical_Only"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Hat_Sordin"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Hat_Astrocom"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Hat_M1_Helmet"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Hat_M1_Helmet_Ori"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Hat_Maska"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Hat_Maska_Visor"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Hat_Maska_Visor2"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Hat_Gentex_Helmet"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Hat_Face_Shield"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Hat_Helmet_Headset"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Hat_Sam_NV"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Hat_PVS15_ON"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Hat_NV18_ON"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Hat_FM53"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Hat_M50"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Hat_M45_GasMask"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Hat_MCU_GasMask"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Glasses_X1000"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Glasses_Crewman_Goggles"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Glasses_Napier"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Bag_Plate_Carrier"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Bag_Blackhawk"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Bag_Duty_Belt_Front"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Bag_ST53_Set"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Bag_D3M"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Bag_Smersh_Vest"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Bag_Tactical_Belt_Front"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Bag_Sniper_Hood"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Bag_Sniper_Pack"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Bag_ARVN_Rucksack"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Bag_SSO"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Bag_Radio_Pack"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Bag_ZIP"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Bag_Savotta"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Bag_Bush"	, nil, true);					
		RemoveItemFromDistribution(SuburbsDistributions,			"Base.Bag_Hunting"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Ela_Jacket"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Ela_Pants"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Killa_Jacket"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Killa_Pants"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Gorka_Jacket"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Gorka_Jacket2"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Gorka_Jacket3"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Gorka_Pants"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Gorka_Pants2"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Gorka_Pants3"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Armor_Defender"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Armor_6B13"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Suit_Chempak"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Hat_Ela_Hat"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Hat_Ela_Hat_Only"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Hat_Killa"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Hat_Killa_Visor"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Hat_FAST_Opscore"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Hat_Beret_Tactical_Only"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Hat_Sordin"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Hat_Astrocom"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Hat_M1_Helmet"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Hat_M1_Helmet_Ori"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Hat_Maska"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Hat_Maska_Visor"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Hat_Maska_Visor2"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Hat_Gentex_Helmet"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Hat_Face_Shield"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Hat_Helmet_Headset"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Hat_Sam_NV"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Hat_PVS15_ON"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Hat_NV18_ON"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Hat_FM53"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Hat_M50"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Hat_M45_GasMask"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Hat_MCU_GasMask"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Glasses_X1000"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Glasses_Crewman_Goggles"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Glasses_Napier"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Bag_Plate_Carrier"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Bag_Blackhawk"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Bag_Duty_Belt_Front"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Bag_ST53_Set"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Bag_D3M"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Bag_Smersh_Vest"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Bag_Tactical_Belt_Front"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Bag_Sniper_Hood"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Bag_Sniper_Pack"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Bag_ARVN_Rucksack"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Bag_SSO"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Bag_Radio_Pack"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Bag_ZIP"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Bag_Savotta"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Bag_Bush"	, nil, true);					
		RemoveItemFromDistribution(Distributions[1],			"Base.Bag_Hunting"	, nil, true);					
											
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Ela_Jacket"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)				);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Ela_Pants"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)				);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Killa_Jacket"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)		- (Armor * MILxNON)		);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Killa_Pants"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)		- (Armor * MILxNON)		);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Gorka_Jacket"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)				);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Gorka_Jacket2"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)				);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Gorka_Jacket3"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)				);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Gorka_Pants"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)				);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Gorka_Pants2"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)				);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Gorka_Pants3"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)				);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Armor_Defender"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)			- (Armor * x90)	);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Armor_6B13"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)			- (Armor * x90)	);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Suit_Chempak"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)				);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Hat_Ela_Hat"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)				);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Hat_Ela_Hat_Only"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)				);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Hat_Killa"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)				);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Hat_Killa_Visor"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)				);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Hat_FAST_Opscore"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)				);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Hat_Beret_Tactical_Only"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)				);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Hat_Sordin"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)				);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Hat_Astrocom"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)				);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Hat_M1_Helmet"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)				);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Hat_M1_Helmet_Ori"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)				);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Hat_Maska"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)			- (Armor * x90)	);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Hat_Maska_Visor"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)			- (Armor * x90)	);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Hat_Maska_Visor2"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)			- (Armor * x90)	);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Hat_Gentex_Helmet"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)				);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Hat_Face_Shield"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)				);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Hat_Helmet_Headset"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)				);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Hat_Sam_NV"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)				);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Hat_PVS15_ON"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)			- (Armor * x90)	);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Hat_NV18_ON"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)				);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Hat_FM53"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)				);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Hat_M50"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)				);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Hat_M45_GasMask"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)				);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Hat_MCU_GasMask"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)				);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Glasses_X1000"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)				);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Glasses_Crewman_Goggles"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)				);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Glasses_Napier"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)		- (Armor * MILxNON)		);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Bag_Plate_Carrier"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)				);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Bag_Blackhawk"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)				);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Bag_Duty_Belt_Front"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)		- (Armor * MILxNON)		);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Bag_ST53_Set"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)				);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Bag_D3M"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)				);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Bag_Smersh_Vest"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)			- (Armor * x90)	);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Bag_Tactical_Belt_Front"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)				);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Bag_Sniper_Hood"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)				);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Bag_Sniper_Pack"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)				);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Bag_ARVN_Rucksack"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)				);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Bag_SSO"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)				);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Bag_Radio_Pack"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)				);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Bag_ZIP"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)		- (Armor * MILxNON)		);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Bag_Savotta"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)		- (Armor * MILxNON)		);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Bag_Bush"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)		- (Armor * MILxNON)		);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Bag_Hunting"						);
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100	- (Armor * xArmor)		- (Armor * MILxNON)		);
											
		if getActivatedMods():contains("FRUsedCarsBETA") then									
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Ela_Jacket"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)				);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Ela_Pants"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)				);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Killa_Jacket"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)		- (Armor * MILxNON)		);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Killa_Pants"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)		- (Armor * MILxNON)		);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Gorka_Jacket"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)				);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Gorka_Jacket2"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)				);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Gorka_Jacket3"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)				);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Gorka_Pants"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)				);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Gorka_Pants2"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)				);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Gorka_Pants3"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)				);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Armor_Defender"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)			- (Armor * x90)	);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Armor_6B13"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)			- (Armor * x90)	);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Suit_Chempak"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)				);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Hat_Ela_Hat"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)				);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Hat_Ela_Hat_Only"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)				);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Hat_Killa"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)				);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Hat_Killa_Visor"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)				);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Hat_FAST_Opscore"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)				);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Hat_Beret_Tactical_Only"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)				);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Hat_Sordin"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)				);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Hat_Astrocom"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)				);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Hat_M1_Helmet"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)				);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Hat_M1_Helmet_Ori"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)				);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Hat_Maska"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)			- (Armor * x90)	);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Hat_Maska_Visor"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)			- (Armor * x90)	);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Hat_Maska_Visor2"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)			- (Armor * x90)	);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Hat_Gentex_Helmet"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)				);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Hat_Face_Shield"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)				);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Hat_Helmet_Headset"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)				);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Hat_Sam_NV"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)				);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Hat_PVS15_ON"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)			- (Armor * x90)	);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Hat_NV18_ON"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)				);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Hat_FM53"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)				);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Hat_M50"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)				);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Hat_M45_GasMask"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)				);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Hat_MCU_GasMask"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)				);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Glasses_X1000"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)				);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Glasses_Crewman_Goggles"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)				);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Glasses_Napier"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)		- (Armor * MILxNON)		);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Bag_Plate_Carrier"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)				);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Bag_Blackhawk"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)				);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Bag_Duty_Belt_Front"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)		- (Armor * MILxNON)		);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Bag_ST53_Set"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)				);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Bag_D3M"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)				);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Bag_Smersh_Vest"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)			- (Armor * x90)	);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Bag_Tactical_Belt_Front"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)				);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Bag_Sniper_Hood"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)				);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Bag_Sniper_Pack"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)				);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Bag_ARVN_Rucksack"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)				);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Bag_SSO"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)				);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Bag_Radio_Pack"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)				);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Bag_ZIP"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)		- (Armor * MILxNON)		);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Bag_Savotta"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)		- (Armor * MILxNON)		);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Bag_Bush"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)		- (Armor * MILxNON)		);
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Bag_Hunting"						);
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)		- (Armor * MILxNON)		);
		end									
	end										
											
	if getActivatedMods():contains("DRK_1") then										
		print("DRK_1 DETECTED… RESETTING DISTRO… RE-INSERT DISTRO IN MIL VEHICLES & LOCKERS")									
		require "Items/DRK_Armor_Distributions"									
		RemoveItemFromDistribution(ProceduralDistributions.list, "Base.Hat_PASGT_Helmet",			nil, true);						
		RemoveItemFromDistribution(ProceduralDistributions.list, "Base.Hat_TPASGT_Helmet",			nil, true);						
		RemoveItemFromDistribution(ProceduralDistributions.list, "Base.Interceptor_Armor",			nil, true);						
		RemoveItemFromDistribution(ProceduralDistributions.list, "Base.Interceptor_Armor_v",			nil, true);						
		RemoveItemFromDistribution(ProceduralDistributions.list, "Base.Interceptor_Armor_s",			nil, true);						
		RemoveItemFromDistribution(ProceduralDistributions.list, "Base.Marpat_Jacket_w",			nil, true);						
		RemoveItemFromDistribution(ProceduralDistributions.list, "Base.Marpat_Jacket_d",			nil, true);						
		RemoveItemFromDistribution(ProceduralDistributions.list, "Base.Marpat_Pants_w",			nil, true);						
		RemoveItemFromDistribution(ProceduralDistributions.list, "Base.Marpat_Pants_d",			nil, true);						
		RemoveItemFromDistribution(ProceduralDistributions.list, "Base.Interceptor_Pouches",			nil, true);						
		RemoveItemFromDistribution(ProceduralDistributions.list, "Base.Hat_USMC_Cap",			nil, true);						
											
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Hat_PASGT_Helmet"					);	
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100				);	
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Hat_TPASGT_Helmet"					);	
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100				);	
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Interceptor_Armor"					);	
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100				);	
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Interceptor_Armor_v"					);	
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100				);	
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Interceptor_Armor_s"					);	
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100				);	
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Marpat_Jacket_w"					);	
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100				);	
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Marpat_Jacket_d"					);	
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100				);	
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Marpat_Pants_w"					);	
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100				);	
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Marpat_Pants_d"					);	
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100				);	
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Interceptor_Pouches"					);	
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100				);	
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Hat_USMC_Cap_w"					);	
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100				);	
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,			"Base.Hat_USMC_Cap_d"					);	
		table.insert(ProceduralDistributions.list["LockerArmyBedroom"].items,				Armor / 100				);	
											
		if getActivatedMods():contains("FRUsedCarsBETA") then									
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Hat_PASGT_Helmet"					);	
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)			);	
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Hat_TPASGT_Helmet"					);	
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)			);	
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Interceptor_Armor"					);	
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)		- (Armor * MILxNON)	);	
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Interceptor_Armor_v"					);	
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)		- (Armor * MILxNON)	);	
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Interceptor_Armor_s"					);	
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)			);	
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Marpat_Jacket_w"					);	
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)			);	
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Marpat_Jacket_d"					);	
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)			);	
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Marpat_Pants_w"					);	
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)			);	
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Marpat_Pants_d"					);	
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)			);	
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Interceptor_Pouches"					);	
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)			);	
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Hat_USMC_Cap_w"					);	
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)			);	
			table.insert(VehicleDistributions.Military["TruckBed"].items,		"Base.Hat_USMC_Cap_d"					);	
			table.insert(VehicleDistributions.Military["TruckBed"].items,			Armor / 100	- (Armor * xArmor)			);	
		end									
	end										
else print ("ARMOR DISTRO OVERRIDE OPTION DISABLED")											
end											

A26ProcDistro = {};																		
A26ProcDistro.list = {																		
																		
	GunStoreGuns = {																	
		rolls =	GUNRollGUN	,														
		items = {																
			"Base.UmarexSS",	wBB	 * CIVx	- (wBB * xBB)		- (wBB * CIVx * xUSA)			- (wBB * CIVx * x90)	,						
			"Base.Benjamin_M397",	wBB	 * CIVx	- (wBB * xBB)		- (wBB * CIVx * xUSA)				,						
			"Base.RWS_M34",	wBB	 * CIVx	- (wBB * xBB)		- (wBB * CIVx * xUSA)			- (wBB * CIVx * x90)	,						
			"Base.CP33",	w22	 * CIVx	- (w22 * x22)	- (w22 * CIVx * xSEMI)	- (w22 * CIVx * xUSA)			- (w22 * CIVx * x90)	,						
			"Base.Ruger_MK4",	w22	 * CIVx	- (w22 * x22)	- (w22 * CIVx * xSEMI)	- (w22 * CIVx * xUSA)			- (w22 * CIVx * x90)	,						
			"Base.Buckmark",	w22	 * CIVx	- (w22 * x22)	- (w22 * CIVx * xSEMI)	- (w22 * CIVx * xUSA)				,						
			"Base.Buckmark_Long",	w22	 * CIVx	- (w22 * x22)	- (w22 * CIVx * xSEMI)	- (w22 * CIVx * xUSA)				,						
			"Base.Buckmark_Carbine",	w22	 * CIVx	- (w22 * x22)	- (w22 * CIVx * xSEMI)	- (w22 * CIVx * xUSA)				,						
			"Base.HK4_22",	w22	 * CIVx	- (w22 * x22)	- (w22 * CIVx * xSEMI)	- (w22 * CIVx * xEUR)				,						
			"Base.ZIP22",	w22	 * CIVx	- (w22 * x22)	- (w22 * CIVx * xSEMI)	- (w22 * CIVx * xUSA)			- (w22 * CIVx * x90)	,						
			"Base.Ruger_1022",	w22	 * CIVx	- (w22 * x22)	- (w22 * CIVx * xSEMI)	- (w22 * CIVx * xUSA)				,						
			"Base.Marlin_M70",	w22	 * CIVx	- (w22 * x22)	- (w22 * CIVx * xSEMI)	- (w22 * CIVx * xUSA)				,						
			"Base.Cricket_22",	w22	 * CIVx	- (w22 * x22)	- (w22 * CIVx * xBOLT)	- (w22 * CIVx * xUSA)				,						
			"Base.AR7",	w22	 * CIVx	- (w22 * x22)	- (w22 * CIVx * xSEMI)	- (w22 * CIVx * xUSA)				,						
			"Base.Calico_22LR",	w22	 * CIVx	- (w22 * x22)	- (w22 * CIVx * xSMG)	- (w22 * CIVx * xUSA)				,						
			"Base.American180",	w22	 * CIVx	- (w22 * x22)	- (w22 * CIVx * xSMG)	- (w22 * CIVx * xUSA)				,						
			"Base.Winchester1903",	w22	 * CIVx	- (w22 * x22)	- (w22 * CIVx * xLEVER)	- (w22 * CIVx * xUSA)				,						
			"Base.G42",	w380	 * CIVx	- (w380 * x380)	- (w380 * CIVx * xSEMI)	- (w380 * CIVx * xEUR)			- (w380 * CIVx * x90)	,						
			"Base.LCP380",	w380	 * CIVx	- (w380 * x380)	- (w380 * CIVx * xSEMI)	- (w380 * CIVx * xUSA)			- (w380 * CIVx * x90)	,						
			"Base.BodyGuard380",	w380	 * CIVx	- (w380 * x380)	- (w380 * CIVx * xSEMI)	- (w380 * CIVx * xUSA)			- (w380 * CIVx * x90)	,						
			"Base.Bersa85F",	w380	 * CIVx	- (w380 * x380)	- (w380 * CIVx * xSEMI)	- (w380 * CIVx * xREST)				,						
			"Base.Colt1903",	w380	 * CIVx	- (w380 * x380)	- (w380 * CIVx * xSEMI)	- (w380 * CIVx * xUSA)				,						
			"Base.Makarov380",	w380	 * CIVx	- (w380 * x380)	- (w380 * CIVx * xSEMI)	- (w380 * CIVx * xSOV)				,						
			"Base.PPK",	w380	 * CIVx	- (w380 * x380)	- (w380 * CIVx * xSEMI)	- (w380 * CIVx * xEUR)				,						
			"Base.HK4_380",	w380	 * CIVx	- (w380 * x380)	- (w380 * CIVx * xSEMI)	- (w380 * CIVx * xEUR)				,						
			"Base.VP70",	w380	 * CIVx	- (w380 * x380)	- (w380 * CIVx * xSMG)	- (w380 * CIVx * xEUR)		- (w380 * CIVx * CIVxMIL)		,						
			"Base.VP70_Stock",	w380	 * CIVx	- (w380 * x380)	- (w380 * CIVx * xSMG)	- (w380 * CIVx * xEUR)		- (w380 * CIVx * CIVxMIL)		,						
			"Base.Vz61_Fixed",	w380	 * CIVx	- (w380 * x380)	- (w380 * CIVx * xSMG)	- (w380 * CIVx * xCZE)		- (w380 * CIVx * CIVxMIL)		,						
			"Base.Vz61_Fold",	w380	 * CIVx	- (w380 * x380)	- (w380 * CIVx * xSMG)	- (w380 * CIVx * xCZE)		- (w380 * CIVx * CIVxMIL)		,						
			"Base.BT380_Stock",	w380	 * CIVx	- (w380 * x380)	- (w380 * CIVx * xSEMI)	- (w380 * CIVx * xEUR)			- (w380 * CIVx * x90)	,						
			"Base.FN_57", 	w57	 * CIVx	- (w57 * x57)	- (w57 * CIVx * xSEMI)	- (w57 * CIVx * xEUR)			- (w57 * CIVx * x90)	,						
			"Base.FN_57_MK2", 	w57	 * CIVx	- (w57 * x57)	- (w57 * CIVx * xSEMI)	- (w57 * CIVx * xEUR)			- (w57 * CIVx * x90)	,						
			"Base.FN_P90",	w57	 * CIVx	- (w57 * x57)	- (w57 * CIVx * xSMG)	- (w57 * CIVx * xEUR)	- (w57 * CIVx * CIVxLEO)		- (w57 * CIVx * x90)	,						
			"Base.FN_PS90",	w57	 * CIVx	- (w57 * x57)	- (w57 * CIVx * xSMG)	- (w57 * CIVx * xEUR)			- (w57 * CIVx * x90)	,						
			"Base.CZ75",	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSEMI)	- (w9 * CIVx * xCZE)				,						
			"Base.G17",	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSEMI)	- (w9 * CIVx * xEUR)				,						
			"Base.G18",	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSMG)	- (w9 * CIVx * xEUR)		- (w9 * CIVx * CIVxMIL)		,						
			"Base.G34", 	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSEMI)	- (w9 * CIVx * xUSA)			- (w9 * CIVx * x90)	,						
			"Base.K5",	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSEMI)	- (w9 * CIVx * xKOR)				,						
			"Base.M9",	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSEMI)	- (w9 * CIVx * xEUR)				,						
			"Base.M9A3",	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSEMI)	- (w9 * CIVx * xEUR)			- (w9 * CIVx * x90)	,						
			"Base.B93R",	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSMG)	- (w9 * CIVx * xEUR)		- (w9 * CIVx * CIVxMIL)		,						
			"Base.M5906",	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSEMI)	- (w9 * CIVx * xUSA)				,						
			"Base.XD9",	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSEMI)	- (w9 * CIVx * xUSA)			- (w9 * CIVx * x90)	,						
			"Base.MP9",	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSEMI)	- (w9 * CIVx * xUSA)			- (w9 * CIVx * x90)	,						
			"Base.P226",	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSEMI)	- (w9 * CIVx * xEUR)				,						
			"Base.APS",	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSMG)	- (w9 * CIVx * xSOV)				,						
			"Base.Makarov",	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSEMI)	- (w9 * CIVx * xSOV)				,						
			"Base.PB",	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSEMI)	- (w9 * CIVx * xSOV)		- (w9 * CIVx * CIVxMIL)		,						
			"Base.Luger",	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSEMI)	- (w9 * CIVx * xEUR)		- (w9 * CIVx * CIVxMIL)		,						
			"Base.Luger_WW1",	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSEMI)	- (w9 * CIVx * xEUR)		- (w9 * CIVx * CIVxMIL)		,						
			"Base.Luger_Carbine",	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSEMI)	- (w9 * CIVx * xEUR)		- (w9 * CIVx * CIVxMIL)		,						
			"Base.UZI", 	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSMG)	- (w9 * CIVx * xREST)				,						
			"Base.UZI_Wood",	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSMG)	- (w9 * CIVx * xREST)				,						
			"Base.UZI_Micro",	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSMG)	- (w9 * CIVx * xREST)				,						
			"Base.BT9_Fold",	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSMG)	- (w9 * CIVx * xEUR)			- (w9 * CIVx * x90)	,						
			"Base.UMP9_Stock",	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSMG)	- (w9 * CIVx * xEUR)	- (w9 * CIVx * CIVxLEO)		- (w9 * CIVx * x90)	,						
			"Base.SUB2000",	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSEMI)	- (w9 * CIVx * xUSA)			- (w9 * CIVx * x90)	,						
			"Base.MP5_Fixed",	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSMG)	- (w9 * CIVx * xEUR)	- (w9 * CIVx * CIVxLEO)			,						
			"Base.MP5_Stock",	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSMG)	- (w9 * CIVx * xEUR)	- (w9 * CIVx * CIVxLEO)			,						
			"Base.MP5SD6_Fixed",	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSMG)	- (w9 * CIVx * xEUR)		- (w9 * CIVx * CIVxMIL)		,						
			"Base.MP5SD6_Stock",	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSMG)	- (w9 * CIVx * xEUR)		- (w9 * CIVx * CIVxMIL)		,						
			"Base.EVO_Fold",	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSMG)	- (w9 * CIVx * xCZE)			- (w9 * CIVx * x90)	,						
			"Base.K7_Stock",	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSMG)	- (w9 * CIVx * xKOR)		- (w9 * CIVx * CIVxMIL)		,						
			"Base.AUG9",	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSMG)	- (w9 * CIVx * xEUR)		- (w9 * CIVx * CIVxMIL)		,						
			"Base.KG9",	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSMG)	- (w9 * CIVx * xUSA)				,						
			"Base.Calico_M900_Fold",	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSMG)	- (w9 * CIVx * xUSA)				,						
			"Base.Calico_M950_Pistol",	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSMG)	- (w9 * CIVx * xUSA)				,						
			"Base.VSS",	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSMG)	- (w9 * CIVx * xSOV)		- (w9 * CIVx * CIVxMIL)		,						
			"Base.ASVAL",	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSMG)	- (w9 * CIVx * xSOV)		- (w9 * CIVx * CIVxMIL)		,						
			"Base.M1Carbine",	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSEMI)	- (w9 * CIVx * xUSA)				,						
			"Base.M2Carbine",	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSMG)	- (w9 * CIVx * xUSA)		- (w9 * CIVx * CIVxMIL)		,						
			"Base.M635",	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSMG)	- (w9 * CIVx * xUSA)	- (w9 * CIVx * CIVxLEO)			,						
			"Base.M635S",	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSMG)	- (w9 * CIVx * xUSA)	- (w9 * CIVx * CIVxLEO)			,						
			"Base.M635SD",	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSMG)	- (w9 * CIVx * xUSA)		- (w9 * CIVx * CIVxMIL)		,						
			"Base.MP7",	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSMG)	- (w9 * CIVx * xEUR)	- (w9 * CIVx * CIVxLEO)		- (w9 * CIVx * x90)	,						
			"Base.Jatimatic",	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSMG)	- (w9 * CIVx * xEUR)		- (w9 * CIVx * CIVxMIL)		,						
			"Base.Sten",	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSMG)	- (w9 * CIVx * xEUR)		- (w9 * CIVx * CIVxMIL)		,						
			"Base.Sten_MK2",	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSMG)	- (w9 * CIVx * xEUR)		- (w9 * CIVx * CIVxMIL)		,						
			"Base.Sten_MK2SD",	w9	 * CIVx	- (w9 * x9)	- (w9 * CIVx * xSMG)	- (w9 * CIVx * xEUR)		- (w9 * CIVx * CIVxMIL)		,						
			"Base.M5238",	w357	 * CIVx	- (w357 * x357)	- (w357 * CIVx * xSEMI)	- (w357 * CIVx * xUSA)				,						
			"Base.Taurus856",	w357	 * CIVx	- (w357 * x357)	- (w357 * CIVx * xREV)	- (w357 * CIVx * xREST)			- (w357 * CIVx * x90)	,						
			"Base.Colt_Service38",	w357	 * CIVx	- (w357 * x357)	- (w357 * CIVx * xREV)	- (w357 * CIVx * xUSA)				,						
			"Base.GP100_2",	w357	 * CIVx	- (w357 * x357)	- (w357 * CIVx * xREV)	- (w357 * CIVx * xUSA)				,						
			"Base.GP100_4",	w357	 * CIVx	- (w357 * x357)	- (w357 * CIVx * xREV)	- (w357 * CIVx * xUSA)				,						
			"Base.GP100_6",	w357	 * CIVx	- (w357 * x357)	- (w357 * CIVx * xREV)	- (w357 * CIVx * xUSA)				,						
			"Base.K6S",	w357	 * CIVx	- (w357 * x357)	- (w357 * CIVx * xREV)	- (w357 * CIVx * xUSA)			- (w357 * CIVx * x90)	,						
			"Base.M1936",	w357	 * CIVx	- (w357 * x357)	- (w357 * CIVx * xREV)	- (w357 * CIVx * xUSA)				,						
			"Base.NEF_Handi_38",	w357	 * CIVx	- (w357 * x357)	- (w357 * CIVx * xBREAK)	- (w357 * CIVx * xUSA)				,						
			"Base.Marlin_1894",	w357	 * CIVx	- (w357 * x357)	- (w357 * CIVx * xLEVER)	- (w357 * CIVx * xUSA)				,						
			"Base.CZ97B",	w45	 * CIVx	- (w45 * x45)	- (w45 * CIVx * xSEMI)	- (w45 * CIVx * xCZE)			- (w45 * CIVx * x90)	,						
			"Base.G21",	w45	 * CIVx	- (w45 * x45)	- (w45 * CIVx * xSEMI)	- (w45 * CIVx * xEUR)				,						
			"Base.XD4",	w45	 * CIVx	- (w45 * x45)	- (w45 * CIVx * xSEMI)	- (w45 * CIVx * xUSA)			- (w45 * CIVx * x90)	,						
			"Base.MP45",	w45	 * CIVx	- (w45 * x45)	- (w45 * CIVx * xSEMI)	- (w45 * CIVx * xUSA)			- (w45 * CIVx * x90)	,						
			"Base.P220",	w45	 * CIVx	- (w45 * x45)	- (w45 * CIVx * xSEMI)	- (w45 * CIVx * xEUR)				,						
			"Base.XD4",	w45	 * CIVx	- (w45 * x45)	- (w45 * CIVx * xSEMI)	- (w45 * CIVx * xUSA)			- (w45 * CIVx * x90)	,						
			"Base.M4506",	w45	 * CIVx	- (w45 * x45)	- (w45 * CIVx * xSEMI)	- (w45 * CIVx * xUSA)				,						
			"Base.PARA1911",	w45	 * CIVx	- (w45 * x45)	- (w45 * CIVx * xSEMI)	- (w45 * CIVx * xUSA)				,						
			"Base.AMT1911",	w45	 * CIVx	- (w45 * x45)	- (w45 * CIVx * xSEMI)	- (w45 * CIVx * xUSA)				,						
			"Base.AMT1911_Long",	w45	 * CIVx	- (w45 * x45)	- (w45 * CIVx * xSEMI)	- (w45 * CIVx * xUSA)				,						
			"Base.M1911_Carbine",	w45	 * CIVx	- (w45 * x45)	- (w45 * CIVx * xSEMI)	- (w45 * CIVx * xUSA)				,						
			"Base.Colt1911",	w45	 * CIVx	- (w45 * x45)	- (w45 * CIVx * xSEMI)	- (w45 * CIVx * xUSA)				,						
			"Base.Colt_Kimber",	w45	 * CIVx	- (w45 * x45)	- (w45 * CIVx * xSEMI)	- (w45 * CIVx * xUSA)			- (w45 * CIVx * x90)	,						
			"Base.Colt_Commander",	w45	 * CIVx	- (w45 * x45)	- (w45 * CIVx * xSEMI)	- (w45 * CIVx * xUSA)				,						
			"Base.UMP45_Stock",	w45	 * CIVx	- (w45 * x45)	- (w45 * CIVx * xSMG)	- (w45 * CIVx * xEUR)	- (w45 * CIVx * CIVxLEO)		- (w45 * CIVx * x90)	,						
			"Base.MAC10_Fold",	w45	 * CIVx	- (w45 * x45)	- (w45 * CIVx * xSMG)	- (w45 * CIVx * xUSA)				,						
			"Base.KRISS_Stock",	w45	 * CIVx	- (w45 * x45)	- (w45 * CIVx * xSMG)	- (w45 * CIVx * xUSA)			- (w45 * CIVx * x90)	,						
			"Base.Commando",	w45	 * CIVx	- (w45 * x45)	- (w45 * CIVx * xBOLT)	- (w45 * CIVx * xEUR)		- (w45 * CIVx * CIVxMIL)		,						
			"Base.Thompson",	w45	 * CIVx	- (w45 * x45)	- (w45 * CIVx * xSMG)	- (w45 * CIVx * xUSA)				,						
			"Base.Thompson_1928",	w45	 * CIVx	- (w45 * x45)	- (w45 * CIVx * xSMG)	- (w45 * CIVx * xUSA)				,						
			"Base.M2Hyde",	w45	 * CIVx	- (w45 * x45)	- (w45 * CIVx * xSMG)	- (w45 * CIVx * xUSA)		- (w45 * CIVx * CIVxMIL)		,						
			"Base.Model55_Fold",	w45	 * CIVx	- (w45 * x45)	- (w45 * CIVx * xSMG)	- (w45 * CIVx * xUSA)		- (w45 * CIVx * CIVxMIL)		,						
			"Base.Model50",	w45	 * CIVx	- (w45 * x45)	- (w45 * CIVx * xSMG)	- (w45 * CIVx * xUSA)		- (w45 * CIVx * CIVxMIL)		,						
			"Base.Colt_Navy_1851",	w44	 * CIVx	- (w44 * x44)	- (w44 * CIVx * xREV)	- (w44 * CIVx * xUSA)				,						
			"Base.M29_44",	w44	 * CIVx	- (w44 * x44)	- (w44 * CIVx * xREV)	- (w44 * CIVx * xUSA)				,						
			"Base.M29_44Carbine",	w44	 * CIVx	- (w44 * x44)	- (w44 * CIVx * xREV)	- (w44 * CIVx * xUSA)				,						
			"Base.Automag",	w44	 * CIVx	- (w44 * x44)	- (w44 * CIVx * xSEMI)	- (w44 * CIVx * xUSA)				,						
			"Base.DEagle",	w44	 * CIVx	- (w44 * x44)	- (w44 * CIVx * xSEMI)	- (w44 * CIVx * xISR)				,						
			"Base.DEagle_Long",	w44	 * CIVx	- (w44 * x44)	- (w44 * CIVx * xSEMI)	- (w44 * CIVx * xISR)				,						
			"Base.Winchester1866",	w45LC	 * CIVx	- (w44 * x44)	- (w45LC * CIVx * xLEVER)	- (w45LC * CIVx * xUSA)				,						
			"Base.Win_1894",	w44	 * CIVx	- (w44 * x44)	- (w44 * CIVx * xLEVER)	- (w44 * CIVx * xUSA)				,						
			"Base.Colt_Service45",	w45LC	 * CIVx	- (w45LC * x45LC)	- (w45LC * CIVx * xREV)	- (w45LC * CIVx * xUSA)				,						
			"Base.Judge_45LC",	w45LC	 * CIVx	- (w45LC * x45LC)	- (w45LC * CIVx * xREV)	- (w45LC * CIVx * xREST)			- (w45LC * CIVx * x90)	,						
			"Base.Judge513_45LC",	w45LC	 * CIVx	- (w45LC * x45LC)	- (w45LC * CIVx * xREV)	- (w45LC * CIVx * xREST)			- (w45LC * CIVx * x90)	,						
			"Base.Judge513_Long_45LC",	w45LC	 * CIVx	- (w45LC * x45LC)	- (w45LC * CIVx * xREV)	- (w45LC * CIVx * xREST)			- (w45LC * CIVx * x90)	,						
			"Base.TXS_804_45LC",	w45LC	 * CIVx	- (w45LC * x45LC)	- (w45LC * CIVx * xREV)	- (w45LC * CIVx * xREST)				,						
			"Base.Winchester1873",	w45LC	 * CIVx	- (w45LC * x45LC)	- (w45LC * CIVx * xLEVER)	- (w45LC * CIVx * xUSA)				,						
			"Base.Sako85",	w223	 * CIVx	- (w223 * x223)	- (w223 * CIVx * xBOLT)	- (w223 * CIVx * xEUR)				,						
			"Base.MINI14",	w223	 * CIVx	- (w223 * x223)	- (w223 * CIVx * xSEMI)	- (w223 * CIVx * xUSA)				,						
			"Base.MINI14_T",	w223	 * CIVx	- (w223 * x223)	- (w223 * CIVx * xSEMI)	- (w223 * CIVx * xUSA)	- (w223 * CIVx * CIVxLEO)			,						
			"Base.Viper",	w223	 * CIVx	- (w223 * x223)	- (w223 * CIVx * xLEVER)	- (w223 * CIVx * xREST)			- (w223 * CIVx * x90)	,						
			"Base.CAR15SMG",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xAUTO)	- (w556 * CIVx * xUSA)	- (w556 * CIVx * CIVxLEO)			,						
			"Base.CAR15_Survival",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xAUTO)	- (w556 * CIVx * xUSA)	- (w556 * CIVx * CIVxLEO)			,						
			"Base.XM8Compact_Pistol",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xAUTO)	- (w556 * CIVx * xEUR)		- (w556 * CIVx * CIVxMIL)	- (w556 * CIVx * x90)	,						
			"Base.XM8",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xAUTO)	- (w556 * CIVx * xEUR)		- (w556 * CIVx * CIVxMIL)	- (w556 * CIVx * x90)	,						
			"Base.SCARSC_Stock",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xAUTO)	- (w556 * CIVx * xEUR)		- (w556 * CIVx * CIVxMIL)	- (w556 * CIVx * x90)	,						
			"Base.SCARL",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xAUTO)	- (w556 * CIVx * xEUR)		- (w556 * CIVx * CIVxMIL)	- (w556 * CIVx * x90)	,						
			"Base.G33",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xAUTO)	- (w556 * CIVx * xEUR)		- (w556 * CIVx * CIVxMIL)		,						
			"Base.MK18",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xAUTO)	- (w556 * CIVx * xEUR)		- (w556 * CIVx * CIVxMIL)	- (w556 * CIVx * x90)	,						
			"Base.M16A1",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xAUTO)	- (w556 * CIVx * xUSA)		- (w556 * CIVx * CIVxMIL)		,						
			"Base.M16A2",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xAUTO)	- (w556 * CIVx * xUSA)				,						
			"Base.M16A3",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xAUTO)	- (w556 * CIVx * xUSA)		- (w556 * CIVx * CIVxMIL)		,						
			"Base.M723",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xAUTO)	- (w556 * CIVx * xUSA)		- (w556 * CIVx * CIVxMIL)		,						
			"Base.XM117",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xAUTO)	- (w556 * CIVx * xUSA)		- (w556 * CIVx * CIVxMIL)	- (w556 * CIVx * x90)	,						
			"Base.H416",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xAUTO)	- (w556 * CIVx * xEUR)		- (w556 * CIVx * CIVxMIL)	- (w556 * CIVx * x90)	,						
			"Base.M4",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xAUTO)	- (w556 * CIVx * xUSA)		- (w556 * CIVx * CIVxMIL)		,						
			"Base.M4A1",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xAUTO)	- (w556 * CIVx * xUSA)		- (w556 * CIVx * CIVxMIL)		,						
			"Base.ADAR",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xAUTO)	- (w556 * CIVx * xSOV)			- (w556 * CIVx * x90)	,						
			"Base.K2C1_PH",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xAUTO)	- (w556 * CIVx * xKOR)	- (w556 * CIVx * CIVxLEO)		- (w556 * CIVx * x90)	,						
			"Base.K1DEV",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xAUTO)	- (w556 * CIVx * xKOR)		- (w556 * CIVx * CIVxMIL)		,						
			"Base.K2_C1",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xAUTO)	- (w556 * CIVx * xKOR)		- (w556 * CIVx * CIVxMIL)	- (w556 * CIVx * x90)	,						
			"Base.K2_1",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xAUTO)	- (w556 * CIVx * xKOR)		- (w556 * CIVx * CIVxMIL)		,						
			"Base.K2_203",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xAUTO)	- (w556 * CIVx * xKOR)		- (w556 * CIVx * CIVxMIL)		,						
			"Base.K1_1",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xAUTO)	- (w556 * CIVx * xKOR)		- (w556 * CIVx * CIVxMIL)		,						
			"Base.DR_200",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xAUTO)	- (w556 * CIVx * xKOR)	- (w556 * CIVx * CIVxLEO)		- (w556 * CIVx * x90)	,						
			"Base.LVOA_C",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xSEMI)	- (w556 * CIVx * xUSA)			- (w556 * CIVx * x90)	,						
			"Base.MCX_Spear",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xSEMI)	- (w556 * CIVx * xEUR)			- (w556 * CIVx * x90)	,						
			"Base.ColtM16",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xAUTO)	- (w556 * CIVx * xUSA)		- (w556 * CIVx * CIVxMIL)		,						
			"Base.M16Wood",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xAUTO)	- (w556 * CIVx * xUSA)				,						
			"Base.M16Tape",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xAUTO)	- (w556 * CIVx * xUSA)		- (w556 * CIVx * CIVxMIL)		,						
			"Base.FAMAS",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xAUTO)	- (w556 * CIVx * xEUR)		- (w556 * CIVx * CIVxMIL)		,						
			"Base.FAMAS_G2",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xAUTO)	- (w556 * CIVx * xEUR)		- (w556 * CIVx * CIVxMIL)		,						
			"Base.FAMAS_Felin",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xAUTO)	- (w556 * CIVx * xEUR)		- (w556 * CIVx * CIVxMIL)		,						
			"Base.AUG",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xAUTO)	- (w556 * CIVx * xEUR)				,						
			"Base.M85_Stock",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xAUTO)	- (w556 * CIVx * xSOV)				,						
			"Base.AK74",	w545x39	 * CIVx	- (w545x39 * x545x39)	- (w545x39 * CIVx * xAUTO)	- (w545x39 * CIVx * xSOV)		- (w545x39 * CIVx * CIVxMIL)		,						
			"Base.AKS74",	w545x39	 * CIVx	- (w545x39 * x545x39)	- (w545x39 * CIVx * xAUTO)	- (w545x39 * CIVx * xSOV)		- (w545x39 * CIVx * CIVxMIL)		,						
			"Base.AKS74U",	w545x39	 * CIVx	- (w545x39 * x545x39)	- (w545x39 * CIVx * xAUTO)	- (w545x39 * CIVx * xSOV)		- (w545x39 * CIVx * CIVxMIL)		,						
			"Base.AK74_Alpha",	w545x39	 * CIVx	- (w545x39 * x545x39)	- (w545x39 * CIVx * xAUTO)	- (w545x39 * CIVx * xSOV)		- (w545x39 * CIVx * CIVxMIL)	- (w545x39 * CIVx * x90)	,						
			"Base.AK12",	w545x39	 * CIVx	- (w545x39 * x545x39)	- (w545x39 * CIVx * xAUTO)	- (w545x39 * CIVx * xSOV)		- (w545x39 * CIVx * CIVxMIL)	- (w545x39 * CIVx * x90)	,						
			"Base.AK12_New",	w545x39	 * CIVx	- (w545x39 * x545x39)	- (w545x39 * CIVx * xAUTO)	- (w545x39 * CIVx * xSOV)		- (w545x39 * CIVx * CIVxMIL)	- (w545x39 * CIVx * x90)	,						
			"Base.RPK74",	w545x39	 * CIVx	- (w545x39 * x545x39)	- (w545x39 * CIVx * xLMG)	- (w545x39 * CIVx * xSOV)		- (w545x39 * CIVx * CIVxMIL)		,						
			"Base.RPK16",	w545x39	 * CIVx	- (w545x39 * x545x39)	- (w545x39 * CIVx * xLMG)	- (w545x39 * CIVx * xSOV)		- (w545x39 * CIVx * CIVxMIL)	- (w545x39 * CIVx * x90)	,						
			"Base.L85",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xAUTO)	- (w556 * CIVx * xEUR)		- (w556 * CIVx * CIVxMIL)		,						
			"Base.L85A2",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xAUTO)	- (w556 * CIVx * xEUR)		- (w556 * CIVx * CIVxMIL)	- (w556 * CIVx * x90)	,						
			"Base.L86",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xAUTO)	- (w556 * CIVx * xEUR)		- (w556 * CIVx * CIVxMIL)		,						
			"Base.L22",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xAUTO)	- (w556 * CIVx * xEUR)		- (w556 * CIVx * CIVxMIL)	- (w556 * CIVx * x90)	,						
			"Base.F2000",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xAUTO)	- (w556 * CIVx * xEUR)		- (w556 * CIVx * CIVxMIL)	- (w556 * CIVx * x90)	,						
			"Base.Tavor",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xAUTO)	- (w556 * CIVx * xISR)			- (w556 * CIVx * x90)	,						
			"Base.AR18",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xAUTO)	- (w556 * CIVx * xUSA)				,						
			"Base.Type20",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xAUTO)	- (w556 * CIVx * xPAC)		- (w556 * CIVx * CIVxMIL)	- (w556 * CIVx * x90)	,						
			"Base.Type89",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xAUTO)	- (w556 * CIVx * xPAC)		- (w556 * CIVx * CIVxMIL)		,						
			"Base.QBZ_95",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xAUTO)	- (w556 * CIVx * xPAC)		- (w556 * CIVx * CIVxMIL)	- (w556 * CIVx * x90)	,						
			"Base.XM8LMG",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xLMG)	- (w556 * CIVx * xEUR)		- (w556 * CIVx * CIVxMIL)	- (w556 * CIVx * x90)	,						
			"Base.M249",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xLMG)	- (w556 * CIVx * xUSA)		- (w556 * CIVx * CIVxMIL)		,						
			"Base.M249E3",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xLMG)	- (w556 * CIVx * xUSA)		- (w556 * CIVx * CIVxMIL)	- (w556 * CIVx * x90)	,						
			"Base.K3LMG",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xLMG)	- (w556 * CIVx * xKOR)		- (w556 * CIVx * CIVxMIL)		,						
			"Base.AK47",	w762x39	 * CIVx	- (w762x39 * x762x39)	- (w762x39 * CIVx * xAUTO)	- (w762x39 * CIVx * xSOV)				,						
			"Base.AKM",	w762x39	 * CIVx	- (w762x39 * x762x39)	- (w762x39 * CIVx * xAUTO)	- (w762x39 * CIVx * xSOV)				,						
			"Base.AK103",	w762x39	 * CIVx	- (w762x39 * x762x39)	- (w762x39 * CIVx * xAUTO)	- (w762x39 * CIVx * xSOV)		- (w762x39 * CIVx * CIVxMIL)	- (w762x39 * CIVx * x90)	,						
			"Base.MD65_Stock",	w762x39	 * CIVx	- (w762x39 * x762x39)	- (w762x39 * CIVx * xAUTO)	- (w762x39 * CIVx * xSOV)				,						
			"Base.AKMS_Stock",	w762x39	 * CIVx	- (w762x39 * x762x39)	- (w762x39 * CIVx * xAUTO)	- (w762x39 * CIVx * xSOV)				,						
			"Base.Vz58",	w762x39	 * CIVx	- (w762x39 * x762x39)	- (w762x39 * CIVx * xAUTO)	- (w762x39 * CIVx * xCZE)				,						
			"Base.Vz58_Stock",	w762x39	 * CIVx	- (w762x39 * x762x39)	- (w762x39 * CIVx * xAUTO)	- (w762x39 * CIVx * xCZE)				,						
			"Base.Vz58_Mini_Stock",	w762x39	 * CIVx	- (w762x39 * x762x39)	- (w762x39 * CIVx * xAUTO)	- (w762x39 * CIVx * xCZE)				,						
			"Base.SKS",	w762x39	 * CIVx	- (w762x39 * x762x39)	- (w762x39 * CIVx * xSEMI)	- (w762x39 * CIVx * xSOV)				,						
			"Base.SKS_PARA",	w762x39	 * CIVx	- (w762x39 * x762x39)	- (w762x39 * CIVx * xSEMI)	- (w762x39 * CIVx * xPAC)				,						
			"Base.MK47",	w762x39	 * CIVx	- (w762x39 * x762x39)	- (w762x39 * CIVx * xSEMI)	- (w762x39 * CIVx * xUSA)			- (w762x39 * CIVx * x90)	,						
			"Base.AK308",	w308	 * CIVx	- (w308 * x308)	- (w308 * CIVx * xAUTO)	- (w308 * CIVx * xSOV)			- (w308 * CIVx * x90)	,						
			"Base.SCARH",	w308	 * CIVx	- (w308 * x308)	- (w308 * CIVx * xAUTO)	- (w308 * CIVx * xEUR)		- (w308 * CIVx * CIVxMIL)	- (w308 * CIVx * x90)	,						
			"Base.SCAR20",	w308	 * CIVx	- (w308 * x308)	- (w308 * CIVx * xAUTO)	- (w308 * CIVx * xEUR)		- (w308 * CIVx * CIVxMIL)	- (w308 * CIVx * x90)	,						
			"Base.G28",	w308	 * CIVx	- (w308 * x308)	- (w308 * CIVx * xAUTO)	- (w308 * CIVx * xEUR)		- (w308 * CIVx * CIVxMIL)	- (w308 * CIVx * x90)	,						
			"Base.G3",	w308	 * CIVx	- (w308 * x308)	- (w308 * CIVx * xAUTO)	- (w308 * CIVx * xEUR)		- (w308 * CIVx * CIVxMIL)		,						
			"Base.Type64",	w308	 * CIVx	- (w308 * x308)	- (w308 * CIVx * xAUTO)	- (w308 * CIVx * xPAC)		- (w308 * CIVx * CIVxMIL)		,						
			"Base.FAL",	w308	 * CIVx	- (w308 * x308)	- (w308 * CIVx * xAUTO)	- (w308 * CIVx * xEUR)		- (w308 * CIVx * CIVxMIL)		,						
			"Base.FAL_PARA_Stock",	w308	 * CIVx	- (w308 * x308)	- (w308 * CIVx * xAUTO)	- (w308 * CIVx * xEUR)		- (w308 * CIVx * CIVxMIL)		,						
			"Base.FN_FNC",	w308	 * CIVx	- (w308 * x308)	- (w308 * CIVx * xAUTO)	- (w308 * CIVx * xEUR)		- (w308 * CIVx * CIVxMIL)		,						
			"Base.WA2000",	w308	 * CIVx	- (w308 * x308)	- (w308 * CIVx * xBOLT)	- (w308 * CIVx * xEUR)				,						
			"Base.SVD",	w762x54r	 * CIVx	- (w762x54r * x762x54r)	- (w762x54r * CIVx * xSEMI)	- (w762x54r * CIVx * xSOV)		- (w762x54r * CIVx * CIVxMIL)		,						
			"Base.SVDK",	w762x54r	 * CIVx	- (w762x54r * x762x54r)	- (w762x54r * CIVx * xSEMI)	- (w762x54r * CIVx * xSOV)		- (w762x54r * CIVx * CIVxMIL)		,						
			"Base.M14EBR",	w308	 * CIVx	- (w308 * x308)	- (w308 * CIVx * xAUTO)	- (w308 * CIVx * xUSA)	- (w308 * CIVx * CIVxLEO)		- (w308 * CIVx * x90)	,						
			"Base.M14",	w308	 * CIVx	- (w308 * x308)	- (w308 * CIVx * xAUTO)	- (w308 * CIVx * xUSA)				,						
			"Base.K14",	w308	 * CIVx	- (w308 * x308)	- (w308 * CIVx * xBOLT)	- (w308 * CIVx * xKOR)		- (w308 * CIVx * CIVxMIL)	- (w308 * CIVx * x90)	,						
			"Base.Savage12",	w308	 * CIVx	- (w308 * x308)	- (w308 * CIVx * xBOLT)	- (w308 * CIVx * xUSA)				,						
			"Base.Ruger_No1_3006",	w3006	 * CIVx	- (w3006 * x3006)	- (w3006 * CIVx * xBREAK)	- (w3006 * CIVx * xUSA)				,						
			"Base.M40",	w308	 * CIVx	- (w308 * x308)	- (w308 * CIVx * xBOLT)	- (w308 * CIVx * xUSA)				,						
			"Base.M40A1",	w308	 * CIVx	- (w308 * x308)	- (w308 * CIVx * xBOLT)	- (w308 * CIVx * xUSA)				,						
			"Base.M40A2",	w308	 * CIVx	- (w308 * x308)	- (w308 * CIVx * xBOLT)	- (w308 * CIVx * xUSA)		- (w308 * CIVx * CIVxMIL)		,						
			"Base.M40A3",	w308	 * CIVx	- (w308 * x308)	- (w308 * CIVx * xBOLT)	- (w308 * CIVx * xUSA)	- (w308 * CIVx * CIVxLEO)			,						
			"Base.Mosin",	w762x54r	 * CIVx	- (w762x54r * x762x54r)	- (w762x54r * CIVx * xBOLT)	- (w762x54r * CIVx * xSOV)				,						
			"Base.MosinObrez_Pistol",	w762x54r	 * CIVx	- (w762x54r * x762x54r)	- (w762x54r * CIVx * xBOLT)	- (w762x54r * CIVx * xSOV)				,						
			"Base.M1",	w3006	 * CIVx	- (w3006 * x3006)	- (w3006 * CIVx * xSEMI)	- (w3006 * CIVx * xUSA)				,						
			"Base.M1903",	w3006	 * CIVx	- (w3006 * x3006)	- (w3006 * CIVx * xBOLT)	- (w3006 * CIVx * xUSA)				,						
			"Base.BAR",	w3006	 * CIVx	- (w3006 * x3006)	- (w3006 * CIVx * xAUTO)	- (w3006 * CIVx * xUSA)		- (w3006 * CIVx * CIVxMIL)		,						
			"Base.BAR_Monitor",	w3006	 * CIVx	- (w3006 * x3006)	- (w3006 * CIVx * xAUTO)	- (w3006 * CIVx * xUSA)		- (w3006 * CIVx * CIVxMIL)		,						
			"Base.MAS36",	w308	 * CIVx	- (w308 * x308)	- (w308 * CIVx * xAUTO)	- (w308 * CIVx * xEUR)		- (w308 * CIVx * CIVxMIL)		,						
			"Base.MAS44",	w308	 * CIVx	- (w308 * x308)	- (w308 * CIVx * xAUTO)	- (w308 * CIVx * xEUR)		- (w308 * CIVx * CIVxMIL)		,						
			"Base.MAS49",	w308	 * CIVx	- (w308 * x308)	- (w308 * CIVx * xAUTO)	- (w308 * CIVx * xEUR)		- (w308 * CIVx * CIVxMIL)		,						
			"Base.Win_1895",	w308	 * CIVx	- (w308 * x308)	- (w308 * CIVx * xLEVER)	- (w308 * CIVx * xUSA)				,						
			"Base.Galil",	w308	 * CIVx	- (w308 * x308)	- (w308 * CIVx * xAUTO)	- (w308 * CIVx * xISR)		- (w308 * CIVx * CIVxMIL)		,						
			"Base.Galil_Sniper",	w308	 * CIVx	- (w308 * x308)	- (w308 * CIVx * xAUTO)	- (w308 * CIVx * xISR)		- (w308 * CIVx * CIVxMIL)		,						
			"Base.Thompson_Center_3006",	w3006	 * CIVx	- (w3006 * x3006)	- (w3006 * CIVx * xBREAK)	- (w3006 * CIVx * xUSA)				,						
			"Base.Type38",	w308	 * CIVx	- (w308 * x308)	- (w308 * CIVx * xBOLT)	- (w308 * CIVx * xPAC)		- (w308 * CIVx * CIVxMIL)		,						
			"Base.Type99",	w308	 * CIVx	- (w308 * x308)	- (w308 * CIVx * xBOLT)	- (w308 * CIVx * xPAC)		- (w308 * CIVx * CIVxMIL)		,						
			"Base.L96",	w308	 * CIVx	- (w308 * x308)	- (w308 * CIVx * xBOLT)	- (w308 * CIVx * xEUR)				,						
			"Base.M240",	w308	 * CIVx	- (w308 * x308)	- (w308 * CIVx * xLMG)	- (w308 * CIVx * xUSA)		- (w308 * CIVx * CIVxMIL)		,						
			"Base.G21LMG",	w308	 * CIVx	- (w308 * x308)	- (w308 * CIVx * xLMG)	- (w308 * CIVx * xEUR)		- (w308 * CIVx * CIVxMIL)	- (w308 * CIVx * x90)	,						
			"Base.K12",	w308	 * CIVx	- (w308 * x308)	- (w308 * CIVx * xLMG)	- (w308 * CIVx * xKOR)		- (w308 * CIVx * CIVxMIL)	- (w308 * CIVx * x90)	,						
			"Base.PKM",	w762x54r	 * CIVx	- (w762x54r * x762x54r)	- (w762x54r * CIVx * xLMG)	- (w762x54r * CIVx * xSOV)		- (w762x54r * CIVx * CIVxMIL)		,						
			"Base.MG42",	w308	 * CIVx	- (w308 * x308)	- (w308 * CIVx * xLMG)	- (w308 * CIVx * xEUR)		- (w308 * CIVx * CIVxMIL)		,						
			"Base.M60",	w308	 * CIVx	- (w308 * x308)	- (w308 * CIVx * xLMG)	- (w308 * CIVx * xUSA)		- (w308 * CIVx * CIVxMIL)		,						
			"Base.MK43",	w308	 * CIVx	- (w308 * x308)	- (w308 * CIVx * xLMG)	- (w308 * CIVx * xUSA)		- (w308 * CIVx * CIVxMIL)	- (w308 * CIVx * x90)	,						
			"Base.RPD",	w762x39	 * CIVx	- (w762x39 * x762x39)	- (w762x39 * CIVx * xLMG)	- (w762x39 * CIVx * xSOV)		- (w762x39 * CIVx * CIVxMIL)		,						
			"Base.BOAR",	wBMG	 * CIVx	- (wBMG * xBMG)	- (wBMG * CIVx * xBREAK)	- (wBMG * CIVx * xUSA)				,						
			"Base.EDM96",	wBMG	 * CIVx	- (wBMG * xBMG)	- (wBMG * CIVx * xBOLT)	- (wBMG * CIVx * xUSA)	- (wBMG * CIVx * CIVxLEO)		- (wBMG * CIVx * x90)	,						
			"Base.M82",	wBMG	 * CIVx	- (wBMG * xBMG)	- (wBMG * CIVx * xSEMI)	- (wBMG * CIVx * xUSA)		- (wBMG * CIVx * CIVxMIL)		,						
			"Base.BFG50",	wBMG	 * CIVx	- (wBMG * xBMG)	- (wBMG * CIVx * xBREAK)	- (wBMG * CIVx * xUSA)			- (wBMG * CIVx * x90)	,						
			"Base.Harris50",	wBMG	 * CIVx	- (wBMG * xBMG)	- (wBMG * CIVx * xBOLT)	- (wBMG * CIVx * xUSA)				,						
			"Base.TAC50",	wBMG	 * CIVx	- (wBMG * xBMG)	- (wBMG * CIVx * xBOLT)	- (wBMG * CIVx * xUSA)		- (wBMG * CIVx * CIVxMIL)		,						
			"Base.Ash",	wBMG	 * CIVx	- (wBMG * xBMG)	- (wBMG * CIVx * xAUTO)	- (wBMG * CIVx * xSOV)		- (wBMG * CIVx * CIVxMIL)	- (wBMG * CIVx * x90)	,						
			"Base.SW_M500",	wBMG	 * CIVx	- (wBMG * xBMG)	- (wBMG * CIVx * xREV)	- (wBMG * CIVx * xUSA)			- (wBMG * CIVx * x90)	,						
			"Base.SPAS12_Fixed",	w12g	 * CIVx	- (w12g * x12g)	- (w12g * CIVx * xSEMI)	- (w12g * CIVx * xEUR)	- (w12g * CIVx * CIVxLEO)			,						
			"Base.SPAS12_Fold",	w12g	 * CIVx	- (w12g * x12g)	- (w12g * CIVx * xSEMI)	- (w12g * CIVx * xEUR)	- (w12g * CIVx * CIVxLEO)			,						
			"Base.Origin",	w12g	 * CIVx	- (w12g * x12g)	- (w12g * CIVx * xSEMI)	- (w12g * CIVx * xUSA)			- (w12g * CIVx * x90)	,						
			"Base.SPAS_15",	w12g	 * CIVx	- (w12g * x12g)	- (w12g * CIVx * xSEMI)	- (w12g * CIVx * xEUR)				,						
			"Base.USAS_12",	w12g	 * CIVx	- (w12g * x12g)	- (w12g * CIVx * xAUTO)	- (w12g * CIVx * xKOR)		- (w12g * CIVx * CIVxMIL)		,						
			"Base.Shorty_Pistol",	w12g	 * CIVx	- (w12g * x12g)	- (w12g * CIVx * xPUMP)	- (w12g * CIVx * xUSA)	- (w12g * CIVx * CIVxLEO)		- (w12g * CIVx * x90)	,						
			"Base.R11_87",	w12g	 * CIVx	- (w12g * x12g)	- (w12g * CIVx * xSEMI)	- (w12g * CIVx * xUSA)				,						
			"Base.M870",	w12g	 * CIVx	- (w12g * x12g)	- (w12g * CIVx * xPUMP)	- (w12g * CIVx * xUSA)				,						
			"Base.M1897",	w12g	 * CIVx	- (w12g * x12g)	- (w12g * CIVx * xPUMP)	- (w12g * CIVx * xUSA)				,						
			"Base.DT11",	w12g	 * CIVx	- (w12g * x12g)	- (w12g * CIVx * xBREAK)	- (w12g * CIVx * xEUR)				,						
			"Base.Coachgun",	w12g	 * CIVx	- (w12g * x12g)	- (w12g * CIVx * xBREAK)	- (w12g * CIVx * xUSA)				,						
			"Base.Terminator",	w12g	 * CIVx	- (w12g * x12g)	- (w12g * CIVx * xBREAK)	- (w12g * CIVx * xUSA)				,						
			"Base.SIX12",	w12g	 * CIVx	- (w12g * x12g)	- (w12g * CIVx * xREV)	- (w12g * CIVx * xUSA)	- (w12g * CIVx * CIVxLEO)		- (w12g * CIVx * x90)	,						
			"Base.SIX12SD",	w12g	 * CIVx	- (w12g * x12g)	- (w12g * CIVx * xREV)	- (w12g * CIVx * xUSA)		- (w12g * CIVx * CIVxMIL)	- (w12g * CIVx * x90)	,						
			"Base.M870_Wingmaster",	w12g	 * CIVx	- (w12g * x12g)	- (w12g * CIVx * xPUMP)	- (w12g * CIVx * xUSA)				,						
			"Base.M870_Police",	w12g	 * CIVx	- (w12g * x12g)	- (w12g * CIVx * xPUMP)	- (w12g * CIVx * xUSA)	- (w12g * CIVx * CIVxLEO)			,						
			"Base.M870_MCS",	w12g	 * CIVx	- (w12g * x12g)	- (w12g * CIVx * xPUMP)	- (w12g * CIVx * xUSA)	- (w12g * CIVx * CIVxLEO)			,						
			"Base.M870_CQB",	w12g	 * CIVx	- (w12g * x12g)	- (w12g * CIVx * xPUMP)	- (w12g * CIVx * xUSA)	- (w12g * CIVx * CIVxLEO)			,						
			"Base.M870_Breaching_Pistol",	w12g	 * CIVx	- (w12g * x12g)	- (w12g * CIVx * xPUMP)	- (w12g * CIVx * xUSA)	- (w12g * CIVx * CIVxLEO)			,						
			"Base.M870_Express",	w12g	 * CIVx	- (w12g * x12g)	- (w12g * CIVx * xPUMP)	- (w12g * CIVx * xUSA)				,						
			"Base.A400",	w12g	 * CIVx	- (w12g * x12g)	- (w12g * CIVx * xSEMI)	- (w12g * CIVx * xEUR)			- (w12g * CIVx * x90)	,						
			"Base.M1014",	w12g	 * CIVx	- (w12g * x12g)	- (w12g * CIVx * xSEMI)	- (w12g * CIVx * xEUR)			- (w12g * CIVx * x90)	,						
			"Base.M1014_Fold",	w12g	 * CIVx	- (w12g * x12g)	- (w12g * CIVx * xSEMI)	- (w12g * CIVx * xEUR)			- (w12g * CIVx * x90)	,						
			"Base.M1014_Wick",	w12g	 * CIVx	- (w12g * x12g)	- (w12g * CIVx * xSEMI)	- (w12g * CIVx * xEUR)			- (w12g * CIVx * x90)	,						
			"Base.DAO12",	w12g	 * CIVx	- (w12g * x12g)	- (w12g * CIVx * xREV)	- (w12g * CIVx * xREST)	- (w12g * CIVx * CIVxLEO)			,						
			"Base.M1887",	w12g	 * CIVx	- (w12g * x12g)	- (w12g * CIVx * xLEVER)	- (w12g * CIVx * xUSA)				,						
			"Base.M1208",	w12g	 * CIVx	- (w12g * x12g)	- (w12g * CIVx * xREV)	- (w12g * CIVx * xUSA)			- (w12g * CIVx * x90)	,						
			"Base.M1212",	w12g	 * CIVx	- (w12g * x12g)	- (w12g * CIVx * xREV)	- (w12g * CIVx * xUSA)	- (w12g * CIVx * CIVxLEO)		- (w12g * CIVx * x90)	,						
			"Base.M1216",	w12g	 * CIVx	- (w12g * x12g)	- (w12g * CIVx * xREV)	- (w12g * CIVx * xUSA)	- (w12g * CIVx * CIVxLEO)		- (w12g * CIVx * x90)	,						
			"Base.AA12",	w12g	 * CIVx	- (w12g * x12g)	- (w12g * CIVx * xAUTO)	- (w12g * CIVx * xUSA)		- (w12g * CIVx * CIVxMIL)	- (w12g * CIVx * x90)	,						
			"Base.CAWS",	w12g	 * CIVx	- (w12g * x12g)	- (w12g * CIVx * xAUTO)	- (w12g * CIVx * xEUR)		- (w12g * CIVx * CIVxMIL)		,						
			"Base.ROYAL_SXS",	w10g	 * CIVx	- (w10g * x10g)	- (w10g * CIVx * xBREAK)	- (w10g * CIVx * xEUR)				,						
			"Base.KS23",	w4g	 * CIVx	- (w4g * x4g)	- (w4g * CIVx * xPUMP)	- (w4g * CIVx * xSOV)				,						
			"Base.KS23_S_Pistol",	w4g	 * CIVx	- (w4g * x4g)	- (w4g * CIVx * xPUMP)	- (w4g * CIVx * xSOV)				,						
			"Base.Triple_Crown",	w12g	 * CIVx	- (w12g * x12g)	- (w12g * CIVx * xBREAK)	- (w12g * CIVx * xEUR)				,						
			"Base.Moss500_20",	w20g	 * CIVx	- (w20g * x20g)	- (w20g * CIVx * xPUMP)	- (w20g * CIVx * xUSA)				,						
			"Base.10855_Silver",	w20g	 * CIVx	- (w20g * x20g)	- (w20g * CIVx * xSEMI)	- (w20g * CIVx * xEUR)				,						
			"Base.Colt1855",	w20g	 * CIVx	- (w20g * x20g)	- (w20g * CIVx * xREV)	- (w20g * CIVx * xUSA)				,						
			"Base.TOZ106",	w20g	 * CIVx	- (w20g * x20g)	- (w20g * CIVx * xBOLT)	- (w20g * CIVx * xSOV)				,						
			"Base.TOZ194_Pistol",	w12g	 * CIVx	- (w12g * x12g)	- (w12g * CIVx * xPUMP)	- (w12g * CIVx * xSOV)				,						
			"Base.Saiga12_Tromix",	w12g	 * CIVx	- (w12g * x12g)	- (w12g * CIVx * xAUTO)	- (w12g * CIVx * xSOV)		- (w12g * CIVx * CIVxMIL)	- (w12g * CIVx * x90)	,						
			"Base.MP133",	w12g	 * CIVx	- (w12g * x12g)	- (w12g * CIVx * xPUMP)	- (w12g * CIVx * xSOV)			- (w12g * CIVx * x90)	,						
			"Base.MP133S_Pistol",	w12g	 * CIVx	- (w12g * x12g)	- (w12g * CIVx * xPUMP)	- (w12g * CIVx * xSOV)			- (w12g * CIVx * x90)	,						
			"Base.KSG",	w12g	 * CIVx	- (w12g * x12g)	- (w12g * CIVx * xPUMP)	- (w12g * CIVx * xUSA)			- (w12g * CIVx * x90)	,						
			"Base.KSG25",	w12g	 * CIVx	- (w12g * x12g)	- (w12g * CIVx * xPUMP)	- (w12g * CIVx * xUSA)			- (w12g * CIVx * x90)	,						
			"Base.UTS15",	w12g	 * CIVx	- (w12g * x12g)	- (w12g * CIVx * xPUMP)	- (w12g * CIVx * xREST)			- (w12g * CIVx * x90)	,						
			"Base.EX41_HE",	wGREN	 * CIVx		- (wGREN * CIVx * xGREN)	- (wGREN * CIVx * xUSA)		- (wGREN * CIVx * CIVxMIL)		,						
			"Base.Federal_HE",	wGREN	 * CIVx		- (wGREN * CIVx * xGREN)	- (wGREN * CIVx * xUSA)		- (wGREN * CIVx * CIVxMIL)		,						
			"Base.M32_HE",	wGREN	 * CIVx		- (wGREN * CIVx * xGREN)	- (wGREN * CIVx * xUSA)		- (wGREN * CIVx * CIVxMIL)		,						
			"Base.GM94_HE",	wGREN	 * CIVx		- (wGREN * CIVx * xGREN)	- (wGREN * CIVx * xSOV)		- (wGREN * CIVx * CIVxMIL)	- (wGREN * CIVx * x90)	,						
			"Base.K11",	wGREN	 * CIVx	- (wGREN * CIVx * xAUTO)	- (wGREN * CIVx * xGREN)	- (wGREN * CIVx * xKOR)		- (wGREN * CIVx * CIVxMIL)	- (wGREN * CIVx * x90)	,						
			"Base.XM214",	w556	 * CIVx	- (w556 * x556)	- (w556 * CIVx * xMINI)	- (w556 * CIVx * xUSA)		- (w556 * CIVx * CIVxMIL)		,						
			"Base.GAU17",	w308	 * CIVx	- (w308 * x308)	- (w308 * CIVx * xMINI)	- (w308 * CIVx * xUSA)		- (w308 * CIVx * CIVxMIL)		,						
			"Base.GAU19",	wBMG	 * CIVx	- (wBMG * xBMG)	- (wBMG * CIVx * xMINI)	- (wBMG * CIVx * xUSA)		- (wBMG * CIVx * CIVxMIL)		,						
			"Base.TAC15",	wBOW	 * CIVx		- (wBOW * CIVx * xBOW)	- (wBOW * CIVx * xUSA)			- (wBOW * CIVx * x90)	,						
			"Base.M2A1",	wFLAME	 * CIVx		- (wFLAME * CIVx * xFLAME)	- (wFLAME * CIVx * xUSA)		- (wFLAME * CIVx * CIVxMIL)		,						
			"Base.Musk",	wFLAME	 * CIVx		- (wFLAME * CIVx * xFLAME)	- (wFLAME * CIVx * xUSA)	- (wFLAME * CIVx * CIVxLEO)		- (wFLAME * CIVx * x90)	,						
		},																
		dontSpawnAmmo = 		 CIVammo	,													
	},																	
																		
	GunStoreParts = {																	
		rolls =	GUNRollPART	,														
		items = {																
			"Base.Launcher",	wGREN		- (wGREN * xGREN)				- (wGREN * CIVxMIL)		,						
			"Base.Bipod",	Part		- (Part * xPart)						,						
			"Base.Ammobelt",	Part		- (Part * xPart)						,						
			"Base.Sling_1",	Part		- (Part * xPart)						,						
			"Base.Sling_2",	Part		- (Part * xPart)						,						
			"Base.Sling_3",	Part		- (Part * xPart)						,						
			"Base.ForeGrip",	Part		- (Part * xPart)						,						
			"Base.Grip_Magpul",	Part		- (Part * xPart)					- (Part * x90)	,						
			"Base.Grip_MLOK",	Part		- (Part * xPart)					- (Part * x90)	,						
			"Base.Grip_TG",	Part		- (Part * xPart)					- (Part * x90)	,						
			"Base.Light_Small",	Light		- (Light * xLight)						,						
			"Base.Light_Large",	Light		- (Light * xLight)						,						
			"Base.Laser_Green",	Light		- (Light * xLight)						,						
			"Base.Laser_Red",	Light		- (Light * xLight)						,						
			"Base.Laser_DVAL",	Light		- (Light * xLight)			- (Light * CIVxLEO)			,						
			"Base.Laser_PEQ15",	Light		- (Light * xLight)				- (Light * CIVxMIL)		,						
			"Base.Suppressor_Pistol",	Suppress		- (Suppress * xSuppress)				- (Suppress * CIVxMIL)		,						
			"Base.Suppressor_Rifle",	Suppress		- (Suppress * xSuppress)				- (Suppress * CIVxMIL)		,						
			"Base.Suppressor_Shotgun",	Suppress		- (Suppress * xSuppress)				- (Suppress * CIVxMIL)		,						
			"Base.Suppressor_BMG",	Suppress		- (Suppress * xSuppress)	- (wBMG * xBMG)			- (Suppress * CIVxMIL)		,						
			"Base.Bayonet_M4",	Part		- (Part * xPart)						,						
			"Base.Bayonet_AK",	Part		- (Part * xPart)		- (Part * xSOV)				,						
			"Base.Bayonet_M1917",	Part		- (Part * xPart)						,						
			"Base.Choke_Full",	Part		- (Part * xPart)						,						
			"Base.Choke_Full_Dbl",	Part		- (Part * xPart)						,						
			"Base.Compensator",	Part		- (Part * xPart)						,						
			"Base.MuzzleBrake",	Part		- (Part * xPart)						,						
			"Base.Pad",	Part		- (Part * xPart)						,						
			"Base.Carrier_12g",	Part		- (Part * xPart)						,						
			"Base.GhostRing",	Optic		- (Optic * xOptic)						,						
			"Base.Sight_MicroDot",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * x90)	,						
			"Base.Sight_RaceDot",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				,						
			"Base.Sight_SRS",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * x90)	,						
			"Base.Sight_EOTech",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				,						
			"Base.Sight_3xEOTech",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				,						
			"Base.Sight_4xACOG",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				,						
			"Base.Sight_6xELCAN",	Optic		- (Optic * xOptic)		- (Optic * xEUR)				,						
			"Base.Sight_KOBRA",	Optic		- (Optic * xOptic)		- (Optic * xSOV)				,						
			"Base.Scope_4xPSO",	Optic		- (Optic * xOptic)		- (Optic * xSOV)				,						
			"Base.Scope_12xPSO",	Optic		- (Optic * xOptic)		- (Optic * xSOV)				,						
			"Base.Scope_1-4x",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				,						
			"Base.Scope_20x",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				,						
			"Base.Sight_Thermal",	Optic		- (Optic * xOptic)		- (Optic * xUSA)		- (Optic * CIVxMIL)		,						
			"Base.Sight_Thermal_AK",	Optic		- (Optic * xOptic)		- (Optic * xSOV)		- (Optic * CIVxMIL)		,						
			"Base.Sight_Aimpoint",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				,						
			"Base.Sight_Aimpoint_Dot",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				,						
			"Base.Sight_Fiber_Shotgun",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				,						
			"Base.Sight_Mepro_M21",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * x90)	,						
			"Base.Sight_Mepro_MOR",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * x90)	,						
			"Base.Sight_UH1",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * x90)	,						
			"Base.Sight_C79",	Optic		- (Optic * xOptic)		- (Optic * xEUR)				,						
			"Base.Sight_SUSAT",	Optic		- (Optic * xOptic)		- (Optic * xEUR)				,						
			"Base.Sight_Raven",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				,						
			"Base.Sight_G28_Scope",	Optic		- (Optic * xOptic)		- (Optic * xEUR)	- (Optic * CIVxLEO)	- (Optic * CIVxMIL)		,						
			"Base.Sight_ACRO",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * x90)	,						
			"Base.Sight_MRO",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * x90)	,						
			"Base.Sight_SRO",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * x90)	,						
			"Base.Sight_Nikon",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				,						
			"Base.Sight_M8",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				,						
			"Base.Sight_VX3",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				,						
			"Base.Sight_1P63",	Optic		- (Optic * xOptic)		- (Optic * xSOV)				,						
			"Base.Sight_Brownells",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				,						
			"Base.Sight_L2",	Optic		- (Optic * xOptic)		- (Optic * xEUR)				,						
			"Base.Sight_Malcom",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				,						
			"Base.Sight_LUX",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				,						
			"Base.Sight_NO32",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				,						
			"Base.Sight_PKAS",	Optic		- (Optic * xOptic)		- (Optic * xSOV)				,						
			"Base.Sight_PU",	Optic		- (Optic * xOptic)		- (Optic * xSOV)				,						
			"Base.Sight_XPS",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * x90)	,						
			"Base.Sight_PVS4",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				,						
			"Base.Barrel_308",	w308	- (w308 * xBREAK)	- (w308 * x308)		- (w308 * xUSA)				,						
			"Base.Barrel_3006",	w3006	- (w3006 * xBREAK)	- (w3006 * x3006)		- (w3006 * xUSA)				,						
			"Base.Barrel_4570",	w4570	- (w4570 * xBREAK)	- (w4570 * x4570)		- (w4570 * xUSA)				,						
			"Base.Barrel_357",	w357	- (w357 * xBREAK)	- (w357 * x357)		- (w357 * xUSA)				,						
			"Base.Barrel_357_Short",	w357	- (w357 * xBREAK)	- (w357 * x357)		- (w357 * xUSA)	- (w357 * CIVxLEO)			,						
			"Base.Barrel_45LC",	w45LC	- (w45LC * xBREAK)	- (w45LC * x45LC)		- (w45LC * xUSA)				,						
			"Base.Barrel_45LC_Short",	w45LC	- (w45LC * xBREAK)	- (w45LC * x45LC)		- (w45LC * xUSA)	- (w45LC * CIVxLEO)			,						
			"Base.38Speed",	StdMag	* w357	- (w357 * x357)	- (StdMag * xREV)					,						
			"Base.44Speed",	StdMag	* w44	- (w44 * x44)	- (StdMag * xREV)					,						
			"Base.SRM1208_Cylinder",	StdMag	* w12g	- (w12g * x12g)	- (StdMag * xREV)	- (StdMag * xUSA)			- (StdMag * x90)	,						
			"Base.SRM1212_Cylinder",	StdMag	* w12g	- (w12g * x12g)	- (StdMag * xREV)	- (StdMag * xUSA)	- (StdMag * CIVxLEO)		- (StdMag * x90)	,						
			"Base.SRM1216_Cylinder",	StdMag	* w12g	- (w12g * x12g)	- (StdMag * xREV)	- (StdMag * xUSA)	- (StdMag * CIVxLEO)		- (StdMag * x90)	,						
			"Base.SIX12_Cylinder",	StdMag	* w12g	- (w12g * x12g)	- (StdMag * xREV)	- (StdMag * xUSA)			- (StdMag * x90)	,						
			"Base.CP33Clip",	StdMag	* w22	- (w22 * x22)		- (StdMag * xUSA)			- (StdMag * x90)	,						
			"Base.CP33_17MagBase",	ExtMag	* w22	- (w22 * x22)		- (ExtMag * xUSA)			- (ExtMag * x90)	,						
			"Base.22Clip",	StdMag	* w22	- (w22 * x22)						,						
			"Base.22ExtClip",	ExtMag	* w22	- (w22 * x22)						,						
			"Base.380Clip",	StdMag	* w380	- (w380 * x380)						,						
			"Base.380ExtClip",	ExtMag	* w380	- (w380 * x380)						,						
			"Base.9mmClip",	StdMag	* w9	- (w9 * x9)						,						
			"Base.9mmExtClip",	ExtMag	* w9	- (w9 * x9)						,						
			"Base.45DSClip",	StdMag	* w45	- (w45 * x45)						,						
			"Base.45DSExtClip",	ExtMag	* w45	- (w45 * x45)						,						
			"Base.45Clip",	StdMag	* w45	- (w45 * x45)						,						
			"Base.45ExtClip",	ExtMag	* w45	- (w45 * x45)						,						
			"Base.44Clip",	StdMag	* w44	- (w44 * x44)						,						
			"Base.223StdClip",	StdMag	* w223	- (w223 * x223)						,						
			"Base.223ExtClip",	ExtMag	* w223	- (w223 * x223)						,						
			"Base.556Clip",	StdMag	* w556	- (w556 * x556)						,						
			"Base.308StdClip",	StdMag	* w308	- (w308 * x308)						,						
			"Base.308ExtClip",	ExtMag	* w308	- (w308 * x308)						,						
			"Base.3006ExtClip",	ExtMag	* w3006	- (w3006 * x3006)		- (ExtMag * xUSA)				,						
			"Base.SVDClip",	StdMag	* w762x54r	- (w762x54r * x762x54r)		- (StdMag * xSOV)				,						
			"Base.ASHClip",	StdMag	* wBMG	- (wBMG * xBMG)		- (StdMag * xSOV)		- (StdMag * CIVxMIL)	- (StdMag * x90)	,						
			"Base.M82Clip",	StdMag	* wBMG	- (wBMG * xBMG)		- (StdMag * xUSA)		- (StdMag * CIVxMIL)		,						
			"Base.M1Clip",	StdMag	* w3006	- (w3006 * x3006)		- (StdMag * xUSA)				,						
			"Base.SKSClip",	StdMag	* w762x39	- (w762x39 * x762x39)		- (StdMag * xSOV)				,						
			"Base.1903Clip",	StdMag	* w308	- (w308 * x308)						,						
			"Base.545StdClip",	StdMag	* w545x39	- (w545x39 * x545x39)		- (StdMag * xSOV)				,						
			"Base.AKClip",	StdMag	* w762x39	- (w762x39 * x762x39)						,						
			"Base.ASVALClip",	ExtMag	* w9	- (w9 * x9)		- (ExtMag * xSOV)				,						
			"Base.VSSClip",	StdMag	* w9	- (w9 * x9)		- (StdMag * xSOV)				,						
			"Base.57Clip",	StdMag	* w57	- (w57 * x57)		- (StdMag * xEUR)			- (StdMag * x90)	,						
			"Base.P90Clip",	StdMag	* w57	- (w57 * x57)		- (StdMag * xEUR)			- (StdMag * x90)	,						
			"Base.22Drum",	DrumMag	* w22	- (w22 * x22)						,						
			"Base.9mmDrum",	DrumMag	* w9	- (w9 * x9)						,						
			"Base.45Drum",	DrumMag	* w45	- (w45 * x45)						,						
			"Base.556Drum",	DrumMag	* w556	- (w556 * x556)						,						
			"Base.545Drum",	DrumMag	* w545x39	- (w545x39 * x545x39)		- (DrumMag * xSOV)				,						
			"Base.762Drum",	DrumMag	* w762x39	- (w762x39 * x762x39)						,						
			"Base.12gDrum",	DrumMag	* w12g	- (w12g * x12g)						,						
			"Base.308Belt",	StdMag	* w308	- (w308 * x308)	- (wLMG * xLMG)			- (StdMag * CIVxMIL)		,						
			"Base.556Belt",	StdMag	* w556	- (w556 * x556)	- (wLMG * xLMG)			- (StdMag * CIVxMIL)		,						
			"Base.762x39Belt",	StdMag	* w762x39	- (w762x39 * x762x39)	- (wLMG * xLMG)			- (StdMag * CIVxMIL)		,						
			"Base.762x54rBelt",	StdMag	* w762x54r	- (w762x54r * x762x54r)	- (wLMG * xLMG)	- (StdMag * xSOV)		- (StdMag * CIVxMIL)		,						
			"Base.556MiniCan",	StdMag	* w556	- (w556 * x556)	- (wMINI * xMINI)	- (StdMag * xUSA)		- (StdMag * CIVxMIL)		,						
			"Base.308MiniCan",	StdMag	* w308	- (w308 * x308)	- (wMINI * xMINI)	- (StdMag * xUSA)		- (StdMag * CIVxMIL)		,						
			"Base.50MiniCan",	StdMag	* wBMG	- (wBMG * xBMG)	- (wMINI * xMINI)	- (StdMag * xUSA)		- (StdMag * CIVxMIL)		,						
			"Base.M2A1_Tank",	ExtMag	* wFLAME	- (wFLAME * xFLAME)		- (ExtMag * xUSA)		- (ExtMag * CIVxMIL)		,						
			"Base.M2A1_Can",	StdMag	* wFLAME	- (wFLAME * xFLAME)		- (StdMag * xUSA)		- (StdMag * CIVxMIL)		,						
			"Base.RussianMachete",	LgKnife		- (LgKnife * xLgKnife)		- (LgKnife * xSOV)				,						
			"Base.BGMachete",	LgKnife		- (LgKnife * xLgKnife)		- (LgKnife * xUSA)				,						
			"Base.RamboKnife",	LgKnife		- (LgKnife * xLgKnife)		- (LgKnife * xUSA)				,						
			"Base.Butterfly",	SmKnife		- (SmKnife * xSmKnife)		- (SmKnife * xPAC)				,						
			"Base.PushDagger",	SmKnife		- (SmKnife * xSmKnife)		- (SmKnife * xUSA)				,						
			"Base.Karambit",	SmKnife		- (SmKnife * xSmKnife)		- (SmKnife * xPAC)				,						
			"Base.Tactical_Axe",	Axe		- (Axe * xAxe)		- (Axe * xUSA)				,						
			"Base.Tactical_Sickle",	Axe		- (Axe * xAxe)		- (Axe * xUSA)				,						
			"Base.DingDong",	Blunt		- (Blunt * xBlunt)		- (Blunt * xUSA)	- (Blunt * CIVxLEO)			,						
			"Base.MilitaryBaton",	Blunt		- (Blunt * xBlunt)		- (Blunt * xUSA)		- (Blunt * CIVxMIL)		,						
			"Base.KillBill",	Sword		- (Sword * xSword)		- (Sword * xPAC)				,						
			"Base.CH_WarSword",	Sword		- (Sword * xSword)		- (Sword * xPAC)				,						
			"Base.Conan_Sword",	Sword		- (Sword * xSword)		- (Sword * xUSA)				,						
		}																
	},																	
																		
	GunStoreAmmo = {																	
		rolls =	GUNRollAMMO	,														
		items = {																
			"Base.AmmoCan30_22",	AmmoCan		* w22	- (w22 * x22)					,						
			"Base.AmmoCan30_380",	AmmoCan		* w380	- (w380 * x380)					,						
			"Base.AmmoCan30_57",	AmmoCan		* w57	- (w57 * x57)				- (AmmoCan * x90)	,						
			"Base.AmmoCan30_9",	AmmoCan		* w9	- (w9 * x9)					,						
			"Base.AmmoCan30_38",	AmmoCan		* w357	- (w357 * x357)					,						
			"Base.AmmoCan30_357",	AmmoCan		* w357	- (w357 * x357)					,						
			"Base.AmmoCan30_45",	AmmoCan		* w45	- (w45 * x45)					,						
			"Base.AmmoCan30_44",	AmmoCan		* w44	- (w44 * x44)					,						
			"Base.AmmoCan30_45LC",	AmmoCan		* w45LC	- (w45LC * x45LC)					,						
			"Base.AmmoCan30_4570",	AmmoCan		* w4570	- (w4570 * x4570)					,						
			"Base.AmmoCan30_50MAG",	AmmoCan		* wBMG	- (wBMG * xBMG)				- (AmmoCan * x90)	,						
			"Base.AmmoCan50_223",	AmmoCan		* w223	- (w223 * x223)					,						
			"Base.AmmoCan50_556",	AmmoCan		* w556	- (w556 * x556)					,						
			"Base.AmmoCan50_762x39",	AmmoCan		* w762x39	- (w762x39 * x762x39)					,						
			"Base.AmmoCan50_545x39",	AmmoCan		* w545x39	- (w545x39 * x545x39)					,						
			"Base.AmmoCan50_762x54r",	AmmoCan		* w762x54r	- (w762x54r * x762x54r)					,						
			"Base.AmmoCan50_308",	AmmoCan		* w308	- (w308 * x308)					,						
			"Base.AmmoCan50_3006",	AmmoCan		* w3006	- (w3006 * x3006)					,						
			"Base.AmmoCan50_410",	AmmoCan		* w45LC	- (w45LC * x45LC)					,						
			"Base.AmmoCan50_20",	AmmoCan		* w20g	- (w20g * x20g)					,						
			"Base.AmmoCan50_12",	AmmoCan		* w12g	- (w12g * x12g)					,						
			"Base.AmmoCan50_10",	AmmoCan		* w10g	- (w10g * x10g)					,						
			"Base.AmmoCan50_4",	AmmoCan		* w4g	- (w4g * x4g)					,						
			"Base.AmmoCan50_50",	AmmoCan		* wBMG	- (wBMG * xBMG)					,						
			"Base.AmmoCan50_HE",	AmmoCan		* wGREN	- (wGREN * xGREN)			- (AmmoCan * CIVxMIL)		,						
			"Base.AmmoCan50_HE",	AmmoCan		* wGREN	- (wGREN * xGREN)			- (AmmoCan * CIVxMIL)		,						
			"Base.AmmoCan50_INC",	AmmoCan		* wGREN	- (wGREN * xGREN)			- (AmmoCan * CIVxMIL)		,						
			"Base.AmmoCan50_INC",	AmmoCan		* wGREN	- (wGREN * xGREN)			- (AmmoCan * CIVxMIL)		,						
			"Base.BB177Box",	AmmoBox		* wBB	- (wBB * xBB)					,						
			"Base.Bullets22Box",	AmmoBox		* w22	- (w22 * x22)					,						
			"Base.Bullets380Box",	AmmoBox		* w380	- (w380 * x380)					,						
			"Base.Bullets57Box",	AmmoBox		* w57	- (w57 * x57)				- (AmmoBox * x90)	,						
			"Base.Bullets9mmBox",	AmmoBox		* w9	- (w9 * x9)					,						
			"Base.Bullets38Box",	AmmoBox		* w357	- (w357 * x357)					,						
			"Base.Bullets357Box",	AmmoBox		* w357	- (w357 * x357)					,						
			"Base.Bullets45Box",	AmmoBox		* w45	- (w45 * x45)					,						
			"Base.Bullets44Box",	AmmoBox		* w44	- (w44 * x44)					,						
			"Base.Bullets45LCBox",	AmmoBox		* w45LC	- (w45LC * x45LC)					,						
			"Base.Bullets4570Box",	AmmoBox		* w4570	- (w4570 * x4570)					,						
			"Base.Bullets50MAGBox",	AmmoBox		* wBMG	- (wBMG * xBMG)				- (AmmoBox * x90)	,						
			"Base.223Box",	AmmoBox		* w223	- (w223 * x223)					,						
			"Base.556Box",	AmmoBox		* w556	- (w556 * x556)					,						
			"Base.762x39Box",	AmmoBox		* w762x39	- (w762x39 * x762x39)					,						
			"Base.545x39Box",	AmmoBox		* w545x39	- (w545x39 * x545x39)					,						
			"Base.762x54rBox",	AmmoBox		* w762x54r	- (w762x54r * x762x54r)					,						
			"Base.308Box",	AmmoBox		* w308	- (w308 * x308)					,						
			"Base.3006Box",	AmmoBox		* w3006	- (w3006 * x3006)					,						
			"Base.410gShotgunShellsBox",	AmmoBox		* w45LC	- (w45LC * x45LC)					,						
			"Base.20gShotgunShellsBox",	AmmoBox		* w20g	- (w20g * x20g)					,						
			"Base.ShotgunShellsBox",	AmmoBox		* w12g	- (w12g * x12g)					,						
			"Base.10gShotgunShellsBox",	AmmoBox		* w10g	- (w10g * x10g)					,						
			"Base.4gShotgunShellsBox",	AmmoBox		* w4g	- (w4g * x4g)					,						
			"Base.50BMGBox",	AmmoBox		* wBMG	- (wBMG * xBMG)					,						
			"Base.Bolt_Bear",	AmmoBox		* wBOW	- (wBOW * xBOW)					,						
			"Base.Bolt_Bear_Pack",	AmmoBox		* wBOW	- (wBOW * xBOW)					,						
			"Base.40HERound",	AmmoBox		* wGREN	- (wGREN * xGREN)			- (AmmoBox * CIVxMIL)		,						
			"Base.40INCRound",	AmmoBox		* wGREN	- (wGREN * xGREN)			- (AmmoBox * CIVxMIL)		,						
			"Base.PolyCan_Red_SPASClip",	StdMag	 * PolyCan	* w12g	- (w12g * x12g)					,						
			"Base.PolyCan_Red_12gDrum",	DrumMag	 * PolyCan	* w12g	- (w12g * x12g)					,						
			"Base.PolyCan_Red_38Speed",	StdMag	 * PolyCan	* w357	- (w357 * x357)	- (StdMag * xREV)				,						
			"Base.PolyCan_Red_44Speed",	StdMag	 * PolyCan	* w44	- (w44 * x44)	- (StdMag * xREV)				,						
			"Base.PolyCan_Blue_9mmClip",	StdMag	 * PolyCan	* w9	- (w9 * x9)					,						
			"Base.PolyCan_Blue_9mmExtClip",	ExtMag	 * PolyCan	* w9	- (w9 * x9)					,						
			"Base.PolyCan_Blue_9mmDrum",	DrumMag	 * PolyCan	* w9	- (w9 * x9)					,						
			"Base.PolyCan_Blue_45DSClip",	StdMag	 * PolyCan	* w45	- (w45 * x45)					,						
			"Base.PolyCan_Blue_45DSExtClip",	ExtMag	 * PolyCan	* w45	- (w45 * x45)					,						
			"Base.PolyCan_Blue_45Drum",	DrumMag	 * PolyCan	* w45	- (w45 * x45)					,						
			"Base.PolyCan_Blue_45Clip",	StdMag	 * PolyCan	* w45	- (w45 * x45)					,						
			"Base.PolyCan_Blue_45ExtClip",	ExtMag	 * PolyCan	* w45	- (w45 * x45)					,						
			"Base.PolyCan_Brown_556Clip",	StdMag	 * PolyCan	* w556	- (w556 * x556)					,						
			"Base.PolyCan_Brown_556Drum",	DrumMag	 * PolyCan	* w556	- (w556 * x556)					,						
			"Base.PolyCan_Brown_AKClip",	StdMag	 * PolyCan	* w762x39	- (w762x39 * x762x39)					,						
			"Base.PolyCan_Brown_762Drum",	DrumMag	 * PolyCan	* w762x39	- (w762x39 * x762x39)					,						
			"Base.PolyCan_Brown_545StdClip",	StdMag	 * PolyCan	* w545x39	- (w545x39 * x545x39)					,						
			"Base.PolyCan_Brown_545Drum",	DrumMag	 * PolyCan	* w545x39	- (w545x39 * x545x39)					,						
			"Base.PolyCan_Beige_308StdClip",	StdMag	 * PolyCan	* w308	- (w308 * x308)					,						
			"Base.PolyCan_Beige_308ExtClip",	ExtMag	 * PolyCan	* w308	- (w308 * x308)					,						
			"Base.PolyCan_Beige_BMG",	StdMag	 * PolyCan	* wBMG	- (wBMG * xBMG)					,						
			"Base.PolyCan_Beige_K11",	StdMag	 * PolyCan	* wGREN	- (wGREN * xGREN)	- (StdMag * xKOR)		- (StdMag * CIVxMIL)	- (StdMag * x90)	,						
			"Base.PolyCan_Beige_SVDClip",	StdMag	 * PolyCan	* w762x54r	- (w762x54r * x762x54r)	- (StdMag * xSOV)				,						
			"Base.PolyCan_Beige_SKSClip",	StdMag	 * PolyCan	* w762x39	- (w762x39 * x762x39)	- (StdMag * xSOV)				,						
			"Base.PolyCan_Beige_M1Clip",	StdMag	 * PolyCan	* w3006	- (w3006 * x3006)	- (StdMag * xUSA)				,						
			"Base.PolyCan_Beige_1903Clip",	StdMag	 * PolyCan	* w308	- (w308 * x308)					,						
		}																
	},																	
																		
																		
	PoliceStorageGuns = {		-- PoliceGuns															
		rolls =	LEORollGUN	,														
		items = {																
			"Base.UmarexSS",	wBB	 * LEOx	- (wBB * xBB)		- (wBB * LEOx * xUSA)	- (wBB * LEOx * LEOxCIV)		- (wBB * LEOx * x90)	,						
			"Base.Benjamin_M397",	wBB	 * LEOx	- (wBB * xBB)		- (wBB * LEOx * xUSA)	- (wBB * LEOx * LEOxCIV)			,						
			"Base.RWS_M34",	wBB	 * LEOx	- (wBB * xBB)		- (wBB * LEOx * xUSA)	- (wBB * LEOx * LEOxCIV)		- (wBB * LEOx * x90)	,						
			"Base.CP33",	w22	 * LEOx	- (w22 * x22)	- (w22 * LEOx * xSEMI)	- (w22 * LEOx * xUSA)	- (w22 * LEOx * LEOxCIV)		- (w22 * LEOx * x90)	,						
			"Base.Ruger_MK4",	w22	 * LEOx	- (w22 * x22)	- (w22 * LEOx * xSEMI)	- (w22 * LEOx * xUSA)	- (w22 * LEOx * LEOxCIV)		- (w22 * LEOx * x90)	,						
			"Base.Buckmark",	w22	 * LEOx	- (w22 * x22)	- (w22 * LEOx * xSEMI)	- (w22 * LEOx * xUSA)	- (w22 * LEOx * LEOxCIV)			,						
			"Base.Buckmark_Long",	w22	 * LEOx	- (w22 * x22)	- (w22 * LEOx * xSEMI)	- (w22 * LEOx * xUSA)	- (w22 * LEOx * LEOxCIV)			,						
			"Base.Buckmark_Carbine",	w22	 * LEOx	- (w22 * x22)	- (w22 * LEOx * xSEMI)	- (w22 * LEOx * xUSA)	- (w22 * LEOx * LEOxCIV)			,						
			"Base.HK4_22",	w22	 * LEOx	- (w22 * x22)	- (w22 * LEOx * xSEMI)	- (w22 * LEOx * xEUR)	- (w22 * LEOx * LEOxCIV)			,						
			"Base.ZIP22",	w22	 * LEOx	- (w22 * x22)	- (w22 * LEOx * xSEMI)	- (w22 * LEOx * xUSA)	- (w22 * LEOx * LEOxCIV)		- (w22 * LEOx * x90)	,						
			"Base.Ruger_1022",	w22	 * LEOx	- (w22 * x22)	- (w22 * LEOx * xSEMI)	- (w22 * LEOx * xUSA)	- (w22 * LEOx * LEOxCIV)			,						
			"Base.Marlin_M70",	w22	 * LEOx	- (w22 * x22)	- (w22 * LEOx * xSEMI)	- (w22 * LEOx * xUSA)	- (w22 * LEOx * LEOxCIV)			,						
			"Base.Cricket_22",	w22	 * LEOx	- (w22 * x22)	- (w22 * LEOx * xBOLT)	- (w22 * LEOx * xUSA)	- (w22 * LEOx * LEOxCIV)			,						
			"Base.AR7",	w22	 * LEOx	- (w22 * x22)	- (w22 * LEOx * xSEMI)	- (w22 * LEOx * xUSA)	- (w22 * LEOx * LEOxCIV)			,						
			"Base.Calico_22LR",	w22	 * LEOx	- (w22 * x22)	- (w22 * LEOx * xSMG)	- (w22 * LEOx * xUSA)	- (w22 * LEOx * LEOxCIV)			,						
			"Base.American180",	w22	 * LEOx	- (w22 * x22)	- (w22 * LEOx * xSMG)	- (w22 * LEOx * xUSA)	- (w22 * LEOx * LEOxCIV)			,						
			"Base.Winchester1903",	w22	 * LEOx	- (w22 * x22)	- (w22 * LEOx * xLEVER)	- (w22 * LEOx * xUSA)	- (w22 * LEOx * LEOxCIV)			,						
			"Base.G42",	w380	 * LEOx	- (w380 * x380)	- (w380 * LEOx * xSEMI)	- (w380 * LEOx * xEUR)	- (w380 * LEOx * LEOxCIV)		- (w380 * LEOx * x90)	,						
			"Base.LCP380",	w380	 * LEOx	- (w380 * x380)	- (w380 * LEOx * xSEMI)	- (w380 * LEOx * xUSA)	- (w380 * LEOx * LEOxCIV)		- (w380 * LEOx * x90)	,						
			"Base.BodyGuard380",	w380	 * LEOx	- (w380 * x380)	- (w380 * LEOx * xSEMI)	- (w380 * LEOx * xUSA)	- (w380 * LEOx * LEOxCIV)		- (w380 * LEOx * x90)	,						
			"Base.Bersa85F",	w380	 * LEOx	- (w380 * x380)	- (w380 * LEOx * xSEMI)	- (w380 * LEOx * xREST)	- (w380 * LEOx * LEOxCIV)			,						
			"Base.Colt1903",	w380	 * LEOx	- (w380 * x380)	- (w380 * LEOx * xSEMI)	- (w380 * LEOx * xUSA)	- (w380 * LEOx * LEOxCIV)			,						
			"Base.Makarov380",	w380	 * LEOx	- (w380 * x380)	- (w380 * LEOx * xSEMI)	- (w380 * LEOx * xSOV)	- (w380 * LEOx * LEOxCIV)			,						
			"Base.PPK",	w380	 * LEOx	- (w380 * x380)	- (w380 * LEOx * xSEMI)	- (w380 * LEOx * xEUR)	- (w380 * LEOx * LEOxCIV)			,						
			"Base.HK4_380",	w380	 * LEOx	- (w380 * x380)	- (w380 * LEOx * xSEMI)	- (w380 * LEOx * xEUR)	- (w380 * LEOx * LEOxCIV)			,						
			"Base.VP70",	w380	 * LEOx	- (w380 * x380)	- (w380 * LEOx * xSMG)	- (w380 * LEOx * xEUR)	- (w380 * LEOx * LEOxCIV)			,						
			"Base.VP70_Stock",	w380	 * LEOx	- (w380 * x380)	- (w380 * LEOx * xSMG)	- (w380 * LEOx * xEUR)	- (w380 * LEOx * LEOxCIV)			,						
			"Base.Vz61_Fixed",	w380	 * LEOx	- (w380 * x380)	- (w380 * LEOx * xSMG)	- (w380 * LEOx * xCZE)	- (w380 * LEOx * LEOxCIV)			,						
			"Base.Vz61_Fold",	w380	 * LEOx	- (w380 * x380)	- (w380 * LEOx * xSMG)	- (w380 * LEOx * xCZE)	- (w380 * LEOx * LEOxCIV)			,						
			"Base.BT380_Stock",	w380	 * LEOx	- (w380 * x380)	- (w380 * LEOx * xSEMI)	- (w380 * LEOx * xEUR)	- (w380 * LEOx * LEOxCIV)		- (w380 * LEOx * x90)	,						
			"Base.FN_57", 	w57	 * LEOx	- (w57 * x57)	- (w57 * LEOx * xSEMI)	- (w57 * LEOx * xEUR)			- (w57 * LEOx * x90)	,						
			"Base.FN_57_MK2", 	w57	 * LEOx	- (w57 * x57)	- (w57 * LEOx * xSEMI)	- (w57 * LEOx * xEUR)			- (w57 * LEOx * x90)	,						
			"Base.FN_P90",	w57	 * LEOx	- (w57 * x57)	- (w57 * LEOx * xSMG)	- (w57 * LEOx * xEUR)			- (w57 * LEOx * x90)	,						
			"Base.FN_PS90",	w57	 * LEOx	- (w57 * x57)	- (w57 * LEOx * xSMG)	- (w57 * LEOx * xEUR)			- (w57 * LEOx * x90)	,						
			"Base.CZ75",	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSEMI)	- (w9 * LEOx * xCZE)				,						
			"Base.G17",	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSEMI)	- (w9 * LEOx * xEUR)		- (w9 * LEOx * LEOxMIL)		,						
			"Base.G18",	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSMG)	- (w9 * LEOx * xEUR)		- (w9 * LEOx * LEOxMIL)		,						
			"Base.G34", 	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSEMI)	- (w9 * LEOx * xUSA)	- (w9 * LEOx * LEOxCIV)		- (w9 * LEOx * x90)	,						
			"Base.K5",	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSEMI)	- (w9 * LEOx * xKOR)				,						
			"Base.M9",	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSEMI)	- (w9 * LEOx * xEUR)				,						
			"Base.M9A3",	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSEMI)	- (w9 * LEOx * xEUR)			- (w9 * LEOx * x90)	,						
			"Base.B93R",	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSMG)	- (w9 * LEOx * xEUR)		- (w9 * LEOx * LEOxMIL)		,						
			"Base.M5906",	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSEMI)	- (w9 * LEOx * xUSA)				,						
			"Base.XD9",	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSEMI)	- (w9 * LEOx * xUSA)			- (w9 * LEOx * x90)	,						
			"Base.MP9",	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSEMI)	- (w9 * LEOx * xUSA)			- (w9 * LEOx * x90)	,						
			"Base.P226",	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSEMI)	- (w9 * LEOx * xEUR)				,						
			"Base.APS",	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSMG)	- (w9 * LEOx * xSOV)	- (w9 * LEOx * LEOxCIV)			,						
			"Base.Makarov",	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSEMI)	- (w9 * LEOx * xSOV)	- (w9 * LEOx * LEOxCIV)			,						
			"Base.PB",	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSEMI)	- (w9 * LEOx * xSOV)	- (w9 * LEOx * LEOxCIV)			,						
			"Base.Luger",	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSEMI)	- (w9 * LEOx * xEUR)	- (w9 * LEOx * LEOxCIV)			,						
			"Base.Luger_WW1",	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSEMI)	- (w9 * LEOx * xEUR)	- (w9 * LEOx * LEOxCIV)			,						
			"Base.Luger_Carbine",	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSEMI)	- (w9 * LEOx * xEUR)	- (w9 * LEOx * LEOxCIV)			,						
			"Base.UZI", 	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSMG)	- (w9 * LEOx * xREST)	- (w9 * LEOx * LEOxCIV)			,						
			"Base.UZI_Wood",	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSMG)	- (w9 * LEOx * xREST)	- (w9 * LEOx * LEOxCIV)			,						
			"Base.UZI_Micro",	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSMG)	- (w9 * LEOx * xREST)	- (w9 * LEOx * LEOxCIV)			,						
			"Base.BT9_Fold",	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSMG)	- (w9 * LEOx * xEUR)	- (w9 * LEOx * LEOxCIV)		- (w9 * LEOx * x90)	,						
			"Base.UMP9_Stock",	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSMG)	- (w9 * LEOx * xEUR)			- (w9 * LEOx * x90)	,						
			"Base.SUB2000",	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSEMI)	- (w9 * LEOx * xUSA)	- (w9 * LEOx * LEOxCIV)		- (w9 * LEOx * x90)	,						
			"Base.MP5_Fixed",	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSMG)	- (w9 * LEOx * xEUR)				,						
			"Base.MP5_Stock",	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSMG)	- (w9 * LEOx * xEUR)				,						
			"Base.MP5SD6_Fixed",	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSMG)	- (w9 * LEOx * xEUR)		- (w9 * LEOx * LEOxMIL)		,						
			"Base.MP5SD6_Stock",	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSMG)	- (w9 * LEOx * xEUR)		- (w9 * LEOx * LEOxMIL)		,						
			"Base.EVO_Fold",	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSMG)	- (w9 * LEOx * xCZE)			- (w9 * LEOx * x90)	,						
			"Base.K7_Stock",	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSMG)	- (w9 * LEOx * xKOR)				,						
			"Base.AUG9",	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSMG)	- (w9 * LEOx * xEUR)				,						
			"Base.KG9",	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSMG)	- (w9 * LEOx * xUSA)	- (w9 * LEOx * LEOxCIV)			,						
			"Base.Calico_M900_Fold",	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSMG)	- (w9 * LEOx * xUSA)	- (w9 * LEOx * LEOxCIV)			,						
			"Base.Calico_M950_Pistol",	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSMG)	- (w9 * LEOx * xUSA)	- (w9 * LEOx * LEOxCIV)			,						
			"Base.VSS",	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSMG)	- (w9 * LEOx * xSOV)	- (w9 * LEOx * LEOxCIV)			,						
			"Base.ASVAL",	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSMG)	- (w9 * LEOx * xSOV)	- (w9 * LEOx * LEOxCIV)			,						
			"Base.M1Carbine",	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSEMI)	- (w9 * LEOx * xUSA)	- (w9 * LEOx * LEOxCIV)			,						
			"Base.M2Carbine",	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSMG)	- (w9 * LEOx * xUSA)	- (w9 * LEOx * LEOxCIV)			,						
			"Base.M635",	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSMG)	- (w9 * LEOx * xUSA)				,						
			"Base.M635S",	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSMG)	- (w9 * LEOx * xUSA)				,						
			"Base.M635SD",	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSMG)	- (w9 * LEOx * xUSA)		- (w9 * LEOx * LEOxMIL)		,						
			"Base.MP7",	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSMG)	- (w9 * LEOx * xEUR)			- (w9 * LEOx * x90)	,						
			"Base.Jatimatic",	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSMG)	- (w9 * LEOx * xEUR)	- (w9 * LEOx * LEOxCIV)			,						
			"Base.Sten",	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSMG)	- (w9 * LEOx * xEUR)	- (w9 * LEOx * LEOxCIV)			,						
			"Base.Sten_MK2",	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSMG)	- (w9 * LEOx * xEUR)	- (w9 * LEOx * LEOxCIV)			,						
			"Base.Sten_MK2SD",	w9	 * LEOx	- (w9 * x9)	- (w9 * LEOx * xSMG)	- (w9 * LEOx * xEUR)	- (w9 * LEOx * LEOxCIV)			,						
			"Base.M5238",	w357	 * LEOx	- (w357 * x357)	- (w357 * LEOx * xSEMI)	- (w357 * LEOx * xUSA)	- (w357 * LEOx * LEOxCIV)			,						
			"Base.Taurus856",	w357	 * LEOx	- (w357 * x357)	- (w357 * LEOx * xREV)	- (w357 * LEOx * xREST)			- (w357 * LEOx * x90)	,						
			"Base.Colt_Service38",	w357	 * LEOx	- (w357 * x357)	- (w357 * LEOx * xREV)	- (w357 * LEOx * xUSA)				,						
			"Base.GP100_2",	w357	 * LEOx	- (w357 * x357)	- (w357 * LEOx * xREV)	- (w357 * LEOx * xUSA)				,						
			"Base.GP100_4",	w357	 * LEOx	- (w357 * x357)	- (w357 * LEOx * xREV)	- (w357 * LEOx * xUSA)				,						
			"Base.GP100_6",	w357	 * LEOx	- (w357 * x357)	- (w357 * LEOx * xREV)	- (w357 * LEOx * xUSA)				,						
			"Base.K6S",	w357	 * LEOx	- (w357 * x357)	- (w357 * LEOx * xREV)	- (w357 * LEOx * xUSA)	- (w357 * LEOx * LEOxCIV)		- (w357 * LEOx * x90)	,						
			"Base.M1936",	w357	 * LEOx	- (w357 * x357)	- (w357 * LEOx * xREV)	- (w357 * LEOx * xUSA)	- (w357 * LEOx * LEOxCIV)			,						
			"Base.NEF_Handi_38",	w357	 * LEOx	- (w357 * x357)	- (w357 * LEOx * xBREAK)	- (w357 * LEOx * xUSA)	- (w357 * LEOx * LEOxCIV)			,						
			"Base.Marlin_1894",	w357	 * LEOx	- (w357 * x357)	- (w357 * LEOx * xLEVER)	- (w357 * LEOx * xUSA)	- (w357 * LEOx * LEOxCIV)			,						
			"Base.CZ97B",	w45	 * LEOx	- (w45 * x45)	- (w45 * LEOx * xSEMI)	- (w45 * LEOx * xCZE)			- (w45 * LEOx * x90)	,						
			"Base.G21",	w45	 * LEOx	- (w45 * x45)	- (w45 * LEOx * xSEMI)	- (w45 * LEOx * xEUR)				,						
			"Base.XD4",	w45	 * LEOx	- (w45 * x45)	- (w45 * LEOx * xSEMI)	- (w45 * LEOx * xUSA)			- (w45 * LEOx * x90)	,						
			"Base.MP45",	w45	 * LEOx	- (w45 * x45)	- (w45 * LEOx * xSEMI)	- (w45 * LEOx * xUSA)			- (w45 * LEOx * x90)	,						
			"Base.P220",	w45	 * LEOx	- (w45 * x45)	- (w45 * LEOx * xSEMI)	- (w45 * LEOx * xEUR)				,						
			"Base.M4506",	w45	 * LEOx	- (w45 * x45)	- (w45 * LEOx * xSEMI)	- (w45 * LEOx * xUSA)				,						
			"Base.PARA1911",	w45	 * LEOx	- (w45 * x45)	- (w45 * LEOx * xSEMI)	- (w45 * LEOx * xUSA)	- (w45 * LEOx * LEOxCIV)			,						
			"Base.AMT1911",	w45	 * LEOx	- (w45 * x45)	- (w45 * LEOx * xSEMI)	- (w45 * LEOx * xUSA)	- (w45 * LEOx * LEOxCIV)			,						
			"Base.AMT1911_Long",	w45	 * LEOx	- (w45 * x45)	- (w45 * LEOx * xSEMI)	- (w45 * LEOx * xUSA)	- (w45 * LEOx * LEOxCIV)			,						
			"Base.M1911_Carbine",	w45	 * LEOx	- (w45 * x45)	- (w45 * LEOx * xSEMI)	- (w45 * LEOx * xUSA)	- (w45 * LEOx * LEOxCIV)			,						
			"Base.Colt1911",	w45	 * LEOx	- (w45 * x45)	- (w45 * LEOx * xSEMI)	- (w45 * LEOx * xUSA)		- (w45 * LEOx * LEOxMIL)		,						
			"Base.Colt_Kimber",	w45	 * LEOx	- (w45 * x45)	- (w45 * LEOx * xSEMI)	- (w45 * LEOx * xUSA)		- (w45 * LEOx * LEOxMIL)	- (w45 * LEOx * x90)	,						
			"Base.Colt_Commander",	w45	 * LEOx	- (w45 * x45)	- (w45 * LEOx * xSEMI)	- (w45 * LEOx * xUSA)		- (w45 * LEOx * LEOxMIL)		,						
			"Base.UMP45_Stock",	w45	 * LEOx	- (w45 * x45)	- (w45 * LEOx * xSMG)	- (w45 * LEOx * xEUR)			- (w45 * LEOx * x90)	,						
			"Base.MAC10_Fold",	w45	 * LEOx	- (w45 * x45)	- (w45 * LEOx * xSMG)	- (w45 * LEOx * xUSA)	- (w45 * LEOx * LEOxCIV)			,						
			"Base.KRISS_Stock",	w45	 * LEOx	- (w45 * x45)	- (w45 * LEOx * xSMG)	- (w45 * LEOx * xUSA)			- (w45 * LEOx * x90)	,						
			"Base.Commando",	w45	 * LEOx	- (w45 * x45)	- (w45 * LEOx * xBOLT)	- (w45 * LEOx * xEUR)	- (w45 * LEOx * LEOxCIV)			,						
			"Base.Thompson",	w45	 * LEOx	- (w45 * x45)	- (w45 * LEOx * xSMG)	- (w45 * LEOx * xUSA)	- (w45 * LEOx * LEOxCIV)			,						
			"Base.Thompson_1928",	w45	 * LEOx	- (w45 * x45)	- (w45 * LEOx * xSMG)	- (w45 * LEOx * xUSA)	- (w45 * LEOx * LEOxCIV)			,						
			"Base.M2Hyde",	w45	 * LEOx	- (w45 * x45)	- (w45 * LEOx * xSMG)	- (w45 * LEOx * xUSA)	- (w45 * LEOx * LEOxCIV)			,						
			"Base.Model55_Fold",	w45	 * LEOx	- (w45 * x45)	- (w45 * LEOx * xSMG)	- (w45 * LEOx * xUSA)	- (w45 * LEOx * LEOxCIV)			,						
			"Base.Model50",	w45	 * LEOx	- (w45 * x45)	- (w45 * LEOx * xSMG)	- (w45 * LEOx * xUSA)	- (w45 * LEOx * LEOxCIV)			,						
			"Base.Colt_Navy_1851",	w44	 * LEOx	- (w44 * x44)	- (w44 * LEOx * xREV)	- (w44 * LEOx * xUSA)	- (w44 * LEOx * LEOxCIV)			,						
			"Base.M29_44",	w44	 * LEOx	- (w44 * x44)	- (w44 * LEOx * xREV)	- (w44 * LEOx * xUSA)	- (w44 * LEOx * LEOxCIV)			,						
			"Base.M29_44Carbine",	w44	 * LEOx	- (w44 * x44)	- (w44 * LEOx * xREV)	- (w44 * LEOx * xUSA)	- (w44 * LEOx * LEOxCIV)			,						
			"Base.Automag",	w44	 * LEOx	- (w44 * x44)	- (w44 * LEOx * xSEMI)	- (w44 * LEOx * xUSA)	- (w44 * LEOx * LEOxCIV)			,						
			"Base.DEagle",	w44	 * LEOx	- (w44 * x44)	- (w44 * LEOx * xSEMI)	- (w44 * LEOx * xISR)	- (w44 * LEOx * LEOxCIV)			,						
			"Base.DEagle_Long",	w44	 * LEOx	- (w44 * x44)	- (w44 * LEOx * xSEMI)	- (w44 * LEOx * xISR)	- (w44 * LEOx * LEOxCIV)			,						
			"Base.Winchester1866",	w45LC	 * LEOx	- (w44 * x44)	- (w45LC * LEOx * xLEVER)	- (w45LC * LEOx * xUSA)	- (w45LC * LEOx * LEOxCIV)			,						
			"Base.Win_1894",	w44	 * LEOx	- (w44 * x44)	- (w44 * LEOx * xLEVER)	- (w44 * LEOx * xUSA)	- (w44 * LEOx * LEOxCIV)			,						
			"Base.Colt_Service45",	w45LC	 * LEOx	- (w45LC * x45LC)	- (w45LC * LEOx * xREV)	- (w45LC * LEOx * xUSA)	- (w45LC * LEOx * LEOxCIV)			,						
			"Base.Judge_45LC",	w45LC	 * LEOx	- (w45LC * x45LC)	- (w45LC * LEOx * xREV)	- (w45LC * LEOx * xREST)	- (w45LC * LEOx * LEOxCIV)		- (w45LC * LEOx * x90)	,						
			"Base.Judge513_45LC",	w45LC	 * LEOx	- (w45LC * x45LC)	- (w45LC * LEOx * xREV)	- (w45LC * LEOx * xREST)	- (w45LC * LEOx * LEOxCIV)		- (w45LC * LEOx * x90)	,						
			"Base.Judge513_Long_45LC",	w45LC	 * LEOx	- (w45LC * x45LC)	- (w45LC * LEOx * xREV)	- (w45LC * LEOx * xREST)	- (w45LC * LEOx * LEOxCIV)		- (w45LC * LEOx * x90)	,						
			"Base.TXS_804_45LC",	w45LC	 * LEOx	- (w45LC * x45LC)	- (w45LC * LEOx * xREV)	- (w45LC * LEOx * xREST)	- (w45LC * LEOx * LEOxCIV)			,						
			"Base.Winchester1873",	w45LC	 * LEOx	- (w45LC * x45LC)	- (w45LC * LEOx * xLEVER)	- (w45LC * LEOx * xUSA)	- (w45LC * LEOx * LEOxCIV)			,						
			"Base.Sako85",	w223	 * LEOx	- (w223 * x223)	- (w223 * LEOx * xBOLT)	- (w223 * LEOx * xEUR)				,						
			"Base.MINI14",	w223	 * LEOx	- (w223 * x223)	- (w223 * LEOx * xSEMI)	- (w223 * LEOx * xUSA)				,						
			"Base.MINI14_T",	w223	 * LEOx	- (w223 * x223)	- (w223 * LEOx * xSEMI)	- (w223 * LEOx * xUSA)				,						
			"Base.Viper",	w223	 * LEOx	- (w223 * x223)	- (w223 * LEOx * xLEVER)	- (w223 * LEOx * xREST)	- (w223 * LEOx * LEOxCIV)		- (w223 * LEOx * x90)	,						
			"Base.CAR15SMG",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xAUTO)	- (w556 * LEOx * xUSA)				,						
			"Base.CAR15_Survival",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xAUTO)	- (w556 * LEOx * xUSA)				,						
			"Base.XM8Compact_Pistol",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xAUTO)	- (w556 * LEOx * xEUR)		- (w556 * LEOx * LEOxMIL)	- (w556 * LEOx * x90)	,						
			"Base.XM8",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xAUTO)	- (w556 * LEOx * xEUR)		- (w556 * LEOx * LEOxMIL)	- (w556 * LEOx * x90)	,						
			"Base.SCARSC_Stock",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xAUTO)	- (w556 * LEOx * xEUR)		- (w556 * LEOx * LEOxMIL)	- (w556 * LEOx * x90)	,						
			"Base.SCARL",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xAUTO)	- (w556 * LEOx * xEUR)		- (w556 * LEOx * LEOxMIL)	- (w556 * LEOx * x90)	,						
			"Base.G33",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xAUTO)	- (w556 * LEOx * xEUR)				,						
			"Base.MK18",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xAUTO)	- (w556 * LEOx * xEUR)			- (w556 * LEOx * x90)	,						
			"Base.M16A1",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xAUTO)	- (w556 * LEOx * xUSA)		- (w556 * LEOx * LEOxMIL)		,						
			"Base.M16A2",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xAUTO)	- (w556 * LEOx * xUSA)				,						
			"Base.M16A3",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xAUTO)	- (w556 * LEOx * xUSA)		- (w556 * LEOx * LEOxMIL)		,						
			"Base.M723",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xAUTO)	- (w556 * LEOx * xUSA)				,						
			"Base.XM117",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xAUTO)	- (w556 * LEOx * xUSA)			- (w556 * LEOx * x90)	,						
			"Base.H416",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xAUTO)	- (w556 * LEOx * xEUR)			- (w556 * LEOx * x90)	,						
			"Base.M4",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xAUTO)	- (w556 * LEOx * xUSA)				,						
			"Base.M4A1",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xAUTO)	- (w556 * LEOx * xUSA)				,						
			"Base.ADAR",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xAUTO)	- (w556 * LEOx * xSOV)	- (w556 * LEOx * LEOxCIV)		- (w556 * LEOx * x90)	,						
			"Base.K2C1_PH",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xAUTO)	- (w556 * LEOx * xKOR)			- (w556 * LEOx * x90)	,						
			"Base.K1DEV",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xAUTO)	- (w556 * LEOx * xKOR)				,						
			"Base.K2_C1",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xAUTO)	- (w556 * LEOx * xKOR)			- (w556 * LEOx * x90)	,						
			"Base.K2_1",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xAUTO)	- (w556 * LEOx * xKOR)				,						
			"Base.K2_203",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xAUTO)	- (w556 * LEOx * xKOR)		- (w556 * LEOx * LEOxMIL)		,						
			"Base.K1_1",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xAUTO)	- (w556 * LEOx * xKOR)				,						
			"Base.DR_200",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xAUTO)	- (w556 * LEOx * xKOR)			- (w556 * LEOx * x90)	,						
			"Base.LVOA_C",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xSEMI)	- (w556 * LEOx * xUSA)	- (w556 * LEOx * LEOxCIV)		- (w556 * LEOx * x90)	,						
			"Base.MCX_Spear",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xSEMI)	- (w556 * LEOx * xEUR)	- (w556 * LEOx * LEOxCIV)		- (w556 * LEOx * x90)	,						
			"Base.ColtM16",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xAUTO)	- (w556 * LEOx * xUSA)	- (w556 * LEOx * LEOxCIV)			,						
			"Base.M16Wood",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xAUTO)	- (w556 * LEOx * xUSA)	- (w556 * LEOx * LEOxCIV)			,						
			"Base.M16Tape",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xAUTO)	- (w556 * LEOx * xUSA)	- (w556 * LEOx * LEOxCIV)			,						
			"Base.FAMAS",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xAUTO)	- (w556 * LEOx * xEUR)		- (w556 * LEOx * LEOxMIL)		,						
			"Base.FAMAS_G2",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xAUTO)	- (w556 * LEOx * xEUR)		- (w556 * LEOx * LEOxMIL)		,						
			"Base.FAMAS_Felin",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xAUTO)	- (w556 * LEOx * xEUR)		- (w556 * LEOx * LEOxMIL)		,						
			"Base.AUG",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xAUTO)	- (w556 * LEOx * xEUR)	- (w556 * LEOx * LEOxCIV)			,						
			"Base.M85_Stock",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xAUTO)	- (w556 * LEOx * xSOV)	- (w556 * LEOx * LEOxCIV)			,						
			"Base.AK74",	w545x39	 * LEOx	- (w545x39 * x545x39)	- (w545x39 * LEOx * xAUTO)	- (w545x39 * LEOx * xSOV)	- (w545x39 * LEOx * LEOxCIV)			,						
			"Base.AKS74",	w545x39	 * LEOx	- (w545x39 * x545x39)	- (w545x39 * LEOx * xAUTO)	- (w545x39 * LEOx * xSOV)	- (w545x39 * LEOx * LEOxCIV)			,						
			"Base.AKS74U",	w545x39	 * LEOx	- (w545x39 * x545x39)	- (w545x39 * LEOx * xAUTO)	- (w545x39 * LEOx * xSOV)	- (w545x39 * LEOx * LEOxCIV)			,						
			"Base.AK74_Alpha",	w545x39	 * LEOx	- (w545x39 * x545x39)	- (w545x39 * LEOx * xAUTO)	- (w545x39 * LEOx * xSOV)		- (w545x39 * LEOx * LEOxMIL)	- (w545x39 * LEOx * x90)	,						
			"Base.AK12",	w545x39	 * LEOx	- (w545x39 * x545x39)	- (w545x39 * LEOx * xAUTO)	- (w545x39 * LEOx * xSOV)		- (w545x39 * LEOx * LEOxMIL)	- (w545x39 * LEOx * x90)	,						
			"Base.AK12_New",	w545x39	 * LEOx	- (w545x39 * x545x39)	- (w545x39 * LEOx * xAUTO)	- (w545x39 * LEOx * xSOV)		- (w545x39 * LEOx * LEOxMIL)	- (w545x39 * LEOx * x90)	,						
			"Base.RPK74",	w545x39	 * LEOx	- (w545x39 * x545x39)	- (w545x39 * LEOx * xLMG)	- (w545x39 * LEOx * xSOV)	- (w545x39 * LEOx * LEOxCIV)			,						
			"Base.RPK16",	w545x39	 * LEOx	- (w545x39 * x545x39)	- (w545x39 * LEOx * xLMG)	- (w545x39 * LEOx * xSOV)	- (w545x39 * LEOx * LEOxCIV)		- (w545x39 * LEOx * x90)	,						
			"Base.L85",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xAUTO)	- (w556 * LEOx * xEUR)		- (w556 * LEOx * LEOxMIL)		,						
			"Base.L85A2",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xAUTO)	- (w556 * LEOx * xEUR)		- (w556 * LEOx * LEOxMIL)	- (w556 * LEOx * x90)	,						
			"Base.L86",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xAUTO)	- (w556 * LEOx * xEUR)		- (w556 * LEOx * LEOxMIL)		,						
			"Base.L22",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xAUTO)	- (w556 * LEOx * xEUR)		- (w556 * LEOx * LEOxMIL)	- (w556 * LEOx * x90)	,						
			"Base.F2000",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xAUTO)	- (w556 * LEOx * xEUR)	- (w556 * LEOx * LEOxCIV)		- (w556 * LEOx * x90)	,						
			"Base.Tavor",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xAUTO)	- (w556 * LEOx * xISR)		- (w556 * LEOx * LEOxMIL)	- (w556 * LEOx * x90)	,						
			"Base.AR18",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xAUTO)	- (w556 * LEOx * xUSA)	- (w556 * LEOx * LEOxCIV)			,						
			"Base.Type20",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xAUTO)	- (w556 * LEOx * xPAC)		- (w556 * LEOx * LEOxMIL)	- (w556 * LEOx * x90)	,						
			"Base.Type89",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xAUTO)	- (w556 * LEOx * xPAC)		- (w556 * LEOx * LEOxMIL)		,						
			"Base.QBZ_95",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xAUTO)	- (w556 * LEOx * xPAC)		- (w556 * LEOx * LEOxMIL)	- (w556 * LEOx * x90)	,						
			"Base.XM8LMG",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xLMG)	- (w556 * LEOx * xEUR)		- (w556 * LEOx * LEOxMIL)	- (w556 * LEOx * x90)	,						
			"Base.M249",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xLMG)	- (w556 * LEOx * xUSA)		- (w556 * LEOx * LEOxMIL)		,						
			"Base.M249E3",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xLMG)	- (w556 * LEOx * xUSA)		- (w556 * LEOx * LEOxMIL)	- (w556 * LEOx * x90)	,						
			"Base.K3LMG",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xLMG)	- (w556 * LEOx * xKOR)		- (w556 * LEOx * LEOxMIL)		,						
			"Base.AK47",	w762x39	 * LEOx	- (w762x39 * x762x39)	- (w762x39 * LEOx * xAUTO)	- (w762x39 * LEOx * xSOV)	- (w762x39 * LEOx * LEOxCIV)			,						
			"Base.AKM",	w762x39	 * LEOx	- (w762x39 * x762x39)	- (w762x39 * LEOx * xAUTO)	- (w762x39 * LEOx * xSOV)	- (w762x39 * LEOx * LEOxCIV)			,						
			"Base.AK103",	w762x39	 * LEOx	- (w762x39 * x762x39)	- (w762x39 * LEOx * xAUTO)	- (w762x39 * LEOx * xSOV)	- (w762x39 * LEOx * LEOxCIV)		- (w762x39 * LEOx * x90)	,						
			"Base.MD65_Stock",	w762x39	 * LEOx	- (w762x39 * x762x39)	- (w762x39 * LEOx * xAUTO)	- (w762x39 * LEOx * xSOV)	- (w762x39 * LEOx * LEOxCIV)			,						
			"Base.AKMS_Stock",	w762x39	 * LEOx	- (w762x39 * x762x39)	- (w762x39 * LEOx * xAUTO)	- (w762x39 * LEOx * xSOV)	- (w762x39 * LEOx * LEOxCIV)			,						
			"Base.Vz58",	w762x39	 * LEOx	- (w762x39 * x762x39)	- (w762x39 * LEOx * xAUTO)	- (w762x39 * LEOx * xCZE)	- (w762x39 * LEOx * LEOxCIV)			,						
			"Base.Vz58_Stock",	w762x39	 * LEOx	- (w762x39 * x762x39)	- (w762x39 * LEOx * xAUTO)	- (w762x39 * LEOx * xCZE)	- (w762x39 * LEOx * LEOxCIV)			,						
			"Base.Vz58_Mini_Stock",	w762x39	 * LEOx	- (w762x39 * x762x39)	- (w762x39 * LEOx * xAUTO)	- (w762x39 * LEOx * xCZE)	- (w762x39 * LEOx * LEOxCIV)			,						
			"Base.SKS",	w762x39	 * LEOx	- (w762x39 * x762x39)	- (w762x39 * LEOx * xSEMI)	- (w762x39 * LEOx * xSOV)	- (w762x39 * LEOx * LEOxCIV)			,						
			"Base.SKS_PARA",	w762x39	 * LEOx	- (w762x39 * x762x39)	- (w762x39 * LEOx * xSEMI)	- (w762x39 * LEOx * xPAC)	- (w762x39 * LEOx * LEOxCIV)			,						
			"Base.MK47",	w762x39	 * LEOx	- (w762x39 * x762x39)	- (w762x39 * LEOx * xSEMI)	- (w762x39 * LEOx * xUSA)	- (w762x39 * LEOx * LEOxCIV)		- (w762x39 * LEOx * x90)	,						
			"Base.AK308",	w308	 * LEOx	- (w308 * x308)	- (w308 * LEOx * xAUTO)	- (w308 * LEOx * xSOV)	- (w308 * LEOx * LEOxCIV)	- (w308 * LEOx * LEOxMIL)	- (w308 * LEOx * x90)	,						
			"Base.SCARH",	w308	 * LEOx	- (w308 * x308)	- (w308 * LEOx * xAUTO)	- (w308 * LEOx * xEUR)		- (w308 * LEOx * LEOxMIL)	- (w308 * LEOx * x90)	,						
			"Base.SCAR20",	w308	 * LEOx	- (w308 * x308)	- (w308 * LEOx * xAUTO)	- (w308 * LEOx * xEUR)		- (w308 * LEOx * LEOxMIL)	- (w308 * LEOx * x90)	,						
			"Base.G28",	w308	 * LEOx	- (w308 * x308)	- (w308 * LEOx * xAUTO)	- (w308 * LEOx * xEUR)		- (w308 * LEOx * LEOxMIL)	- (w308 * LEOx * x90)	,						
			"Base.G3",	w308	 * LEOx	- (w308 * x308)	- (w308 * LEOx * xAUTO)	- (w308 * LEOx * xEUR)		- (w308 * LEOx * LEOxMIL)		,						
			"Base.Type64",	w308	 * LEOx	- (w308 * x308)	- (w308 * LEOx * xAUTO)	- (w308 * LEOx * xPAC)	- (w308 * LEOx * LEOxCIV)			,						
			"Base.FAL",	w308	 * LEOx	- (w308 * x308)	- (w308 * LEOx * xAUTO)	- (w308 * LEOx * xEUR)		- (w308 * LEOx * LEOxMIL)		,						
			"Base.FAL_PARA_Stock",	w308	 * LEOx	- (w308 * x308)	- (w308 * LEOx * xAUTO)	- (w308 * LEOx * xEUR)		- (w308 * LEOx * LEOxMIL)		,						
			"Base.FN_FNC",	w308	 * LEOx	- (w308 * x308)	- (w308 * LEOx * xAUTO)	- (w308 * LEOx * xEUR)		- (w308 * LEOx * LEOxMIL)		,						
			"Base.WA2000",	w308	 * LEOx	- (w308 * x308)	- (w308 * LEOx * xBOLT)	- (w308 * LEOx * xEUR)				,						
			"Base.SVD",	w762x54r	 * LEOx	- (w762x54r * x762x54r)	- (w762x54r * LEOx * xSEMI)	- (w762x54r * LEOx * xSOV)	- (w762x54r * LEOx * LEOxCIV)			,						
			"Base.SVDK",	w762x54r	 * LEOx	- (w762x54r * x762x54r)	- (w762x54r * LEOx * xSEMI)	- (w762x54r * LEOx * xSOV)	- (w762x54r * LEOx * LEOxCIV)			,						
			"Base.M14EBR",	w308	 * LEOx	- (w308 * x308)	- (w308 * LEOx * xAUTO)	- (w308 * LEOx * xUSA)			- (w308 * LEOx * x90)	,						
			"Base.M14",	w308	 * LEOx	- (w308 * x308)	- (w308 * LEOx * xAUTO)	- (w308 * LEOx * xUSA)	- (w308 * LEOx * LEOxCIV)			,						
			"Base.K14",	w308	 * LEOx	- (w308 * x308)	- (w308 * LEOx * xBOLT)	- (w308 * LEOx * xKOR)			- (w308 * LEOx * x90)	,						
			"Base.Savage12",	w308	 * LEOx	- (w308 * x308)	- (w308 * LEOx * xBOLT)	- (w308 * LEOx * xUSA)				,						
			"Base.Ruger_No1_3006",	w3006	 * LEOx	- (w3006 * x3006)	- (w3006 * LEOx * xBREAK)	- (w3006 * LEOx * xUSA)	- (w3006 * LEOx * LEOxCIV)			,						
			"Base.M40",	w308	 * LEOx	- (w308 * x308)	- (w308 * LEOx * xBOLT)	- (w308 * LEOx * xUSA)				,						
			"Base.M40A1",	w308	 * LEOx	- (w308 * x308)	- (w308 * LEOx * xBOLT)	- (w308 * LEOx * xUSA)	- (w308 * LEOx * LEOxCIV)			,						
			"Base.M40A2",	w308	 * LEOx	- (w308 * x308)	- (w308 * LEOx * xBOLT)	- (w308 * LEOx * xUSA)		- (w308 * LEOx * LEOxMIL)		,						
			"Base.M40A3",	w308	 * LEOx	- (w308 * x308)	- (w308 * LEOx * xBOLT)	- (w308 * LEOx * xUSA)				,						
			"Base.Mosin",	w762x54r	 * LEOx	- (w762x54r * x762x54r)	- (w762x54r * LEOx * xBOLT)	- (w762x54r * LEOx * xSOV)	- (w762x54r * LEOx * LEOxCIV)			,						
			"Base.MosinObrez_Pistol",	w762x54r	 * LEOx	- (w762x54r * x762x54r)	- (w762x54r * LEOx * xBOLT)	- (w762x54r * LEOx * xSOV)	- (w762x54r * LEOx * LEOxCIV)			,						
			"Base.M1",	w3006	 * LEOx	- (w3006 * x3006)	- (w3006 * LEOx * xSEMI)	- (w3006 * LEOx * xUSA)	- (w3006 * LEOx * LEOxCIV)			,						
			"Base.M1903",	w3006	 * LEOx	- (w3006 * x3006)	- (w3006 * LEOx * xBOLT)	- (w3006 * LEOx * xUSA)	- (w3006 * LEOx * LEOxCIV)			,						
			"Base.BAR",	w3006	 * LEOx	- (w3006 * x3006)	- (w3006 * LEOx * xAUTO)	- (w3006 * LEOx * xUSA)		- (w3006 * LEOx * LEOxMIL)		,						
			"Base.BAR_Monitor",	w3006	 * LEOx	- (w3006 * x3006)	- (w3006 * LEOx * xAUTO)	- (w3006 * LEOx * xUSA)		- (w3006 * LEOx * LEOxMIL)		,						
			"Base.MAS36",	w308	 * LEOx	- (w308 * x308)	- (w308 * LEOx * xAUTO)	- (w308 * LEOx * xEUR)	- (w308 * LEOx * LEOxCIV)			,						
			"Base.MAS44",	w308	 * LEOx	- (w308 * x308)	- (w308 * LEOx * xAUTO)	- (w308 * LEOx * xEUR)	- (w308 * LEOx * LEOxCIV)			,						
			"Base.MAS49",	w308	 * LEOx	- (w308 * x308)	- (w308 * LEOx * xAUTO)	- (w308 * LEOx * xEUR)	- (w308 * LEOx * LEOxCIV)			,						
			"Base.Win_1895",	w308	 * LEOx	- (w308 * x308)	- (w308 * LEOx * xLEVER)	- (w308 * LEOx * xUSA)	- (w308 * LEOx * LEOxCIV)			,						
			"Base.Galil",	w308	 * LEOx	- (w308 * x308)	- (w308 * LEOx * xAUTO)	- (w308 * LEOx * xISR)	- (w308 * LEOx * LEOxCIV)			,						
			"Base.Galil_Sniper",	w308	 * LEOx	- (w308 * x308)	- (w308 * LEOx * xAUTO)	- (w308 * LEOx * xISR)	- (w308 * LEOx * LEOxCIV)			,						
			"Base.Thompson_Center_3006",	w3006	 * LEOx	- (w3006 * x3006)	- (w3006 * LEOx * xBREAK)	- (w3006 * LEOx * xUSA)	- (w3006 * LEOx * LEOxCIV)			,						
			"Base.Type38",	w308	 * LEOx	- (w308 * x308)	- (w308 * LEOx * xBOLT)	- (w308 * LEOx * xPAC)	- (w308 * LEOx * LEOxCIV)			,						
			"Base.Type99",	w308	 * LEOx	- (w308 * x308)	- (w308 * LEOx * xBOLT)	- (w308 * LEOx * xPAC)	- (w308 * LEOx * LEOxCIV)			,						
			"Base.L96",	w308	 * LEOx	- (w308 * x308)	- (w308 * LEOx * xBOLT)	- (w308 * LEOx * xEUR)				,						
			"Base.M240",	w308	 * LEOx	- (w308 * x308)	- (w308 * LEOx * xLMG)	- (w308 * LEOx * xUSA)		- (w308 * LEOx * LEOxMIL)		,						
			"Base.G21LMG",	w308	 * LEOx	- (w308 * x308)	- (w308 * LEOx * xLMG)	- (w308 * LEOx * xEUR)		- (w308 * LEOx * LEOxMIL)	- (w308 * LEOx * x90)	,						
			"Base.K12",	w308	 * LEOx	- (w308 * x308)	- (w308 * LEOx * xLMG)	- (w308 * LEOx * xKOR)		- (w308 * LEOx * LEOxMIL)	- (w308 * LEOx * x90)	,						
			"Base.PKM",	w762x54r	 * LEOx	- (w762x54r * x762x54r)	- (w762x54r * LEOx * xLMG)	- (w762x54r * LEOx * xSOV)		- (w762x54r * LEOx * LEOxMIL)		,						
			"Base.MG42",	w308	 * LEOx	- (w308 * x308)	- (w308 * LEOx * xLMG)	- (w308 * LEOx * xEUR)		- (w308 * LEOx * LEOxMIL)		,						
			"Base.M60",	w308	 * LEOx	- (w308 * x308)	- (w308 * LEOx * xLMG)	- (w308 * LEOx * xUSA)		- (w308 * LEOx * LEOxMIL)		,						
			"Base.MK43",	w308	 * LEOx	- (w308 * x308)	- (w308 * LEOx * xLMG)	- (w308 * LEOx * xUSA)		- (w308 * LEOx * LEOxMIL)	- (w308 * LEOx * x90)	,						
			"Base.RPD",	w762x39	 * LEOx	- (w762x39 * x762x39)	- (w762x39 * LEOx * xLMG)	- (w762x39 * LEOx * xSOV)		- (w762x39 * LEOx * LEOxMIL)		,						
			"Base.BOAR",	wBMG	 * LEOx	- (wBMG * xBMG)	- (wBMG * LEOx * xBREAK)	- (wBMG * LEOx * xUSA)	- (wBMG * LEOx * LEOxCIV)			,						
			"Base.EDM96",	wBMG	 * LEOx	- (wBMG * xBMG)	- (wBMG * LEOx * xBOLT)	- (wBMG * LEOx * xUSA)			- (wBMG * LEOx * x90)	,						
			"Base.M82",	wBMG	 * LEOx	- (wBMG * xBMG)	- (wBMG * LEOx * xSEMI)	- (wBMG * LEOx * xUSA)		- (wBMG * LEOx * LEOxMIL)		,						
			"Base.BFG50",	wBMG	 * LEOx	- (wBMG * xBMG)	- (wBMG * LEOx * xBREAK)	- (wBMG * LEOx * xUSA)	- (wBMG * LEOx * LEOxCIV)		- (wBMG * LEOx * x90)	,						
			"Base.Harris50",	wBMG	 * LEOx	- (wBMG * xBMG)	- (wBMG * LEOx * xBOLT)	- (wBMG * LEOx * xUSA)				,						
			"Base.TAC50",	wBMG	 * LEOx	- (wBMG * xBMG)	- (wBMG * LEOx * xBOLT)	- (wBMG * LEOx * xUSA)		- (wBMG * LEOx * LEOxMIL)		,						
			"Base.Ash",	wBMG	 * LEOx	- (wBMG * xBMG)	- (wBMG * LEOx * xAUTO)	- (wBMG * LEOx * xSOV)		- (wBMG * LEOx * LEOxMIL)	- (wBMG * LEOx * x90)	,						
			"Base.SW_M500",	wBMG	 * LEOx	- (wBMG * xBMG)	- (wBMG * LEOx * xREV)	- (wBMG * LEOx * xUSA)	- (wBMG * LEOx * LEOxCIV)		- (wBMG * LEOx * x90)	,						
			"Base.SPAS12_Fixed",	w12g	 * LEOx	- (w12g * x12g)	- (w12g * LEOx * xSEMI)	- (w12g * LEOx * xEUR)				,						
			"Base.SPAS12_Fold",	w12g	 * LEOx	- (w12g * x12g)	- (w12g * LEOx * xSEMI)	- (w12g * LEOx * xEUR)				,						
			"Base.Origin",	w12g	 * LEOx	- (w12g * x12g)	- (w12g * LEOx * xSEMI)	- (w12g * LEOx * xUSA)			- (w12g * LEOx * x90)	,						
			"Base.SPAS_15",	w12g	 * LEOx	- (w12g * x12g)	- (w12g * LEOx * xSEMI)	- (w12g * LEOx * xEUR)				,						
			"Base.USAS_12",	w12g	 * LEOx	- (w12g * x12g)	- (w12g * LEOx * xAUTO)	- (w12g * LEOx * xKOR)		- (w12g * LEOx * LEOxMIL)		,						
			"Base.Shorty_Pistol",	w12g	 * LEOx	- (w12g * x12g)	- (w12g * LEOx * xPUMP)	- (w12g * LEOx * xUSA)			- (w12g * LEOx * x90)	,						
			"Base.R11_87",	w12g	 * LEOx	- (w12g * x12g)	- (w12g * LEOx * xSEMI)	- (w12g * LEOx * xUSA)	- (w12g * LEOx * LEOxCIV)			,						
			"Base.M870",	w12g	 * LEOx	- (w12g * x12g)	- (w12g * LEOx * xPUMP)	- (w12g * LEOx * xUSA)				,						
			"Base.M1897",	w12g	 * LEOx	- (w12g * x12g)	- (w12g * LEOx * xPUMP)	- (w12g * LEOx * xUSA)	- (w12g * LEOx * LEOxCIV)			,						
			"Base.DT11",	w12g	 * LEOx	- (w12g * x12g)	- (w12g * LEOx * xBREAK)	- (w12g * LEOx * xEUR)	- (w12g * LEOx * LEOxCIV)			,						
			"Base.Coachgun",	w12g	 * LEOx	- (w12g * x12g)	- (w12g * LEOx * xBREAK)	- (w12g * LEOx * xUSA)	- (w12g * LEOx * LEOxCIV)			,						
			"Base.Terminator",	w12g	 * LEOx	- (w12g * x12g)	- (w12g * LEOx * xBREAK)	- (w12g * LEOx * xUSA)	- (w12g * LEOx * LEOxCIV)			,						
			"Base.SIX12",	w12g	 * LEOx	- (w12g * x12g)	- (w12g * LEOx * xREV)	- (w12g * LEOx * xUSA)			- (w12g * LEOx * x90)	,						
			"Base.SIX12SD",	w12g	 * LEOx	- (w12g * x12g)	- (w12g * LEOx * xREV)	- (w12g * LEOx * xUSA)		- (w12g * LEOx * LEOxMIL)	- (w12g * LEOx * x90)	,						
			"Base.M870_Wingmaster",	w12g	 * LEOx	- (w12g * x12g)	- (w12g * LEOx * xPUMP)	- (w12g * LEOx * xUSA)	- (w12g * LEOx * LEOxCIV)			,						
			"Base.M870_Police",	w12g	 * LEOx	- (w12g * x12g)	- (w12g * LEOx * xPUMP)	- (w12g * LEOx * xUSA)				,						
			"Base.M870_MCS",	w12g	 * LEOx	- (w12g * x12g)	- (w12g * LEOx * xPUMP)	- (w12g * LEOx * xUSA)				,						
			"Base.M870_CQB",	w12g	 * LEOx	- (w12g * x12g)	- (w12g * LEOx * xPUMP)	- (w12g * LEOx * xUSA)				,						
			"Base.M870_Breaching_Pistol",	w12g	 * LEOx	- (w12g * x12g)	- (w12g * LEOx * xPUMP)	- (w12g * LEOx * xUSA)				,						
			"Base.M870_Express",	w12g	 * LEOx	- (w12g * x12g)	- (w12g * LEOx * xPUMP)	- (w12g * LEOx * xUSA)	- (w12g * LEOx * LEOxCIV)			,						
			"Base.A400",	w12g	 * LEOx	- (w12g * x12g)	- (w12g * LEOx * xSEMI)	- (w12g * LEOx * xEUR)	- (w12g * LEOx * LEOxCIV)		- (w12g * LEOx * x90)	,						
			"Base.M1014",	w12g	 * LEOx	- (w12g * x12g)	- (w12g * LEOx * xSEMI)	- (w12g * LEOx * xEUR)			- (w12g * LEOx * x90)	,						
			"Base.M1014_Fold",	w12g	 * LEOx	- (w12g * x12g)	- (w12g * LEOx * xSEMI)	- (w12g * LEOx * xEUR)			- (w12g * LEOx * x90)	,						
			"Base.M1014_Wick",	w12g	 * LEOx	- (w12g * x12g)	- (w12g * LEOx * xSEMI)	- (w12g * LEOx * xEUR)			- (w12g * LEOx * x90)	,						
			"Base.DAO12",	w12g	 * LEOx	- (w12g * x12g)	- (w12g * LEOx * xREV)	- (w12g * LEOx * xREST)				,						
			"Base.M1887",	w12g	 * LEOx	- (w12g * x12g)	- (w12g * LEOx * xLEVER)	- (w12g * LEOx * xUSA)	- (w12g * LEOx * LEOxCIV)			,						
			"Base.M1208",	w12g	 * LEOx	- (w12g * x12g)	- (w12g * LEOx * xREV)	- (w12g * LEOx * xUSA)	- (w12g * LEOx * LEOxCIV)		- (w12g * LEOx * x90)	,						
			"Base.M1212",	w12g	 * LEOx	- (w12g * x12g)	- (w12g * LEOx * xREV)	- (w12g * LEOx * xUSA)	- (w12g * LEOx * LEOxCIV)		- (w12g * LEOx * x90)	,						
			"Base.M1216",	w12g	 * LEOx	- (w12g * x12g)	- (w12g * LEOx * xREV)	- (w12g * LEOx * xUSA)			- (w12g * LEOx * x90)	,						
			"Base.AA12",	w12g	 * LEOx	- (w12g * x12g)	- (w12g * LEOx * xAUTO)	- (w12g * LEOx * xUSA)		- (w12g * LEOx * LEOxMIL)	- (w12g * LEOx * x90)	,						
			"Base.CAWS",	w12g	 * LEOx	- (w12g * x12g)	- (w12g * LEOx * xAUTO)	- (w12g * LEOx * xEUR)		- (w12g * LEOx * LEOxMIL)		,						
			"Base.ROYAL_SXS",	w10g	 * LEOx	- (w10g * x10g)	- (w10g * LEOx * xBREAK)	- (w10g * LEOx * xEUR)	- (w10g * LEOx * LEOxCIV)			,						
			"Base.KS23",	w4g	 * LEOx	- (w4g * x4g)	- (w4g * LEOx * xPUMP)	- (w4g * LEOx * xSOV)	- (w4g * LEOx * LEOxCIV)			,						
			"Base.KS23_S_Pistol",	w4g	 * LEOx	- (w4g * x4g)	- (w4g * LEOx * xPUMP)	- (w4g * LEOx * xSOV)	- (w4g * LEOx * LEOxCIV)			,						
			"Base.Triple_Crown",	w12g	 * LEOx	- (w12g * x12g)	- (w12g * LEOx * xBREAK)	- (w12g * LEOx * xEUR)	- (w12g * LEOx * LEOxCIV)			,						
			"Base.Moss500_20",	w20g	 * LEOx	- (w20g * x20g)	- (w20g * LEOx * xPUMP)	- (w20g * LEOx * xUSA)	- (w20g * LEOx * LEOxCIV)			,						
			"Base.10855_Silver",	w20g	 * LEOx	- (w20g * x20g)	- (w20g * LEOx * xSEMI)	- (w20g * LEOx * xEUR)	- (w20g * LEOx * LEOxCIV)			,						
			"Base.Colt1855",	w20g	 * LEOx	- (w20g * x20g)	- (w20g * LEOx * xREV)	- (w20g * LEOx * xUSA)	- (w20g * LEOx * LEOxCIV)			,						
			"Base.TOZ106",	w20g	 * LEOx	- (w20g * x20g)	- (w20g * LEOx * xBOLT)	- (w20g * LEOx * xSOV)	- (w20g * LEOx * LEOxCIV)			,						
			"Base.TOZ194_Pistol",	w12g	 * LEOx	- (w12g * x12g)	- (w12g * LEOx * xPUMP)	- (w12g * LEOx * xSOV)				,						
			"Base.Saiga12_Tromix",	w12g	 * LEOx	- (w12g * x12g)	- (w12g * LEOx * xAUTO)	- (w12g * LEOx * xSOV)		- (w12g * LEOx * LEOxMIL)	- (w12g * LEOx * x90)	,						
			"Base.MP133",	w12g	 * LEOx	- (w12g * x12g)	- (w12g * LEOx * xPUMP)	- (w12g * LEOx * xSOV)			- (w12g * LEOx * x90)	,						
			"Base.MP133S_Pistol",	w12g	 * LEOx	- (w12g * x12g)	- (w12g * LEOx * xPUMP)	- (w12g * LEOx * xSOV)			- (w12g * LEOx * x90)	,						
			"Base.KSG",	w12g	 * LEOx	- (w12g * x12g)	- (w12g * LEOx * xPUMP)	- (w12g * LEOx * xUSA)			- (w12g * LEOx * x90)	,						
			"Base.KSG25",	w12g	 * LEOx	- (w12g * x12g)	- (w12g * LEOx * xPUMP)	- (w12g * LEOx * xUSA)			- (w12g * LEOx * x90)	,						
			"Base.UTS15",	w12g	 * LEOx	- (w12g * x12g)	- (w12g * LEOx * xPUMP)	- (w12g * LEOx * xREST)			- (w12g * LEOx * x90)	,						
			"Base.EX41_HE",	wGREN	 * LEOx		- (wGREN * LEOx * xGREN)	- (wGREN * LEOx * xUSA)		- (wGREN * LEOx * LEOxMIL)		,						
			"Base.Federal_HE",	wGREN	 * LEOx		- (wGREN * LEOx * xGREN)	- (wGREN * LEOx * xUSA)		- (wGREN * LEOx * LEOxMIL)		,						
			"Base.M32_HE",	wGREN	 * LEOx		- (wGREN * LEOx * xGREN)	- (wGREN * LEOx * xUSA)		- (wGREN * LEOx * LEOxMIL)		,						
			"Base.GM94_HE",	wGREN	 * LEOx		- (wGREN * LEOx * xGREN)	- (wGREN * LEOx * xSOV)		- (wGREN * LEOx * LEOxMIL)	- (wGREN * LEOx * x90)	,						
			"Base.K11",	wGREN	 * LEOx	- (wGREN * LEOx * xAUTO)	- (wGREN * LEOx * xGREN)	- (wGREN * LEOx * xKOR)		- (wGREN * LEOx * LEOxMIL)	- (wGREN * LEOx * x90)	,						
			"Base.XM214",	w556	 * LEOx	- (w556 * x556)	- (w556 * LEOx * xMINI)	- (w556 * LEOx * xUSA)		- (w556 * LEOx * LEOxMIL)		,						
			"Base.GAU17",	w308	 * LEOx	- (w308 * x308)	- (w308 * LEOx * xMINI)	- (w308 * LEOx * xUSA)		- (w308 * LEOx * LEOxMIL)		,						
			"Base.GAU19",	wBMG	 * LEOx	- (wBMG * xBMG)	- (wBMG * LEOx * xMINI)	- (wBMG * LEOx * xUSA)		- (wBMG * LEOx * LEOxMIL)		,						
			"Base.TAC15",	wBOW	 * LEOx		- (wBOW * LEOx * xBOW)	- (wBOW * LEOx * xUSA)	- (wBOW * LEOx * LEOxCIV)		- (wBOW * LEOx * x90)	,						
			"Base.M2A1",	wFLAME	 * LEOx		- (wFLAME * LEOx * xFLAME)	- (wFLAME * LEOx * xUSA)	- (wFLAME * LEOx * LEOxCIV)	- (wFLAME * LEOx * LEOxMIL)		,						
			"Base.Musk",	wFLAME	 * LEOx		- (wFLAME * LEOx * xFLAME)	- (wFLAME * LEOx * xUSA)	- (wFLAME * LEOx * LEOxCIV)		- (wFLAME * LEOx * x90)	,						
			"Base.Launcher",	wGREN		- (wGREN * xGREN)				- (wGREN * LEOxMIL)		,						
			"Base.Bipod",	Part		- (Part * xPart)						,						
			"Base.Ammobelt",	Part		- (Part * xPart)						,						
			"Base.Sling_1",	Part		- (Part * xPart)						,						
			"Base.Sling_2",	Part		- (Part * xPart)						,						
			"Base.Sling_3",	Part		- (Part * xPart)						,						
			"Base.ForeGrip",	Part		- (Part * xPart)						,						
			"Base.Grip_Magpul",	Part		- (Part * xPart)					- (Part * x90)	,						
			"Base.Grip_MLOK",	Part		- (Part * xPart)					- (Part * x90)	,						
			"Base.Grip_TG",	Part		- (Part * xPart)					- (Part * x90)	,						
			"Base.Light_Small",	Light		- (Light * xLight)						,						
			"Base.Light_Large",	Light		- (Light * xLight)						,						
			"Base.Laser_Green",	Light		- (Light * xLight)						,						
			"Base.Laser_Red",	Light		- (Light * xLight)						,						
			"Base.Laser_DVAL",	Light		- (Light * xLight)						,						
			"Base.Laser_PEQ15",	Light		- (Light * xLight)				- (Light * LEOxMIL)		,						
			"Base.Suppressor_Pistol",	Suppress		- (Suppress * xSuppress)				- (Suppress * LEOxMIL)		,						
			"Base.Suppressor_Rifle",	Suppress		- (Suppress * xSuppress)						,						
			"Base.Suppressor_Shotgun",	Suppress		- (Suppress * xSuppress)				- (Suppress * LEOxMIL)		,						
			"Base.Suppressor_BMG",	Suppress		- (Suppress * xSuppress)	- (wBMG * xBMG)			- (Suppress * LEOxMIL)		,						
			"Base.Bayonet_M4",	Part		- (Part * xPart)			- (Part * LEOxCIV)	- (Part * LEOxMIL)		,						
			"Base.Bayonet_AK",	Part		- (Part * xPart)		- (Part * xSOV)	- (Part * LEOxCIV)	- (Part * LEOxMIL)		,						
			"Base.Bayonet_M1917",	Part		- (Part * xPart)			- (Part * LEOxCIV)	- (Part * LEOxMIL)		,						
			"Base.Choke_Full",	Part		- (Part * xPart)						,						
			"Base.Choke_Full_Dbl",	Part		- (Part * xPart)			- (Part * LEOxCIV)			,						
			"Base.Compensator",	Part		- (Part * xPart)						,						
			"Base.MuzzleBrake",	Part		- (Part * xPart)						,						
			"Base.Pad",	Part		- (Part * xPart)						,						
			"Base.Carrier_12g",	Part		- (Part * xPart)						,						
			"Base.GhostRing",	Optic		- (Optic * xOptic)						,						
			"Base.Sight_MicroDot",	Optic		- (Optic * xOptic)		- (Optic * xUSA)	- (Optic * LEOxCIV)		- (Optic * x90)	,						
			"Base.Sight_RaceDot",	Optic		- (Optic * xOptic)		- (Optic * xUSA)	- (Optic * LEOxCIV)			,						
			"Base.Sight_SRS",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * x90)	,						
			"Base.Sight_EOTech",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				,						
			"Base.Sight_3xEOTech",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				,						
			"Base.Sight_4xACOG",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				,						
			"Base.Sight_6xELCAN",	Optic		- (Optic * xOptic)		- (Optic * xEUR)				,						
			"Base.Sight_KOBRA",	Optic		- (Optic * xOptic)		- (Optic * xSOV)	- (Optic * LEOxCIV)			,						
			"Base.Scope_4xPSO",	Optic		- (Optic * xOptic)		- (Optic * xSOV)	- (Optic * LEOxCIV)			,						
			"Base.Scope_12xPSO",	Optic		- (Optic * xOptic)		- (Optic * xSOV)	- (Optic * LEOxCIV)			,						
			"Base.Scope_1-4x",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				,						
			"Base.Scope_20x",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				,						
			"Base.Sight_Thermal",	Optic		- (Optic * xOptic)		- (Optic * xUSA)		- (Optic * LEOxMIL)		,						
			"Base.Sight_Thermal_AK",	Optic		- (Optic * xOptic)		- (Optic * xSOV)		- (Optic * LEOxMIL)		,						
			"Base.Sight_Aimpoint",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				,						
			"Base.Sight_Aimpoint_Dot",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				,						
			"Base.Sight_Fiber_Shotgun",	Optic		- (Optic * xOptic)		- (Optic * xUSA)	- (Optic * LEOxCIV)			,						
			"Base.Sight_Mepro_M21",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * x90)	,						
			"Base.Sight_Mepro_MOR",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * x90)	,						
			"Base.Sight_UH1",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * x90)	,						
			"Base.Sight_C79",	Optic		- (Optic * xOptic)		- (Optic * xEUR)				,						
			"Base.Sight_SUSAT",	Optic		- (Optic * xOptic)		- (Optic * xEUR)	- (Optic * LEOxCIV)	- (Optic * LEOxMIL)		,						
			"Base.Sight_Raven",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				,						
			"Base.Sight_G28_Scope",	Optic		- (Optic * xOptic)		- (Optic * xEUR)				,						
			"Base.Sight_ACRO",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * x90)	,						
			"Base.Sight_MRO",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * x90)	,						
			"Base.Sight_SRO",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * x90)	,						
			"Base.Sight_Nikon",	Optic		- (Optic * xOptic)		- (Optic * xUSA)	- (Optic * LEOxCIV)			,						
			"Base.Sight_M8",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				,						
			"Base.Sight_VX3",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				,						
			"Base.Sight_1P63",	Optic		- (Optic * xOptic)		- (Optic * xSOV)	- (Optic * LEOxCIV)			,						
			"Base.Sight_Brownells",	Optic		- (Optic * xOptic)		- (Optic * xUSA)	- (Optic * LEOxCIV)			,						
			"Base.Sight_L2",	Optic		- (Optic * xOptic)		- (Optic * xEUR)	- (Optic * LEOxCIV)			,						
			"Base.Sight_Malcom",	Optic		- (Optic * xOptic)		- (Optic * xUSA)	- (Optic * LEOxCIV)			,						
			"Base.Sight_LUX",	Optic		- (Optic * xOptic)		- (Optic * xUSA)	- (Optic * LEOxCIV)			,						
			"Base.Sight_NO32",	Optic		- (Optic * xOptic)		- (Optic * xUSA)	- (Optic * LEOxCIV)			,						
			"Base.Sight_PKAS",	Optic		- (Optic * xOptic)		- (Optic * xSOV)				,						
			"Base.Sight_PU",	Optic		- (Optic * xOptic)		- (Optic * xSOV)	- (Optic * LEOxCIV)			,						
			"Base.Sight_XPS",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * x90)	,						
			"Base.Sight_PVS4",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				,						
			"Base.Barrel_308",	w308		- (w308 * x308)	- (w308 * xBREAK)	- (w308 * xUSA)	- (w308 * LEOxCIV)			,						
			"Base.Barrel_3006",	w3006		- (w3006 * x3006)	- (w3006 * xBREAK)	- (w3006 * xUSA)	- (w3006 * LEOxCIV)			,						
			"Base.Barrel_4570",	w4570		- (w4570 * x4570)	- (w4570 * xBREAK)	- (w4570 * xUSA)	- (w4570 * LEOxCIV)			,						
			"Base.Barrel_357",	w357		- (w357 * x357)	- (w357 * xBREAK)	- (w357 * xUSA)	- (w357 * LEOxCIV)			,						
			"Base.Barrel_357_Short",	w357		- (w357 * x357)	- (w357 * xBREAK)	- (w357 * xUSA)	- (w357 * LEOxCIV)			,						
			"Base.Barrel_45LC",	w45LC		- (w45LC * x45LC)	- (w45LC * xBREAK)	- (w45LC * xUSA)	- (w45LC * LEOxCIV)			,						
			"Base.Barrel_45LC_Short",	w45LC		- (w45LC * x45LC)	- (w45LC * xBREAK)	- (w45LC * xUSA)	- (w45LC * LEOxCIV)			,						
			"Base.38Speed",	StdMag	* w357	- (w357 * x357)	- (StdMag * xREV)					,						
			"Base.44Speed",	StdMag	* w44	- (w44 * x44)	- (StdMag * xREV)		- (StdMag* w44 * LEOxCIV)			,						
			"Base.SRM1208_Cylinder",	StdMag	* w12g	- (w12g * x12g)	- (StdMag * xREV)	- (StdMag * xUSA)	- (StdMag* w12g * LEOxCIV)		- (StdMag* w12g * x90)	,						
			"Base.SRM1212_Cylinder",	StdMag	* w12g	- (w12g * x12g)	- (StdMag * xREV)	- (StdMag * xUSA)	- (StdMag* w12g * LEOxCIV)		- (StdMag* w12g * x90)	,						
			"Base.SRM1216_Cylinder",	StdMag	* w12g	- (w12g * x12g)	- (StdMag * xREV)	- (StdMag * xUSA)			- (StdMag* w12g * x90)	,						
			"Base.SIX12_Cylinder",	StdMag	* w12g	- (w12g * x12g)	- (StdMag * xREV)	- (StdMag * xUSA)			- (StdMag* w12g * x90)	,						
			"Base.CP33Clip",	StdMag	* w22	- (w22 * x22)		- (StdMag * xUSA)	- (StdMag* w22 * LEOxCIV)		- (StdMag* w22 * x90)	,						
			"Base.CP33_17MagBase",	ExtMag	* w22	- (w22 * x22)		- (ExtMag * xUSA)	- (ExtMag* w22 * LEOxCIV)		- (ExtMag* w22 * x90)	,						
			"Base.22Clip",	StdMag	* w22	- (w22 * x22)			- (StdMag* w22 * LEOxCIV)			,						
			"Base.22ExtClip",	ExtMag	* w22	- (w22 * x22)			- (ExtMag* w22 * LEOxCIV)			,						
			"Base.380Clip",	StdMag	* w380	- (w380 * x380)			- (StdMag* w380 * LEOxCIV)			,						
			"Base.380ExtClip",	ExtMag	* w380	- (w380 * x380)			- (ExtMag* w380 * LEOxCIV)			,						
			"Base.9mmClip",	StdMag	* w9	- (w9 * x9)						,						
			"Base.9mmExtClip",	ExtMag	* w9	- (w9 * x9)						,						
			"Base.45DSClip",	StdMag	* w45	- (w45 * x45)						,						
			"Base.45DSExtClip",	ExtMag	* w45	- (w45 * x45)						,						
			"Base.45Clip",	StdMag	* w45	- (w45 * x45)			- (StdMag* w45 * LEOxCIV)	- (StdMag* w45 * LEOxMIL)		,						
			"Base.45ExtClip",	ExtMag	* w45	- (w45 * x45)			- (ExtMag* w45 * LEOxCIV)	- (ExtMag* w45 * LEOxMIL)		,						
			"Base.44Clip",	StdMag	* w44	- (w44 * x44)			- (StdMag* w44 * LEOxCIV)			,						
			"Base.223StdClip",	StdMag	* w223	- (w223 * x223)						,						
			"Base.223ExtClip",	ExtMag	* w223	- (w223 * x223)						,						
			"Base.556Clip",	StdMag	* w556	- (w556 * x556)						,						
			"Base.308StdClip",	StdMag	* w308	- (w308 * x308)						,						
			"Base.308ExtClip",	ExtMag	* w308	- (w308 * x308)						,						
			"Base.3006ExtClip",	ExtMag	* w3006	- (w3006 * x3006)		- (ExtMag * xUSA)	- (ExtMag* w3006 * LEOxCIV)			,						
			"Base.SVDClip",	StdMag	* w762x54r	- (w762x54r * x762x54r)		- (StdMag * xSOV)	- (StdMag* w762x54r * LEOxCIV)			,						
			"Base.ASHClip",	StdMag	* wBMG	- (wBMG * xBMG)		- (StdMag * xSOV)	- (StdMag* wBMG * LEOxCIV)		- (StdMag* wBMG * x90)	,						
			"Base.M82Clip",	StdMag	* wBMG	- (wBMG * xBMG)		- (StdMag * xUSA)		- (StdMag* wBMG * LEOxMIL)		,						
			"Base.M1Clip",	StdMag	* w3006	- (w3006 * x3006)		- (StdMag * xUSA)	- (StdMag* w3006 * LEOxCIV)			,						
			"Base.SKSClip",	StdMag	* w762x39	- (w762x39 * x762x39)		- (StdMag * xSOV)	- (StdMag* w762x39 * LEOxCIV)			,						
			"Base.1903Clip",	StdMag	* w308	- (w308 * x308)			- (StdMag* w308 * LEOxCIV)			,						
			"Base.545StdClip",	StdMag	* w545x39	- (w545x39 * x545x39)		- (StdMag * xSOV)	- (StdMag* w545x39 * LEOxCIV)			,						
			"Base.AKClip",	StdMag	* w762x39	- (w762x39 * x762x39)			- (StdMag* w762x39 * LEOxCIV)			,						
			"Base.ASVALClip",	ExtMag	* w9	- (w9 * x9)		- (ExtMag * xSOV)	- (ExtMag* w9 * LEOxCIV)			,						
			"Base.VSSClip",	StdMag	* w9	- (w9 * x9)		- (StdMag * xSOV)	- (StdMag* w9 * LEOxCIV)			,						
			"Base.57Clip",	StdMag	* w57	- (w57 * x57)		- (StdMag * xEUR)			- (StdMag* w57 * x90)	,						
			"Base.P90Clip",	StdMag	* w57	- (w57 * x57)		- (StdMag * xEUR)			- (StdMag* w57 * x90)	,						
			"Base.22Drum",	DrumMag	* w22	- (w22 * x22)			- (DrumMag* w22 * LEOxCIV)			,						
			"Base.9mmDrum",	DrumMag	* w9	- (w9 * x9)						,						
			"Base.45Drum",	DrumMag	* w45	- (w45 * x45)						,						
			"Base.556Drum",	DrumMag	* w556	- (w556 * x556)						,						
			"Base.545Drum",	DrumMag	* w545x39	- (w545x39 * x545x39)		- (DrumMag * xSOV)	- (DrumMag* w545x39 * LEOxCIV)			,						
			"Base.762Drum",	DrumMag	* w762x39	- (w762x39 * x762x39)			- (DrumMag* w762x39 * LEOxCIV)			,						
			"Base.12gDrum",	DrumMag	* w12g	- (w12g * x12g)						,						
			"Base.308Belt",	StdMag	* w308	- (w308 * x308)	- (wLMG * xLMG)			- (StdMag* w308 * LEOxMIL)		,						
			"Base.556Belt",	StdMag	* w556	- (w556 * x556)	- (wLMG * xLMG)			- (StdMag* w556 * LEOxMIL)		,						
			"Base.762x39Belt",	StdMag	* w762x39	- (w762x39 * x762x39)	- (wLMG * xLMG)			- (StdMag* w762x39 * LEOxMIL)		,						
			"Base.762x54rBelt",	StdMag	* w762x54r	- (w762x54r * x762x54r)	- (wLMG * xLMG)	- (StdMag * xSOV)		- (StdMag* w762x54r * LEOxMIL)		,						
			"Base.556MiniCan",	StdMag	* w556	- (w556 * x556)	- (wMINI * xMINI)	- (StdMag * xUSA)		- (StdMag* w556 * LEOxMIL)		,						
			"Base.308MiniCan",	StdMag	* w308	- (w308 * x308)	- (wMINI * xMINI)	- (StdMag * xUSA)		- (StdMag* w308 * LEOxMIL)		,						
			"Base.50MiniCan",	StdMag	* wBMG	- (wBMG * xBMG)	- (wMINI * xMINI)	- (StdMag * xUSA)		- (StdMag* wBMG * LEOxMIL)		,						
			"Base.M2A1_Tank",	ExtMag	* wFLAME	- (wFLAME * xFLAME)		- (ExtMag * xUSA)		- (ExtMag* wFLAME * LEOxMIL)		,						
			"Base.M2A1_Can",	StdMag	* wFLAME	- (wFLAME * xFLAME)		- (StdMag * xUSA)		- (StdMag* wFLAME * LEOxMIL)		,						
			"Base.AmmoCan30_22",	AmmoCan		* w22	- (w22 * x22)		- (AmmoCan * LEOxCIV)			,						
			"Base.AmmoCan30_380",	AmmoCan		* w380	- (w380 * x380)		- (AmmoCan * LEOxCIV)			,						
			"Base.AmmoCan30_57",	AmmoCan		* w57	- (w57 * x57)				- (AmmoCan * x90)	,						
			"Base.AmmoCan30_9",	AmmoCan		* w9	- (w9 * x9)					,						
			"Base.AmmoCan30_38",	AmmoCan		* w357	- (w357 * x357)		- (AmmoCan * LEOxCIV)			,						
			"Base.AmmoCan30_357",	AmmoCan		* w357	- (w357 * x357)					,						
			"Base.AmmoCan30_45",	AmmoCan		* w45	- (w45 * x45)					,						
			"Base.AmmoCan30_44",	AmmoCan		* w44	- (w44 * x44)		- (AmmoCan * LEOxCIV)			,						
			"Base.AmmoCan30_45LC",	AmmoCan		* w45LC	- (w45LC * x45LC)		- (AmmoCan * LEOxCIV)			,						
			"Base.AmmoCan30_4570",	AmmoCan		* w4570	- (w4570 * x4570)		- (AmmoCan * LEOxCIV)			,						
			"Base.AmmoCan30_50MAG",	AmmoCan		* wBMG	- (wBMG * xBMG)		- (AmmoCan * LEOxCIV)		- (AmmoCan * x90)	,						
			"Base.AmmoCan50_223",	AmmoCan		* w223	- (w223 * x223)					,						
			"Base.AmmoCan50_556",	AmmoCan		* w556	- (w556 * x556)					,						
			"Base.AmmoCan50_762x39",	AmmoCan		* w762x39	- (w762x39 * x762x39)		- (AmmoCan * LEOxCIV)			,						
			"Base.AmmoCan50_545x39",	AmmoCan		* w545x39	- (w545x39 * x545x39)		- (AmmoCan * LEOxCIV)			,						
			"Base.AmmoCan50_762x54r",	AmmoCan		* w762x54r	- (w762x54r * x762x54r)		- (AmmoCan * LEOxCIV)			,						
			"Base.AmmoCan50_308",	AmmoCan		* w308	- (w308 * x308)					,						
			"Base.AmmoCan50_3006",	AmmoCan		* w3006	- (w3006 * x3006)		- (AmmoCan * LEOxCIV)			,						
			"Base.AmmoCan50_410",	AmmoCan		* w45LC	- (w45LC * x45LC)		- (AmmoCan * LEOxCIV)			,						
			"Base.AmmoCan50_20",	AmmoCan		* w20g	- (w20g * x20g)		- (AmmoCan * LEOxCIV)			,						
			"Base.AmmoCan50_12",	AmmoCan		* w12g	- (w12g * x12g)					,						
			"Base.AmmoCan50_10",	AmmoCan		* w10g	- (w10g * x10g)		- (AmmoCan * LEOxCIV)			,						
			"Base.AmmoCan50_4",	AmmoCan		* w4g	- (w4g * x4g)		- (AmmoCan * LEOxCIV)			,						
			"Base.AmmoCan50_50",	AmmoCan		* wBMG	- (wBMG * xBMG)					,						
			"Base.AmmoCan50_HE",	AmmoCan		* wGREN	- (wGREN * xGREN)			- (AmmoCan * LEOxMIL)		,						
			"Base.AmmoCan50_INC",	AmmoCan		* wGREN	- (wGREN * xGREN)			- (AmmoCan * LEOxMIL)		,						
			"Base.RussianMachete",	LgKnife		- (LgKnife * xLgKnife)		- (LgKnife * xSOV)	- (LgKnife * LEOxCIV)			,						
			"Base.BGMachete",	LgKnife		- (LgKnife * xLgKnife)		- (LgKnife * xUSA)	- (LgKnife * LEOxCIV)			,						
			"Base.RamboKnife",	LgKnife		- (LgKnife * xLgKnife)		- (LgKnife * xUSA)	- (LgKnife * LEOxCIV)			,						
			"Base.Butterfly",	SmKnife		- (SmKnife * xSmKnife)		- (SmKnife * xPAC)				,						
			"Base.PushDagger",	SmKnife		- (SmKnife * xSmKnife)		- (SmKnife * xUSA)				,						
			"Base.Karambit",	SmKnife		- (SmKnife * xSmKnife)		- (SmKnife * xPAC)				,						
			"Base.Tactical_Axe",	Axe		- (Axe * xAxe)		- (Axe * xUSA)	- (Axe * LEOxCIV)			,						
			"Base.Tactical_Sickle",	Axe		- (Axe * xAxe)		- (Axe * xUSA)	- (Axe * LEOxCIV)			,						
			"Base.DingDong",	Blunt		- (Blunt * xBlunt)		- (Blunt * xUSA)				,						
			"Base.MilitaryBaton",	Blunt		- (Blunt * xBlunt)		- (Blunt * xUSA)				,						
			"Base.KillBill",	Sword		- (Sword * xSword)		- (Sword * xPAC)	- (Sword * LEOxCIV)			,						
			"Base.CH_WarSword",	Sword		- (Sword * xSword)		- (Sword * xPAC)	- (Sword * LEOxCIV)			,						
			"Base.Conan_Sword",	Sword		- (Sword * xSword)		- (Sword * xUSA)	- (Sword * LEOxCIV)			,						
		},																
		dontSpawnAmmo = 		 LEOammo	,													
	},																	
																		
	PoliceAmmo = {																	
		rolls =	LEORollAMMO	,														
		items = {																
			"Base.38Speed",	StdMag	* w357	- (w357 * x357)	- (StdMag * xREV)					,						
			"Base.44Speed",	StdMag	* w44	- (w44 * x44)	- (StdMag * xREV)		- (StdMag* w44 * LEOxCIV)			,						
			"Base.SRM1208_Cylinder",	StdMag	* w12g	- (w12g * x12g)	- (StdMag * xREV)	- (StdMag * xUSA)	- (StdMag* w12g * LEOxCIV)		- (StdMag* w12g * x90)	,						
			"Base.SRM1212_Cylinder",	StdMag	* w12g	- (w12g * x12g)	- (StdMag * xREV)	- (StdMag * xUSA)	- (StdMag* w12g * LEOxCIV)		- (StdMag* w12g * x90)	,						
			"Base.SRM1216_Cylinder",	StdMag	* w12g	- (w12g * x12g)	- (StdMag * xREV)	- (StdMag * xUSA)			- (StdMag* w12g * x90)	,						
			"Base.SIX12_Cylinder",	StdMag	* w12g	- (w12g * x12g)	- (StdMag * xREV)	- (StdMag * xUSA)			- (StdMag* w12g * x90)	,						
			"Base.CP33Clip",	StdMag	* w22	- (w22 * x22)		- (StdMag * xUSA)	- (StdMag* w22 * LEOxCIV)		- (StdMag* w22 * x90)	,						
			"Base.CP33_17MagBase",	ExtMag	* w22	- (w22 * x22)		- (ExtMag * xUSA)	- (ExtMag* w22 * LEOxCIV)		- (ExtMag* w22 * x90)	,						
			"Base.22Clip",	StdMag	* w22	- (w22 * x22)			- (StdMag* w22 * LEOxCIV)			,						
			"Base.22ExtClip",	ExtMag	* w22	- (w22 * x22)			- (ExtMag* w22 * LEOxCIV)			,						
			"Base.380Clip",	StdMag	* w380	- (w380 * x380)			- (StdMag* w380 * LEOxCIV)			,						
			"Base.380ExtClip",	ExtMag	* w380	- (w380 * x380)			- (ExtMag* w380 * LEOxCIV)			,						
			"Base.9mmClip",	StdMag	* w9	- (w9 * x9)						,						
			"Base.9mmExtClip",	ExtMag	* w9	- (w9 * x9)						,						
			"Base.45DSClip",	StdMag	* w45	- (w45 * x45)						,						
			"Base.45DSExtClip",	ExtMag	* w45	- (w45 * x45)						,						
			"Base.45Clip",	StdMag	* w45	- (w45 * x45)			- (StdMag* w45 * LEOxCIV)	- (StdMag* w45 * LEOxMIL)		,						
			"Base.45ExtClip",	ExtMag	* w45	- (w45 * x45)			- (ExtMag* w45 * LEOxCIV)	- (ExtMag* w45 * LEOxMIL)		,						
			"Base.44Clip",	StdMag	* w44	- (w44 * x44)			- (StdMag* w44 * LEOxCIV)			,						
			"Base.223StdClip",	StdMag	* w223	- (w223 * x223)						,						
			"Base.223ExtClip",	ExtMag	* w223	- (w223 * x223)						,						
			"Base.556Clip",	StdMag	* w556	- (w556 * x556)						,						
			"Base.308StdClip",	StdMag	* w308	- (w308 * x308)						,						
			"Base.308ExtClip",	ExtMag	* w308	- (w308 * x308)						,						
			"Base.3006ExtClip",	ExtMag	* w3006	- (w3006 * x3006)		- (ExtMag * xUSA)	- (ExtMag* w3006 * LEOxCIV)			,						
			"Base.SVDClip",	StdMag	* w762x54r	- (w762x54r * x762x54r)		- (StdMag * xSOV)	- (StdMag* w762x54r * LEOxCIV)			,						
			"Base.ASHClip",	StdMag	* wBMG	- (wBMG * xBMG)		- (StdMag * xSOV)	- (StdMag* wBMG * LEOxCIV)		- (StdMag* wBMG * x90)	,						
			"Base.M82Clip",	StdMag	* wBMG	- (wBMG * xBMG)		- (StdMag * xUSA)		- (StdMag* wBMG * LEOxMIL)		,						
			"Base.M1Clip",	StdMag	* w3006	- (w3006 * x3006)		- (StdMag * xUSA)	- (StdMag* w3006 * LEOxCIV)			,						
			"Base.SKSClip",	StdMag	* w762x39	- (w762x39 * x762x39)		- (StdMag * xSOV)	- (StdMag* w762x39 * LEOxCIV)			,						
			"Base.1903Clip",	StdMag	* w308	- (w308 * x308)			- (StdMag* w308 * LEOxCIV)			,						
			"Base.545StdClip",	StdMag	* w545x39	- (w545x39 * x545x39)		- (StdMag * xSOV)	- (StdMag* w545x39 * LEOxCIV)			,						
			"Base.AKClip",	StdMag	* w762x39	- (w762x39 * x762x39)			- (StdMag* w762x39 * LEOxCIV)			,						
			"Base.ASVALClip",	ExtMag	* w9	- (w9 * x9)		- (ExtMag * xSOV)	- (ExtMag* w9 * LEOxCIV)			,						
			"Base.VSSClip",	StdMag	* w9	- (w9 * x9)		- (StdMag * xSOV)	- (StdMag* w9 * LEOxCIV)			,						
			"Base.57Clip",	StdMag	* w57	- (w57 * x57)		- (StdMag * xEUR)			- (StdMag* w57 * x90)	,						
			"Base.P90Clip",	StdMag	* w57	- (w57 * x57)		- (StdMag * xEUR)			- (StdMag* w57 * x90)	,						
			"Base.22Drum",	DrumMag	* w22	- (w22 * x22)			- (DrumMag* w22 * LEOxCIV)			,						
			"Base.9mmDrum",	DrumMag	* w9	- (w9 * x9)						,						
			"Base.45Drum",	DrumMag	* w45	- (w45 * x45)						,						
			"Base.556Drum",	DrumMag	* w556	- (w556 * x556)						,						
			"Base.545Drum",	DrumMag	* w545x39	- (w545x39 * x545x39)		- (DrumMag * xSOV)	- (DrumMag* w545x39 * LEOxCIV)			,						
			"Base.762Drum",	DrumMag	* w762x39	- (w762x39 * x762x39)			- (DrumMag* w762x39 * LEOxCIV)			,						
			"Base.12gDrum",	DrumMag	* w12g	- (w12g * x12g)						,						
			"Base.308Belt",	StdMag	* w308	- (w308 * x308)	- (wLMG * xLMG)			- (StdMag* w308 * LEOxMIL)		,						
			"Base.556Belt",	StdMag	* w556	- (w556 * x556)	- (wLMG * xLMG)			- (StdMag* w556 * LEOxMIL)		,						
			"Base.762x39Belt",	StdMag	* w762x39	- (w762x39 * x762x39)	- (wLMG * xLMG)			- (StdMag* w762x39 * LEOxMIL)		,						
			"Base.762x54rBelt",	StdMag	* w762x54r	- (w762x54r * x762x54r)	- (wLMG * xLMG)	- (StdMag * xSOV)		- (StdMag* w762x54r * LEOxMIL)		,						
			"Base.556MiniCan",	StdMag	* w556	- (w556 * x556)	- (wMINI * xMINI)	- (StdMag * xUSA)		- (StdMag* w556 * LEOxMIL)		,						
			"Base.308MiniCan",	StdMag	* w308	- (w308 * x308)	- (wMINI * xMINI)	- (StdMag * xUSA)		- (StdMag* w308 * LEOxMIL)		,						
			"Base.50MiniCan",	StdMag	* wBMG	- (wBMG * xBMG)	- (wMINI * xMINI)	- (StdMag * xUSA)		- (StdMag* wBMG * LEOxMIL)		,						
			"Base.M2A1_Tank",	ExtMag	* wFLAME	- (wFLAME * xFLAME)		- (ExtMag * xUSA)		- (ExtMag* wFLAME * LEOxMIL)		,						
			"Base.M2A1_Can",	StdMag	* wFLAME	- (wFLAME * xFLAME)		- (StdMag * xUSA)		- (StdMag* wFLAME * LEOxMIL)		,						
			"Base.AmmoCan30_22",	AmmoCan		* w22	- (w22 * x22)		- (AmmoCan * LEOxCIV)			,						
			"Base.AmmoCan30_380",	AmmoCan		* w380	- (w380 * x380)		- (AmmoCan * LEOxCIV)			,						
			"Base.AmmoCan30_57",	AmmoCan		* w57	- (w57 * x57)				- (AmmoCan * x90)	,						
			"Base.AmmoCan30_9",	AmmoCan		* w9	- (w9 * x9)					,						
			"Base.AmmoCan30_38",	AmmoCan		* w357	- (w357 * x357)		- (AmmoCan * LEOxCIV)			,						
			"Base.AmmoCan30_357",	AmmoCan		* w357	- (w357 * x357)					,						
			"Base.AmmoCan30_45",	AmmoCan		* w45	- (w45 * x45)					,						
			"Base.AmmoCan30_44",	AmmoCan		* w44	- (w44 * x44)		- (AmmoCan * LEOxCIV)			,						
			"Base.AmmoCan30_45LC",	AmmoCan		* w45LC	- (w45LC * x45LC)		- (AmmoCan * LEOxCIV)			,						
			"Base.AmmoCan30_4570",	AmmoCan		* w4570	- (w4570 * x4570)		- (AmmoCan * LEOxCIV)			,						
			"Base.AmmoCan30_50MAG",	AmmoCan		* wBMG	- (wBMG * xBMG)		- (AmmoCan * LEOxCIV)		- (AmmoCan * x90)	,						
			"Base.AmmoCan50_223",	AmmoCan		* w223	- (w223 * x223)					,						
			"Base.AmmoCan50_556",	AmmoCan		* w556	- (w556 * x556)					,						
			"Base.AmmoCan50_762x39",	AmmoCan		* w762x39	- (w762x39 * x762x39)		- (AmmoCan * LEOxCIV)			,						
			"Base.AmmoCan50_545x39",	AmmoCan		* w545x39	- (w545x39 * x545x39)		- (AmmoCan * LEOxCIV)			,						
			"Base.AmmoCan50_762x54r",	AmmoCan		* w762x54r	- (w762x54r * x762x54r)		- (AmmoCan * LEOxCIV)			,						
			"Base.AmmoCan50_308",	AmmoCan		* w308	- (w308 * x308)					,						
			"Base.AmmoCan50_3006",	AmmoCan		* w3006	- (w3006 * x3006)		- (AmmoCan * LEOxCIV)			,						
			"Base.AmmoCan50_410",	AmmoCan		* w45LC	- (w45LC * x45LC)		- (AmmoCan * LEOxCIV)			,						
			"Base.AmmoCan50_20",	AmmoCan		* w20g	- (w20g * x20g)		- (AmmoCan * LEOxCIV)			,						
			"Base.AmmoCan50_12",	AmmoCan		* w12g	- (w12g * x12g)					,						
			"Base.AmmoCan50_10",	AmmoCan		* w10g	- (w10g * x10g)		- (AmmoCan * LEOxCIV)			,						
			"Base.AmmoCan50_4",	AmmoCan		* w4g	- (w4g * x4g)		- (AmmoCan * LEOxCIV)			,						
			"Base.AmmoCan50_50",	AmmoCan		* wBMG	- (wBMG * xBMG)					,						
			"Base.AmmoCan50_HE",	AmmoCan		* wGREN	- (wGREN * xGREN)			- (AmmoCan * LEOxMIL)		,						
			"Base.AmmoCan50_INC",	AmmoCan		* wGREN	- (wGREN * xGREN)			- (AmmoCan * LEOxMIL)		,						
			"Base.BB177Box",	AmmoBox		* wBB	- (wBB * xBB)		- (AmmoBox * LEOxCIV)			,						
			"Base.Bullets22Box",	AmmoBox		* w22	- (w22 * x22)		- (AmmoBox * LEOxCIV)			,						
			"Base.Bullets380Box",	AmmoBox		* w380	- (w380 * x380)		- (AmmoBox * LEOxCIV)			,						
			"Base.Bullets57Box",	AmmoBox		* w57	- (w57 * x57)		- (AmmoBox * LEOxCIV)		- (AmmoBox * x90)	,						
			"Base.Bullets9mmBox",	AmmoBox		* w9	- (w9 * x9)					,						
			"Base.Bullets38Box",	AmmoBox		* w357	- (w357 * x357)					,						
			"Base.Bullets357Box",	AmmoBox		* w357	- (w357 * x357)					,						
			"Base.Bullets45Box",	AmmoBox		* w45	- (w45 * x45)					,						
			"Base.Bullets44Box",	AmmoBox		* w44	- (w44 * x44)		- (AmmoBox * LEOxCIV)			,						
			"Base.Bullets45LCBox",	AmmoBox		* w45LC	- (w45LC * x45LC)		- (AmmoBox * LEOxCIV)			,						
			"Base.Bullets4570Box",	AmmoBox		* w4570	- (w4570 * x4570)		- (AmmoBox * LEOxCIV)			,						
			"Base.Bullets50MAGBox",	AmmoBox		* wBMG	- (wBMG * xBMG)		- (AmmoBox * LEOxCIV)		- (AmmoBox * x90)	,						
			"Base.223Box",	AmmoBox		* w223	- (w223 * x223)					,						
			"Base.556Box",	AmmoBox		* w556	- (w556 * x556)					,						
			"Base.762x39Box",	AmmoBox		* w762x39	- (w762x39 * x762x39)		- (AmmoBox * LEOxCIV)			,						
			"Base.545x39Box",	AmmoBox		* w545x39	- (w545x39 * x545x39)		- (AmmoBox * LEOxCIV)			,						
			"Base.762x54rBox",	AmmoBox		* w762x54r	- (w762x54r * x762x54r)		- (AmmoBox * LEOxCIV)			,						
			"Base.308Box",	AmmoBox		* w308	- (w308 * x308)					,						
			"Base.3006Box",	AmmoBox		* w3006	- (w3006 * x3006)		- (AmmoBox * LEOxCIV)			,						
			"Base.410gShotgunShellsBox",	AmmoBox		* w45LC	- (w45LC * x45LC)		- (AmmoBox * LEOxCIV)			,						
			"Base.20gShotgunShellsBox",	AmmoBox		* w20g	- (w20g * x20g)		- (AmmoBox * LEOxCIV)			,						
			"Base.ShotgunShellsBox",	AmmoBox		* w12g	- (w12g * x12g)					,						
			"Base.10gShotgunShellsBox",	AmmoBox		* w10g	- (w10g * x10g)		- (AmmoBox * LEOxCIV)			,						
			"Base.4gShotgunShellsBox",	AmmoBox		* w4g	- (w4g * x4g)		- (AmmoBox * LEOxCIV)			,						
			"Base.50BMGBox",	AmmoBox		* wBMG	- (wBMG * xBMG)		- (AmmoBox * LEOxCIV)			,						
			"Base.Bolt_Bear",	AmmoBox		* wBOW	- (wBOW * xBOW)		- (AmmoBox * LEOxCIV)			,						
			"Base.Bolt_Bear_Pack",	AmmoBox		* wBOW	- (wBOW * xBOW)		- (AmmoBox * LEOxCIV)			,						
			"Base.40HERound",	AmmoBox		* wGREN	- (wGREN * xGREN)			- (AmmoBox * LEOxMIL)		,						
			"Base.40INCRound",	AmmoBox		* wGREN	- (wGREN * xGREN)			- (AmmoBox * LEOxMIL)		,						
			"Base.PolyCan_Red_SPASClip",	StdMag	 * PolyCan	* w12g	- (w12g * x12g)					,						
			"Base.PolyCan_Red_12gDrum",	DrumMag	 * PolyCan	* w12g	- (w12g * x12g)					,						
			"Base.PolyCan_Red_38Speed",	StdMag	 * PolyCan	* w357	- (w357 * x357)	- (StdMag * xREV)				,						
			"Base.PolyCan_Red_44Speed",	StdMag	 * PolyCan	* w44	- (w44 * x44)	- (StdMag * xREV)	- (StdMag * LEOxCIV)			,						
			"Base.PolyCan_Blue_9mmClip",	StdMag	 * PolyCan	* w9	- (w9 * x9)					,						
			"Base.PolyCan_Blue_9mmExtClip",	ExtMag	 * PolyCan	* w9	- (w9 * x9)					,						
			"Base.PolyCan_Blue_9mmDrum",	DrumMag	 * PolyCan	* w9	- (w9 * x9)					,						
			"Base.PolyCan_Blue_45DSClip",	StdMag	 * PolyCan	* w45	- (w45 * x45)					,						
			"Base.PolyCan_Blue_45DSExtClip",	ExtMag	 * PolyCan	* w45	- (w45 * x45)					,						
			"Base.PolyCan_Blue_45Drum",	DrumMag	 * PolyCan	* w45	- (w45 * x45)					,						
			"Base.PolyCan_Blue_45Clip",	StdMag	 * PolyCan	* w45	- (w45 * x45)		- (StdMag * LEOxCIV)			,						
			"Base.PolyCan_Blue_45ExtClip",	ExtMag	 * PolyCan	* w45	- (w45 * x45)		- (ExtMag * LEOxCIV)			,						
			"Base.PolyCan_Brown_556Clip",	StdMag	 * PolyCan	* w556	- (w556 * x556)					,						
			"Base.PolyCan_Brown_556Drum",	DrumMag	 * PolyCan	* w556	- (w556 * x556)					,						
			"Base.PolyCan_Brown_AKClip",	StdMag	 * PolyCan	* w762x39	- (w762x39 * x762x39)		- (StdMag * LEOxCIV)			,						
			"Base.PolyCan_Brown_762Drum",	DrumMag	 * PolyCan	* w762x39	- (w762x39 * x762x39)		- (DrumMag * LEOxCIV)			,						
			"Base.PolyCan_Brown_545StdClip",	StdMag	 * PolyCan	* w545x39	- (w545x39 * x545x39)		- (StdMag * LEOxCIV)			,						
			"Base.PolyCan_Brown_545Drum",	DrumMag	 * PolyCan	* w545x39	- (w545x39 * x545x39)		- (DrumMag * LEOxCIV)			,						
			"Base.PolyCan_Beige_308StdClip",	StdMag	 * PolyCan	* w308	- (w308 * x308)					,						
			"Base.PolyCan_Beige_308ExtClip",	ExtMag	 * PolyCan	* w308	- (w308 * x308)					,						
			"Base.PolyCan_Beige_BMG",	StdMag	 * PolyCan	* wBMG	- (wBMG * xBMG)			- (StdMag * PolyCan * LEOxMIL)		,						
			"Base.PolyCan_Beige_K11",	StdMag	 * PolyCan	* wGREN	- (wGREN * xGREN)	- (StdMag * xKOR)		- (StdMag * PolyCan * LEOxMIL)	- (StdMag * x90)	,						
			"Base.PolyCan_Beige_SVDClip",	StdMag	 * PolyCan	* w762x54r	- (w762x54r * x762x54r)	- (StdMag * xSOV)	- (StdMag * LEOxCIV)	- (StdMag * PolyCan * LEOxMIL)		,						
			"Base.PolyCan_Beige_SKSClip",	StdMag	 * PolyCan	* w762x39	- (w762x39 * x762x39)	- (StdMag * xSOV)	- (StdMag * LEOxCIV)	- (StdMag * PolyCan * LEOxMIL)		,						
			"Base.PolyCan_Beige_M1Clip",	StdMag	 * PolyCan	* w3006	- (w3006 * x3006)	- (StdMag * xUSA)	- (StdMag * LEOxCIV)	- (StdMag * PolyCan * LEOxMIL)		,						
			"Base.PolyCan_Beige_1903Clip",	StdMag	 * PolyCan	* w308	- (w308 * x308)		- (StdMag * LEOxCIV)	- (StdMag * PolyCan * LEOxMIL)		,						
		}																
	},																	
																		
																		
	ArmyStorageGuns = {		-- ArmyGuns															
		rolls =	MILRollGUN	,														
		items = {																
			"Base.UmarexSS",	wBB	 * MILx	- (wBB * xBB)		- (wBB * MILx * xUSA)	- (wBB * MILx * MILxNON)	- (wBB * MILx * MILxUSA)	- (wBB * MILx * MILxSOV)	- (wBB * MILx * MILxCZE)	- (wBB * MILx * MILxKOR)	- (wBB * MILx * MILxPAC)	- (wBB * MILx * MILxEUR)	- (wBB * MILx * MILxISR)	- (wBB * MILx * x90)	,
			"Base.Benjamin_M397",	wBB	 * MILx	- (wBB * xBB)		- (wBB * MILx * xUSA)	- (wBB * MILx * MILxNON)	- (wBB * MILx * MILxUSA)	- (wBB * MILx * MILxSOV)	- (wBB * MILx * MILxCZE)	- (wBB * MILx * MILxKOR)	- (wBB * MILx * MILxPAC)	- (wBB * MILx * MILxEUR)	- (wBB * MILx * MILxISR)		,
			"Base.RWS_M34",	wBB	 * MILx	- (wBB * xBB)		- (wBB * MILx * xUSA)	- (wBB * MILx * MILxNON)	- (wBB * MILx * MILxUSA)	- (wBB * MILx * MILxSOV)	- (wBB * MILx * MILxCZE)	- (wBB * MILx * MILxKOR)	- (wBB * MILx * MILxPAC)	- (wBB * MILx * MILxEUR)	- (wBB * MILx * MILxISR)	- (wBB * MILx * x90)	,
			"Base.CP33",	w22	 * MILx	- (w22 * x22)	- (w22 * MILx * xSEMI)	- (w22 * MILx * xUSA)	- (w22 * MILx * MILxNON)	- (w22 * MILx * MILxUSA)	- (w22 * MILx * MILxSOV)	- (w22 * MILx * MILxCZE)	- (w22 * MILx * MILxKOR)	- (w22 * MILx * MILxPAC)	- (w22 * MILx * MILxEUR)	- (w22 * MILx * MILxISR)	- (w22 * MILx * x90)	,
			"Base.Ruger_MK4",	w22	 * MILx	- (w22 * x22)	- (w22 * MILx * xSEMI)	- (w22 * MILx * xUSA)	- (w22 * MILx * MILxNON)	- (w22 * MILx * MILxUSA)	- (w22 * MILx * MILxSOV)	- (w22 * MILx * MILxCZE)	- (w22 * MILx * MILxKOR)	- (w22 * MILx * MILxPAC)	- (w22 * MILx * MILxEUR)	- (w22 * MILx * MILxISR)	- (w22 * MILx * x90)	,
			"Base.Buckmark",	w22	 * MILx	- (w22 * x22)	- (w22 * MILx * xSEMI)	- (w22 * MILx * xUSA)	- (w22 * MILx * MILxNON)	- (w22 * MILx * MILxUSA)	- (w22 * MILx * MILxSOV)	- (w22 * MILx * MILxCZE)	- (w22 * MILx * MILxKOR)	- (w22 * MILx * MILxPAC)	- (w22 * MILx * MILxEUR)	- (w22 * MILx * MILxISR)		,
			"Base.Buckmark_Long",	w22	 * MILx	- (w22 * x22)	- (w22 * MILx * xSEMI)	- (w22 * MILx * xUSA)	- (w22 * MILx * MILxNON)	- (w22 * MILx * MILxUSA)	- (w22 * MILx * MILxSOV)	- (w22 * MILx * MILxCZE)	- (w22 * MILx * MILxKOR)	- (w22 * MILx * MILxPAC)	- (w22 * MILx * MILxEUR)	- (w22 * MILx * MILxISR)		,
			"Base.Buckmark_Carbine",	w22	 * MILx	- (w22 * x22)	- (w22 * MILx * xSEMI)	- (w22 * MILx * xUSA)	- (w22 * MILx * MILxNON)	- (w22 * MILx * MILxUSA)	- (w22 * MILx * MILxSOV)	- (w22 * MILx * MILxCZE)	- (w22 * MILx * MILxKOR)	- (w22 * MILx * MILxPAC)	- (w22 * MILx * MILxEUR)	- (w22 * MILx * MILxISR)		,
			"Base.HK4_22",	w22	 * MILx	- (w22 * x22)	- (w22 * MILx * xSEMI)	- (w22 * MILx * xEUR)	- (w22 * MILx * MILxNON)	- (w22 * MILx * MILxUSA)	- (w22 * MILx * MILxSOV)	- (w22 * MILx * MILxCZE)	- (w22 * MILx * MILxKOR)	- (w22 * MILx * MILxPAC)	- (w22 * MILx * MILxEUR)	- (w22 * MILx * MILxISR)		,
			"Base.ZIP22",	w22	 * MILx	- (w22 * x22)	- (w22 * MILx * xSEMI)	- (w22 * MILx * xUSA)	- (w22 * MILx * MILxNON)	- (w22 * MILx * MILxUSA)	- (w22 * MILx * MILxSOV)	- (w22 * MILx * MILxCZE)	- (w22 * MILx * MILxKOR)	- (w22 * MILx * MILxPAC)	- (w22 * MILx * MILxEUR)	- (w22 * MILx * MILxISR)	- (w22 * MILx * x90)	,
			"Base.Ruger_1022",	w22	 * MILx	- (w22 * x22)	- (w22 * MILx * xSEMI)	- (w22 * MILx * xUSA)		- (w22 * MILx * MILxUSA)	- (w22 * MILx * MILxSOV)	- (w22 * MILx * MILxCZE)	- (w22 * MILx * MILxKOR)	- (w22 * MILx * MILxPAC)	- (w22 * MILx * MILxEUR)			,
			"Base.Marlin_M70",	w22	 * MILx	- (w22 * x22)	- (w22 * MILx * xSEMI)	- (w22 * MILx * xUSA)	- (w22 * MILx * MILxNON)	- (w22 * MILx * MILxUSA)	- (w22 * MILx * MILxSOV)	- (w22 * MILx * MILxCZE)	- (w22 * MILx * MILxKOR)	- (w22 * MILx * MILxPAC)	- (w22 * MILx * MILxEUR)	- (w22 * MILx * MILxISR)		,
			"Base.Cricket_22",	w22	 * MILx	- (w22 * x22)	- (w22 * MILx * xBOLT)	- (w22 * MILx * xUSA)	- (w22 * MILx * MILxNON)	- (w22 * MILx * MILxUSA)	- (w22 * MILx * MILxSOV)	- (w22 * MILx * MILxCZE)	- (w22 * MILx * MILxKOR)	- (w22 * MILx * MILxPAC)	- (w22 * MILx * MILxEUR)	- (w22 * MILx * MILxISR)		,
			"Base.AR7",	w22	 * MILx	- (w22 * x22)	- (w22 * MILx * xSEMI)	- (w22 * MILx * xUSA)	- (w22 * MILx * MILxNON)	- (w22 * MILx * MILxUSA)	- (w22 * MILx * MILxSOV)	- (w22 * MILx * MILxCZE)	- (w22 * MILx * MILxKOR)	- (w22 * MILx * MILxPAC)	- (w22 * MILx * MILxEUR)	- (w22 * MILx * MILxISR)		,
			"Base.Calico_22LR",	w22	 * MILx	- (w22 * x22)	- (w22 * MILx * xSMG)	- (w22 * MILx * xUSA)	- (w22 * MILx * MILxNON)	- (w22 * MILx * MILxUSA)	- (w22 * MILx * MILxSOV)	- (w22 * MILx * MILxCZE)	- (w22 * MILx * MILxKOR)	- (w22 * MILx * MILxPAC)	- (w22 * MILx * MILxEUR)	- (w22 * MILx * MILxISR)		,
			"Base.American180",	w22	 * MILx	- (w22 * x22)	- (w22 * MILx * xSMG)	- (w22 * MILx * xUSA)	- (w22 * MILx * MILxNON)	- (w22 * MILx * MILxUSA)	- (w22 * MILx * MILxSOV)	- (w22 * MILx * MILxCZE)	- (w22 * MILx * MILxKOR)	- (w22 * MILx * MILxPAC)	- (w22 * MILx * MILxEUR)	- (w22 * MILx * MILxISR)		,
			"Base.Winchester1903",	w22	 * MILx	- (w22 * x22)	- (w22 * MILx * xLEVER)	- (w22 * MILx * xUSA)	- (w22 * MILx * MILxNON)	- (w22 * MILx * MILxUSA)	- (w22 * MILx * MILxSOV)	- (w22 * MILx * MILxCZE)	- (w22 * MILx * MILxKOR)	- (w22 * MILx * MILxPAC)	- (w22 * MILx * MILxEUR)	- (w22 * MILx * MILxISR)		,
			"Base.G42",	w380	 * MILx	- (w380 * x380)	- (w380 * MILx * xSEMI)	- (w380 * MILx * xEUR)	- (w380 * MILx * MILxNON)	- (w380 * MILx * MILxUSA)	- (w380 * MILx * MILxSOV)	- (w380 * MILx * MILxCZE)	- (w380 * MILx * MILxKOR)	- (w380 * MILx * MILxPAC)	- (w380 * MILx * MILxEUR)	- (w380 * MILx * MILxISR)	- (w380 * MILx * x90)	,
			"Base.LCP380",	w380	 * MILx	- (w380 * x380)	- (w380 * MILx * xSEMI)	- (w380 * MILx * xUSA)	- (w380 * MILx * MILxNON)	- (w380 * MILx * MILxUSA)	- (w380 * MILx * MILxSOV)	- (w380 * MILx * MILxCZE)	- (w380 * MILx * MILxKOR)	- (w380 * MILx * MILxPAC)	- (w380 * MILx * MILxEUR)	- (w380 * MILx * MILxISR)	- (w380 * MILx * x90)	,
			"Base.BodyGuard380",	w380	 * MILx	- (w380 * x380)	- (w380 * MILx * xSEMI)	- (w380 * MILx * xUSA)	- (w380 * MILx * MILxNON)	- (w380 * MILx * MILxUSA)	- (w380 * MILx * MILxSOV)	- (w380 * MILx * MILxCZE)	- (w380 * MILx * MILxKOR)	- (w380 * MILx * MILxPAC)	- (w380 * MILx * MILxEUR)	- (w380 * MILx * MILxISR)	- (w380 * MILx * x90)	,
			"Base.Bersa85F",	w380	 * MILx	- (w380 * x380)	- (w380 * MILx * xSEMI)	- (w380 * MILx * xREST)	- (w380 * MILx * MILxNON)	- (w380 * MILx * MILxUSA)	- (w380 * MILx * MILxSOV)	- (w380 * MILx * MILxCZE)	- (w380 * MILx * MILxKOR)	- (w380 * MILx * MILxPAC)	- (w380 * MILx * MILxEUR)	- (w380 * MILx * MILxISR)		,
			"Base.Colt1903",	w380	 * MILx	- (w380 * x380)	- (w380 * MILx * xSEMI)	- (w380 * MILx * xUSA)	- (w380 * MILx * MILxNON)	- (w380 * MILx * MILxUSA)	- (w380 * MILx * MILxSOV)	- (w380 * MILx * MILxCZE)	- (w380 * MILx * MILxKOR)	- (w380 * MILx * MILxPAC)	- (w380 * MILx * MILxEUR)	- (w380 * MILx * MILxISR)		,
			"Base.Makarov380",	w380	 * MILx	- (w380 * x380)	- (w380 * MILx * xSEMI)	- (w380 * MILx * xSOV)		- (w380 * MILx * MILxUSA)		- (w380 * MILx * MILxCZE)	- (w380 * MILx * MILxKOR)		- (w380 * MILx * MILxEUR)	- (w380 * MILx * MILxISR)		,
			"Base.PPK",	w380	 * MILx	- (w380 * x380)	- (w380 * MILx * xSEMI)	- (w380 * MILx * xEUR)		- (w380 * MILx * MILxUSA)	- (w380 * MILx * MILxSOV)	- (w380 * MILx * MILxCZE)	- (w380 * MILx * MILxKOR)	- (w380 * MILx * MILxPAC)		- (w380 * MILx * MILxISR)		,
			"Base.HK4_380",	w380	 * MILx	- (w380 * x380)	- (w380 * MILx * xSEMI)	- (w380 * MILx * xEUR)	- (w380 * MILx * MILxNON)	- (w380 * MILx * MILxUSA)	- (w380 * MILx * MILxSOV)	- (w380 * MILx * MILxCZE)	- (w380 * MILx * MILxKOR)	- (w380 * MILx * MILxPAC)	- (w380 * MILx * MILxEUR)	- (w380 * MILx * MILxISR)		,
			"Base.VP70",	w380	 * MILx	- (w380 * x380)	- (w380 * MILx * xSMG)	- (w380 * MILx * xEUR)	- (w380 * MILx * MILxNON)	- (w380 * MILx * MILxUSA)	- (w380 * MILx * MILxSOV)	- (w380 * MILx * MILxCZE)	- (w380 * MILx * MILxKOR)	- (w380 * MILx * MILxPAC)	- (w380 * MILx * MILxEUR)	- (w380 * MILx * MILxISR)		,
			"Base.VP70_Stock",	w380	 * MILx	- (w380 * x380)	- (w380 * MILx * xSMG)	- (w380 * MILx * xEUR)	- (w380 * MILx * MILxNON)	- (w380 * MILx * MILxUSA)	- (w380 * MILx * MILxSOV)	- (w380 * MILx * MILxCZE)	- (w380 * MILx * MILxKOR)	- (w380 * MILx * MILxPAC)	- (w380 * MILx * MILxEUR)	- (w380 * MILx * MILxISR)		,
			"Base.Vz61_Fixed",	w380	 * MILx	- (w380 * x380)	- (w380 * MILx * xSMG)	- (w380 * MILx * xCZE)		- (w380 * MILx * MILxUSA)	- (w380 * MILx * MILxSOV)		- (w380 * MILx * MILxKOR)	- (w380 * MILx * MILxPAC)	- (w380 * MILx * MILxEUR)			,
			"Base.Vz61_Fold",	w380	 * MILx	- (w380 * x380)	- (w380 * MILx * xSMG)	- (w380 * MILx * xCZE)		- (w380 * MILx * MILxUSA)	- (w380 * MILx * MILxSOV)		- (w380 * MILx * MILxKOR)	- (w380 * MILx * MILxPAC)	- (w380 * MILx * MILxEUR)			,
			"Base.BT380_Stock",	w380	 * MILx	- (w380 * x380)	- (w380 * MILx * xSEMI)	- (w380 * MILx * xEUR)	- (w380 * MILx * MILxNON)	- (w380 * MILx * MILxUSA)	- (w380 * MILx * MILxSOV)	- (w380 * MILx * MILxCZE)	- (w380 * MILx * MILxKOR)	- (w380 * MILx * MILxPAC)	- (w380 * MILx * MILxEUR)	- (w380 * MILx * MILxISR)	- (w380 * MILx * x90)	,
			"Base.FN_57", 	w57	 * MILx	- (w57 * x57)	- (w57 * MILx * xSEMI)	- (w57 * MILx * xEUR)	- (w57 * MILx * MILxNON)	- (w57 * MILx * MILxUSA)	- (w57 * MILx * MILxSOV)	- (w57 * MILx * MILxCZE)	- (w57 * MILx * MILxKOR)	- (w57 * MILx * MILxPAC)	- (w57 * MILx * MILxEUR)	- (w57 * MILx * MILxISR)	- (w57 * MILx * x90)	,
			"Base.FN_57_MK2", 	w57	 * MILx	- (w57 * x57)	- (w57 * MILx * xSEMI)	- (w57 * MILx * xEUR)	- (w57 * MILx * MILxNON)	- (w57 * MILx * MILxUSA)	- (w57 * MILx * MILxSOV)	- (w57 * MILx * MILxCZE)	- (w57 * MILx * MILxKOR)	- (w57 * MILx * MILxPAC)	- (w57 * MILx * MILxEUR)	- (w57 * MILx * MILxISR)	- (w57 * MILx * x90)	,
			"Base.FN_P90",	w57	 * MILx	- (w57 * x57)	- (w57 * MILx * xSMG)	- (w57 * MILx * xEUR)	- (w57 * MILx * MILxNON)	- (w57 * MILx * MILxUSA)	- (w57 * MILx * MILxSOV)	- (w57 * MILx * MILxCZE)	- (w57 * MILx * MILxKOR)	- (w57 * MILx * MILxPAC)	- (w57 * MILx * MILxEUR)	- (w57 * MILx * MILxISR)	- (w57 * MILx * x90)	,
			"Base.FN_PS90",	w57	 * MILx	- (w57 * x57)	- (w57 * MILx * xSMG)	- (w57 * MILx * xEUR)	- (w57 * MILx * MILxNON)	- (w57 * MILx * MILxUSA)	- (w57 * MILx * MILxSOV)	- (w57 * MILx * MILxCZE)	- (w57 * MILx * MILxKOR)	- (w57 * MILx * MILxPAC)	- (w57 * MILx * MILxEUR)	- (w57 * MILx * MILxISR)	- (w57 * MILx * x90)	,
			"Base.CZ75",	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSEMI)	- (w9 * MILx * xCZE)		- (w9 * MILx * MILxUSA)	- (w9 * MILx * MILxSOV)			- (w9 * MILx * MILxPAC)	- (w9 * MILx * MILxEUR)			,
			"Base.G17",	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSEMI)	- (w9 * MILx * xEUR)			- (w9 * MILx * MILxSOV)			- (w9 * MILx * MILxPAC)				,
			"Base.G18",	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSMG)	- (w9 * MILx * xEUR)			- (w9 * MILx * MILxSOV)			- (w9 * MILx * MILxPAC)				,
			"Base.G34", 	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSEMI)	- (w9 * MILx * xUSA)	- (w9 * MILx * MILxNON)	- (w9 * MILx * MILxUSA)	- (w9 * MILx * MILxSOV)	- (w9 * MILx * MILxCZE)	- (w9 * MILx * MILxKOR)	- (w9 * MILx * MILxPAC)	- (w9 * MILx * MILxEUR)	- (w9 * MILx * MILxISR)	- (w9 * MILx * x90)	,
			"Base.K5",	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSEMI)	- (w9 * MILx * xKOR)		- (w9 * MILx * MILxUSA)	- (w9 * MILx * MILxSOV)	- (w9 * MILx * MILxCZE)		- (w9 * MILx * MILxPAC)	- (w9 * MILx * MILxEUR)	- (w9 * MILx * MILxISR)		,
			"Base.M9",	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSEMI)	- (w9 * MILx * xEUR)			- (w9 * MILx * MILxSOV)	- (w9 * MILx * MILxCZE)		- (w9 * MILx * MILxPAC)	- (w9 * MILx * MILxEUR)			,
			"Base.M9A3",	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSEMI)	- (w9 * MILx * xEUR)			- (w9 * MILx * MILxSOV)	- (w9 * MILx * MILxCZE)		- (w9 * MILx * MILxPAC)	- (w9 * MILx * MILxEUR)		- (w9 * MILx * x90)	,
			"Base.B93R",	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSMG)	- (w9 * MILx * xEUR)			- (w9 * MILx * MILxSOV)	- (w9 * MILx * MILxCZE)		- (w9 * MILx * MILxPAC)	- (w9 * MILx * MILxEUR)			,
			"Base.M5906",	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSEMI)	- (w9 * MILx * xUSA)	- (w9 * MILx * MILxNON)	- (w9 * MILx * MILxUSA)	- (w9 * MILx * MILxSOV)	- (w9 * MILx * MILxCZE)	- (w9 * MILx * MILxKOR)	- (w9 * MILx * MILxPAC)	- (w9 * MILx * MILxEUR)	- (w9 * MILx * MILxISR)		,
			"Base.XD9",	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSEMI)	- (w9 * MILx * xUSA)	- (w9 * MILx * MILxNON)	- (w9 * MILx * MILxUSA)	- (w9 * MILx * MILxSOV)	- (w9 * MILx * MILxCZE)	- (w9 * MILx * MILxKOR)	- (w9 * MILx * MILxPAC)	- (w9 * MILx * MILxEUR)	- (w9 * MILx * MILxISR)	- (w9 * MILx * x90)	,
			"Base.MP9",	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSEMI)	- (w9 * MILx * xUSA)	- (w9 * MILx * MILxNON)	- (w9 * MILx * MILxUSA)	- (w9 * MILx * MILxSOV)	- (w9 * MILx * MILxCZE)	- (w9 * MILx * MILxKOR)	- (w9 * MILx * MILxPAC)	- (w9 * MILx * MILxEUR)	- (w9 * MILx * MILxISR)	- (w9 * MILx * x90)	,
			"Base.P226",	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSEMI)	- (w9 * MILx * xEUR)			- (w9 * MILx * MILxSOV)	- (w9 * MILx * MILxCZE)		- (w9 * MILx * MILxPAC)				,
			"Base.APS",	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSMG)	- (w9 * MILx * xSOV)		- (w9 * MILx * MILxUSA)		- (w9 * MILx * MILxCZE)	- (w9 * MILx * MILxKOR)		- (w9 * MILx * MILxEUR)	- (w9 * MILx * MILxISR)		,
			"Base.Makarov",	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSEMI)	- (w9 * MILx * xSOV)		- (w9 * MILx * MILxUSA)		- (w9 * MILx * MILxCZE)	- (w9 * MILx * MILxKOR)		- (w9 * MILx * MILxEUR)	- (w9 * MILx * MILxISR)		,
			"Base.PB",	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSEMI)	- (w9 * MILx * xSOV)		- (w9 * MILx * MILxUSA)		- (w9 * MILx * MILxCZE)	- (w9 * MILx * MILxKOR)		- (w9 * MILx * MILxEUR)	- (w9 * MILx * MILxISR)		,
			"Base.Luger",	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSEMI)	- (w9 * MILx * xEUR)	- (w9 * MILx * MILxNON)	- (w9 * MILx * MILxUSA)	- (w9 * MILx * MILxSOV)	- (w9 * MILx * MILxCZE)	- (w9 * MILx * MILxKOR)	- (w9 * MILx * MILxPAC)	- (w9 * MILx * MILxEUR)	- (w9 * MILx * MILxISR)		,
			"Base.Luger_WW1",	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSEMI)	- (w9 * MILx * xEUR)	- (w9 * MILx * MILxNON)	- (w9 * MILx * MILxUSA)	- (w9 * MILx * MILxSOV)	- (w9 * MILx * MILxCZE)	- (w9 * MILx * MILxKOR)	- (w9 * MILx * MILxPAC)	- (w9 * MILx * MILxEUR)	- (w9 * MILx * MILxISR)		,
			"Base.Luger_Carbine",	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSEMI)	- (w9 * MILx * xEUR)	- (w9 * MILx * MILxNON)	- (w9 * MILx * MILxUSA)	- (w9 * MILx * MILxSOV)	- (w9 * MILx * MILxCZE)	- (w9 * MILx * MILxKOR)	- (w9 * MILx * MILxPAC)	- (w9 * MILx * MILxEUR)	- (w9 * MILx * MILxISR)		,
			"Base.UZI", 	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSMG)	- (w9 * MILx * xREST)		- (w9 * MILx * MILxUSA)	- (w9 * MILx * MILxSOV)	- (w9 * MILx * MILxCZE)	- (w9 * MILx * MILxKOR)	- (w9 * MILx * MILxPAC)	- (w9 * MILx * MILxEUR)			,
			"Base.UZI_Wood",	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSMG)	- (w9 * MILx * xREST)		- (w9 * MILx * MILxUSA)	- (w9 * MILx * MILxSOV)	- (w9 * MILx * MILxCZE)	- (w9 * MILx * MILxKOR)	- (w9 * MILx * MILxPAC)	- (w9 * MILx * MILxEUR)			,
			"Base.UZI_Micro",	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSMG)	- (w9 * MILx * xREST)		- (w9 * MILx * MILxUSA)	- (w9 * MILx * MILxSOV)	- (w9 * MILx * MILxCZE)	- (w9 * MILx * MILxKOR)	- (w9 * MILx * MILxPAC)	- (w9 * MILx * MILxEUR)			,
			"Base.BT9_Fold",	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSMG)	- (w9 * MILx * xEUR)		- (w9 * MILx * MILxUSA)	- (w9 * MILx * MILxSOV)	- (w9 * MILx * MILxCZE)		- (w9 * MILx * MILxPAC)	- (w9 * MILx * MILxEUR)	- (w9 * MILx * MILxISR)	- (w9 * MILx * x90)	,
			"Base.UMP9_Stock",	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSMG)	- (w9 * MILx * xEUR)		- (w9 * MILx * MILxUSA)	- (w9 * MILx * MILxSOV)	- (w9 * MILx * MILxCZE)	- (w9 * MILx * MILxKOR)	- (w9 * MILx * MILxPAC)		- (w9 * MILx * MILxISR)	- (w9 * MILx * x90)	,
			"Base.SUB2000",	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSEMI)	- (w9 * MILx * xUSA)	- (w9 * MILx * MILxNON)	- (w9 * MILx * MILxUSA)	- (w9 * MILx * MILxSOV)	- (w9 * MILx * MILxCZE)	- (w9 * MILx * MILxKOR)	- (w9 * MILx * MILxPAC)	- (w9 * MILx * MILxEUR)	- (w9 * MILx * MILxISR)	- (w9 * MILx * x90)	,
			"Base.MP5_Fixed",	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSMG)	- (w9 * MILx * xEUR)			- (w9 * MILx * MILxSOV)			- (w9 * MILx * MILxPAC)		- (w9 * MILx * MILxISR)		,
			"Base.MP5_Stock",	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSMG)	- (w9 * MILx * xEUR)			- (w9 * MILx * MILxSOV)			- (w9 * MILx * MILxPAC)		- (w9 * MILx * MILxISR)		,
			"Base.MP5SD6_Fixed",	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSMG)	- (w9 * MILx * xEUR)			- (w9 * MILx * MILxSOV)			- (w9 * MILx * MILxPAC)		- (w9 * MILx * MILxISR)		,
			"Base.MP5SD6_Stock",	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSMG)	- (w9 * MILx * xEUR)			- (w9 * MILx * MILxSOV)			- (w9 * MILx * MILxPAC)		- (w9 * MILx * MILxISR)		,
			"Base.EVO_Fold",	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSMG)	- (w9 * MILx * xCZE)		- (w9 * MILx * MILxUSA)	- (w9 * MILx * MILxSOV)		- (w9 * MILx * MILxKOR)	- (w9 * MILx * MILxPAC)	- (w9 * MILx * MILxEUR)	- (w9 * MILx * MILxISR)	- (w9 * MILx * x90)	,
			"Base.K7_Stock",	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSMG)	- (w9 * MILx * xKOR)		- (w9 * MILx * MILxUSA)	- (w9 * MILx * MILxSOV)	- (w9 * MILx * MILxCZE)		- (w9 * MILx * MILxPAC)	- (w9 * MILx * MILxEUR)	- (w9 * MILx * MILxISR)		,
			"Base.AUG9",	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSMG)	- (w9 * MILx * xEUR)		- (w9 * MILx * MILxUSA)	- (w9 * MILx * MILxSOV)	- (w9 * MILx * MILxCZE)	- (w9 * MILx * MILxKOR)	- (w9 * MILx * MILxPAC)		- (w9 * MILx * MILxISR)		,
			"Base.KG9",	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSMG)	- (w9 * MILx * xUSA)	- (w9 * MILx * MILxNON)	- (w9 * MILx * MILxUSA)	- (w9 * MILx * MILxSOV)	- (w9 * MILx * MILxCZE)	- (w9 * MILx * MILxKOR)	- (w9 * MILx * MILxPAC)	- (w9 * MILx * MILxEUR)	- (w9 * MILx * MILxISR)		,
			"Base.Calico_M900_Fold",	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSMG)	- (w9 * MILx * xUSA)	- (w9 * MILx * MILxNON)	- (w9 * MILx * MILxUSA)	- (w9 * MILx * MILxSOV)	- (w9 * MILx * MILxCZE)	- (w9 * MILx * MILxKOR)	- (w9 * MILx * MILxPAC)	- (w9 * MILx * MILxEUR)	- (w9 * MILx * MILxISR)		,
			"Base.Calico_M950_Pistol",	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSMG)	- (w9 * MILx * xUSA)	- (w9 * MILx * MILxNON)	- (w9 * MILx * MILxUSA)	- (w9 * MILx * MILxSOV)	- (w9 * MILx * MILxCZE)	- (w9 * MILx * MILxKOR)	- (w9 * MILx * MILxPAC)	- (w9 * MILx * MILxEUR)	- (w9 * MILx * MILxISR)		,
			"Base.VSS",	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSMG)	- (w9 * MILx * xSOV)		- (w9 * MILx * MILxUSA)		- (w9 * MILx * MILxCZE)	- (w9 * MILx * MILxKOR)		- (w9 * MILx * MILxEUR)	- (w9 * MILx * MILxISR)		,
			"Base.ASVAL",	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSMG)	- (w9 * MILx * xSOV)		- (w9 * MILx * MILxUSA)		- (w9 * MILx * MILxCZE)	- (w9 * MILx * MILxKOR)		- (w9 * MILx * MILxEUR)	- (w9 * MILx * MILxISR)		,
			"Base.M1Carbine",	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSEMI)	- (w9 * MILx * xUSA)	- (w9 * MILx * MILxNON)	- (w9 * MILx * MILxUSA)	- (w9 * MILx * MILxSOV)	- (w9 * MILx * MILxCZE)	- (w9 * MILx * MILxKOR)	- (w9 * MILx * MILxPAC)	- (w9 * MILx * MILxEUR)	- (w9 * MILx * MILxISR)		,
			"Base.M2Carbine",	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSMG)	- (w9 * MILx * xUSA)	- (w9 * MILx * MILxNON)	- (w9 * MILx * MILxUSA)	- (w9 * MILx * MILxSOV)	- (w9 * MILx * MILxCZE)	- (w9 * MILx * MILxKOR)	- (w9 * MILx * MILxPAC)	- (w9 * MILx * MILxEUR)	- (w9 * MILx * MILxISR)		,
			"Base.M635",	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSMG)	- (w9 * MILx * xUSA)			- (w9 * MILx * MILxSOV)	- (w9 * MILx * MILxCZE)	- (w9 * MILx * MILxKOR)	- (w9 * MILx * MILxPAC)	- (w9 * MILx * MILxEUR)	- (w9 * MILx * MILxISR)		,
			"Base.M635S",	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSMG)	- (w9 * MILx * xUSA)			- (w9 * MILx * MILxSOV)	- (w9 * MILx * MILxCZE)	- (w9 * MILx * MILxKOR)	- (w9 * MILx * MILxPAC)	- (w9 * MILx * MILxEUR)	- (w9 * MILx * MILxISR)		,
			"Base.M635SD",	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSMG)	- (w9 * MILx * xUSA)			- (w9 * MILx * MILxSOV)	- (w9 * MILx * MILxCZE)	- (w9 * MILx * MILxKOR)	- (w9 * MILx * MILxPAC)	- (w9 * MILx * MILxEUR)	- (w9 * MILx * MILxISR)		,
			"Base.MP7",	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSMG)	- (w9 * MILx * xEUR)		- (w9 * MILx * MILxUSA)	- (w9 * MILx * MILxSOV)	- (w9 * MILx * MILxCZE)		- (w9 * MILx * MILxPAC)		- (w9 * MILx * MILxISR)	- (w9 * MILx * x90)	,
			"Base.Jatimatic",	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSMG)	- (w9 * MILx * xEUR)	- (w9 * MILx * MILxNON)	- (w9 * MILx * MILxUSA)	- (w9 * MILx * MILxSOV)	- (w9 * MILx * MILxCZE)	- (w9 * MILx * MILxKOR)	- (w9 * MILx * MILxPAC)	- (w9 * MILx * MILxEUR)	- (w9 * MILx * MILxISR)		,
			"Base.Sten",	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSMG)	- (w9 * MILx * xEUR)		- (w9 * MILx * MILxUSA)	- (w9 * MILx * MILxSOV)	- (w9 * MILx * MILxCZE)	- (w9 * MILx * MILxKOR)	- (w9 * MILx * MILxPAC)		- (w9 * MILx * MILxISR)		,
			"Base.Sten_MK2",	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSMG)	- (w9 * MILx * xEUR)		- (w9 * MILx * MILxUSA)	- (w9 * MILx * MILxSOV)	- (w9 * MILx * MILxCZE)	- (w9 * MILx * MILxKOR)	- (w9 * MILx * MILxPAC)		- (w9 * MILx * MILxISR)		,
			"Base.Sten_MK2SD",	w9	 * MILx	- (w9 * x9)	- (w9 * MILx * xSMG)	- (w9 * MILx * xEUR)		- (w9 * MILx * MILxUSA)	- (w9 * MILx * MILxSOV)	- (w9 * MILx * MILxCZE)	- (w9 * MILx * MILxKOR)	- (w9 * MILx * MILxPAC)		- (w9 * MILx * MILxISR)		,
			"Base.M5238",	w357	 * MILx	- (w357 * x357)	- (w357 * MILx * xSEMI)	- (w357 * MILx * xUSA)	- (w357 * MILx * MILxNON)	- (w357 * MILx * MILxUSA)	- (w357 * MILx * MILxSOV)	- (w357 * MILx * MILxCZE)	- (w357 * MILx * MILxKOR)	- (w357 * MILx * MILxPAC)	- (w357 * MILx * MILxEUR)	- (w357 * MILx * MILxISR)		,
			"Base.Taurus856",	w357	 * MILx	- (w357 * x357)	- (w357 * MILx * xREV)	- (w357 * MILx * xREST)	- (w357 * MILx * MILxNON)	- (w357 * MILx * MILxUSA)	- (w357 * MILx * MILxSOV)	- (w357 * MILx * MILxCZE)	- (w357 * MILx * MILxKOR)	- (w357 * MILx * MILxPAC)	- (w357 * MILx * MILxEUR)	- (w357 * MILx * MILxISR)	- (w357 * MILx * x90)	,
			"Base.Colt_Service38",	w357	 * MILx	- (w357 * x357)	- (w357 * MILx * xREV)	- (w357 * MILx * xUSA)	- (w357 * MILx * MILxNON)	- (w357 * MILx * MILxUSA)	- (w357 * MILx * MILxSOV)	- (w357 * MILx * MILxCZE)	- (w357 * MILx * MILxKOR)	- (w357 * MILx * MILxPAC)	- (w357 * MILx * MILxEUR)	- (w357 * MILx * MILxISR)		,
			"Base.GP100_2",	w357	 * MILx	- (w357 * x357)	- (w357 * MILx * xREV)	- (w357 * MILx * xUSA)	- (w357 * MILx * MILxNON)	- (w357 * MILx * MILxUSA)	- (w357 * MILx * MILxSOV)	- (w357 * MILx * MILxCZE)	- (w357 * MILx * MILxKOR)	- (w357 * MILx * MILxPAC)	- (w357 * MILx * MILxEUR)	- (w357 * MILx * MILxISR)		,
			"Base.GP100_4",	w357	 * MILx	- (w357 * x357)	- (w357 * MILx * xREV)	- (w357 * MILx * xUSA)	- (w357 * MILx * MILxNON)	- (w357 * MILx * MILxUSA)	- (w357 * MILx * MILxSOV)	- (w357 * MILx * MILxCZE)	- (w357 * MILx * MILxKOR)	- (w357 * MILx * MILxPAC)	- (w357 * MILx * MILxEUR)	- (w357 * MILx * MILxISR)		,
			"Base.GP100_6",	w357	 * MILx	- (w357 * x357)	- (w357 * MILx * xREV)	- (w357 * MILx * xUSA)	- (w357 * MILx * MILxNON)	- (w357 * MILx * MILxUSA)	- (w357 * MILx * MILxSOV)	- (w357 * MILx * MILxCZE)	- (w357 * MILx * MILxKOR)	- (w357 * MILx * MILxPAC)	- (w357 * MILx * MILxEUR)	- (w357 * MILx * MILxISR)		,
			"Base.K6S",	w357	 * MILx	- (w357 * x357)	- (w357 * MILx * xREV)	- (w357 * MILx * xUSA)	- (w357 * MILx * MILxNON)	- (w357 * MILx * MILxUSA)	- (w357 * MILx * MILxSOV)	- (w357 * MILx * MILxCZE)	- (w357 * MILx * MILxKOR)	- (w357 * MILx * MILxPAC)	- (w357 * MILx * MILxEUR)	- (w357 * MILx * MILxISR)	- (w357 * MILx * x90)	,
			"Base.M1936",	w357	 * MILx	- (w357 * x357)	- (w357 * MILx * xREV)	- (w357 * MILx * xUSA)	- (w357 * MILx * MILxNON)	- (w357 * MILx * MILxUSA)	- (w357 * MILx * MILxSOV)	- (w357 * MILx * MILxCZE)	- (w357 * MILx * MILxKOR)	- (w357 * MILx * MILxPAC)	- (w357 * MILx * MILxEUR)	- (w357 * MILx * MILxISR)		,
			"Base.NEF_Handi_38",	w357	 * MILx	- (w357 * x357)	- (w357 * MILx * xBREAK)	- (w357 * MILx * xUSA)	- (w357 * MILx * MILxNON)	- (w357 * MILx * MILxUSA)	- (w357 * MILx * MILxSOV)	- (w357 * MILx * MILxCZE)	- (w357 * MILx * MILxKOR)	- (w357 * MILx * MILxPAC)	- (w357 * MILx * MILxEUR)	- (w357 * MILx * MILxISR)		,
			"Base.Marlin_1894",	w357	 * MILx	- (w357 * x357)	- (w357 * MILx * xLEVER)	- (w357 * MILx * xUSA)	- (w357 * MILx * MILxNON)	- (w357 * MILx * MILxUSA)	- (w357 * MILx * MILxSOV)	- (w357 * MILx * MILxCZE)	- (w357 * MILx * MILxKOR)	- (w357 * MILx * MILxPAC)	- (w357 * MILx * MILxEUR)	- (w357 * MILx * MILxISR)		,
			"Base.CZ97B",	w45	 * MILx	- (w45 * x45)	- (w45 * MILx * xSEMI)	- (w45 * MILx * xCZE)		- (w45 * MILx * MILxUSA)	- (w45 * MILx * MILxSOV)		- (w45 * MILx * MILxKOR)	- (w45 * MILx * MILxPAC)	- (w45 * MILx * MILxEUR)		- (w45 * MILx * x90)	,
			"Base.G21",	w45	 * MILx	- (w45 * x45)	- (w45 * MILx * xSEMI)	- (w45 * MILx * xEUR)		- (w45 * MILx * MILxUSA)	- (w45 * MILx * MILxSOV)	- (w45 * MILx * MILxCZE)	- (w45 * MILx * MILxKOR)	- (w45 * MILx * MILxPAC)				,
			"Base.XD4",	w45	 * MILx	- (w45 * x45)	- (w45 * MILx * xSEMI)	- (w45 * MILx * xUSA)		- (w45 * MILx * MILxUSA)	- (w45 * MILx * MILxSOV)		- (w45 * MILx * MILxKOR)	- (w45 * MILx * MILxPAC)	- (w45 * MILx * MILxEUR)	- (w45 * MILx * MILxISR)	- (w45 * MILx * x90)	,
			"Base.MP45",	w45	 * MILx	- (w45 * x45)	- (w45 * MILx * xSEMI)	- (w45 * MILx * xUSA)	- (w45 * MILx * MILxNON)	- (w45 * MILx * MILxUSA)	- (w45 * MILx * MILxSOV)	- (w45 * MILx * MILxCZE)	- (w45 * MILx * MILxKOR)	- (w45 * MILx * MILxPAC)	- (w45 * MILx * MILxEUR)	- (w45 * MILx * MILxISR)	- (w45 * MILx * x90)	,
			"Base.P220",	w45	 * MILx	- (w45 * x45)	- (w45 * MILx * xSEMI)	- (w45 * MILx * xEUR)			- (w45 * MILx * MILxSOV)	- (w45 * MILx * MILxCZE)		- (w45 * MILx * MILxPAC)				,
			"Base.M4506",	w45	 * MILx	- (w45 * x45)	- (w45 * MILx * xSEMI)	- (w45 * MILx * xUSA)	- (w45 * MILx * MILxNON)	- (w45 * MILx * MILxUSA)	- (w45 * MILx * MILxSOV)	- (w45 * MILx * MILxCZE)	- (w45 * MILx * MILxKOR)	- (w45 * MILx * MILxPAC)	- (w45 * MILx * MILxEUR)	- (w45 * MILx * MILxISR)		,
			"Base.PARA1911",	w45	 * MILx	- (w45 * x45)	- (w45 * MILx * xSEMI)	- (w45 * MILx * xUSA)	- (w45 * MILx * MILxNON)	- (w45 * MILx * MILxUSA)	- (w45 * MILx * MILxSOV)	- (w45 * MILx * MILxCZE)	- (w45 * MILx * MILxKOR)	- (w45 * MILx * MILxPAC)	- (w45 * MILx * MILxEUR)	- (w45 * MILx * MILxISR)		,
			"Base.AMT1911",	w45	 * MILx	- (w45 * x45)	- (w45 * MILx * xSEMI)	- (w45 * MILx * xUSA)	- (w45 * MILx * MILxNON)	- (w45 * MILx * MILxUSA)	- (w45 * MILx * MILxSOV)	- (w45 * MILx * MILxCZE)	- (w45 * MILx * MILxKOR)	- (w45 * MILx * MILxPAC)	- (w45 * MILx * MILxEUR)	- (w45 * MILx * MILxISR)		,
			"Base.AMT1911_Long",	w45	 * MILx	- (w45 * x45)	- (w45 * MILx * xSEMI)	- (w45 * MILx * xUSA)	- (w45 * MILx * MILxNON)	- (w45 * MILx * MILxUSA)	- (w45 * MILx * MILxSOV)	- (w45 * MILx * MILxCZE)	- (w45 * MILx * MILxKOR)	- (w45 * MILx * MILxPAC)	- (w45 * MILx * MILxEUR)	- (w45 * MILx * MILxISR)		,
			"Base.M1911_Carbine",	w45	 * MILx	- (w45 * x45)	- (w45 * MILx * xSEMI)	- (w45 * MILx * xUSA)	- (w45 * MILx * MILxNON)	- (w45 * MILx * MILxUSA)	- (w45 * MILx * MILxSOV)	- (w45 * MILx * MILxCZE)	- (w45 * MILx * MILxKOR)	- (w45 * MILx * MILxPAC)	- (w45 * MILx * MILxEUR)	- (w45 * MILx * MILxISR)		,
			"Base.Colt1911",	w45	 * MILx	- (w45 * x45)	- (w45 * MILx * xSEMI)	- (w45 * MILx * xUSA)			- (w45 * MILx * MILxSOV)	- (w45 * MILx * MILxCZE)		- (w45 * MILx * MILxPAC)		- (w45 * MILx * MILxISR)		,
			"Base.Colt_Kimber",	w45	 * MILx	- (w45 * x45)	- (w45 * MILx * xSEMI)	- (w45 * MILx * xUSA)	- (w45 * MILx * MILxNON)	- (w45 * MILx * MILxUSA)	- (w45 * MILx * MILxSOV)	- (w45 * MILx * MILxCZE)	- (w45 * MILx * MILxKOR)	- (w45 * MILx * MILxPAC)	- (w45 * MILx * MILxEUR)	- (w45 * MILx * MILxISR)	- (w45 * MILx * x90)	,
			"Base.Colt_Commander",	w45	 * MILx	- (w45 * x45)	- (w45 * MILx * xSEMI)	- (w45 * MILx * xUSA)			- (w45 * MILx * MILxSOV)	- (w45 * MILx * MILxCZE)		- (w45 * MILx * MILxPAC)	- (w45 * MILx * MILxEUR)	- (w45 * MILx * MILxISR)		,
			"Base.UMP45_Stock",	w45	 * MILx	- (w45 * x45)	- (w45 * MILx * xSMG)	- (w45 * MILx * xEUR)		- (w45 * MILx * MILxUSA)	- (w45 * MILx * MILxSOV)	- (w45 * MILx * MILxCZE)	- (w45 * MILx * MILxKOR)	- (w45 * MILx * MILxPAC)		- (w45 * MILx * MILxISR)	- (w45 * MILx * x90)	,
			"Base.MAC10_Fold",	w45	 * MILx	- (w45 * x45)	- (w45 * MILx * xSMG)	- (w45 * MILx * xUSA)		- (w45 * MILx * MILxUSA)	- (w45 * MILx * MILxSOV)	- (w45 * MILx * MILxCZE)	- (w45 * MILx * MILxKOR)	- (w45 * MILx * MILxPAC)				,
			"Base.KRISS_Stock",	w45	 * MILx	- (w45 * x45)	- (w45 * MILx * xSMG)	- (w45 * MILx * xUSA)	- (w45 * MILx * MILxNON)	- (w45 * MILx * MILxUSA)	- (w45 * MILx * MILxSOV)	- (w45 * MILx * MILxCZE)	- (w45 * MILx * MILxKOR)	- (w45 * MILx * MILxPAC)	- (w45 * MILx * MILxEUR)	- (w45 * MILx * MILxISR)	- (w45 * MILx * x90)	,
			"Base.Commando",	w45	 * MILx	- (w45 * x45)	- (w45 * MILx * xBOLT)	- (w45 * MILx * xEUR)	- (w45 * MILx * MILxNON)	- (w45 * MILx * MILxUSA)	- (w45 * MILx * MILxSOV)	- (w45 * MILx * MILxCZE)	- (w45 * MILx * MILxKOR)	- (w45 * MILx * MILxPAC)	- (w45 * MILx * MILxEUR)	- (w45 * MILx * MILxISR)		,
			"Base.Thompson",	w45	 * MILx	- (w45 * x45)	- (w45 * MILx * xSMG)	- (w45 * MILx * xUSA)		- (w45 * MILx * MILxUSA)	- (w45 * MILx * MILxSOV)	- (w45 * MILx * MILxCZE)	- (w45 * MILx * MILxKOR)	- (w45 * MILx * MILxPAC)		- (w45 * MILx * MILxISR)		,
			"Base.Thompson_1928",	w45	 * MILx	- (w45 * x45)	- (w45 * MILx * xSMG)	- (w45 * MILx * xUSA)		- (w45 * MILx * MILxUSA)	- (w45 * MILx * MILxSOV)	- (w45 * MILx * MILxCZE)	- (w45 * MILx * MILxKOR)	- (w45 * MILx * MILxPAC)		- (w45 * MILx * MILxISR)		,
			"Base.M2Hyde",	w45	 * MILx	- (w45 * x45)	- (w45 * MILx * xSMG)	- (w45 * MILx * xUSA)	- (w45 * MILx * MILxNON)	- (w45 * MILx * MILxUSA)	- (w45 * MILx * MILxSOV)	- (w45 * MILx * MILxCZE)	- (w45 * MILx * MILxKOR)	- (w45 * MILx * MILxPAC)	- (w45 * MILx * MILxEUR)	- (w45 * MILx * MILxISR)		,
			"Base.Model55_Fold",	w45	 * MILx	- (w45 * x45)	- (w45 * MILx * xSMG)	- (w45 * MILx * xUSA)	- (w45 * MILx * MILxNON)	- (w45 * MILx * MILxUSA)	- (w45 * MILx * MILxSOV)	- (w45 * MILx * MILxCZE)	- (w45 * MILx * MILxKOR)	- (w45 * MILx * MILxPAC)	- (w45 * MILx * MILxEUR)	- (w45 * MILx * MILxISR)		,
			"Base.Model50",	w45	 * MILx	- (w45 * x45)	- (w45 * MILx * xSMG)	- (w45 * MILx * xUSA)	- (w45 * MILx * MILxNON)	- (w45 * MILx * MILxUSA)	- (w45 * MILx * MILxSOV)	- (w45 * MILx * MILxCZE)	- (w45 * MILx * MILxKOR)	- (w45 * MILx * MILxPAC)	- (w45 * MILx * MILxEUR)	- (w45 * MILx * MILxISR)		,
			"Base.Colt_Navy_1851",	w44	 * MILx	- (w44 * x44)	- (w44 * MILx * xREV)	- (w44 * MILx * xUSA)	- (w44 * MILx * MILxNON)	- (w44 * MILx * MILxUSA)	- (w44 * MILx * MILxSOV)	- (w44 * MILx * MILxCZE)	- (w44 * MILx * MILxKOR)	- (w44 * MILx * MILxPAC)	- (w44 * MILx * MILxEUR)	- (w44 * MILx * MILxISR)		,
			"Base.M29_44",	w44	 * MILx	- (w44 * x44)	- (w44 * MILx * xREV)	- (w44 * MILx * xUSA)	- (w44 * MILx * MILxNON)	- (w44 * MILx * MILxUSA)	- (w44 * MILx * MILxSOV)	- (w44 * MILx * MILxCZE)	- (w44 * MILx * MILxKOR)	- (w44 * MILx * MILxPAC)	- (w44 * MILx * MILxEUR)	- (w44 * MILx * MILxISR)		,
			"Base.M29_44Carbine",	w44	 * MILx	- (w44 * x44)	- (w44 * MILx * xREV)	- (w44 * MILx * xUSA)	- (w44 * MILx * MILxNON)	- (w44 * MILx * MILxUSA)	- (w44 * MILx * MILxSOV)	- (w44 * MILx * MILxCZE)	- (w44 * MILx * MILxKOR)	- (w44 * MILx * MILxPAC)	- (w44 * MILx * MILxEUR)	- (w44 * MILx * MILxISR)		,
			"Base.Automag",	w44	 * MILx	- (w44 * x44)	- (w44 * MILx * xSEMI)	- (w44 * MILx * xUSA)	- (w44 * MILx * MILxNON)	- (w44 * MILx * MILxUSA)	- (w44 * MILx * MILxSOV)	- (w44 * MILx * MILxCZE)	- (w44 * MILx * MILxKOR)	- (w44 * MILx * MILxPAC)	- (w44 * MILx * MILxEUR)	- (w44 * MILx * MILxISR)		,
			"Base.DEagle",	w44	 * MILx	- (w44 * x44)	- (w44 * MILx * xSEMI)	- (w44 * MILx * xISR)		- (w44 * MILx * MILxUSA)	- (w44 * MILx * MILxSOV)	- (w44 * MILx * MILxCZE)	- (w44 * MILx * MILxKOR)	- (w44 * MILx * MILxPAC)	- (w44 * MILx * MILxEUR)			,
			"Base.DEagle_Long",	w44	 * MILx	- (w44 * x44)	- (w44 * MILx * xSEMI)	- (w44 * MILx * xISR)		- (w44 * MILx * MILxUSA)	- (w44 * MILx * MILxSOV)	- (w44 * MILx * MILxCZE)	- (w44 * MILx * MILxKOR)	- (w44 * MILx * MILxPAC)	- (w44 * MILx * MILxEUR)			,
			"Base.Winchester1866",	w45LC	 * MILx	- (w44 * x44)	- (w45LC * MILx * xLEVER)	- (w45LC * MILx * xUSA)	- (w45LC * MILx * MILxNON)	- (w45LC * MILx * MILxUSA)	- (w45LC * MILx * MILxSOV)	- (w45LC * MILx * MILxCZE)	- (w45LC * MILx * MILxKOR)	- (w45LC * MILx * MILxPAC)	- (w45LC * MILx * MILxEUR)	- (w45LC * MILx * MILxISR)		,
			"Base.Win_1894",	w44	 * MILx	- (w44 * x44)	- (w44 * MILx * xLEVER)	- (w44 * MILx * xUSA)	- (w44 * MILx * MILxNON)	- (w44 * MILx * MILxUSA)	- (w44 * MILx * MILxSOV)	- (w44 * MILx * MILxCZE)	- (w44 * MILx * MILxKOR)	- (w44 * MILx * MILxPAC)	- (w44 * MILx * MILxEUR)	- (w44 * MILx * MILxISR)		,
			"Base.Colt_Service45",	w45LC	 * MILx	- (w45LC * x45LC)	- (w45LC * MILx * xREV)	- (w45LC * MILx * xUSA)	- (w45LC * MILx * MILxNON)	- (w45LC * MILx * MILxUSA)	- (w45LC * MILx * MILxSOV)	- (w45LC * MILx * MILxCZE)	- (w45LC * MILx * MILxKOR)	- (w45LC * MILx * MILxPAC)	- (w45LC * MILx * MILxEUR)	- (w45LC * MILx * MILxISR)		,
			"Base.Judge_45LC",	w45LC	 * MILx	- (w45LC * x45LC)	- (w45LC * MILx * xREV)	- (w45LC * MILx * xREST)	- (w45LC * MILx * MILxNON)	- (w45LC * MILx * MILxUSA)	- (w45LC * MILx * MILxSOV)	- (w45LC * MILx * MILxCZE)	- (w45LC * MILx * MILxKOR)	- (w45LC * MILx * MILxPAC)	- (w45LC * MILx * MILxEUR)	- (w45LC * MILx * MILxISR)	- (w45LC * MILx * x90)	,
			"Base.Judge513_45LC",	w45LC	 * MILx	- (w45LC * x45LC)	- (w45LC * MILx * xREV)	- (w45LC * MILx * xREST)	- (w45LC * MILx * MILxNON)	- (w45LC * MILx * MILxUSA)	- (w45LC * MILx * MILxSOV)	- (w45LC * MILx * MILxCZE)	- (w45LC * MILx * MILxKOR)	- (w45LC * MILx * MILxPAC)	- (w45LC * MILx * MILxEUR)	- (w45LC * MILx * MILxISR)	- (w45LC * MILx * x90)	,
			"Base.Judge513_Long_45LC",	w45LC	 * MILx	- (w45LC * x45LC)	- (w45LC * MILx * xREV)	- (w45LC * MILx * xREST)	- (w45LC * MILx * MILxNON)	- (w45LC * MILx * MILxUSA)	- (w45LC * MILx * MILxSOV)	- (w45LC * MILx * MILxCZE)	- (w45LC * MILx * MILxKOR)	- (w45LC * MILx * MILxPAC)	- (w45LC * MILx * MILxEUR)	- (w45LC * MILx * MILxISR)	- (w45LC * MILx * x90)	,
			"Base.TXS_804_45LC",	w45LC	 * MILx	- (w45LC * x45LC)	- (w45LC * MILx * xREV)	- (w45LC * MILx * xREST)	- (w45LC * MILx * MILxNON)	- (w45LC * MILx * MILxUSA)	- (w45LC * MILx * MILxSOV)	- (w45LC * MILx * MILxCZE)	- (w45LC * MILx * MILxKOR)	- (w45LC * MILx * MILxPAC)	- (w45LC * MILx * MILxEUR)	- (w45LC * MILx * MILxISR)		,
			"Base.Winchester1873",	w45LC	 * MILx	- (w45LC * x45LC)	- (w45LC * MILx * xLEVER)	- (w45LC * MILx * xUSA)	- (w45LC * MILx * MILxNON)	- (w45LC * MILx * MILxUSA)	- (w45LC * MILx * MILxSOV)	- (w45LC * MILx * MILxCZE)	- (w45LC * MILx * MILxKOR)	- (w45LC * MILx * MILxPAC)	- (w45LC * MILx * MILxEUR)	- (w45LC * MILx * MILxISR)		,
			"Base.Sako85",	w223	 * MILx	- (w223 * x223)	- (w223 * MILx * xBOLT)	- (w223 * MILx * xEUR)		- (w223 * MILx * MILxUSA)	- (w223 * MILx * MILxSOV)		- (w223 * MILx * MILxKOR)	- (w223 * MILx * MILxPAC)	- (w223 * MILx * MILxEUR)	- (w223 * MILx * MILxISR)		,
			"Base.MINI14",	w223	 * MILx	- (w223 * x223)	- (w223 * MILx * xSEMI)	- (w223 * MILx * xUSA)	- (w223 * MILx * MILxNON)	- (w223 * MILx * MILxUSA)	- (w223 * MILx * MILxSOV)	- (w223 * MILx * MILxCZE)	- (w223 * MILx * MILxKOR)	- (w223 * MILx * MILxPAC)	- (w223 * MILx * MILxEUR)	- (w223 * MILx * MILxISR)		,
			"Base.MINI14_T",	w223	 * MILx	- (w223 * x223)	- (w223 * MILx * xSEMI)	- (w223 * MILx * xUSA)	- (w223 * MILx * MILxNON)	- (w223 * MILx * MILxUSA)	- (w223 * MILx * MILxSOV)	- (w223 * MILx * MILxCZE)	- (w223 * MILx * MILxKOR)	- (w223 * MILx * MILxPAC)	- (w223 * MILx * MILxEUR)	- (w223 * MILx * MILxISR)		,
			"Base.Viper",	w223	 * MILx	- (w223 * x223)	- (w223 * MILx * xLEVER)	- (w223 * MILx * xREST)	- (w223 * MILx * MILxNON)	- (w223 * MILx * MILxUSA)	- (w223 * MILx * MILxSOV)	- (w223 * MILx * MILxCZE)	- (w223 * MILx * MILxKOR)	- (w223 * MILx * MILxPAC)	- (w223 * MILx * MILxEUR)	- (w223 * MILx * MILxISR)	- (w223 * MILx * x90)	,
			"Base.CAR15SMG",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xAUTO)	- (w556 * MILx * xUSA)			- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)	- (w556 * MILx * MILxKOR)	- (w556 * MILx * MILxPAC)	- (w556 * MILx * MILxEUR)			,
			"Base.CAR15_Survival",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xAUTO)	- (w556 * MILx * xUSA)			- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)	- (w556 * MILx * MILxKOR)	- (w556 * MILx * MILxPAC)	- (w556 * MILx * MILxEUR)			,
			"Base.XM8Compact_Pistol",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xAUTO)	- (w556 * MILx * xEUR)	- (w556 * MILx * MILxNON)	- (w556 * MILx * MILxUSA)	- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)	- (w556 * MILx * MILxKOR)	- (w556 * MILx * MILxPAC)	- (w556 * MILx * MILxEUR)	- (w556 * MILx * MILxISR)	- (w556 * MILx * x90)	,
			"Base.XM8",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xAUTO)	- (w556 * MILx * xEUR)	- (w556 * MILx * MILxNON)	- (w556 * MILx * MILxUSA)	- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)	- (w556 * MILx * MILxKOR)	- (w556 * MILx * MILxPAC)	- (w556 * MILx * MILxEUR)	- (w556 * MILx * MILxISR)	- (w556 * MILx * x90)	,
			"Base.SCARSC_Stock",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xAUTO)	- (w556 * MILx * xEUR)			- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)	- (w556 * MILx * MILxKOR)	- (w556 * MILx * MILxPAC)	- (w556 * MILx * MILxEUR)	- (w556 * MILx * MILxISR)	- (w556 * MILx * x90)	,
			"Base.SCARL",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xAUTO)	- (w556 * MILx * xEUR)			- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)		- (w556 * MILx * MILxPAC)	- (w556 * MILx * MILxEUR)	- (w556 * MILx * MILxISR)	- (w556 * MILx * x90)	,
			"Base.G33",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xAUTO)	- (w556 * MILx * xEUR)		- (w556 * MILx * MILxUSA)	- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)	- (w556 * MILx * MILxKOR)	- (w556 * MILx * MILxPAC)		- (w556 * MILx * MILxISR)		,
			"Base.MK18",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xAUTO)	- (w556 * MILx * xEUR)	- (w556 * MILx * MILxNON)	- (w556 * MILx * MILxUSA)	- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)	- (w556 * MILx * MILxKOR)	- (w556 * MILx * MILxPAC)	- (w556 * MILx * MILxEUR)	- (w556 * MILx * MILxISR)	- (w556 * MILx * x90)	,
			"Base.M16A1",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xAUTO)	- (w556 * MILx * xUSA)			- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)		- (w556 * MILx * MILxPAC)				,
			"Base.M16A2",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xAUTO)	- (w556 * MILx * xUSA)			- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)	- (w556 * MILx * MILxKOR)	- (w556 * MILx * MILxPAC)				,
			"Base.M16A3",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xAUTO)	- (w556 * MILx * xUSA)			- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)	- (w556 * MILx * MILxKOR)	- (w556 * MILx * MILxPAC)	- (w556 * MILx * MILxEUR)	- (w556 * MILx * MILxISR)		,
			"Base.M723",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xAUTO)	- (w556 * MILx * xUSA)			- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)	- (w556 * MILx * MILxKOR)	- (w556 * MILx * MILxPAC)		- (w556 * MILx * MILxISR)		,
			"Base.XM117",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xAUTO)	- (w556 * MILx * xUSA)			- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)	- (w556 * MILx * MILxKOR)	- (w556 * MILx * MILxPAC)	- (w556 * MILx * MILxEUR)	- (w556 * MILx * MILxISR)	- (w556 * MILx * x90)	,
			"Base.H416",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xAUTO)	- (w556 * MILx * xEUR)			- (w556 * MILx * MILxSOV)			- (w556 * MILx * MILxPAC)		- (w556 * MILx * MILxISR)	- (w556 * MILx * x90)	,
			"Base.M4",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xAUTO)	- (w556 * MILx * xUSA)			- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)	- (w556 * MILx * MILxKOR)	- (w556 * MILx * MILxPAC)	- (w556 * MILx * MILxEUR)	- (w556 * MILx * MILxISR)		,
			"Base.M4A1",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xAUTO)	- (w556 * MILx * xUSA)			- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)		- (w556 * MILx * MILxPAC)	- (w556 * MILx * MILxEUR)			,
			"Base.ADAR",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xAUTO)	- (w556 * MILx * xSOV)		- (w556 * MILx * MILxUSA)		- (w556 * MILx * MILxCZE)	- (w556 * MILx * MILxKOR)		- (w556 * MILx * MILxEUR)	- (w556 * MILx * MILxISR)	- (w556 * MILx * x90)	,
			"Base.K2C1_PH",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xAUTO)	- (w556 * MILx * xKOR)		- (w556 * MILx * MILxUSA)	- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)		- (w556 * MILx * MILxPAC)	- (w556 * MILx * MILxEUR)	- (w556 * MILx * MILxISR)	- (w556 * MILx * x90)	,
			"Base.K1DEV",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xAUTO)	- (w556 * MILx * xKOR)		- (w556 * MILx * MILxUSA)	- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)		- (w556 * MILx * MILxPAC)	- (w556 * MILx * MILxEUR)	- (w556 * MILx * MILxISR)		,
			"Base.K2_C1",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xAUTO)	- (w556 * MILx * xKOR)		- (w556 * MILx * MILxUSA)	- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)		- (w556 * MILx * MILxPAC)	- (w556 * MILx * MILxEUR)	- (w556 * MILx * MILxISR)	- (w556 * MILx * x90)	,
			"Base.K2_1",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xAUTO)	- (w556 * MILx * xKOR)		- (w556 * MILx * MILxUSA)	- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)		- (w556 * MILx * MILxPAC)	- (w556 * MILx * MILxEUR)	- (w556 * MILx * MILxISR)		,
			"Base.K2_203",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xAUTO)	- (w556 * MILx * xKOR)		- (w556 * MILx * MILxUSA)	- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)		- (w556 * MILx * MILxPAC)	- (w556 * MILx * MILxEUR)	- (w556 * MILx * MILxISR)		,
			"Base.K1_1",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xAUTO)	- (w556 * MILx * xKOR)		- (w556 * MILx * MILxUSA)	- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)		- (w556 * MILx * MILxPAC)	- (w556 * MILx * MILxEUR)	- (w556 * MILx * MILxISR)		,
			"Base.DR_200",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xAUTO)	- (w556 * MILx * xKOR)		- (w556 * MILx * MILxUSA)	- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)		- (w556 * MILx * MILxPAC)	- (w556 * MILx * MILxEUR)	- (w556 * MILx * MILxISR)	- (w556 * MILx * x90)	,
			"Base.LVOA_C",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xSEMI)	- (w556 * MILx * xUSA)	- (w556 * MILx * MILxNON)	- (w556 * MILx * MILxUSA)	- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)	- (w556 * MILx * MILxKOR)	- (w556 * MILx * MILxPAC)	- (w556 * MILx * MILxEUR)	- (w556 * MILx * MILxISR)	- (w556 * MILx * x90)	,
			"Base.MCX_Spear",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xSEMI)	- (w556 * MILx * xEUR)	- (w556 * MILx * MILxNON)	- (w556 * MILx * MILxUSA)	- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)	- (w556 * MILx * MILxKOR)	- (w556 * MILx * MILxPAC)	- (w556 * MILx * MILxEUR)	- (w556 * MILx * MILxISR)	- (w556 * MILx * x90)	,
			"Base.ColtM16",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xAUTO)	- (w556 * MILx * xUSA)		- (w556 * MILx * MILxUSA)	- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)	- (w556 * MILx * MILxKOR)	- (w556 * MILx * MILxPAC)		- (w556 * MILx * MILxISR)		,
			"Base.M16Wood",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xAUTO)	- (w556 * MILx * xUSA)	- (w556 * MILx * MILxNON)	- (w556 * MILx * MILxUSA)	- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)	- (w556 * MILx * MILxKOR)	- (w556 * MILx * MILxPAC)	- (w556 * MILx * MILxEUR)	- (w556 * MILx * MILxISR)		,
			"Base.M16Tape",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xAUTO)	- (w556 * MILx * xUSA)	- (w556 * MILx * MILxNON)	- (w556 * MILx * MILxUSA)	- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)	- (w556 * MILx * MILxKOR)	- (w556 * MILx * MILxPAC)	- (w556 * MILx * MILxEUR)	- (w556 * MILx * MILxISR)		,
			"Base.FAMAS",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xAUTO)	- (w556 * MILx * xEUR)		- (w556 * MILx * MILxUSA)	- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)	- (w556 * MILx * MILxKOR)	- (w556 * MILx * MILxPAC)		- (w556 * MILx * MILxISR)		,
			"Base.FAMAS_G2",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xAUTO)	- (w556 * MILx * xEUR)		- (w556 * MILx * MILxUSA)	- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)	- (w556 * MILx * MILxKOR)	- (w556 * MILx * MILxPAC)		- (w556 * MILx * MILxISR)		,
			"Base.FAMAS_Felin",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xAUTO)	- (w556 * MILx * xEUR)		- (w556 * MILx * MILxUSA)	- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)	- (w556 * MILx * MILxKOR)	- (w556 * MILx * MILxPAC)		- (w556 * MILx * MILxISR)		,
			"Base.AUG",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xAUTO)	- (w556 * MILx * xEUR)		- (w556 * MILx * MILxUSA)	- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)	- (w556 * MILx * MILxKOR)	- (w556 * MILx * MILxPAC)		- (w556 * MILx * MILxISR)		,
			"Base.M85_Stock",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xAUTO)	- (w556 * MILx * xSOV)		- (w556 * MILx * MILxUSA)		- (w556 * MILx * MILxCZE)	- (w556 * MILx * MILxKOR)		- (w556 * MILx * MILxEUR)	- (w556 * MILx * MILxISR)		,
			"Base.AK74",	w545x39	 * MILx	- (w545x39 * x545x39)	- (w545x39 * MILx * xAUTO)	- (w545x39 * MILx * xSOV)		- (w545x39 * MILx * MILxUSA)		- (w545x39 * MILx * MILxCZE)	- (w545x39 * MILx * MILxKOR)		- (w545x39 * MILx * MILxEUR)	- (w545x39 * MILx * MILxISR)		,
			"Base.AKS74",	w545x39	 * MILx	- (w545x39 * x545x39)	- (w545x39 * MILx * xAUTO)	- (w545x39 * MILx * xSOV)		- (w545x39 * MILx * MILxUSA)		- (w545x39 * MILx * MILxCZE)	- (w545x39 * MILx * MILxKOR)		- (w545x39 * MILx * MILxEUR)	- (w545x39 * MILx * MILxISR)		,
			"Base.AKS74U",	w545x39	 * MILx	- (w545x39 * x545x39)	- (w545x39 * MILx * xAUTO)	- (w545x39 * MILx * xSOV)		- (w545x39 * MILx * MILxUSA)		- (w545x39 * MILx * MILxCZE)	- (w545x39 * MILx * MILxKOR)		- (w545x39 * MILx * MILxEUR)	- (w545x39 * MILx * MILxISR)		,
			"Base.AK74_Alpha",	w545x39	 * MILx	- (w545x39 * x545x39)	- (w545x39 * MILx * xAUTO)	- (w545x39 * MILx * xSOV)		- (w545x39 * MILx * MILxUSA)		- (w545x39 * MILx * MILxCZE)	- (w545x39 * MILx * MILxKOR)		- (w545x39 * MILx * MILxEUR)	- (w545x39 * MILx * MILxISR)	- (w545x39 * MILx * x90)	,
			"Base.AK12",	w545x39	 * MILx	- (w545x39 * x545x39)	- (w545x39 * MILx * xAUTO)	- (w545x39 * MILx * xSOV)		- (w545x39 * MILx * MILxUSA)		- (w545x39 * MILx * MILxCZE)	- (w545x39 * MILx * MILxKOR)		- (w545x39 * MILx * MILxEUR)	- (w545x39 * MILx * MILxISR)	- (w545x39 * MILx * x90)	,
			"Base.AK12_New",	w545x39	 * MILx	- (w545x39 * x545x39)	- (w545x39 * MILx * xAUTO)	- (w545x39 * MILx * xSOV)		- (w545x39 * MILx * MILxUSA)		- (w545x39 * MILx * MILxCZE)	- (w545x39 * MILx * MILxKOR)		- (w545x39 * MILx * MILxEUR)	- (w545x39 * MILx * MILxISR)	- (w545x39 * MILx * x90)	,
			"Base.RPK74",	w545x39	 * MILx	- (w545x39 * x545x39)	- (w545x39 * MILx * xLMG)	- (w545x39 * MILx * xSOV)		- (w545x39 * MILx * MILxUSA)		- (w545x39 * MILx * MILxCZE)	- (w545x39 * MILx * MILxKOR)		- (w545x39 * MILx * MILxEUR)	- (w545x39 * MILx * MILxISR)		,
			"Base.RPK16",	w545x39	 * MILx	- (w545x39 * x545x39)	- (w545x39 * MILx * xLMG)	- (w545x39 * MILx * xSOV)		- (w545x39 * MILx * MILxUSA)		- (w545x39 * MILx * MILxCZE)	- (w545x39 * MILx * MILxKOR)		- (w545x39 * MILx * MILxEUR)	- (w545x39 * MILx * MILxISR)	- (w545x39 * MILx * x90)	,
			"Base.L85",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xAUTO)	- (w556 * MILx * xEUR)		- (w556 * MILx * MILxUSA)	- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)	- (w556 * MILx * MILxKOR)	- (w556 * MILx * MILxPAC)		- (w556 * MILx * MILxISR)		,
			"Base.L85A2",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xAUTO)	- (w556 * MILx * xEUR)		- (w556 * MILx * MILxUSA)	- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)	- (w556 * MILx * MILxKOR)	- (w556 * MILx * MILxPAC)		- (w556 * MILx * MILxISR)	- (w556 * MILx * x90)	,
			"Base.L86",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xAUTO)	- (w556 * MILx * xEUR)		- (w556 * MILx * MILxUSA)	- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)	- (w556 * MILx * MILxKOR)	- (w556 * MILx * MILxPAC)		- (w556 * MILx * MILxISR)		,
			"Base.L22",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xAUTO)	- (w556 * MILx * xEUR)		- (w556 * MILx * MILxUSA)	- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)	- (w556 * MILx * MILxKOR)	- (w556 * MILx * MILxPAC)		- (w556 * MILx * MILxISR)	- (w556 * MILx * x90)	,
			"Base.F2000",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xAUTO)	- (w556 * MILx * xEUR)	- (w556 * MILx * MILxNON)	- (w556 * MILx * MILxUSA)	- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)	- (w556 * MILx * MILxKOR)	- (w556 * MILx * MILxPAC)	- (w556 * MILx * MILxEUR)	- (w556 * MILx * MILxISR)	- (w556 * MILx * x90)	,
			"Base.Tavor",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xAUTO)	- (w556 * MILx * xISR)		- (w556 * MILx * MILxUSA)	- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)	- (w556 * MILx * MILxKOR)	- (w556 * MILx * MILxPAC)	- (w556 * MILx * MILxEUR)		- (w556 * MILx * x90)	,
			"Base.AR18",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xAUTO)	- (w556 * MILx * xUSA)	- (w556 * MILx * MILxNON)	- (w556 * MILx * MILxUSA)	- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)	- (w556 * MILx * MILxKOR)	- (w556 * MILx * MILxPAC)	- (w556 * MILx * MILxEUR)	- (w556 * MILx * MILxISR)		,
			"Base.Type20",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xAUTO)	- (w556 * MILx * xPAC)		- (w556 * MILx * MILxUSA)	- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)	- (w556 * MILx * MILxKOR)		- (w556 * MILx * MILxEUR)	- (w556 * MILx * MILxISR)	- (w556 * MILx * x90)	,
			"Base.Type89",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xAUTO)	- (w556 * MILx * xPAC)		- (w556 * MILx * MILxUSA)	- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)	- (w556 * MILx * MILxKOR)		- (w556 * MILx * MILxEUR)	- (w556 * MILx * MILxISR)		,
			"Base.QBZ_95",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xAUTO)	- (w556 * MILx * xPAC)		- (w556 * MILx * MILxUSA)	- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)	- (w556 * MILx * MILxKOR)		- (w556 * MILx * MILxEUR)	- (w556 * MILx * MILxISR)	- (w556 * MILx * x90)	,
			"Base.XM8LMG",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xLMG)	- (w556 * MILx * xEUR)	- (w556 * MILx * MILxNON)	- (w556 * MILx * MILxUSA)	- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)	- (w556 * MILx * MILxKOR)	- (w556 * MILx * MILxPAC)	- (w556 * MILx * MILxEUR)	- (w556 * MILx * MILxISR)	- (w556 * MILx * x90)	,
			"Base.M249",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xLMG)	- (w556 * MILx * xUSA)			- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)	- (w556 * MILx * MILxKOR)	- (w556 * MILx * MILxPAC)	- (w556 * MILx * MILxEUR)			,
			"Base.M249E3",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xLMG)	- (w556 * MILx * xUSA)			- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)	- (w556 * MILx * MILxKOR)	- (w556 * MILx * MILxPAC)	- (w556 * MILx * MILxEUR)		- (w556 * MILx * x90)	,
			"Base.K3LMG",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xLMG)	- (w556 * MILx * xKOR)		- (w556 * MILx * MILxUSA)	- (w556 * MILx * MILxSOV)	- (w556 * MILx * MILxCZE)		- (w556 * MILx * MILxPAC)	- (w556 * MILx * MILxEUR)	- (w556 * MILx * MILxISR)		,
			"Base.AK47",	w762x39	 * MILx	- (w762x39 * x762x39)	- (w762x39 * MILx * xAUTO)	- (w762x39 * MILx * xSOV)		- (w762x39 * MILx * MILxUSA)		- (w762x39 * MILx * MILxCZE)	- (w762x39 * MILx * MILxKOR)		- (w762x39 * MILx * MILxEUR)			,
			"Base.AKM",	w762x39	 * MILx	- (w762x39 * x762x39)	- (w762x39 * MILx * xAUTO)	- (w762x39 * MILx * xSOV)		- (w762x39 * MILx * MILxUSA)		- (w762x39 * MILx * MILxCZE)	- (w762x39 * MILx * MILxKOR)		- (w762x39 * MILx * MILxEUR)			,
			"Base.AK103",	w762x39	 * MILx	- (w762x39 * x762x39)	- (w762x39 * MILx * xAUTO)	- (w762x39 * MILx * xSOV)		- (w762x39 * MILx * MILxUSA)		- (w762x39 * MILx * MILxCZE)	- (w762x39 * MILx * MILxKOR)		- (w762x39 * MILx * MILxEUR)	- (w762x39 * MILx * MILxISR)	- (w762x39 * MILx * x90)	,
			"Base.MD65_Stock",	w762x39	 * MILx	- (w762x39 * x762x39)	- (w762x39 * MILx * xAUTO)	- (w762x39 * MILx * xSOV)		- (w762x39 * MILx * MILxUSA)		- (w762x39 * MILx * MILxCZE)	- (w762x39 * MILx * MILxKOR)		- (w762x39 * MILx * MILxEUR)	- (w762x39 * MILx * MILxISR)		,
			"Base.AKMS_Stock",	w762x39	 * MILx	- (w762x39 * x762x39)	- (w762x39 * MILx * xAUTO)	- (w762x39 * MILx * xSOV)		- (w762x39 * MILx * MILxUSA)		- (w762x39 * MILx * MILxCZE)	- (w762x39 * MILx * MILxKOR)		- (w762x39 * MILx * MILxEUR)	- (w762x39 * MILx * MILxISR)		,
			"Base.Vz58",	w762x39	 * MILx	- (w762x39 * x762x39)	- (w762x39 * MILx * xAUTO)	- (w762x39 * MILx * xCZE)		- (w762x39 * MILx * MILxUSA)	- (w762x39 * MILx * MILxSOV)		- (w762x39 * MILx * MILxKOR)	- (w762x39 * MILx * MILxPAC)	- (w762x39 * MILx * MILxEUR)	- (w762x39 * MILx * MILxISR)		,
			"Base.Vz58_Stock",	w762x39	 * MILx	- (w762x39 * x762x39)	- (w762x39 * MILx * xAUTO)	- (w762x39 * MILx * xCZE)		- (w762x39 * MILx * MILxUSA)	- (w762x39 * MILx * MILxSOV)		- (w762x39 * MILx * MILxKOR)	- (w762x39 * MILx * MILxPAC)	- (w762x39 * MILx * MILxEUR)	- (w762x39 * MILx * MILxISR)		,
			"Base.Vz58_Mini_Stock",	w762x39	 * MILx	- (w762x39 * x762x39)	- (w762x39 * MILx * xAUTO)	- (w762x39 * MILx * xCZE)		- (w762x39 * MILx * MILxUSA)	- (w762x39 * MILx * MILxSOV)		- (w762x39 * MILx * MILxKOR)	- (w762x39 * MILx * MILxPAC)	- (w762x39 * MILx * MILxEUR)	- (w762x39 * MILx * MILxISR)		,
			"Base.SKS",	w762x39	 * MILx	- (w762x39 * x762x39)	- (w762x39 * MILx * xSEMI)	- (w762x39 * MILx * xSOV)		- (w762x39 * MILx * MILxUSA)		- (w762x39 * MILx * MILxCZE)	- (w762x39 * MILx * MILxKOR)		- (w762x39 * MILx * MILxEUR)	- (w762x39 * MILx * MILxISR)		,
			"Base.SKS_PARA",	w762x39	 * MILx	- (w762x39 * x762x39)	- (w762x39 * MILx * xSEMI)	- (w762x39 * MILx * xPAC)		- (w762x39 * MILx * MILxUSA)		- (w762x39 * MILx * MILxCZE)	- (w762x39 * MILx * MILxKOR)		- (w762x39 * MILx * MILxEUR)	- (w762x39 * MILx * MILxISR)		,
			"Base.MK47",	w762x39	 * MILx	- (w762x39 * x762x39)	- (w762x39 * MILx * xSEMI)	- (w762x39 * MILx * xUSA)	- (w762x39 * MILx * MILxNON)	- (w762x39 * MILx * MILxUSA)	- (w762x39 * MILx * MILxSOV)	- (w762x39 * MILx * MILxCZE)	- (w762x39 * MILx * MILxKOR)	- (w762x39 * MILx * MILxPAC)	- (w762x39 * MILx * MILxEUR)	- (w762x39 * MILx * MILxISR)	- (w762x39 * MILx * x90)	,
			"Base.AK308",	w308	 * MILx	- (w308 * x308)	- (w308 * MILx * xAUTO)	- (w308 * MILx * xSOV)		- (w308 * MILx * MILxUSA)		- (w308 * MILx * MILxCZE)	- (w308 * MILx * MILxKOR)	- (w308 * MILx * MILxPAC)	- (w308 * MILx * MILxEUR)	- (w308 * MILx * MILxISR)	- (w308 * MILx * x90)	,
			"Base.SCARH",	w308	 * MILx	- (w308 * x308)	- (w308 * MILx * xAUTO)	- (w308 * MILx * xEUR)			- (w308 * MILx * MILxSOV)	- (w308 * MILx * MILxCZE)	- (w308 * MILx * MILxKOR)	- (w308 * MILx * MILxPAC)	- (w308 * MILx * MILxEUR)	- (w308 * MILx * MILxISR)	- (w308 * MILx * x90)	,
			"Base.SCAR20",	w308	 * MILx	- (w308 * x308)	- (w308 * MILx * xAUTO)	- (w308 * MILx * xEUR)			- (w308 * MILx * MILxSOV)	- (w308 * MILx * MILxCZE)	- (w308 * MILx * MILxKOR)	- (w308 * MILx * MILxPAC)	- (w308 * MILx * MILxEUR)	- (w308 * MILx * MILxISR)	- (w308 * MILx * x90)	,
			"Base.G28",	w308	 * MILx	- (w308 * x308)	- (w308 * MILx * xAUTO)	- (w308 * MILx * xEUR)		- (w308 * MILx * MILxUSA)	- (w308 * MILx * MILxSOV)	- (w308 * MILx * MILxCZE)	- (w308 * MILx * MILxKOR)	- (w308 * MILx * MILxPAC)		- (w308 * MILx * MILxISR)	- (w308 * MILx * x90)	,
			"Base.G3",	w308	 * MILx	- (w308 * x308)	- (w308 * MILx * xAUTO)	- (w308 * MILx * xEUR)		- (w308 * MILx * MILxUSA)	- (w308 * MILx * MILxSOV)	- (w308 * MILx * MILxCZE)	- (w308 * MILx * MILxKOR)	- (w308 * MILx * MILxPAC)		- (w308 * MILx * MILxISR)		,
			"Base.Type64",	w308	 * MILx	- (w308 * x308)	- (w308 * MILx * xAUTO)	- (w308 * MILx * xPAC)		- (w308 * MILx * MILxUSA)	- (w308 * MILx * MILxSOV)	- (w308 * MILx * MILxCZE)		- (w308 * MILx * MILxPAC)	- (w308 * MILx * MILxEUR)	- (w308 * MILx * MILxISR)		,
			"Base.FAL",	w308	 * MILx	- (w308 * x308)	- (w308 * MILx * xAUTO)	- (w308 * MILx * xEUR)		- (w308 * MILx * MILxUSA)	- (w308 * MILx * MILxSOV)	- (w308 * MILx * MILxCZE)	- (w308 * MILx * MILxKOR)	- (w308 * MILx * MILxPAC)		- (w308 * MILx * MILxISR)		,
			"Base.FAL_PARA_Stock",	w308	 * MILx	- (w308 * x308)	- (w308 * MILx * xAUTO)	- (w308 * MILx * xEUR)		- (w308 * MILx * MILxUSA)	- (w308 * MILx * MILxSOV)	- (w308 * MILx * MILxCZE)	- (w308 * MILx * MILxKOR)	- (w308 * MILx * MILxPAC)		- (w308 * MILx * MILxISR)		,
			"Base.FN_FNC",	w308	 * MILx	- (w308 * x308)	- (w308 * MILx * xAUTO)	- (w308 * MILx * xEUR)		- (w308 * MILx * MILxUSA)	- (w308 * MILx * MILxSOV)	- (w308 * MILx * MILxCZE)	- (w308 * MILx * MILxKOR)	- (w308 * MILx * MILxPAC)		- (w308 * MILx * MILxISR)		,
			"Base.WA2000",	w308	 * MILx	- (w308 * x308)	- (w308 * MILx * xBOLT)	- (w308 * MILx * xEUR)	- (w308 * MILx * MILxNON)	- (w308 * MILx * MILxUSA)	- (w308 * MILx * MILxSOV)	- (w308 * MILx * MILxCZE)	- (w308 * MILx * MILxKOR)	- (w308 * MILx * MILxPAC)	- (w308 * MILx * MILxEUR)	- (w308 * MILx * MILxISR)		,
			"Base.SVD",	w762x54r	 * MILx	- (w762x54r * x762x54r)	- (w762x54r * MILx * xSEMI)	- (w762x54r * MILx * xSOV)		- (w762x54r * MILx * MILxUSA)			- (w762x54r * MILx * MILxKOR)		- (w762x54r * MILx * MILxEUR)	- (w762x54r * MILx * MILxISR)		,
			"Base.SVDK",	w762x54r	 * MILx	- (w762x54r * x762x54r)	- (w762x54r * MILx * xSEMI)	- (w762x54r * MILx * xSOV)		- (w762x54r * MILx * MILxUSA)			- (w762x54r * MILx * MILxKOR)		- (w762x54r * MILx * MILxEUR)	- (w762x54r * MILx * MILxISR)		,
			"Base.M14EBR",	w308	 * MILx	- (w308 * x308)	- (w308 * MILx * xAUTO)	- (w308 * MILx * xUSA)			- (w308 * MILx * MILxSOV)	- (w308 * MILx * MILxCZE)	- (w308 * MILx * MILxKOR)	- (w308 * MILx * MILxPAC)	- (w308 * MILx * MILxEUR)		- (w308 * MILx * x90)	,
			"Base.M14",	w308	 * MILx	- (w308 * x308)	- (w308 * MILx * xAUTO)	- (w308 * MILx * xUSA)			- (w308 * MILx * MILxSOV)	- (w308 * MILx * MILxCZE)	- (w308 * MILx * MILxKOR)	- (w308 * MILx * MILxPAC)	- (w308 * MILx * MILxEUR)			,
			"Base.K14",	w308	 * MILx	- (w308 * x308)	- (w308 * MILx * xBOLT)	- (w308 * MILx * xKOR)		- (w308 * MILx * MILxUSA)	- (w308 * MILx * MILxSOV)	- (w308 * MILx * MILxCZE)		- (w308 * MILx * MILxPAC)	- (w308 * MILx * MILxEUR)	- (w308 * MILx * MILxISR)	- (w308 * MILx * x90)	,
			"Base.Savage12",	w308	 * MILx	- (w308 * x308)	- (w308 * MILx * xBOLT)	- (w308 * MILx * xUSA)	- (w308 * MILx * MILxNON)	- (w308 * MILx * MILxUSA)	- (w308 * MILx * MILxSOV)	- (w308 * MILx * MILxCZE)	- (w308 * MILx * MILxKOR)	- (w308 * MILx * MILxPAC)	- (w308 * MILx * MILxEUR)	- (w308 * MILx * MILxISR)		,
			"Base.Ruger_No1_3006",	w3006	 * MILx	- (w3006 * x3006)	- (w3006 * MILx * xBREAK)	- (w3006 * MILx * xUSA)	- (w3006 * MILx * MILxNON)	- (w3006 * MILx * MILxUSA)	- (w3006 * MILx * MILxSOV)	- (w3006 * MILx * MILxCZE)	- (w3006 * MILx * MILxKOR)	- (w3006 * MILx * MILxPAC)	- (w3006 * MILx * MILxEUR)	- (w3006 * MILx * MILxISR)		,
			"Base.M40",	w308	 * MILx	- (w308 * x308)	- (w308 * MILx * xBOLT)	- (w308 * MILx * xUSA)	- (w308 * MILx * MILxNON)	- (w308 * MILx * MILxUSA)	- (w308 * MILx * MILxSOV)	- (w308 * MILx * MILxCZE)	- (w308 * MILx * MILxKOR)	- (w308 * MILx * MILxPAC)	- (w308 * MILx * MILxEUR)	- (w308 * MILx * MILxISR)		,
			"Base.M40A1",	w308	 * MILx	- (w308 * x308)	- (w308 * MILx * xBOLT)	- (w308 * MILx * xUSA)	- (w308 * MILx * MILxNON)	- (w308 * MILx * MILxUSA)	- (w308 * MILx * MILxSOV)	- (w308 * MILx * MILxCZE)	- (w308 * MILx * MILxKOR)	- (w308 * MILx * MILxPAC)	- (w308 * MILx * MILxEUR)	- (w308 * MILx * MILxISR)		,
			"Base.M40A2",	w308	 * MILx	- (w308 * x308)	- (w308 * MILx * xBOLT)	- (w308 * MILx * xUSA)			- (w308 * MILx * MILxSOV)	- (w308 * MILx * MILxCZE)	- (w308 * MILx * MILxKOR)	- (w308 * MILx * MILxPAC)	- (w308 * MILx * MILxEUR)			,
			"Base.M40A3",	w308	 * MILx	- (w308 * x308)	- (w308 * MILx * xBOLT)	- (w308 * MILx * xUSA)			- (w308 * MILx * MILxSOV)	- (w308 * MILx * MILxCZE)	- (w308 * MILx * MILxKOR)	- (w308 * MILx * MILxPAC)	- (w308 * MILx * MILxEUR)			,
			"Base.Mosin",	w762x54r	 * MILx	- (w762x54r * x762x54r)	- (w762x54r * MILx * xBOLT)	- (w762x54r * MILx * xSOV)	- (w762x54r * MILx * MILxNON)	- (w762x54r * MILx * MILxUSA)	- (w762x54r * MILx * MILxSOV)	- (w762x54r * MILx * MILxCZE)	- (w762x54r * MILx * MILxKOR)	- (w762x54r * MILx * MILxPAC)	- (w762x54r * MILx * MILxEUR)	- (w762x54r * MILx * MILxISR)		,
			"Base.MosinObrez_Pistol",	w762x54r	 * MILx	- (w762x54r * x762x54r)	- (w762x54r * MILx * xBOLT)	- (w762x54r * MILx * xSOV)	- (w762x54r * MILx * MILxNON)	- (w762x54r * MILx * MILxUSA)	- (w762x54r * MILx * MILxSOV)	- (w762x54r * MILx * MILxCZE)	- (w762x54r * MILx * MILxKOR)	- (w762x54r * MILx * MILxPAC)	- (w762x54r * MILx * MILxEUR)	- (w762x54r * MILx * MILxISR)		,
			"Base.M1",	w3006	 * MILx	- (w3006 * x3006)	- (w3006 * MILx * xSEMI)	- (w3006 * MILx * xUSA)	- (w3006 * MILx * MILxNON)	- (w3006 * MILx * MILxUSA)	- (w3006 * MILx * MILxSOV)	- (w3006 * MILx * MILxCZE)	- (w3006 * MILx * MILxKOR)	- (w3006 * MILx * MILxPAC)	- (w3006 * MILx * MILxEUR)	- (w3006 * MILx * MILxISR)		,
			"Base.M1903",	w3006	 * MILx	- (w3006 * x3006)	- (w3006 * MILx * xBOLT)	- (w3006 * MILx * xUSA)	- (w3006 * MILx * MILxNON)	- (w3006 * MILx * MILxUSA)	- (w3006 * MILx * MILxSOV)	- (w3006 * MILx * MILxCZE)	- (w3006 * MILx * MILxKOR)	- (w3006 * MILx * MILxPAC)	- (w3006 * MILx * MILxEUR)	- (w3006 * MILx * MILxISR)		,
			"Base.BAR",	w3006	 * MILx	- (w3006 * x3006)	- (w3006 * MILx * xAUTO)	- (w3006 * MILx * xUSA)	- (w3006 * MILx * MILxNON)	- (w3006 * MILx * MILxUSA)	- (w3006 * MILx * MILxSOV)	- (w3006 * MILx * MILxCZE)	- (w3006 * MILx * MILxKOR)	- (w3006 * MILx * MILxPAC)	- (w3006 * MILx * MILxEUR)	- (w3006 * MILx * MILxISR)		,
			"Base.BAR_Monitor",	w3006	 * MILx	- (w3006 * x3006)	- (w3006 * MILx * xAUTO)	- (w3006 * MILx * xUSA)	- (w3006 * MILx * MILxNON)	- (w3006 * MILx * MILxUSA)	- (w3006 * MILx * MILxSOV)	- (w3006 * MILx * MILxCZE)	- (w3006 * MILx * MILxKOR)	- (w3006 * MILx * MILxPAC)	- (w3006 * MILx * MILxEUR)	- (w3006 * MILx * MILxISR)		,
			"Base.MAS36",	w308	 * MILx	- (w308 * x308)	- (w308 * MILx * xAUTO)	- (w308 * MILx * xEUR)	- (w308 * MILx * MILxNON)	- (w308 * MILx * MILxUSA)	- (w308 * MILx * MILxSOV)	- (w308 * MILx * MILxCZE)	- (w308 * MILx * MILxKOR)	- (w308 * MILx * MILxPAC)	- (w308 * MILx * MILxEUR)	- (w308 * MILx * MILxISR)		,
			"Base.MAS44",	w308	 * MILx	- (w308 * x308)	- (w308 * MILx * xAUTO)	- (w308 * MILx * xEUR)	- (w308 * MILx * MILxNON)	- (w308 * MILx * MILxUSA)	- (w308 * MILx * MILxSOV)	- (w308 * MILx * MILxCZE)	- (w308 * MILx * MILxKOR)	- (w308 * MILx * MILxPAC)	- (w308 * MILx * MILxEUR)	- (w308 * MILx * MILxISR)		,
			"Base.MAS49",	w308	 * MILx	- (w308 * x308)	- (w308 * MILx * xAUTO)	- (w308 * MILx * xEUR)	- (w308 * MILx * MILxNON)	- (w308 * MILx * MILxUSA)	- (w308 * MILx * MILxSOV)	- (w308 * MILx * MILxCZE)	- (w308 * MILx * MILxKOR)	- (w308 * MILx * MILxPAC)	- (w308 * MILx * MILxEUR)	- (w308 * MILx * MILxISR)		,
			"Base.Win_1895",	w308	 * MILx	- (w308 * x308)	- (w308 * MILx * xLEVER)	- (w308 * MILx * xUSA)	- (w308 * MILx * MILxNON)	- (w308 * MILx * MILxUSA)	- (w308 * MILx * MILxSOV)	- (w308 * MILx * MILxCZE)	- (w308 * MILx * MILxKOR)	- (w308 * MILx * MILxPAC)	- (w308 * MILx * MILxEUR)	- (w308 * MILx * MILxISR)		,
			"Base.Galil",	w308	 * MILx	- (w308 * x308)	- (w308 * MILx * xAUTO)	- (w308 * MILx * xISR)		- (w308 * MILx * MILxUSA)	- (w308 * MILx * MILxSOV)	- (w308 * MILx * MILxCZE)	- (w308 * MILx * MILxKOR)	- (w308 * MILx * MILxPAC)	- (w308 * MILx * MILxEUR)			,
			"Base.Galil_Sniper",	w308	 * MILx	- (w308 * x308)	- (w308 * MILx * xAUTO)	- (w308 * MILx * xISR)		- (w308 * MILx * MILxUSA)	- (w308 * MILx * MILxSOV)	- (w308 * MILx * MILxCZE)	- (w308 * MILx * MILxKOR)	- (w308 * MILx * MILxPAC)	- (w308 * MILx * MILxEUR)			,
			"Base.Thompson_Center_3006",	w3006	 * MILx	- (w3006 * x3006)	- (w3006 * MILx * xBREAK)	- (w3006 * MILx * xUSA)	- (w3006 * MILx * MILxNON)	- (w3006 * MILx * MILxUSA)	- (w3006 * MILx * MILxSOV)	- (w3006 * MILx * MILxCZE)	- (w3006 * MILx * MILxKOR)	- (w3006 * MILx * MILxPAC)	- (w3006 * MILx * MILxEUR)	- (w3006 * MILx * MILxISR)		,
			"Base.Type38",	w308	 * MILx	- (w308 * x308)	- (w308 * MILx * xBOLT)	- (w308 * MILx * xPAC)		- (w308 * MILx * MILxUSA)	- (w308 * MILx * MILxSOV)	- (w308 * MILx * MILxCZE)	- (w308 * MILx * MILxKOR)			- (w308 * MILx * MILxISR)		,
			"Base.Type99",	w308	 * MILx	- (w308 * x308)	- (w308 * MILx * xBOLT)	- (w308 * MILx * xPAC)		- (w308 * MILx * MILxUSA)	- (w308 * MILx * MILxSOV)	- (w308 * MILx * MILxCZE)	- (w308 * MILx * MILxKOR)		- (w308 * MILx * MILxEUR)	- (w308 * MILx * MILxISR)		,
			"Base.L96",	w308	 * MILx	- (w308 * x308)	- (w308 * MILx * xBOLT)	- (w308 * MILx * xEUR)			- (w308 * MILx * MILxSOV)	- (w308 * MILx * MILxCZE)	- (w308 * MILx * MILxKOR)	- (w308 * MILx * MILxPAC)		- (w308 * MILx * MILxISR)		,
			"Base.M240",	w308	 * MILx	- (w308 * x308)	- (w308 * MILx * xLMG)	- (w308 * MILx * xUSA)				- (w308 * MILx * MILxCZE)			- (w308 * MILx * MILxEUR)	- (w308 * MILx * MILxISR)		,
			"Base.G21LMG",	w308	 * MILx	- (w308 * x308)	- (w308 * MILx * xLMG)	- (w308 * MILx * xEUR)		- (w308 * MILx * MILxUSA)	- (w308 * MILx * MILxSOV)	- (w308 * MILx * MILxCZE)	- (w308 * MILx * MILxKOR)	- (w308 * MILx * MILxPAC)		- (w308 * MILx * MILxISR)	- (w308 * MILx * x90)	,
			"Base.K12",	w308	 * MILx	- (w308 * x308)	- (w308 * MILx * xLMG)	- (w308 * MILx * xKOR)		- (w308 * MILx * MILxUSA)	- (w308 * MILx * MILxSOV)	- (w308 * MILx * MILxCZE)		- (w308 * MILx * MILxPAC)	- (w308 * MILx * MILxEUR)	- (w308 * MILx * MILxISR)	- (w308 * MILx * x90)	,
			"Base.PKM",	w762x54r	 * MILx	- (w762x54r * x762x54r)	- (w762x54r * MILx * xLMG)	- (w762x54r * MILx * xSOV)		- (w762x54r * MILx * MILxUSA)			- (w762x54r * MILx * MILxKOR)		- (w762x54r * MILx * MILxEUR)			,
			"Base.MG42",	w308	 * MILx	- (w308 * x308)	- (w308 * MILx * xLMG)	- (w308 * MILx * xEUR)	- (w308 * MILx * MILxNON)	- (w308 * MILx * MILxUSA)	- (w308 * MILx * MILxSOV)	- (w308 * MILx * MILxCZE)	- (w308 * MILx * MILxKOR)	- (w308 * MILx * MILxPAC)	- (w308 * MILx * MILxEUR)	- (w308 * MILx * MILxISR)		,
			"Base.M60",	w308	 * MILx	- (w308 * x308)	- (w308 * MILx * xLMG)	- (w308 * MILx * xUSA)			- (w308 * MILx * MILxSOV)			- (w308 * MILx * MILxPAC)				,
			"Base.MK43",	w308	 * MILx	- (w308 * x308)	- (w308 * MILx * xLMG)	- (w308 * MILx * xUSA)			- (w308 * MILx * MILxSOV)		- (w308 * MILx * MILxKOR)	- (w308 * MILx * MILxPAC)	- (w308 * MILx * MILxEUR)	- (w308 * MILx * MILxISR)	- (w308 * MILx * x90)	,
			"Base.RPD",	w762x39	 * MILx	- (w762x39 * x762x39)	- (w762x39 * MILx * xLMG)	- (w762x39 * MILx * xSOV)		- (w762x39 * MILx * MILxUSA)		- (w762x39 * MILx * MILxCZE)	- (w762x39 * MILx * MILxKOR)		- (w762x39 * MILx * MILxEUR)	- (w762x39 * MILx * MILxISR)		,
			"Base.BOAR",	wBMG	 * MILx	- (wBMG * xBMG)	- (wBMG * MILx * xBREAK)	- (wBMG * MILx * xUSA)	- (wBMG * MILx * MILxNON)	- (wBMG * MILx * MILxUSA)	- (wBMG * MILx * MILxSOV)	- (wBMG * MILx * MILxCZE)	- (wBMG * MILx * MILxKOR)	- (wBMG * MILx * MILxPAC)	- (wBMG * MILx * MILxEUR)	- (wBMG * MILx * MILxISR)		,
			"Base.EDM96",	wBMG	 * MILx	- (wBMG * xBMG)	- (wBMG * MILx * xBOLT)	- (wBMG * MILx * xUSA)	- (wBMG * MILx * MILxNON)	- (wBMG * MILx * MILxUSA)	- (wBMG * MILx * MILxSOV)	- (wBMG * MILx * MILxCZE)	- (wBMG * MILx * MILxKOR)	- (wBMG * MILx * MILxPAC)	- (wBMG * MILx * MILxEUR)	- (wBMG * MILx * MILxISR)	- (wBMG * MILx * x90)	,
			"Base.M82",	wBMG	 * MILx	- (wBMG * xBMG)	- (wBMG * MILx * xSEMI)	- (wBMG * MILx * xUSA)			- (wBMG * MILx * MILxSOV)		- (wBMG * MILx * MILxKOR)	- (wBMG * MILx * MILxPAC)				,
			"Base.BFG50",	wBMG	 * MILx	- (wBMG * xBMG)	- (wBMG * MILx * xBREAK)	- (wBMG * MILx * xUSA)	- (wBMG * MILx * MILxNON)	- (wBMG * MILx * MILxUSA)	- (wBMG * MILx * MILxSOV)	- (wBMG * MILx * MILxCZE)	- (wBMG * MILx * MILxKOR)	- (wBMG * MILx * MILxPAC)	- (wBMG * MILx * MILxEUR)	- (wBMG * MILx * MILxISR)	- (wBMG * MILx * x90)	,
			"Base.Harris50",	wBMG	 * MILx	- (wBMG * xBMG)	- (wBMG * MILx * xBOLT)	- (wBMG * MILx * xUSA)			- (wBMG * MILx * MILxSOV)	- (wBMG * MILx * MILxCZE)	- (wBMG * MILx * MILxKOR)	- (wBMG * MILx * MILxPAC)	- (wBMG * MILx * MILxEUR)	- (wBMG * MILx * MILxISR)		,
			"Base.TAC50",	wBMG	 * MILx	- (wBMG * xBMG)	- (wBMG * MILx * xBOLT)	- (wBMG * MILx * xUSA)			- (wBMG * MILx * MILxSOV)	- (wBMG * MILx * MILxCZE)	- (wBMG * MILx * MILxKOR)	- (wBMG * MILx * MILxPAC)	- (wBMG * MILx * MILxEUR)			,
			"Base.Ash",	wBMG	 * MILx	- (wBMG * xBMG)	- (wBMG * MILx * xAUTO)	- (wBMG * MILx * xSOV)		- (wBMG * MILx * MILxUSA)		- (wBMG * MILx * MILxCZE)	- (wBMG * MILx * MILxKOR)	- (wBMG * MILx * MILxPAC)	- (wBMG * MILx * MILxEUR)	- (wBMG * MILx * MILxISR)	- (wBMG * MILx * x90)	,
			"Base.SW_M500",	wBMG	 * MILx	- (wBMG * xBMG)	- (wBMG * MILx * xREV)	- (wBMG * MILx * xUSA)	- (wBMG * MILx * MILxNON)	- (wBMG * MILx * MILxUSA)	- (wBMG * MILx * MILxSOV)	- (wBMG * MILx * MILxCZE)	- (wBMG * MILx * MILxKOR)	- (wBMG * MILx * MILxPAC)	- (wBMG * MILx * MILxEUR)	- (wBMG * MILx * MILxISR)	- (wBMG * MILx * x90)	,
			"Base.SPAS12_Fixed",	w12g	 * MILx	- (w12g * x12g)	- (w12g * MILx * xSEMI)	- (w12g * MILx * xEUR)	- (w12g * MILx * MILxNON)	- (w12g * MILx * MILxUSA)	- (w12g * MILx * MILxSOV)	- (w12g * MILx * MILxCZE)	- (w12g * MILx * MILxKOR)	- (w12g * MILx * MILxPAC)	- (w12g * MILx * MILxEUR)	- (w12g * MILx * MILxISR)		,
			"Base.SPAS12_Fold",	w12g	 * MILx	- (w12g * x12g)	- (w12g * MILx * xSEMI)	- (w12g * MILx * xEUR)	- (w12g * MILx * MILxNON)	- (w12g * MILx * MILxUSA)	- (w12g * MILx * MILxSOV)	- (w12g * MILx * MILxCZE)	- (w12g * MILx * MILxKOR)	- (w12g * MILx * MILxPAC)	- (w12g * MILx * MILxEUR)	- (w12g * MILx * MILxISR)		,
			"Base.Origin",	w12g	 * MILx	- (w12g * x12g)	- (w12g * MILx * xSEMI)	- (w12g * MILx * xUSA)	- (w12g * MILx * MILxNON)	- (w12g * MILx * MILxUSA)	- (w12g * MILx * MILxSOV)	- (w12g * MILx * MILxCZE)	- (w12g * MILx * MILxKOR)	- (w12g * MILx * MILxPAC)	- (w12g * MILx * MILxEUR)	- (w12g * MILx * MILxISR)	- (w12g * MILx * x90)	,
			"Base.SPAS_15",	w12g	 * MILx	- (w12g * x12g)	- (w12g * MILx * xSEMI)	- (w12g * MILx * xEUR)	- (w12g * MILx * MILxNON)	- (w12g * MILx * MILxUSA)	- (w12g * MILx * MILxSOV)	- (w12g * MILx * MILxCZE)	- (w12g * MILx * MILxKOR)	- (w12g * MILx * MILxPAC)		- (w12g * MILx * MILxISR)		,
			"Base.USAS_12",	w12g	 * MILx	- (w12g * x12g)	- (w12g * MILx * xAUTO)	- (w12g * MILx * xKOR)		- (w12g * MILx * MILxUSA)	- (w12g * MILx * MILxSOV)	- (w12g * MILx * MILxCZE)		- (w12g * MILx * MILxPAC)	- (w12g * MILx * MILxEUR)	- (w12g * MILx * MILxISR)		,
			"Base.Shorty_Pistol",	w12g	 * MILx	- (w12g * x12g)	- (w12g * MILx * xPUMP)	- (w12g * MILx * xUSA)	- (w12g * MILx * MILxNON)	- (w12g * MILx * MILxUSA)	- (w12g * MILx * MILxSOV)	- (w12g * MILx * MILxCZE)	- (w12g * MILx * MILxKOR)	- (w12g * MILx * MILxPAC)	- (w12g * MILx * MILxEUR)	- (w12g * MILx * MILxISR)	- (w12g * MILx * x90)	,
			"Base.R11_87",	w12g	 * MILx	- (w12g * x12g)	- (w12g * MILx * xSEMI)	- (w12g * MILx * xUSA)	- (w12g * MILx * MILxNON)	- (w12g * MILx * MILxUSA)	- (w12g * MILx * MILxSOV)	- (w12g * MILx * MILxCZE)	- (w12g * MILx * MILxKOR)	- (w12g * MILx * MILxPAC)	- (w12g * MILx * MILxEUR)	- (w12g * MILx * MILxISR)		,
			"Base.M870",	w12g	 * MILx	- (w12g * x12g)	- (w12g * MILx * xPUMP)	- (w12g * MILx * xUSA)		- (w12g * MILx * MILxUSA)	- (w12g * MILx * MILxSOV)	- (w12g * MILx * MILxCZE)		- (w12g * MILx * MILxPAC)	- (w12g * MILx * MILxEUR)			,
			"Base.M1897",	w12g	 * MILx	- (w12g * x12g)	- (w12g * MILx * xPUMP)	- (w12g * MILx * xUSA)	- (w12g * MILx * MILxNON)	- (w12g * MILx * MILxUSA)	- (w12g * MILx * MILxSOV)	- (w12g * MILx * MILxCZE)	- (w12g * MILx * MILxKOR)	- (w12g * MILx * MILxPAC)	- (w12g * MILx * MILxEUR)	- (w12g * MILx * MILxISR)		,
			"Base.DT11",	w12g	 * MILx	- (w12g * x12g)	- (w12g * MILx * xBREAK)	- (w12g * MILx * xEUR)	- (w12g * MILx * MILxNON)	- (w12g * MILx * MILxUSA)	- (w12g * MILx * MILxSOV)	- (w12g * MILx * MILxCZE)	- (w12g * MILx * MILxKOR)	- (w12g * MILx * MILxPAC)	- (w12g * MILx * MILxEUR)	- (w12g * MILx * MILxISR)		,
			"Base.Coachgun",	w12g	 * MILx	- (w12g * x12g)	- (w12g * MILx * xBREAK)	- (w12g * MILx * xUSA)	- (w12g * MILx * MILxNON)	- (w12g * MILx * MILxUSA)	- (w12g * MILx * MILxSOV)	- (w12g * MILx * MILxCZE)	- (w12g * MILx * MILxKOR)	- (w12g * MILx * MILxPAC)	- (w12g * MILx * MILxEUR)	- (w12g * MILx * MILxISR)		,
			"Base.Terminator",	w12g	 * MILx	- (w12g * x12g)	- (w12g * MILx * xBREAK)	- (w12g * MILx * xUSA)	- (w12g * MILx * MILxNON)	- (w12g * MILx * MILxUSA)	- (w12g * MILx * MILxSOV)	- (w12g * MILx * MILxCZE)	- (w12g * MILx * MILxKOR)	- (w12g * MILx * MILxPAC)	- (w12g * MILx * MILxEUR)	- (w12g * MILx * MILxISR)		,
			"Base.SIX12",	w12g	 * MILx	- (w12g * x12g)	- (w12g * MILx * xREV)	- (w12g * MILx * xUSA)			- (w12g * MILx * MILxSOV)	- (w12g * MILx * MILxCZE)	- (w12g * MILx * MILxKOR)	- (w12g * MILx * MILxPAC)	- (w12g * MILx * MILxEUR)	- (w12g * MILx * MILxISR)	- (w12g * MILx * x90)	,
			"Base.SIX12SD",	w12g	 * MILx	- (w12g * x12g)	- (w12g * MILx * xREV)	- (w12g * MILx * xUSA)			- (w12g * MILx * MILxSOV)	- (w12g * MILx * MILxCZE)	- (w12g * MILx * MILxKOR)	- (w12g * MILx * MILxPAC)	- (w12g * MILx * MILxEUR)	- (w12g * MILx * MILxISR)	- (w12g * MILx * x90)	,
			"Base.M870_Wingmaster",	w12g	 * MILx	- (w12g * x12g)	- (w12g * MILx * xPUMP)	- (w12g * MILx * xUSA)	- (w12g * MILx * MILxNON)	- (w12g * MILx * MILxUSA)	- (w12g * MILx * MILxSOV)	- (w12g * MILx * MILxCZE)	- (w12g * MILx * MILxKOR)	- (w12g * MILx * MILxPAC)	- (w12g * MILx * MILxEUR)	- (w12g * MILx * MILxISR)		,
			"Base.M870_Police",	w12g	 * MILx	- (w12g * x12g)	- (w12g * MILx * xPUMP)	- (w12g * MILx * xUSA)		- (w12g * MILx * MILxUSA)	- (w12g * MILx * MILxSOV)			- (w12g * MILx * MILxPAC)				,
			"Base.M870_MCS",	w12g	 * MILx	- (w12g * x12g)	- (w12g * MILx * xPUMP)	- (w12g * MILx * xUSA)		- (w12g * MILx * MILxUSA)	- (w12g * MILx * MILxSOV)			- (w12g * MILx * MILxPAC)	- (w12g * MILx * MILxEUR)			,
			"Base.M870_CQB",	w12g	 * MILx	- (w12g * x12g)	- (w12g * MILx * xPUMP)	- (w12g * MILx * xUSA)		- (w12g * MILx * MILxUSA)	- (w12g * MILx * MILxSOV)			- (w12g * MILx * MILxPAC)	- (w12g * MILx * MILxEUR)			,
			"Base.M870_Breaching_Pistol",	w12g	 * MILx	- (w12g * x12g)	- (w12g * MILx * xPUMP)	- (w12g * MILx * xUSA)		- (w12g * MILx * MILxUSA)	- (w12g * MILx * MILxSOV)			- (w12g * MILx * MILxPAC)	- (w12g * MILx * MILxEUR)			,
			"Base.M870_Express",	w12g	 * MILx	- (w12g * x12g)	- (w12g * MILx * xPUMP)	- (w12g * MILx * xUSA)	- (w12g * MILx * MILxNON)	- (w12g * MILx * MILxUSA)	- (w12g * MILx * MILxSOV)	- (w12g * MILx * MILxCZE)	- (w12g * MILx * MILxKOR)	- (w12g * MILx * MILxPAC)	- (w12g * MILx * MILxEUR)	- (w12g * MILx * MILxISR)		,
			"Base.A400",	w12g	 * MILx	- (w12g * x12g)	- (w12g * MILx * xSEMI)	- (w12g * MILx * xEUR)	- (w12g * MILx * MILxNON)	- (w12g * MILx * MILxUSA)	- (w12g * MILx * MILxSOV)	- (w12g * MILx * MILxCZE)	- (w12g * MILx * MILxKOR)	- (w12g * MILx * MILxPAC)	- (w12g * MILx * MILxEUR)	- (w12g * MILx * MILxISR)	- (w12g * MILx * x90)	,
			"Base.M1014",	w12g	 * MILx	- (w12g * x12g)	- (w12g * MILx * xSEMI)	- (w12g * MILx * xEUR)			- (w12g * MILx * MILxSOV)			- (w12g * MILx * MILxPAC)		- (w12g * MILx * MILxISR)	- (w12g * MILx * x90)	,
			"Base.M1014_Fold",	w12g	 * MILx	- (w12g * x12g)	- (w12g * MILx * xSEMI)	- (w12g * MILx * xEUR)			- (w12g * MILx * MILxSOV)			- (w12g * MILx * MILxPAC)		- (w12g * MILx * MILxISR)	- (w12g * MILx * x90)	,
			"Base.M1014_Wick",	w12g	 * MILx	- (w12g * x12g)	- (w12g * MILx * xSEMI)	- (w12g * MILx * xEUR)	- (w12g * MILx * MILxNON)	- (w12g * MILx * MILxUSA)	- (w12g * MILx * MILxSOV)	- (w12g * MILx * MILxCZE)	- (w12g * MILx * MILxKOR)	- (w12g * MILx * MILxPAC)	- (w12g * MILx * MILxEUR)	- (w12g * MILx * MILxISR)	- (w12g * MILx * x90)	,
			"Base.DAO12",	w12g	 * MILx	- (w12g * x12g)	- (w12g * MILx * xREV)	- (w12g * MILx * xREST)	- (w12g * MILx * MILxNON)	- (w12g * MILx * MILxUSA)	- (w12g * MILx * MILxSOV)	- (w12g * MILx * MILxCZE)	- (w12g * MILx * MILxKOR)	- (w12g * MILx * MILxPAC)	- (w12g * MILx * MILxEUR)			,
			"Base.M1887",	w12g	 * MILx	- (w12g * x12g)	- (w12g * MILx * xLEVER)	- (w12g * MILx * xUSA)	- (w12g * MILx * MILxNON)	- (w12g * MILx * MILxUSA)	- (w12g * MILx * MILxSOV)	- (w12g * MILx * MILxCZE)	- (w12g * MILx * MILxKOR)	- (w12g * MILx * MILxPAC)	- (w12g * MILx * MILxEUR)	- (w12g * MILx * MILxISR)		,
			"Base.M1208",	w12g	 * MILx	- (w12g * x12g)	- (w12g * MILx * xREV)	- (w12g * MILx * xUSA)	- (w12g * MILx * MILxNON)	- (w12g * MILx * MILxUSA)	- (w12g * MILx * MILxSOV)	- (w12g * MILx * MILxCZE)	- (w12g * MILx * MILxKOR)	- (w12g * MILx * MILxPAC)	- (w12g * MILx * MILxEUR)	- (w12g * MILx * MILxISR)	- (w12g * MILx * x90)	,
			"Base.M1212",	w12g	 * MILx	- (w12g * x12g)	- (w12g * MILx * xREV)	- (w12g * MILx * xUSA)	- (w12g * MILx * MILxNON)	- (w12g * MILx * MILxUSA)	- (w12g * MILx * MILxSOV)	- (w12g * MILx * MILxCZE)	- (w12g * MILx * MILxKOR)	- (w12g * MILx * MILxPAC)	- (w12g * MILx * MILxEUR)	- (w12g * MILx * MILxISR)	- (w12g * MILx * x90)	,
			"Base.M1216",	w12g	 * MILx	- (w12g * x12g)	- (w12g * MILx * xREV)	- (w12g * MILx * xUSA)	- (w12g * MILx * MILxNON)	- (w12g * MILx * MILxUSA)	- (w12g * MILx * MILxSOV)	- (w12g * MILx * MILxCZE)	- (w12g * MILx * MILxKOR)	- (w12g * MILx * MILxPAC)	- (w12g * MILx * MILxEUR)	- (w12g * MILx * MILxISR)	- (w12g * MILx * x90)	,
			"Base.AA12",	w12g	 * MILx	- (w12g * x12g)	- (w12g * MILx * xAUTO)	- (w12g * MILx * xUSA)			- (w12g * MILx * MILxSOV)	- (w12g * MILx * MILxCZE)	- (w12g * MILx * MILxKOR)	- (w12g * MILx * MILxPAC)	- (w12g * MILx * MILxEUR)	- (w12g * MILx * MILxISR)	- (w12g * MILx * x90)	,
			"Base.CAWS",	w12g	 * MILx	- (w12g * x12g)	- (w12g * MILx * xAUTO)	- (w12g * MILx * xEUR)		- (w12g * MILx * MILxUSA)	- (w12g * MILx * MILxSOV)	- (w12g * MILx * MILxCZE)	- (w12g * MILx * MILxKOR)	- (w12g * MILx * MILxPAC)				,
			"Base.ROYAL_SXS",	w10g	 * MILx	- (w10g * x10g)	- (w10g * MILx * xBREAK)	- (w10g * MILx * xEUR)	- (w10g * MILx * MILxNON)	- (w10g * MILx * MILxUSA)	- (w10g * MILx * MILxSOV)	- (w10g * MILx * MILxCZE)	- (w10g * MILx * MILxKOR)	- (w10g * MILx * MILxPAC)	- (w10g * MILx * MILxEUR)	- (w10g * MILx * MILxISR)		,
			"Base.KS23",	w4g	 * MILx	- (w4g * x4g)	- (w4g * MILx * xPUMP)	- (w4g * MILx * xSOV)	- (w4g * MILx * MILxNON)	- (w4g * MILx * MILxUSA)	- (w4g * MILx * MILxSOV)	- (w4g * MILx * MILxCZE)	- (w4g * MILx * MILxKOR)	- (w4g * MILx * MILxPAC)	- (w4g * MILx * MILxEUR)	- (w4g * MILx * MILxISR)		,
			"Base.KS23_S_Pistol",	w4g	 * MILx	- (w4g * x4g)	- (w4g * MILx * xPUMP)	- (w4g * MILx * xSOV)	- (w4g * MILx * MILxNON)	- (w4g * MILx * MILxUSA)	- (w4g * MILx * MILxSOV)	- (w4g * MILx * MILxCZE)	- (w4g * MILx * MILxKOR)	- (w4g * MILx * MILxPAC)	- (w4g * MILx * MILxEUR)	- (w4g * MILx * MILxISR)		,
			"Base.Triple_Crown",	w12g	 * MILx	- (w12g * x12g)	- (w12g * MILx * xBREAK)	- (w12g * MILx * xEUR)	- (w12g * MILx * MILxNON)	- (w12g * MILx * MILxUSA)	- (w12g * MILx * MILxSOV)	- (w12g * MILx * MILxCZE)	- (w12g * MILx * MILxKOR)	- (w12g * MILx * MILxPAC)	- (w12g * MILx * MILxEUR)	- (w12g * MILx * MILxISR)		,
			"Base.Moss500_20",	w20g	 * MILx	- (w20g * x20g)	- (w20g * MILx * xPUMP)	- (w20g * MILx * xUSA)	- (w20g * MILx * MILxNON)	- (w20g * MILx * MILxUSA)	- (w20g * MILx * MILxSOV)	- (w20g * MILx * MILxCZE)	- (w20g * MILx * MILxKOR)	- (w20g * MILx * MILxPAC)	- (w20g * MILx * MILxEUR)	- (w20g * MILx * MILxISR)		,
			"Base.10855_Silver",	w20g	 * MILx	- (w20g * x20g)	- (w20g * MILx * xSEMI)	- (w20g * MILx * xEUR)	- (w20g * MILx * MILxNON)	- (w20g * MILx * MILxUSA)	- (w20g * MILx * MILxSOV)	- (w20g * MILx * MILxCZE)	- (w20g * MILx * MILxKOR)	- (w20g * MILx * MILxPAC)	- (w20g * MILx * MILxEUR)	- (w20g * MILx * MILxISR)		,
			"Base.Colt1855",	w20g	 * MILx	- (w20g * x20g)	- (w20g * MILx * xREV)	- (w20g * MILx * xUSA)	- (w20g * MILx * MILxNON)	- (w20g * MILx * MILxUSA)	- (w20g * MILx * MILxSOV)	- (w20g * MILx * MILxCZE)	- (w20g * MILx * MILxKOR)	- (w20g * MILx * MILxPAC)	- (w20g * MILx * MILxEUR)	- (w20g * MILx * MILxISR)		,
			"Base.TOZ106",	w20g	 * MILx	- (w20g * x20g)	- (w20g * MILx * xBOLT)	- (w20g * MILx * xSOV)		- (w20g * MILx * MILxUSA)		- (w20g * MILx * MILxCZE)	- (w20g * MILx * MILxKOR)		- (w20g * MILx * MILxEUR)	- (w20g * MILx * MILxISR)		,
			"Base.TOZ194_Pistol",	w12g	 * MILx	- (w12g * x12g)	- (w12g * MILx * xPUMP)	- (w12g * MILx * xSOV)		- (w12g * MILx * MILxUSA)		- (w12g * MILx * MILxCZE)	- (w12g * MILx * MILxKOR)		- (w12g * MILx * MILxEUR)	- (w12g * MILx * MILxISR)		,
			"Base.Saiga12_Tromix",	w12g	 * MILx	- (w12g * x12g)	- (w12g * MILx * xAUTO)	- (w12g * MILx * xSOV)		- (w12g * MILx * MILxUSA)		- (w12g * MILx * MILxCZE)	- (w12g * MILx * MILxKOR)		- (w12g * MILx * MILxEUR)	- (w12g * MILx * MILxISR)	- (w12g * MILx * x90)	,
			"Base.MP133",	w12g	 * MILx	- (w12g * x12g)	- (w12g * MILx * xPUMP)	- (w12g * MILx * xSOV)		- (w12g * MILx * MILxUSA)		- (w12g * MILx * MILxCZE)	- (w12g * MILx * MILxKOR)		- (w12g * MILx * MILxEUR)	- (w12g * MILx * MILxISR)	- (w12g * MILx * x90)	,
			"Base.MP133S_Pistol",	w12g	 * MILx	- (w12g * x12g)	- (w12g * MILx * xPUMP)	- (w12g * MILx * xSOV)		- (w12g * MILx * MILxUSA)		- (w12g * MILx * MILxCZE)	- (w12g * MILx * MILxKOR)		- (w12g * MILx * MILxEUR)	- (w12g * MILx * MILxISR)	- (w12g * MILx * x90)	,
			"Base.KSG",	w12g	 * MILx	- (w12g * x12g)	- (w12g * MILx * xPUMP)	- (w12g * MILx * xUSA)	- (w12g * MILx * MILxNON)	- (w12g * MILx * MILxUSA)	- (w12g * MILx * MILxSOV)	- (w12g * MILx * MILxCZE)	- (w12g * MILx * MILxKOR)	- (w12g * MILx * MILxPAC)	- (w12g * MILx * MILxEUR)	- (w12g * MILx * MILxISR)	- (w12g * MILx * x90)	,
			"Base.KSG25",	w12g	 * MILx	- (w12g * x12g)	- (w12g * MILx * xPUMP)	- (w12g * MILx * xUSA)	- (w12g * MILx * MILxNON)	- (w12g * MILx * MILxUSA)	- (w12g * MILx * MILxSOV)	- (w12g * MILx * MILxCZE)	- (w12g * MILx * MILxKOR)	- (w12g * MILx * MILxPAC)	- (w12g * MILx * MILxEUR)	- (w12g * MILx * MILxISR)	- (w12g * MILx * x90)	,
			"Base.UTS15",	w12g	 * MILx	- (w12g * x12g)	- (w12g * MILx * xPUMP)	- (w12g * MILx * xREST)	- (w12g * MILx * MILxNON)	- (w12g * MILx * MILxUSA)	- (w12g * MILx * MILxSOV)	- (w12g * MILx * MILxCZE)	- (w12g * MILx * MILxKOR)	- (w12g * MILx * MILxPAC)	- (w12g * MILx * MILxEUR)	- (w12g * MILx * MILxISR)	- (w12g * MILx * x90)	,
			"Base.EX41_HE",	wGREN	 * MILx		- (wGREN * MILx * xGREN)	- (wGREN * MILx * xUSA)			- (wGREN * MILx * MILxSOV)	- (wGREN * MILx * MILxCZE)	- (wGREN * MILx * MILxKOR)	- (wGREN * MILx * MILxPAC)	- (wGREN * MILx * MILxEUR)			,
			"Base.Federal_HE",	wGREN	 * MILx		- (wGREN * MILx * xGREN)	- (wGREN * MILx * xUSA)				- (wGREN * MILx * MILxCZE)						,
			"Base.M32_HE",	wGREN	 * MILx		- (wGREN * MILx * xGREN)	- (wGREN * MILx * xUSA)			- (wGREN * MILx * MILxSOV)	- (wGREN * MILx * MILxCZE)		- (wGREN * MILx * MILxPAC)				,
			"Base.GM94_HE",	wGREN	 * MILx		- (wGREN * MILx * xGREN)	- (wGREN * MILx * xSOV)		- (wGREN * MILx * MILxUSA)		- (wGREN * MILx * MILxCZE)	- (wGREN * MILx * MILxKOR)		- (wGREN * MILx * MILxEUR)	- (wGREN * MILx * MILxISR)	- (wGREN * MILx * x90)	,
			"Base.K11",	wGREN	 * MILx	- (wGREN * MILx * xAUTO)	- (wGREN * MILx * xGREN)	- (wGREN * MILx * xKOR)		- (wGREN * MILx * MILxUSA)	- (wGREN * MILx * MILxSOV)	- (wGREN * MILx * MILxCZE)		- (wGREN * MILx * MILxPAC)	- (wGREN * MILx * MILxEUR)	- (wGREN * MILx * MILxISR)	- (wGREN * MILx * x90)	,
			"Base.XM214",	w556	 * MILx	- (w556 * x556)	- (w556 * MILx * xMINI)	- (w556 * MILx * xUSA)			- (w556 * MILx * MILxSOV)		- (w556 * MILx * MILxKOR)	- (w556 * MILx * MILxPAC)				,
			"Base.GAU17",	w308	 * MILx	- (w308 * x308)	- (w308 * MILx * xMINI)	- (w308 * MILx * xUSA)			- (w308 * MILx * MILxSOV)	- (w308 * MILx * MILxCZE)	- (w308 * MILx * MILxKOR)	- (w308 * MILx * MILxPAC)	- (w308 * MILx * MILxEUR)	- (w308 * MILx * MILxISR)		,
			"Base.GAU19",	wBMG	 * MILx	- (wBMG * xBMG)	- (wBMG * MILx * xMINI)	- (wBMG * MILx * xUSA)			- (wBMG * MILx * MILxSOV)	- (wBMG * MILx * MILxCZE)	- (wBMG * MILx * MILxKOR)	- (wBMG * MILx * MILxPAC)		- (wBMG * MILx * MILxISR)		,
			"Base.TAC15",	wBOW	 * MILx		- (wBOW * MILx * xBOW)	- (wBOW * MILx * xUSA)	- (wBOW * MILx * MILxNON)	- (wBOW * MILx * MILxUSA)	- (wBOW * MILx * MILxSOV)	- (wBOW * MILx * MILxCZE)	- (wBOW * MILx * MILxKOR)	- (wBOW * MILx * MILxPAC)	- (wBOW * MILx * MILxEUR)	- (wBOW * MILx * MILxISR)	- (wBOW * MILx * x90)	,
			"Base.M2A1",	wFLAME	 * MILx		- (wFLAME * MILx * xFLAME)	- (wFLAME * MILx * xUSA)										,
			"Base.Musk",	wFLAME	 * MILx		- (wFLAME * MILx * xFLAME)	- (wFLAME * MILx * xUSA)	- (wFLAME * MILx * MILxNON)	- (wFLAME * MILx * MILxUSA)	- (wFLAME * MILx * MILxSOV)	- (wFLAME * MILx * MILxCZE)	- (wFLAME * MILx * MILxKOR)	- (wFLAME * MILx * MILxPAC)	- (wFLAME * MILx * MILxEUR)	- (wFLAME * MILx * MILxISR)	- (wFLAME * MILx * x90)	,
			"Base.Launcher",	wGREN		- (wGREN * xGREN)			- (wGREN * MILxNON)	- (wGREN * MILxUSA)			- (wGREN * MILxKOR)	- (wGREN * MILxPAC)	- (wGREN * MILxEUR)	- (wGREN * MILxISR)		,
			"Base.Bipod",	Part		- (Part * xPart)												,
			"Base.Ammobelt",	Part		- (Part * xPart)				- (Part * MILxUSA)	- (Part * MILxSOV)	- (Part * MILxCZE)	- (Part * MILxKOR)	- (Part * MILxPAC)	- (Part * MILxEUR)	- (Part * MILxISR)		,
			"Base.Sling_1",	Part		- (Part * xPart)												,
			"Base.Sling_2",	Part		- (Part * xPart)												,
			"Base.Sling_3",	Part		- (Part * xPart)												,
			"Base.ForeGrip",	Part		- (Part * xPart)												,
			"Base.Grip_Magpul",	Part		- (Part * xPart)					- (Part * MILxSOV)			- (Part * MILxPAC)			- (Part * x90)	,
			"Base.Grip_MLOK",	Part		- (Part * xPart)					- (Part * MILxSOV)			- (Part * MILxPAC)			- (Part * x90)	,
			"Base.Grip_TG",	Part		- (Part * xPart)					- (Part * MILxSOV)			- (Part * MILxPAC)			- (Part * x90)	,
			"Base.Light_Small",	Light		- (Light * xLight)												,
			"Base.Light_Large",	Light		- (Light * xLight)												,
			"Base.Laser_Green",	Light		- (Light * xLight)				- (Light * MILxUSA)					- (Light * MILxEUR)	- (Light * MILxISR)		,
			"Base.Laser_Red",	Light		- (Light * xLight)				- (Light * MILxUSA)					- (Light * MILxEUR)	- (Light * MILxISR)		,
			"Base.Laser_DVAL",	Light		- (Light * xLight)					- (Light * MILxSOV)	- (Light * MILxCZE)	- (Light * MILxKOR)	- (Light * MILxPAC)				,
			"Base.Laser_PEQ15",	Light		- (Light * xLight)					- (Light * MILxSOV)	- (Light * MILxCZE)	- (Light * MILxKOR)	- (Light * MILxPAC)				,
			"Base.Suppressor_Pistol",	Suppress		- (Suppress * xSuppress)												,
			"Base.Suppressor_Rifle",	Suppress		- (Suppress * xSuppress)												,
			"Base.Suppressor_Shotgun",	Suppress		- (Suppress * xSuppress)												,
			"Base.Suppressor_BMG",	Suppress		- (Suppress * xSuppress)	- (wBMG * xBMG)											,
			"Base.Bayonet_M4",	Part		- (Part * xPart)					- (Part * MILxSOV)		- (Part * MILxKOR)	- (Part * MILxPAC)				,
			"Base.Bayonet_AK",	Part		- (Part * xPart)		- (Part * xSOV)		- (Part * MILxUSA)			- (Part * MILxKOR)	- (Part * MILxPAC)	- (Part * MILxEUR)	- (Part * MILxISR)		,
			"Base.Bayonet_M1917",	Part		- (Part * xPart)				- (Part * MILxUSA)	- (Part * MILxSOV)	- (Part * MILxCZE)		- (Part * MILxPAC)		- (Part * MILxISR)		,
			"Base.Choke_Full",	Part		- (Part * xPart)			- (Part * MILxNON)	- (Part * MILxUSA)	- (Part * MILxSOV)	- (Part * MILxCZE)	- (Part * MILxKOR)	- (Part * MILxPAC)	- (Part * MILxEUR)	- (Part * MILxISR)		,
			"Base.Choke_Full_Dbl",	Part		- (Part * xPart)			- (Part * MILxNON)	- (Part * MILxUSA)	- (Part * MILxSOV)	- (Part * MILxCZE)	- (Part * MILxKOR)	- (Part * MILxPAC)	- (Part * MILxEUR)	- (Part * MILxISR)		,
			"Base.Compensator",	Part		- (Part * xPart)												,
			"Base.MuzzleBrake",	Part		- (Part * xPart)												,
			"Base.Pad",	Part		- (Part * xPart)												,
			"Base.Carrier_12g",	Part		- (Part * xPart)												,
			"Base.GhostRing",	Optic		- (Optic * xOptic)				- (Optic * MILxUSA)	- (Optic * MILxSOV)	- (Optic * MILxCZE)	- (Optic * MILxKOR)	- (Optic * MILxPAC)	- (Optic * MILxEUR)	- (Optic * MILxISR)		,
			"Base.Sight_MicroDot",	Optic		- (Optic * xOptic)		- (Optic * xUSA)	- (Optic * MILxNON)	- (Optic * MILxUSA)	- (Optic * MILxSOV)	- (Optic * MILxCZE)	- (Optic * MILxKOR)	- (Optic * MILxPAC)	- (Optic * MILxEUR)	- (Optic * MILxISR)	- (Optic * x90)	,
			"Base.Sight_RaceDot",	Optic		- (Optic * xOptic)		- (Optic * xUSA)	- (Optic * MILxNON)	- (Optic * MILxUSA)	- (Optic * MILxSOV)	- (Optic * MILxCZE)	- (Optic * MILxKOR)	- (Optic * MILxPAC)	- (Optic * MILxEUR)	- (Optic * MILxISR)		,
			"Base.Sight_SRS",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * MILxSOV)	- (Optic * MILxCZE)	- (Optic * MILxKOR)	- (Optic * MILxPAC)	- (Optic * MILxEUR)		- (Optic * x90)	,
			"Base.Sight_EOTech",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * MILxSOV)	- (Optic * MILxCZE)	- (Optic * MILxKOR)	- (Optic * MILxPAC)	- (Optic * MILxEUR)			,
			"Base.Sight_3xEOTech",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * MILxSOV)	- (Optic * MILxCZE)	- (Optic * MILxKOR)	- (Optic * MILxPAC)	- (Optic * MILxEUR)			,
			"Base.Sight_4xACOG",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * MILxSOV)	- (Optic * MILxCZE)	- (Optic * MILxKOR)	- (Optic * MILxPAC)	- (Optic * MILxEUR)			,
			"Base.Sight_6xELCAN",	Optic		- (Optic * xOptic)		- (Optic * xEUR)			- (Optic * MILxSOV)	- (Optic * MILxCZE)	- (Optic * MILxKOR)	- (Optic * MILxPAC)				,
			"Base.Sight_KOBRA",	Optic		- (Optic * xOptic)		- (Optic * xSOV)		- (Optic * MILxUSA)			- (Optic * MILxKOR)		- (Optic * MILxEUR)	- (Optic * MILxISR)		,
			"Base.Scope_4xPSO",	Optic		- (Optic * xOptic)		- (Optic * xSOV)		- (Optic * MILxUSA)			- (Optic * MILxKOR)		- (Optic * MILxEUR)	- (Optic * MILxISR)		,
			"Base.Scope_12xPSO",	Optic		- (Optic * xOptic)		- (Optic * xSOV)		- (Optic * MILxUSA)			- (Optic * MILxKOR)		- (Optic * MILxEUR)	- (Optic * MILxISR)		,
			"Base.Scope_1-4x",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * MILxSOV)	- (Optic * MILxCZE)		- (Optic * MILxPAC)				,
			"Base.Scope_20x",	Optic		- (Optic * xOptic)		- (Optic * xUSA)		- (Optic * MILxUSA)	- (Optic * MILxSOV)	- (Optic * MILxCZE)	- (Optic * MILxKOR)	- (Optic * MILxPAC)	- (Optic * MILxEUR)	- (Optic * MILxISR)		,
			"Base.Sight_Thermal",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * MILxSOV)	- (Optic * MILxCZE)		- (Optic * MILxPAC)				,
			"Base.Sight_Thermal_AK",	Optic		- (Optic * xOptic)		- (Optic * xSOV)		- (Optic * MILxUSA)			- (Optic * MILxKOR)		- (Optic * MILxEUR)	- (Optic * MILxISR)		,
			"Base.Sight_Aimpoint",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * MILxSOV)			- (Optic * MILxPAC)				,
			"Base.Sight_Aimpoint_Dot",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * MILxSOV)			- (Optic * MILxPAC)				,
			"Base.Sight_Fiber_Shotgun",	Optic		- (Optic * xOptic)		- (Optic * xUSA)	- (Optic * MILxNON)	- (Optic * MILxUSA)	- (Optic * MILxSOV)	- (Optic * MILxCZE)	- (Optic * MILxKOR)	- (Optic * MILxPAC)	- (Optic * MILxEUR)	- (Optic * MILxISR)		,
			"Base.Sight_Mepro_M21",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * MILxSOV)		- (Optic * MILxKOR)	- (Optic * MILxPAC)			- (Optic * x90)	,
			"Base.Sight_Mepro_MOR",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * MILxSOV)		- (Optic * MILxKOR)	- (Optic * MILxPAC)			- (Optic * x90)	,
			"Base.Sight_UH1",	Optic		- (Optic * xOptic)		- (Optic * xUSA)		- (Optic * MILxUSA)	- (Optic * MILxSOV)	- (Optic * MILxCZE)	- (Optic * MILxKOR)	- (Optic * MILxPAC)	- (Optic * MILxEUR)	- (Optic * MILxISR)	- (Optic * x90)	,
			"Base.Sight_C79",	Optic		- (Optic * xOptic)		- (Optic * xEUR)		- (Optic * MILxUSA)	- (Optic * MILxSOV)	- (Optic * MILxCZE)	- (Optic * MILxKOR)	- (Optic * MILxPAC)	- (Optic * MILxEUR)	- (Optic * MILxISR)		,
			"Base.Sight_SUSAT",	Optic		- (Optic * xOptic)		- (Optic * xEUR)		- (Optic * MILxUSA)	- (Optic * MILxSOV)	- (Optic * MILxCZE)	- (Optic * MILxKOR)	- (Optic * MILxPAC)		- (Optic * MILxISR)		,
			"Base.Sight_Raven",	Optic		- (Optic * xOptic)		- (Optic * xUSA)		- (Optic * MILxUSA)	- (Optic * MILxSOV)	- (Optic * MILxCZE)	- (Optic * MILxKOR)	- (Optic * MILxPAC)	- (Optic * MILxEUR)	- (Optic * MILxISR)		,
			"Base.Sight_G28_Scope",	Optic		- (Optic * xOptic)		- (Optic * xEUR)			- (Optic * MILxSOV)	- (Optic * MILxCZE)	- (Optic * MILxKOR)	- (Optic * MILxPAC)				,
			"Base.Sight_ACRO",	Optic		- (Optic * xOptic)		- (Optic * xUSA)		- (Optic * MILxUSA)	- (Optic * MILxSOV)	- (Optic * MILxCZE)	- (Optic * MILxKOR)	- (Optic * MILxPAC)	- (Optic * MILxEUR)	- (Optic * MILxISR)	- (Optic * x90)	,
			"Base.Sight_MRO",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * MILxSOV)	- (Optic * MILxCZE)	- (Optic * MILxKOR)	- (Optic * MILxPAC)			- (Optic * x90)	,
			"Base.Sight_SRO",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * MILxSOV)	- (Optic * MILxCZE)	- (Optic * MILxKOR)	- (Optic * MILxPAC)			- (Optic * x90)	,
			"Base.Sight_Nikon",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * MILxSOV)	- (Optic * MILxCZE)		- (Optic * MILxPAC)				,
			"Base.Sight_M8",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * MILxSOV)	- (Optic * MILxCZE)		- (Optic * MILxPAC)				,
			"Base.Sight_VX3",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * MILxSOV)	- (Optic * MILxCZE)		- (Optic * MILxPAC)				,
			"Base.Sight_1P63",	Optic		- (Optic * xOptic)		- (Optic * xSOV)		- (Optic * MILxUSA)			- (Optic * MILxKOR)		- (Optic * MILxEUR)	- (Optic * MILxISR)		,
			"Base.Sight_Brownells",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * MILxSOV)		- (Optic * MILxKOR)	- (Optic * MILxPAC)				,
			"Base.Sight_L2",	Optic		- (Optic * xOptic)		- (Optic * xEUR)		- (Optic * MILxUSA)	- (Optic * MILxSOV)	- (Optic * MILxCZE)	- (Optic * MILxKOR)	- (Optic * MILxPAC)		- (Optic * MILxISR)		,
			"Base.Sight_Malcom",	Optic		- (Optic * xOptic)		- (Optic * xUSA)	- (Optic * MILxNON)	- (Optic * MILxUSA)	- (Optic * MILxSOV)	- (Optic * MILxCZE)	- (Optic * MILxKOR)	- (Optic * MILxPAC)	- (Optic * MILxEUR)	- (Optic * MILxISR)		,
			"Base.Sight_LUX",	Optic		- (Optic * xOptic)		- (Optic * xUSA)	- (Optic * MILxNON)	- (Optic * MILxUSA)	- (Optic * MILxSOV)	- (Optic * MILxCZE)	- (Optic * MILxKOR)	- (Optic * MILxPAC)	- (Optic * MILxEUR)	- (Optic * MILxISR)		,
			"Base.Sight_NO32",	Optic		- (Optic * xOptic)		- (Optic * xUSA)	- (Optic * MILxNON)	- (Optic * MILxUSA)	- (Optic * MILxSOV)	- (Optic * MILxCZE)	- (Optic * MILxKOR)	- (Optic * MILxPAC)		- (Optic * MILxISR)		,
			"Base.Sight_PKAS",	Optic		- (Optic * xOptic)		- (Optic * xSOV)		- (Optic * MILxUSA)	- (Optic * MILxSOV)	- (Optic * MILxCZE)	- (Optic * MILxKOR)	- (Optic * MILxPAC)	- (Optic * MILxEUR)	- (Optic * MILxISR)		,
			"Base.Sight_PU",	Optic		- (Optic * xOptic)		- (Optic * xSOV)		- (Optic * MILxUSA)		- (Optic * MILxCZE)	- (Optic * MILxKOR)	- (Optic * MILxPAC)	- (Optic * MILxEUR)	- (Optic * MILxISR)		,
			"Base.Sight_XPS",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * MILxSOV)	- (Optic * MILxCZE)		- (Optic * MILxPAC)			- (Optic * x90)	,
			"Base.Sight_PVS4",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * MILxSOV)	- (Optic * MILxCZE)		- (Optic * MILxPAC)				,
			"Base.Barrel_308",	w308		- (w308 * x308)	- (w308 * xBREAK)	- (w308 * xUSA)	- (w308 * MILxNON)	- (w308 * MILxUSA)	- (w308 * MILxSOV)	- (w308 * MILxCZE)	- (w308 * MILxKOR)	- (w308 * MILxPAC)	- (w308 * MILxEUR)	- (w308 * MILxISR)		,
			"Base.Barrel_3006",	w3006		- (w3006 * x3006)	- (w3006 * xBREAK)	- (w3006 * xUSA)	- (w3006 * MILxNON)	- (w3006 * MILxUSA)	- (w3006 * MILxSOV)	- (w3006 * MILxCZE)	- (w3006 * MILxKOR)	- (w3006 * MILxPAC)	- (w3006 * MILxEUR)	- (w3006 * MILxISR)		,
			"Base.Barrel_4570",	w4570		- (w4570 * x4570)	- (w4570 * xBREAK)	- (w4570 * xUSA)	- (w4570 * MILxNON)	- (w4570 * MILxUSA)	- (w4570 * MILxSOV)	- (w4570 * MILxCZE)	- (w4570 * MILxKOR)	- (w4570 * MILxPAC)	- (w4570 * MILxEUR)	- (w4570 * MILxISR)		,
			"Base.Barrel_357",	w357		- (w357 * x357)	- (w357 * xBREAK)	- (w357 * xUSA)	- (w357 * MILxNON)	- (w357 * MILxUSA)	- (w357 * MILxSOV)	- (w357 * MILxCZE)	- (w357 * MILxKOR)	- (w357 * MILxPAC)	- (w357 * MILxEUR)	- (w357 * MILxISR)		,
			"Base.Barrel_357_Short",	w357		- (w357 * x357)	- (w357 * xBREAK)	- (w357 * xUSA)	- (w357 * MILxNON)	- (w357 * MILxUSA)	- (w357 * MILxSOV)	- (w357 * MILxCZE)	- (w357 * MILxKOR)	- (w357 * MILxPAC)	- (w357 * MILxEUR)	- (w357 * MILxISR)		,
			"Base.Barrel_45LC",	w45LC		- (w45LC * x45LC)	- (w45LC * xBREAK)	- (w45LC * xUSA)	- (w45LC * MILxNON)	- (w45LC * MILxUSA)	- (w45LC * MILxSOV)	- (w45LC * MILxCZE)	- (w45LC * MILxKOR)	- (w45LC * MILxPAC)	- (w45LC * MILxEUR)	- (w45LC * MILxISR)		,
			"Base.Barrel_45LC_Short",	w45LC		- (w45LC * x45LC)	- (w45LC * xBREAK)	- (w45LC * xUSA)	- (w45LC * MILxNON)	- (w45LC * MILxUSA)	- (w45LC * MILxSOV)	- (w45LC * MILxCZE)	- (w45LC * MILxKOR)	- (w45LC * MILxPAC)	- (w45LC * MILxEUR)	- (w45LC * MILxISR)		,
			"Base.AmmoCan30_22",	AmmoCan		* w22	- (w22 * x22)		- (AmmoCan * MILxNON)	- (AmmoCan * MILxUSA)	- (AmmoCan * MILxSOV)	- (AmmoCan * MILxCZE)	- (AmmoCan * MILxKOR)	- (AmmoCan * MILxPAC)	- (AmmoCan * MILxEUR)			,
			"Base.AmmoCan30_380",	AmmoCan		* w380	- (w380 * x380)			- (AmmoCan * MILxUSA)	- (AmmoCan * MILxSOV)		- (AmmoCan * MILxKOR)	- (AmmoCan * MILxPAC)	- (AmmoCan * MILxEUR)	- (AmmoCan * MILxISR)		,
			"Base.AmmoCan30_57",	AmmoCan		* w57	- (w57 * x57)		- (AmmoCan * MILxNON)	- (AmmoCan * MILxUSA)	- (AmmoCan * MILxSOV)	- (AmmoCan * MILxCZE)	- (AmmoCan * MILxKOR)	- (AmmoCan * MILxPAC)	- (AmmoCan * MILxEUR)	- (AmmoCan * MILxISR)	- (AmmoCan * x90)	,
			"Base.AmmoCan30_9",	AmmoCan		* w9	- (w9 * x9)											,
			"Base.AmmoCan30_9",	AmmoCan		* w9	- (w9 * x9)											,
			"Base.AmmoCan30_38",	AmmoCan		* w357	- (w357 * x357)		- (AmmoCan * MILxNON)	- (AmmoCan * MILxUSA)	- (AmmoCan * MILxSOV)	- (AmmoCan * MILxCZE)	- (AmmoCan * MILxKOR)	- (AmmoCan * MILxPAC)	- (AmmoCan * MILxEUR)	- (AmmoCan * MILxISR)		,
			"Base.AmmoCan30_357",	AmmoCan		* w357	- (w357 * x357)		- (AmmoCan * MILxNON)	- (AmmoCan * MILxUSA)	- (AmmoCan * MILxSOV)	- (AmmoCan * MILxCZE)	- (AmmoCan * MILxKOR)	- (AmmoCan * MILxPAC)	- (AmmoCan * MILxEUR)	- (AmmoCan * MILxISR)		,
			"Base.AmmoCan30_45",	AmmoCan		* w45	- (w45 * x45)				- (AmmoCan * MILxSOV)			- (AmmoCan * MILxPAC)				,
			"Base.AmmoCan30_45",	AmmoCan		* w45	- (w45 * x45)				- (AmmoCan * MILxSOV)			- (AmmoCan * MILxPAC)				,
			"Base.AmmoCan30_44",	AmmoCan		* w44	- (w44 * x44)		- (AmmoCan * MILxNON)	- (AmmoCan * MILxUSA)	- (AmmoCan * MILxSOV)	- (AmmoCan * MILxCZE)	- (AmmoCan * MILxKOR)	- (AmmoCan * MILxPAC)	- (AmmoCan * MILxEUR)	- (AmmoCan * MILxISR)		,
			"Base.AmmoCan30_45LC",	AmmoCan		* w45LC	- (w45LC * x45LC)			- (AmmoCan * MILxUSA)	- (AmmoCan * MILxSOV)	- (AmmoCan * MILxCZE)	- (AmmoCan * MILxKOR)	- (AmmoCan * MILxPAC)	- (AmmoCan * MILxEUR)	- (AmmoCan * MILxISR)		,
			"Base.AmmoCan30_4570",	AmmoCan		* w4570	- (w4570 * x4570)		- (AmmoCan * MILxNON)	- (AmmoCan * MILxUSA)	- (AmmoCan * MILxSOV)	- (AmmoCan * MILxCZE)	- (AmmoCan * MILxKOR)	- (AmmoCan * MILxPAC)	- (AmmoCan * MILxEUR)	- (AmmoCan * MILxISR)		,
			"Base.AmmoCan30_50MAG",	AmmoCan		* wBMG	- (wBMG * xBMG)			- (AmmoCan * MILxUSA)		- (AmmoCan * MILxCZE)	- (AmmoCan * MILxKOR)	- (AmmoCan * MILxPAC)	- (AmmoCan * MILxEUR)	- (AmmoCan * MILxISR)	- (AmmoCan * x90)	,
			"Base.AmmoCan50_223",	AmmoCan		* w223	- (w223 * x223)			- (AmmoCan * MILxUSA)	- (AmmoCan * MILxSOV)		- (AmmoCan * MILxKOR)	- (AmmoCan * MILxPAC)	- (AmmoCan * MILxEUR)	- (AmmoCan * MILxISR)		,
			"Base.AmmoCan50_556",	AmmoCan		* w556	- (w556 * x556)											,
			"Base.AmmoCan50_556",	AmmoCan		* w556	- (w556 * x556)											,
			"Base.AmmoCan50_762x39",	AmmoCan		* w762x39	- (w762x39 * x762x39)			- (AmmoCan * MILxUSA)			- (AmmoCan * MILxKOR)		- (AmmoCan * MILxEUR)			,
			"Base.AmmoCan50_762x39",	AmmoCan		* w762x39	- (w762x39 * x762x39)			- (AmmoCan * MILxUSA)			- (AmmoCan * MILxKOR)		- (AmmoCan * MILxEUR)			,
			"Base.AmmoCan50_545x39",	AmmoCan		* w545x39	- (w545x39 * x545x39)			- (AmmoCan * MILxUSA)		- (AmmoCan * MILxCZE)	- (AmmoCan * MILxKOR)		- (AmmoCan * MILxEUR)	- (AmmoCan * MILxISR)		,
			"Base.AmmoCan50_762x54r",	AmmoCan		* w762x54r	- (w762x54r * x762x54r)			- (AmmoCan * MILxUSA)			- (AmmoCan * MILxKOR)		- (AmmoCan * MILxEUR)	- (AmmoCan * MILxISR)		,
			"Base.AmmoCan50_308",	AmmoCan		* w308	- (w308 * x308)											,
			"Base.AmmoCan50_308",	AmmoCan		* w308	- (w308 * x308)											,
			"Base.AmmoCan50_3006",	AmmoCan		* w3006	- (w3006 * x3006)		- (AmmoCan * MILxNON)	- (AmmoCan * MILxUSA)	- (AmmoCan * MILxSOV)	- (AmmoCan * MILxCZE)	- (AmmoCan * MILxKOR)	- (AmmoCan * MILxPAC)	- (AmmoCan * MILxEUR)	- (AmmoCan * MILxISR)		,
			"Base.AmmoCan50_410",	AmmoCan		* w45LC	- (w45LC * x45LC)		- (AmmoCan * MILxNON)	- (AmmoCan * MILxUSA)	- (AmmoCan * MILxSOV)	- (AmmoCan * MILxCZE)	- (AmmoCan * MILxKOR)	- (AmmoCan * MILxPAC)	- (AmmoCan * MILxEUR)	- (AmmoCan * MILxISR)		,
			"Base.AmmoCan50_20",	AmmoCan		* w20g	- (w20g * x20g)		- (AmmoCan * MILxNON)	- (AmmoCan * MILxUSA)		- (AmmoCan * MILxCZE)	- (AmmoCan * MILxKOR)	- (AmmoCan * MILxPAC)	- (AmmoCan * MILxEUR)	- (AmmoCan * MILxISR)		,
			"Base.AmmoCan50_12",	AmmoCan		* w12g	- (w12g * x12g)											,
			"Base.AmmoCan50_10",	AmmoCan		* w10g	- (w10g * x10g)		- (AmmoCan * MILxNON)	- (AmmoCan * MILxUSA)	- (AmmoCan * MILxSOV)	- (AmmoCan * MILxCZE)	- (AmmoCan * MILxKOR)	- (AmmoCan * MILxPAC)	- (AmmoCan * MILxEUR)	- (AmmoCan * MILxISR)		,
			"Base.AmmoCan50_4",	AmmoCan		* w4g	- (w4g * x4g)		- (AmmoCan * MILxNON)	- (AmmoCan * MILxUSA)	- (AmmoCan * MILxSOV)	- (AmmoCan * MILxCZE)	- (AmmoCan * MILxKOR)	- (AmmoCan * MILxPAC)	- (AmmoCan * MILxEUR)	- (AmmoCan * MILxISR)		,
			"Base.AmmoCan50_50",	AmmoCan		* wBMG	- (wBMG * xBMG)				- (AmmoCan * MILxSOV)	- (AmmoCan * MILxCZE)	- (AmmoCan * MILxKOR)	- (AmmoCan * MILxPAC)		- (AmmoCan * MILxISR)		,
			"Base.AmmoCan50_50",	AmmoCan		* wBMG	- (wBMG * xBMG)				- (AmmoCan * MILxSOV)	- (AmmoCan * MILxCZE)	- (AmmoCan * MILxKOR)	- (AmmoCan * MILxPAC)		- (AmmoCan * MILxISR)		,
			"Base.AmmoCan50_HE",	AmmoCan		* wGREN	- (wGREN * xGREN)											,
			"Base.AmmoCan50_HE",	AmmoCan		* wGREN	- (wGREN * xGREN)											,
			"Base.AmmoCan50_INC",	AmmoCan		* wGREN	- (wGREN * xGREN)											,
			"Base.AmmoCan50_INC",	AmmoCan		* wGREN	- (wGREN * xGREN)											,
			"Base.38Speed",	StdMag	* w357	- (w357 * x357)	- (StdMag * xREV)		- (StdMag* w357 * MILxNON)	- (StdMag* w357 * MILxUSA)	- (StdMag* w357 * MILxSOV)	- (StdMag* w357 * MILxCZE)	- (StdMag* w357 * MILxKOR)	- (StdMag* w357 * MILxPAC)	- (StdMag* w357 * MILxEUR)	- (StdMag* w357 * MILxISR)		,
			"Base.44Speed",	StdMag	* w44	- (w44 * x44)	- (StdMag * xREV)		- (StdMag* w44 * MILxNON)	- (StdMag* w44 * MILxUSA)	- (StdMag* w44 * MILxSOV)	- (StdMag* w44 * MILxCZE)	- (StdMag* w44 * MILxKOR)	- (StdMag* w44 * MILxPAC)	- (StdMag* w44 * MILxEUR)	- (StdMag* w44 * MILxISR)		,
			"Base.SRM1208_Cylinder",	StdMag	* w12g	- (w12g * x12g)	- (StdMag * xREV)	- (StdMag * xUSA)	- (StdMag* w12g * MILxNON)	- (StdMag* w12g * MILxUSA)	- (StdMag* w12g * MILxSOV)	- (StdMag* w12g * MILxCZE)	- (StdMag* w12g * MILxKOR)	- (StdMag* w12g * MILxPAC)	- (StdMag* w12g * MILxEUR)	- (StdMag* w12g * MILxISR)	- (StdMag* w12g * x90)	,
			"Base.SRM1212_Cylinder",	StdMag	* w12g	- (w12g * x12g)	- (StdMag * xREV)	- (StdMag * xUSA)	- (StdMag* w12g * MILxNON)	- (StdMag* w12g * MILxUSA)	- (StdMag* w12g * MILxSOV)	- (StdMag* w12g * MILxCZE)	- (StdMag* w12g * MILxKOR)	- (StdMag* w12g * MILxPAC)	- (StdMag* w12g * MILxEUR)	- (StdMag* w12g * MILxISR)	- (StdMag* w12g * x90)	,
			"Base.SRM1216_Cylinder",	StdMag	* w12g	- (w12g * x12g)	- (StdMag * xREV)	- (StdMag * xUSA)	- (StdMag* w12g * MILxNON)	- (StdMag* w12g * MILxUSA)	- (StdMag* w12g * MILxSOV)	- (StdMag* w12g * MILxCZE)	- (StdMag* w12g * MILxKOR)	- (StdMag* w12g * MILxPAC)	- (StdMag* w12g * MILxEUR)	- (StdMag* w12g * MILxISR)	- (StdMag* w12g * x90)	,
			"Base.SIX12_Cylinder",	StdMag	* w12g	- (w12g * x12g)	- (StdMag * xREV)	- (StdMag * xUSA)			- (StdMag* w12g * MILxSOV)	- (StdMag* w12g * MILxCZE)	- (StdMag* w12g * MILxKOR)	- (StdMag* w12g * MILxPAC)	- (StdMag* w12g * MILxEUR)	- (StdMag* w12g * MILxISR)	- (StdMag* w12g * x90)	,
			"Base.CP33Clip",	StdMag	* w22	- (w22 * x22)		- (StdMag * xUSA)	- (StdMag* w22 * MILxNON)	- (StdMag* w22 * MILxUSA)	- (StdMag* w22 * MILxSOV)	- (StdMag* w22 * MILxCZE)	- (StdMag* w22 * MILxKOR)	- (StdMag* w22 * MILxPAC)	- (StdMag* w22 * MILxEUR)	- (StdMag* w22 * MILxISR)	- (StdMag* w22 * x90)	,
			"Base.CP33_17MagBase",	ExtMag	* w22	- (w22 * x22)		- (ExtMag * xUSA)	- (ExtMag* w22 * MILxNON)	- (ExtMag* w22 * MILxUSA)	- (ExtMag* w22 * MILxSOV)	- (ExtMag* w22 * MILxCZE)	- (ExtMag* w22 * MILxKOR)	- (ExtMag* w22 * MILxPAC)	- (ExtMag* w22 * MILxEUR)	- (ExtMag* w22 * MILxISR)	- (ExtMag* w22 * x90)	,
			"Base.22Clip",	StdMag	* w22	- (w22 * x22)			- (StdMag* w22 * MILxNON)	- (StdMag* w22 * MILxUSA)	- (StdMag* w22 * MILxSOV)	- (StdMag* w22 * MILxCZE)	- (StdMag* w22 * MILxKOR)	- (StdMag* w22 * MILxPAC)	- (StdMag* w22 * MILxEUR)			,
			"Base.22ExtClip",	ExtMag	* w22	- (w22 * x22)			- (ExtMag* w22 * MILxNON)	- (ExtMag* w22 * MILxUSA)	- (ExtMag* w22 * MILxSOV)	- (ExtMag* w22 * MILxCZE)	- (ExtMag* w22 * MILxKOR)	- (ExtMag* w22 * MILxPAC)	- (ExtMag* w22 * MILxEUR)			,
			"Base.380Clip",	StdMag	* w380	- (w380 * x380)				- (StdMag* w380 * MILxUSA)	- (StdMag* w380 * MILxSOV)		- (StdMag* w380 * MILxKOR)	- (StdMag* w380 * MILxPAC)	- (StdMag* w380 * MILxEUR)	- (StdMag* w380 * MILxISR)		,
			"Base.380ExtClip",	ExtMag	* w380	- (w380 * x380)				- (ExtMag* w380 * MILxUSA)	- (ExtMag* w380 * MILxSOV)		- (ExtMag* w380 * MILxKOR)	- (ExtMag* w380 * MILxPAC)	- (ExtMag* w380 * MILxEUR)	- (ExtMag* w380 * MILxISR)		,
			"Base.9mmClip",	StdMag	* w9	- (w9 * x9)												,
			"Base.9mmExtClip",	ExtMag	* w9	- (w9 * x9)												,
			"Base.45DSClip",	StdMag	* w45	- (w45 * x45)					- (StdMag* w45 * MILxSOV)		- (StdMag* w45 * MILxKOR)	- (StdMag* w45 * MILxPAC)				,
			"Base.45DSExtClip",	ExtMag	* w45	- (w45 * x45)					- (ExtMag* w45 * MILxSOV)		- (ExtMag* w45 * MILxKOR)	- (ExtMag* w45 * MILxPAC)				,
			"Base.45Clip",	StdMag	* w45	- (w45 * x45)					- (StdMag* w45 * MILxSOV)	- (StdMag* w45 * MILxCZE)		- (StdMag* w45 * MILxPAC)		- (StdMag* w45 * MILxISR)		,
			"Base.45ExtClip",	ExtMag	* w45	- (w45 * x45)					- (ExtMag* w45 * MILxSOV)	- (ExtMag* w45 * MILxCZE)		- (ExtMag* w45 * MILxPAC)		- (ExtMag* w45 * MILxISR)		,
			"Base.44Clip",	StdMag	* w44	- (w44 * x44)			- (StdMag* w44 * MILxNON)	- (StdMag* w44 * MILxUSA)	- (StdMag* w44 * MILxSOV)	- (StdMag* w44 * MILxCZE)	- (StdMag* w44 * MILxKOR)	- (StdMag* w44 * MILxPAC)	- (StdMag* w44 * MILxEUR)			,
			"Base.223StdClip",	StdMag	* w223	- (w223 * x223)			- (StdMag* w223 * MILxNON)	- (StdMag* w223 * MILxUSA)	- (StdMag* w223 * MILxSOV)		- (StdMag* w223 * MILxKOR)	- (StdMag* w223 * MILxPAC)	- (StdMag* w223 * MILxEUR)	- (StdMag* w223 * MILxISR)		,
			"Base.223ExtClip",	ExtMag	* w223	- (w223 * x223)			- (ExtMag* w223 * MILxNON)	- (ExtMag* w223 * MILxUSA)	- (ExtMag* w223 * MILxSOV)		- (ExtMag* w223 * MILxKOR)	- (ExtMag* w223 * MILxPAC)	- (ExtMag* w223 * MILxEUR)	- (ExtMag* w223 * MILxISR)		,
			"Base.556Clip",	StdMag	* w556	- (w556 * x556)												,
			"Base.308StdClip",	StdMag	* w308	- (w308 * x308)				- (StdMag* w308 * MILxUSA)	- (StdMag* w308 * MILxSOV)	- (StdMag* w308 * MILxCZE)	- (StdMag* w308 * MILxKOR)	- (StdMag* w308 * MILxPAC)	- (StdMag* w308 * MILxEUR)	- (StdMag* w308 * MILxISR)		,
			"Base.308ExtClip",	ExtMag	* w308	- (w308 * x308)				- (ExtMag* w308 * MILxUSA)	- (ExtMag* w308 * MILxSOV)	- (ExtMag* w308 * MILxCZE)	- (ExtMag* w308 * MILxKOR)	- (ExtMag* w308 * MILxPAC)	- (ExtMag* w308 * MILxEUR)	- (ExtMag* w308 * MILxISR)		,
			"Base.3006ExtClip",	ExtMag	* w3006	- (w3006 * x3006)		- (ExtMag * xUSA)	- (ExtMag* w3006 * MILxNON)	- (ExtMag* w3006 * MILxUSA)	- (ExtMag* w3006 * MILxSOV)	- (ExtMag* w3006 * MILxCZE)	- (ExtMag* w3006 * MILxKOR)	- (ExtMag* w3006 * MILxPAC)	- (ExtMag* w3006 * MILxEUR)	- (ExtMag* w3006 * MILxISR)		,
			"Base.SVDClip",	StdMag	* w762x54r	- (w762x54r * x762x54r)		- (StdMag * xSOV)		- (StdMag* w762x54r * MILxUSA)			- (StdMag* w762x54r * MILxKOR)		- (StdMag* w762x54r * MILxEUR)	- (StdMag* w762x54r * MILxISR)		,
			"Base.ASHClip",	StdMag	* wBMG	- (wBMG * xBMG)		- (StdMag * xSOV)		- (StdMag* wBMG * MILxUSA)		- (StdMag* wBMG * MILxCZE)	- (StdMag* wBMG * MILxKOR)	- (StdMag* wBMG * MILxPAC)	- (StdMag* wBMG * MILxEUR)	- (StdMag* wBMG * MILxISR)	- (StdMag* wBMG * x90)	,
			"Base.M82Clip",	StdMag	* wBMG	- (wBMG * xBMG)		- (StdMag * xUSA)			- (StdMag* wBMG * MILxSOV)		- (StdMag* wBMG * MILxKOR)	- (StdMag* wBMG * MILxPAC)				,
			"Base.M1Clip",	StdMag	* w3006	- (w3006 * x3006)		- (StdMag * xUSA)	- (StdMag* w3006 * MILxNON)	- (StdMag* w3006 * MILxUSA)	- (StdMag* w3006 * MILxSOV)	- (StdMag* w3006 * MILxCZE)	- (StdMag* w3006 * MILxKOR)	- (StdMag* w3006 * MILxPAC)	- (StdMag* w3006 * MILxEUR)	- (StdMag* w3006 * MILxISR)		,
			"Base.SKSClip",	StdMag	* w762x39	- (w762x39 * x762x39)		- (StdMag * xSOV)		- (StdMag* w762x39 * MILxUSA)			- (StdMag* w762x39 * MILxKOR)		- (StdMag* w762x39 * MILxEUR)	- (StdMag* w762x39 * MILxISR)		,
			"Base.1903Clip",	StdMag	* w308	- (w308 * x308)			- (StdMag* w308 * MILxNON)	- (StdMag* w308 * MILxUSA)	- (StdMag* w308 * MILxSOV)	- (StdMag* w308 * MILxCZE)	- (StdMag* w308 * MILxKOR)	- (StdMag* w308 * MILxPAC)	- (StdMag* w308 * MILxEUR)	- (StdMag* w308 * MILxISR)		,
			"Base.545StdClip",	StdMag	* w545x39	- (w545x39 * x545x39)		- (StdMag * xSOV)		- (StdMag* w545x39 * MILxUSA)		- (StdMag* w545x39 * MILxCZE)	- (StdMag* w545x39 * MILxKOR)		- (StdMag* w545x39 * MILxEUR)	- (StdMag* w545x39 * MILxISR)		,
			"Base.AKClip",	StdMag	* w762x39	- (w762x39 * x762x39)				- (StdMag* w762x39 * MILxUSA)			- (StdMag* w762x39 * MILxKOR)		- (StdMag* w762x39 * MILxEUR)			,
			"Base.ASVALClip",	ExtMag	* w9	- (w9 * x9)		- (ExtMag * xSOV)		- (ExtMag* w9 * MILxUSA)		- (ExtMag* w9 * MILxCZE)	- (ExtMag* w9 * MILxKOR)		- (ExtMag* w9 * MILxEUR)	- (ExtMag* w9 * MILxISR)		,
			"Base.VSSClip",	StdMag	* w9	- (w9 * x9)		- (StdMag * xSOV)		- (StdMag* w9 * MILxUSA)		- (StdMag* w9 * MILxCZE)	- (StdMag* w9 * MILxKOR)		- (StdMag* w9 * MILxEUR)	- (StdMag* w9 * MILxISR)		,
			"Base.57Clip",	StdMag	* w57	- (w57 * x57)		- (StdMag * xEUR)	- (StdMag* w57 * MILxNON)	- (StdMag* w57 * MILxUSA)	- (StdMag* w57 * MILxSOV)	- (StdMag* w57 * MILxCZE)	- (StdMag* w57 * MILxKOR)	- (StdMag* w57 * MILxPAC)	- (StdMag* w57 * MILxEUR)	- (StdMag* w57 * MILxISR)	- (StdMag* w57 * x90)	,
			"Base.P90Clip",	StdMag	* w57	- (w57 * x57)		- (StdMag * xEUR)	- (StdMag* w57 * MILxNON)	- (StdMag* w57 * MILxUSA)	- (StdMag* w57 * MILxSOV)	- (StdMag* w57 * MILxCZE)	- (StdMag* w57 * MILxKOR)	- (StdMag* w57 * MILxPAC)	- (StdMag* w57 * MILxEUR)	- (StdMag* w57 * MILxISR)	- (StdMag* w57 * x90)	,
			"Base.22Drum",	DrumMag	* w22	- (w22 * x22)			- (DrumMag* w22 * MILxNON)	- (DrumMag* w22 * MILxUSA)	- (DrumMag* w22 * MILxSOV)	- (DrumMag* w22 * MILxCZE)	- (DrumMag* w22 * MILxKOR)	- (DrumMag* w22 * MILxPAC)	- (DrumMag* w22 * MILxEUR)			,
			"Base.9mmDrum",	DrumMag	* w9	- (w9 * x9)												,
			"Base.45Drum",	DrumMag	* w45	- (w45 * x45)					- (DrumMag* w45 * MILxSOV)		- (DrumMag* w45 * MILxKOR)	- (DrumMag* w45 * MILxPAC)				,
			"Base.556Drum",	DrumMag	* w556	- (w556 * x556)												,
			"Base.545Drum",	DrumMag	* w545x39	- (w545x39 * x545x39)		- (DrumMag * xSOV)		- (DrumMag* w545x39 * MILxUSA)		- (DrumMag* w545x39 * MILxCZE)	- (DrumMag* w545x39 * MILxKOR)		- (DrumMag* w545x39 * MILxEUR)	- (DrumMag* w545x39 * MILxISR)		,
			"Base.762Drum",	DrumMag	* w762x39	- (w762x39 * x762x39)				- (DrumMag* w762x39 * MILxUSA)			- (DrumMag* w762x39 * MILxKOR)		- (DrumMag* w762x39 * MILxEUR)			,
			"Base.12gDrum",	DrumMag	* w12g	- (w12g * x12g)						- (DrumMag* w12g * MILxCZE)						,
			"Base.308Belt",	StdMag	* w308	- (w308 * x308)	- (wLMG * xLMG)											,
			"Base.556Belt",	StdMag	* w556	- (w556 * x556)	- (wLMG * xLMG)				- (StdMag* w556 * MILxSOV)	- (StdMag* w556 * MILxCZE)		- (StdMag* w556 * MILxPAC)	- (StdMag* w556 * MILxEUR)			,
			"Base.762x39Belt",	StdMag	* w762x39	- (w762x39 * x762x39)	- (wLMG * xLMG)			- (StdMag* w762x39 * MILxUSA)		- (StdMag* w762x39 * MILxCZE)	- (StdMag* w762x39 * MILxKOR)		- (StdMag* w762x39 * MILxEUR)	- (StdMag* w762x39 * MILxISR)		,
			"Base.762x54rBelt",	StdMag	* w762x54r	- (w762x54r * x762x54r)	- (wLMG * xLMG)	- (StdMag * xSOV)		- (StdMag* w762x54r * MILxUSA)			- (StdMag* w762x54r * MILxKOR)		- (StdMag* w762x54r * MILxEUR)	- (StdMag* w762x54r * MILxISR)		,
			"Base.556MiniCan",	StdMag	* w556	- (w556 * x556)	- (wMINI * xMINI)	- (StdMag * xUSA)			- (StdMag* w556 * MILxSOV)		- (StdMag* w556 * MILxKOR)	- (StdMag* w556 * MILxPAC)				,
			"Base.308MiniCan",	StdMag	* w308	- (w308 * x308)	- (wMINI * xMINI)	- (StdMag * xUSA)			- (StdMag* w308 * MILxSOV)	- (StdMag* w308 * MILxCZE)	- (StdMag* w308 * MILxKOR)	- (StdMag* w308 * MILxPAC)	- (StdMag* w308 * MILxEUR)	- (StdMag* w308 * MILxISR)		,
			"Base.50MiniCan",	StdMag	* wBMG	- (wBMG * xBMG)	- (wMINI * xMINI)	- (StdMag * xUSA)			- (StdMag* wBMG * MILxSOV)	- (StdMag* wBMG * MILxCZE)	- (StdMag* wBMG * MILxKOR)	- (StdMag* wBMG * MILxPAC)		- (StdMag* wBMG * MILxISR)		,
			"Base.M2A1_Tank",	ExtMag	* wFLAME	- (wFLAME * xFLAME)		- (ExtMag * xUSA)										,
			"Base.M2A1_Can",	StdMag	* wFLAME	- (wFLAME * xFLAME)		- (StdMag * xUSA)										,
			"Base.RussianMachete",	LgKnife		- (LgKnife * xLgKnife)		- (LgKnife * xSOV)		- (LgKnife * MILxUSA)		- (LgKnife * MILxCZE)	- (LgKnife * MILxKOR)	- (LgKnife * MILxPAC)	- (LgKnife * MILxEUR)	- (LgKnife * MILxISR)		,
			"Base.BGMachete",	LgKnife		- (LgKnife * xLgKnife)		- (LgKnife * xUSA)		- (LgKnife * MILxUSA)	- (LgKnife * MILxSOV)	- (LgKnife * MILxCZE)	- (LgKnife * MILxKOR)	- (LgKnife * MILxPAC)	- (LgKnife * MILxEUR)			,
			"Base.RamboKnife",	LgKnife		- (LgKnife * xLgKnife)		- (LgKnife * xUSA)			- (LgKnife * MILxSOV)			- (LgKnife * MILxPAC)				,
			"Base.Butterfly",	SmKnife		- (SmKnife * xSmKnife)		- (SmKnife * xPAC)	- (SmKnife * MILxNON)	- (SmKnife * MILxUSA)	- (SmKnife * MILxSOV)	- (SmKnife * MILxCZE)	- (SmKnife * MILxKOR)	- (SmKnife * MILxPAC)	- (SmKnife * MILxEUR)	- (SmKnife * MILxISR)		,
			"Base.PushDagger",	SmKnife		- (SmKnife * xSmKnife)		- (SmKnife * xUSA)	- (SmKnife * MILxNON)	- (SmKnife * MILxUSA)	- (SmKnife * MILxSOV)	- (SmKnife * MILxCZE)	- (SmKnife * MILxKOR)	- (SmKnife * MILxPAC)	- (SmKnife * MILxEUR)	- (SmKnife * MILxISR)		,
			"Base.Karambit",	SmKnife		- (SmKnife * xSmKnife)		- (SmKnife * xPAC)		- (SmKnife * MILxUSA)	- (SmKnife * MILxSOV)	- (SmKnife * MILxCZE)	- (SmKnife * MILxKOR)		- (SmKnife * MILxEUR)	- (SmKnife * MILxISR)		,
			"Base.Tactical_Axe",	Axe		- (Axe * xAxe)		- (Axe * xUSA)	- (Axe * MILxNON)	- (Axe * MILxUSA)	- (Axe * MILxSOV)	- (Axe * MILxCZE)	- (Axe * MILxKOR)	- (Axe * MILxPAC)	- (Axe * MILxEUR)	- (Axe * MILxISR)		,
			"Base.Tactical_Sickle",	Axe		- (Axe * xAxe)		- (Axe * xUSA)	- (Axe * MILxNON)	- (Axe * MILxUSA)	- (Axe * MILxSOV)	- (Axe * MILxCZE)	- (Axe * MILxKOR)	- (Axe * MILxPAC)	- (Axe * MILxEUR)	- (Axe * MILxISR)		,
			"Base.DingDong",	Blunt		- (Blunt * xBlunt)		- (Blunt * xUSA)	- (Blunt * MILxNON)	- (Blunt * MILxUSA)	- (Blunt * MILxSOV)	- (Blunt * MILxCZE)	- (Blunt * MILxKOR)	- (Blunt * MILxPAC)	- (Blunt * MILxEUR)	- (Blunt * MILxISR)		,
			"Base.MilitaryBaton",	Blunt		- (Blunt * xBlunt)		- (Blunt * xUSA)										,
			"Base.KillBill",	Sword		- (Sword * xSword)		- (Sword * xPAC)	- (Sword * MILxNON)	- (Sword * MILxUSA)	- (Sword * MILxSOV)	- (Sword * MILxCZE)	- (Sword * MILxKOR)	- (Sword * MILxPAC)	- (Sword * MILxEUR)	- (Sword * MILxISR)		,
			"Base.CH_WarSword",	Sword		- (Sword * xSword)		- (Sword * xPAC)		- (Sword * MILxUSA)	- (Sword * MILxSOV)	- (Sword * MILxCZE)	- (Sword * MILxKOR)		- (Sword * MILxEUR)	- (Sword * MILxISR)		,
			"Base.Conan_Sword",	Sword		- (Sword * xSword)		- (Sword * xUSA)	- (Sword * MILxNON)	- (Sword * MILxUSA)	- (Sword * MILxSOV)	- (Sword * MILxCZE)	- (Sword * MILxKOR)	- (Sword * MILxPAC)	- (Sword * MILxEUR)	- (Sword * MILxISR)		,
		},																
		dontSpawnAmmo = 		 MILammo	,													
	},																	
																		
	ArmyAmmo = {																	
		rolls =	MILRollAMMO	,														
		items = {																
			"Base.38Speed",	StdMag	* w357	- (w357 * x357)	- (StdMag * xREV)		- (StdMag* w357 * MILxNON)	- (StdMag* w357 * MILxUSA)	- (StdMag* w357 * MILxSOV)	- (StdMag* w357 * MILxCZE)	- (StdMag* w357 * MILxKOR)	- (StdMag* w357 * MILxPAC)	- (StdMag* w357 * MILxEUR)	- (StdMag* w357 * MILxISR)		,
			"Base.44Speed",	StdMag	* w44	- (w44 * x44)	- (StdMag * xREV)		- (StdMag* w44 * MILxNON)	- (StdMag* w44 * MILxUSA)	- (StdMag* w44 * MILxSOV)	- (StdMag* w44 * MILxCZE)	- (StdMag* w44 * MILxKOR)	- (StdMag* w44 * MILxPAC)	- (StdMag* w44 * MILxEUR)	- (StdMag* w44 * MILxISR)		,
			"Base.SRM1208_Cylinder",	StdMag	* w12g	- (w12g * x12g)	- (StdMag * xREV)	- (StdMag * xUSA)	- (StdMag* w12g * MILxNON)	- (StdMag* w12g * MILxUSA)	- (StdMag* w12g * MILxSOV)	- (StdMag* w12g * MILxCZE)	- (StdMag* w12g * MILxKOR)	- (StdMag* w12g * MILxPAC)	- (StdMag* w12g * MILxEUR)	- (StdMag* w12g * MILxISR)	- (StdMag* w12g * x90)	,
			"Base.SRM1212_Cylinder",	StdMag	* w12g	- (w12g * x12g)	- (StdMag * xREV)	- (StdMag * xUSA)	- (StdMag* w12g * MILxNON)	- (StdMag* w12g * MILxUSA)	- (StdMag* w12g * MILxSOV)	- (StdMag* w12g * MILxCZE)	- (StdMag* w12g * MILxKOR)	- (StdMag* w12g * MILxPAC)	- (StdMag* w12g * MILxEUR)	- (StdMag* w12g * MILxISR)	- (StdMag* w12g * x90)	,
			"Base.SRM1216_Cylinder",	StdMag	* w12g	- (w12g * x12g)	- (StdMag * xREV)	- (StdMag * xUSA)	- (StdMag* w12g * MILxNON)	- (StdMag* w12g * MILxUSA)	- (StdMag* w12g * MILxSOV)	- (StdMag* w12g * MILxCZE)	- (StdMag* w12g * MILxKOR)	- (StdMag* w12g * MILxPAC)	- (StdMag* w12g * MILxEUR)	- (StdMag* w12g * MILxISR)	- (StdMag* w12g * x90)	,
			"Base.SIX12_Cylinder",	StdMag	* w12g	- (w12g * x12g)	- (StdMag * xREV)	- (StdMag * xUSA)			- (StdMag* w12g * MILxSOV)	- (StdMag* w12g * MILxCZE)	- (StdMag* w12g * MILxKOR)	- (StdMag* w12g * MILxPAC)	- (StdMag* w12g * MILxEUR)	- (StdMag* w12g * MILxISR)	- (StdMag* w12g * x90)	,
			"Base.CP33Clip",	StdMag	* w22	- (w22 * x22)		- (StdMag * xUSA)	- (StdMag* w22 * MILxNON)	- (StdMag* w22 * MILxUSA)	- (StdMag* w22 * MILxSOV)	- (StdMag* w22 * MILxCZE)	- (StdMag* w22 * MILxKOR)	- (StdMag* w22 * MILxPAC)	- (StdMag* w22 * MILxEUR)	- (StdMag* w22 * MILxISR)	- (StdMag* w22 * x90)	,
			"Base.CP33_17MagBase",	ExtMag	* w22	- (w22 * x22)		- (ExtMag * xUSA)	- (ExtMag* w22 * MILxNON)	- (ExtMag* w22 * MILxUSA)	- (ExtMag* w22 * MILxSOV)	- (ExtMag* w22 * MILxCZE)	- (ExtMag* w22 * MILxKOR)	- (ExtMag* w22 * MILxPAC)	- (ExtMag* w22 * MILxEUR)	- (ExtMag* w22 * MILxISR)	- (ExtMag* w22 * x90)	,
			"Base.22Clip",	StdMag	* w22	- (w22 * x22)			- (StdMag* w22 * MILxNON)	- (StdMag* w22 * MILxUSA)	- (StdMag* w22 * MILxSOV)	- (StdMag* w22 * MILxCZE)	- (StdMag* w22 * MILxKOR)	- (StdMag* w22 * MILxPAC)	- (StdMag* w22 * MILxEUR)			,
			"Base.22ExtClip",	ExtMag	* w22	- (w22 * x22)			- (ExtMag* w22 * MILxNON)	- (ExtMag* w22 * MILxUSA)	- (ExtMag* w22 * MILxSOV)	- (ExtMag* w22 * MILxCZE)	- (ExtMag* w22 * MILxKOR)	- (ExtMag* w22 * MILxPAC)	- (ExtMag* w22 * MILxEUR)			,
			"Base.380Clip",	StdMag	* w380	- (w380 * x380)				- (StdMag* w380 * MILxUSA)	- (StdMag* w380 * MILxSOV)		- (StdMag* w380 * MILxKOR)	- (StdMag* w380 * MILxPAC)	- (StdMag* w380 * MILxEUR)	- (StdMag* w380 * MILxISR)		,
			"Base.380ExtClip",	ExtMag	* w380	- (w380 * x380)				- (ExtMag* w380 * MILxUSA)	- (ExtMag* w380 * MILxSOV)		- (ExtMag* w380 * MILxKOR)	- (ExtMag* w380 * MILxPAC)	- (ExtMag* w380 * MILxEUR)	- (ExtMag* w380 * MILxISR)		,
			"Base.9mmClip",	StdMag	* w9	- (w9 * x9)												,
			"Base.9mmExtClip",	ExtMag	* w9	- (w9 * x9)												,
			"Base.45DSClip",	StdMag	* w45	- (w45 * x45)					- (StdMag* w45 * MILxSOV)		- (StdMag* w45 * MILxKOR)	- (StdMag* w45 * MILxPAC)				,
			"Base.45DSExtClip",	ExtMag	* w45	- (w45 * x45)					- (ExtMag* w45 * MILxSOV)		- (ExtMag* w45 * MILxKOR)	- (ExtMag* w45 * MILxPAC)				,
			"Base.45Clip",	StdMag	* w45	- (w45 * x45)					- (StdMag* w45 * MILxSOV)	- (StdMag* w45 * MILxCZE)		- (StdMag* w45 * MILxPAC)		- (StdMag* w45 * MILxISR)		,
			"Base.45ExtClip",	ExtMag	* w45	- (w45 * x45)					- (ExtMag* w45 * MILxSOV)	- (ExtMag* w45 * MILxCZE)		- (ExtMag* w45 * MILxPAC)		- (ExtMag* w45 * MILxISR)		,
			"Base.44Clip",	StdMag	* w44	- (w44 * x44)			- (StdMag* w44 * MILxNON)	- (StdMag* w44 * MILxUSA)	- (StdMag* w44 * MILxSOV)	- (StdMag* w44 * MILxCZE)	- (StdMag* w44 * MILxKOR)	- (StdMag* w44 * MILxPAC)	- (StdMag* w44 * MILxEUR)			,
			"Base.223StdClip",	StdMag	* w223	- (w223 * x223)			- (StdMag* w223 * MILxNON)	- (StdMag* w223 * MILxUSA)	- (StdMag* w223 * MILxSOV)		- (StdMag* w223 * MILxKOR)	- (StdMag* w223 * MILxPAC)	- (StdMag* w223 * MILxEUR)	- (StdMag* w223 * MILxISR)		,
			"Base.223ExtClip",	ExtMag	* w223	- (w223 * x223)			- (ExtMag* w223 * MILxNON)	- (ExtMag* w223 * MILxUSA)	- (ExtMag* w223 * MILxSOV)		- (ExtMag* w223 * MILxKOR)	- (ExtMag* w223 * MILxPAC)	- (ExtMag* w223 * MILxEUR)	- (ExtMag* w223 * MILxISR)		,
			"Base.556Clip",	StdMag	* w556	- (w556 * x556)												,
			"Base.308StdClip",	StdMag	* w308	- (w308 * x308)				- (StdMag* w308 * MILxUSA)	- (StdMag* w308 * MILxSOV)	- (StdMag* w308 * MILxCZE)	- (StdMag* w308 * MILxKOR)	- (StdMag* w308 * MILxPAC)	- (StdMag* w308 * MILxEUR)	- (StdMag* w308 * MILxISR)		,
			"Base.308ExtClip",	ExtMag	* w308	- (w308 * x308)				- (ExtMag* w308 * MILxUSA)	- (ExtMag* w308 * MILxSOV)	- (ExtMag* w308 * MILxCZE)	- (ExtMag* w308 * MILxKOR)	- (ExtMag* w308 * MILxPAC)	- (ExtMag* w308 * MILxEUR)	- (ExtMag* w308 * MILxISR)		,
			"Base.3006ExtClip",	ExtMag	* w3006	- (w3006 * x3006)		- (ExtMag * xUSA)	- (ExtMag* w3006 * MILxNON)	- (ExtMag* w3006 * MILxUSA)	- (ExtMag* w3006 * MILxSOV)	- (ExtMag* w3006 * MILxCZE)	- (ExtMag* w3006 * MILxKOR)	- (ExtMag* w3006 * MILxPAC)	- (ExtMag* w3006 * MILxEUR)	- (ExtMag* w3006 * MILxISR)		,
			"Base.SVDClip",	StdMag	* w762x54r	- (w762x54r * x762x54r)		- (StdMag * xSOV)		- (StdMag* w762x54r * MILxUSA)			- (StdMag* w762x54r * MILxKOR)		- (StdMag* w762x54r * MILxEUR)	- (StdMag* w762x54r * MILxISR)		,
			"Base.ASHClip",	StdMag	* wBMG	- (wBMG * xBMG)		- (StdMag * xSOV)		- (StdMag* wBMG * MILxUSA)		- (StdMag* wBMG * MILxCZE)	- (StdMag* wBMG * MILxKOR)	- (StdMag* wBMG * MILxPAC)	- (StdMag* wBMG * MILxEUR)	- (StdMag* wBMG * MILxISR)	- (StdMag* wBMG * x90)	,
			"Base.M82Clip",	StdMag	* wBMG	- (wBMG * xBMG)		- (StdMag * xUSA)			- (StdMag* wBMG * MILxSOV)		- (StdMag* wBMG * MILxKOR)	- (StdMag* wBMG * MILxPAC)				,
			"Base.M1Clip",	StdMag	* w3006	- (w3006 * x3006)		- (StdMag * xUSA)	- (StdMag* w3006 * MILxNON)	- (StdMag* w3006 * MILxUSA)	- (StdMag* w3006 * MILxSOV)	- (StdMag* w3006 * MILxCZE)	- (StdMag* w3006 * MILxKOR)	- (StdMag* w3006 * MILxPAC)	- (StdMag* w3006 * MILxEUR)	- (StdMag* w3006 * MILxISR)		,
			"Base.SKSClip",	StdMag	* w762x39	- (w762x39 * x762x39)		- (StdMag * xSOV)		- (StdMag* w762x39 * MILxUSA)			- (StdMag* w762x39 * MILxKOR)		- (StdMag* w762x39 * MILxEUR)	- (StdMag* w762x39 * MILxISR)		,
			"Base.1903Clip",	StdMag	* w308	- (w308 * x308)			- (StdMag* w308 * MILxNON)	- (StdMag* w308 * MILxUSA)	- (StdMag* w308 * MILxSOV)	- (StdMag* w308 * MILxCZE)	- (StdMag* w308 * MILxKOR)	- (StdMag* w308 * MILxPAC)	- (StdMag* w308 * MILxEUR)	- (StdMag* w308 * MILxISR)		,
			"Base.545StdClip",	StdMag	* w545x39	- (w545x39 * x545x39)		- (StdMag * xSOV)		- (StdMag* w545x39 * MILxUSA)		- (StdMag* w545x39 * MILxCZE)	- (StdMag* w545x39 * MILxKOR)		- (StdMag* w545x39 * MILxEUR)	- (StdMag* w545x39 * MILxISR)		,
			"Base.AKClip",	StdMag	* w762x39	- (w762x39 * x762x39)				- (StdMag* w762x39 * MILxUSA)			- (StdMag* w762x39 * MILxKOR)		- (StdMag* w762x39 * MILxEUR)			,
			"Base.ASVALClip",	ExtMag	* w9	- (w9 * x9)		- (ExtMag * xSOV)		- (ExtMag* w9 * MILxUSA)		- (ExtMag* w9 * MILxCZE)	- (ExtMag* w9 * MILxKOR)		- (ExtMag* w9 * MILxEUR)	- (ExtMag* w9 * MILxISR)		,
			"Base.VSSClip",	StdMag	* w9	- (w9 * x9)		- (StdMag * xSOV)		- (StdMag* w9 * MILxUSA)		- (StdMag* w9 * MILxCZE)	- (StdMag* w9 * MILxKOR)		- (StdMag* w9 * MILxEUR)	- (StdMag* w9 * MILxISR)		,
			"Base.57Clip",	StdMag	* w57	- (w57 * x57)		- (StdMag * xEUR)	- (StdMag* w57 * MILxNON)	- (StdMag* w57 * MILxUSA)	- (StdMag* w57 * MILxSOV)	- (StdMag* w57 * MILxCZE)	- (StdMag* w57 * MILxKOR)	- (StdMag* w57 * MILxPAC)	- (StdMag* w57 * MILxEUR)	- (StdMag* w57 * MILxISR)	- (StdMag* w57 * x90)	,
			"Base.P90Clip",	StdMag	* w57	- (w57 * x57)		- (StdMag * xEUR)	- (StdMag* w57 * MILxNON)	- (StdMag* w57 * MILxUSA)	- (StdMag* w57 * MILxSOV)	- (StdMag* w57 * MILxCZE)	- (StdMag* w57 * MILxKOR)	- (StdMag* w57 * MILxPAC)	- (StdMag* w57 * MILxEUR)	- (StdMag* w57 * MILxISR)	- (StdMag* w57 * x90)	,
			"Base.22Drum",	DrumMag	* w22	- (w22 * x22)			- (DrumMag* w22 * MILxNON)	- (DrumMag* w22 * MILxUSA)	- (DrumMag* w22 * MILxSOV)	- (DrumMag* w22 * MILxCZE)	- (DrumMag* w22 * MILxKOR)	- (DrumMag* w22 * MILxPAC)	- (DrumMag* w22 * MILxEUR)			,
			"Base.9mmDrum",	DrumMag	* w9	- (w9 * x9)												,
			"Base.45Drum",	DrumMag	* w45	- (w45 * x45)					- (DrumMag* w45 * MILxSOV)		- (DrumMag* w45 * MILxKOR)	- (DrumMag* w45 * MILxPAC)				,
			"Base.556Drum",	DrumMag	* w556	- (w556 * x556)												,
			"Base.545Drum",	DrumMag	* w545x39	- (w545x39 * x545x39)		- (DrumMag * xSOV)		- (DrumMag* w545x39 * MILxUSA)		- (DrumMag* w545x39 * MILxCZE)	- (DrumMag* w545x39 * MILxKOR)		- (DrumMag* w545x39 * MILxEUR)	- (DrumMag* w545x39 * MILxISR)		,
			"Base.762Drum",	DrumMag	* w762x39	- (w762x39 * x762x39)				- (DrumMag* w762x39 * MILxUSA)			- (DrumMag* w762x39 * MILxKOR)		- (DrumMag* w762x39 * MILxEUR)			,
			"Base.12gDrum",	DrumMag	* w12g	- (w12g * x12g)						- (DrumMag* w12g * MILxCZE)						,
			"Base.308Belt",	StdMag	* w308	- (w308 * x308)	- (wLMG * xLMG)											,
			"Base.556Belt",	StdMag	* w556	- (w556 * x556)	- (wLMG * xLMG)				- (StdMag* w556 * MILxSOV)	- (StdMag* w556 * MILxCZE)		- (StdMag* w556 * MILxPAC)	- (StdMag* w556 * MILxEUR)			,
			"Base.762x39Belt",	StdMag	* w762x39	- (w762x39 * x762x39)	- (wLMG * xLMG)			- (StdMag* w762x39 * MILxUSA)		- (StdMag* w762x39 * MILxCZE)	- (StdMag* w762x39 * MILxKOR)		- (StdMag* w762x39 * MILxEUR)	- (StdMag* w762x39 * MILxISR)		,
			"Base.762x54rBelt",	StdMag	* w762x54r	- (w762x54r * x762x54r)	- (wLMG * xLMG)	- (StdMag * xSOV)		- (StdMag* w762x54r * MILxUSA)			- (StdMag* w762x54r * MILxKOR)		- (StdMag* w762x54r * MILxEUR)	- (StdMag* w762x54r * MILxISR)		,
			"Base.556MiniCan",	StdMag	* w556	- (w556 * x556)	- (wMINI * xMINI)	- (StdMag * xUSA)			- (StdMag* w556 * MILxSOV)		- (StdMag* w556 * MILxKOR)	- (StdMag* w556 * MILxPAC)				,
			"Base.308MiniCan",	StdMag	* w308	- (w308 * x308)	- (wMINI * xMINI)	- (StdMag * xUSA)			- (StdMag* w308 * MILxSOV)	- (StdMag* w308 * MILxCZE)	- (StdMag* w308 * MILxKOR)	- (StdMag* w308 * MILxPAC)	- (StdMag* w308 * MILxEUR)	- (StdMag* w308 * MILxISR)		,
			"Base.50MiniCan",	StdMag	* wBMG	- (wBMG * xBMG)	- (wMINI * xMINI)	- (StdMag * xUSA)			- (StdMag* wBMG * MILxSOV)	- (StdMag* wBMG * MILxCZE)	- (StdMag* wBMG * MILxKOR)	- (StdMag* wBMG * MILxPAC)		- (StdMag* wBMG * MILxISR)		,
			"Base.M2A1_Tank",	ExtMag	* wFLAME	- (wFLAME * xFLAME)		- (ExtMag * xUSA)										,
			"Base.M2A1_Can",	StdMag	* wFLAME	- (wFLAME * xFLAME)		- (StdMag * xUSA)										,
			"Base.AmmoCan30_22",	AmmoCan		* w22	- (w22 * x22)		- (AmmoCan * MILxNON)	- (AmmoCan * MILxUSA)	- (AmmoCan * MILxSOV)	- (AmmoCan * MILxCZE)	- (AmmoCan * MILxKOR)	- (AmmoCan * MILxPAC)	- (AmmoCan * MILxEUR)			,
			"Base.AmmoCan30_380",	AmmoCan		* w380	- (w380 * x380)			- (AmmoCan * MILxUSA)	- (AmmoCan * MILxSOV)		- (AmmoCan * MILxKOR)	- (AmmoCan * MILxPAC)	- (AmmoCan * MILxEUR)	- (AmmoCan * MILxISR)		,
			"Base.AmmoCan30_57",	AmmoCan		* w57	- (w57 * x57)		- (AmmoCan * MILxNON)	- (AmmoCan * MILxUSA)	- (AmmoCan * MILxSOV)	- (AmmoCan * MILxCZE)	- (AmmoCan * MILxKOR)	- (AmmoCan * MILxPAC)	- (AmmoCan * MILxEUR)	- (AmmoCan * MILxISR)	- (AmmoCan * x90)	,
			"Base.AmmoCan30_9",	AmmoCan		* w9	- (w9 * x9)											,
			"Base.AmmoCan30_38",	AmmoCan		* w357	- (w357 * x357)		- (AmmoCan * MILxNON)	- (AmmoCan * MILxUSA)	- (AmmoCan * MILxSOV)	- (AmmoCan * MILxCZE)	- (AmmoCan * MILxKOR)	- (AmmoCan * MILxPAC)	- (AmmoCan * MILxEUR)	- (AmmoCan * MILxISR)		,
			"Base.AmmoCan30_357",	AmmoCan		* w357	- (w357 * x357)		- (AmmoCan * MILxNON)	- (AmmoCan * MILxUSA)	- (AmmoCan * MILxSOV)	- (AmmoCan * MILxCZE)	- (AmmoCan * MILxKOR)	- (AmmoCan * MILxPAC)	- (AmmoCan * MILxEUR)	- (AmmoCan * MILxISR)		,
			"Base.AmmoCan30_45",	AmmoCan		* w45	- (w45 * x45)				- (AmmoCan * MILxSOV)			- (AmmoCan * MILxPAC)				,
			"Base.AmmoCan30_44",	AmmoCan		* w44	- (w44 * x44)		- (AmmoCan * MILxNON)	- (AmmoCan * MILxUSA)	- (AmmoCan * MILxSOV)	- (AmmoCan * MILxCZE)	- (AmmoCan * MILxKOR)	- (AmmoCan * MILxPAC)	- (AmmoCan * MILxEUR)	- (AmmoCan * MILxISR)		,
			"Base.AmmoCan30_45LC",	AmmoCan		* w45LC	- (w45LC * x45LC)			- (AmmoCan * MILxUSA)	- (AmmoCan * MILxSOV)	- (AmmoCan * MILxCZE)	- (AmmoCan * MILxKOR)	- (AmmoCan * MILxPAC)	- (AmmoCan * MILxEUR)	- (AmmoCan * MILxISR)		,
			"Base.AmmoCan30_4570",	AmmoCan		* w4570	- (w4570 * x4570)		- (AmmoCan * MILxNON)	- (AmmoCan * MILxUSA)	- (AmmoCan * MILxSOV)	- (AmmoCan * MILxCZE)	- (AmmoCan * MILxKOR)	- (AmmoCan * MILxPAC)	- (AmmoCan * MILxEUR)	- (AmmoCan * MILxISR)		,
			"Base.AmmoCan30_50MAG",	AmmoCan		* wBMG	- (wBMG * xBMG)			- (AmmoCan * MILxUSA)		- (AmmoCan * MILxCZE)	- (AmmoCan * MILxKOR)	- (AmmoCan * MILxPAC)	- (AmmoCan * MILxEUR)	- (AmmoCan * MILxISR)	- (AmmoCan * x90)	,
			"Base.AmmoCan50_223",	AmmoCan		* w223	- (w223 * x223)			- (AmmoCan * MILxUSA)	- (AmmoCan * MILxSOV)		- (AmmoCan * MILxKOR)	- (AmmoCan * MILxPAC)	- (AmmoCan * MILxEUR)	- (AmmoCan * MILxISR)		,
			"Base.AmmoCan50_556",	AmmoCan		* w556	- (w556 * x556)											,
			"Base.AmmoCan50_556",	AmmoCan		* w556	- (w556 * x556)											,
			"Base.AmmoCan50_762x39",	AmmoCan		* w762x39	- (w762x39 * x762x39)			- (AmmoCan * MILxUSA)			- (AmmoCan * MILxKOR)		- (AmmoCan * MILxEUR)			,
			"Base.AmmoCan50_762x39",	AmmoCan		* w762x39	- (w762x39 * x762x39)			- (AmmoCan * MILxUSA)			- (AmmoCan * MILxKOR)		- (AmmoCan * MILxEUR)			,
			"Base.AmmoCan50_545x39",	AmmoCan		* w545x39	- (w545x39 * x545x39)			- (AmmoCan * MILxUSA)		- (AmmoCan * MILxCZE)	- (AmmoCan * MILxKOR)		- (AmmoCan * MILxEUR)	- (AmmoCan * MILxISR)		,
			"Base.AmmoCan50_762x54r",	AmmoCan		* w762x54r	- (w762x54r * x762x54r)			- (AmmoCan * MILxUSA)			- (AmmoCan * MILxKOR)		- (AmmoCan * MILxEUR)	- (AmmoCan * MILxISR)		,
			"Base.AmmoCan50_308",	AmmoCan		* w308	- (w308 * x308)											,
			"Base.AmmoCan50_308",	AmmoCan		* w308	- (w308 * x308)											,
			"Base.AmmoCan50_3006",	AmmoCan		* w3006	- (w3006 * x3006)		- (AmmoCan * MILxNON)	- (AmmoCan * MILxUSA)	- (AmmoCan * MILxSOV)	- (AmmoCan * MILxCZE)	- (AmmoCan * MILxKOR)	- (AmmoCan * MILxPAC)	- (AmmoCan * MILxEUR)	- (AmmoCan * MILxISR)		,
			"Base.AmmoCan50_410",	AmmoCan		* w45LC	- (w45LC * x45LC)		- (AmmoCan * MILxNON)	- (AmmoCan * MILxUSA)	- (AmmoCan * MILxSOV)	- (AmmoCan * MILxCZE)	- (AmmoCan * MILxKOR)	- (AmmoCan * MILxPAC)	- (AmmoCan * MILxEUR)	- (AmmoCan * MILxISR)		,
			"Base.AmmoCan50_20",	AmmoCan		* w20g	- (w20g * x20g)		- (AmmoCan * MILxNON)	- (AmmoCan * MILxUSA)		- (AmmoCan * MILxCZE)	- (AmmoCan * MILxKOR)	- (AmmoCan * MILxPAC)	- (AmmoCan * MILxEUR)	- (AmmoCan * MILxISR)		,
			"Base.AmmoCan50_12",	AmmoCan		* w12g	- (w12g * x12g)											,
			"Base.AmmoCan50_10",	AmmoCan		* w10g	- (w10g * x10g)		- (AmmoCan * MILxNON)	- (AmmoCan * MILxUSA)	- (AmmoCan * MILxSOV)	- (AmmoCan * MILxCZE)	- (AmmoCan * MILxKOR)	- (AmmoCan * MILxPAC)	- (AmmoCan * MILxEUR)	- (AmmoCan * MILxISR)		,
			"Base.AmmoCan50_4",	AmmoCan		* w4g	- (w4g * x4g)		- (AmmoCan * MILxNON)	- (AmmoCan * MILxUSA)	- (AmmoCan * MILxSOV)	- (AmmoCan * MILxCZE)	- (AmmoCan * MILxKOR)	- (AmmoCan * MILxPAC)	- (AmmoCan * MILxEUR)	- (AmmoCan * MILxISR)		,
			"Base.AmmoCan50_50",	AmmoCan		* wBMG	- (wBMG * xBMG)				- (AmmoCan * MILxSOV)	- (AmmoCan * MILxCZE)	- (AmmoCan * MILxKOR)	- (AmmoCan * MILxPAC)		- (AmmoCan * MILxISR)		,
			"Base.AmmoCan50_50",	AmmoCan		* wBMG	- (wBMG * xBMG)				- (AmmoCan * MILxSOV)	- (AmmoCan * MILxCZE)	- (AmmoCan * MILxKOR)	- (AmmoCan * MILxPAC)		- (AmmoCan * MILxISR)		,
			"Base.AmmoCan50_HE",	AmmoCan		* wGREN	- (wGREN * xGREN)											,
			"Base.AmmoCan50_HE",	AmmoCan		* wGREN	- (wGREN * xGREN)											,
			"Base.AmmoCan50_INC",	AmmoCan		* wGREN	- (wGREN * xGREN)											,
			"Base.AmmoCan50_INC",	AmmoCan		* wGREN	- (wGREN * xGREN)											,
			"Base.BB177Box",	AmmoBox		* wBB	- (wBB * xBB)		- (AmmoBox * MILxNON)	- (AmmoBox * MILxUSA)	- (AmmoBox * MILxSOV)	- (AmmoBox * MILxCZE)	- (AmmoBox * MILxKOR)	- (AmmoBox * MILxPAC)	- (AmmoBox * MILxEUR)	- (AmmoBox * MILxISR)		,
			"Base.Bullets22Box",	AmmoBox		* w22	- (w22 * x22)			- (AmmoBox * MILxUSA)	- (AmmoBox * MILxSOV)	- (AmmoBox * MILxCZE)	- (AmmoBox * MILxKOR)	- (AmmoBox * MILxPAC)	- (AmmoBox * MILxEUR)			,
			"Base.Bullets380Box",	AmmoBox		* w380	- (w380 * x380)		- (AmmoBox * MILxNON)	- (AmmoBox * MILxUSA)	- (AmmoBox * MILxSOV)		- (AmmoBox * MILxKOR)	- (AmmoBox * MILxPAC)	- (AmmoBox * MILxEUR)	- (AmmoBox * MILxISR)		,
			"Base.Bullets57Box",	AmmoBox		* w57	- (w57 * x57)		- (AmmoBox * MILxNON)	- (AmmoBox * MILxUSA)	- (AmmoBox * MILxSOV)	- (AmmoBox * MILxCZE)	- (AmmoBox * MILxKOR)	- (AmmoBox * MILxPAC)	- (AmmoBox * MILxEUR)	- (AmmoBox * MILxISR)	- (AmmoBox * x90)	,
			"Base.Bullets9mmBox",	AmmoBox		* w9	- (w9 * x9)											,
			"Base.Bullets38Box",	AmmoBox		* w357	- (w357 * x357)		- (AmmoBox * MILxNON)	- (AmmoBox * MILxUSA)	- (AmmoBox * MILxSOV)	- (AmmoBox * MILxCZE)	- (AmmoBox * MILxKOR)	- (AmmoBox * MILxPAC)	- (AmmoBox * MILxEUR)	- (AmmoBox * MILxISR)		,
			"Base.Bullets357Box",	AmmoBox		* w357	- (w357 * x357)		- (AmmoBox * MILxNON)	- (AmmoBox * MILxUSA)	- (AmmoBox * MILxSOV)	- (AmmoBox * MILxCZE)	- (AmmoBox * MILxKOR)	- (AmmoBox * MILxPAC)	- (AmmoBox * MILxEUR)	- (AmmoBox * MILxISR)		,
			"Base.Bullets45Box",	AmmoBox		* w45	- (w45 * x45)				- (AmmoBox * MILxSOV)			- (AmmoBox * MILxPAC)				,
			"Base.Bullets44Box",	AmmoBox		* w44	- (w44 * x44)		- (AmmoBox * MILxNON)	- (AmmoBox * MILxUSA)	- (AmmoBox * MILxSOV)	- (AmmoBox * MILxCZE)	- (AmmoBox * MILxKOR)	- (AmmoBox * MILxPAC)	- (AmmoBox * MILxEUR)	- (AmmoBox * MILxISR)		,
			"Base.Bullets45LCBox",	AmmoBox		* w45LC	- (w45LC * x45LC)		- (AmmoBox * MILxNON)	- (AmmoBox * MILxUSA)	- (AmmoBox * MILxSOV)	- (AmmoBox * MILxCZE)	- (AmmoBox * MILxKOR)	- (AmmoBox * MILxPAC)	- (AmmoBox * MILxEUR)	- (AmmoBox * MILxISR)		,
			"Base.Bullets4570Box",	AmmoBox		* w4570	- (w4570 * x4570)		- (AmmoBox * MILxNON)	- (AmmoBox * MILxUSA)	- (AmmoBox * MILxSOV)	- (AmmoBox * MILxCZE)	- (AmmoBox * MILxKOR)	- (AmmoBox * MILxPAC)	- (AmmoBox * MILxEUR)	- (AmmoBox * MILxISR)		,
			"Base.Bullets50MAGBox",	AmmoBox		* wBMG	- (wBMG * xBMG)			- (AmmoBox * MILxUSA)		- (AmmoBox * MILxCZE)	- (AmmoBox * MILxKOR)	- (AmmoBox * MILxPAC)	- (AmmoBox * MILxEUR)	- (AmmoBox * MILxISR)	- (AmmoBox * x90)	,
			"Base.223Box",	AmmoBox		* w223	- (w223 * x223)			- (AmmoBox * MILxUSA)	- (AmmoBox * MILxSOV)		- (AmmoBox * MILxKOR)	- (AmmoBox * MILxPAC)	- (AmmoBox * MILxEUR)	- (AmmoBox * MILxISR)		,
			"Base.556Box",	AmmoBox		* w556	- (w556 * x556)											,
			"Base.762x39Box",	AmmoBox		* w762x39	- (w762x39 * x762x39)		- (AmmoBox * MILxNON)	- (AmmoBox * MILxUSA)			- (AmmoBox * MILxKOR)		- (AmmoBox * MILxEUR)			,
			"Base.545x39Box",	AmmoBox		* w545x39	- (w545x39 * x545x39)			- (AmmoBox * MILxUSA)		- (AmmoBox * MILxCZE)	- (AmmoBox * MILxKOR)		- (AmmoBox * MILxEUR)	- (AmmoBox * MILxISR)		,
			"Base.762x54rBox",	AmmoBox		* w762x54r	- (w762x54r * x762x54r)		- (AmmoBox * MILxNON)	- (AmmoBox * MILxUSA)			- (AmmoBox * MILxKOR)		- (AmmoBox * MILxEUR)	- (AmmoBox * MILxISR)		,
			"Base.308Box",	AmmoBox		* w308	- (w308 * x308)											,
			"Base.3006Box",	AmmoBox		* w3006	- (w3006 * x3006)		- (AmmoBox * MILxNON)	- (AmmoBox * MILxUSA)	- (AmmoBox * MILxSOV)	- (AmmoBox * MILxCZE)	- (AmmoBox * MILxKOR)	- (AmmoBox * MILxPAC)	- (AmmoBox * MILxEUR)	- (AmmoBox * MILxISR)		,
			"Base.410gShotgunShellsBox",	AmmoBox		* w45LC	- (w45LC * x45LC)		- (AmmoBox * MILxNON)	- (AmmoBox * MILxUSA)	- (AmmoBox * MILxSOV)	- (AmmoBox * MILxCZE)	- (AmmoBox * MILxKOR)	- (AmmoBox * MILxPAC)	- (AmmoBox * MILxEUR)	- (AmmoBox * MILxISR)		,
			"Base.20gShotgunShellsBox",	AmmoBox		* w20g	- (w20g * x20g)		- (AmmoBox * MILxNON)	- (AmmoBox * MILxUSA)		- (AmmoBox * MILxCZE)	- (AmmoBox * MILxKOR)	- (AmmoBox * MILxPAC)	- (AmmoBox * MILxEUR)	- (AmmoBox * MILxISR)		,
			"Base.ShotgunShellsBox",	AmmoBox		* w12g	- (w12g * x12g)											,
			"Base.10gShotgunShellsBox",	AmmoBox		* w10g	- (w10g * x10g)		- (AmmoBox * MILxNON)	- (AmmoBox * MILxUSA)	- (AmmoBox * MILxSOV)	- (AmmoBox * MILxCZE)	- (AmmoBox * MILxKOR)	- (AmmoBox * MILxPAC)	- (AmmoBox * MILxEUR)	- (AmmoBox * MILxISR)		,
			"Base.4gShotgunShellsBox",	AmmoBox		* w4g	- (w4g * x4g)		- (AmmoBox * MILxNON)	- (AmmoBox * MILxUSA)	- (AmmoBox * MILxSOV)	- (AmmoBox * MILxCZE)	- (AmmoBox * MILxKOR)	- (AmmoBox * MILxPAC)	- (AmmoBox * MILxEUR)	- (AmmoBox * MILxISR)		,
			"Base.50BMGBox",	AmmoBox		* wBMG	- (wBMG * xBMG)				- (AmmoBox * MILxSOV)	- (AmmoBox * MILxCZE)	- (AmmoBox * MILxKOR)	- (AmmoBox * MILxPAC)		- (AmmoBox * MILxISR)		,
			"Base.Bolt_Bear",	AmmoBox		* wBOW	- (wBOW * xBOW)		- (AmmoBox * MILxNON)									,
			"Base.Bolt_Bear_Pack",	AmmoBox		* wBOW	- (wBOW * xBOW)		- (AmmoBox * MILxNON)									,
			"Base.40HERound",	AmmoBox		* wGREN	- (wGREN * xGREN)											,
			"Base.40INCRound",	AmmoBox		* wGREN	- (wGREN * xGREN)											,
			"Base.PolyCan_Red_SPASClip",	StdMag	 * PolyCan	* w12g	- (w12g * x12g)					- (StdMag * MILxCZE)						,
			"Base.PolyCan_Red_12gDrum",	DrumMag	 * PolyCan	* w12g	- (w12g * x12g)					- (DrumMag * MILxCZE)						,
			"Base.PolyCan_Red_38Speed",	StdMag	 * PolyCan	* w357	- (w357 * x357)	- (StdMag * xREV)	- (StdMag * MILxNON)	- (StdMag * MILxUSA)	- (StdMag * MILxSOV)	- (StdMag * MILxCZE)	- (StdMag * MILxKOR)	- (StdMag * MILxPAC)	- (StdMag * MILxEUR)	- (StdMag * MILxISR)		,
			"Base.PolyCan_Red_44Speed",	StdMag	 * PolyCan	* w44	- (w44 * x44)	- (StdMag * xREV)	- (StdMag * MILxNON)	- (StdMag * MILxUSA)	- (StdMag * MILxSOV)	- (StdMag * MILxCZE)	- (StdMag * MILxKOR)	- (StdMag * MILxPAC)	- (StdMag * MILxEUR)	- (StdMag * MILxISR)		,
			"Base.PolyCan_Blue_9mmClip",	StdMag	 * PolyCan	* w9	- (w9 * x9)											,
			"Base.PolyCan_Blue_9mmExtClip",	ExtMag	 * PolyCan	* w9	- (w9 * x9)											,
			"Base.PolyCan_Blue_9mmDrum",	DrumMag	 * PolyCan	* w9	- (w9 * x9)											,
			"Base.PolyCan_Blue_45DSClip",	StdMag	 * PolyCan	* w45	- (w45 * x45)				- (StdMag * MILxSOV)		- (StdMag * MILxKOR)	- (StdMag * MILxPAC)				,
			"Base.PolyCan_Blue_45DSExtClip",	ExtMag	 * PolyCan	* w45	- (w45 * x45)				- (ExtMag * MILxSOV)		- (ExtMag * MILxKOR)	- (ExtMag * MILxPAC)				,
			"Base.PolyCan_Blue_45Drum",	DrumMag	 * PolyCan	* w45	- (w45 * x45)				- (DrumMag * MILxSOV)		- (DrumMag * MILxKOR)	- (DrumMag * MILxPAC)				,
			"Base.PolyCan_Blue_45Clip",	StdMag	 * PolyCan	* w45	- (w45 * x45)				- (StdMag * MILxSOV)	- (StdMag * MILxCZE)		- (StdMag * MILxPAC)		- (StdMag * MILxISR)		,
			"Base.PolyCan_Blue_45ExtClip",	ExtMag	 * PolyCan	* w45	- (w45 * x45)				- (ExtMag * MILxSOV)	- (ExtMag * MILxCZE)		- (ExtMag * MILxPAC)		- (ExtMag * MILxISR)		,
			"Base.PolyCan_Brown_556Clip",	StdMag	 * PolyCan	* w556	- (w556 * x556)											,
			"Base.PolyCan_Brown_556Drum",	DrumMag	 * PolyCan	* w556	- (w556 * x556)											,
			"Base.PolyCan_Brown_AKClip",	StdMag	 * PolyCan	* w762x39	- (w762x39 * x762x39)			- (StdMag * MILxUSA)			- (StdMag * MILxKOR)		- (StdMag * MILxEUR)			,
			"Base.PolyCan_Brown_762Drum",	DrumMag	 * PolyCan	* w762x39	- (w762x39 * x762x39)			- (DrumMag * MILxUSA)			- (DrumMag * MILxKOR)		- (DrumMag * MILxEUR)			,
			"Base.PolyCan_Brown_545StdClip",	StdMag	 * PolyCan	* w545x39	- (w545x39 * x545x39)			- (StdMag * MILxUSA)		- (StdMag * MILxCZE)	- (StdMag * MILxKOR)		- (StdMag * MILxEUR)	- (StdMag * MILxISR)		,
			"Base.PolyCan_Brown_545Drum",	DrumMag	 * PolyCan	* w545x39	- (w545x39 * x545x39)			- (DrumMag * MILxUSA)		- (DrumMag * MILxCZE)	- (DrumMag * MILxKOR)		- (DrumMag * MILxEUR)	- (DrumMag * MILxISR)		,
			"Base.PolyCan_Beige_308StdClip",	StdMag	 * PolyCan	* w308	- (w308 * x308)											,
			"Base.PolyCan_Beige_308ExtClip",	ExtMag	 * PolyCan	* w308	- (w308 * x308)											,
			"Base.PolyCan_Beige_BMG",	StdMag	 * PolyCan	* wBMG	- (wBMG * xBMG)				- (StdMag * MILxSOV)		- (StdMag * MILxKOR)	- (StdMag * MILxPAC)				,
			"Base.PolyCan_Beige_K11",	StdMag	 * PolyCan	* wGREN	- (wGREN * xGREN)	- (StdMag * xKOR)		- (StdMag * MILxUSA)	- (StdMag * MILxSOV)	- (StdMag * MILxCZE)		- (StdMag * MILxPAC)	- (StdMag * MILxEUR)	- (StdMag * MILxISR)	- (StdMag * x90)	,
			"Base.PolyCan_Beige_SVDClip",	StdMag	 * PolyCan	* w762x54r	- (w762x54r * x762x54r)	- (StdMag * xSOV)		- (StdMag * MILxUSA)			- (StdMag * MILxKOR)		- (StdMag * MILxEUR)	- (StdMag * MILxISR)		,
			"Base.PolyCan_Beige_SKSClip",	StdMag	 * PolyCan	* w762x39	- (w762x39 * x762x39)	- (StdMag * xSOV)		- (StdMag * MILxUSA)			- (StdMag * MILxKOR)		- (StdMag * MILxEUR)	- (StdMag * MILxISR)		,
			"Base.PolyCan_Beige_M1Clip",	StdMag	 * PolyCan	* w3006	- (w3006 * x3006)	- (StdMag * xUSA)	- (StdMag * MILxNON)	- (StdMag * MILxUSA)	- (StdMag * MILxSOV)	- (StdMag * MILxCZE)	- (StdMag * MILxKOR)	- (StdMag * MILxPAC)	- (StdMag * MILxEUR)	- (StdMag * MILxISR)		,
			"Base.PolyCan_Beige_1903Clip",	StdMag	 * PolyCan	* w308	- (w308 * x308)		- (StdMag * MILxNON)	- (StdMag * MILxUSA)	- (StdMag * MILxSOV)	- (StdMag * MILxCZE)	- (StdMag * MILxKOR)	- (StdMag * MILxPAC)	- (StdMag * MILxEUR)	- (StdMag * MILxISR)		,
		}																
	},																	
																		
	SecurityGuns = {																	
		rolls =	SECRollGUN	,														
		items = {																
			"Base.UmarexSS",	wBB	 * SECx	- (wBB * xBB)		- (wBB * SECx * xUSA)		- (wBB * SECx * SECxNON)	- (wBB * SECx * x90)	,						
			"Base.Benjamin_M397",	wBB	 * SECx	- (wBB * xBB)		- (wBB * SECx * xUSA)		- (wBB * SECx * SECxNON)		,						
			"Base.RWS_M34",	wBB	 * SECx	- (wBB * xBB)		- (wBB * SECx * xUSA)		- (wBB * SECx * SECxNON)	- (wBB * SECx * x90)	,						
			"Base.CP33",	w22	 * SECx	- (w22 * x22)	- (w22 * SECx * xSEMI)	- (w22 * SECx * xUSA)		- (w22 * SECx * SECxNON)	- (w22 * SECx * x90)	,						
			"Base.Ruger_MK4",	w22	 * SECx	- (w22 * x22)	- (w22 * SECx * xSEMI)	- (w22 * SECx * xUSA)		- (w22 * SECx * SECxNON)	- (w22 * SECx * x90)	,						
			"Base.Buckmark",	w22	 * SECx	- (w22 * x22)	- (w22 * SECx * xSEMI)	- (w22 * SECx * xUSA)		- (w22 * SECx * SECxNON)		,						
			"Base.Buckmark_Long",	w22	 * SECx	- (w22 * x22)	- (w22 * SECx * xSEMI)	- (w22 * SECx * xUSA)		- (w22 * SECx * SECxNON)		,						
			"Base.Buckmark_Carbine",	w22	 * SECx	- (w22 * x22)	- (w22 * SECx * xSEMI)	- (w22 * SECx * xUSA)		- (w22 * SECx * SECxNON)		,						
			"Base.HK4_22",	w22	 * SECx	- (w22 * x22)	- (w22 * SECx * xSEMI)	- (w22 * SECx * xEUR)		- (w22 * SECx * SECxNON)		,						
			"Base.ZIP22",	w22	 * SECx	- (w22 * x22)	- (w22 * SECx * xSEMI)	- (w22 * SECx * xUSA)		- (w22 * SECx * SECxNON)	- (w22 * SECx * x90)	,						
			"Base.Ruger_1022",	w22	 * SECx	- (w22 * x22)	- (w22 * SECx * xSEMI)	- (w22 * SECx * xUSA)		- (w22 * SECx * SECxNON)		,						
			"Base.Marlin_M70",	w22	 * SECx	- (w22 * x22)	- (w22 * SECx * xSEMI)	- (w22 * SECx * xUSA)		- (w22 * SECx * SECxNON)		,						
			"Base.Cricket_22",	w22	 * SECx	- (w22 * x22)	- (w22 * SECx * xBOLT)	- (w22 * SECx * xUSA)		- (w22 * SECx * SECxNON)		,						
			"Base.AR7",	w22	 * SECx	- (w22 * x22)	- (w22 * SECx * xSEMI)	- (w22 * SECx * xUSA)		- (w22 * SECx * SECxNON)		,						
			"Base.Calico_22LR",	w22	 * SECx	- (w22 * x22)	- (w22 * SECx * xSMG)	- (w22 * SECx * xUSA)		- (w22 * SECx * SECxNON)		,						
			"Base.American180",	w22	 * SECx	- (w22 * x22)	- (w22 * SECx * xSMG)	- (w22 * SECx * xUSA)		- (w22 * SECx * SECxNON)		,						
			"Base.Winchester1903",	w22	 * SECx	- (w22 * x22)	- (w22 * SECx * xLEVER)	- (w22 * SECx * xUSA)		- (w22 * SECx * SECxNON)		,						
			"Base.G42",	w380	 * SECx	- (w380 * x380)	- (w380 * SECx * xSEMI)	- (w380 * SECx * xEUR)		- (w380 * SECx * SECxNON)	- (w380 * SECx * x90)	,						
			"Base.LCP380",	w380	 * SECx	- (w380 * x380)	- (w380 * SECx * xSEMI)	- (w380 * SECx * xUSA)		- (w380 * SECx * SECxNON)	- (w380 * SECx * x90)	,						
			"Base.BodyGuard380",	w380	 * SECx	- (w380 * x380)	- (w380 * SECx * xSEMI)	- (w380 * SECx * xUSA)		- (w380 * SECx * SECxNON)	- (w380 * SECx * x90)	,						
			"Base.Bersa85F",	w380	 * SECx	- (w380 * x380)	- (w380 * SECx * xSEMI)	- (w380 * SECx * xREST)		- (w380 * SECx * SECxNON)		,						
			"Base.Colt1903",	w380	 * SECx	- (w380 * x380)	- (w380 * SECx * xSEMI)	- (w380 * SECx * xUSA)		- (w380 * SECx * SECxNON)		,						
			"Base.Makarov380",	w380	 * SECx	- (w380 * x380)	- (w380 * SECx * xSEMI)	- (w380 * SECx * xSOV)		- (w380 * SECx * SECxNON)		,						
			"Base.PPK",	w380	 * SECx	- (w380 * x380)	- (w380 * SECx * xSEMI)	- (w380 * SECx * xEUR)		- (w380 * SECx * SECxNON)		,						
			"Base.HK4_380",	w380	 * SECx	- (w380 * x380)	- (w380 * SECx * xSEMI)	- (w380 * SECx * xEUR)		- (w380 * SECx * SECxNON)		,						
			"Base.VP70",	w380	 * SECx	- (w380 * x380)	- (w380 * SECx * xSMG)	- (w380 * SECx * xEUR)		- (w380 * SECx * SECxNON)		,						
			"Base.VP70_Stock",	w380	 * SECx	- (w380 * x380)	- (w380 * SECx * xSMG)	- (w380 * SECx * xEUR)		- (w380 * SECx * SECxNON)		,						
			"Base.Vz61_Fixed",	w380	 * SECx	- (w380 * x380)	- (w380 * SECx * xSMG)	- (w380 * SECx * xCZE)		- (w380 * SECx * SECxNON)		,						
			"Base.Vz61_Fold",	w380	 * SECx	- (w380 * x380)	- (w380 * SECx * xSMG)	- (w380 * SECx * xCZE)		- (w380 * SECx * SECxNON)		,						
			"Base.BT380_Stock",	w380	 * SECx	- (w380 * x380)	- (w380 * SECx * xSEMI)	- (w380 * SECx * xEUR)		- (w380 * SECx * SECxNON)	- (w380 * SECx * x90)	,						
			"Base.FN_57", 	w57	 * SECx	- (w57 * x57)	- (w57 * SECx * xSEMI)	- (w57 * SECx * xEUR)			- (w57 * SECx * x90)	,						
			"Base.FN_57_MK2", 	w57	 * SECx	- (w57 * x57)	- (w57 * SECx * xSEMI)	- (w57 * SECx * xEUR)			- (w57 * SECx * x90)	,						
			"Base.FN_P90",	w57	 * SECx	- (w57 * x57)	- (w57 * SECx * xSMG)	- (w57 * SECx * xEUR)			- (w57 * SECx * x90)	,						
			"Base.FN_PS90",	w57	 * SECx	- (w57 * x57)	- (w57 * SECx * xSMG)	- (w57 * SECx * xEUR)			- (w57 * SECx * x90)	,						
			"Base.CZ75",	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSEMI)	- (w9 * SECx * xCZE)				,						
			"Base.G17",	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSEMI)	- (w9 * SECx * xEUR)		- (w9 * SECx * SECxNON)		,						
			"Base.G18",	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xEUR)		- (w9 * SECx * SECxNON)		,						
			"Base.G34", 	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSEMI)	- (w9 * SECx * xUSA)			- (w9 * SECx * x90)	,						
			"Base.K5",	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSEMI)	- (w9 * SECx * xKOR)				,						
			"Base.M9",	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSEMI)	- (w9 * SECx * xEUR)				,						
			"Base.M9A3",	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSEMI)	- (w9 * SECx * xEUR)			- (w9 * SECx * x90)	,						
			"Base.B93R",	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xEUR)		- (w9 * SECx * SECxNON)		,						
			"Base.M5906",	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSEMI)	- (w9 * SECx * xUSA)				,						
			"Base.XD9",	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSEMI)	- (w9 * SECx * xUSA)			- (w9 * SECx * x90)	,						
			"Base.MP9",	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSEMI)	- (w9 * SECx * xUSA)			- (w9 * SECx * x90)	,						
			"Base.P226",	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSEMI)	- (w9 * SECx * xEUR)				,						
			"Base.APS",	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xSOV)		- (w9 * SECx * SECxNON)		,						
			"Base.Makarov",	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSEMI)	- (w9 * SECx * xSOV)		- (w9 * SECx * SECxNON)		,						
			"Base.PB",	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSEMI)	- (w9 * SECx * xSOV)		- (w9 * SECx * SECxNON)		,						
			"Base.Luger",	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSEMI)	- (w9 * SECx * xEUR)		- (w9 * SECx * SECxNON)		,						
			"Base.Luger_WW1",	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSEMI)	- (w9 * SECx * xEUR)		- (w9 * SECx * SECxNON)		,						
			"Base.Luger_Carbine",	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSEMI)	- (w9 * SECx * xEUR)		- (w9 * SECx * SECxNON)		,						
			"Base.UZI", 	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xREST)				,						
			"Base.UZI_Wood",	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xREST)				,						
			"Base.UZI_Micro",	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xREST)				,						
			"Base.BT9_Fold",	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xEUR)			- (w9 * SECx * x90)	,						
			"Base.UMP9_Stock",	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xEUR)			- (w9 * SECx * x90)	,						
			"Base.SUB2000",	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSEMI)	- (w9 * SECx * xUSA)		- (w9 * SECx * SECxNON)	- (w9 * SECx * x90)	,						
			"Base.MP5_Fixed",	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xEUR)				,						
			"Base.MP5_Stock",	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xEUR)				,						
			"Base.MP5SD6_Fixed",	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xEUR)	- (w9 * SECx * CIVxMIL)			,						
			"Base.MP5SD6_Stock",	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xEUR)	- (w9 * SECx * CIVxMIL)			,						
			"Base.EVO_Fold",	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xCZE)			- (w9 * SECx * x90)	,						
			"Base.K7_Stock",	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xKOR)	- (w9 * SECx * CIVxMIL)			,						
			"Base.AUG9",	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xEUR)				,						
			"Base.KG9",	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xUSA)				,						
			"Base.Calico_M900_Fold",	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xUSA)		- (w9 * SECx * SECxNON)		,						
			"Base.Calico_M950_Pistol",	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xUSA)		- (w9 * SECx * SECxNON)		,						
			"Base.VSS",	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xSOV)		- (w9 * SECx * SECxNON)		,						
			"Base.ASVAL",	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xSOV)		- (w9 * SECx * SECxNON)		,						
			"Base.M1Carbine",	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSEMI)	- (w9 * SECx * xUSA)		- (w9 * SECx * SECxNON)		,						
			"Base.M2Carbine",	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xUSA)		- (w9 * SECx * SECxNON)		,						
			"Base.M635",	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xUSA)				,						
			"Base.M635S",	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xUSA)				,						
			"Base.M635SD",	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xUSA)	- (w9 * SECx * CIVxMIL)			,						
			"Base.MP7",	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xEUR)			- (w9 * SECx * x90)	,						
			"Base.Jatimatic",	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xEUR)				,						
			"Base.Sten",	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xEUR)		- (w9 * SECx * SECxNON)		,						
			"Base.Sten_MK2",	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xEUR)		- (w9 * SECx * SECxNON)		,						
			"Base.Sten_MK2SD",	w9	 * SECx	- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xEUR)		- (w9 * SECx * SECxNON)		,						
			"Base.M5238",	w357	 * SECx	- (w357 * x357)	- (w357 * SECx * xSEMI)	- (w357 * SECx * xUSA)		- (w357 * SECx * SECxNON)		,						
			"Base.Taurus856",	w357	 * SECx	- (w357 * x357)	- (w357 * SECx * xREV)	- (w357 * SECx * xREST)		- (w357 * SECx * SECxNON)	- (w357 * SECx * x90)	,						
			"Base.Colt_Service38",	w357	 * SECx	- (w357 * x357)	- (w357 * SECx * xREV)	- (w357 * SECx * xUSA)		- (w357 * SECx * SECxNON)		,						
			"Base.GP100_2",	w357	 * SECx	- (w357 * x357)	- (w357 * SECx * xREV)	- (w357 * SECx * xUSA)		- (w357 * SECx * SECxNON)		,						
			"Base.GP100_4",	w357	 * SECx	- (w357 * x357)	- (w357 * SECx * xREV)	- (w357 * SECx * xUSA)		- (w357 * SECx * SECxNON)		,						
			"Base.GP100_6",	w357	 * SECx	- (w357 * x357)	- (w357 * SECx * xREV)	- (w357 * SECx * xUSA)		- (w357 * SECx * SECxNON)		,						
			"Base.K6S",	w357	 * SECx	- (w357 * x357)	- (w357 * SECx * xREV)	- (w357 * SECx * xUSA)		- (w357 * SECx * SECxNON)	- (w357 * SECx * x90)	,						
			"Base.M1936",	w357	 * SECx	- (w357 * x357)	- (w357 * SECx * xREV)	- (w357 * SECx * xUSA)		- (w357 * SECx * SECxNON)		,						
			"Base.NEF_Handi_38",	w357	 * SECx	- (w357 * x357)	- (w357 * SECx * xBREAK)	- (w357 * SECx * xUSA)		- (w357 * SECx * SECxNON)		,						
			"Base.Marlin_1894",	w357	 * SECx	- (w357 * x357)	- (w357 * SECx * xLEVER)	- (w357 * SECx * xUSA)		- (w357 * SECx * SECxNON)		,						
			"Base.CZ97B",	w45	 * SECx	- (w45 * x45)	- (w45 * SECx * xSEMI)	- (w45 * SECx * xCZE)			- (w45 * SECx * x90)	,						
			"Base.G21",	w45	 * SECx	- (w45 * x45)	- (w45 * SECx * xSEMI)	- (w45 * SECx * xEUR)				,						
			"Base.XD4",	w45	 * SECx	- (w45 * x45)	- (w45 * SECx * xSEMI)	- (w45 * SECx * xUSA)			- (w45 * SECx * x90)	,						
			"Base.MP45",	w45	 * SECx	- (w45 * x45)	- (w45 * SECx * xSEMI)	- (w45 * SECx * xUSA)			- (w45 * SECx * x90)	,						
			"Base.P220",	w45	 * SECx	- (w45 * x45)	- (w45 * SECx * xSEMI)	- (w45 * SECx * xEUR)				,						
			"Base.M4506",	w45	 * SECx	- (w45 * x45)	- (w45 * SECx * xSEMI)	- (w45 * SECx * xUSA)				,						
			"Base.PARA1911",	w45	 * SECx	- (w45 * x45)	- (w45 * SECx * xSEMI)	- (w45 * SECx * xUSA)				,						
			"Base.AMT1911",	w45	 * SECx	- (w45 * x45)	- (w45 * SECx * xSEMI)	- (w45 * SECx * xUSA)				,						
			"Base.AMT1911_Long",	w45	 * SECx	- (w45 * x45)	- (w45 * SECx * xSEMI)	- (w45 * SECx * xUSA)				,						
			"Base.M1911_Carbine",	w45	 * SECx	- (w45 * x45)	- (w45 * SECx * xSEMI)	- (w45 * SECx * xUSA)		- (w45 * SECx * SECxNON)		,						
			"Base.Colt1911",	w45	 * SECx	- (w45 * x45)	- (w45 * SECx * xSEMI)	- (w45 * SECx * xUSA)				,						
			"Base.Colt_Kimber",	w45	 * SECx	- (w45 * x45)	- (w45 * SECx * xSEMI)	- (w45 * SECx * xUSA)			- (w45 * SECx * x90)	,						
			"Base.Colt_Commander",	w45	 * SECx	- (w45 * x45)	- (w45 * SECx * xSEMI)	- (w45 * SECx * xUSA)				,						
			"Base.UMP45_Stock",	w45	 * SECx	- (w45 * x45)	- (w45 * SECx * xSMG)	- (w45 * SECx * xEUR)			- (w45 * SECx * x90)	,						
			"Base.MAC10_Fold",	w45	 * SECx	- (w45 * x45)	- (w45 * SECx * xSMG)	- (w45 * SECx * xUSA)				,						
			"Base.KRISS_Stock",	w45	 * SECx	- (w45 * x45)	- (w45 * SECx * xSMG)	- (w45 * SECx * xUSA)			- (w45 * SECx * x90)	,						
			"Base.Commando",	w45	 * SECx	- (w45 * x45)	- (w45 * SECx * xBOLT)	- (w45 * SECx * xEUR)		- (w45 * SECx * SECxNON)		,						
			"Base.Thompson",	w45	 * SECx	- (w45 * x45)	- (w45 * SECx * xSMG)	- (w45 * SECx * xUSA)		- (w45 * SECx * SECxNON)		,						
			"Base.Thompson_1928",	w45	 * SECx	- (w45 * x45)	- (w45 * SECx * xSMG)	- (w45 * SECx * xUSA)		- (w45 * SECx * SECxNON)		,						
			"Base.M2Hyde",	w45	 * SECx	- (w45 * x45)	- (w45 * SECx * xSMG)	- (w45 * SECx * xUSA)		- (w45 * SECx * SECxNON)		,						
			"Base.Model55_Fold",	w45	 * SECx	- (w45 * x45)	- (w45 * SECx * xSMG)	- (w45 * SECx * xUSA)		- (w45 * SECx * SECxNON)		,						
			"Base.Model50",	w45	 * SECx	- (w45 * x45)	- (w45 * SECx * xSMG)	- (w45 * SECx * xUSA)		- (w45 * SECx * SECxNON)		,						
			"Base.Colt_Navy_1851",	w44	 * SECx	- (w44 * x44)	- (w44 * SECx * xREV)	- (w44 * SECx * xUSA)		- (w44 * SECx * SECxNON)		,						
			"Base.M29_44",	w44	 * SECx	- (w44 * x44)	- (w44 * SECx * xREV)	- (w44 * SECx * xUSA)		- (w44 * SECx * SECxNON)		,						
			"Base.M29_44Carbine",	w44	 * SECx	- (w44 * x44)	- (w44 * SECx * xREV)	- (w44 * SECx * xUSA)		- (w44 * SECx * SECxNON)		,						
			"Base.Automag",	w44	 * SECx	- (w44 * x44)	- (w44 * SECx * xSEMI)	- (w44 * SECx * xUSA)		- (w44 * SECx * SECxNON)		,						
			"Base.DEagle",	w44	 * SECx	- (w44 * x44)	- (w44 * SECx * xSEMI)	- (w44 * SECx * xISR)		- (w44 * SECx * SECxNON)		,						
			"Base.DEagle_Long",	w44	 * SECx	- (w44 * x44)	- (w44 * SECx * xSEMI)	- (w44 * SECx * xISR)		- (w44 * SECx * SECxNON)		,						
			"Base.Winchester1866",	w45LC	 * SECx	- (w44 * x44)	- (w45LC * SECx * xLEVER)	- (w45LC * SECx * xUSA)		- (w45LC * SECx * SECxNON)		,						
			"Base.Win_1894",	w44	 * SECx	- (w44 * x44)	- (w44 * SECx * xLEVER)	- (w44 * SECx * xUSA)		- (w44 * SECx * SECxNON)		,						
			"Base.Colt_Service45",	w45LC	 * SECx	- (w45LC * x45LC)	- (w45LC * SECx * xREV)	- (w45LC * SECx * xUSA)		- (w45LC * SECx * SECxNON)		,						
			"Base.Judge_45LC",	w45LC	 * SECx	- (w45LC * x45LC)	- (w45LC * SECx * xREV)	- (w45LC * SECx * xREST)		- (w45LC * SECx * SECxNON)	- (w45LC * SECx * x90)	,						
			"Base.Judge513_45LC",	w45LC	 * SECx	- (w45LC * x45LC)	- (w45LC * SECx * xREV)	- (w45LC * SECx * xREST)		- (w45LC * SECx * SECxNON)	- (w45LC * SECx * x90)	,						
			"Base.Judge513_Long_45LC",	w45LC	 * SECx	- (w45LC * x45LC)	- (w45LC * SECx * xREV)	- (w45LC * SECx * xREST)		- (w45LC * SECx * SECxNON)	- (w45LC * SECx * x90)	,						
			"Base.TXS_804_45LC",	w45LC	 * SECx	- (w45LC * x45LC)	- (w45LC * SECx * xREV)	- (w45LC * SECx * xREST)		- (w45LC * SECx * SECxNON)		,						
			"Base.Winchester1873",	w45LC	 * SECx	- (w45LC * x45LC)	- (w45LC * SECx * xLEVER)	- (w45LC * SECx * xUSA)		- (w45LC * SECx * SECxNON)		,						
			"Base.Sako85",	w223	 * SECx	- (w223 * x223)	- (w223 * SECx * xBOLT)	- (w223 * SECx * xEUR)		- (w223 * SECx * SECxNON)		,						
			"Base.MINI14",	w223	 * SECx	- (w223 * x223)	- (w223 * SECx * xSEMI)	- (w223 * SECx * xUSA)		- (w223 * SECx * SECxNON)		,						
			"Base.MINI14_T",	w223	 * SECx	- (w223 * x223)	- (w223 * SECx * xSEMI)	- (w223 * SECx * xUSA)		- (w223 * SECx * SECxNON)		,						
			"Base.Viper",	w223	 * SECx	- (w223 * x223)	- (w223 * SECx * xLEVER)	- (w223 * SECx * xREST)		- (w223 * SECx * SECxNON)	- (w223 * SECx * x90)	,						
			"Base.CAR15SMG",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xUSA)				,						
			"Base.CAR15_Survival",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xUSA)				,						
			"Base.XM8Compact_Pistol",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xEUR)			- (w556 * SECx * x90)	,						
			"Base.XM8",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xEUR)			- (w556 * SECx * x90)	,						
			"Base.SCARSC_Stock",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xEUR)			- (w556 * SECx * x90)	,						
			"Base.SCARL",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xEUR)			- (w556 * SECx * x90)	,						
			"Base.G33",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xEUR)				,						
			"Base.MK18",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xEUR)			- (w556 * SECx * x90)	,						
			"Base.M16A1",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xUSA)				,						
			"Base.M16A2",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xUSA)				,						
			"Base.M16A3",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xUSA)				,						
			"Base.M723",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xUSA)				,						
			"Base.XM117",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xUSA)			- (w556 * SECx * x90)	,						
			"Base.H416",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xEUR)			- (w556 * SECx * x90)	,						
			"Base.M4",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xUSA)				,						
			"Base.M4A1",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xUSA)				,						
			"Base.ADAR",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xSOV)			- (w556 * SECx * x90)	,						
			"Base.K2C1_PH",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xKOR)			- (w556 * SECx * x90)	,						
			"Base.K1DEV",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xKOR)				,						
			"Base.K2_C1",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xKOR)			- (w556 * SECx * x90)	,						
			"Base.K2_1",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xKOR)				,						
			"Base.K2_203",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xKOR)	- (w556 * SECx * CIVxMIL)			,						
			"Base.K1_1",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xKOR)				,						
			"Base.DR_200",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xKOR)			- (w556 * SECx * x90)	,						
			"Base.LVOA_C",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xSEMI)	- (w556 * SECx * xUSA)			- (w556 * SECx * x90)	,						
			"Base.MCX_Spear",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xSEMI)	- (w556 * SECx * xEUR)			- (w556 * SECx * x90)	,						
			"Base.ColtM16",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xUSA)				,						
			"Base.M16Wood",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xUSA)				,						
			"Base.M16Tape",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xUSA)				,						
			"Base.FAMAS",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xEUR)				,						
			"Base.FAMAS_G2",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xEUR)				,						
			"Base.FAMAS_Felin",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xEUR)				,						
			"Base.AUG",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xEUR)				,						
			"Base.M85_Stock",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xSOV)				,						
			"Base.AK74",	w545x39	 * SECx	- (w545x39 * x545x39)	- (w545x39 * SECx * xAUTO)	- (w545x39 * SECx * xSOV)				,						
			"Base.AKS74",	w545x39	 * SECx	- (w545x39 * x545x39)	- (w545x39 * SECx * xAUTO)	- (w545x39 * SECx * xSOV)				,						
			"Base.AKS74U",	w545x39	 * SECx	- (w545x39 * x545x39)	- (w545x39 * SECx * xAUTO)	- (w545x39 * SECx * xSOV)				,						
			"Base.AK74_Alpha",	w545x39	 * SECx	- (w545x39 * x545x39)	- (w545x39 * SECx * xAUTO)	- (w545x39 * SECx * xSOV)			- (w545x39 * SECx * x90)	,						
			"Base.AK12",	w545x39	 * SECx	- (w545x39 * x545x39)	- (w545x39 * SECx * xAUTO)	- (w545x39 * SECx * xSOV)			- (w545x39 * SECx * x90)	,						
			"Base.AK12_New",	w545x39	 * SECx	- (w545x39 * x545x39)	- (w545x39 * SECx * xAUTO)	- (w545x39 * SECx * xSOV)			- (w545x39 * SECx * x90)	,						
			"Base.RPK74",	w545x39	 * SECx	- (w545x39 * x545x39)	- (w545x39 * SECx * xLMG)	- (w545x39 * SECx * xSOV)				,						
			"Base.RPK16",	w545x39	 * SECx	- (w545x39 * x545x39)	- (w545x39 * SECx * xLMG)	- (w545x39 * SECx * xSOV)			- (w545x39 * SECx * x90)	,						
			"Base.L85",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xEUR)				,						
			"Base.L85A2",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xEUR)			- (w556 * SECx * x90)	,						
			"Base.L86",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xEUR)				,						
			"Base.L22",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xEUR)			- (w556 * SECx * x90)	,						
			"Base.F2000",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xEUR)			- (w556 * SECx * x90)	,						
			"Base.Tavor",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xISR)			- (w556 * SECx * x90)	,						
			"Base.AR18",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xUSA)				,						
			"Base.Type20",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xPAC)			- (w556 * SECx * x90)	,						
			"Base.Type89",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xPAC)				,						
			"Base.QBZ_95",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xPAC)			- (w556 * SECx * x90)	,						
			"Base.XM8LMG",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xLMG)	- (w556 * SECx * xEUR)	- (w556 * SECx * CIVxMIL)		- (w556 * SECx * x90)	,						
			"Base.M249",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xLMG)	- (w556 * SECx * xUSA)	- (w556 * SECx * CIVxMIL)			,						
			"Base.M249E3",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xLMG)	- (w556 * SECx * xUSA)	- (w556 * SECx * CIVxMIL)		- (w556 * SECx * x90)	,						
			"Base.K3LMG",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xLMG)	- (w556 * SECx * xKOR)	- (w556 * SECx * CIVxMIL)			,						
			"Base.AK47",	w762x39	 * SECx	- (w762x39 * x762x39)	- (w762x39 * SECx * xAUTO)	- (w762x39 * SECx * xSOV)				,						
			"Base.AKM",	w762x39	 * SECx	- (w762x39 * x762x39)	- (w762x39 * SECx * xAUTO)	- (w762x39 * SECx * xSOV)				,						
			"Base.AK103",	w762x39	 * SECx	- (w762x39 * x762x39)	- (w762x39 * SECx * xAUTO)	- (w762x39 * SECx * xSOV)			- (w762x39 * SECx * x90)	,						
			"Base.MD65_Stock",	w762x39	 * SECx	- (w762x39 * x762x39)	- (w762x39 * SECx * xAUTO)	- (w762x39 * SECx * xSOV)				,						
			"Base.AKMS_Stock",	w762x39	 * SECx	- (w762x39 * x762x39)	- (w762x39 * SECx * xAUTO)	- (w762x39 * SECx * xSOV)				,						
			"Base.Vz58",	w762x39	 * SECx	- (w762x39 * x762x39)	- (w762x39 * SECx * xAUTO)	- (w762x39 * SECx * xCZE)				,						
			"Base.Vz58_Stock",	w762x39	 * SECx	- (w762x39 * x762x39)	- (w762x39 * SECx * xAUTO)	- (w762x39 * SECx * xCZE)				,						
			"Base.Vz58_Mini_Stock",	w762x39	 * SECx	- (w762x39 * x762x39)	- (w762x39 * SECx * xAUTO)	- (w762x39 * SECx * xCZE)				,						
			"Base.SKS",	w762x39	 * SECx	- (w762x39 * x762x39)	- (w762x39 * SECx * xSEMI)	- (w762x39 * SECx * xSOV)		- (w762x39 * SECx * SECxNON)		,						
			"Base.SKS_PARA",	w762x39	 * SECx	- (w762x39 * x762x39)	- (w762x39 * SECx * xSEMI)	- (w762x39 * SECx * xPAC)		- (w762x39 * SECx * SECxNON)		,						
			"Base.MK47",	w762x39	 * SECx	- (w762x39 * x762x39)	- (w762x39 * SECx * xSEMI)	- (w762x39 * SECx * xUSA)			- (w762x39 * SECx * x90)	,						
			"Base.AK308",	w308	 * SECx	- (w308 * x308)	- (w308 * SECx * xAUTO)	- (w308 * SECx * xSOV)			- (w308 * SECx * x90)	,						
			"Base.SCARH",	w308	 * SECx	- (w308 * x308)	- (w308 * SECx * xAUTO)	- (w308 * SECx * xEUR)			- (w308 * SECx * x90)	,						
			"Base.SCAR20",	w308	 * SECx	- (w308 * x308)	- (w308 * SECx * xAUTO)	- (w308 * SECx * xEUR)			- (w308 * SECx * x90)	,						
			"Base.G28",	w308	 * SECx	- (w308 * x308)	- (w308 * SECx * xAUTO)	- (w308 * SECx * xEUR)			- (w308 * SECx * x90)	,						
			"Base.G3",	w308	 * SECx	- (w308 * x308)	- (w308 * SECx * xAUTO)	- (w308 * SECx * xEUR)				,						
			"Base.Type64",	w308	 * SECx	- (w308 * x308)	- (w308 * SECx * xAUTO)	- (w308 * SECx * xPAC)		- (w308 * SECx * SECxNON)		,						
			"Base.FAL",	w308	 * SECx	- (w308 * x308)	- (w308 * SECx * xAUTO)	- (w308 * SECx * xEUR)				,						
			"Base.FAL_PARA_Stock",	w308	 * SECx	- (w308 * x308)	- (w308 * SECx * xAUTO)	- (w308 * SECx * xEUR)				,						
			"Base.FN_FNC",	w308	 * SECx	- (w308 * x308)	- (w308 * SECx * xAUTO)	- (w308 * SECx * xEUR)				,						
			"Base.WA2000",	w308	 * SECx	- (w308 * x308)	- (w308 * SECx * xBOLT)	- (w308 * SECx * xEUR)		- (w308 * SECx * SECxNON)		,						
			"Base.SVD",	w762x54r	 * SECx	- (w762x54r * x762x54r)	- (w762x54r * SECx * xSEMI)	- (w762x54r * SECx * xSOV)		- (w762x54r * SECx * SECxNON)		,						
			"Base.SVDK",	w762x54r	 * SECx	- (w762x54r * x762x54r)	- (w762x54r * SECx * xSEMI)	- (w762x54r * SECx * xSOV)		- (w762x54r * SECx * SECxNON)		,						
			"Base.M14EBR",	w308	 * SECx	- (w308 * x308)	- (w308 * SECx * xAUTO)	- (w308 * SECx * xUSA)			- (w308 * SECx * x90)	,						
			"Base.M14",	w308	 * SECx	- (w308 * x308)	- (w308 * SECx * xAUTO)	- (w308 * SECx * xUSA)		- (w308 * SECx * SECxNON)		,						
			"Base.K14",	w308	 * SECx	- (w308 * x308)	- (w308 * SECx * xBOLT)	- (w308 * SECx * xKOR)			- (w308 * SECx * x90)	,						
			"Base.Savage12",	w308	 * SECx	- (w308 * x308)	- (w308 * SECx * xBOLT)	- (w308 * SECx * xUSA)		- (w308 * SECx * SECxNON)		,						
			"Base.Ruger_No1_3006",	w3006	 * SECx	- (w3006 * x3006)	- (w3006 * SECx * xBREAK)	- (w3006 * SECx * xUSA)		- (w3006 * SECx * SECxNON)		,						
			"Base.M40",	w308	 * SECx	- (w308 * x308)	- (w308 * SECx * xBOLT)	- (w308 * SECx * xUSA)				,						
			"Base.M40A1",	w308	 * SECx	- (w308 * x308)	- (w308 * SECx * xBOLT)	- (w308 * SECx * xUSA)				,						
			"Base.M40A2",	w308	 * SECx	- (w308 * x308)	- (w308 * SECx * xBOLT)	- (w308 * SECx * xUSA)				,						
			"Base.M40A3",	w308	 * SECx	- (w308 * x308)	- (w308 * SECx * xBOLT)	- (w308 * SECx * xUSA)				,						
			"Base.Mosin",	w762x54r	 * SECx	- (w762x54r * x762x54r)	- (w762x54r * SECx * xBOLT)	- (w762x54r * SECx * xSOV)		- (w762x54r * SECx * SECxNON)		,						
			"Base.MosinObrez_Pistol",	w762x54r	 * SECx	- (w762x54r * x762x54r)	- (w762x54r * SECx * xBOLT)	- (w762x54r * SECx * xSOV)		- (w762x54r * SECx * SECxNON)		,						
			"Base.M1",	w3006	 * SECx	- (w3006 * x3006)	- (w3006 * SECx * xSEMI)	- (w3006 * SECx * xUSA)		- (w3006 * SECx * SECxNON)		,						
			"Base.M1903",	w3006	 * SECx	- (w3006 * x3006)	- (w3006 * SECx * xBOLT)	- (w3006 * SECx * xUSA)		- (w3006 * SECx * SECxNON)		,						
			"Base.BAR",	w3006	 * SECx	- (w3006 * x3006)	- (w3006 * SECx * xAUTO)	- (w3006 * SECx * xUSA)		- (w3006 * SECx * SECxNON)		,						
			"Base.BAR_Monitor",	w3006	 * SECx	- (w3006 * x3006)	- (w3006 * SECx * xAUTO)	- (w3006 * SECx * xUSA)		- (w3006 * SECx * SECxNON)		,						
			"Base.MAS36",	w308	 * SECx	- (w308 * x308)	- (w308 * SECx * xAUTO)	- (w308 * SECx * xEUR)		- (w308 * SECx * SECxNON)		,						
			"Base.MAS44",	w308	 * SECx	- (w308 * x308)	- (w308 * SECx * xAUTO)	- (w308 * SECx * xEUR)		- (w308 * SECx * SECxNON)		,						
			"Base.MAS49",	w308	 * SECx	- (w308 * x308)	- (w308 * SECx * xAUTO)	- (w308 * SECx * xEUR)		- (w308 * SECx * SECxNON)		,						
			"Base.Win_1895",	w308	 * SECx	- (w308 * x308)	- (w308 * SECx * xLEVER)	- (w308 * SECx * xUSA)		- (w308 * SECx * SECxNON)		,						
			"Base.Galil",	w308	 * SECx	- (w308 * x308)	- (w308 * SECx * xAUTO)	- (w308 * SECx * xISR)				,						
			"Base.Galil_Sniper",	w308	 * SECx	- (w308 * x308)	- (w308 * SECx * xAUTO)	- (w308 * SECx * xISR)				,						
			"Base.Thompson_Center_3006",	w3006	 * SECx	- (w3006 * x3006)	- (w3006 * SECx * xBREAK)	- (w3006 * SECx * xUSA)		- (w3006 * SECx * SECxNON)		,						
			"Base.Type38",	w308	 * SECx	- (w308 * x308)	- (w308 * SECx * xBOLT)	- (w308 * SECx * xPAC)		- (w308 * SECx * SECxNON)		,						
			"Base.Type99",	w308	 * SECx	- (w308 * x308)	- (w308 * SECx * xBOLT)	- (w308 * SECx * xPAC)		- (w308 * SECx * SECxNON)		,						
			"Base.L96",	w308	 * SECx	- (w308 * x308)	- (w308 * SECx * xBOLT)	- (w308 * SECx * xEUR)				,						
			"Base.M240",	w308	 * SECx	- (w308 * x308)	- (w308 * SECx * xLMG)	- (w308 * SECx * xUSA)	- (w308 * SECx * CIVxMIL)			,						
			"Base.G21LMG",	w308	 * SECx	- (w308 * x308)	- (w308 * SECx * xLMG)	- (w308 * SECx * xEUR)	- (w308 * SECx * CIVxMIL)		- (w308 * SECx * x90)	,						
			"Base.K12",	w308	 * SECx	- (w308 * x308)	- (w308 * SECx * xLMG)	- (w308 * SECx * xKOR)	- (w308 * SECx * CIVxMIL)		- (w308 * SECx * x90)	,						
			"Base.PKM",	w762x54r	 * SECx	- (w762x54r * x762x54r)	- (w762x54r * SECx * xLMG)	- (w762x54r * SECx * xSOV)	- (w762x54r * SECx * CIVxMIL)			,						
			"Base.MG42",	w308	 * SECx	- (w308 * x308)	- (w308 * SECx * xLMG)	- (w308 * SECx * xEUR)	- (w308 * SECx * CIVxMIL)			,						
			"Base.M60",	w308	 * SECx	- (w308 * x308)	- (w308 * SECx * xLMG)	- (w308 * SECx * xUSA)	- (w308 * SECx * CIVxMIL)			,						
			"Base.MK43",	w308	 * SECx	- (w308 * x308)	- (w308 * SECx * xLMG)	- (w308 * SECx * xUSA)	- (w308 * SECx * CIVxMIL)		- (w308 * SECx * x90)	,						
			"Base.RPD",	w762x39	 * SECx	- (w762x39 * x762x39)	- (w762x39 * SECx * xLMG)	- (w762x39 * SECx * xSOV)	- (w762x39 * SECx * CIVxMIL)			,						
			"Base.BOAR",	wBMG	 * SECx	- (wBMG * xBMG)	- (wBMG * SECx * xBREAK)	- (wBMG * SECx * xUSA)	- (wBMG * SECx * CIVxMIL)			,						
			"Base.EDM96",	wBMG	 * SECx	- (wBMG * xBMG)	- (wBMG * SECx * xBOLT)	- (wBMG * SECx * xUSA)	- (wBMG * SECx * CIVxMIL)		- (wBMG * SECx * x90)	,						
			"Base.M82",	wBMG	 * SECx	- (wBMG * xBMG)	- (wBMG * SECx * xSEMI)	- (wBMG * SECx * xUSA)	- (wBMG * SECx * CIVxMIL)			,						
			"Base.BFG50",	wBMG	 * SECx	- (wBMG * xBMG)	- (wBMG * SECx * xBREAK)	- (wBMG * SECx * xUSA)	- (wBMG * SECx * CIVxMIL)		- (wBMG * SECx * x90)	,						
			"Base.Harris50",	wBMG	 * SECx	- (wBMG * xBMG)	- (wBMG * SECx * xBOLT)	- (wBMG * SECx * xUSA)	- (wBMG * SECx * CIVxMIL)			,						
			"Base.TAC50",	wBMG	 * SECx	- (wBMG * xBMG)	- (wBMG * SECx * xBOLT)	- (wBMG * SECx * xUSA)	- (wBMG * SECx * CIVxMIL)			,						
			"Base.Ash",	wBMG	 * SECx	- (wBMG * xBMG)	- (wBMG * SECx * xAUTO)	- (wBMG * SECx * xSOV)	- (wBMG * SECx * CIVxMIL)		- (wBMG * SECx * x90)	,						
			"Base.SW_M500",	wBMG	 * SECx	- (wBMG * xBMG)	- (wBMG * SECx * xREV)	- (wBMG * SECx * xUSA)	- (wBMG * SECx * CIVxMIL)		- (wBMG * SECx * x90)	,						
			"Base.SPAS12_Fixed",	w12g	 * SECx	- (w12g * x12g)	- (w12g * SECx * xSEMI)	- (w12g * SECx * xEUR)				,						
			"Base.SPAS12_Fold",	w12g	 * SECx	- (w12g * x12g)	- (w12g * SECx * xSEMI)	- (w12g * SECx * xEUR)				,						
			"Base.Origin",	w12g	 * SECx	- (w12g * x12g)	- (w12g * SECx * xSEMI)	- (w12g * SECx * xUSA)			- (w12g * SECx * x90)	,						
			"Base.SPAS_15",	w12g	 * SECx	- (w12g * x12g)	- (w12g * SECx * xSEMI)	- (w12g * SECx * xEUR)				,						
			"Base.USAS_12",	w12g	 * SECx	- (w12g * x12g)	- (w12g * SECx * xAUTO)	- (w12g * SECx * xKOR)				,						
			"Base.Shorty_Pistol",	w12g	 * SECx	- (w12g * x12g)	- (w12g * SECx * xPUMP)	- (w12g * SECx * xUSA)		- (w12g * SECx * SECxNON)	- (w12g * SECx * x90)	,						
			"Base.R11_87",	w12g	 * SECx	- (w12g * x12g)	- (w12g * SECx * xSEMI)	- (w12g * SECx * xUSA)		- (w12g * SECx * SECxNON)		,						
			"Base.M870",	w12g	 * SECx	- (w12g * x12g)	- (w12g * SECx * xPUMP)	- (w12g * SECx * xUSA)				,						
			"Base.M1897",	w12g	 * SECx	- (w12g * x12g)	- (w12g * SECx * xPUMP)	- (w12g * SECx * xUSA)		- (w12g * SECx * SECxNON)		,						
			"Base.DT11",	w12g	 * SECx	- (w12g * x12g)	- (w12g * SECx * xBREAK)	- (w12g * SECx * xEUR)		- (w12g * SECx * SECxNON)		,						
			"Base.Coachgun",	w12g	 * SECx	- (w12g * x12g)	- (w12g * SECx * xBREAK)	- (w12g * SECx * xUSA)		- (w12g * SECx * SECxNON)		,						
			"Base.Terminator",	w12g	 * SECx	- (w12g * x12g)	- (w12g * SECx * xBREAK)	- (w12g * SECx * xUSA)		- (w12g * SECx * SECxNON)		,						
			"Base.SIX12",	w12g	 * SECx	- (w12g * x12g)	- (w12g * SECx * xREV)	- (w12g * SECx * xUSA)			- (w12g * SECx * x90)	,						
			"Base.SIX12SD",	w12g	 * SECx	- (w12g * x12g)	- (w12g * SECx * xREV)	- (w12g * SECx * xUSA)	- (w12g * SECx * CIVxMIL)		- (w12g * SECx * x90)	,						
			"Base.M870_Wingmaster",	w12g	 * SECx	- (w12g * x12g)	- (w12g * SECx * xPUMP)	- (w12g * SECx * xUSA)		- (w12g * SECx * SECxNON)		,						
			"Base.M870_Police",	w12g	 * SECx	- (w12g * x12g)	- (w12g * SECx * xPUMP)	- (w12g * SECx * xUSA)				,						
			"Base.M870_MCS",	w12g	 * SECx	- (w12g * x12g)	- (w12g * SECx * xPUMP)	- (w12g * SECx * xUSA)				,						
			"Base.M870_CQB",	w12g	 * SECx	- (w12g * x12g)	- (w12g * SECx * xPUMP)	- (w12g * SECx * xUSA)				,						
			"Base.M870_Breaching_Pistol",	w12g	 * SECx	- (w12g * x12g)	- (w12g * SECx * xPUMP)	- (w12g * SECx * xUSA)				,						
			"Base.M870_Express",	w12g	 * SECx	- (w12g * x12g)	- (w12g * SECx * xPUMP)	- (w12g * SECx * xUSA)				,						
			"Base.A400",	w12g	 * SECx	- (w12g * x12g)	- (w12g * SECx * xSEMI)	- (w12g * SECx * xEUR)			- (w12g * SECx * x90)	,						
			"Base.M1014",	w12g	 * SECx	- (w12g * x12g)	- (w12g * SECx * xSEMI)	- (w12g * SECx * xEUR)			- (w12g * SECx * x90)	,						
			"Base.M1014_Fold",	w12g	 * SECx	- (w12g * x12g)	- (w12g * SECx * xSEMI)	- (w12g * SECx * xEUR)			- (w12g * SECx * x90)	,						
			"Base.M1014_Wick",	w12g	 * SECx	- (w12g * x12g)	- (w12g * SECx * xSEMI)	- (w12g * SECx * xEUR)			- (w12g * SECx * x90)	,						
			"Base.DAO12",	w12g	 * SECx	- (w12g * x12g)	- (w12g * SECx * xREV)	- (w12g * SECx * xREST)				,						
			"Base.M1887",	w12g	 * SECx	- (w12g * x12g)	- (w12g * SECx * xLEVER)	- (w12g * SECx * xUSA)				,						
			"Base.M1208",	w12g	 * SECx	- (w12g * x12g)	- (w12g * SECx * xREV)	- (w12g * SECx * xUSA)		- (w12g * SECx * SECxNON)	- (w12g * SECx * x90)	,						
			"Base.M1212",	w12g	 * SECx	- (w12g * x12g)	- (w12g * SECx * xREV)	- (w12g * SECx * xUSA)			- (w12g * SECx * x90)	,						
			"Base.M1216",	w12g	 * SECx	- (w12g * x12g)	- (w12g * SECx * xREV)	- (w12g * SECx * xUSA)			- (w12g * SECx * x90)	,						
			"Base.AA12",	w12g	 * SECx	- (w12g * x12g)	- (w12g * SECx * xAUTO)	- (w12g * SECx * xUSA)			- (w12g * SECx * x90)	,						
			"Base.CAWS",	w12g	 * SECx	- (w12g * x12g)	- (w12g * SECx * xAUTO)	- (w12g * SECx * xEUR)				,						
			"Base.ROYAL_SXS",	w10g	 * SECx	- (w10g * x10g)	- (w10g * SECx * xBREAK)	- (w10g * SECx * xEUR)		- (w10g * SECx * SECxNON)		,						
			"Base.KS23",	w4g	 * SECx	- (w4g * x4g)	- (w4g * SECx * xPUMP)	- (w4g * SECx * xSOV)		- (w4g * SECx * SECxNON)		,						
			"Base.KS23_S_Pistol",	w4g	 * SECx	- (w4g * x4g)	- (w4g * SECx * xPUMP)	- (w4g * SECx * xSOV)		- (w4g * SECx * SECxNON)		,						
			"Base.Triple_Crown",	w12g	 * SECx	- (w12g * x12g)	- (w12g * SECx * xBREAK)	- (w12g * SECx * xEUR)		- (w12g * SECx * SECxNON)		,						
			"Base.Moss500_20",	w20g	 * SECx	- (w20g * x20g)	- (w20g * SECx * xPUMP)	- (w20g * SECx * xUSA)		- (w20g * SECx * SECxNON)		,						
			"Base.10855_Silver",	w20g	 * SECx	- (w20g * x20g)	- (w20g * SECx * xSEMI)	- (w20g * SECx * xEUR)		- (w20g * SECx * SECxNON)		,						
			"Base.Colt1855",	w20g	 * SECx	- (w20g * x20g)	- (w20g * SECx * xREV)	- (w20g * SECx * xUSA)		- (w20g * SECx * SECxNON)		,						
			"Base.TOZ106",	w20g	 * SECx	- (w20g * x20g)	- (w20g * SECx * xBOLT)	- (w20g * SECx * xSOV)		- (w20g * SECx * SECxNON)		,						
			"Base.TOZ194_Pistol",	w12g	 * SECx	- (w12g * x12g)	- (w12g * SECx * xPUMP)	- (w12g * SECx * xSOV)				,						
			"Base.Saiga12_Tromix",	w12g	 * SECx	- (w12g * x12g)	- (w12g * SECx * xAUTO)	- (w12g * SECx * xSOV)			- (w12g * SECx * x90)	,						
			"Base.MP133",	w12g	 * SECx	- (w12g * x12g)	- (w12g * SECx * xPUMP)	- (w12g * SECx * xSOV)			- (w12g * SECx * x90)	,						
			"Base.MP133S_Pistol",	w12g	 * SECx	- (w12g * x12g)	- (w12g * SECx * xPUMP)	- (w12g * SECx * xSOV)			- (w12g * SECx * x90)	,						
			"Base.KSG",	w12g	 * SECx	- (w12g * x12g)	- (w12g * SECx * xPUMP)	- (w12g * SECx * xUSA)			- (w12g * SECx * x90)	,						
			"Base.KSG25",	w12g	 * SECx	- (w12g * x12g)	- (w12g * SECx * xPUMP)	- (w12g * SECx * xUSA)			- (w12g * SECx * x90)	,						
			"Base.UTS15",	w12g	 * SECx	- (w12g * x12g)	- (w12g * SECx * xPUMP)	- (w12g * SECx * xREST)			- (w12g * SECx * x90)	,						
			"Base.EX41_HE",	wGREN	 * SECx		- (wGREN * SECx * xGREN)	- (wGREN * SECx * xUSA)	- (wGREN * SECx * CIVxMIL)			,						
			"Base.Federal_HE",	wGREN	 * SECx		- (wGREN * SECx * xGREN)	- (wGREN * SECx * xUSA)	- (wGREN * SECx * CIVxMIL)			,						
			"Base.M32_HE",	wGREN	 * SECx		- (wGREN * SECx * xGREN)	- (wGREN * SECx * xUSA)	- (wGREN * SECx * CIVxMIL)			,						
			"Base.GM94_HE",	wGREN	 * SECx		- (wGREN * SECx * xGREN)	- (wGREN * SECx * xSOV)	- (wGREN * SECx * CIVxMIL)		- (wGREN * SECx * x90)	,						
			"Base.K11",	wGREN	 * SECx	- (wGREN * SECx * xAUTO)	- (wGREN * SECx * xGREN)	- (wGREN * SECx * xKOR)	- (wGREN * SECx * CIVxMIL)		- (wGREN * SECx * x90)	,						
			"Base.XM214",	w556	 * SECx	- (w556 * x556)	- (w556 * SECx * xMINI)	- (w556 * SECx * xUSA)	- (w556 * SECx * CIVxMIL)			,						
			"Base.GAU17",	w308	 * SECx	- (w308 * x308)	- (w308 * SECx * xMINI)	- (w308 * SECx * xUSA)	- (w308 * SECx * CIVxMIL)			,						
			"Base.GAU19",	wBMG	 * SECx	- (wBMG * xBMG)	- (wBMG * SECx * xMINI)	- (wBMG * SECx * xUSA)	- (wBMG * SECx * CIVxMIL)			,						
			"Base.TAC15",	wBOW	 * SECx		- (wBOW * SECx * xBOW)	- (wBOW * SECx * xUSA)		- (wBOW * SECx * SECxNON)	- (wBOW * SECx * x90)	,						
			"Base.M2A1",	wFLAME	 * SECx		- (wFLAME * SECx * xFLAME)	- (wFLAME * SECx * xUSA)	- (wFLAME * SECx * CIVxMIL)	- (wFLAME * SECx * SECxNON)		,						
			"Base.Musk",	wFLAME	 * SECx		- (wFLAME * SECx * xFLAME)	- (wFLAME * SECx * xUSA)		- (wFLAME * SECx * SECxNON)	- (wFLAME * SECx * x90)	,						
			"Base.Launcher",	wGREN		- (wGREN * xGREN)			- (wGREN * CIVxMIL)			,						
			"Base.Bipod",	Part		- (Part * xPart)				- (Part * SECxNON)		,						
			"Base.Ammobelt",	Part		- (Part * xPart)						,						
			"Base.Sling_1",	Part		- (Part * xPart)						,						
			"Base.Sling_2",	Part		- (Part * xPart)						,						
			"Base.Sling_3",	Part		- (Part * xPart)						,						
			"Base.ForeGrip",	Part		- (Part * xPart)						,						
			"Base.Grip_Magpul",	Part		- (Part * xPart)					- (Part * x90)	,						
			"Base.Grip_MLOK",	Part		- (Part * xPart)					- (Part * x90)	,						
			"Base.Grip_TG",	Part		- (Part * xPart)					- (Part * x90)	,						
			"Base.Light_Small",	Light		- (Light * xLight)						,						
			"Base.Light_Large",	Light		- (Light * xLight)						,						
			"Base.Laser_Green",	Light		- (Light * xLight)						,						
			"Base.Laser_Red",	Light		- (Light * xLight)						,						
			"Base.Laser_DVAL",	Light		- (Light * xLight)						,						
			"Base.Laser_PEQ15",	Light		- (Light * xLight)			- (Light * CIVxMIL)			,						
			"Base.Suppressor_Pistol",	Suppress		- (Suppress * xSuppress)						,						
			"Base.Suppressor_Rifle",	Suppress		- (Suppress * xSuppress)						,						
			"Base.Suppressor_Shotgun",	Suppress		- (Suppress * xSuppress)						,						
			"Base.Suppressor_BMG",	Suppress		- (Suppress * xSuppress)	- (wBMG * xBMG)		- (Suppress * CIVxMIL)			,						
			"Base.Bayonet_M4",	Part		- (Part * xPart)				- (Part * SECxNON)		,						
			"Base.Bayonet_AK",	Part		- (Part * xPart)		- (Part * xSOV)		- (Part * SECxNON)		,						
			"Base.Bayonet_M1917",	Part		- (Part * xPart)				- (Part * SECxNON)		,						
			"Base.Choke_Full",	Part		- (Part * xPart)				- (Part * SECxNON)		,						
			"Base.Choke_Full_Dbl",	Part		- (Part * xPart)				- (Part * SECxNON)		,						
			"Base.Compensator",	Part		- (Part * xPart)						,						
			"Base.MuzzleBrake",	Part		- (Part * xPart)						,						
			"Base.Pad",	Part		- (Part * xPart)				- (Part * SECxNON)		,						
			"Base.Carrier_12g",	Part		- (Part * xPart)						,						
			"Base.GhostRing",	Optic		- (Optic * xOptic)						,						
			"Base.Sight_MicroDot",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * x90)	,						
			"Base.Sight_RaceDot",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				,						
			"Base.Sight_SRS",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * x90)	,						
			"Base.Sight_EOTech",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				,						
			"Base.Sight_3xEOTech",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				,						
			"Base.Sight_4xACOG",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				,						
			"Base.Sight_6xELCAN",	Optic		- (Optic * xOptic)		- (Optic * xEUR)				,						
			"Base.Sight_KOBRA",	Optic		- (Optic * xOptic)		- (Optic * xSOV)				,						
			"Base.Scope_4xPSO",	Optic		- (Optic * xOptic)		- (Optic * xSOV)				,						
			"Base.Scope_12xPSO",	Optic		- (Optic * xOptic)		- (Optic * xSOV)				,						
			"Base.Scope_1-4x",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				,						
			"Base.Scope_20x",	Optic		- (Optic * xOptic)		- (Optic * xUSA)		- (Optic * SECxNON)		,						
			"Base.Sight_Thermal",	Optic		- (Optic * xOptic)		- (Optic * xUSA)	- (Optic * CIVxMIL)			,						
			"Base.Sight_Thermal_AK",	Optic		- (Optic * xOptic)		- (Optic * xSOV)	- (Optic * CIVxMIL)			,						
			"Base.Sight_Aimpoint",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				,						
			"Base.Sight_Aimpoint_Dot",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				,						
			"Base.Sight_Fiber_Shotgun",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				,						
			"Base.Sight_Mepro_M21",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * x90)	,						
			"Base.Sight_Mepro_MOR",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * x90)	,						
			"Base.Sight_UH1",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * x90)	,						
			"Base.Sight_C79",	Optic		- (Optic * xOptic)		- (Optic * xEUR)				,						
			"Base.Sight_SUSAT",	Optic		- (Optic * xOptic)		- (Optic * xEUR)				,						
			"Base.Sight_Raven",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				,						
			"Base.Sight_G28_Scope",	Optic		- (Optic * xOptic)		- (Optic * xEUR)	- (Optic * CIVxMIL)	- (Optic * SECxNON)		,						
			"Base.Sight_ACRO",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * x90)	,						
			"Base.Sight_MRO",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * x90)	,						
			"Base.Sight_SRO",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * x90)	,						
			"Base.Sight_Nikon",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				,						
			"Base.Sight_M8",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				,						
			"Base.Sight_VX3",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				,						
			"Base.Sight_1P63",	Optic		- (Optic * xOptic)		- (Optic * xSOV)				,						
			"Base.Sight_Brownells",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				,						
			"Base.Sight_L2",	Optic		- (Optic * xOptic)		- (Optic * xEUR)				,						
			"Base.Sight_Malcom",	Optic		- (Optic * xOptic)		- (Optic * xUSA)		- (Optic * SECxNON)		,						
			"Base.Sight_LUX",	Optic		- (Optic * xOptic)		- (Optic * xUSA)		- (Optic * SECxNON)		,						
			"Base.Sight_NO32",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				,						
			"Base.Sight_PKAS",	Optic		- (Optic * xOptic)		- (Optic * xSOV)				,						
			"Base.Sight_PU",	Optic		- (Optic * xOptic)		- (Optic * xSOV)		- (Optic * SECxNON)		,						
			"Base.Sight_XPS",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * x90)	,						
			"Base.Sight_PVS4",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				,						
			"Base.Barrel_308",	w308		- (w308 * x308)	- (w308 * xBREAK)	- (w308 * xUSA)		- (w308 * SECxNON)		,						
			"Base.Barrel_3006",	w3006		- (w3006 * x3006)	- (w3006 * xBREAK)	- (w3006 * xUSA)		- (w3006 * SECxNON)		,						
			"Base.Barrel_4570",	w4570		- (w4570 * x4570)	- (w4570 * xBREAK)	- (w4570 * xUSA)		- (w4570 * SECxNON)		,						
			"Base.Barrel_357",	w357		- (w357 * x357)	- (w357 * xBREAK)	- (w357 * xUSA)		- (w357 * SECxNON)		,						
			"Base.Barrel_357_Short",	w357		- (w357 * x357)	- (w357 * xBREAK)	- (w357 * xUSA)		- (w357 * SECxNON)		,						
			"Base.Barrel_45LC",	w45LC		- (w45LC * x45LC)	- (w45LC * xBREAK)	- (w45LC * xUSA)		- (w45LC * SECxNON)		,						
			"Base.Barrel_45LC_Short",	w45LC		- (w45LC * x45LC)	- (w45LC * xBREAK)	- (w45LC * xUSA)		- (w45LC * SECxNON)		,						
			"Base.38Speed",	StdMag	* w357	- (w357 * x357)	- (StdMag * xREV)			- (StdMag* w357 * SECxNON)		,						
			"Base.44Speed",	StdMag	* w44	- (w44 * x44)	- (StdMag * xREV)			- (StdMag* w44 * SECxNON)		,						
			"Base.SRM1208_Cylinder",	StdMag	* w12g	- (w12g * x12g)	- (StdMag * xREV)	- (StdMag * xUSA)		- (StdMag* w12g * SECxNON)	- (StdMag* w12g * x90)	,						
			"Base.SRM1212_Cylinder",	StdMag	* w12g	- (w12g * x12g)	- (StdMag * xREV)	- (StdMag * xUSA)			- (StdMag* w12g * x90)	,						
			"Base.SRM1216_Cylinder",	StdMag	* w12g	- (w12g * x12g)	- (StdMag * xREV)	- (StdMag * xUSA)			- (StdMag* w12g * x90)	,						
			"Base.SIX12_Cylinder",	StdMag	* w12g	- (w12g * x12g)	- (StdMag * xREV)	- (StdMag * xUSA)			- (StdMag* w12g * x90)	,						
			"Base.CP33Clip",	StdMag	* w22	- (w22 * x22)		- (StdMag * xUSA)		- (StdMag* w22 * SECxNON)	- (StdMag* w22 * x90)	,						
			"Base.CP33_17MagBase",	ExtMag	* w22	- (w22 * x22)		- (ExtMag * xUSA)		- (ExtMag* w22 * SECxNON)	- (ExtMag* w22 * x90)	,						
			"Base.22Clip",	StdMag	* w22	- (w22 * x22)				- (StdMag* w22 * SECxNON)		,						
			"Base.22ExtClip",	ExtMag	* w22	- (w22 * x22)				- (ExtMag* w22 * SECxNON)		,						
			"Base.380Clip",	StdMag	* w380	- (w380 * x380)				- (StdMag* w380 * SECxNON)		,						
			"Base.380ExtClip",	ExtMag	* w380	- (w380 * x380)				- (ExtMag* w380 * SECxNON)		,						
			"Base.9mmClip",	StdMag	* w9	- (w9 * x9)						,						
			"Base.9mmExtClip",	ExtMag	* w9	- (w9 * x9)						,						
			"Base.45DSClip",	StdMag	* w45	- (w45 * x45)						,						
			"Base.45DSExtClip",	ExtMag	* w45	- (w45 * x45)						,						
			"Base.45Clip",	StdMag	* w45	- (w45 * x45)						,						
			"Base.45ExtClip",	ExtMag	* w45	- (w45 * x45)						,						
			"Base.44Clip",	StdMag	* w44	- (w44 * x44)				- (StdMag* w44 * SECxNON)		,						
			"Base.223StdClip",	StdMag	* w223	- (w223 * x223)				- (StdMag* w223 * SECxNON)		,						
			"Base.223ExtClip",	ExtMag	* w223	- (w223 * x223)				- (ExtMag* w223 * SECxNON)		,						
			"Base.556Clip",	StdMag	* w556	- (w556 * x556)						,						
			"Base.308StdClip",	StdMag	* w308	- (w308 * x308)						,						
			"Base.308ExtClip",	ExtMag	* w308	- (w308 * x308)						,						
			"Base.3006ExtClip",	ExtMag	* w3006	- (w3006 * x3006)		- (ExtMag * xUSA)				,						
			"Base.SVDClip",	StdMag	* w762x54r	- (w762x54r * x762x54r)		- (StdMag * xSOV)		- (StdMag* w762x54r * SECxNON)		,						
			"Base.ASHClip",	StdMag	* wBMG	- (wBMG * xBMG)		- (StdMag * xSOV)		- (StdMag* wBMG * SECxNON)	- (StdMag* wBMG * x90)	,						
			"Base.M82Clip",	StdMag	* wBMG	- (wBMG * xBMG)		- (StdMag * xUSA)	- (StdMag* wBMG * CIVxMIL)	- (StdMag* wBMG * SECxNON)		,						
			"Base.M1Clip",	StdMag	* w3006	- (w3006 * x3006)		- (StdMag * xUSA)		- (StdMag* w3006 * SECxNON)		,						
			"Base.SKSClip",	StdMag	* w762x39	- (w762x39 * x762x39)		- (StdMag * xSOV)		- (StdMag* w762x39 * SECxNON)		,						
			"Base.1903Clip",	StdMag	* w308	- (w308 * x308)				- (StdMag* w308 * SECxNON)		,						
			"Base.545StdClip",	StdMag	* w545x39	- (w545x39 * x545x39)		- (StdMag * xSOV)				,						
			"Base.AKClip",	StdMag	* w762x39	- (w762x39 * x762x39)						,						
			"Base.ASVALClip",	ExtMag	* w9	- (w9 * x9)		- (ExtMag * xSOV)		- (ExtMag* w9 * SECxNON)		,						
			"Base.VSSClip",	StdMag	* w9	- (w9 * x9)		- (StdMag * xSOV)		- (StdMag* w9 * SECxNON)		,						
			"Base.57Clip",	StdMag	* w57	- (w57 * x57)		- (StdMag * xEUR)			- (StdMag* w57 * x90)	,						
			"Base.P90Clip",	StdMag	* w57	- (w57 * x57)		- (StdMag * xEUR)			- (StdMag* w57 * x90)	,						
			"Base.22Drum",	DrumMag	* w22	- (w22 * x22)				- (DrumMag* w22 * SECxNON)		,						
			"Base.9mmDrum",	DrumMag	* w9	- (w9 * x9)						,						
			"Base.45Drum",	DrumMag	* w45	- (w45 * x45)						,						
			"Base.556Drum",	DrumMag	* w556	- (w556 * x556)						,						
			"Base.545Drum",	DrumMag	* w545x39	- (w545x39 * x545x39)		- (DrumMag * xSOV)				,						
			"Base.762Drum",	DrumMag	* w762x39	- (w762x39 * x762x39)						,						
			"Base.12gDrum",	DrumMag	* w12g	- (w12g * x12g)						,						
			"Base.308Belt",	StdMag	* w308	- (w308 * x308)	- (wLMG * xLMG)		- (StdMag* w308 * CIVxMIL)			,						
			"Base.556Belt",	StdMag	* w556	- (w556 * x556)	- (wLMG * xLMG)		- (StdMag* w556 * CIVxMIL)			,						
			"Base.762x39Belt",	StdMag	* w762x39	- (w762x39 * x762x39)	- (wLMG * xLMG)		- (StdMag* w762x39 * CIVxMIL)			,						
			"Base.762x54rBelt",	StdMag	* w762x54r	- (w762x54r * x762x54r)	- (wLMG * xLMG)	- (StdMag * xSOV)	- (StdMag* w762x54r * CIVxMIL)			,						
			"Base.556MiniCan",	StdMag	* w556	- (w556 * x556)	- (wMINI * xMINI)	- (StdMag * xUSA)	- (StdMag* w556 * CIVxMIL)			,						
			"Base.308MiniCan",	StdMag	* w308	- (w308 * x308)	- (wMINI * xMINI)	- (StdMag * xUSA)	- (StdMag* w308 * CIVxMIL)			,						
			"Base.50MiniCan",	StdMag	* wBMG	- (wBMG * xBMG)	- (wMINI * xMINI)	- (StdMag * xUSA)	- (StdMag* wBMG * CIVxMIL)			,						
			"Base.M2A1_Tank",	ExtMag	* wFLAME	- (wFLAME * xFLAME)		- (ExtMag * xUSA)	- (ExtMag* wFLAME * CIVxMIL)			,						
			"Base.M2A1_Can",	StdMag	* wFLAME	- (wFLAME * xFLAME)		- (StdMag * xUSA)	- (StdMag* wFLAME * CIVxMIL)			,						
			"Base.RussianMachete",	LgKnife		- (LgKnife * xLgKnife)		- (LgKnife * xSOV)		- (LgKnife * SECxNON)		,						
			"Base.BGMachete",	LgKnife		- (LgKnife * xLgKnife)		- (LgKnife * xUSA)		- (LgKnife * SECxNON)		,						
			"Base.RamboKnife",	LgKnife		- (LgKnife * xLgKnife)		- (LgKnife * xUSA)				,						
			"Base.Butterfly",	SmKnife		- (SmKnife * xSmKnife)		- (SmKnife * xPAC)				,						
			"Base.PushDagger",	SmKnife		- (SmKnife * xSmKnife)		- (SmKnife * xUSA)				,						
			"Base.Karambit",	SmKnife		- (SmKnife * xSmKnife)		- (SmKnife * xPAC)				,						
			"Base.Tactical_Axe",	Axe		- (Axe * xAxe)		- (Axe * xUSA)		- (Axe * SECxNON)		,						
			"Base.Tactical_Sickle",	Axe		- (Axe * xAxe)		- (Axe * xUSA)		- (Axe * SECxNON)		,						
			"Base.DingDong",	Blunt		- (Blunt * xBlunt)		- (Blunt * xUSA)		- (Blunt * SECxNON)		,						
			"Base.MilitaryBaton",	Blunt		- (Blunt * xBlunt)		- (Blunt * xUSA)	- (Blunt * CIVxMIL)			,						
			"Base.KillBill",	Sword		- (Sword * xSword)		- (Sword * xPAC)		- (Sword * SECxNON)		,						
			"Base.CH_WarSword",	Sword		- (Sword * xSword)		- (Sword * xPAC)		- (Sword * SECxNON)		,						
			"Base.Conan_Sword",	Sword		- (Sword * xSword)		- (Sword * xUSA)		- (Sword * SECxNON)		,						
			"Base.AmmoCan30_22",	AmmoCan		* w22	- (w22 * x22)			- (AmmoCan * SECxNON)		,						
			"Base.AmmoCan30_380",	AmmoCan		* w380	- (w380 * x380)			- (AmmoCan * SECxNON)		,						
			"Base.AmmoCan30_57",	AmmoCan		* w57	- (w57 * x57)				- (AmmoCan * x90)	,						
			"Base.AmmoCan30_9",	AmmoCan		* w9	- (w9 * x9)					,						
			"Base.AmmoCan30_38",	AmmoCan		* w357	- (w357 * x357)			- (AmmoCan * SECxNON)		,						
			"Base.AmmoCan30_357",	AmmoCan		* w357	- (w357 * x357)			- (AmmoCan * SECxNON)		,						
			"Base.AmmoCan30_45",	AmmoCan		* w45	- (w45 * x45)					,						
			"Base.AmmoCan30_44",	AmmoCan		* w44	- (w44 * x44)			- (AmmoCan * SECxNON)		,						
			"Base.AmmoCan30_45LC",	AmmoCan		* w45LC	- (w45LC * x45LC)			- (AmmoCan * SECxNON)		,						
			"Base.AmmoCan30_4570",	AmmoCan		* w4570	- (w4570 * x4570)			- (AmmoCan * SECxNON)		,						
			"Base.AmmoCan30_50MAG",	AmmoCan		* wBMG	- (wBMG * xBMG)			- (AmmoCan * SECxNON)	- (AmmoCan * x90)	,						
			"Base.AmmoCan50_223",	AmmoCan		* w223	- (w223 * x223)			- (AmmoCan * SECxNON)		,						
			"Base.AmmoCan50_556",	AmmoCan		* w556	- (w556 * x556)					,						
			"Base.AmmoCan50_762x39",	AmmoCan		* w762x39	- (w762x39 * x762x39)					,						
			"Base.AmmoCan50_545x39",	AmmoCan		* w545x39	- (w545x39 * x545x39)					,						
			"Base.AmmoCan50_762x54r",	AmmoCan		* w762x54r	- (w762x54r * x762x54r)			- (AmmoCan * SECxNON)		,						
			"Base.AmmoCan50_308",	AmmoCan		* w308	- (w308 * x308)					,						
			"Base.AmmoCan50_3006",	AmmoCan		* w3006	- (w3006 * x3006)			- (AmmoCan * SECxNON)		,						
			"Base.AmmoCan50_410",	AmmoCan		* w45LC	- (w45LC * x45LC)			- (AmmoCan * SECxNON)		,						
			"Base.AmmoCan50_20",	AmmoCan		* w20g	- (w20g * x20g)			- (AmmoCan * SECxNON)		,						
			"Base.AmmoCan50_12",	AmmoCan		* w12g	- (w12g * x12g)		- (AmmoCan * CIVxMIL)			,						
			"Base.AmmoCan50_10",	AmmoCan		* w10g	- (w10g * x10g)			- (AmmoCan * SECxNON)		,						
			"Base.AmmoCan50_4",	AmmoCan		* w4g	- (w4g * x4g)			- (AmmoCan * SECxNON)		,						
			"Base.AmmoCan50_50",	AmmoCan		* wBMG	- (wBMG * xBMG)		- (AmmoCan * CIVxMIL)			,						
			"Base.AmmoCan50_HE",	AmmoCan		* wGREN	- (wGREN * xGREN)		- (AmmoCan * CIVxMIL)			,						
			"Base.AmmoCan50_INC",	AmmoCan		* wGREN	- (wGREN * xGREN)		- (AmmoCan * CIVxMIL)			,						
		},																
		dontSpawnAmmo = 		 SECammo	,													
	},																	
																		
	SecurityAmmo = {																	
		rolls =	SECRollAMMO	,														
		items = {																
			"Base.AmmoCan30_22",	AmmoCan		* w22	- (w22 * x22)			- (AmmoCan * SECxNON)		,						
			"Base.AmmoCan30_380",	AmmoCan		* w380	- (w380 * x380)			- (AmmoCan * SECxNON)		,						
			"Base.AmmoCan30_57",	AmmoCan		* w57	- (w57 * x57)				- (AmmoCan * x90)	,						
			"Base.AmmoCan30_9",	AmmoCan		* w9	- (w9 * x9)					,						
			"Base.AmmoCan30_38",	AmmoCan		* w357	- (w357 * x357)			- (AmmoCan * SECxNON)		,						
			"Base.AmmoCan30_357",	AmmoCan		* w357	- (w357 * x357)			- (AmmoCan * SECxNON)		,						
			"Base.AmmoCan30_45",	AmmoCan		* w45	- (w45 * x45)					,						
			"Base.AmmoCan30_44",	AmmoCan		* w44	- (w44 * x44)			- (AmmoCan * SECxNON)		,						
			"Base.AmmoCan30_45LC",	AmmoCan		* w45LC	- (w45LC * x45LC)			- (AmmoCan * SECxNON)		,						
			"Base.AmmoCan30_4570",	AmmoCan		* w4570	- (w4570 * x4570)			- (AmmoCan * SECxNON)		,						
			"Base.AmmoCan30_50MAG",	AmmoCan		* wBMG	- (wBMG * xBMG)			- (AmmoCan * SECxNON)	- (AmmoCan * x90)	,						
			"Base.AmmoCan50_223",	AmmoCan		* w223	- (w223 * x223)			- (AmmoCan * SECxNON)		,						
			"Base.AmmoCan50_556",	AmmoCan		* w556	- (w556 * x556)					,						
			"Base.AmmoCan50_762x39",	AmmoCan		* w762x39	- (w762x39 * x762x39)					,						
			"Base.AmmoCan50_545x39",	AmmoCan		* w545x39	- (w545x39 * x545x39)					,						
			"Base.AmmoCan50_762x54r",	AmmoCan		* w762x54r	- (w762x54r * x762x54r)			- (AmmoCan * SECxNON)		,						
			"Base.AmmoCan50_308",	AmmoCan		* w308	- (w308 * x308)					,						
			"Base.AmmoCan50_3006",	AmmoCan		* w3006	- (w3006 * x3006)			- (AmmoCan * SECxNON)		,						
			"Base.AmmoCan50_410",	AmmoCan		* w45LC	- (w45LC * x45LC)			- (AmmoCan * SECxNON)		,						
			"Base.AmmoCan50_20",	AmmoCan		* w20g	- (w20g * x20g)			- (AmmoCan * SECxNON)		,						
			"Base.AmmoCan50_12",	AmmoCan		* w12g	- (w12g * x12g)		- (AmmoCan * CIVxMIL)			,						
			"Base.AmmoCan50_10",	AmmoCan		* w10g	- (w10g * x10g)			- (AmmoCan * SECxNON)		,						
			"Base.AmmoCan50_4",	AmmoCan		* w4g	- (w4g * x4g)			- (AmmoCan * SECxNON)		,						
			"Base.AmmoCan50_50",	AmmoCan		* wBMG	- (wBMG * xBMG)		- (AmmoCan * CIVxMIL)			,						
			"Base.AmmoCan50_HE",	AmmoCan		* wGREN	- (wGREN * xGREN)		- (AmmoCan * CIVxMIL)			,						
			"Base.AmmoCan50_HE",	AmmoCan		* wGREN	- (wGREN * xGREN)		- (AmmoCan * CIVxMIL)			,						
			"Base.AmmoCan50_INC",	AmmoCan		* wGREN	- (wGREN * xGREN)		- (AmmoCan * CIVxMIL)			,						
			"Base.AmmoCan50_INC",	AmmoCan		* wGREN	- (wGREN * xGREN)		- (AmmoCan * CIVxMIL)			,						
			"Base.BB177Box",	AmmoBox		* wBB	- (wBB * xBB)			- (AmmoBox * SECxNON)		,						
			"Base.Bullets22Box",	AmmoBox		* w22	- (w22 * x22)			- (AmmoBox * SECxNON)		,						
			"Base.Bullets380Box",	AmmoBox		* w380	- (w380 * x380)			- (AmmoBox * SECxNON)		,						
			"Base.Bullets57Box",	AmmoBox		* w57	- (w57 * x57)				- (AmmoBox * x90)	,						
			"Base.Bullets9mmBox",	AmmoBox		* w9	- (w9 * x9)					,						
			"Base.Bullets38Box",	AmmoBox		* w357	- (w357 * x357)			- (AmmoBox * SECxNON)		,						
			"Base.Bullets357Box",	AmmoBox		* w357	- (w357 * x357)			- (AmmoBox * SECxNON)		,						
			"Base.Bullets45Box",	AmmoBox		* w45	- (w45 * x45)					,						
			"Base.Bullets44Box",	AmmoBox		* w44	- (w44 * x44)			- (AmmoBox * SECxNON)		,						
			"Base.Bullets45LCBox",	AmmoBox		* w45LC	- (w45LC * x45LC)			- (AmmoBox * SECxNON)		,						
			"Base.Bullets4570Box",	AmmoBox		* w4570	- (w4570 * x4570)			- (AmmoBox * SECxNON)		,						
			"Base.Bullets50MAGBox",	AmmoBox		* wBMG	- (wBMG * xBMG)			- (AmmoBox * SECxNON)	- (AmmoBox * x90)	,						
			"Base.223Box",	AmmoBox		* w223	- (w223 * x223)			- (AmmoBox * SECxNON)		,						
			"Base.556Box",	AmmoBox		* w556	- (w556 * x556)					,						
			"Base.762x39Box",	AmmoBox		* w762x39	- (w762x39 * x762x39)					,						
			"Base.545x39Box",	AmmoBox		* w545x39	- (w545x39 * x545x39)					,						
			"Base.762x54rBox",	AmmoBox		* w762x54r	- (w762x54r * x762x54r)			- (AmmoBox * SECxNON)		,						
			"Base.308Box",	AmmoBox		* w308	- (w308 * x308)					,						
			"Base.3006Box",	AmmoBox		* w3006	- (w3006 * x3006)			- (AmmoBox * SECxNON)		,						
			"Base.410gShotgunShellsBox",	AmmoBox		* w45LC	- (w45LC * x45LC)			- (AmmoBox * SECxNON)		,						
			"Base.20gShotgunShellsBox",	AmmoBox		* w20g	- (w20g * x20g)			- (AmmoBox * SECxNON)		,						
			"Base.ShotgunShellsBox",	AmmoBox		* w12g	- (w12g * x12g)					,						
			"Base.10gShotgunShellsBox",	AmmoBox		* w10g	- (w10g * x10g)			- (AmmoBox * SECxNON)		,						
			"Base.4gShotgunShellsBox",	AmmoBox		* w4g	- (w4g * x4g)			- (AmmoBox * SECxNON)		,						
			"Base.50BMGBox",	AmmoBox		* wBMG	- (wBMG * xBMG)		- (AmmoBox * CIVxMIL)			,						
			"Base.Bolt_Bear",	AmmoBox		* wBOW	- (wBOW * xBOW)			- (AmmoBox * SECxNON)		,						
			"Base.Bolt_Bear_Pack",	AmmoBox		* wBOW	- (wBOW * xBOW)			- (AmmoBox * SECxNON)		,						
			"Base.40HERound",	AmmoBox		* wGREN	- (wGREN * xGREN)		- (AmmoBox * CIVxMIL)			,						
			"Base.40INCRound",	AmmoBox		* wGREN	- (wGREN * xGREN)		- (AmmoBox * CIVxMIL)			,						
			"Base.PolyCan_Red_SPASClip",	StdMag	 * PolyCan	* w12g	- (w12g * x12g)					,						
			"Base.PolyCan_Red_12gDrum",	DrumMag	 * PolyCan	* w12g	- (w12g * x12g)					,						
			"Base.PolyCan_Red_38Speed",	StdMag	 * PolyCan	* w357	- (w357 * x357)	- (StdMag * xREV)		- (StdMag * SECxNON)		,						
			"Base.PolyCan_Red_44Speed",	StdMag	 * PolyCan	* w44	- (w44 * x44)	- (StdMag * xREV)		- (StdMag * SECxNON)		,						
			"Base.PolyCan_Blue_9mmClip",	StdMag	 * PolyCan	* w9	- (w9 * x9)					,						
			"Base.PolyCan_Blue_9mmExtClip",	ExtMag	 * PolyCan	* w9	- (w9 * x9)					,						
			"Base.PolyCan_Blue_9mmDrum",	DrumMag	 * PolyCan	* w9	- (w9 * x9)					,						
			"Base.PolyCan_Blue_45DSClip",	StdMag	 * PolyCan	* w45	- (w45 * x45)					,						
			"Base.PolyCan_Blue_45DSExtClip",	ExtMag	 * PolyCan	* w45	- (w45 * x45)					,						
			"Base.PolyCan_Blue_45Drum",	DrumMag	 * PolyCan	* w45	- (w45 * x45)					,						
			"Base.PolyCan_Blue_45Clip",	StdMag	 * PolyCan	* w45	- (w45 * x45)					,						
			"Base.PolyCan_Blue_45ExtClip",	ExtMag	 * PolyCan	* w45	- (w45 * x45)					,						
			"Base.PolyCan_Brown_556Clip",	StdMag	 * PolyCan	* w556	- (w556 * x556)					,						
			"Base.PolyCan_Brown_556Drum",	DrumMag	 * PolyCan	* w556	- (w556 * x556)					,						
			"Base.PolyCan_Brown_AKClip",	StdMag	 * PolyCan	* w762x39	- (w762x39 * x762x39)					,						
			"Base.PolyCan_Brown_762Drum",	DrumMag	 * PolyCan	* w762x39	- (w762x39 * x762x39)					,						
			"Base.PolyCan_Brown_545StdClip",	StdMag	 * PolyCan	* w545x39	- (w545x39 * x545x39)					,						
			"Base.PolyCan_Brown_545Drum",	DrumMag	 * PolyCan	* w545x39	- (w545x39 * x545x39)					,						
			"Base.PolyCan_Beige_308StdClip",	StdMag	 * PolyCan	* w308	- (w308 * x308)					,						
			"Base.PolyCan_Beige_308ExtClip",	ExtMag	 * PolyCan	* w308	- (w308 * x308)					,						
			"Base.PolyCan_Beige_BMG",	StdMag	 * PolyCan	* wBMG	- (wBMG * xBMG)		- (StdMag * CIVxMIL)			,						
			"Base.PolyCan_Beige_K11",	StdMag	 * PolyCan	* wGREN	- (wGREN * xGREN)	- (StdMag * xKOR)	- (StdMag * CIVxMIL)		- (StdMag * x90)	,						
			"Base.PolyCan_Beige_SVDClip",	StdMag	 * PolyCan	* w762x54r	- (w762x54r * x762x54r)	- (StdMag * xSOV)		- (StdMag * SECxNON)		,						
			"Base.PolyCan_Beige_SKSClip",	StdMag	 * PolyCan	* w762x39	- (w762x39 * x762x39)	- (StdMag * xSOV)		- (StdMag * SECxNON)		,						
			"Base.PolyCan_Beige_M1Clip",	StdMag	 * PolyCan	* w3006	- (w3006 * x3006)	- (StdMag * xUSA)		- (StdMag * SECxNON)		,						
			"Base.PolyCan_Beige_1903Clip",	StdMag	 * PolyCan	* w308	- (w308 * x308)			- (StdMag * SECxNON)		,						
		}																
	},																	
																		
																		
	HuntGuns = {																	
		rolls =	HNTRollGUN	,														
		items = {																
			"Base.UmarexSS",	wBB	 * HNTx	- (wBB * xBB)		- (wBB * HNTx * xUSA)			- (wBB * HNTx * HNTxNON)	- (wBB * HNTx * x90)	,					
			"Base.Benjamin_M397",	wBB	 * HNTx	- (wBB * xBB)		- (wBB * HNTx * xUSA)					,					
			"Base.RWS_M34",	wBB	 * HNTx	- (wBB * xBB)		- (wBB * HNTx * xUSA)				- (wBB * HNTx * x90)	,					
			"Base.CP33",	w22	 * HNTx	- (w22 * x22)	- (w22 * HNTx * xSEMI)	- (w22 * HNTx * xUSA)			- (w22 * HNTx * HNTxNON)	- (w22 * HNTx * x90)	,					
			"Base.Ruger_MK4",	w22	 * HNTx	- (w22 * x22)	- (w22 * HNTx * xSEMI)	- (w22 * HNTx * xUSA)				- (w22 * HNTx * x90)	,					
			"Base.Buckmark",	w22	 * HNTx	- (w22 * x22)	- (w22 * HNTx * xSEMI)	- (w22 * HNTx * xUSA)					,					
			"Base.Buckmark_Long",	w22	 * HNTx	- (w22 * x22)	- (w22 * HNTx * xSEMI)	- (w22 * HNTx * xUSA)					,					
			"Base.Buckmark_Carbine",	w22	 * HNTx	- (w22 * x22)	- (w22 * HNTx * xSEMI)	- (w22 * HNTx * xUSA)					,					
			"Base.HK4_22",	w22	 * HNTx	- (w22 * x22)	- (w22 * HNTx * xSEMI)	- (w22 * HNTx * xEUR)			- (w22 * HNTx * HNTxNON)		,					
			"Base.ZIP22",	w22	 * HNTx	- (w22 * x22)	- (w22 * HNTx * xSEMI)	- (w22 * HNTx * xUSA)			- (w22 * HNTx * HNTxNON)	- (w22 * HNTx * x90)	,					
			"Base.Ruger_1022",	w22	 * HNTx	- (w22 * x22)	- (w22 * HNTx * xSEMI)	- (w22 * HNTx * xUSA)					,					
			"Base.Marlin_M70",	w22	 * HNTx	- (w22 * x22)	- (w22 * HNTx * xSEMI)	- (w22 * HNTx * xUSA)					,					
			"Base.Cricket_22",	w22	 * HNTx	- (w22 * x22)	- (w22 * HNTx * xBOLT)	- (w22 * HNTx * xUSA)					,					
			"Base.AR7",	w22	 * HNTx	- (w22 * x22)	- (w22 * HNTx * xSEMI)	- (w22 * HNTx * xUSA)					,					
			"Base.Calico_22LR",	w22	 * HNTx	- (w22 * x22)	- (w22 * HNTx * xSMG)	- (w22 * HNTx * xUSA)			- (w22 * HNTx * HNTxNON)		,					
			"Base.American180",	w22	 * HNTx	- (w22 * x22)	- (w22 * HNTx * xSMG)	- (w22 * HNTx * xUSA)			- (w22 * HNTx * HNTxNON)		,					
			"Base.Winchester1903",	w22	 * HNTx	- (w22 * x22)	- (w22 * HNTx * xLEVER)	- (w22 * HNTx * xUSA)					,					
			"Base.G42",	w380	 * HNTx	- (w380 * x380)	- (w380 * HNTx * xSEMI)	- (w380 * HNTx * xEUR)			- (w380 * HNTx * HNTxNON)	- (w380 * HNTx * x90)	,					
			"Base.LCP380",	w380	 * HNTx	- (w380 * x380)	- (w380 * HNTx * xSEMI)	- (w380 * HNTx * xUSA)			- (w380 * HNTx * HNTxNON)	- (w380 * HNTx * x90)	,					
			"Base.BodyGuard380",	w380	 * HNTx	- (w380 * x380)	- (w380 * HNTx * xSEMI)	- (w380 * HNTx * xUSA)			- (w380 * HNTx * HNTxNON)	- (w380 * HNTx * x90)	,					
			"Base.Bersa85F",	w380	 * HNTx	- (w380 * x380)	- (w380 * HNTx * xSEMI)	- (w380 * HNTx * xREST)			- (w380 * HNTx * HNTxNON)		,					
			"Base.Colt1903",	w380	 * HNTx	- (w380 * x380)	- (w380 * HNTx * xSEMI)	- (w380 * HNTx * xUSA)			- (w380 * HNTx * HNTxNON)		,					
			"Base.Makarov380",	w380	 * HNTx	- (w380 * x380)	- (w380 * HNTx * xSEMI)	- (w380 * HNTx * xSOV)			- (w380 * HNTx * HNTxNON)		,					
			"Base.PPK",	w380	 * HNTx	- (w380 * x380)	- (w380 * HNTx * xSEMI)	- (w380 * HNTx * xEUR)			- (w380 * HNTx * HNTxNON)		,					
			"Base.HK4_380",	w380	 * HNTx	- (w380 * x380)	- (w380 * HNTx * xSEMI)	- (w380 * HNTx * xEUR)			- (w380 * HNTx * HNTxNON)		,					
			"Base.VP70",	w380	 * HNTx	- (w380 * x380)	- (w380 * HNTx * xSMG)	- (w380 * HNTx * xEUR)			- (w380 * HNTx * HNTxNON)		,					
			"Base.VP70_Stock",	w380	 * HNTx	- (w380 * x380)	- (w380 * HNTx * xSMG)	- (w380 * HNTx * xEUR)			- (w380 * HNTx * HNTxNON)		,					
			"Base.Vz61_Fixed",	w380	 * HNTx	- (w380 * x380)	- (w380 * HNTx * xSMG)	- (w380 * HNTx * xCZE)			- (w380 * HNTx * HNTxNON)		,					
			"Base.Vz61_Fold",	w380	 * HNTx	- (w380 * x380)	- (w380 * HNTx * xSMG)	- (w380 * HNTx * xCZE)			- (w380 * HNTx * HNTxNON)		,					
			"Base.BT380_Stock",	w380	 * HNTx	- (w380 * x380)	- (w380 * HNTx * xSEMI)	- (w380 * HNTx * xEUR)			- (w380 * HNTx * HNTxNON)	- (w380 * HNTx * x90)	,					
			"Base.FN_57", 	w57	 * HNTx	- (w57 * x57)	- (w57 * HNTx * xSEMI)	- (w57 * HNTx * xEUR)	- (w57 * HNTx * CIVxLEO)		- (w57 * HNTx * HNTxNON)	- (w57 * HNTx * x90)	,					
			"Base.FN_57_MK2", 	w57	 * HNTx	- (w57 * x57)	- (w57 * HNTx * xSEMI)	- (w57 * HNTx * xEUR)	- (w57 * HNTx * CIVxLEO)		- (w57 * HNTx * HNTxNON)	- (w57 * HNTx * x90)	,					
			"Base.FN_P90",	w57	 * HNTx	- (w57 * x57)	- (w57 * HNTx * xSMG)	- (w57 * HNTx * xEUR)	- (w57 * HNTx * CIVxLEO)		- (w57 * HNTx * HNTxNON)	- (w57 * HNTx * x90)	,					
			"Base.FN_PS90",	w57	 * HNTx	- (w57 * x57)	- (w57 * HNTx * xSMG)	- (w57 * HNTx * xEUR)	- (w57 * HNTx * CIVxLEO)		- (w57 * HNTx * HNTxNON)	- (w57 * HNTx * x90)	,					
			"Base.CZ75",	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSEMI)	- (w9 * HNTx * xCZE)			- (w9 * HNTx * HNTxNON)		,					
			"Base.G17",	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSEMI)	- (w9 * HNTx * xEUR)		- (w9 * HNTx * CIVxMIL)	- (w9 * HNTx * HNTxNON)		,					
			"Base.G18",	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSMG)	- (w9 * HNTx * xEUR)		- (w9 * HNTx * CIVxMIL)	- (w9 * HNTx * HNTxNON)		,					
			"Base.G34", 	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSEMI)	- (w9 * HNTx * xUSA)			- (w9 * HNTx * HNTxNON)	- (w9 * HNTx * x90)	,					
			"Base.K5",	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSEMI)	- (w9 * HNTx * xKOR)		- (w9 * HNTx * CIVxMIL)	- (w9 * HNTx * HNTxNON)		,					
			"Base.M9",	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSEMI)	- (w9 * HNTx * xEUR)		- (w9 * HNTx * CIVxMIL)	- (w9 * HNTx * HNTxNON)		,					
			"Base.M9A3",	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSEMI)	- (w9 * HNTx * xEUR)			- (w9 * HNTx * HNTxNON)	- (w9 * HNTx * x90)	,					
			"Base.B93R",	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSMG)	- (w9 * HNTx * xEUR)		- (w9 * HNTx * CIVxMIL)	- (w9 * HNTx * HNTxNON)		,					
			"Base.M5906",	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSEMI)	- (w9 * HNTx * xUSA)			- (w9 * HNTx * HNTxNON)		,					
			"Base.XD9",	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSEMI)	- (w9 * HNTx * xUSA)	- (w9 * HNTx * CIVxLEO)		- (w9 * HNTx * HNTxNON)	- (w9 * HNTx * x90)	,					
			"Base.MP9",	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSEMI)	- (w9 * HNTx * xUSA)	- (w9 * HNTx * CIVxLEO)		- (w9 * HNTx * HNTxNON)	- (w9 * HNTx * x90)	,					
			"Base.P226",	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSEMI)	- (w9 * HNTx * xEUR)	- (w9 * HNTx * CIVxLEO)		- (w9 * HNTx * HNTxNON)		,					
			"Base.APS",	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSMG)	- (w9 * HNTx * xSOV)			- (w9 * HNTx * HNTxNON)		,					
			"Base.Makarov",	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSEMI)	- (w9 * HNTx * xSOV)			- (w9 * HNTx * HNTxNON)		,					
			"Base.PB",	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSEMI)	- (w9 * HNTx * xSOV)			- (w9 * HNTx * HNTxNON)		,					
			"Base.Luger",	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSEMI)	- (w9 * HNTx * xEUR)			- (w9 * HNTx * HNTxNON)		,					
			"Base.Luger_WW1",	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSEMI)	- (w9 * HNTx * xEUR)			- (w9 * HNTx * HNTxNON)		,					
			"Base.Luger_Carbine",	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSEMI)	- (w9 * HNTx * xEUR)			- (w9 * HNTx * HNTxNON)		,					
			"Base.UZI", 	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSMG)	- (w9 * HNTx * xREST)			- (w9 * HNTx * HNTxNON)		,					
			"Base.UZI_Wood",	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSMG)	- (w9 * HNTx * xREST)			- (w9 * HNTx * HNTxNON)		,					
			"Base.UZI_Micro",	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSMG)	- (w9 * HNTx * xREST)			- (w9 * HNTx * HNTxNON)		,					
			"Base.BT9_Fold",	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSMG)	- (w9 * HNTx * xEUR)			- (w9 * HNTx * HNTxNON)	- (w9 * HNTx * x90)	,					
			"Base.UMP9_Stock",	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSMG)	- (w9 * HNTx * xEUR)	- (w9 * HNTx * CIVxLEO)		- (w9 * HNTx * HNTxNON)	- (w9 * HNTx * x90)	,					
			"Base.SUB2000",	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSEMI)	- (w9 * HNTx * xUSA)				- (w9 * HNTx * x90)	,					
			"Base.MP5_Fixed",	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSMG)	- (w9 * HNTx * xEUR)	- (w9 * HNTx * CIVxLEO)		- (w9 * HNTx * HNTxNON)		,					
			"Base.MP5_Stock",	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSMG)	- (w9 * HNTx * xEUR)	- (w9 * HNTx * CIVxLEO)		- (w9 * HNTx * HNTxNON)		,					
			"Base.MP5SD6_Fixed",	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSMG)	- (w9 * HNTx * xEUR)		- (w9 * HNTx * CIVxMIL)	- (w9 * HNTx * HNTxNON)		,					
			"Base.MP5SD6_Stock",	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSMG)	- (w9 * HNTx * xEUR)		- (w9 * HNTx * CIVxMIL)	- (w9 * HNTx * HNTxNON)		,					
			"Base.EVO_Fold",	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSMG)	- (w9 * HNTx * xCZE)			- (w9 * HNTx * HNTxNON)	- (w9 * HNTx * x90)	,					
			"Base.K7_Stock",	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSMG)	- (w9 * HNTx * xKOR)		- (w9 * HNTx * CIVxMIL)	- (w9 * HNTx * HNTxNON)		,					
			"Base.AUG9",	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSMG)	- (w9 * HNTx * xEUR)		- (w9 * HNTx * CIVxMIL)	- (w9 * HNTx * HNTxNON)		,					
			"Base.KG9",	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSMG)	- (w9 * HNTx * xUSA)			- (w9 * HNTx * HNTxNON)		,					
			"Base.Calico_M900_Fold",	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSMG)	- (w9 * HNTx * xUSA)			- (w9 * HNTx * HNTxNON)		,					
			"Base.Calico_M950_Pistol",	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSMG)	- (w9 * HNTx * xUSA)			- (w9 * HNTx * HNTxNON)		,					
			"Base.VSS",	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSMG)	- (w9 * HNTx * xSOV)					,					
			"Base.ASVAL",	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSMG)	- (w9 * HNTx * xSOV)					,					
			"Base.M1Carbine",	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSEMI)	- (w9 * HNTx * xUSA)					,					
			"Base.M2Carbine",	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSMG)	- (w9 * HNTx * xUSA)			- (w9 * HNTx * HNTxNON)		,					
			"Base.M635",	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSMG)	- (w9 * HNTx * xUSA)	- (w9 * HNTx * CIVxLEO)		- (w9 * HNTx * HNTxNON)		,					
			"Base.M635S",	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSMG)	- (w9 * HNTx * xUSA)	- (w9 * HNTx * CIVxLEO)		- (w9 * HNTx * HNTxNON)		,					
			"Base.M635SD",	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSMG)	- (w9 * HNTx * xUSA)		- (w9 * HNTx * CIVxMIL)	- (w9 * HNTx * HNTxNON)		,					
			"Base.MP7",	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSMG)	- (w9 * HNTx * xEUR)	- (w9 * HNTx * CIVxLEO)		- (w9 * HNTx * HNTxNON)	- (w9 * HNTx * x90)	,					
			"Base.Jatimatic",	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSMG)	- (w9 * HNTx * xEUR)			- (w9 * HNTx * HNTxNON)		,					
			"Base.Sten",	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSMG)	- (w9 * HNTx * xEUR)			- (w9 * HNTx * HNTxNON)		,					
			"Base.Sten_MK2",	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSMG)	- (w9 * HNTx * xEUR)			- (w9 * HNTx * HNTxNON)		,					
			"Base.Sten_MK2SD",	w9	 * HNTx	- (w9 * x9)	- (w9 * HNTx * xSMG)	- (w9 * HNTx * xEUR)			- (w9 * HNTx * HNTxNON)		,					
			"Base.M5238",	w357	 * HNTx	- (w357 * x357)	- (w357 * HNTx * xSEMI)	- (w357 * HNTx * xUSA)			- (w357 * HNTx * HNTxNON)		,					
			"Base.Taurus856",	w357	 * HNTx	- (w357 * x357)	- (w357 * HNTx * xREV)	- (w357 * HNTx * xREST)				- (w357 * HNTx * x90)	,					
			"Base.Colt_Service38",	w357	 * HNTx	- (w357 * x357)	- (w357 * HNTx * xREV)	- (w357 * HNTx * xUSA)			- (w357 * HNTx * HNTxNON)		,					
			"Base.GP100_2",	w357	 * HNTx	- (w357 * x357)	- (w357 * HNTx * xREV)	- (w357 * HNTx * xUSA)					,					
			"Base.GP100_4",	w357	 * HNTx	- (w357 * x357)	- (w357 * HNTx * xREV)	- (w357 * HNTx * xUSA)					,					
			"Base.GP100_6",	w357	 * HNTx	- (w357 * x357)	- (w357 * HNTx * xREV)	- (w357 * HNTx * xUSA)					,					
			"Base.K6S",	w357	 * HNTx	- (w357 * x357)	- (w357 * HNTx * xREV)	- (w357 * HNTx * xUSA)				- (w357 * HNTx * x90)	,					
			"Base.M1936",	w357	 * HNTx	- (w357 * x357)	- (w357 * HNTx * xREV)	- (w357 * HNTx * xUSA)			- (w357 * HNTx * HNTxNON)		,					
			"Base.NEF_Handi_38",	w357	 * HNTx	- (w357 * x357)	- (w357 * HNTx * xBREAK)	- (w357 * HNTx * xUSA)					,					
			"Base.Marlin_1894",	w357	 * HNTx	- (w357 * x357)	- (w357 * HNTx * xLEVER)	- (w357 * HNTx * xUSA)					,					
			"Base.CZ97B",	w45	 * HNTx	- (w45 * x45)	- (w45 * HNTx * xSEMI)	- (w45 * HNTx * xCZE)			- (w45 * HNTx * HNTxNON)	- (w45 * HNTx * x90)	,					
			"Base.G21",	w45	 * HNTx	- (w45 * x45)	- (w45 * HNTx * xSEMI)	- (w45 * HNTx * xEUR)			- (w45 * HNTx * HNTxNON)		,					
			"Base.XD4",	w45	 * HNTx	- (w45 * x45)	- (w45 * HNTx * xSEMI)	- (w45 * HNTx * xUSA)			- (w45 * HNTx * HNTxNON)	- (w45 * HNTx * x90)	,					
			"Base.MP45",	w45	 * HNTx	- (w45 * x45)	- (w45 * HNTx * xSEMI)	- (w45 * HNTx * xUSA)			- (w45 * HNTx * HNTxNON)	- (w45 * HNTx * x90)	,					
			"Base.P220",	w45	 * HNTx	- (w45 * x45)	- (w45 * HNTx * xSEMI)	- (w45 * HNTx * xEUR)			- (w45 * HNTx * HNTxNON)		,					
			"Base.M4506",	w45	 * HNTx	- (w45 * x45)	- (w45 * HNTx * xSEMI)	- (w45 * HNTx * xUSA)			- (w45 * HNTx * HNTxNON)		,					
			"Base.PARA1911",	w45	 * HNTx	- (w45 * x45)	- (w45 * HNTx * xSEMI)	- (w45 * HNTx * xUSA)					,					
			"Base.AMT1911",	w45	 * HNTx	- (w45 * x45)	- (w45 * HNTx * xSEMI)	- (w45 * HNTx * xUSA)					,					
			"Base.AMT1911_Long",	w45	 * HNTx	- (w45 * x45)	- (w45 * HNTx * xSEMI)	- (w45 * HNTx * xUSA)					,					
			"Base.M1911_Carbine",	w45	 * HNTx	- (w45 * x45)	- (w45 * HNTx * xSEMI)	- (w45 * HNTx * xUSA)					,					
			"Base.Colt1911",	w45	 * HNTx	- (w45 * x45)	- (w45 * HNTx * xSEMI)	- (w45 * HNTx * xUSA)					,					
			"Base.Colt_Kimber",	w45	 * HNTx	- (w45 * x45)	- (w45 * HNTx * xSEMI)	- (w45 * HNTx * xUSA)				- (w45 * HNTx * x90)	,					
			"Base.Colt_Commander",	w45	 * HNTx	- (w45 * x45)	- (w45 * HNTx * xSEMI)	- (w45 * HNTx * xUSA)					,					
			"Base.UMP45_Stock",	w45	 * HNTx	- (w45 * x45)	- (w45 * HNTx * xSMG)	- (w45 * HNTx * xEUR)	- (w45 * HNTx * CIVxLEO)		- (w45 * HNTx * HNTxNON)	- (w45 * HNTx * x90)	,					
			"Base.MAC10_Fold",	w45	 * HNTx	- (w45 * x45)	- (w45 * HNTx * xSMG)	- (w45 * HNTx * xUSA)			- (w45 * HNTx * HNTxNON)		,					
			"Base.KRISS_Stock",	w45	 * HNTx	- (w45 * x45)	- (w45 * HNTx * xSMG)	- (w45 * HNTx * xUSA)			- (w45 * HNTx * HNTxNON)	- (w45 * HNTx * x90)	,					
			"Base.Commando",	w45	 * HNTx	- (w45 * x45)	- (w45 * HNTx * xBOLT)	- (w45 * HNTx * xEUR)					,					
			"Base.Thompson",	w45	 * HNTx	- (w45 * x45)	- (w45 * HNTx * xSMG)	- (w45 * HNTx * xUSA)			- (w45 * HNTx * HNTxNON)		,					
			"Base.Thompson_1928",	w45	 * HNTx	- (w45 * x45)	- (w45 * HNTx * xSMG)	- (w45 * HNTx * xUSA)			- (w45 * HNTx * HNTxNON)		,					
			"Base.M2Hyde",	w45	 * HNTx	- (w45 * x45)	- (w45 * HNTx * xSMG)	- (w45 * HNTx * xUSA)			- (w45 * HNTx * HNTxNON)		,					
			"Base.Model55_Fold",	w45	 * HNTx	- (w45 * x45)	- (w45 * HNTx * xSMG)	- (w45 * HNTx * xUSA)			- (w45 * HNTx * HNTxNON)		,					
			"Base.Model50",	w45	 * HNTx	- (w45 * x45)	- (w45 * HNTx * xSMG)	- (w45 * HNTx * xUSA)			- (w45 * HNTx * HNTxNON)		,					
			"Base.Colt_Navy_1851",	w44	 * HNTx	- (w44 * x44)	- (w44 * HNTx * xREV)	- (w44 * HNTx * xUSA)					,					
			"Base.M29_44",	w44	 * HNTx	- (w44 * x44)	- (w44 * HNTx * xREV)	- (w44 * HNTx * xUSA)					,					
			"Base.M29_44Carbine",	w44	 * HNTx	- (w44 * x44)	- (w44 * HNTx * xREV)	- (w44 * HNTx * xUSA)					,					
			"Base.Automag",	w44	 * HNTx	- (w44 * x44)	- (w44 * HNTx * xSEMI)	- (w44 * HNTx * xUSA)					,					
			"Base.DEagle",	w44	 * HNTx	- (w44 * x44)	- (w44 * HNTx * xSEMI)	- (w44 * HNTx * xISR)					,					
			"Base.DEagle_Long",	w44	 * HNTx	- (w44 * x44)	- (w44 * HNTx * xSEMI)	- (w44 * HNTx * xISR)					,					
			"Base.Winchester1866",	w45LC	 * HNTx	- (w44 * x44)	- (w45LC * HNTx * xLEVER)	- (w45LC * HNTx * xUSA)					,					
			"Base.Win_1894",	w44	 * HNTx	- (w44 * x44)	- (w44 * HNTx * xLEVER)	- (w44 * HNTx * xUSA)					,					
			"Base.Colt_Service45",	w45LC	 * HNTx	- (w45LC * x45LC)	- (w45LC * HNTx * xREV)	- (w45LC * HNTx * xUSA)					,					
			"Base.Judge_45LC",	w45LC	 * HNTx	- (w45LC * x45LC)	- (w45LC * HNTx * xREV)	- (w45LC * HNTx * xREST)				- (w45LC * HNTx * x90)	,					
			"Base.Judge513_45LC",	w45LC	 * HNTx	- (w45LC * x45LC)	- (w45LC * HNTx * xREV)	- (w45LC * HNTx * xREST)				- (w45LC * HNTx * x90)	,					
			"Base.Judge513_Long_45LC",	w45LC	 * HNTx	- (w45LC * x45LC)	- (w45LC * HNTx * xREV)	- (w45LC * HNTx * xREST)				- (w45LC * HNTx * x90)	,					
			"Base.TXS_804_45LC",	w45LC	 * HNTx	- (w45LC * x45LC)	- (w45LC * HNTx * xREV)	- (w45LC * HNTx * xREST)					,					
			"Base.Winchester1873",	w45LC	 * HNTx	- (w45LC * x45LC)	- (w45LC * HNTx * xLEVER)	- (w45LC * HNTx * xUSA)					,					
			"Base.Sako85",	w223	 * HNTx	- (w223 * x223)	- (w223 * HNTx * xBOLT)	- (w223 * HNTx * xEUR)					,					
			"Base.MINI14",	w223	 * HNTx	- (w223 * x223)	- (w223 * HNTx * xSEMI)	- (w223 * HNTx * xUSA)					,					
			"Base.MINI14_T",	w223	 * HNTx	- (w223 * x223)	- (w223 * HNTx * xSEMI)	- (w223 * HNTx * xUSA)	- (w223 * HNTx * CIVxLEO)				,					
			"Base.Viper",	w223	 * HNTx	- (w223 * x223)	- (w223 * HNTx * xLEVER)	- (w223 * HNTx * xREST)				- (w223 * HNTx * x90)	,					
			"Base.CAR15SMG",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xAUTO)	- (w556 * HNTx * xUSA)	- (w556 * HNTx * CIVxLEO)		- (w556 * HNTx * HNTxNON)		,					
			"Base.CAR15_Survival",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xAUTO)	- (w556 * HNTx * xUSA)	- (w556 * HNTx * CIVxLEO)		- (w556 * HNTx * HNTxNON)		,					
			"Base.XM8Compact_Pistol",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xAUTO)	- (w556 * HNTx * xEUR)		- (w556 * HNTx * CIVxMIL)	- (w556 * HNTx * HNTxNON)	- (w556 * HNTx * x90)	,					
			"Base.XM8",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xAUTO)	- (w556 * HNTx * xEUR)		- (w556 * HNTx * CIVxMIL)	- (w556 * HNTx * HNTxNON)	- (w556 * HNTx * x90)	,					
			"Base.SCARSC_Stock",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xAUTO)	- (w556 * HNTx * xEUR)		- (w556 * HNTx * CIVxMIL)	- (w556 * HNTx * HNTxNON)	- (w556 * HNTx * x90)	,					
			"Base.SCARL",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xAUTO)	- (w556 * HNTx * xEUR)		- (w556 * HNTx * CIVxMIL)	- (w556 * HNTx * HNTxNON)	- (w556 * HNTx * x90)	,					
			"Base.G33",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xAUTO)	- (w556 * HNTx * xEUR)		- (w556 * HNTx * CIVxMIL)	- (w556 * HNTx * HNTxNON)		,					
			"Base.MK18",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xAUTO)	- (w556 * HNTx * xEUR)		- (w556 * HNTx * CIVxMIL)	- (w556 * HNTx * HNTxNON)	- (w556 * HNTx * x90)	,					
			"Base.M16A1",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xAUTO)	- (w556 * HNTx * xUSA)		- (w556 * HNTx * CIVxMIL)	- (w556 * HNTx * HNTxNON)		,					
			"Base.M16A2",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xAUTO)	- (w556 * HNTx * xUSA)			- (w556 * HNTx * HNTxNON)		,					
			"Base.M16A3",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xAUTO)	- (w556 * HNTx * xUSA)		- (w556 * HNTx * CIVxMIL)	- (w556 * HNTx * HNTxNON)		,					
			"Base.M723",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xAUTO)	- (w556 * HNTx * xUSA)		- (w556 * HNTx * CIVxMIL)	- (w556 * HNTx * HNTxNON)		,					
			"Base.XM117",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xAUTO)	- (w556 * HNTx * xUSA)		- (w556 * HNTx * CIVxMIL)	- (w556 * HNTx * HNTxNON)	- (w556 * HNTx * x90)	,					
			"Base.H416",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xAUTO)	- (w556 * HNTx * xEUR)		- (w556 * HNTx * CIVxMIL)	- (w556 * HNTx * HNTxNON)	- (w556 * HNTx * x90)	,					
			"Base.M4",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xAUTO)	- (w556 * HNTx * xUSA)		- (w556 * HNTx * CIVxMIL)	- (w556 * HNTx * HNTxNON)		,					
			"Base.M4A1",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xAUTO)	- (w556 * HNTx * xUSA)		- (w556 * HNTx * CIVxMIL)	- (w556 * HNTx * HNTxNON)		,					
			"Base.ADAR",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xAUTO)	- (w556 * HNTx * xSOV)			- (w556 * HNTx * HNTxNON)	- (w556 * HNTx * x90)	,					
			"Base.K2C1_PH",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xAUTO)	- (w556 * HNTx * xKOR)		- (w556 * HNTx * CIVxMIL)	- (w556 * HNTx * HNTxNON)	- (w556 * HNTx * x90)	,					
			"Base.K1DEV",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xAUTO)	- (w556 * HNTx * xKOR)		- (w556 * HNTx * CIVxMIL)	- (w556 * HNTx * HNTxNON)		,					
			"Base.K2_C1",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xAUTO)	- (w556 * HNTx * xKOR)		- (w556 * HNTx * CIVxMIL)	- (w556 * HNTx * HNTxNON)	- (w556 * HNTx * x90)	,					
			"Base.K2_1",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xAUTO)	- (w556 * HNTx * xKOR)		- (w556 * HNTx * CIVxMIL)	- (w556 * HNTx * HNTxNON)		,					
			"Base.K2_203",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xAUTO)	- (w556 * HNTx * xKOR)		- (w556 * HNTx * CIVxMIL)	- (w556 * HNTx * HNTxNON)		,					
			"Base.K1_1",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xAUTO)	- (w556 * HNTx * xKOR)		- (w556 * HNTx * CIVxMIL)	- (w556 * HNTx * HNTxNON)		,					
			"Base.DR_200",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xAUTO)	- (w556 * HNTx * xKOR)	- (w556 * HNTx * CIVxLEO)			- (w556 * HNTx * x90)	,					
			"Base.LVOA_C",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xSEMI)	- (w556 * HNTx * xUSA)			- (w556 * HNTx * HNTxNON)	- (w556 * HNTx * x90)	,					
			"Base.MCX_Spear",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xSEMI)	- (w556 * HNTx * xEUR)			- (w556 * HNTx * HNTxNON)	- (w556 * HNTx * x90)	,					
			"Base.ColtM16",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xAUTO)	- (w556 * HNTx * xUSA)			- (w556 * HNTx * HNTxNON)		,					
			"Base.M16Wood",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xAUTO)	- (w556 * HNTx * xUSA)			- (w556 * HNTx * HNTxNON)		,					
			"Base.M16Tape",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xAUTO)	- (w556 * HNTx * xUSA)			- (w556 * HNTx * HNTxNON)		,					
			"Base.FAMAS",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xAUTO)	- (w556 * HNTx * xEUR)		- (w556 * HNTx * CIVxMIL)	- (w556 * HNTx * HNTxNON)		,					
			"Base.FAMAS_G2",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xAUTO)	- (w556 * HNTx * xEUR)		- (w556 * HNTx * CIVxMIL)	- (w556 * HNTx * HNTxNON)		,					
			"Base.FAMAS_Felin",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xAUTO)	- (w556 * HNTx * xEUR)		- (w556 * HNTx * CIVxMIL)	- (w556 * HNTx * HNTxNON)		,					
			"Base.AUG",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xAUTO)	- (w556 * HNTx * xEUR)			- (w556 * HNTx * HNTxNON)		,					
			"Base.M85_Stock",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xAUTO)	- (w556 * HNTx * xSOV)			- (w556 * HNTx * HNTxNON)		,					
			"Base.AK74",	w545x39	 * HNTx	- (w545x39 * x545x39)	- (w545x39 * HNTx * xAUTO)	- (w545x39 * HNTx * xSOV)			- (w545x39 * HNTx * HNTxNON)		,					
			"Base.AKS74",	w545x39	 * HNTx	- (w545x39 * x545x39)	- (w545x39 * HNTx * xAUTO)	- (w545x39 * HNTx * xSOV)			- (w545x39 * HNTx * HNTxNON)		,					
			"Base.AKS74U",	w545x39	 * HNTx	- (w545x39 * x545x39)	- (w545x39 * HNTx * xAUTO)	- (w545x39 * HNTx * xSOV)			- (w545x39 * HNTx * HNTxNON)		,					
			"Base.AK74_Alpha",	w545x39	 * HNTx	- (w545x39 * x545x39)	- (w545x39 * HNTx * xAUTO)	- (w545x39 * HNTx * xSOV)		- (w545x39 * HNTx * CIVxMIL)	- (w545x39 * HNTx * HNTxNON)	- (w545x39 * HNTx * x90)	,					
			"Base.AK12",	w545x39	 * HNTx	- (w545x39 * x545x39)	- (w545x39 * HNTx * xAUTO)	- (w545x39 * HNTx * xSOV)		- (w545x39 * HNTx * CIVxMIL)	- (w545x39 * HNTx * HNTxNON)	- (w545x39 * HNTx * x90)	,					
			"Base.AK12_New",	w545x39	 * HNTx	- (w545x39 * x545x39)	- (w545x39 * HNTx * xAUTO)	- (w545x39 * HNTx * xSOV)		- (w545x39 * HNTx * CIVxMIL)	- (w545x39 * HNTx * HNTxNON)	- (w545x39 * HNTx * x90)	,					
			"Base.RPK74",	w545x39	 * HNTx	- (w545x39 * x545x39)	- (w545x39 * HNTx * xLMG)	- (w545x39 * HNTx * xSOV)			- (w545x39 * HNTx * HNTxNON)		,					
			"Base.RPK16",	w545x39	 * HNTx	- (w545x39 * x545x39)	- (w545x39 * HNTx * xLMG)	- (w545x39 * HNTx * xSOV)			- (w545x39 * HNTx * HNTxNON)	- (w545x39 * HNTx * x90)	,					
			"Base.L85",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xAUTO)	- (w556 * HNTx * xEUR)		- (w556 * HNTx * CIVxMIL)	- (w556 * HNTx * HNTxNON)		,					
			"Base.L85A2",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xAUTO)	- (w556 * HNTx * xEUR)		- (w556 * HNTx * CIVxMIL)	- (w556 * HNTx * HNTxNON)	- (w556 * HNTx * x90)	,					
			"Base.L86",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xAUTO)	- (w556 * HNTx * xEUR)		- (w556 * HNTx * CIVxMIL)	- (w556 * HNTx * HNTxNON)		,					
			"Base.L22",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xAUTO)	- (w556 * HNTx * xEUR)		- (w556 * HNTx * CIVxMIL)	- (w556 * HNTx * HNTxNON)	- (w556 * HNTx * x90)	,					
			"Base.F2000",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xAUTO)	- (w556 * HNTx * xEUR)			- (w556 * HNTx * HNTxNON)	- (w556 * HNTx * x90)	,					
			"Base.Tavor",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xAUTO)	- (w556 * HNTx * xISR)		- (w556 * HNTx * CIVxMIL)	- (w556 * HNTx * HNTxNON)	- (w556 * HNTx * x90)	,					
			"Base.AR18",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xAUTO)	- (w556 * HNTx * xUSA)			- (w556 * HNTx * HNTxNON)		,					
			"Base.Type20",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xAUTO)	- (w556 * HNTx * xPAC)		- (w556 * HNTx * CIVxMIL)	- (w556 * HNTx * HNTxNON)	- (w556 * HNTx * x90)	,					
			"Base.Type89",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xAUTO)	- (w556 * HNTx * xPAC)		- (w556 * HNTx * CIVxMIL)	- (w556 * HNTx * HNTxNON)		,					
			"Base.QBZ_95",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xAUTO)	- (w556 * HNTx * xPAC)		- (w556 * HNTx * CIVxMIL)	- (w556 * HNTx * HNTxNON)	- (w556 * HNTx * x90)	,					
			"Base.XM8LMG",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xLMG)	- (w556 * HNTx * xEUR)		- (w556 * HNTx * CIVxMIL)	- (w556 * HNTx * HNTxNON)	- (w556 * HNTx * x90)	,					
			"Base.M249",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xLMG)	- (w556 * HNTx * xUSA)		- (w556 * HNTx * CIVxMIL)	- (w556 * HNTx * HNTxNON)		,					
			"Base.M249E3",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xLMG)	- (w556 * HNTx * xUSA)		- (w556 * HNTx * CIVxMIL)	- (w556 * HNTx * HNTxNON)	- (w556 * HNTx * x90)	,					
			"Base.K3LMG",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xLMG)	- (w556 * HNTx * xKOR)		- (w556 * HNTx * CIVxMIL)	- (w556 * HNTx * HNTxNON)		,					
			"Base.AK47",	w762x39	 * HNTx	- (w762x39 * x762x39)	- (w762x39 * HNTx * xAUTO)	- (w762x39 * HNTx * xSOV)			- (w762x39 * HNTx * HNTxNON)		,					
			"Base.AKM",	w762x39	 * HNTx	- (w762x39 * x762x39)	- (w762x39 * HNTx * xAUTO)	- (w762x39 * HNTx * xSOV)			- (w762x39 * HNTx * HNTxNON)		,					
			"Base.AK103",	w762x39	 * HNTx	- (w762x39 * x762x39)	- (w762x39 * HNTx * xAUTO)	- (w762x39 * HNTx * xSOV)			- (w762x39 * HNTx * HNTxNON)	- (w762x39 * HNTx * x90)	,					
			"Base.MD65_Stock",	w762x39	 * HNTx	- (w762x39 * x762x39)	- (w762x39 * HNTx * xAUTO)	- (w762x39 * HNTx * xSOV)			- (w762x39 * HNTx * HNTxNON)		,					
			"Base.AKMS_Stock",	w762x39	 * HNTx	- (w762x39 * x762x39)	- (w762x39 * HNTx * xAUTO)	- (w762x39 * HNTx * xSOV)			- (w762x39 * HNTx * HNTxNON)		,					
			"Base.Vz58",	w762x39	 * HNTx	- (w762x39 * x762x39)	- (w762x39 * HNTx * xAUTO)	- (w762x39 * HNTx * xCZE)			- (w762x39 * HNTx * HNTxNON)		,					
			"Base.Vz58_Stock",	w762x39	 * HNTx	- (w762x39 * x762x39)	- (w762x39 * HNTx * xAUTO)	- (w762x39 * HNTx * xCZE)			- (w762x39 * HNTx * HNTxNON)		,					
			"Base.Vz58_Mini_Stock",	w762x39	 * HNTx	- (w762x39 * x762x39)	- (w762x39 * HNTx * xAUTO)	- (w762x39 * HNTx * xCZE)			- (w762x39 * HNTx * HNTxNON)		,					
			"Base.SKS",	w762x39	 * HNTx	- (w762x39 * x762x39)	- (w762x39 * HNTx * xSEMI)	- (w762x39 * HNTx * xSOV)					,					
			"Base.SKS_PARA",	w762x39	 * HNTx	- (w762x39 * x762x39)	- (w762x39 * HNTx * xSEMI)	- (w762x39 * HNTx * xPAC)					,					
			"Base.MK47",	w762x39	 * HNTx	- (w762x39 * x762x39)	- (w762x39 * HNTx * xSEMI)	- (w762x39 * HNTx * xUSA)			- (w762x39 * HNTx * HNTxNON)	- (w762x39 * HNTx * x90)	,					
			"Base.AK308",	w308	 * HNTx	- (w308 * x308)	- (w308 * HNTx * xAUTO)	- (w308 * HNTx * xSOV)		- (w308 * HNTx * CIVxMIL)	- (w308 * HNTx * HNTxNON)	- (w308 * HNTx * x90)	,					
			"Base.SCARH",	w308	 * HNTx	- (w308 * x308)	- (w308 * HNTx * xAUTO)	- (w308 * HNTx * xEUR)		- (w308 * HNTx * CIVxMIL)	- (w308 * HNTx * HNTxNON)	- (w308 * HNTx * x90)	,					
			"Base.SCAR20",	w308	 * HNTx	- (w308 * x308)	- (w308 * HNTx * xAUTO)	- (w308 * HNTx * xEUR)		- (w308 * HNTx * CIVxMIL)	- (w308 * HNTx * HNTxNON)	- (w308 * HNTx * x90)	,					
			"Base.G28",	w308	 * HNTx	- (w308 * x308)	- (w308 * HNTx * xAUTO)	- (w308 * HNTx * xEUR)		- (w308 * HNTx * CIVxMIL)	- (w308 * HNTx * HNTxNON)	- (w308 * HNTx * x90)	,					
			"Base.G3",	w308	 * HNTx	- (w308 * x308)	- (w308 * HNTx * xAUTO)	- (w308 * HNTx * xEUR)		- (w308 * HNTx * CIVxMIL)	- (w308 * HNTx * HNTxNON)		,					
			"Base.Type64",	w308	 * HNTx	- (w308 * x308)	- (w308 * HNTx * xAUTO)	- (w308 * HNTx * xPAC)			- (w308 * HNTx * HNTxNON)		,					
			"Base.FAL",	w308	 * HNTx	- (w308 * x308)	- (w308 * HNTx * xAUTO)	- (w308 * HNTx * xEUR)			- (w308 * HNTx * HNTxNON)		,					
			"Base.FAL_PARA_Stock",	w308	 * HNTx	- (w308 * x308)	- (w308 * HNTx * xAUTO)	- (w308 * HNTx * xEUR)			- (w308 * HNTx * HNTxNON)		,					
			"Base.FN_FNC",	w308	 * HNTx	- (w308 * x308)	- (w308 * HNTx * xAUTO)	- (w308 * HNTx * xEUR)			- (w308 * HNTx * HNTxNON)		,					
			"Base.WA2000",	w308	 * HNTx	- (w308 * x308)	- (w308 * HNTx * xBOLT)	- (w308 * HNTx * xEUR)					,					
			"Base.SVD",	w762x54r	 * HNTx	- (w762x54r * x762x54r)	- (w762x54r * HNTx * xSEMI)	- (w762x54r * HNTx * xSOV)					,					
			"Base.SVDK",	w762x54r	 * HNTx	- (w762x54r * x762x54r)	- (w762x54r * HNTx * xSEMI)	- (w762x54r * HNTx * xSOV)					,					
			"Base.M14EBR",	w308	 * HNTx	- (w308 * x308)	- (w308 * HNTx * xAUTO)	- (w308 * HNTx * xUSA)	- (w308 * HNTx * CIVxLEO)		- (w308 * HNTx * HNTxNON)	- (w308 * HNTx * x90)	,					
			"Base.M14",	w308	 * HNTx	- (w308 * x308)	- (w308 * HNTx * xAUTO)	- (w308 * HNTx * xUSA)			- (w308 * HNTx * HNTxNON)		,					
			"Base.K14",	w308	 * HNTx	- (w308 * x308)	- (w308 * HNTx * xBOLT)	- (w308 * HNTx * xKOR)		- (w308 * HNTx * CIVxMIL)		- (w308 * HNTx * x90)	,					
			"Base.Savage12",	w308	 * HNTx	- (w308 * x308)	- (w308 * HNTx * xBOLT)	- (w308 * HNTx * xUSA)					,					
			"Base.Ruger_No1_3006",	w3006	 * HNTx	- (w3006 * x3006)	- (w3006 * HNTx * xBREAK)	- (w3006 * HNTx * xUSA)					,					
			"Base.M40",	w308	 * HNTx	- (w308 * x308)	- (w308 * HNTx * xBOLT)	- (w308 * HNTx * xUSA)					,					
			"Base.M40A1",	w308	 * HNTx	- (w308 * x308)	- (w308 * HNTx * xBOLT)	- (w308 * HNTx * xUSA)					,					
			"Base.M40A2",	w308	 * HNTx	- (w308 * x308)	- (w308 * HNTx * xBOLT)	- (w308 * HNTx * xUSA)					,					
			"Base.M40A3",	w308	 * HNTx	- (w308 * x308)	- (w308 * HNTx * xBOLT)	- (w308 * HNTx * xUSA)					,					
			"Base.Mosin",	w762x54r	 * HNTx	- (w762x54r * x762x54r)	- (w762x54r * HNTx * xBOLT)	- (w762x54r * HNTx * xSOV)					,					
			"Base.MosinObrez_Pistol",	w762x54r	 * HNTx	- (w762x54r * x762x54r)	- (w762x54r * HNTx * xBOLT)	- (w762x54r * HNTx * xSOV)					,					
			"Base.M1",	w3006	 * HNTx	- (w3006 * x3006)	- (w3006 * HNTx * xSEMI)	- (w3006 * HNTx * xUSA)					,					
			"Base.M1903",	w3006	 * HNTx	- (w3006 * x3006)	- (w3006 * HNTx * xBOLT)	- (w3006 * HNTx * xUSA)					,					
			"Base.BAR",	w3006	 * HNTx	- (w3006 * x3006)	- (w3006 * HNTx * xAUTO)	- (w3006 * HNTx * xUSA)			- (w3006 * HNTx * HNTxNON)		,					
			"Base.BAR_Monitor",	w3006	 * HNTx	- (w3006 * x3006)	- (w3006 * HNTx * xAUTO)	- (w3006 * HNTx * xUSA)			- (w3006 * HNTx * HNTxNON)		,					
			"Base.MAS36",	w308	 * HNTx	- (w308 * x308)	- (w308 * HNTx * xAUTO)	- (w308 * HNTx * xEUR)			- (w308 * HNTx * HNTxNON)		,					
			"Base.MAS44",	w308	 * HNTx	- (w308 * x308)	- (w308 * HNTx * xAUTO)	- (w308 * HNTx * xEUR)			- (w308 * HNTx * HNTxNON)		,					
			"Base.MAS49",	w308	 * HNTx	- (w308 * x308)	- (w308 * HNTx * xAUTO)	- (w308 * HNTx * xEUR)			- (w308 * HNTx * HNTxNON)		,					
			"Base.Win_1895",	w308	 * HNTx	- (w308 * x308)	- (w308 * HNTx * xLEVER)	- (w308 * HNTx * xUSA)					,					
			"Base.Galil",	w308	 * HNTx	- (w308 * x308)	- (w308 * HNTx * xAUTO)	- (w308 * HNTx * xISR)			- (w308 * HNTx * HNTxNON)		,					
			"Base.Galil_Sniper",	w308	 * HNTx	- (w308 * x308)	- (w308 * HNTx * xAUTO)	- (w308 * HNTx * xISR)			- (w308 * HNTx * HNTxNON)		,					
			"Base.Thompson_Center_3006",	w3006	 * HNTx	- (w3006 * x3006)	- (w3006 * HNTx * xBREAK)	- (w3006 * HNTx * xUSA)					,					
			"Base.Type38",	w308	 * HNTx	- (w308 * x308)	- (w308 * HNTx * xBOLT)	- (w308 * HNTx * xPAC)		- (w308 * HNTx * CIVxMIL)			,					
			"Base.Type99",	w308	 * HNTx	- (w308 * x308)	- (w308 * HNTx * xBOLT)	- (w308 * HNTx * xPAC)		- (w308 * HNTx * CIVxMIL)			,					
			"Base.L96",	w308	 * HNTx	- (w308 * x308)	- (w308 * HNTx * xBOLT)	- (w308 * HNTx * xEUR)					,					
			"Base.M240",	w308	 * HNTx	- (w308 * x308)	- (w308 * HNTx * xLMG)	- (w308 * HNTx * xUSA)		- (w308 * HNTx * CIVxMIL)	- (w308 * HNTx * HNTxNON)		,					
			"Base.G21LMG",	w308	 * HNTx	- (w308 * x308)	- (w308 * HNTx * xLMG)	- (w308 * HNTx * xEUR)		- (w308 * HNTx * CIVxMIL)	- (w308 * HNTx * HNTxNON)	- (w308 * HNTx * x90)	,					
			"Base.K12",	w308	 * HNTx	- (w308 * x308)	- (w308 * HNTx * xLMG)	- (w308 * HNTx * xKOR)		- (w308 * HNTx * CIVxMIL)	- (w308 * HNTx * HNTxNON)	- (w308 * HNTx * x90)	,					
			"Base.PKM",	w762x54r	 * HNTx	- (w762x54r * x762x54r)	- (w762x54r * HNTx * xLMG)	- (w762x54r * HNTx * xSOV)		- (w762x54r * HNTx * CIVxMIL)	- (w762x54r * HNTx * HNTxNON)		,					
			"Base.MG42",	w308	 * HNTx	- (w308 * x308)	- (w308 * HNTx * xLMG)	- (w308 * HNTx * xEUR)		- (w308 * HNTx * CIVxMIL)	- (w308 * HNTx * HNTxNON)		,					
			"Base.M60",	w308	 * HNTx	- (w308 * x308)	- (w308 * HNTx * xLMG)	- (w308 * HNTx * xUSA)		- (w308 * HNTx * CIVxMIL)	- (w308 * HNTx * HNTxNON)		,					
			"Base.MK43",	w308	 * HNTx	- (w308 * x308)	- (w308 * HNTx * xLMG)	- (w308 * HNTx * xUSA)		- (w308 * HNTx * CIVxMIL)	- (w308 * HNTx * HNTxNON)	- (w308 * HNTx * x90)	,					
			"Base.RPD",	w762x39	 * HNTx	- (w762x39 * x762x39)	- (w762x39 * HNTx * xLMG)	- (w762x39 * HNTx * xSOV)		- (w762x39 * HNTx * CIVxMIL)	- (w762x39 * HNTx * HNTxNON)		,					
			"Base.BOAR",	wBMG	 * HNTx	- (wBMG * xBMG)	- (wBMG * HNTx * xBREAK)	- (wBMG * HNTx * xUSA)					,					
			"Base.EDM96",	wBMG	 * HNTx	- (wBMG * xBMG)	- (wBMG * HNTx * xBOLT)	- (wBMG * HNTx * xUSA)				- (wBMG * HNTx * x90)	,					
			"Base.M82",	wBMG	 * HNTx	- (wBMG * xBMG)	- (wBMG * HNTx * xSEMI)	- (wBMG * HNTx * xUSA)					,					
			"Base.BFG50",	wBMG	 * HNTx	- (wBMG * xBMG)	- (wBMG * HNTx * xBREAK)	- (wBMG * HNTx * xUSA)				- (wBMG * HNTx * x90)	,					
			"Base.Harris50",	wBMG	 * HNTx	- (wBMG * xBMG)	- (wBMG * HNTx * xBOLT)	- (wBMG * HNTx * xUSA)					,					
			"Base.TAC50",	wBMG	 * HNTx	- (wBMG * xBMG)	- (wBMG * HNTx * xBOLT)	- (wBMG * HNTx * xUSA)					,					
			"Base.Ash",	wBMG	 * HNTx	- (wBMG * xBMG)	- (wBMG * HNTx * xAUTO)	- (wBMG * HNTx * xSOV)		- (wBMG * HNTx * CIVxMIL)	- (wBMG * HNTx * HNTxNON)	- (wBMG * HNTx * x90)	,					
			"Base.SW_M500",	wBMG	 * HNTx	- (wBMG * xBMG)	- (wBMG * HNTx * xREV)	- (wBMG * HNTx * xUSA)				- (wBMG * HNTx * x90)	,					
			"Base.SPAS12_Fixed",	w12g	 * HNTx	- (w12g * x12g)	- (w12g * HNTx * xSEMI)	- (w12g * HNTx * xEUR)	- (w12g * HNTx * CIVxLEO)				,					
			"Base.SPAS12_Fold",	w12g	 * HNTx	- (w12g * x12g)	- (w12g * HNTx * xSEMI)	- (w12g * HNTx * xEUR)	- (w12g * HNTx * CIVxLEO)				,					
			"Base.Origin",	w12g	 * HNTx	- (w12g * x12g)	- (w12g * HNTx * xSEMI)	- (w12g * HNTx * xUSA)		- (w12g * HNTx * CIVxMIL)	- (w12g * HNTx * HNTxNON)	- (w12g * HNTx * x90)	,					
			"Base.SPAS_15",	w12g	 * HNTx	- (w12g * x12g)	- (w12g * HNTx * xSEMI)	- (w12g * HNTx * xEUR)		- (w12g * HNTx * CIVxMIL)	- (w12g * HNTx * HNTxNON)		,					
			"Base.USAS_12",	w12g	 * HNTx	- (w12g * x12g)	- (w12g * HNTx * xAUTO)	- (w12g * HNTx * xKOR)		- (w12g * HNTx * CIVxMIL)	- (w12g * HNTx * HNTxNON)		,					
			"Base.Shorty_Pistol",	w12g	 * HNTx	- (w12g * x12g)	- (w12g * HNTx * xPUMP)	- (w12g * HNTx * xUSA)	- (w12g * HNTx * CIVxLEO)		- (w12g * HNTx * HNTxNON)	- (w12g * HNTx * x90)	,					
			"Base.R11_87",	w12g	 * HNTx	- (w12g * x12g)	- (w12g * HNTx * xSEMI)	- (w12g * HNTx * xUSA)					,					
			"Base.M870",	w12g	 * HNTx	- (w12g * x12g)	- (w12g * HNTx * xPUMP)	- (w12g * HNTx * xUSA)					,					
			"Base.M1897",	w12g	 * HNTx	- (w12g * x12g)	- (w12g * HNTx * xPUMP)	- (w12g * HNTx * xUSA)					,					
			"Base.DT11",	w12g	 * HNTx	- (w12g * x12g)	- (w12g * HNTx * xBREAK)	- (w12g * HNTx * xEUR)					,					
			"Base.Coachgun",	w12g	 * HNTx	- (w12g * x12g)	- (w12g * HNTx * xBREAK)	- (w12g * HNTx * xUSA)					,					
			"Base.Terminator",	w12g	 * HNTx	- (w12g * x12g)	- (w12g * HNTx * xBREAK)	- (w12g * HNTx * xUSA)					,					
			"Base.SIX12",	w12g	 * HNTx	- (w12g * x12g)	- (w12g * HNTx * xREV)	- (w12g * HNTx * xUSA)	- (w12g * HNTx * CIVxLEO)		- (w12g * HNTx * HNTxNON)	- (w12g * HNTx * x90)	,					
			"Base.SIX12SD",	w12g	 * HNTx	- (w12g * x12g)	- (w12g * HNTx * xREV)	- (w12g * HNTx * xUSA)		- (w12g * HNTx * CIVxMIL)	- (w12g * HNTx * HNTxNON)	- (w12g * HNTx * x90)	,					
			"Base.M870_Wingmaster",	w12g	 * HNTx	- (w12g * x12g)	- (w12g * HNTx * xPUMP)	- (w12g * HNTx * xUSA)					,					
			"Base.M870_Police",	w12g	 * HNTx	- (w12g * x12g)	- (w12g * HNTx * xPUMP)	- (w12g * HNTx * xUSA)	- (w12g * HNTx * CIVxLEO)		- (w12g * HNTx * HNTxNON)		,					
			"Base.M870_MCS",	w12g	 * HNTx	- (w12g * x12g)	- (w12g * HNTx * xPUMP)	- (w12g * HNTx * xUSA)	- (w12g * HNTx * CIVxLEO)		- (w12g * HNTx * HNTxNON)		,					
			"Base.M870_CQB",	w12g	 * HNTx	- (w12g * x12g)	- (w12g * HNTx * xPUMP)	- (w12g * HNTx * xUSA)	- (w12g * HNTx * CIVxLEO)		- (w12g * HNTx * HNTxNON)		,					
			"Base.M870_Breaching_Pistol",	w12g	 * HNTx	- (w12g * x12g)	- (w12g * HNTx * xPUMP)	- (w12g * HNTx * xUSA)	- (w12g * HNTx * CIVxLEO)		- (w12g * HNTx * HNTxNON)		,					
			"Base.M870_Express",	w12g	 * HNTx	- (w12g * x12g)	- (w12g * HNTx * xPUMP)	- (w12g * HNTx * xUSA)					,					
			"Base.A400",	w12g	 * HNTx	- (w12g * x12g)	- (w12g * HNTx * xSEMI)	- (w12g * HNTx * xEUR)				- (w12g * HNTx * x90)	,					
			"Base.M1014",	w12g	 * HNTx	- (w12g * x12g)	- (w12g * HNTx * xSEMI)	- (w12g * HNTx * xEUR)				- (w12g * HNTx * x90)	,					
			"Base.M1014_Fold",	w12g	 * HNTx	- (w12g * x12g)	- (w12g * HNTx * xSEMI)	- (w12g * HNTx * xEUR)		- (w12g * HNTx * CIVxMIL)		- (w12g * HNTx * x90)	,					
			"Base.M1014_Wick",	w12g	 * HNTx	- (w12g * x12g)	- (w12g * HNTx * xSEMI)	- (w12g * HNTx * xEUR)		- (w12g * HNTx * CIVxMIL)		- (w12g * HNTx * x90)	,					
			"Base.DAO12",	w12g	 * HNTx	- (w12g * x12g)	- (w12g * HNTx * xREV)	- (w12g * HNTx * xREST)	- (w12g * HNTx * CIVxLEO)		- (w12g * HNTx * HNTxNON)		,					
			"Base.M1887",	w12g	 * HNTx	- (w12g * x12g)	- (w12g * HNTx * xLEVER)	- (w12g * HNTx * xUSA)					,					
			"Base.M1208",	w12g	 * HNTx	- (w12g * x12g)	- (w12g * HNTx * xREV)	- (w12g * HNTx * xUSA)			- (w12g * HNTx * HNTxNON)	- (w12g * HNTx * x90)	,					
			"Base.M1212",	w12g	 * HNTx	- (w12g * x12g)	- (w12g * HNTx * xREV)	- (w12g * HNTx * xUSA)	- (w12g * HNTx * CIVxLEO)		- (w12g * HNTx * HNTxNON)	- (w12g * HNTx * x90)	,					
			"Base.M1216",	w12g	 * HNTx	- (w12g * x12g)	- (w12g * HNTx * xREV)	- (w12g * HNTx * xUSA)	- (w12g * HNTx * CIVxLEO)		- (w12g * HNTx * HNTxNON)	- (w12g * HNTx * x90)	,					
			"Base.AA12",	w12g	 * HNTx	- (w12g * x12g)	- (w12g * HNTx * xAUTO)	- (w12g * HNTx * xUSA)		- (w12g * HNTx * CIVxMIL)	- (w12g * HNTx * HNTxNON)	- (w12g * HNTx * x90)	,					
			"Base.CAWS",	w12g	 * HNTx	- (w12g * x12g)	- (w12g * HNTx * xAUTO)	- (w12g * HNTx * xEUR)		- (w12g * HNTx * CIVxMIL)	- (w12g * HNTx * HNTxNON)		,					
			"Base.ROYAL_SXS",	w10g	 * HNTx	- (w10g * x10g)	- (w10g * HNTx * xBREAK)	- (w10g * HNTx * xEUR)					,					
			"Base.KS23",	w4g	 * HNTx	- (w4g * x4g)	- (w4g * HNTx * xPUMP)	- (w4g * HNTx * xSOV)					,					
			"Base.KS23_S_Pistol",	w4g	 * HNTx	- (w4g * x4g)	- (w4g * HNTx * xPUMP)	- (w4g * HNTx * xSOV)					,					
			"Base.Triple_Crown",	w12g	 * HNTx	- (w12g * x12g)	- (w12g * HNTx * xBREAK)	- (w12g * HNTx * xEUR)					,					
			"Base.Moss500_20",	w20g	 * HNTx	- (w20g * x20g)	- (w20g * HNTx * xPUMP)	- (w20g * HNTx * xUSA)					,					
			"Base.10855_Silver",	w20g	 * HNTx	- (w20g * x20g)	- (w20g * HNTx * xSEMI)	- (w20g * HNTx * xEUR)					,					
			"Base.Colt1855",	w20g	 * HNTx	- (w20g * x20g)	- (w20g * HNTx * xREV)	- (w20g * HNTx * xUSA)					,					
			"Base.TOZ106",	w20g	 * HNTx	- (w20g * x20g)	- (w20g * HNTx * xBOLT)	- (w20g * HNTx * xSOV)					,					
			"Base.TOZ194_Pistol",	w12g	 * HNTx	- (w12g * x12g)	- (w12g * HNTx * xPUMP)	- (w12g * HNTx * xSOV)					,					
			"Base.Saiga12_Tromix",	w12g	 * HNTx	- (w12g * x12g)	- (w12g * HNTx * xAUTO)	- (w12g * HNTx * xSOV)		- (w12g * HNTx * CIVxMIL)	- (w12g * HNTx * HNTxNON)	- (w12g * HNTx * x90)	,					
			"Base.MP133",	w12g	 * HNTx	- (w12g * x12g)	- (w12g * HNTx * xPUMP)	- (w12g * HNTx * xSOV)				- (w12g * HNTx * x90)	,					
			"Base.MP133S_Pistol",	w12g	 * HNTx	- (w12g * x12g)	- (w12g * HNTx * xPUMP)	- (w12g * HNTx * xSOV)				- (w12g * HNTx * x90)	,					
			"Base.KSG",	w12g	 * HNTx	- (w12g * x12g)	- (w12g * HNTx * xPUMP)	- (w12g * HNTx * xUSA)				- (w12g * HNTx * x90)	,					
			"Base.KSG25",	w12g	 * HNTx	- (w12g * x12g)	- (w12g * HNTx * xPUMP)	- (w12g * HNTx * xUSA)				- (w12g * HNTx * x90)	,					
			"Base.UTS15",	w12g	 * HNTx	- (w12g * x12g)	- (w12g * HNTx * xPUMP)	- (w12g * HNTx * xREST)				- (w12g * HNTx * x90)	,					
			"Base.EX41_HE",	wGREN	 * HNTx		- (wGREN * HNTx * xGREN)	- (wGREN * HNTx * xUSA)		- (wGREN * HNTx * CIVxMIL)	- (wGREN * HNTx * HNTxNON)		,					
			"Base.Federal_HE",	wGREN	 * HNTx		- (wGREN * HNTx * xGREN)	- (wGREN * HNTx * xUSA)		- (wGREN * HNTx * CIVxMIL)	- (wGREN * HNTx * HNTxNON)		,					
			"Base.M32_HE",	wGREN	 * HNTx		- (wGREN * HNTx * xGREN)	- (wGREN * HNTx * xUSA)		- (wGREN * HNTx * CIVxMIL)	- (wGREN * HNTx * HNTxNON)		,					
			"Base.GM94_HE",	wGREN	 * HNTx		- (wGREN * HNTx * xGREN)	- (wGREN * HNTx * xSOV)		- (wGREN * HNTx * CIVxMIL)	- (wGREN * HNTx * HNTxNON)	- (wGREN * HNTx * x90)	,					
			"Base.K11",	wGREN	 * HNTx	- (wGREN * HNTx * xAUTO)	- (wGREN * HNTx * xGREN)	- (wGREN * HNTx * xKOR)		- (wGREN * HNTx * CIVxMIL)	- (wGREN * HNTx * HNTxNON)	- (wGREN * HNTx * x90)	,					
			"Base.XM214",	w556	 * HNTx	- (w556 * x556)	- (w556 * HNTx * xMINI)	- (w556 * HNTx * xUSA)		- (w556 * HNTx * CIVxMIL)	- (w556 * HNTx * HNTxNON)		,					
			"Base.GAU17",	w308	 * HNTx	- (w308 * x308)	- (w308 * HNTx * xMINI)	- (w308 * HNTx * xUSA)		- (w308 * HNTx * CIVxMIL)	- (w308 * HNTx * HNTxNON)		,					
			"Base.GAU19",	wBMG	 * HNTx	- (wBMG * xBMG)	- (wBMG * HNTx * xMINI)	- (wBMG * HNTx * xUSA)		- (wBMG * HNTx * CIVxMIL)	- (wBMG * HNTx * HNTxNON)		,					
			"Base.TAC15",	wBOW	 * HNTx		- (wBOW * HNTx * xBOW)	- (wBOW * HNTx * xUSA)				- (wBOW * HNTx * x90)	,					
			"Base.M2A1",	wFLAME	 * HNTx		- (wFLAME * HNTx * xFLAME)	- (wFLAME * HNTx * xUSA)		- (wFLAME * HNTx * CIVxMIL)	- (wFLAME * HNTx * HNTxNON)		,					
			"Base.Musk",	wFLAME	 * HNTx		- (wFLAME * HNTx * xFLAME)	- (wFLAME * HNTx * xUSA)			- (wFLAME * HNTx * HNTxNON)	- (wFLAME * HNTx * x90)	,					
		},																
		dontSpawnAmmo = 		 HNTammo	,													
	},																	
																		
	HuntParts = {																	
		rolls =	HNTRollPART	,														
		items = {																
			"Base.Launcher",	wGREN		- (wGREN * xGREN)				- (wGREN * CIVxMIL)	- (wGREN * HNTxNON)		,					
			"Base.Bipod",	Part		- (Part * xPart)							,					
			"Base.Ammobelt",	Part		- (Part * xPart)							,					
			"Base.Sling_1",	Part		- (Part * xPart)							,					
			"Base.Sling_2",	Part		- (Part * xPart)							,					
			"Base.Sling_3",	Part		- (Part * xPart)					- (Part * HNTxNON)		,					
			"Base.ForeGrip",	Part		- (Part * xPart)							,					
			"Base.Grip_Magpul",	Part		- (Part * xPart)						- (Part * x90)	,					
			"Base.Grip_MLOK",	Part		- (Part * xPart)						- (Part * x90)	,					
			"Base.Grip_TG",	Part		- (Part * xPart)						- (Part * x90)	,					
			"Base.Light_Small",	Light		- (Light * xLight)							,					
			"Base.Light_Large",	Light		- (Light * xLight)							,					
			"Base.Laser_Green",	Light		- (Light * xLight)					- (Light * HNTxNON)		,					
			"Base.Laser_Red",	Light		- (Light * xLight)					- (Light * HNTxNON)		,					
			"Base.Laser_DVAL",	Light		- (Light * xLight)			- (Light * CIVxLEO)		- (Light * HNTxNON)		,					
			"Base.Laser_PEQ15",	Light		- (Light * xLight)				- (Light * CIVxMIL)	- (Light * HNTxNON)		,					
			"Base.Suppressor_Pistol",	Suppress		- (Suppress * xSuppress)				- (Suppress * CIVxMIL)			,					
			"Base.Suppressor_Rifle",	Suppress		- (Suppress * xSuppress)				- (Suppress * CIVxMIL)			,					
			"Base.Suppressor_Shotgun",	Suppress		- (Suppress * xSuppress)				- (Suppress * CIVxMIL)			,					
			"Base.Suppressor_BMG",	Suppress		- (Suppress * xSuppress)	- (wBMG * xBMG)			- (Suppress * CIVxMIL)			,					
			"Base.Bayonet_M4",	Part		- (Part * xPart)					- (Part * HNTxNON)		,					
			"Base.Bayonet_AK",	Part		- (Part * xPart)		- (Part * xSOV)			- (Part * HNTxNON)		,					
			"Base.Bayonet_M1917",	Part		- (Part * xPart)					- (Part * HNTxNON)		,					
			"Base.Choke_Full",	Part		- (Part * xPart)							,					
			"Base.Choke_Full_Dbl",	Part		- (Part * xPart)							,					
			"Base.Compensator",	Part		- (Part * xPart)							,					
			"Base.MuzzleBrake",	Part		- (Part * xPart)							,					
			"Base.Pad",	Part		- (Part * xPart)							,					
			"Base.Carrier_12g",	Part		- (Part * xPart)							,					
			"Base.GhostRing",	Optic		- (Optic * xOptic)					- (Optic * HNTxNON)		,					
			"Base.Sight_MicroDot",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * HNTxNON)	- (Optic * x90)	,					
			"Base.Sight_RaceDot",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * HNTxNON)		,					
			"Base.Sight_SRS",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				- (Optic * x90)	,					
			"Base.Sight_EOTech",	Optic		- (Optic * xOptic)		- (Optic * xUSA)					,					
			"Base.Sight_3xEOTech",	Optic		- (Optic * xOptic)		- (Optic * xUSA)					,					
			"Base.Sight_4xACOG",	Optic		- (Optic * xOptic)		- (Optic * xUSA)					,					
			"Base.Sight_6xELCAN",	Optic		- (Optic * xOptic)		- (Optic * xEUR)					,					
			"Base.Sight_KOBRA",	Optic		- (Optic * xOptic)		- (Optic * xSOV)					,					
			"Base.Scope_4xPSO",	Optic		- (Optic * xOptic)		- (Optic * xSOV)					,					
			"Base.Scope_12xPSO",	Optic		- (Optic * xOptic)		- (Optic * xSOV)					,					
			"Base.Scope_1-4x",	Optic		- (Optic * xOptic)		- (Optic * xUSA)					,					
			"Base.Scope_20x",	Optic		- (Optic * xOptic)		- (Optic * xUSA)					,					
			"Base.Sight_Thermal",	Optic		- (Optic * xOptic)		- (Optic * xUSA)		- (Optic * CIVxMIL)			,					
			"Base.Sight_Thermal_AK",	Optic		- (Optic * xOptic)		- (Optic * xSOV)		- (Optic * CIVxMIL)			,					
			"Base.Sight_Aimpoint",	Optic		- (Optic * xOptic)		- (Optic * xUSA)					,					
			"Base.Sight_Aimpoint_Dot",	Optic		- (Optic * xOptic)		- (Optic * xUSA)					,					
			"Base.Sight_Fiber_Shotgun",	Optic		- (Optic * xOptic)		- (Optic * xUSA)					,					
			"Base.Sight_Mepro_M21",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				- (Optic * x90)	,					
			"Base.Sight_Mepro_MOR",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				- (Optic * x90)	,					
			"Base.Sight_UH1",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				- (Optic * x90)	,					
			"Base.Sight_C79",	Optic		- (Optic * xOptic)		- (Optic * xEUR)					,					
			"Base.Sight_SUSAT",	Optic		- (Optic * xOptic)		- (Optic * xEUR)					,					
			"Base.Sight_Raven",	Optic		- (Optic * xOptic)		- (Optic * xUSA)					,					
			"Base.Sight_G28_Scope",	Optic		- (Optic * xOptic)		- (Optic * xEUR)					,					
			"Base.Sight_ACRO",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				- (Optic * x90)	,					
			"Base.Sight_MRO",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				- (Optic * x90)	,					
			"Base.Sight_SRO",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				- (Optic * x90)	,					
			"Base.Sight_Nikon",	Optic		- (Optic * xOptic)		- (Optic * xUSA)					,					
			"Base.Sight_M8",	Optic		- (Optic * xOptic)		- (Optic * xUSA)					,					
			"Base.Sight_VX3",	Optic		- (Optic * xOptic)		- (Optic * xUSA)					,					
			"Base.Sight_1P63",	Optic		- (Optic * xOptic)		- (Optic * xSOV)					,					
			"Base.Sight_Brownells",	Optic		- (Optic * xOptic)		- (Optic * xUSA)					,					
			"Base.Sight_L2",	Optic		- (Optic * xOptic)		- (Optic * xEUR)					,					
			"Base.Sight_Malcom",	Optic		- (Optic * xOptic)		- (Optic * xUSA)					,					
			"Base.Sight_LUX",	Optic		- (Optic * xOptic)		- (Optic * xUSA)					,					
			"Base.Sight_NO32",	Optic		- (Optic * xOptic)		- (Optic * xUSA)					,					
			"Base.Sight_PKAS",	Optic		- (Optic * xOptic)		- (Optic * xSOV)					,					
			"Base.Sight_PU",	Optic		- (Optic * xOptic)		- (Optic * xSOV)					,					
			"Base.Sight_XPS",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				- (Optic * x90)	,					
			"Base.Sight_PVS4",	Optic		- (Optic * xOptic)		- (Optic * xUSA)					,					
			"Base.Barrel_308",	w308		- (w308 * x308)	- (w308 * xBREAK)	- (w308 * xUSA)					,					
			"Base.Barrel_3006",	w3006		- (w3006 * x3006)	- (w3006 * xBREAK)	- (w3006 * xUSA)					,					
			"Base.Barrel_4570",	w4570		- (w4570 * x4570)	- (w4570 * xBREAK)	- (w4570 * xUSA)					,					
			"Base.Barrel_357",	w357		- (w357 * x357)	- (w357 * xBREAK)	- (w357 * xUSA)					,					
			"Base.Barrel_357_Short",	w357		- (w357 * x357)	- (w357 * xBREAK)	- (w357 * xUSA)					,					
			"Base.Barrel_45LC",	w45LC		- (w45LC * x45LC)	- (w45LC * xBREAK)	- (w45LC * xUSA)					,					
			"Base.Barrel_45LC_Short",	w45LC		- (w45LC * x45LC)	- (w45LC * xBREAK)	- (w45LC * xUSA)					,					
			"Base.38Speed",	StdMag	* w357	- (w357 * x357)	- (StdMag * xREV)						,					
			"Base.44Speed",	StdMag	* w44	- (w44 * x44)	- (StdMag * xREV)						,					
			"Base.SRM1208_Cylinder",	StdMag	* w12g	- (w12g * x12g)	- (StdMag * xREV)	- (StdMag * xUSA)			- (StdMag* w12g * HNTxNON)	- (StdMag* w12g * x90)	,					
			"Base.SRM1212_Cylinder",	StdMag	* w12g	- (w12g * x12g)	- (StdMag * xREV)	- (StdMag * xUSA)			- (StdMag* w12g * HNTxNON)	- (StdMag* w12g * x90)	,					
			"Base.SRM1216_Cylinder",	StdMag	* w12g	- (w12g * x12g)	- (StdMag * xREV)	- (StdMag * xUSA)			- (StdMag* w12g * HNTxNON)	- (StdMag* w12g * x90)	,					
			"Base.SIX12_Cylinder",	StdMag	* w12g	- (w12g * x12g)	- (StdMag * xREV)	- (StdMag * xUSA)			- (StdMag* w12g * HNTxNON)	- (StdMag* w12g * x90)	,					
			"Base.CP33Clip",	StdMag	* w22	- (w22 * x22)		- (StdMag * xUSA)			- (StdMag* w22 * HNTxNON)	- (StdMag* w22 * x90)	,					
			"Base.CP33_17MagBase",	ExtMag	* w22	- (w22 * x22)		- (ExtMag * xUSA)			- (ExtMag* w22 * HNTxNON)	- (ExtMag* w22 * x90)	,					
			"Base.22Clip",	StdMag	* w22	- (w22 * x22)							,					
			"Base.22ExtClip",	ExtMag	* w22	- (w22 * x22)							,					
			"Base.380Clip",	StdMag	* w380	- (w380 * x380)					- (StdMag* w380 * HNTxNON)		,					
			"Base.380ExtClip",	ExtMag	* w380	- (w380 * x380)					- (ExtMag* w380 * HNTxNON)		,					
			"Base.9mmClip",	StdMag	* w9	- (w9 * x9)							,					
			"Base.9mmExtClip",	ExtMag	* w9	- (w9 * x9)					- (ExtMag* w9 * HNTxNON)		,					
			"Base.45DSClip",	StdMag	* w45	- (w45 * x45)							,					
			"Base.45DSExtClip",	ExtMag	* w45	- (w45 * x45)					- (ExtMag* w45 * HNTxNON)		,					
			"Base.45Clip",	StdMag	* w45	- (w45 * x45)							,					
			"Base.45ExtClip",	ExtMag	* w45	- (w45 * x45)					- (ExtMag* w45 * HNTxNON)		,					
			"Base.44Clip",	StdMag	* w44	- (w44 * x44)							,					
			"Base.223StdClip",	StdMag	* w223	- (w223 * x223)							,					
			"Base.223ExtClip",	ExtMag	* w223	- (w223 * x223)					- (ExtMag* w223 * HNTxNON)		,					
			"Base.556Clip",	StdMag	* w556	- (w556 * x556)					- (StdMag* w556 * HNTxNON)		,					
			"Base.308StdClip",	StdMag	* w308	- (w308 * x308)							,					
			"Base.308ExtClip",	ExtMag	* w308	- (w308 * x308)					- (ExtMag* w308 * HNTxNON)		,					
			"Base.3006ExtClip",	ExtMag	* w3006	- (w3006 * x3006)		- (ExtMag * xUSA)			- (ExtMag* w3006 * HNTxNON)		,					
			"Base.SVDClip",	StdMag	* w762x54r	- (w762x54r * x762x54r)		- (StdMag * xSOV)					,					
			"Base.ASHClip",	StdMag	* wBMG	- (wBMG * xBMG)		- (StdMag * xSOV)		- (StdMag* wBMG * CIVxMIL)	- (StdMag* wBMG * HNTxNON)	- (StdMag* wBMG * x90)	,					
			"Base.M82Clip",	StdMag	* wBMG	- (wBMG * xBMG)		- (StdMag * xUSA)					,					
			"Base.M1Clip",	StdMag	* w3006	- (w3006 * x3006)		- (StdMag * xUSA)					,					
			"Base.SKSClip",	StdMag	* w762x39	- (w762x39 * x762x39)		- (StdMag * xSOV)					,					
			"Base.1903Clip",	StdMag	* w308	- (w308 * x308)							,					
			"Base.545StdClip",	StdMag	* w545x39	- (w545x39 * x545x39)		- (StdMag * xSOV)			- (StdMag* w545x39 * HNTxNON)		,					
			"Base.AKClip",	StdMag	* w762x39	- (w762x39 * x762x39)					- (StdMag* w762x39 * HNTxNON)		,					
			"Base.ASVALClip",	ExtMag	* w9	- (w9 * x9)		- (ExtMag * xSOV)					,					
			"Base.VSSClip",	StdMag	* w9	- (w9 * x9)		- (StdMag * xSOV)					,					
			"Base.57Clip",	StdMag	* w57	- (w57 * x57)		- (StdMag * xEUR)			- (StdMag* w57 * HNTxNON)	- (StdMag* w57 * x90)	,					
			"Base.P90Clip",	StdMag	* w57	- (w57 * x57)		- (StdMag * xEUR)			- (StdMag* w57 * HNTxNON)	- (StdMag* w57 * x90)	,					
			"Base.22Drum",	DrumMag	* w22	- (w22 * x22)					- (DrumMag* w22 * HNTxNON)		,					
			"Base.9mmDrum",	DrumMag	* w9	- (w9 * x9)					- (DrumMag* w9 * HNTxNON)		,					
			"Base.45Drum",	DrumMag	* w45	- (w45 * x45)					- (DrumMag* w45 * HNTxNON)		,					
			"Base.556Drum",	DrumMag	* w556	- (w556 * x556)					- (DrumMag* w556 * HNTxNON)		,					
			"Base.545Drum",	DrumMag	* w545x39	- (w545x39 * x545x39)		- (DrumMag * xSOV)			- (DrumMag* w545x39 * HNTxNON)		,					
			"Base.762Drum",	DrumMag	* w762x39	- (w762x39 * x762x39)					- (DrumMag* w762x39 * HNTxNON)		,					
			"Base.12gDrum",	DrumMag	* w12g	- (w12g * x12g)				- (DrumMag* w12g * CIVxMIL)	- (DrumMag* w12g * HNTxNON)		,					
			"Base.308Belt",	StdMag	* w308	- (w308 * x308)	- (wLMG * xLMG)			- (StdMag* w308 * CIVxMIL)	- (StdMag* w308 * HNTxNON)		,					
			"Base.556Belt",	StdMag	* w556	- (w556 * x556)	- (wLMG * xLMG)			- (StdMag* w556 * CIVxMIL)	- (StdMag* w556 * HNTxNON)		,					
			"Base.762x39Belt",	StdMag	* w762x39	- (w762x39 * x762x39)	- (wLMG * xLMG)			- (StdMag* w762x39 * CIVxMIL)	- (StdMag* w762x39 * HNTxNON)		,					
			"Base.762x54rBelt",	StdMag	* w762x54r	- (w762x54r * x762x54r)	- (wLMG * xLMG)	- (StdMag * xSOV)		- (StdMag* w762x54r * CIVxMIL)	- (StdMag* w762x54r * HNTxNON)		,					
			"Base.556MiniCan",	StdMag	* w556	- (w556 * x556)	- (wMINI * xMINI)	- (StdMag * xUSA)		- (StdMag* w556 * CIVxMIL)	- (StdMag* w556 * HNTxNON)		,					
			"Base.308MiniCan",	StdMag	* w308	- (w308 * x308)	- (wMINI * xMINI)	- (StdMag * xUSA)		- (StdMag* w308 * CIVxMIL)	- (StdMag* w308 * HNTxNON)		,					
			"Base.50MiniCan",	StdMag	* wBMG	- (wBMG * xBMG)	- (wMINI * xMINI)	- (StdMag * xUSA)		- (StdMag* wBMG * CIVxMIL)	- (StdMag* wBMG * HNTxNON)		,					
			"Base.M2A1_Tank",	ExtMag	* wFLAME	- (wFLAME * xFLAME)		- (ExtMag * xUSA)		- (ExtMag* wFLAME * CIVxMIL)	- (ExtMag* wFLAME * HNTxNON)		,					
			"Base.M2A1_Can",	StdMag	* wFLAME	- (wFLAME * xFLAME)		- (StdMag * xUSA)		- (StdMag* wFLAME * CIVxMIL)	- (StdMag* wFLAME * HNTxNON)		,					
			"Base.RussianMachete",	LgKnife	 * HNTx	- (LgKnife * xLgKnife)		- (LgKnife * xSOV)					,					
			"Base.BGMachete",	LgKnife	 * HNTx	- (LgKnife * xLgKnife)		- (LgKnife * xUSA)					,					
			"Base.RamboKnife",	LgKnife	 * HNTx	- (LgKnife * xLgKnife)		- (LgKnife * xUSA)					,					
			"Base.Butterfly",	SmKnife	 * HNTx	- (SmKnife * xSmKnife)		- (SmKnife * xPAC)					,					
			"Base.PushDagger",	SmKnife	 * HNTx	- (SmKnife * xSmKnife)		- (SmKnife * xUSA)					,					
			"Base.Karambit",	SmKnife	 * HNTx	- (SmKnife * xSmKnife)		- (SmKnife * xPAC)					,					
			"Base.Tactical_Axe",	Axe	 * HNTx	- (Axe * xAxe)		- (Axe * xUSA)					,					
			"Base.Tactical_Sickle",	Axe	 * HNTx	- (Axe * xAxe)		- (Axe * xUSA)					,					
			"Base.DingDong",	Blunt	 * HNTx	- (Blunt * xBlunt)		- (Blunt * xUSA)			- (Blunt * HNTx * HNTxNON)		,					
			"Base.MilitaryBaton",	Blunt	 * HNTx	- (Blunt * xBlunt)		- (Blunt * xUSA)			- (Blunt * HNTx * HNTxNON)		,					
			"Base.KillBill",	Sword	 * HNTx	- (Sword * xSword)		- (Sword * xPAC)			- (Sword * HNTx * HNTxNON)		,					
			"Base.CH_WarSword",	Sword	 * HNTx	- (Sword * xSword)		- (Sword * xPAC)			- (Sword * HNTx * HNTxNON)		,					
			"Base.Conan_Sword",	Sword	 * HNTx	- (Sword * xSword)		- (Sword * xUSA)			- (Sword * HNTx * HNTxNON)		,					
		}																
	},																	
	HuntAmmo = {																	
		rolls =	HNTRollAMMO	,														
		items = {																
			"Base.AmmoCan30_22",	AmmoCan		* w22	- (w22 * x22)						,					
			"Base.AmmoCan30_380",	AmmoCan		* w380	- (w380 * x380)				- (AmmoCan * HNTxNON)		,					
			"Base.AmmoCan30_57",	AmmoCan		* w57	- (w57 * x57)				- (AmmoCan * HNTxNON)	- (AmmoCan * x90)	,					
			"Base.AmmoCan30_9",	AmmoCan		* w9	- (w9 * x9)						,					
			"Base.AmmoCan30_38",	AmmoCan		* w357	- (w357 * x357)						,					
			"Base.AmmoCan30_357",	AmmoCan		* w357	- (w357 * x357)						,					
			"Base.AmmoCan30_45",	AmmoCan		* w45	- (w45 * x45)						,					
			"Base.AmmoCan30_44",	AmmoCan		* w44	- (w44 * x44)						,					
			"Base.AmmoCan30_45LC",	AmmoCan		* w45LC	- (w45LC * x45LC)						,					
			"Base.AmmoCan30_4570",	AmmoCan		* w4570	- (w4570 * x4570)						,					
			"Base.AmmoCan30_50MAG",	AmmoCan		* wBMG	- (wBMG * xBMG)					- (AmmoCan * x90)	,					
			"Base.AmmoCan50_223",	AmmoCan		* w223	- (w223 * x223)						,					
			"Base.AmmoCan50_556",	AmmoCan		* w556	- (w556 * x556)				- (AmmoCan * HNTxNON)		,					
			"Base.AmmoCan50_762x39",	AmmoCan		* w762x39	- (w762x39 * x762x39)				- (AmmoCan * HNTxNON)		,					
			"Base.AmmoCan50_545x39",	AmmoCan		* w545x39	- (w545x39 * x545x39)				- (AmmoCan * HNTxNON)		,					
			"Base.AmmoCan50_762x54r",	AmmoCan		* w762x54r	- (w762x54r * x762x54r)						,					
			"Base.AmmoCan50_308",	AmmoCan		* w308	- (w308 * x308)						,					
			"Base.AmmoCan50_3006",	AmmoCan		* w3006	- (w3006 * x3006)						,					
			"Base.AmmoCan50_410",	AmmoCan		* w45LC	- (w45LC * x45LC)						,					
			"Base.AmmoCan50_20",	AmmoCan		* w20g	- (w20g * x20g)						,					
			"Base.AmmoCan50_12",	AmmoCan		* w12g	- (w12g * x12g)						,					
			"Base.AmmoCan50_10",	AmmoCan		* w10g	- (w10g * x10g)						,					
			"Base.AmmoCan50_4",	AmmoCan		* w4g	- (w4g * x4g)						,					
			"Base.AmmoCan50_50",	AmmoCan		* wBMG	- (wBMG * xBMG)						,					
			"Base.AmmoCan50_HE",	AmmoCan		* wGREN	- (wGREN * xGREN)			- (AmmoCan * CIVxMIL)	- (AmmoCan * HNTxNON)		,					
			"Base.AmmoCan50_HE",	AmmoCan		* wGREN	- (wGREN * xGREN)			- (AmmoCan * CIVxMIL)	- (AmmoCan * HNTxNON)		,					
			"Base.AmmoCan50_INC",	AmmoCan		* wGREN	- (wGREN * xGREN)			- (AmmoCan * CIVxMIL)	- (AmmoCan * HNTxNON)		,					
			"Base.AmmoCan50_INC",	AmmoCan		* wGREN	- (wGREN * xGREN)			- (AmmoCan * CIVxMIL)	- (AmmoCan * HNTxNON)		,					
			"Base.BB177Box",	AmmoBox		* wBB	- (wBB * xBB)				- (AmmoBox * HNTxNON)		,					
			"Base.Bullets22Box",	AmmoBox		* w22	- (w22 * x22)						,					
			"Base.Bullets380Box",	AmmoBox		* w380	- (w380 * x380)				- (AmmoBox * HNTxNON)		,					
			"Base.Bullets57Box",	AmmoBox		* w57	- (w57 * x57)				- (AmmoBox * HNTxNON)	- (AmmoBox * x90)	,					
			"Base.Bullets9mmBox",	AmmoBox		* w9	- (w9 * x9)						,					
			"Base.Bullets38Box",	AmmoBox		* w357	- (w357 * x357)						,					
			"Base.Bullets357Box",	AmmoBox		* w357	- (w357 * x357)						,					
			"Base.Bullets45Box",	AmmoBox		* w45	- (w45 * x45)						,					
			"Base.Bullets44Box",	AmmoBox		* w44	- (w44 * x44)						,					
			"Base.Bullets45LCBox",	AmmoBox		* w45LC	- (w45LC * x45LC)						,					
			"Base.Bullets4570Box",	AmmoBox		* w4570	- (w4570 * x4570)						,					
			"Base.Bullets50MAGBox",	AmmoBox		* wBMG	- (wBMG * xBMG)					- (AmmoBox * x90)	,					
			"Base.223Box",	AmmoBox		* w223	- (w223 * x223)						,					
			"Base.556Box",	AmmoBox		* w556	- (w556 * x556)						,					
			"Base.762x39Box",	AmmoBox		* w762x39	- (w762x39 * x762x39)						,					
			"Base.545x39Box",	AmmoBox		* w545x39	- (w545x39 * x545x39)				- (AmmoBox * HNTxNON)		,					
			"Base.762x54rBox",	AmmoBox		* w762x54r	- (w762x54r * x762x54r)						,					
			"Base.308Box",	AmmoBox		* w308	- (w308 * x308)						,					
			"Base.3006Box",	AmmoBox		* w3006	- (w3006 * x3006)						,					
			"Base.410gShotgunShellsBox",	AmmoBox		* w45LC	- (w45LC * x45LC)						,					
			"Base.20gShotgunShellsBox",	AmmoBox		* w20g	- (w20g * x20g)						,					
			"Base.ShotgunShellsBox",	AmmoBox		* w12g	- (w12g * x12g)						,					
			"Base.10gShotgunShellsBox",	AmmoBox		* w10g	- (w10g * x10g)						,					
			"Base.4gShotgunShellsBox",	AmmoBox		* w4g	- (w4g * x4g)						,					
			"Base.50BMGBox",	AmmoBox		* wBMG	- (wBMG * xBMG)						,					
			"Base.Bolt_Bear",	AmmoBox		* wBOW	- (wBOW * xBOW)						,					
			"Base.Bolt_Bear_Pack",	AmmoBox		* wBOW	- (wBOW * xBOW)						,					
			"Base.40HERound",	AmmoBox		* wGREN	- (wGREN * xGREN)			- (AmmoBox * CIVxMIL)	- (AmmoBox * HNTxNON)		,					
			"Base.40INCRound",	AmmoBox		* wGREN	- (wGREN * xGREN)			- (AmmoBox * CIVxMIL)	- (AmmoBox * HNTxNON)		,					
			"Base.PolyCan_Red_SPASClip",	StdMag	 * PolyCan	* w12g	- (w12g * x12g)				- (StdMag * PolyCan * HNTxNON)		,					
			"Base.PolyCan_Red_12gDrum",	DrumMag	 * PolyCan	* w12g	- (w12g * x12g)				- (DrumMag * PolyCan * HNTxNON)		,					
			"Base.PolyCan_Red_38Speed",	StdMag	 * PolyCan	* w357	- (w357 * x357)	- (StdMag * xREV)					,					
			"Base.PolyCan_Red_44Speed",	StdMag	 * PolyCan	* w44	- (w44 * x44)	- (StdMag * xREV)					,					
			"Base.PolyCan_Blue_9mmClip",	StdMag	 * PolyCan	* w9	- (w9 * x9)						,					
			"Base.PolyCan_Blue_9mmExtClip",	ExtMag	 * PolyCan	* w9	- (w9 * x9)				- (ExtMag * PolyCan * HNTxNON)		,					
			"Base.PolyCan_Blue_9mmDrum",	DrumMag	 * PolyCan	* w9	- (w9 * x9)				- (DrumMag * PolyCan * HNTxNON)		,					
			"Base.PolyCan_Blue_45DSClip",	StdMag	 * PolyCan	* w45	- (w45 * x45)						,					
			"Base.PolyCan_Blue_45DSExtClip",	ExtMag	 * PolyCan	* w45	- (w45 * x45)				- (ExtMag * PolyCan * HNTxNON)		,					
			"Base.PolyCan_Blue_45Drum",	DrumMag	 * PolyCan	* w45	- (w45 * x45)				- (DrumMag * PolyCan * HNTxNON)		,					
			"Base.PolyCan_Blue_45Clip",	StdMag	 * PolyCan	* w45	- (w45 * x45)						,					
			"Base.PolyCan_Blue_45ExtClip",	ExtMag	 * PolyCan	* w45	- (w45 * x45)				- (ExtMag * PolyCan * HNTxNON)		,					
			"Base.PolyCan_Brown_556Clip",	StdMag	 * PolyCan	* w556	- (w556 * x556)				- (StdMag * PolyCan * HNTxNON)		,					
			"Base.PolyCan_Brown_556Drum",	DrumMag	 * PolyCan	* w556	- (w556 * x556)				- (DrumMag * PolyCan * HNTxNON)		,					
			"Base.PolyCan_Brown_AKClip",	StdMag	 * PolyCan	* w762x39	- (w762x39 * x762x39)				- (StdMag * PolyCan * HNTxNON)		,					
			"Base.PolyCan_Brown_762Drum",	DrumMag	 * PolyCan	* w762x39	- (w762x39 * x762x39)				- (DrumMag * PolyCan * HNTxNON)		,					
			"Base.PolyCan_Brown_545StdClip",	StdMag	 * PolyCan	* w545x39	- (w545x39 * x545x39)				- (StdMag * PolyCan * HNTxNON)		,					
			"Base.PolyCan_Brown_545Drum",	DrumMag	 * PolyCan	* w545x39	- (w545x39 * x545x39)				- (DrumMag * PolyCan * HNTxNON)		,					
			"Base.PolyCan_Beige_308StdClip",	StdMag	 * PolyCan	* w308	- (w308 * x308)						,					
			"Base.PolyCan_Beige_308ExtClip",	ExtMag	 * PolyCan	* w308	- (w308 * x308)				- (ExtMag * PolyCan * HNTxNON)		,					
			"Base.PolyCan_Beige_BMG",	StdMag	 * PolyCan	* wBMG	- (wBMG * xBMG)			- (StdMag * PolyCan * CIVxMIL)	- (StdMag * PolyCan * HNTxNON)		,					
			"Base.PolyCan_Beige_K11",	StdMag	 * PolyCan	* wGREN	- (wGREN * xGREN)	- (StdMag * xKOR)		- (StdMag * PolyCan * CIVxMIL)	- (StdMag * PolyCan * HNTxNON)	- (StdMag * x90)	,					
			"Base.PolyCan_Beige_SVDClip",	StdMag	 * PolyCan	* w762x54r	- (w762x54r * x762x54r)	- (StdMag * xSOV)					,					
			"Base.PolyCan_Beige_SKSClip",	StdMag	 * PolyCan	* w762x39	- (w762x39 * x762x39)	- (StdMag * xSOV)					,					
			"Base.PolyCan_Beige_M1Clip",	StdMag	 * PolyCan	* w3006	- (w3006 * x3006)	- (StdMag * xUSA)					,					
			"Base.PolyCan_Beige_1903Clip",	StdMag	 * PolyCan	* w308	- (w308 * x308)						,					
		}																
	},																	
																		
	SurplusGuns = {																	
		rolls =	SURRollGUN	,														
		items = {																
			"Base.UmarexSS",	wBB	 * SURx	- (wBB * xBB)		- (wBB * SURx * xUSA)			- (wBB * SURx * SURxNON)	- (wBB * SURx * x90)	,					
			"Base.Benjamin_M397",	wBB	 * SURx	- (wBB * xBB)		- (wBB * SURx * xUSA)					,					
			"Base.RWS_M34",	wBB	 * SURx	- (wBB * xBB)		- (wBB * SURx * xUSA)			- (wBB * SURx * SURxNON)	- (wBB * SURx * x90)	,					
			"Base.CP33",	w22	 * SURx	- (w22 * x22)	- (w22 * SURx * xSEMI)	- (w22 * SURx * xUSA)			- (w22 * SURx * SURxNON)	- (w22 * SURx * x90)	,					
			"Base.Ruger_MK4",	w22	 * SURx	- (w22 * x22)	- (w22 * SURx * xSEMI)	- (w22 * SURx * xUSA)				- (w22 * SURx * x90)	,					
			"Base.Buckmark",	w22	 * SURx	- (w22 * x22)	- (w22 * SURx * xSEMI)	- (w22 * SURx * xUSA)					,					
			"Base.Buckmark_Long",	w22	 * SURx	- (w22 * x22)	- (w22 * SURx * xSEMI)	- (w22 * SURx * xUSA)					,					
			"Base.Buckmark_Carbine",	w22	 * SURx	- (w22 * x22)	- (w22 * SURx * xSEMI)	- (w22 * SURx * xUSA)					,					
			"Base.HK4_22",	w22	 * SURx	- (w22 * x22)	- (w22 * SURx * xSEMI)	- (w22 * SURx * xEUR)			- (w22 * SURx * SURxNON)		,					
			"Base.ZIP22",	w22	 * SURx	- (w22 * x22)	- (w22 * SURx * xSEMI)	- (w22 * SURx * xUSA)			- (w22 * SURx * SURxNON)	- (w22 * SURx * x90)	,					
			"Base.Ruger_1022",	w22	 * SURx	- (w22 * x22)	- (w22 * SURx * xSEMI)	- (w22 * SURx * xUSA)					,					
			"Base.Marlin_M70",	w22	 * SURx	- (w22 * x22)	- (w22 * SURx * xSEMI)	- (w22 * SURx * xUSA)					,					
			"Base.Cricket_22",	w22	 * SURx	- (w22 * x22)	- (w22 * SURx * xBOLT)	- (w22 * SURx * xUSA)					,					
			"Base.AR7",	w22	 * SURx	- (w22 * x22)	- (w22 * SURx * xSEMI)	- (w22 * SURx * xUSA)					,					
			"Base.Calico_22LR",	w22	 * SURx	- (w22 * x22)	- (w22 * SURx * xSMG)	- (w22 * SURx * xUSA)					,					
			"Base.American180",	w22	 * SURx	- (w22 * x22)	- (w22 * SURx * xSMG)	- (w22 * SURx * xUSA)					,					
			"Base.Winchester1903",	w22	 * SURx	- (w22 * x22)	- (w22 * SURx * xLEVER)	- (w22 * SURx * xUSA)					,					
			"Base.G42",	w380	 * SURx	- (w380 * x380)	- (w380 * SURx * xSEMI)	- (w380 * SURx * xEUR)			- (w380 * SURx * SURxNON)	- (w380 * SURx * x90)	,					
			"Base.LCP380",	w380	 * SURx	- (w380 * x380)	- (w380 * SURx * xSEMI)	- (w380 * SURx * xUSA)			- (w380 * SURx * SURxNON)	- (w380 * SURx * x90)	,					
			"Base.BodyGuard380",	w380	 * SURx	- (w380 * x380)	- (w380 * SURx * xSEMI)	- (w380 * SURx * xUSA)			- (w380 * SURx * SURxNON)	- (w380 * SURx * x90)	,					
			"Base.Bersa85F",	w380	 * SURx	- (w380 * x380)	- (w380 * SURx * xSEMI)	- (w380 * SURx * xREST)					,					
			"Base.Colt1903",	w380	 * SURx	- (w380 * x380)	- (w380 * SURx * xSEMI)	- (w380 * SURx * xUSA)					,					
			"Base.Makarov380",	w380	 * SURx	- (w380 * x380)	- (w380 * SURx * xSEMI)	- (w380 * SURx * xSOV)					,					
			"Base.PPK",	w380	 * SURx	- (w380 * x380)	- (w380 * SURx * xSEMI)	- (w380 * SURx * xEUR)					,					
			"Base.HK4_380",	w380	 * SURx	- (w380 * x380)	- (w380 * SURx * xSEMI)	- (w380 * SURx * xEUR)			- (w380 * SURx * SURxNON)		,					
			"Base.VP70",	w380	 * SURx	- (w380 * x380)	- (w380 * SURx * xSMG)	- (w380 * SURx * xEUR)					,					
			"Base.VP70_Stock",	w380	 * SURx	- (w380 * x380)	- (w380 * SURx * xSMG)	- (w380 * SURx * xEUR)					,					
			"Base.Vz61_Fixed",	w380	 * SURx	- (w380 * x380)	- (w380 * SURx * xSMG)	- (w380 * SURx * xCZE)					,					
			"Base.Vz61_Fold",	w380	 * SURx	- (w380 * x380)	- (w380 * SURx * xSMG)	- (w380 * SURx * xCZE)					,					
			"Base.BT380_Stock",	w380	 * SURx	- (w380 * x380)	- (w380 * SURx * xSEMI)	- (w380 * SURx * xEUR)			- (w380 * SURx * SURxNON)	- (w380 * SURx * x90)	,					
			"Base.FN_57", 	w57	 * SURx	- (w57 * x57)	- (w57 * SURx * xSEMI)	- (w57 * SURx * xEUR)	- (w57 * SURx * CIVxLEO)		- (w57 * SURx * SURxNON)	- (w57 * SURx * x90)	,					
			"Base.FN_57_MK2", 	w57	 * SURx	- (w57 * x57)	- (w57 * SURx * xSEMI)	- (w57 * SURx * xEUR)	- (w57 * SURx * CIVxLEO)		- (w57 * SURx * SURxNON)	- (w57 * SURx * x90)	,					
			"Base.FN_P90",	w57	 * SURx	- (w57 * x57)	- (w57 * SURx * xSMG)	- (w57 * SURx * xEUR)	- (w57 * SURx * CIVxLEO)		- (w57 * SURx * SURxNON)	- (w57 * SURx * x90)	,					
			"Base.FN_PS90",	w57	 * SURx	- (w57 * x57)	- (w57 * SURx * xSMG)	- (w57 * SURx * xEUR)	- (w57 * SURx * CIVxLEO)		- (w57 * SURx * SURxNON)	- (w57 * SURx * x90)	,					
			"Base.CZ75",	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSEMI)	- (w9 * SURx * xCZE)					,					
			"Base.G17",	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSEMI)	- (w9 * SURx * xEUR)		- (w9 * SURx * CIVxMIL)	- (w9 * SURx * SURxNON)		,					
			"Base.G18",	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSMG)	- (w9 * SURx * xEUR)		- (w9 * SURx * CIVxMIL)	- (w9 * SURx * SURxNON)		,					
			"Base.G34", 	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSEMI)	- (w9 * SURx * xUSA)			- (w9 * SURx * SURxNON)	- (w9 * SURx * x90)	,					
			"Base.K5",	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSEMI)	- (w9 * SURx * xKOR)		- (w9 * SURx * CIVxMIL)	- (w9 * SURx * SURxNON)		,					
			"Base.M9",	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSEMI)	- (w9 * SURx * xEUR)					,					
			"Base.M9A3",	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSEMI)	- (w9 * SURx * xEUR)				- (w9 * SURx * x90)	,					
			"Base.B93R",	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSMG)	- (w9 * SURx * xEUR)		- (w9 * SURx * CIVxMIL)	- (w9 * SURx * SURxNON)		,					
			"Base.M5906",	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSEMI)	- (w9 * SURx * xUSA)					,					
			"Base.XD9",	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSEMI)	- (w9 * SURx * xUSA)	- (w9 * SURx * CIVxLEO)		- (w9 * SURx * SURxNON)	- (w9 * SURx * x90)	,					
			"Base.MP9",	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSEMI)	- (w9 * SURx * xUSA)	- (w9 * SURx * CIVxLEO)		- (w9 * SURx * SURxNON)	- (w9 * SURx * x90)	,					
			"Base.P226",	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSEMI)	- (w9 * SURx * xEUR)	- (w9 * SURx * CIVxLEO)		- (w9 * SURx * SURxNON)		,					
			"Base.APS",	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSMG)	- (w9 * SURx * xSOV)					,					
			"Base.Makarov",	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSEMI)	- (w9 * SURx * xSOV)					,					
			"Base.PB",	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSEMI)	- (w9 * SURx * xSOV)					,					
			"Base.Luger",	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSEMI)	- (w9 * SURx * xEUR)					,					
			"Base.Luger_WW1",	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSEMI)	- (w9 * SURx * xEUR)					,					
			"Base.Luger_Carbine",	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSEMI)	- (w9 * SURx * xEUR)					,					
			"Base.UZI", 	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSMG)	- (w9 * SURx * xREST)					,					
			"Base.UZI_Wood",	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSMG)	- (w9 * SURx * xREST)					,					
			"Base.UZI_Micro",	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSMG)	- (w9 * SURx * xREST)					,					
			"Base.BT9_Fold",	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSMG)	- (w9 * SURx * xEUR)			- (w9 * SURx * SURxNON)	- (w9 * SURx * x90)	,					
			"Base.UMP9_Stock",	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSMG)	- (w9 * SURx * xEUR)	- (w9 * SURx * CIVxLEO)		- (w9 * SURx * SURxNON)	- (w9 * SURx * x90)	,					
			"Base.SUB2000",	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSEMI)	- (w9 * SURx * xUSA)			- (w9 * SURx * SURxNON)	- (w9 * SURx * x90)	,					
			"Base.MP5_Fixed",	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSMG)	- (w9 * SURx * xEUR)	- (w9 * SURx * CIVxLEO)		- (w9 * SURx * SURxNON)		,					
			"Base.MP5_Stock",	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSMG)	- (w9 * SURx * xEUR)	- (w9 * SURx * CIVxLEO)		- (w9 * SURx * SURxNON)		,					
			"Base.MP5SD6_Fixed",	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSMG)	- (w9 * SURx * xEUR)		- (w9 * SURx * CIVxMIL)	- (w9 * SURx * SURxNON)		,					
			"Base.MP5SD6_Stock",	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSMG)	- (w9 * SURx * xEUR)		- (w9 * SURx * CIVxMIL)	- (w9 * SURx * SURxNON)		,					
			"Base.EVO_Fold",	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSMG)	- (w9 * SURx * xCZE)			- (w9 * SURx * SURxNON)	- (w9 * SURx * x90)	,					
			"Base.K7_Stock",	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSMG)	- (w9 * SURx * xKOR)		- (w9 * SURx * CIVxMIL)	- (w9 * SURx * SURxNON)		,					
			"Base.AUG9",	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSMG)	- (w9 * SURx * xEUR)		- (w9 * SURx * CIVxMIL)	- (w9 * SURx * SURxNON)		,					
			"Base.KG9",	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSMG)	- (w9 * SURx * xUSA)					,					
			"Base.Calico_M900_Fold",	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSMG)	- (w9 * SURx * xUSA)					,					
			"Base.Calico_M950_Pistol",	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSMG)	- (w9 * SURx * xUSA)					,					
			"Base.VSS",	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSMG)	- (w9 * SURx * xSOV)					,					
			"Base.ASVAL",	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSMG)	- (w9 * SURx * xSOV)					,					
			"Base.M1Carbine",	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSEMI)	- (w9 * SURx * xUSA)					,					
			"Base.M2Carbine",	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSMG)	- (w9 * SURx * xUSA)					,					
			"Base.M635",	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSMG)	- (w9 * SURx * xUSA)	- (w9 * SURx * CIVxLEO)		- (w9 * SURx * SURxNON)		,					
			"Base.M635S",	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSMG)	- (w9 * SURx * xUSA)	- (w9 * SURx * CIVxLEO)		- (w9 * SURx * SURxNON)		,					
			"Base.M635SD",	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSMG)	- (w9 * SURx * xUSA)		- (w9 * SURx * CIVxMIL)	- (w9 * SURx * SURxNON)		,					
			"Base.MP7",	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSMG)	- (w9 * SURx * xEUR)	- (w9 * SURx * CIVxLEO)		- (w9 * SURx * SURxNON)	- (w9 * SURx * x90)	,					
			"Base.Jatimatic",	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSMG)	- (w9 * SURx * xEUR)					,					
			"Base.Sten",	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSMG)	- (w9 * SURx * xEUR)					,					
			"Base.Sten_MK2",	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSMG)	- (w9 * SURx * xEUR)					,					
			"Base.Sten_MK2SD",	w9	 * SURx	- (w9 * x9)	- (w9 * SURx * xSMG)	- (w9 * SURx * xEUR)					,					
			"Base.M5238",	w357	 * SURx	- (w357 * x357)	- (w357 * SURx * xSEMI)	- (w357 * SURx * xUSA)					,					
			"Base.Taurus856",	w357	 * SURx	- (w357 * x357)	- (w357 * SURx * xREV)	- (w357 * SURx * xREST)			- (w357 * SURx * SURxNON)	- (w357 * SURx * x90)	,					
			"Base.Colt_Service38",	w357	 * SURx	- (w357 * x357)	- (w357 * SURx * xREV)	- (w357 * SURx * xUSA)					,					
			"Base.GP100_2",	w357	 * SURx	- (w357 * x357)	- (w357 * SURx * xREV)	- (w357 * SURx * xUSA)					,					
			"Base.GP100_4",	w357	 * SURx	- (w357 * x357)	- (w357 * SURx * xREV)	- (w357 * SURx * xUSA)					,					
			"Base.GP100_6",	w357	 * SURx	- (w357 * x357)	- (w357 * SURx * xREV)	- (w357 * SURx * xUSA)					,					
			"Base.K6S",	w357	 * SURx	- (w357 * x357)	- (w357 * SURx * xREV)	- (w357 * SURx * xUSA)			- (w357 * SURx * SURxNON)	- (w357 * SURx * x90)	,					
			"Base.M1936",	w357	 * SURx	- (w357 * x357)	- (w357 * SURx * xREV)	- (w357 * SURx * xUSA)					,					
			"Base.NEF_Handi_38",	w357	 * SURx	- (w357 * x357)	- (w357 * SURx * xBREAK)	- (w357 * SURx * xUSA)					,					
			"Base.Marlin_1894",	w357	 * SURx	- (w357 * x357)	- (w357 * SURx * xLEVER)	- (w357 * SURx * xUSA)					,					
			"Base.CZ97B",	w45	 * SURx	- (w45 * x45)	- (w45 * SURx * xSEMI)	- (w45 * SURx * xCZE)			- (w45 * SURx * SURxNON)	- (w45 * SURx * x90)	,					
			"Base.G21",	w45	 * SURx	- (w45 * x45)	- (w45 * SURx * xSEMI)	- (w45 * SURx * xEUR)			- (w45 * SURx * SURxNON)		,					
			"Base.XD4",	w45	 * SURx	- (w45 * x45)	- (w45 * SURx * xSEMI)	- (w45 * SURx * xUSA)			- (w45 * SURx * SURxNON)	- (w45 * SURx * x90)	,					
			"Base.MP45",	w45	 * SURx	- (w45 * x45)	- (w45 * SURx * xSEMI)	- (w45 * SURx * xUSA)			- (w45 * SURx * SURxNON)	- (w45 * SURx * x90)	,					
			"Base.P220",	w45	 * SURx	- (w45 * x45)	- (w45 * SURx * xSEMI)	- (w45 * SURx * xEUR)			- (w45 * SURx * SURxNON)		,					
			"Base.M4506",	w45	 * SURx	- (w45 * x45)	- (w45 * SURx * xSEMI)	- (w45 * SURx * xUSA)					,					
			"Base.PARA1911",	w45	 * SURx	- (w45 * x45)	- (w45 * SURx * xSEMI)	- (w45 * SURx * xUSA)					,					
			"Base.AMT1911",	w45	 * SURx	- (w45 * x45)	- (w45 * SURx * xSEMI)	- (w45 * SURx * xUSA)					,					
			"Base.AMT1911_Long",	w45	 * SURx	- (w45 * x45)	- (w45 * SURx * xSEMI)	- (w45 * SURx * xUSA)					,					
			"Base.M1911_Carbine",	w45	 * SURx	- (w45 * x45)	- (w45 * SURx * xSEMI)	- (w45 * SURx * xUSA)					,					
			"Base.Colt1911",	w45	 * SURx	- (w45 * x45)	- (w45 * SURx * xSEMI)	- (w45 * SURx * xUSA)					,					
			"Base.Colt_Kimber",	w45	 * SURx	- (w45 * x45)	- (w45 * SURx * xSEMI)	- (w45 * SURx * xUSA)			- (w45 * SURx * SURxNON)	- (w45 * SURx * x90)	,					
			"Base.Colt_Commander",	w45	 * SURx	- (w45 * x45)	- (w45 * SURx * xSEMI)	- (w45 * SURx * xUSA)					,					
			"Base.UMP45_Stock",	w45	 * SURx	- (w45 * x45)	- (w45 * SURx * xSMG)	- (w45 * SURx * xEUR)	- (w45 * SURx * CIVxLEO)		- (w45 * SURx * SURxNON)	- (w45 * SURx * x90)	,					
			"Base.MAC10_Fold",	w45	 * SURx	- (w45 * x45)	- (w45 * SURx * xSMG)	- (w45 * SURx * xUSA)					,					
			"Base.KRISS_Stock",	w45	 * SURx	- (w45 * x45)	- (w45 * SURx * xSMG)	- (w45 * SURx * xUSA)			- (w45 * SURx * SURxNON)	- (w45 * SURx * x90)	,					
			"Base.Commando",	w45	 * SURx	- (w45 * x45)	- (w45 * SURx * xBOLT)	- (w45 * SURx * xEUR)					,					
			"Base.Thompson",	w45	 * SURx	- (w45 * x45)	- (w45 * SURx * xSMG)	- (w45 * SURx * xUSA)					,					
			"Base.Thompson_1928",	w45	 * SURx	- (w45 * x45)	- (w45 * SURx * xSMG)	- (w45 * SURx * xUSA)					,					
			"Base.M2Hyde",	w45	 * SURx	- (w45 * x45)	- (w45 * SURx * xSMG)	- (w45 * SURx * xUSA)					,					
			"Base.Model55_Fold",	w45	 * SURx	- (w45 * x45)	- (w45 * SURx * xSMG)	- (w45 * SURx * xUSA)					,					
			"Base.Model50",	w45	 * SURx	- (w45 * x45)	- (w45 * SURx * xSMG)	- (w45 * SURx * xUSA)					,					
			"Base.Colt_Navy_1851",	w44	 * SURx	- (w44 * x44)	- (w44 * SURx * xREV)	- (w44 * SURx * xUSA)					,					
			"Base.M29_44",	w44	 * SURx	- (w44 * x44)	- (w44 * SURx * xREV)	- (w44 * SURx * xUSA)					,					
			"Base.M29_44Carbine",	w44	 * SURx	- (w44 * x44)	- (w44 * SURx * xREV)	- (w44 * SURx * xUSA)					,					
			"Base.Automag",	w44	 * SURx	- (w44 * x44)	- (w44 * SURx * xSEMI)	- (w44 * SURx * xUSA)					,					
			"Base.DEagle",	w44	 * SURx	- (w44 * x44)	- (w44 * SURx * xSEMI)	- (w44 * SURx * xISR)					,					
			"Base.DEagle_Long",	w44	 * SURx	- (w44 * x44)	- (w44 * SURx * xSEMI)	- (w44 * SURx * xISR)					,					
			"Base.Winchester1866",	w45LC	 * SURx	- (w44 * x44)	- (w45LC * SURx * xLEVER)	- (w45LC * SURx * xUSA)					,					
			"Base.Win_1894",	w44	 * SURx	- (w44 * x44)	- (w44 * SURx * xLEVER)	- (w44 * SURx * xUSA)					,					
			"Base.Colt_Service45",	w45LC	 * SURx	- (w45LC * x45LC)	- (w45LC * SURx * xREV)	- (w45LC * SURx * xUSA)					,					
			"Base.Judge_45LC",	w45LC	 * SURx	- (w45LC * x45LC)	- (w45LC * SURx * xREV)	- (w45LC * SURx * xREST)			- (w45LC * SURx * SURxNON)	- (w45LC * SURx * x90)	,					
			"Base.Judge513_45LC",	w45LC	 * SURx	- (w45LC * x45LC)	- (w45LC * SURx * xREV)	- (w45LC * SURx * xREST)			- (w45LC * SURx * SURxNON)	- (w45LC * SURx * x90)	,					
			"Base.Judge513_Long_45LC",	w45LC	 * SURx	- (w45LC * x45LC)	- (w45LC * SURx * xREV)	- (w45LC * SURx * xREST)			- (w45LC * SURx * SURxNON)	- (w45LC * SURx * x90)	,					
			"Base.TXS_804_45LC",	w45LC	 * SURx	- (w45LC * x45LC)	- (w45LC * SURx * xREV)	- (w45LC * SURx * xREST)					,					
			"Base.Winchester1873",	w45LC	 * SURx	- (w45LC * x45LC)	- (w45LC * SURx * xLEVER)	- (w45LC * SURx * xUSA)					,					
			"Base.Sako85",	w223	 * SURx	- (w223 * x223)	- (w223 * SURx * xBOLT)	- (w223 * SURx * xEUR)			- (w223 * SURx * SURxNON)		,					
			"Base.MINI14",	w223	 * SURx	- (w223 * x223)	- (w223 * SURx * xSEMI)	- (w223 * SURx * xUSA)					,					
			"Base.MINI14_T",	w223	 * SURx	- (w223 * x223)	- (w223 * SURx * xSEMI)	- (w223 * SURx * xUSA)	- (w223 * SURx * CIVxLEO)		- (w223 * SURx * SURxNON)		,					
			"Base.Viper",	w223	 * SURx	- (w223 * x223)	- (w223 * SURx * xLEVER)	- (w223 * SURx * xREST)			- (w223 * SURx * SURxNON)	- (w223 * SURx * x90)	,					
			"Base.CAR15SMG",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xAUTO)	- (w556 * SURx * xUSA)	- (w556 * SURx * CIVxLEO)				,					
			"Base.CAR15_Survival",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xAUTO)	- (w556 * SURx * xUSA)	- (w556 * SURx * CIVxLEO)				,					
			"Base.XM8Compact_Pistol",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xAUTO)	- (w556 * SURx * xEUR)		- (w556 * SURx * CIVxMIL)	- (w556 * SURx * SURxNON)	- (w556 * SURx * x90)	,					
			"Base.XM8",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xAUTO)	- (w556 * SURx * xEUR)		- (w556 * SURx * CIVxMIL)	- (w556 * SURx * SURxNON)	- (w556 * SURx * x90)	,					
			"Base.SCARSC_Stock",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xAUTO)	- (w556 * SURx * xEUR)		- (w556 * SURx * CIVxMIL)	- (w556 * SURx * SURxNON)	- (w556 * SURx * x90)	,					
			"Base.SCARL",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xAUTO)	- (w556 * SURx * xEUR)		- (w556 * SURx * CIVxMIL)	- (w556 * SURx * SURxNON)	- (w556 * SURx * x90)	,					
			"Base.G33",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xAUTO)	- (w556 * SURx * xEUR)		- (w556 * SURx * CIVxMIL)			,					
			"Base.MK18",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xAUTO)	- (w556 * SURx * xEUR)		- (w556 * SURx * CIVxMIL)		- (w556 * SURx * x90)	,					
			"Base.M16A1",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xAUTO)	- (w556 * SURx * xUSA)					,					
			"Base.M16A2",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xAUTO)	- (w556 * SURx * xUSA)					,					
			"Base.M16A3",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xAUTO)	- (w556 * SURx * xUSA)					,					
			"Base.M723",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xAUTO)	- (w556 * SURx * xUSA)					,					
			"Base.XM117",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xAUTO)	- (w556 * SURx * xUSA)		- (w556 * SURx * CIVxMIL)		- (w556 * SURx * x90)	,					
			"Base.H416",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xAUTO)	- (w556 * SURx * xEUR)		- (w556 * SURx * CIVxMIL)	- (w556 * SURx * SURxNON)	- (w556 * SURx * x90)	,					
			"Base.M4",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xAUTO)	- (w556 * SURx * xUSA)		- (w556 * SURx * CIVxMIL)			,					
			"Base.M4A1",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xAUTO)	- (w556 * SURx * xUSA)		- (w556 * SURx * CIVxMIL)			,					
			"Base.ADAR",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xAUTO)	- (w556 * SURx * xSOV)			- (w556 * SURx * SURxNON)	- (w556 * SURx * x90)	,					
			"Base.K2C1_PH",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xAUTO)	- (w556 * SURx * xKOR)		- (w556 * SURx * CIVxMIL)		- (w556 * SURx * x90)	,					
			"Base.K1DEV",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xAUTO)	- (w556 * SURx * xKOR)		- (w556 * SURx * CIVxMIL)			,					
			"Base.K2_C1",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xAUTO)	- (w556 * SURx * xKOR)		- (w556 * SURx * CIVxMIL)		- (w556 * SURx * x90)	,					
			"Base.K2_1",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xAUTO)	- (w556 * SURx * xKOR)		- (w556 * SURx * CIVxMIL)			,					
			"Base.K2_203",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xAUTO)	- (w556 * SURx * xKOR)		- (w556 * SURx * CIVxMIL)			,					
			"Base.K1_1",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xAUTO)	- (w556 * SURx * xKOR)		- (w556 * SURx * CIVxMIL)			,					
			"Base.DR_200",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xAUTO)	- (w556 * SURx * xKOR)	- (w556 * SURx * CIVxLEO)			- (w556 * SURx * x90)	,					
			"Base.LVOA_C",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xSEMI)	- (w556 * SURx * xUSA)			- (w556 * SURx * SURxNON)	- (w556 * SURx * x90)	,					
			"Base.MCX_Spear",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xSEMI)	- (w556 * SURx * xEUR)			- (w556 * SURx * SURxNON)	- (w556 * SURx * x90)	,					
			"Base.ColtM16",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xAUTO)	- (w556 * SURx * xUSA)					,					
			"Base.M16Wood",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xAUTO)	- (w556 * SURx * xUSA)					,					
			"Base.M16Tape",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xAUTO)	- (w556 * SURx * xUSA)					,					
			"Base.FAMAS",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xAUTO)	- (w556 * SURx * xEUR)		- (w556 * SURx * CIVxMIL)			,					
			"Base.FAMAS_G2",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xAUTO)	- (w556 * SURx * xEUR)		- (w556 * SURx * CIVxMIL)			,					
			"Base.FAMAS_Felin",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xAUTO)	- (w556 * SURx * xEUR)		- (w556 * SURx * CIVxMIL)			,					
			"Base.AUG",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xAUTO)	- (w556 * SURx * xEUR)			- (w556 * SURx * SURxNON)		,					
			"Base.M85_Stock",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xAUTO)	- (w556 * SURx * xSOV)					,					
			"Base.AK74",	w545x39	 * SURx	- (w545x39 * x545x39)	- (w545x39 * SURx * xAUTO)	- (w545x39 * SURx * xSOV)					,					
			"Base.AKS74",	w545x39	 * SURx	- (w545x39 * x545x39)	- (w545x39 * SURx * xAUTO)	- (w545x39 * SURx * xSOV)					,					
			"Base.AKS74U",	w545x39	 * SURx	- (w545x39 * x545x39)	- (w545x39 * SURx * xAUTO)	- (w545x39 * SURx * xSOV)					,					
			"Base.AK74_Alpha",	w545x39	 * SURx	- (w545x39 * x545x39)	- (w545x39 * SURx * xAUTO)	- (w545x39 * SURx * xSOV)		- (w545x39 * SURx * CIVxMIL)	- (w545x39 * SURx * SURxNON)	- (w545x39 * SURx * x90)	,					
			"Base.AK12",	w545x39	 * SURx	- (w545x39 * x545x39)	- (w545x39 * SURx * xAUTO)	- (w545x39 * SURx * xSOV)		- (w545x39 * SURx * CIVxMIL)	- (w545x39 * SURx * SURxNON)	- (w545x39 * SURx * x90)	,					
			"Base.AK12_New",	w545x39	 * SURx	- (w545x39 * x545x39)	- (w545x39 * SURx * xAUTO)	- (w545x39 * SURx * xSOV)		- (w545x39 * SURx * CIVxMIL)	- (w545x39 * SURx * SURxNON)	- (w545x39 * SURx * x90)	,					
			"Base.RPK74",	w545x39	 * SURx	- (w545x39 * x545x39)	- (w545x39 * SURx * xLMG)	- (w545x39 * SURx * xSOV)					,					
			"Base.RPK16",	w545x39	 * SURx	- (w545x39 * x545x39)	- (w545x39 * SURx * xLMG)	- (w545x39 * SURx * xSOV)				- (w545x39 * SURx * x90)	,					
			"Base.L85",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xAUTO)	- (w556 * SURx * xEUR)		- (w556 * SURx * CIVxMIL)			,					
			"Base.L85A2",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xAUTO)	- (w556 * SURx * xEUR)		- (w556 * SURx * CIVxMIL)		- (w556 * SURx * x90)	,					
			"Base.L86",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xAUTO)	- (w556 * SURx * xEUR)		- (w556 * SURx * CIVxMIL)			,					
			"Base.L22",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xAUTO)	- (w556 * SURx * xEUR)		- (w556 * SURx * CIVxMIL)		- (w556 * SURx * x90)	,					
			"Base.F2000",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xAUTO)	- (w556 * SURx * xEUR)			- (w556 * SURx * SURxNON)	- (w556 * SURx * x90)	,					
			"Base.Tavor",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xAUTO)	- (w556 * SURx * xISR)			- (w556 * SURx * SURxNON)	- (w556 * SURx * x90)	,					
			"Base.AR18",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xAUTO)	- (w556 * SURx * xUSA)					,					
			"Base.Type20",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xAUTO)	- (w556 * SURx * xPAC)		- (w556 * SURx * CIVxMIL)		- (w556 * SURx * x90)	,					
			"Base.Type89",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xAUTO)	- (w556 * SURx * xPAC)		- (w556 * SURx * CIVxMIL)			,					
			"Base.QBZ_95",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xAUTO)	- (w556 * SURx * xPAC)		- (w556 * SURx * CIVxMIL)		- (w556 * SURx * x90)	,					
			"Base.XM8LMG",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xLMG)	- (w556 * SURx * xEUR)		- (w556 * SURx * CIVxMIL)	- (w556 * SURx * SURxNON)	- (w556 * SURx * x90)	,					
			"Base.M249",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xLMG)	- (w556 * SURx * xUSA)		- (w556 * SURx * CIVxMIL)			,					
			"Base.M249E3",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xLMG)	- (w556 * SURx * xUSA)		- (w556 * SURx * CIVxMIL)		- (w556 * SURx * x90)	,					
			"Base.K3LMG",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xLMG)	- (w556 * SURx * xKOR)		- (w556 * SURx * CIVxMIL)			,					
			"Base.AK47",	w762x39	 * SURx	- (w762x39 * x762x39)	- (w762x39 * SURx * xAUTO)	- (w762x39 * SURx * xSOV)					,					
			"Base.AKM",	w762x39	 * SURx	- (w762x39 * x762x39)	- (w762x39 * SURx * xAUTO)	- (w762x39 * SURx * xSOV)					,					
			"Base.AK103",	w762x39	 * SURx	- (w762x39 * x762x39)	- (w762x39 * SURx * xAUTO)	- (w762x39 * SURx * xSOV)				- (w762x39 * SURx * x90)	,					
			"Base.MD65_Stock",	w762x39	 * SURx	- (w762x39 * x762x39)	- (w762x39 * SURx * xAUTO)	- (w762x39 * SURx * xSOV)					,					
			"Base.AKMS_Stock",	w762x39	 * SURx	- (w762x39 * x762x39)	- (w762x39 * SURx * xAUTO)	- (w762x39 * SURx * xSOV)					,					
			"Base.Vz58",	w762x39	 * SURx	- (w762x39 * x762x39)	- (w762x39 * SURx * xAUTO)	- (w762x39 * SURx * xCZE)					,					
			"Base.Vz58_Stock",	w762x39	 * SURx	- (w762x39 * x762x39)	- (w762x39 * SURx * xAUTO)	- (w762x39 * SURx * xCZE)					,					
			"Base.Vz58_Mini_Stock",	w762x39	 * SURx	- (w762x39 * x762x39)	- (w762x39 * SURx * xAUTO)	- (w762x39 * SURx * xCZE)					,					
			"Base.SKS",	w762x39	 * SURx	- (w762x39 * x762x39)	- (w762x39 * SURx * xSEMI)	- (w762x39 * SURx * xSOV)					,					
			"Base.SKS_PARA",	w762x39	 * SURx	- (w762x39 * x762x39)	- (w762x39 * SURx * xSEMI)	- (w762x39 * SURx * xPAC)					,					
			"Base.MK47",	w762x39	 * SURx	- (w762x39 * x762x39)	- (w762x39 * SURx * xSEMI)	- (w762x39 * SURx * xUSA)			- (w762x39 * SURx * SURxNON)	- (w762x39 * SURx * x90)	,					
			"Base.AK308",	w308	 * SURx	- (w308 * x308)	- (w308 * SURx * xAUTO)	- (w308 * SURx * xSOV)			- (w308 * SURx * SURxNON)	- (w308 * SURx * x90)	,					
			"Base.SCARH",	w308	 * SURx	- (w308 * x308)	- (w308 * SURx * xAUTO)	- (w308 * SURx * xEUR)		- (w308 * SURx * CIVxMIL)	- (w308 * SURx * SURxNON)	- (w308 * SURx * x90)	,					
			"Base.SCAR20",	w308	 * SURx	- (w308 * x308)	- (w308 * SURx * xAUTO)	- (w308 * SURx * xEUR)		- (w308 * SURx * CIVxMIL)	- (w308 * SURx * SURxNON)	- (w308 * SURx * x90)	,					
			"Base.G28",	w308	 * SURx	- (w308 * x308)	- (w308 * SURx * xAUTO)	- (w308 * SURx * xEUR)		- (w308 * SURx * CIVxMIL)		- (w308 * SURx * x90)	,					
			"Base.G3",	w308	 * SURx	- (w308 * x308)	- (w308 * SURx * xAUTO)	- (w308 * SURx * xEUR)		- (w308 * SURx * CIVxMIL)			,					
			"Base.Type64",	w308	 * SURx	- (w308 * x308)	- (w308 * SURx * xAUTO)	- (w308 * SURx * xPAC)					,					
			"Base.FAL",	w308	 * SURx	- (w308 * x308)	- (w308 * SURx * xAUTO)	- (w308 * SURx * xEUR)					,					
			"Base.FAL_PARA_Stock",	w308	 * SURx	- (w308 * x308)	- (w308 * SURx * xAUTO)	- (w308 * SURx * xEUR)					,					
			"Base.FN_FNC",	w308	 * SURx	- (w308 * x308)	- (w308 * SURx * xAUTO)	- (w308 * SURx * xEUR)					,					
			"Base.WA2000",	w308	 * SURx	- (w308 * x308)	- (w308 * SURx * xBOLT)	- (w308 * SURx * xEUR)			- (w308 * SURx * SURxNON)		,					
			"Base.SVD",	w762x54r	 * SURx	- (w762x54r * x762x54r)	- (w762x54r * SURx * xSEMI)	- (w762x54r * SURx * xSOV)					,					
			"Base.SVDK",	w762x54r	 * SURx	- (w762x54r * x762x54r)	- (w762x54r * SURx * xSEMI)	- (w762x54r * SURx * xSOV)					,					
			"Base.M14EBR",	w308	 * SURx	- (w308 * x308)	- (w308 * SURx * xAUTO)	- (w308 * SURx * xUSA)	- (w308 * SURx * CIVxLEO)		- (w308 * SURx * SURxNON)	- (w308 * SURx * x90)	,					
			"Base.M14",	w308	 * SURx	- (w308 * x308)	- (w308 * SURx * xAUTO)	- (w308 * SURx * xUSA)					,					
			"Base.K14",	w308	 * SURx	- (w308 * x308)	- (w308 * SURx * xBOLT)	- (w308 * SURx * xKOR)		- (w308 * SURx * CIVxMIL)		- (w308 * SURx * x90)	,					
			"Base.Savage12",	w308	 * SURx	- (w308 * x308)	- (w308 * SURx * xBOLT)	- (w308 * SURx * xUSA)			- (w308 * SURx * SURxNON)		,					
			"Base.Ruger_No1_3006",	w3006	 * SURx	- (w3006 * x3006)	- (w3006 * SURx * xBREAK)	- (w3006 * SURx * xUSA)					,					
			"Base.M40",	w308	 * SURx	- (w308 * x308)	- (w308 * SURx * xBOLT)	- (w308 * SURx * xUSA)			- (w308 * SURx * SURxNON)		,					
			"Base.M40A1",	w308	 * SURx	- (w308 * x308)	- (w308 * SURx * xBOLT)	- (w308 * SURx * xUSA)			- (w308 * SURx * SURxNON)		,					
			"Base.M40A2",	w308	 * SURx	- (w308 * x308)	- (w308 * SURx * xBOLT)	- (w308 * SURx * xUSA)		- (w308 * SURx * CIVxMIL)	- (w308 * SURx * SURxNON)		,					
			"Base.M40A3",	w308	 * SURx	- (w308 * x308)	- (w308 * SURx * xBOLT)	- (w308 * SURx * xUSA)	- (w308 * SURx * CIVxLEO)		- (w308 * SURx * SURxNON)		,					
			"Base.Mosin",	w762x54r	 * SURx	- (w762x54r * x762x54r)	- (w762x54r * SURx * xBOLT)	- (w762x54r * SURx * xSOV)					,					
			"Base.MosinObrez_Pistol",	w762x54r	 * SURx	- (w762x54r * x762x54r)	- (w762x54r * SURx * xBOLT)	- (w762x54r * SURx * xSOV)					,					
			"Base.M1",	w3006	 * SURx	- (w3006 * x3006)	- (w3006 * SURx * xSEMI)	- (w3006 * SURx * xUSA)					,					
			"Base.M1903",	w3006	 * SURx	- (w3006 * x3006)	- (w3006 * SURx * xBOLT)	- (w3006 * SURx * xUSA)					,					
			"Base.BAR",	w3006	 * SURx	- (w3006 * x3006)	- (w3006 * SURx * xAUTO)	- (w3006 * SURx * xUSA)					,					
			"Base.BAR_Monitor",	w3006	 * SURx	- (w3006 * x3006)	- (w3006 * SURx * xAUTO)	- (w3006 * SURx * xUSA)					,					
			"Base.MAS36",	w308	 * SURx	- (w308 * x308)	- (w308 * SURx * xAUTO)	- (w308 * SURx * xEUR)					,					
			"Base.MAS44",	w308	 * SURx	- (w308 * x308)	- (w308 * SURx * xAUTO)	- (w308 * SURx * xEUR)					,					
			"Base.MAS49",	w308	 * SURx	- (w308 * x308)	- (w308 * SURx * xAUTO)	- (w308 * SURx * xEUR)					,					
			"Base.Win_1895",	w308	 * SURx	- (w308 * x308)	- (w308 * SURx * xLEVER)	- (w308 * SURx * xUSA)					,					
			"Base.Galil",	w308	 * SURx	- (w308 * x308)	- (w308 * SURx * xAUTO)	- (w308 * SURx * xISR)					,					
			"Base.Galil_Sniper",	w308	 * SURx	- (w308 * x308)	- (w308 * SURx * xAUTO)	- (w308 * SURx * xISR)					,					
			"Base.Thompson_Center_3006",	w3006	 * SURx	- (w3006 * x3006)	- (w3006 * SURx * xBREAK)	- (w3006 * SURx * xUSA)					,					
			"Base.Type38",	w308	 * SURx	- (w308 * x308)	- (w308 * SURx * xBOLT)	- (w308 * SURx * xPAC)					,					
			"Base.Type99",	w308	 * SURx	- (w308 * x308)	- (w308 * SURx * xBOLT)	- (w308 * SURx * xPAC)					,					
			"Base.L96",	w308	 * SURx	- (w308 * x308)	- (w308 * SURx * xBOLT)	- (w308 * SURx * xEUR)			- (w308 * SURx * SURxNON)		,					
			"Base.M240",	w308	 * SURx	- (w308 * x308)	- (w308 * SURx * xLMG)	- (w308 * SURx * xUSA)		- (w308 * SURx * CIVxMIL)			,					
			"Base.G21LMG",	w308	 * SURx	- (w308 * x308)	- (w308 * SURx * xLMG)	- (w308 * SURx * xEUR)		- (w308 * SURx * CIVxMIL)	- (w308 * SURx * SURxNON)	- (w308 * SURx * x90)	,					
			"Base.K12",	w308	 * SURx	- (w308 * x308)	- (w308 * SURx * xLMG)	- (w308 * SURx * xKOR)		- (w308 * SURx * CIVxMIL)		- (w308 * SURx * x90)	,					
			"Base.PKM",	w762x54r	 * SURx	- (w762x54r * x762x54r)	- (w762x54r * SURx * xLMG)	- (w762x54r * SURx * xSOV)					,					
			"Base.MG42",	w308	 * SURx	- (w308 * x308)	- (w308 * SURx * xLMG)	- (w308 * SURx * xEUR)					,					
			"Base.M60",	w308	 * SURx	- (w308 * x308)	- (w308 * SURx * xLMG)	- (w308 * SURx * xUSA)		- (w308 * SURx * CIVxMIL)			,					
			"Base.MK43",	w308	 * SURx	- (w308 * x308)	- (w308 * SURx * xLMG)	- (w308 * SURx * xUSA)		- (w308 * SURx * CIVxMIL)		- (w308 * SURx * x90)	,					
			"Base.RPD",	w762x39	 * SURx	- (w762x39 * x762x39)	- (w762x39 * SURx * xLMG)	- (w762x39 * SURx * xSOV)					,					
			"Base.BOAR",	wBMG	 * SURx	- (wBMG * xBMG)	- (wBMG * SURx * xBREAK)	- (wBMG * SURx * xUSA)					,					
			"Base.EDM96",	wBMG	 * SURx	- (wBMG * xBMG)	- (wBMG * SURx * xBOLT)	- (wBMG * SURx * xUSA)	- (wBMG * SURx * CIVxLEO)		- (wBMG * SURx * SURxNON)	- (wBMG * SURx * x90)	,					
			"Base.M82",	wBMG	 * SURx	- (wBMG * xBMG)	- (wBMG * SURx * xSEMI)	- (wBMG * SURx * xUSA)		- (wBMG * SURx * CIVxMIL)			,					
			"Base.BFG50",	wBMG	 * SURx	- (wBMG * xBMG)	- (wBMG * SURx * xBREAK)	- (wBMG * SURx * xUSA)				- (wBMG * SURx * x90)	,					
			"Base.Harris50",	wBMG	 * SURx	- (wBMG * xBMG)	- (wBMG * SURx * xBOLT)	- (wBMG * SURx * xUSA)			- (wBMG * SURx * SURxNON)		,					
			"Base.TAC50",	wBMG	 * SURx	- (wBMG * xBMG)	- (wBMG * SURx * xBOLT)	- (wBMG * SURx * xUSA)		- (wBMG * SURx * CIVxMIL)			,					
			"Base.Ash",	wBMG	 * SURx	- (wBMG * xBMG)	- (wBMG * SURx * xAUTO)	- (wBMG * SURx * xSOV)		- (wBMG * SURx * CIVxMIL)	- (wBMG * SURx * SURxNON)	- (wBMG * SURx * x90)	,					
			"Base.SW_M500",	wBMG	 * SURx	- (wBMG * xBMG)	- (wBMG * SURx * xREV)	- (wBMG * SURx * xUSA)				- (wBMG * SURx * x90)	,					
			"Base.SPAS12_Fixed",	w12g	 * SURx	- (w12g * x12g)	- (w12g * SURx * xSEMI)	- (w12g * SURx * xEUR)	- (w12g * SURx * CIVxLEO)				,					
			"Base.SPAS12_Fold",	w12g	 * SURx	- (w12g * x12g)	- (w12g * SURx * xSEMI)	- (w12g * SURx * xEUR)	- (w12g * SURx * CIVxLEO)				,					
			"Base.Origin",	w12g	 * SURx	- (w12g * x12g)	- (w12g * SURx * xSEMI)	- (w12g * SURx * xUSA)		- (w12g * SURx * CIVxMIL)	- (w12g * SURx * SURxNON)	- (w12g * SURx * x90)	,					
			"Base.SPAS_15",	w12g	 * SURx	- (w12g * x12g)	- (w12g * SURx * xSEMI)	- (w12g * SURx * xEUR)		- (w12g * SURx * CIVxMIL)			,					
			"Base.USAS_12",	w12g	 * SURx	- (w12g * x12g)	- (w12g * SURx * xAUTO)	- (w12g * SURx * xKOR)		- (w12g * SURx * CIVxMIL)			,					
			"Base.Shorty_Pistol",	w12g	 * SURx	- (w12g * x12g)	- (w12g * SURx * xPUMP)	- (w12g * SURx * xUSA)	- (w12g * SURx * CIVxLEO)			- (w12g * SURx * x90)	,					
			"Base.R11_87",	w12g	 * SURx	- (w12g * x12g)	- (w12g * SURx * xSEMI)	- (w12g * SURx * xUSA)			- (w12g * SURx * SURxNON)		,					
			"Base.M870",	w12g	 * SURx	- (w12g * x12g)	- (w12g * SURx * xPUMP)	- (w12g * SURx * xUSA)			- (w12g * SURx * SURxNON)		,					
			"Base.M1897",	w12g	 * SURx	- (w12g * x12g)	- (w12g * SURx * xPUMP)	- (w12g * SURx * xUSA)					,					
			"Base.DT11",	w12g	 * SURx	- (w12g * x12g)	- (w12g * SURx * xBREAK)	- (w12g * SURx * xEUR)					,					
			"Base.Coachgun",	w12g	 * SURx	- (w12g * x12g)	- (w12g * SURx * xBREAK)	- (w12g * SURx * xUSA)					,					
			"Base.Terminator",	w12g	 * SURx	- (w12g * x12g)	- (w12g * SURx * xBREAK)	- (w12g * SURx * xUSA)					,					
			"Base.SIX12",	w12g	 * SURx	- (w12g * x12g)	- (w12g * SURx * xREV)	- (w12g * SURx * xUSA)	- (w12g * SURx * CIVxLEO)		- (w12g * SURx * SURxNON)	- (w12g * SURx * x90)	,					
			"Base.SIX12SD",	w12g	 * SURx	- (w12g * x12g)	- (w12g * SURx * xREV)	- (w12g * SURx * xUSA)		- (w12g * SURx * CIVxMIL)	- (w12g * SURx * SURxNON)	- (w12g * SURx * x90)	,					
			"Base.M870_Wingmaster",	w12g	 * SURx	- (w12g * x12g)	- (w12g * SURx * xPUMP)	- (w12g * SURx * xUSA)			- (w12g * SURx * SURxNON)		,					
			"Base.M870_Police",	w12g	 * SURx	- (w12g * x12g)	- (w12g * SURx * xPUMP)	- (w12g * SURx * xUSA)	- (w12g * SURx * CIVxLEO)				,					
			"Base.M870_MCS",	w12g	 * SURx	- (w12g * x12g)	- (w12g * SURx * xPUMP)	- (w12g * SURx * xUSA)	- (w12g * SURx * CIVxLEO)				,					
			"Base.M870_CQB",	w12g	 * SURx	- (w12g * x12g)	- (w12g * SURx * xPUMP)	- (w12g * SURx * xUSA)	- (w12g * SURx * CIVxLEO)				,					
			"Base.M870_Breaching_Pistol",	w12g	 * SURx	- (w12g * x12g)	- (w12g * SURx * xPUMP)	- (w12g * SURx * xUSA)	- (w12g * SURx * CIVxLEO)				,					
			"Base.M870_Express",	w12g	 * SURx	- (w12g * x12g)	- (w12g * SURx * xPUMP)	- (w12g * SURx * xUSA)	- (w12g * SURx * CIVxLEO)				,					
			"Base.A400",	w12g	 * SURx	- (w12g * x12g)	- (w12g * SURx * xSEMI)	- (w12g * SURx * xEUR)	- (w12g * SURx * CIVxLEO)			- (w12g * SURx * x90)	,					
			"Base.M1014",	w12g	 * SURx	- (w12g * x12g)	- (w12g * SURx * xSEMI)	- (w12g * SURx * xEUR)			- (w12g * SURx * SURxNON)	- (w12g * SURx * x90)	,					
			"Base.M1014_Fold",	w12g	 * SURx	- (w12g * x12g)	- (w12g * SURx * xSEMI)	- (w12g * SURx * xEUR)		- (w12g * SURx * CIVxMIL)	- (w12g * SURx * SURxNON)	- (w12g * SURx * x90)	,					
			"Base.M1014_Wick",	w12g	 * SURx	- (w12g * x12g)	- (w12g * SURx * xSEMI)	- (w12g * SURx * xEUR)		- (w12g * SURx * CIVxMIL)	- (w12g * SURx * SURxNON)	- (w12g * SURx * x90)	,					
			"Base.DAO12",	w12g	 * SURx	- (w12g * x12g)	- (w12g * SURx * xREV)	- (w12g * SURx * xREST)	- (w12g * SURx * CIVxLEO)				,					
			"Base.M1887",	w12g	 * SURx	- (w12g * x12g)	- (w12g * SURx * xLEVER)	- (w12g * SURx * xUSA)					,					
			"Base.M1208",	w12g	 * SURx	- (w12g * x12g)	- (w12g * SURx * xREV)	- (w12g * SURx * xUSA)			- (w12g * SURx * SURxNON)	- (w12g * SURx * x90)	,					
			"Base.M1212",	w12g	 * SURx	- (w12g * x12g)	- (w12g * SURx * xREV)	- (w12g * SURx * xUSA)	- (w12g * SURx * CIVxLEO)		- (w12g * SURx * SURxNON)	- (w12g * SURx * x90)	,					
			"Base.M1216",	w12g	 * SURx	- (w12g * x12g)	- (w12g * SURx * xREV)	- (w12g * SURx * xUSA)	- (w12g * SURx * CIVxLEO)		- (w12g * SURx * SURxNON)	- (w12g * SURx * x90)	,					
			"Base.AA12",	w12g	 * SURx	- (w12g * x12g)	- (w12g * SURx * xAUTO)	- (w12g * SURx * xUSA)		- (w12g * SURx * CIVxMIL)	- (w12g * SURx * SURxNON)	- (w12g * SURx * x90)	,					
			"Base.CAWS",	w12g	 * SURx	- (w12g * x12g)	- (w12g * SURx * xAUTO)	- (w12g * SURx * xEUR)		- (w12g * SURx * CIVxMIL)			,					
			"Base.ROYAL_SXS",	w10g	 * SURx	- (w10g * x10g)	- (w10g * SURx * xBREAK)	- (w10g * SURx * xEUR)					,					
			"Base.KS23",	w4g	 * SURx	- (w4g * x4g)	- (w4g * SURx * xPUMP)	- (w4g * SURx * xSOV)					,					
			"Base.KS23_S_Pistol",	w4g	 * SURx	- (w4g * x4g)	- (w4g * SURx * xPUMP)	- (w4g * SURx * xSOV)					,					
			"Base.Triple_Crown",	w12g	 * SURx	- (w12g * x12g)	- (w12g * SURx * xBREAK)	- (w12g * SURx * xEUR)					,					
			"Base.Moss500_20",	w20g	 * SURx	- (w20g * x20g)	- (w20g * SURx * xPUMP)	- (w20g * SURx * xUSA)			- (w20g * SURx * SURxNON)		,					
			"Base.10855_Silver",	w20g	 * SURx	- (w20g * x20g)	- (w20g * SURx * xSEMI)	- (w20g * SURx * xEUR)			- (w20g * SURx * SURxNON)		,					
			"Base.Colt1855",	w20g	 * SURx	- (w20g * x20g)	- (w20g * SURx * xREV)	- (w20g * SURx * xUSA)					,					
			"Base.TOZ106",	w20g	 * SURx	- (w20g * x20g)	- (w20g * SURx * xBOLT)	- (w20g * SURx * xSOV)					,					
			"Base.TOZ194_Pistol",	w12g	 * SURx	- (w12g * x12g)	- (w12g * SURx * xPUMP)	- (w12g * SURx * xSOV)					,					
			"Base.Saiga12_Tromix",	w12g	 * SURx	- (w12g * x12g)	- (w12g * SURx * xAUTO)	- (w12g * SURx * xSOV)		- (w12g * SURx * CIVxMIL)		- (w12g * SURx * x90)	,					
			"Base.MP133",	w12g	 * SURx	- (w12g * x12g)	- (w12g * SURx * xPUMP)	- (w12g * SURx * xSOV)				- (w12g * SURx * x90)	,					
			"Base.MP133S_Pistol",	w12g	 * SURx	- (w12g * x12g)	- (w12g * SURx * xPUMP)	- (w12g * SURx * xSOV)				- (w12g * SURx * x90)	,					
			"Base.KSG",	w12g	 * SURx	- (w12g * x12g)	- (w12g * SURx * xPUMP)	- (w12g * SURx * xUSA)			- (w12g * SURx * SURxNON)	- (w12g * SURx * x90)	,					
			"Base.KSG25",	w12g	 * SURx	- (w12g * x12g)	- (w12g * SURx * xPUMP)	- (w12g * SURx * xUSA)			- (w12g * SURx * SURxNON)	- (w12g * SURx * x90)	,					
			"Base.UTS15",	w12g	 * SURx	- (w12g * x12g)	- (w12g * SURx * xPUMP)	- (w12g * SURx * xREST)			- (w12g * SURx * SURxNON)	- (w12g * SURx * x90)	,					
			"Base.EX41_HE",	wGREN	 * SURx		- (wGREN * SURx * xGREN)	- (wGREN * SURx * xUSA)		- (wGREN * SURx * CIVxMIL)			,					
			"Base.Federal_HE",	wGREN	 * SURx		- (wGREN * SURx * xGREN)	- (wGREN * SURx * xUSA)		- (wGREN * SURx * CIVxMIL)			,					
			"Base.M32_HE",	wGREN	 * SURx		- (wGREN * SURx * xGREN)	- (wGREN * SURx * xUSA)		- (wGREN * SURx * CIVxMIL)			,					
			"Base.GM94_HE",	wGREN	 * SURx		- (wGREN * SURx * xGREN)	- (wGREN * SURx * xSOV)		- (wGREN * SURx * CIVxMIL)		- (wGREN * SURx * x90)	,					
			"Base.K11",	wGREN	 * SURx	- (wGREN * SURx * xAUTO)	- (wGREN * SURx * xGREN)	- (wGREN * SURx * xKOR)		- (wGREN * SURx * CIVxMIL)		- (wGREN * SURx * x90)	,					
			"Base.XM214",	w556	 * SURx	- (w556 * x556)	- (w556 * SURx * xMINI)	- (w556 * SURx * xUSA)		- (w556 * SURx * CIVxMIL)			,					
			"Base.GAU17",	w308	 * SURx	- (w308 * x308)	- (w308 * SURx * xMINI)	- (w308 * SURx * xUSA)		- (w308 * SURx * CIVxMIL)			,					
			"Base.GAU19",	wBMG	 * SURx	- (wBMG * xBMG)	- (wBMG * SURx * xMINI)	- (wBMG * SURx * xUSA)		- (wBMG * SURx * CIVxMIL)			,					
			"Base.TAC15",	wBOW	 * SURx		- (wBOW * SURx * xBOW)	- (wBOW * SURx * xUSA)				- (wBOW * SURx * x90)	,					
			"Base.M2A1",	wFLAME	 * SURx		- (wFLAME * SURx * xFLAME)	- (wFLAME * SURx * xUSA)					,					
			"Base.Musk",	wFLAME	 * SURx		- (wFLAME * SURx * xFLAME)	- (wFLAME * SURx * xUSA)			- (wFLAME * SURx * SURxNON)	- (wFLAME * SURx * x90)	,					
		},																
		dontSpawnAmmo = 		 SURammo	,													
	},																	
																		
	SurplusParts = {																	
		rolls =	SURRollPART	,														
		items = {																
			"Base.Launcher",	wGREN		- (wGREN * xGREN)				- (wGREN * CIVxMIL)			,					
			"Base.Bipod",	Part		- (Part * xPart)							,					
			"Base.Ammobelt",	Part		- (Part * xPart)							,					
			"Base.Sling_1",	Part		- (Part * xPart)							,					
			"Base.Sling_2",	Part		- (Part * xPart)							,					
			"Base.Sling_3",	Part		- (Part * xPart)							,					
			"Base.ForeGrip",	Part		- (Part * xPart)							,					
			"Base.Grip_Magpul",	Part		- (Part * xPart)						- (Part * x90)	,					
			"Base.Grip_MLOK",	Part		- (Part * xPart)						- (Part * x90)	,					
			"Base.Grip_TG",	Part		- (Part * xPart)						- (Part * x90)	,					
			"Base.Light_Small",	Light		- (Light * xLight)							,					
			"Base.Light_Large",	Light		- (Light * xLight)							,					
			"Base.Laser_Green",	Light		- (Light * xLight)							,					
			"Base.Laser_Red",	Light		- (Light * xLight)							,					
			"Base.Laser_DVAL",	Light		- (Light * xLight)			- (Light * CIVxLEO)				,					
			"Base.Laser_PEQ15",	Light		- (Light * xLight)				- (Light * CIVxMIL)			,					
			"Base.Suppressor_Pistol",	Suppress		- (Suppress * xSuppress)				- (Suppress * CIVxMIL)			,					
			"Base.Suppressor_Rifle",	Suppress		- (Suppress * xSuppress)							,					
			"Base.Suppressor_Shotgun",	Suppress		- (Suppress * xSuppress)				- (Suppress * CIVxMIL)			,					
			"Base.Suppressor_BMG",	Suppress		- (Suppress * xSuppress)	- (wBMG * xBMG)						,					
			"Base.Bayonet_M4",	Part		- (Part * xPart)							,					
			"Base.Bayonet_AK",	Part		- (Part * xPart)		- (Part * xSOV)					,					
			"Base.Bayonet_M1917",	Part		- (Part * xPart)							,					
			"Base.Choke_Full",	Part		- (Part * xPart)							,					
			"Base.Choke_Full_Dbl",	Part		- (Part * xPart)							,					
			"Base.Compensator",	Part		- (Part * xPart)							,					
			"Base.MuzzleBrake",	Part		- (Part * xPart)							,					
			"Base.Pad",	Part		- (Part * xPart)							,					
			"Base.Carrier_12g",	Part		- (Part * xPart)							,					
			"Base.GhostRing",	Optic		- (Optic * xOptic)							,					
			"Base.Sight_MicroDot",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * SURxNON)	- (Optic * x90)	,					
			"Base.Sight_RaceDot",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * SURxNON)		,					
			"Base.Sight_SRS",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * SURxNON)	- (Optic * x90)	,					
			"Base.Sight_EOTech",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * SURxNON)		,					
			"Base.Sight_3xEOTech",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * SURxNON)		,					
			"Base.Sight_4xACOG",	Optic		- (Optic * xOptic)		- (Optic * xUSA)					,					
			"Base.Sight_6xELCAN",	Optic		- (Optic * xOptic)		- (Optic * xEUR)			- (Optic * SURxNON)		,					
			"Base.Sight_KOBRA",	Optic		- (Optic * xOptic)		- (Optic * xSOV)					,					
			"Base.Scope_4xPSO",	Optic		- (Optic * xOptic)		- (Optic * xSOV)					,					
			"Base.Scope_12xPSO",	Optic		- (Optic * xOptic)		- (Optic * xSOV)					,					
			"Base.Scope_1-4x",	Optic		- (Optic * xOptic)		- (Optic * xUSA)					,					
			"Base.Scope_20x",	Optic		- (Optic * xOptic)		- (Optic * xUSA)					,					
			"Base.Sight_Thermal",	Optic		- (Optic * xOptic)		- (Optic * xUSA)		- (Optic * CIVxMIL)			,					
			"Base.Sight_Thermal_AK",	Optic		- (Optic * xOptic)		- (Optic * xSOV)		- (Optic * CIVxMIL)			,					
			"Base.Sight_Aimpoint",	Optic		- (Optic * xOptic)		- (Optic * xUSA)					,					
			"Base.Sight_Aimpoint_Dot",	Optic		- (Optic * xOptic)		- (Optic * xUSA)					,					
			"Base.Sight_Fiber_Shotgun",	Optic		- (Optic * xOptic)		- (Optic * xUSA)					,					
			"Base.Sight_Mepro_M21",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * SURxNON)	- (Optic * x90)	,					
			"Base.Sight_Mepro_MOR",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * SURxNON)	- (Optic * x90)	,					
			"Base.Sight_UH1",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				- (Optic * x90)	,					
			"Base.Sight_C79",	Optic		- (Optic * xOptic)		- (Optic * xEUR)					,					
			"Base.Sight_SUSAT",	Optic		- (Optic * xOptic)		- (Optic * xEUR)					,					
			"Base.Sight_Raven",	Optic		- (Optic * xOptic)		- (Optic * xUSA)					,					
			"Base.Sight_G28_Scope",	Optic		- (Optic * xOptic)		- (Optic * xEUR)					,					
			"Base.Sight_ACRO",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				- (Optic * x90)	,					
			"Base.Sight_MRO",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * SURxNON)	- (Optic * x90)	,					
			"Base.Sight_SRO",	Optic		- (Optic * xOptic)		- (Optic * xUSA)			- (Optic * SURxNON)	- (Optic * x90)	,					
			"Base.Sight_Nikon",	Optic		- (Optic * xOptic)		- (Optic * xUSA)					,					
			"Base.Sight_M8",	Optic		- (Optic * xOptic)		- (Optic * xUSA)					,					
			"Base.Sight_VX3",	Optic		- (Optic * xOptic)		- (Optic * xUSA)					,					
			"Base.Sight_1P63",	Optic		- (Optic * xOptic)		- (Optic * xSOV)					,					
			"Base.Sight_Brownells",	Optic		- (Optic * xOptic)		- (Optic * xUSA)					,					
			"Base.Sight_L2",	Optic		- (Optic * xOptic)		- (Optic * xEUR)					,					
			"Base.Sight_Malcom",	Optic		- (Optic * xOptic)		- (Optic * xUSA)					,					
			"Base.Sight_LUX",	Optic		- (Optic * xOptic)		- (Optic * xUSA)					,					
			"Base.Sight_NO32",	Optic		- (Optic * xOptic)		- (Optic * xUSA)					,					
			"Base.Sight_PKAS",	Optic		- (Optic * xOptic)		- (Optic * xSOV)					,					
			"Base.Sight_PU",	Optic		- (Optic * xOptic)		- (Optic * xSOV)					,					
			"Base.Sight_XPS",	Optic		- (Optic * xOptic)		- (Optic * xUSA)				- (Optic * x90)	,					
			"Base.Sight_PVS4",	Optic		- (Optic * xOptic)		- (Optic * xUSA)					,					
			"Base.Barrel_308",	w308		- (w308 * x308)	- (w308 * xBREAK)	- (w308 * xUSA)					,					
			"Base.Barrel_3006",	w3006		- (w3006 * x3006)	- (w3006 * xBREAK)	- (w3006 * xUSA)					,					
			"Base.Barrel_4570",	w4570		- (w4570 * x4570)	- (w4570 * xBREAK)	- (w4570 * xUSA)					,					
			"Base.Barrel_357",	w357		- (w357 * x357)	- (w357 * xBREAK)	- (w357 * xUSA)					,					
			"Base.Barrel_357_Short",	w357		- (w357 * x357)	- (w357 * xBREAK)	- (w357 * xUSA)					,					
			"Base.Barrel_45LC",	w45LC		- (w45LC * x45LC)	- (w45LC * xBREAK)	- (w45LC * xUSA)					,					
			"Base.Barrel_45LC_Short",	w45LC		- (w45LC * x45LC)	- (w45LC * xBREAK)	- (w45LC * xUSA)					,					
			"Base.38Speed",	StdMag	* w357	- (w357 * x357)	- (StdMag * xREV)						,					
			"Base.44Speed",	StdMag	* w44	- (w44 * x44)	- (StdMag * xREV)						,					
			"Base.SRM1208_Cylinder",	StdMag	* w12g	- (w12g * x12g)	- (StdMag * xREV)	- (StdMag * xUSA)			- (StdMag* w12g * SURxNON)	- (StdMag* w12g * x90)	,					
			"Base.SRM1212_Cylinder",	StdMag	* w12g	- (w12g * x12g)	- (StdMag * xREV)	- (StdMag * xUSA)			- (StdMag* w12g * SURxNON)	- (StdMag* w12g * x90)	,					
			"Base.SRM1216_Cylinder",	StdMag	* w12g	- (w12g * x12g)	- (StdMag * xREV)	- (StdMag * xUSA)			- (StdMag* w12g * SURxNON)	- (StdMag* w12g * x90)	,					
			"Base.SIX12_Cylinder",	StdMag	* w12g	- (w12g * x12g)	- (StdMag * xREV)	- (StdMag * xUSA)			- (StdMag* w12g * SURxNON)	- (StdMag* w12g * x90)	,					
			"Base.CP33Clip",	StdMag	* w22	- (w22 * x22)		- (StdMag * xUSA)			- (StdMag* w22 * SURxNON)	- (StdMag* w22 * x90)	,					
			"Base.CP33_17MagBase",	ExtMag	* w22	- (w22 * x22)		- (ExtMag * xUSA)			- (ExtMag* w22 * SURxNON)	- (ExtMag* w22 * x90)	,					
			"Base.22Clip",	StdMag	* w22	- (w22 * x22)							,					
			"Base.22ExtClip",	ExtMag	* w22	- (w22 * x22)							,					
			"Base.380Clip",	StdMag	* w380	- (w380 * x380)							,					
			"Base.380ExtClip",	ExtMag	* w380	- (w380 * x380)							,					
			"Base.9mmClip",	StdMag	* w9	- (w9 * x9)							,					
			"Base.9mmExtClip",	ExtMag	* w9	- (w9 * x9)							,					
			"Base.45DSClip",	StdMag	* w45	- (w45 * x45)							,					
			"Base.45DSExtClip",	ExtMag	* w45	- (w45 * x45)							,					
			"Base.45Clip",	StdMag	* w45	- (w45 * x45)							,					
			"Base.45ExtClip",	ExtMag	* w45	- (w45 * x45)							,					
			"Base.44Clip",	StdMag	* w44	- (w44 * x44)							,					
			"Base.223StdClip",	StdMag	* w223	- (w223 * x223)							,					
			"Base.223ExtClip",	ExtMag	* w223	- (w223 * x223)							,					
			"Base.556Clip",	StdMag	* w556	- (w556 * x556)							,					
			"Base.308StdClip",	StdMag	* w308	- (w308 * x308)							,					
			"Base.308ExtClip",	ExtMag	* w308	- (w308 * x308)							,					
			"Base.3006ExtClip",	ExtMag	* w3006	- (w3006 * x3006)		- (ExtMag * xUSA)					,					
			"Base.SVDClip",	StdMag	* w762x54r	- (w762x54r * x762x54r)		- (StdMag * xSOV)					,					
			"Base.ASHClip",	StdMag	* wBMG	- (wBMG * xBMG)		- (StdMag * xSOV)				- (StdMag* wBMG * x90)	,					
			"Base.M82Clip",	StdMag	* wBMG	- (wBMG * xBMG)		- (StdMag * xUSA)			- (StdMag* wBMG * SURxNON)		,					
			"Base.M1Clip",	StdMag	* w3006	- (w3006 * x3006)		- (StdMag * xUSA)					,					
			"Base.SKSClip",	StdMag	* w762x39	- (w762x39 * x762x39)		- (StdMag * xSOV)					,					
			"Base.1903Clip",	StdMag	* w308	- (w308 * x308)							,					
			"Base.545StdClip",	StdMag	* w545x39	- (w545x39 * x545x39)		- (StdMag * xSOV)					,					
			"Base.AKClip",	StdMag	* w762x39	- (w762x39 * x762x39)							,					
			"Base.ASVALClip",	ExtMag	* w9	- (w9 * x9)		- (ExtMag * xSOV)					,					
			"Base.VSSClip",	StdMag	* w9	- (w9 * x9)		- (StdMag * xSOV)					,					
			"Base.57Clip",	StdMag	* w57	- (w57 * x57)		- (StdMag * xEUR)			- (StdMag* w57 * SURxNON)	- (StdMag* w57 * x90)	,					
			"Base.P90Clip",	StdMag	* w57	- (w57 * x57)		- (StdMag * xEUR)			- (StdMag* w57 * SURxNON)	- (StdMag* w57 * x90)	,					
			"Base.22Drum",	DrumMag	* w22	- (w22 * x22)							,					
			"Base.9mmDrum",	DrumMag	* w9	- (w9 * x9)							,					
			"Base.45Drum",	DrumMag	* w45	- (w45 * x45)							,					
			"Base.556Drum",	DrumMag	* w556	- (w556 * x556)							,					
			"Base.545Drum",	DrumMag	* w545x39	- (w545x39 * x545x39)		- (DrumMag * xSOV)					,					
			"Base.762Drum",	DrumMag	* w762x39	- (w762x39 * x762x39)							,					
			"Base.12gDrum",	DrumMag	* w12g	- (w12g * x12g)							,					
			"Base.308Belt",	StdMag	* w308	- (w308 * x308)	- (wLMG * xLMG)			- (StdMag* w308 * CIVxMIL)			,					
			"Base.556Belt",	StdMag	* w556	- (w556 * x556)	- (wLMG * xLMG)			- (StdMag* w556 * CIVxMIL)			,					
			"Base.762x39Belt",	StdMag	* w762x39	- (w762x39 * x762x39)	- (wLMG * xLMG)			- (StdMag* w762x39 * CIVxMIL)			,					
			"Base.762x54rBelt",	StdMag	* w762x54r	- (w762x54r * x762x54r)	- (wLMG * xLMG)	- (StdMag * xSOV)		- (StdMag* w762x54r * CIVxMIL)			,					
			"Base.556MiniCan",	StdMag	* w556	- (w556 * x556)	- (wMINI * xMINI)	- (StdMag * xUSA)		- (StdMag* w556 * CIVxMIL)			,					
			"Base.308MiniCan",	StdMag	* w308	- (w308 * x308)	- (wMINI * xMINI)	- (StdMag * xUSA)		- (StdMag* w308 * CIVxMIL)			,					
			"Base.50MiniCan",	StdMag	* wBMG	- (wBMG * xBMG)	- (wMINI * xMINI)	- (StdMag * xUSA)		- (StdMag* wBMG * CIVxMIL)			,					
			"Base.M2A1_Tank",	ExtMag	* wFLAME	- (wFLAME * xFLAME)		- (ExtMag * xUSA)					,					
			"Base.M2A1_Can",	StdMag	* wFLAME	- (wFLAME * xFLAME)		- (StdMag * xUSA)					,					
			"Base.RussianMachete",	LgKnife	 * SURx	- (LgKnife * xLgKnife)		- (LgKnife * xSOV)					,					
			"Base.BGMachete",	LgKnife	 * SURx	- (LgKnife * xLgKnife)		- (LgKnife * xUSA)					,					
			"Base.RamboKnife",	LgKnife	 * SURx	- (LgKnife * xLgKnife)		- (LgKnife * xUSA)					,					
			"Base.Butterfly",	SmKnife	 * SURx	- (SmKnife * xSmKnife)		- (SmKnife * xPAC)					,					
			"Base.PushDagger",	SmKnife	 * SURx	- (SmKnife * xSmKnife)		- (SmKnife * xUSA)					,					
			"Base.Karambit",	SmKnife	 * SURx	- (SmKnife * xSmKnife)		- (SmKnife * xPAC)					,					
			"Base.Tactical_Axe",	Axe	 * SURx	- (Axe * xAxe)		- (Axe * xUSA)					,					
			"Base.Tactical_Sickle",	Axe	 * SURx	- (Axe * xAxe)		- (Axe * xUSA)					,					
			"Base.DingDong",	Blunt	 * SURx	- (Blunt * xBlunt)		- (Blunt * xUSA)			- (Blunt * SURx * SURxNON)		,					
			"Base.MilitaryBaton",	Blunt	 * SURx	- (Blunt * xBlunt)		- (Blunt * xUSA)					,					
			"Base.KillBill",	Sword	 * SURx	- (Sword * xSword)		- (Sword * xPAC)			- (Sword * SURx * SURxNON)		,					
			"Base.CH_WarSword",	Sword	 * SURx	- (Sword * xSword)		- (Sword * xPAC)			- (Sword * SURx * SURxNON)		,					
			"Base.Conan_Sword",	Sword	 * SURx	- (Sword * xSword)		- (Sword * xUSA)			- (Sword * SURx * SURxNON)		,					
		}																
	},																	
																		
	SurplusAmmo = {																	
		rolls =	SURRollAMMO	,														
		items = {																
			"Base.AmmoCan30_22",	AmmoCan		* w22	- (w22 * x22)						,					
			"Base.AmmoCan30_380",	AmmoCan		* w380	- (w380 * x380)						,					
			"Base.AmmoCan30_57",	AmmoCan		* w57	- (w57 * x57)				- (AmmoCan * SURxNON)	- (AmmoCan * x90)	,					
			"Base.AmmoCan30_9",	AmmoCan		* w9	- (w9 * x9)						,					
			"Base.AmmoCan30_38",	AmmoCan		* w357	- (w357 * x357)						,					
			"Base.AmmoCan30_357",	AmmoCan		* w357	- (w357 * x357)						,					
			"Base.AmmoCan30_45",	AmmoCan		* w45	- (w45 * x45)						,					
			"Base.AmmoCan30_44",	AmmoCan		* w44	- (w44 * x44)						,					
			"Base.AmmoCan30_45LC",	AmmoCan		* w45LC	- (w45LC * x45LC)						,					
			"Base.AmmoCan30_4570",	AmmoCan		* w4570	- (w4570 * x4570)				- (AmmoCan * SURxNON)		,					
			"Base.AmmoCan30_50MAG",	AmmoCan		* wBMG	- (wBMG * xBMG)					- (AmmoCan * x90)	,					
			"Base.AmmoCan50_223",	AmmoCan		* w223	- (w223 * x223)						,					
			"Base.AmmoCan50_556",	AmmoCan		* w556	- (w556 * x556)						,					
			"Base.AmmoCan50_762x39",	AmmoCan		* w762x39	- (w762x39 * x762x39)						,					
			"Base.AmmoCan50_545x39",	AmmoCan		* w545x39	- (w545x39 * x545x39)						,					
			"Base.AmmoCan50_762x54r",	AmmoCan		* w762x54r	- (w762x54r * x762x54r)						,					
			"Base.AmmoCan50_308",	AmmoCan		* w308	- (w308 * x308)						,					
			"Base.AmmoCan50_3006",	AmmoCan		* w3006	- (w3006 * x3006)						,					
			"Base.AmmoCan50_410",	AmmoCan		* w45LC	- (w45LC * x45LC)				- (AmmoCan * SURxNON)		,					
			"Base.AmmoCan50_20",	AmmoCan		* w20g	- (w20g * x20g)				- (AmmoCan * SURxNON)		,					
			"Base.AmmoCan50_12",	AmmoCan		* w12g	- (w12g * x12g)						,					
			"Base.AmmoCan50_10",	AmmoCan		* w10g	- (w10g * x10g)				- (AmmoCan * SURxNON)		,					
			"Base.AmmoCan50_4",	AmmoCan		* w4g	- (w4g * x4g)						,					
			"Base.AmmoCan50_50",	AmmoCan		* wBMG	- (wBMG * xBMG)						,					
			"Base.AmmoCan50_HE",	AmmoCan		* wGREN	- (wGREN * xGREN)			- (AmmoCan * CIVxMIL)	- (AmmoCan * SURxNON)		,					
			"Base.AmmoCan50_HE",	AmmoCan		* wGREN	- (wGREN * xGREN)			- (AmmoCan * CIVxMIL)	- (AmmoCan * SURxNON)		,					
			"Base.AmmoCan50_INC",	AmmoCan		* wGREN	- (wGREN * xGREN)			- (AmmoCan * CIVxMIL)	- (AmmoCan * SURxNON)		,					
			"Base.AmmoCan50_INC",	AmmoCan		* wGREN	- (wGREN * xGREN)			- (AmmoCan * CIVxMIL)	- (AmmoCan * SURxNON)		,					
			"Base.BB177Box",	AmmoBox		* wBB	- (wBB * xBB)				- (AmmoBox * SURxNON)		,					
			"Base.Bullets22Box",	AmmoBox		* w22	- (w22 * x22)						,					
			"Base.Bullets380Box",	AmmoBox		* w380	- (w380 * x380)						,					
			"Base.Bullets57Box",	AmmoBox		* w57	- (w57 * x57)				- (AmmoBox * SURxNON)	- (AmmoBox * x90)	,					
			"Base.Bullets9mmBox",	AmmoBox		* w9	- (w9 * x9)						,					
			"Base.Bullets38Box",	AmmoBox		* w357	- (w357 * x357)						,					
			"Base.Bullets357Box",	AmmoBox		* w357	- (w357 * x357)						,					
			"Base.Bullets45Box",	AmmoBox		* w45	- (w45 * x45)						,					
			"Base.Bullets44Box",	AmmoBox		* w44	- (w44 * x44)						,					
			"Base.Bullets45LCBox",	AmmoBox		* w45LC	- (w45LC * x45LC)						,					
			"Base.Bullets4570Box",	AmmoBox		* w4570	- (w4570 * x4570)				- (AmmoBox * SURxNON)		,					
			"Base.Bullets50MAGBox",	AmmoBox		* wBMG	- (wBMG * xBMG)					- (AmmoBox * x90)	,					
			"Base.223Box",	AmmoBox		* w223	- (w223 * x223)						,					
			"Base.556Box",	AmmoBox		* w556	- (w556 * x556)						,					
			"Base.762x39Box",	AmmoBox		* w762x39	- (w762x39 * x762x39)						,					
			"Base.545x39Box",	AmmoBox		* w545x39	- (w545x39 * x545x39)						,					
			"Base.762x54rBox",	AmmoBox		* w762x54r	- (w762x54r * x762x54r)						,					
			"Base.308Box",	AmmoBox		* w308	- (w308 * x308)						,					
			"Base.3006Box",	AmmoBox		* w3006	- (w3006 * x3006)						,					
			"Base.410gShotgunShellsBox",	AmmoBox		* w45LC	- (w45LC * x45LC)				- (AmmoBox * SURxNON)		,					
			"Base.20gShotgunShellsBox",	AmmoBox		* w20g	- (w20g * x20g)				- (AmmoBox * SURxNON)		,					
			"Base.ShotgunShellsBox",	AmmoBox		* w12g	- (w12g * x12g)						,					
			"Base.10gShotgunShellsBox",	AmmoBox		* w10g	- (w10g * x10g)				- (AmmoBox * SURxNON)		,					
			"Base.4gShotgunShellsBox",	AmmoBox		* w4g	- (w4g * x4g)						,					
			"Base.50BMGBox",	AmmoBox		* wBMG	- (wBMG * xBMG)						,					
			"Base.Bolt_Bear",	AmmoBox		* wBOW	- (wBOW * xBOW)						,					
			"Base.Bolt_Bear_Pack",	AmmoBox		* wBOW	- (wBOW * xBOW)						,					
			"Base.40HERound",	AmmoBox		* wGREN	- (wGREN * xGREN)			- (AmmoBox * CIVxMIL)	- (AmmoBox * SURxNON)		,					
			"Base.40INCRound",	AmmoBox		* wGREN	- (wGREN * xGREN)			- (AmmoBox * CIVxMIL)	- (AmmoBox * SURxNON)		,					
			"Base.PolyCan_Red_SPASClip",	StdMag	 * PolyCan	* w12g	- (w12g * x12g)						,					
			"Base.PolyCan_Red_12gDrum",	DrumMag	 * PolyCan	* w12g	- (w12g * x12g)						,					
			"Base.PolyCan_Red_38Speed",	StdMag	 * PolyCan	* w357	- (w357 * x357)	- (StdMag * xREV)					,					
			"Base.PolyCan_Red_44Speed",	StdMag	 * PolyCan	* w44	- (w44 * x44)	- (StdMag * xREV)					,					
			"Base.PolyCan_Blue_9mmClip",	StdMag	 * PolyCan	* w9	- (w9 * x9)						,					
			"Base.PolyCan_Blue_9mmExtClip",	ExtMag	 * PolyCan	* w9	- (w9 * x9)						,					
			"Base.PolyCan_Blue_9mmDrum",	DrumMag	 * PolyCan	* w9	- (w9 * x9)						,					
			"Base.PolyCan_Blue_45DSClip",	StdMag	 * PolyCan	* w45	- (w45 * x45)						,					
			"Base.PolyCan_Blue_45DSExtClip",	ExtMag	 * PolyCan	* w45	- (w45 * x45)						,					
			"Base.PolyCan_Blue_45Drum",	DrumMag	 * PolyCan	* w45	- (w45 * x45)						,					
			"Base.PolyCan_Blue_45Clip",	StdMag	 * PolyCan	* w45	- (w45 * x45)						,					
			"Base.PolyCan_Blue_45ExtClip",	ExtMag	 * PolyCan	* w45	- (w45 * x45)						,					
			"Base.PolyCan_Brown_556Clip",	StdMag	 * PolyCan	* w556	- (w556 * x556)						,					
			"Base.PolyCan_Brown_556Drum",	DrumMag	 * PolyCan	* w556	- (w556 * x556)						,					
			"Base.PolyCan_Brown_AKClip",	StdMag	 * PolyCan	* w762x39	- (w762x39 * x762x39)						,					
			"Base.PolyCan_Brown_762Drum",	DrumMag	 * PolyCan	* w762x39	- (w762x39 * x762x39)						,					
			"Base.PolyCan_Brown_545StdClip",	StdMag	 * PolyCan	* w545x39	- (w545x39 * x545x39)						,					
			"Base.PolyCan_Brown_545Drum",	DrumMag	 * PolyCan	* w545x39	- (w545x39 * x545x39)						,					
			"Base.PolyCan_Beige_308StdClip",	StdMag	 * PolyCan	* w308	- (w308 * x308)						,					
			"Base.PolyCan_Beige_308ExtClip",	ExtMag	 * PolyCan	* w308	- (w308 * x308)						,					
			"Base.PolyCan_Beige_BMG",	StdMag	 * PolyCan	* wBMG	- (wBMG * xBMG)			- (StdMag * PolyCan * CIVxMIL)			,					
			"Base.PolyCan_Beige_K11",	StdMag	 * PolyCan	* wGREN	- (wGREN * xGREN)	- (StdMag * xKOR)		- (StdMag * PolyCan * CIVxMIL)		- (StdMag * x90)	,					
			"Base.PolyCan_Beige_SVDClip",	StdMag	 * PolyCan	* w762x54r	- (w762x54r * x762x54r)	- (StdMag * xSOV)					,					
			"Base.PolyCan_Beige_SKSClip",	StdMag	 * PolyCan	* w762x39	- (w762x39 * x762x39)	- (StdMag * xSOV)					,					
			"Base.PolyCan_Beige_M1Clip",	StdMag	 * PolyCan	* w3006	- (w3006 * x3006)	- (StdMag * xUSA)					,					
			"Base.PolyCan_Beige_1903Clip",	StdMag	 * PolyCan	* w308	- (w308 * x308)						,					
		}																
	},																	
																		
																		
	GunSupplies = {																	
		rolls =	3	,														
		items = {																
			"Radio.WalkieTalkie4",	2							,							
			"Radio.WalkieTalkie5",	1							,							
			"Radio.HamRadio1",	2							,							
			"Radio.HamRadio2",	1							,							
			"Base.GunPowder",	10							,							
			"Base.GunPowder",	8							,							
			"Base.GunPowder",	6							,							
			"Base.GunPowder",	4							,							
			"Base.Cleaning",	10							,							
			"Base.Cleaning",	8							,							
			"Base.Cleaning",	6							,							
			"Base.Cleaning",	4							,							
			"Base.WD",	10							,							
			"Base.WD",	8							,							
			"Base.WD",	6							,							
			"Base.WD",	4							,							
			"Base.SolventTrap_Adapter",	8														
		}																
	},																	
	MILItems = {																	
		rolls =	1	,														
		items = {																
			"Base.HolsterSimple",	1	,													
			"Base.HolsterDouble",	0.5	,													
			"Base.Glasses_Aviators",	0.2	,													
			"Base.Bag_ALICEpack_Army",	0.3	,													
			"Base.HuntingKnife",	0.2	,													
																		
		}																
	},																	
																		
	DelinquentItems = {								-- <<=== WAITING FOR PROC, NOT USED									
		rolls =	1	,														
		items = {																
			"Base.Butterfly",	0.01	- (LgKnife * xLgKnife)	,												
			"Base.PushDagger",	0.01	- (LgKnife * xLgKnife)	,												
			"Base.Karambit",	0.01	- (SmKnife * xSmKnife)	,												
			"Base.UmarexSS",	0.01	- (wFLAME * xFLAME)	,												
			"Base.BB177Box",	0.01	- (wFLAME * xFLAME)	,												
		}																
	},																	
																		
	RandomCaseAndCan = {																	
		rolls =	1	,														
		items = {																
			"Base.Case_Cute",	Case	 * 40				- (Case * xCase)	,	-- TIMES 10 TO ALLOW GLOVEBOX RATE TO REMAIN LOW							
			"Base.Case_Small1",	Case	 * 40	* w22			- (Case * xCase)	,								
			"Base.Case_Small2",	Case	 * 40	* w380			- (Case * xCase)	,								
			"Base.Case_Small3",	Case	 * 40	* w9			- (Case * xCase)	,								
			"Base.Case_Small4",	Case	 * 40	* w357			- (Case * xCase)	,								
			"Base.Case_Small5",	Case	 * 40	* w45			- (Case * xCase)	,								
			"Base.Case_Small6",	Case	 * 40	* w45			- (Case * xCase)	,								
			"Base.Case_Small7",	Case	 * 40	* w44			- (Case * xCase)	,								
			"Base.Case_Medium1",	Case	 * 40	* w380			- (Case * xCase)	,								
			"Base.Case_Medium2",	Case	 * 40	* w9			- (Case * xCase)	,								
			"Base.Case_Medium3",	Case	 * 40	* w45			- (Case * xCase)	,								
			"Base.Case_Medium4",	Case	 * 40	* w556			- (Case * xCase)	,								
			"Base.Case_Medium5",	Case	 * 40	* w762x39			- (Case * xCase)	,								
			"Base.Case_Medium6",	Case	 * 40	* w12g			- (Case * xCase)	,								
			"Base.Case_Large1",	Case	 * 40				- (Case * xCase)	,								
			"Base.Case_Large2",	Case	 * 40	* w545x39			- (Case * xCase)	,								
			"Base.Case_Large3",	Case	 * 40	* w556			- (Case * xCase)	,								
			"Base.Case_Large4",	Case	 * 40	* w762x39			- (Case * xCase)	,								
			"Base.Case_Large5",	Case	 * 40	* w308			- (Case * xCase)	,								
			"Base.Case_Large6",	Case	 * 40	* w12g			- (Case * xCase)	,								
			"Base.Case_Large7",	Case	 * 40	* w12g			- (Case * xCase)	,								
			"Base.Case_Heavy1",	Case	 * 40	* wGREN			- (Case * xCase)	,								
			"Base.Case_Heavy2",	Case	 * 40	* w556			- (Case * xCase)	,								
			"Base.Case_Heavy3",	Case	 * 40	* w308			- (Case * xCase)	,								
			"Base.Case_Heavy4",	Case	 * 40	* wBMG			- (Case * xCase)	,								
			"Base.AmmoCan30_MIX",	Case	 * 40					,								
			"Base.AmmoCan50_MIX",	Case	 * 40					,								
			"Base.AmmoCan50_SHOT",	Case	 * 40					,								
		}																
	},																	
																		
	FirearmWeapons = {																	
		rolls =	1	,					-- <<=== 2 iIS WAY TOO HIGH FOR BIG LIST									
		items = {																
			"Base.UmarexSS",	wBB	- (wBB * CIVx * x90)	- (wBB * xBB)		- (wBB * SECx * xUSA)	,									
			"Base.Benjamin_M397",	wBB		- (wBB * xBB)		- (wBB * SECx * xUSA)	,									
			"Base.RWS_M34",	wBB	- (wBB * CIVx * x90)	- (wBB * xBB)		- (wBB * SECx * xUSA)	,									
			"Base.CP33",	w22	- (w22 * CIVx * x90)	- (w22 * x22)	- (w22 * SECx * xSEMI)	- (w22 * SECx * xUSA)	,									
			"Base.Ruger_MK4",	w22	- (w22 * CIVx * x90)	- (w22 * x22)	- (w22 * SECx * xSEMI)	- (w22 * SECx * xUSA)	,									
			"Base.Buckmark",	w22		- (w22 * x22)	- (w22 * SECx * xSEMI)	- (w22 * SECx * xUSA)	,									
			"Base.Buckmark_Long",	w22		- (w22 * x22)	- (w22 * SECx * xSEMI)	- (w22 * SECx * xUSA)	,									
			"Base.Buckmark_Carbine",	w22		- (w22 * x22)	- (w22 * SECx * xSEMI)	- (w22 * SECx * xUSA)	,									
			"Base.HK4_22",	w22		- (w22 * x22)	- (w22 * SECx * xSEMI)	- (w22 * SECx * xEUR)	,									
			"Base.ZIP22",	w22	- (w22 * CIVx * x90)	- (w22 * x22)	- (w22 * SECx * xSEMI)	- (w22 * SECx * xUSA)	,									
			"Base.Ruger_1022",	w22		- (w22 * x22)	- (w22 * SECx * xSEMI)	- (w22 * SECx * xUSA)	,									
			"Base.Marlin_M70",	w22		- (w22 * x22)	- (w22 * SECx * xSEMI)	- (w22 * SECx * xUSA)	,									
			"Base.Cricket_22",	w22		- (w22 * x22)	- (w22 * SECx * xBOLT)	- (w22 * SECx * xUSA)	,									
			"Base.AR7",	w22		- (w22 * x22)	- (w22 * SECx * xSEMI)	- (w22 * SECx * xUSA)	,									
			"Base.Calico_22LR",	w22		- (w22 * x22)	- (w22 * SECx * xSMG)	- (w22 * SECx * xUSA)	,									
			"Base.American180",	w22		- (w22 * x22)	- (w22 * SECx * xSMG)	- (w22 * SECx * xUSA)	,									
			"Base.Winchester1903",	w22		- (w22 * x22)	- (w22 * SECx * xLEVER)	- (w22 * SECx * xUSA)	,									
			"Base.G42",	w380	- (w380 * CIVx * x90)	- (w380 * x380)	- (w380 * SECx * xSEMI)	- (w380 * SECx * xEUR)	,									
			"Base.LCP380",	w380	- (w380 * CIVx * x90)	- (w380 * x380)	- (w380 * SECx * xSEMI)	- (w380 * SECx * xUSA)	,									
			"Base.BodyGuard380",	w380	- (w380 * CIVx * x90)	- (w380 * x380)	- (w380 * SECx * xSEMI)	- (w380 * SECx * xUSA)	,									
			"Base.Bersa85F",	w380		- (w380 * x380)	- (w380 * SECx * xSEMI)	- (w380 * SECx * xREST)	,									
			"Base.Colt1903",	w380		- (w380 * x380)	- (w380 * SECx * xSEMI)	- (w380 * SECx * xUSA)	,									
			"Base.Makarov380",	w380		- (w380 * x380)	- (w380 * SECx * xSEMI)	- (w380 * SECx * xSOV)	,									
			"Base.PPK",	w380		- (w380 * x380)	- (w380 * SECx * xSEMI)	- (w380 * SECx * xEUR)	,									
			"Base.HK4_380",	w380		- (w380 * x380)	- (w380 * SECx * xSEMI)	- (w380 * SECx * xEUR)	,									
			"Base.VP70",	w380		- (w380 * x380)	- (w380 * SECx * xSMG)	- (w380 * SECx * xEUR)	,									
			"Base.VP70_Stock",	w380		- (w380 * x380)	- (w380 * SECx * xSMG)	- (w380 * SECx * xEUR)	,									
			"Base.Vz61_Fixed",	w380		- (w380 * x380)	- (w380 * SECx * xSMG)	- (w380 * SECx * xCZE)	,									
			"Base.Vz61_Fold",	w380		- (w380 * x380)	- (w380 * SECx * xSMG)	- (w380 * SECx * xCZE)	,									
			"Base.BT380_Stock",	w380	- (w380 * CIVx * x90)	- (w380 * x380)	- (w380 * SECx * xSEMI)	- (w380 * SECx * xEUR)	,									
			"Base.FN_57", 	w57	- (w57 * CIVx * x90)	- (w57 * x57)	- (w57 * SECx * xSEMI)	- (w57 * SECx * xEUR)	,									
			"Base.FN_57_MK2", 	w57	- (w57 * CIVx * x90)	- (w57 * x57)	- (w57 * SECx * xSEMI)	- (w57 * SECx * xEUR)	,									
			"Base.FN_P90",	w57	- (w57 * CIVx * x90)	- (w57 * x57)	- (w57 * SECx * xSMG)	- (w57 * SECx * xEUR)	,									
			"Base.FN_PS90",	w57	- (w57 * CIVx * x90)	- (w57 * x57)	- (w57 * SECx * xSMG)	- (w57 * SECx * xEUR)	,									
			"Base.CZ75",	w9		- (w9 * x9)	- (w9 * SECx * xSEMI)	- (w9 * SECx * xCZE)	,									
			"Base.G17",	w9		- (w9 * x9)	- (w9 * SECx * xSEMI)	- (w9 * SECx * xEUR)	,									
			"Base.G18",	w9		- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xEUR)	,									
			"Base.G34", 	w9	- (w9 * CIVx * x90)	- (w9 * x9)	- (w9 * SECx * xSEMI)	- (w9 * SECx * xUSA)	,									
			"Base.K5",	w9		- (w9 * x9)	- (w9 * SECx * xSEMI)	- (w9 * SECx * xKOR)	,									
			"Base.M9",	w9		- (w9 * x9)	- (w9 * SECx * xSEMI)	- (w9 * SECx * xEUR)	,									
			"Base.M9A3",	w9	- (w9 * CIVx * x90)	- (w9 * x9)	- (w9 * SECx * xSEMI)	- (w9 * SECx * xEUR)	,									
			"Base.B93R",	w9		- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xEUR)	,									
			"Base.M5906",	w9		- (w9 * x9)	- (w9 * SECx * xSEMI)	- (w9 * SECx * xUSA)	,									
			"Base.XD9",	w9	- (w9 * CIVx * x90)	- (w9 * x9)	- (w9 * SECx * xSEMI)	- (w9 * SECx * xUSA)	,									
			"Base.MP9",	w9	- (w9 * CIVx * x90)	- (w9 * x9)	- (w9 * SECx * xSEMI)	- (w9 * SECx * xUSA)	,									
			"Base.P226",	w9		- (w9 * x9)	- (w9 * SECx * xSEMI)	- (w9 * SECx * xEUR)	,									
			"Base.APS",	w9		- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xSOV)	,									
			"Base.Makarov",	w9		- (w9 * x9)	- (w9 * SECx * xSEMI)	- (w9 * SECx * xSOV)	,									
			"Base.PB",	w9		- (w9 * x9)	- (w9 * SECx * xSEMI)	- (w9 * SECx * xSOV)	,									
			"Base.Luger",	w9		- (w9 * x9)	- (w9 * SECx * xSEMI)	- (w9 * SECx * xEUR)	,									
			"Base.Luger_WW1",	w9		- (w9 * x9)	- (w9 * SECx * xSEMI)	- (w9 * SECx * xEUR)	,									
			"Base.Luger_Carbine",	w9		- (w9 * x9)	- (w9 * SECx * xSEMI)	- (w9 * SECx * xEUR)	,									
			"Base.UZI", 	w9		- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xREST)	,									
			"Base.UZI_Wood",	w9		- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xREST)	,									
			"Base.UZI_Micro",	w9		- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xREST)	,									
			"Base.BT9_Fold",	w9	- (w9 * CIVx * x90)	- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xEUR)	,									
			"Base.UMP9_Stock",	w9	- (w9 * CIVx * x90)	- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xEUR)	,									
			"Base.SUB2000",	w9	- (w9 * CIVx * x90)	- (w9 * x9)	- (w9 * SECx * xSEMI)	- (w9 * SECx * xUSA)	,									
			"Base.MP5_Fixed",	w9		- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xEUR)	,									
			"Base.MP5_Stock",	w9		- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xEUR)	,									
			"Base.MP5SD6_Fixed",	w9		- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xEUR)	,									
			"Base.MP5SD6_Stock",	w9		- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xEUR)	,									
			"Base.EVO_Fold",	w9	- (w9 * CIVx * x90)	- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xCZE)	,									
			"Base.K7_Stock",	w9		- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xKOR)	,									
			"Base.AUG9",	w9		- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xEUR)	,									
			"Base.KG9",	w9		- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xUSA)	,									
			"Base.Calico_M900_Fold",	w9		- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xUSA)	,									
			"Base.Calico_M950_Pistol",	w9		- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xUSA)	,									
			"Base.VSS",	w9		- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xSOV)	,									
			"Base.ASVAL",	w9		- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xSOV)	,									
			"Base.M1Carbine",	w9		- (w9 * x9)	- (w9 * SECx * xSEMI)	- (w9 * SECx * xUSA)	,									
			"Base.M2Carbine",	w9		- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xUSA)	,									
			"Base.M635",	w9		- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xUSA)	,									
			"Base.M635S",	w9		- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xUSA)	,									
			"Base.M635SD",	w9		- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xUSA)	,									
			"Base.MP7",	w9	- (w9 * CIVx * x90)	- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xEUR)	,									
			"Base.Jatimatic",	w9		- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xEUR)	,									
			"Base.Sten",	w9		- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xEUR)	,									
			"Base.Sten_MK2",	w9		- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xEUR)	,									
			"Base.Sten_MK2SD",	w9		- (w9 * x9)	- (w9 * SECx * xSMG)	- (w9 * SECx * xEUR)	,									
			"Base.M5238",	w357		- (w357 * x357)	- (w357 * SECx * xSEMI)	- (w357 * SECx * xUSA)	,									
			"Base.Taurus856",	w357	- (w357 * CIVx * x90)	- (w357 * x357)	- (w357 * SECx * xREV)	- (w357 * SECx * xREST)	,									
			"Base.Colt_Service38",	w357		- (w357 * x357)	- (w357 * SECx * xREV)	- (w357 * SECx * xUSA)	,									
			"Base.GP100_2",	w357		- (w357 * x357)	- (w357 * SECx * xREV)	- (w357 * SECx * xUSA)	,									
			"Base.GP100_4",	w357		- (w357 * x357)	- (w357 * SECx * xREV)	- (w357 * SECx * xUSA)	,									
			"Base.GP100_6",	w357		- (w357 * x357)	- (w357 * SECx * xREV)	- (w357 * SECx * xUSA)	,									
			"Base.K6S",	w357	- (w357 * CIVx * x90)	- (w357 * x357)	- (w357 * SECx * xREV)	- (w357 * SECx * xUSA)	,									
			"Base.M1936",	w357		- (w357 * x357)	- (w357 * SECx * xREV)	- (w357 * SECx * xUSA)	,									
			"Base.NEF_Handi_38",	w357		- (w357 * x357)	- (w357 * SECx * xBREAK)	- (w357 * SECx * xUSA)	,									
			"Base.Marlin_1894",	w357		- (w357 * x357)	- (w357 * SECx * xLEVER)	- (w357 * SECx * xUSA)	,									
			"Base.CZ97B",	w45	- (w45 * CIVx * x90)	- (w45 * x45)	- (w45 * SECx * xSEMI)	- (w45 * SECx * xCZE)	,									
			"Base.G21",	w45		- (w45 * x45)	- (w45 * SECx * xSEMI)	- (w45 * SECx * xEUR)	,									
			"Base.XD4",	w45	- (w45 * CIVx * x90)	- (w45 * x45)	- (w45 * SECx * xSEMI)	- (w45 * SECx * xUSA)	,									
			"Base.MP45",	w45	- (w45 * CIVx * x90)	- (w45 * x45)	- (w45 * SECx * xSEMI)	- (w45 * SECx * xUSA)	,									
			"Base.P220",	w45		- (w45 * x45)	- (w45 * SECx * xSEMI)	- (w45 * SECx * xEUR)	,									
			"Base.M4506",	w45		- (w45 * x45)	- (w45 * SECx * xSEMI)	- (w45 * SECx * xUSA)	,									
			"Base.PARA1911",	w45		- (w45 * x45)	- (w45 * SECx * xSEMI)	- (w45 * SECx * xUSA)	,									
			"Base.AMT1911",	w45		- (w45 * x45)	- (w45 * SECx * xSEMI)	- (w45 * SECx * xUSA)	,									
			"Base.AMT1911_Long",	w45		- (w45 * x45)	- (w45 * SECx * xSEMI)	- (w45 * SECx * xUSA)	,									
			"Base.M1911_Carbine",	w45		- (w45 * x45)	- (w45 * SECx * xSEMI)	- (w45 * SECx * xUSA)	,									
			"Base.Colt1911",	w45		- (w45 * x45)	- (w45 * SECx * xSEMI)	- (w45 * SECx * xUSA)	,									
			"Base.Colt_Kimber",	w45	- (w45 * CIVx * x90)	- (w45 * x45)	- (w45 * SECx * xSEMI)	- (w45 * SECx * xUSA)	,									
			"Base.Colt_Commander",	w45		- (w45 * x45)	- (w45 * SECx * xSEMI)	- (w45 * SECx * xUSA)	,									
			"Base.UMP45_Stock",	w45	- (w45 * CIVx * x90)	- (w45 * x45)	- (w45 * SECx * xSMG)	- (w45 * SECx * xEUR)	,									
			"Base.MAC10_Fold",	w45		- (w45 * x45)	- (w45 * SECx * xSMG)	- (w45 * SECx * xUSA)	,									
			"Base.KRISS_Stock",	w45	- (w45 * CIVx * x90)	- (w45 * x45)	- (w45 * SECx * xSMG)	- (w45 * SECx * xUSA)	,									
			"Base.Commando",	w45		- (w45 * x45)	- (w45 * SECx * xBOLT)	- (w45 * SECx * xEUR)	,									
			"Base.Thompson",	w45		- (w45 * x45)	- (w45 * SECx * xSMG)	- (w45 * SECx * xUSA)	,									
			"Base.Thompson_1928",	w45		- (w45 * x45)	- (w45 * SECx * xSMG)	- (w45 * SECx * xUSA)	,									
			"Base.M2Hyde",	w45		- (w45 * x45)	- (w45 * SECx * xSMG)	- (w45 * SECx * xUSA)	,									
			"Base.Model55_Fold",	w45		- (w45 * x45)	- (w45 * SECx * xSMG)	- (w45 * SECx * xUSA)	,									
			"Base.Model50",	w45		- (w45 * x45)	- (w45 * SECx * xSMG)	- (w45 * SECx * xUSA)	,									
			"Base.Colt_Navy_1851",	w44		- (w44 * x44)	- (w44 * SECx * xREV)	- (w44 * SECx * xUSA)	,									
			"Base.M29_44",	w44		- (w44 * x44)	- (w44 * SECx * xREV)	- (w44 * SECx * xUSA)	,									
			"Base.M29_44Carbine",	w44		- (w44 * x44)	- (w44 * SECx * xREV)	- (w44 * SECx * xUSA)	,									
			"Base.Automag",	w44		- (w44 * x44)	- (w44 * SECx * xSEMI)	- (w44 * SECx * xUSA)	,									
			"Base.DEagle",	w44		- (w44 * x44)	- (w44 * SECx * xSEMI)	- (w44 * SECx * xISR)	,									
			"Base.DEagle_Long",	w44		- (w44 * x44)	- (w44 * SECx * xSEMI)	- (w44 * SECx * xISR)	,									
			"Base.Winchester1866",	w45LC		- (w44 * x44)	- (w45LC * SECx * xLEVER)	- (w45LC * SECx * xUSA)	,									
			"Base.Win_1894",	w44		- (w44 * x44)	- (w44 * SECx * xLEVER)	- (w44 * SECx * xUSA)	,									
			"Base.Colt_Service45",	w45LC		- (w45LC * x45LC)	- (w45LC * SECx * xREV)	- (w45LC * SECx * xUSA)	,									
			"Base.Judge_45LC",	w45LC	- (w45LC * CIVx * x90)	- (w45LC * x45LC)	- (w45LC * SECx * xREV)	- (w45LC * SECx * xREST)	,									
			"Base.Judge513_45LC",	w45LC	- (w45LC * CIVx * x90)	- (w45LC * x45LC)	- (w45LC * SECx * xREV)	- (w45LC * SECx * xREST)	,									
			"Base.Judge513_Long_45LC",	w45LC	- (w45LC * CIVx * x90)	- (w45LC * x45LC)	- (w45LC * SECx * xREV)	- (w45LC * SECx * xREST)	,									
			"Base.TXS_804_45LC",	w45LC		- (w45LC * x45LC)	- (w45LC * SECx * xREV)	- (w45LC * SECx * xREST)	,									
			"Base.Winchester1873",	w45LC		- (w45LC * x45LC)	- (w45LC * SECx * xLEVER)	- (w45LC * SECx * xUSA)	,									
			"Base.Sako85",	w223		- (w223 * x223)	- (w223 * SECx * xBOLT)	- (w223 * SECx * xEUR)	,									
			"Base.MINI14",	w223		- (w223 * x223)	- (w223 * SECx * xSEMI)	- (w223 * SECx * xUSA)	,									
			"Base.MINI14_T",	w223		- (w223 * x223)	- (w223 * SECx * xSEMI)	- (w223 * SECx * xUSA)	,									
			"Base.Viper",	w223	- (w223 * CIVx * x90)	- (w223 * x223)	- (w223 * SECx * xLEVER)	- (w223 * SECx * xREST)	,									
			"Base.CAR15SMG",	w556		- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xUSA)	,									
			"Base.CAR15_Survival",	w556		- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xUSA)	,									
			"Base.XM8Compact_Pistol",	w556	- (w556 * CIVx * x90)	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xEUR)	,									
			"Base.XM8",	w556	- (w556 * CIVx * x90)	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xEUR)	,									
			"Base.SCARSC_Stock",	w556	- (w556 * CIVx * x90)	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xEUR)	,									
			"Base.SCARL",	w556	- (w556 * CIVx * x90)	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xEUR)	,									
			"Base.G33",	w556		- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xEUR)	,									
			"Base.MK18",	w556	- (w556 * CIVx * x90)	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xEUR)	,									
			"Base.M16A1",	w556		- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xUSA)	,									
			"Base.M16A2",	w556		- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xUSA)	,									
			"Base.M16A3",	w556		- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xUSA)	,									
			"Base.M723",	w556		- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xUSA)	,									
			"Base.XM117",	w556	- (w556 * CIVx * x90)	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xUSA)	,									
			"Base.H416",	w556	- (w556 * CIVx * x90)	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xEUR)	,									
			"Base.M4",	w556		- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xUSA)	,									
			"Base.M4A1",	w556		- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xUSA)	,									
			"Base.ADAR",	w556	- (w556 * CIVx * x90)	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xSOV)	,									
			"Base.K2C1_PH",	w556	- (w556 * CIVx * x90)	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xKOR)	,									
			"Base.K1DEV",	w556		- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xKOR)	,									
			"Base.K2_C1",	w556	- (w556 * CIVx * x90)	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xKOR)	,									
			"Base.K2_1",	w556		- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xKOR)	,									
			"Base.K2_203",	w556		- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xKOR)	,									
			"Base.K1_1",	w556		- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xKOR)	,									
			"Base.DR_200",	w556	- (w556 * CIVx * x90)	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xKOR)	,									
			"Base.LVOA_C",	w556	- (w556 * CIVx * x90)	- (w556 * x556)	- (w556 * SECx * xSEMI)	- (w556 * SECx * xUSA)	,									
			"Base.MCX_Spear",	w556	- (w556 * CIVx * x90)	- (w556 * x556)	- (w556 * SECx * xSEMI)	- (w556 * SECx * xEUR)	,									
			"Base.ColtM16",	w556		- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xUSA)	,									
			"Base.M16Wood",	w556		- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xUSA)	,									
			"Base.M16Tape",	w556		- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xUSA)	,									
			"Base.FAMAS",	w556		- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xEUR)	,									
			"Base.FAMAS_G2",	w556		- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xEUR)	,									
			"Base.FAMAS_Felin",	w556		- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xEUR)	,									
			"Base.AUG",	w556		- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xEUR)	,									
			"Base.M85_Stock",	w556		- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xSOV)	,									
			"Base.AK74",	w545x39		- (w545x39 * x545x39)	- (w545x39 * SECx * xAUTO)	- (w545x39 * SECx * xSOV)	,									
			"Base.AKS74",	w545x39		- (w545x39 * x545x39)	- (w545x39 * SECx * xAUTO)	- (w545x39 * SECx * xSOV)	,									
			"Base.AKS74U",	w545x39		- (w545x39 * x545x39)	- (w545x39 * SECx * xAUTO)	- (w545x39 * SECx * xSOV)	,									
			"Base.AK74_Alpha",	w545x39	- (w545x39 * CIVx * x90)	- (w545x39 * x545x39)	- (w545x39 * SECx * xAUTO)	- (w545x39 * SECx * xSOV)	,									
			"Base.AK12",	w545x39	- (w545x39 * CIVx * x90)	- (w545x39 * x545x39)	- (w545x39 * SECx * xAUTO)	- (w545x39 * SECx * xSOV)	,									
			"Base.AK12_New",	w545x39	- (w545x39 * CIVx * x90)	- (w545x39 * x545x39)	- (w545x39 * SECx * xAUTO)	- (w545x39 * SECx * xSOV)	,									
			"Base.RPK74",	w545x39		- (w545x39 * x545x39)	- (w545x39 * SECx * xLMG)	- (w545x39 * SECx * xSOV)	,									
			"Base.RPK16",	w545x39	- (w545x39 * CIVx * x90)	- (w545x39 * x545x39)	- (w545x39 * SECx * xLMG)	- (w545x39 * SECx * xSOV)	,									
			"Base.L85",	w556		- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xEUR)	,									
			"Base.L85A2",	w556	- (w556 * CIVx * x90)	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xEUR)	,									
			"Base.L86",	w556		- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xEUR)	,									
			"Base.L22",	w556	- (w556 * CIVx * x90)	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xEUR)	,									
			"Base.F2000",	w556	- (w556 * CIVx * x90)	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xEUR)	,									
			"Base.Tavor",	w556	- (w556 * CIVx * x90)	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xISR)	,									
			"Base.AR18",	w556		- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xUSA)	,									
			"Base.Type20",	w556	- (w556 * CIVx * x90)	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xPAC)	,									
			"Base.Type89",	w556		- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xPAC)	,									
			"Base.QBZ_95",	w556	- (w556 * CIVx * x90)	- (w556 * x556)	- (w556 * SECx * xAUTO)	- (w556 * SECx * xPAC)	,									
			"Base.XM8LMG",	w556	- (w556 * CIVx * x90)	- (w556 * x556)	- (w556 * SECx * xLMG)	- (w556 * SECx * xEUR)	,									
			"Base.M249",	w556		- (w556 * x556)	- (w556 * SECx * xLMG)	- (w556 * SECx * xUSA)	,									
			"Base.M249E3",	w556	- (w556 * CIVx * x90)	- (w556 * x556)	- (w556 * SECx * xLMG)	- (w556 * SECx * xUSA)	,									
			"Base.K3LMG",	w556		- (w556 * x556)	- (w556 * SECx * xLMG)	- (w556 * SECx * xKOR)	,									
			"Base.AK47",	w762x39		- (w762x39 * x762x39)	- (w762x39 * SECx * xAUTO)	- (w762x39 * SECx * xSOV)	,									
			"Base.AKM",	w762x39		- (w762x39 * x762x39)	- (w762x39 * SECx * xAUTO)	- (w762x39 * SECx * xSOV)	,									
			"Base.AK103",	w762x39	- (w762x39 * CIVx * x90)	- (w762x39 * x762x39)	- (w762x39 * SECx * xAUTO)	- (w762x39 * SECx * xSOV)	,									
			"Base.MD65_Stock",	w762x39		- (w762x39 * x762x39)	- (w762x39 * SECx * xAUTO)	- (w762x39 * SECx * xSOV)	,									
			"Base.AKMS_Stock",	w762x39		- (w762x39 * x762x39)	- (w762x39 * SECx * xAUTO)	- (w762x39 * SECx * xSOV)	,									
			"Base.Vz58",	w762x39		- (w762x39 * x762x39)	- (w762x39 * SECx * xAUTO)	- (w762x39 * SECx * xCZE)	,									
			"Base.Vz58_Stock",	w762x39		- (w762x39 * x762x39)	- (w762x39 * SECx * xAUTO)	- (w762x39 * SECx * xCZE)	,									
			"Base.Vz58_Mini_Stock",	w762x39		- (w762x39 * x762x39)	- (w762x39 * SECx * xAUTO)	- (w762x39 * SECx * xCZE)	,									
			"Base.SKS",	w762x39		- (w762x39 * x762x39)	- (w762x39 * SECx * xSEMI)	- (w762x39 * SECx * xSOV)	,									
			"Base.SKS_PARA",	w762x39		- (w762x39 * x762x39)	- (w762x39 * SECx * xSEMI)	- (w762x39 * SECx * xPAC)	,									
			"Base.MK47",	w762x39	- (w762x39 * CIVx * x90)	- (w762x39 * x762x39)	- (w762x39 * SECx * xSEMI)	- (w762x39 * SECx * xUSA)	,									
			"Base.AK308",	w308	- (w308 * CIVx * x90)	- (w308 * x308)	- (w308 * SECx * xAUTO)	- (w308 * SECx * xSOV)	,									
			"Base.SCARH",	w308	- (w308 * CIVx * x90)	- (w308 * x308)	- (w308 * SECx * xAUTO)	- (w308 * SECx * xEUR)	,									
			"Base.SCAR20",	w308	- (w308 * CIVx * x90)	- (w308 * x308)	- (w308 * SECx * xAUTO)	- (w308 * SECx * xEUR)	,									
			"Base.G28",	w308	- (w308 * CIVx * x90)	- (w308 * x308)	- (w308 * SECx * xAUTO)	- (w308 * SECx * xEUR)	,									
			"Base.G3",	w308		- (w308 * x308)	- (w308 * SECx * xAUTO)	- (w308 * SECx * xEUR)	,									
			"Base.Type64",	w308		- (w308 * x308)	- (w308 * SECx * xAUTO)	- (w308 * SECx * xPAC)	,									
			"Base.FAL",	w308		- (w308 * x308)	- (w308 * SECx * xAUTO)	- (w308 * SECx * xEUR)	,									
			"Base.FAL_PARA_Stock",	w308		- (w308 * x308)	- (w308 * SECx * xAUTO)	- (w308 * SECx * xEUR)	,									
			"Base.FN_FNC",	w308		- (w308 * x308)	- (w308 * SECx * xAUTO)	- (w308 * SECx * xEUR)	,									
			"Base.WA2000",	w308		- (w308 * x308)	- (w308 * SECx * xBOLT)	- (w308 * SECx * xEUR)	,									
			"Base.SVD",	w762x54r		- (w762x54r * x762x54r)	- (w762x54r * SECx * xSEMI)	- (w762x54r * SECx * xSOV)	,									
			"Base.SVDK",	w762x54r		- (w762x54r * x762x54r)	- (w762x54r * SECx * xSEMI)	- (w762x54r * SECx * xSOV)	,									
			"Base.M14EBR",	w308	- (w308 * CIVx * x90)	- (w308 * x308)	- (w308 * SECx * xAUTO)	- (w308 * SECx * xUSA)	,									
			"Base.M14",	w308		- (w308 * x308)	- (w308 * SECx * xAUTO)	- (w308 * SECx * xUSA)	,									
			"Base.K14",	w308	- (w308 * CIVx * x90)	- (w308 * x308)	- (w308 * SECx * xBOLT)	- (w308 * SECx * xKOR)	,									
			"Base.Savage12",	w308		- (w308 * x308)	- (w308 * SECx * xBOLT)	- (w308 * SECx * xUSA)	,									
			"Base.Ruger_No1_3006",	w3006		- (w3006 * x3006)	- (w3006 * SECx * xBREAK)	- (w3006 * SECx * xUSA)	,									
			"Base.M40",	w308		- (w308 * x308)	- (w308 * SECx * xBOLT)	- (w308 * SECx * xUSA)	,									
			"Base.M40A1",	w308		- (w308 * x308)	- (w308 * SECx * xBOLT)	- (w308 * SECx * xUSA)	,									
			"Base.M40A2",	w308		- (w308 * x308)	- (w308 * SECx * xBOLT)	- (w308 * SECx * xUSA)	,									
			"Base.M40A3",	w308		- (w308 * x308)	- (w308 * SECx * xBOLT)	- (w308 * SECx * xUSA)	,									
			"Base.Mosin",	w762x54r		- (w762x54r * x762x54r)	- (w762x54r * SECx * xBOLT)	- (w762x54r * SECx * xSOV)	,									
			"Base.MosinObrez_Pistol",	w762x54r		- (w762x54r * x762x54r)	- (w762x54r * SECx * xBOLT)	- (w762x54r * SECx * xSOV)	,									
			"Base.M1",	w3006		- (w3006 * x3006)	- (w3006 * SECx * xSEMI)	- (w3006 * SECx * xUSA)	,									
			"Base.M1903",	w3006		- (w3006 * x3006)	- (w3006 * SECx * xBOLT)	- (w3006 * SECx * xUSA)	,									
			"Base.BAR",	w3006		- (w3006 * x3006)	- (w3006 * SECx * xAUTO)	- (w3006 * SECx * xUSA)	,									
			"Base.BAR_Monitor",	w3006		- (w3006 * x3006)	- (w3006 * SECx * xAUTO)	- (w3006 * SECx * xUSA)	,									
			"Base.MAS36",	w308		- (w308 * x308)	- (w308 * SECx * xAUTO)	- (w308 * SECx * xEUR)	,									
			"Base.MAS44",	w308		- (w308 * x308)	- (w308 * SECx * xAUTO)	- (w308 * SECx * xEUR)	,									
			"Base.MAS49",	w308		- (w308 * x308)	- (w308 * SECx * xAUTO)	- (w308 * SECx * xEUR)	,									
			"Base.Win_1895",	w308		- (w308 * x308)	- (w308 * SECx * xLEVER)	- (w308 * SECx * xUSA)	,									
			"Base.Galil",	w308		- (w308 * x308)	- (w308 * SECx * xAUTO)	- (w308 * SECx * xISR)	,									
			"Base.Galil_Sniper",	w308		- (w308 * x308)	- (w308 * SECx * xAUTO)	- (w308 * SECx * xISR)	,									
			"Base.Thompson_Center_3006",	w3006		- (w3006 * x3006)	- (w3006 * SECx * xBREAK)	- (w3006 * SECx * xUSA)	,									
			"Base.Type38",	w308		- (w308 * x308)	- (w308 * SECx * xBOLT)	- (w308 * SECx * xPAC)	,									
			"Base.Type99",	w308		- (w308 * x308)	- (w308 * SECx * xBOLT)	- (w308 * SECx * xPAC)	,									
			"Base.L96",	w308		- (w308 * x308)	- (w308 * SECx * xBOLT)	- (w308 * SECx * xEUR)	,									
			"Base.M240",	w308		- (w308 * x308)	- (w308 * SECx * xLMG)	- (w308 * SECx * xUSA)	,									
			"Base.G21LMG",	w308	- (w308 * CIVx * x90)	- (w308 * x308)	- (w308 * SECx * xLMG)	- (w308 * SECx * xEUR)	,									
			"Base.K12",	w308	- (w308 * CIVx * x90)	- (w308 * x308)	- (w308 * SECx * xLMG)	- (w308 * SECx * xKOR)	,									
			"Base.PKM",	w762x54r		- (w762x54r * x762x54r)	- (w762x54r * SECx * xLMG)	- (w762x54r * SECx * xSOV)	,									
			"Base.MG42",	w308		- (w308 * x308)	- (w308 * SECx * xLMG)	- (w308 * SECx * xEUR)	,									
			"Base.M60",	w308		- (w308 * x308)	- (w308 * SECx * xLMG)	- (w308 * SECx * xUSA)	,									
			"Base.MK43",	w308	- (w308 * CIVx * x90)	- (w308 * x308)	- (w308 * SECx * xLMG)	- (w308 * SECx * xUSA)	,									
			"Base.RPD",	w762x39		- (w762x39 * x762x39)	- (w762x39 * SECx * xLMG)	- (w762x39 * SECx * xSOV)	,									
			"Base.BOAR",	wBMG		- (wBMG * xBMG)	- (wBMG * SECx * xBREAK)	- (wBMG * SECx * xUSA)	,									
			"Base.EDM96",	wBMG	- (wBMG * CIVx * x90)	- (wBMG * xBMG)	- (wBMG * SECx * xBOLT)	- (wBMG * SECx * xUSA)	,									
			"Base.M82",	wBMG		- (wBMG * xBMG)	- (wBMG * SECx * xSEMI)	- (wBMG * SECx * xUSA)	,									
			"Base.BFG50",	wBMG	- (wBMG * CIVx * x90)	- (wBMG * xBMG)	- (wBMG * SECx * xBREAK)	- (wBMG * SECx * xUSA)	,									
			"Base.Harris50",	wBMG		- (wBMG * xBMG)	- (wBMG * SECx * xBOLT)	- (wBMG * SECx * xUSA)	,									
			"Base.TAC50",	wBMG		- (wBMG * xBMG)	- (wBMG * SECx * xBOLT)	- (wBMG * SECx * xUSA)	,									
			"Base.Ash",	wBMG	- (wBMG * CIVx * x90)	- (wBMG * xBMG)	- (wBMG * SECx * xAUTO)	- (wBMG * SECx * xSOV)	,									
			"Base.SW_M500",	wBMG	- (wBMG * CIVx * x90)	- (wBMG * xBMG)	- (wBMG * SECx * xREV)	- (wBMG * SECx * xUSA)	,									
			"Base.SPAS12_Fixed",	w12g		- (w12g * x12g)	- (w12g * SECx * xSEMI)	- (w12g * SECx * xEUR)	,									
			"Base.SPAS12_Fold",	w12g		- (w12g * x12g)	- (w12g * SECx * xSEMI)	- (w12g * SECx * xEUR)	,									
			"Base.Origin",	w12g	- (w12g * CIVx * x90)	- (w12g * x12g)	- (w12g * SECx * xSEMI)	- (w12g * SECx * xUSA)	,									
			"Base.SPAS_15",	w12g		- (w12g * x12g)	- (w12g * SECx * xSEMI)	- (w12g * SECx * xEUR)	,									
			"Base.USAS_12",	w12g		- (w12g * x12g)	- (w12g * SECx * xAUTO)	- (w12g * SECx * xKOR)	,									
			"Base.Shorty_Pistol",	w12g	- (w12g * CIVx * x90)	- (w12g * x12g)	- (w12g * SECx * xPUMP)	- (w12g * SECx * xUSA)	,									
			"Base.R11_87",	w12g		- (w12g * x12g)	- (w12g * SECx * xSEMI)	- (w12g * SECx * xUSA)	,									
			"Base.M870",	w12g		- (w12g * x12g)	- (w12g * SECx * xPUMP)	- (w12g * SECx * xUSA)	,									
			"Base.M1897",	w12g		- (w12g * x12g)	- (w12g * SECx * xPUMP)	- (w12g * SECx * xUSA)	,									
			"Base.DT11",	w12g		- (w12g * x12g)	- (w12g * SECx * xBREAK)	- (w12g * SECx * xEUR)	,									
			"Base.Coachgun",	w12g		- (w12g * x12g)	- (w12g * SECx * xBREAK)	- (w12g * SECx * xUSA)	,									
			"Base.Terminator",	w12g		- (w12g * x12g)	- (w12g * SECx * xBREAK)	- (w12g * SECx * xUSA)	,									
			"Base.SIX12",	w12g	- (w12g * CIVx * x90)	- (w12g * x12g)	- (w12g * SECx * xREV)	- (w12g * SECx * xUSA)	,									
			"Base.SIX12SD",	w12g	- (w12g * CIVx * x90)	- (w12g * x12g)	- (w12g * SECx * xREV)	- (w12g * SECx * xUSA)	,									
			"Base.M870_Wingmaster",	w12g		- (w12g * x12g)	- (w12g * SECx * xPUMP)	- (w12g * SECx * xUSA)	,									
			"Base.M870_Police",	w12g		- (w12g * x12g)	- (w12g * SECx * xPUMP)	- (w12g * SECx * xUSA)	,									
			"Base.M870_MCS",	w12g		- (w12g * x12g)	- (w12g * SECx * xPUMP)	- (w12g * SECx * xUSA)	,									
			"Base.M870_CQB",	w12g		- (w12g * x12g)	- (w12g * SECx * xPUMP)	- (w12g * SECx * xUSA)	,									
			"Base.M870_Breaching_Pistol",	w12g		- (w12g * x12g)	- (w12g * SECx * xPUMP)	- (w12g * SECx * xUSA)	,									
			"Base.M870_Express",	w12g		- (w12g * x12g)	- (w12g * SECx * xPUMP)	- (w12g * SECx * xUSA)	,									
			"Base.A400",	w12g	- (w12g * CIVx * x90)	- (w12g * x12g)	- (w12g * SECx * xSEMI)	- (w12g * SECx * xEUR)	,									
			"Base.M1014",	w12g	- (w12g * CIVx * x90)	- (w12g * x12g)	- (w12g * SECx * xSEMI)	- (w12g * SECx * xEUR)	,									
			"Base.M1014_Fold",	w12g	- (w12g * CIVx * x90)	- (w12g * x12g)	- (w12g * SECx * xSEMI)	- (w12g * SECx * xEUR)	,									
			"Base.M1014_Wick",	w12g	- (w12g * CIVx * x90)	- (w12g * x12g)	- (w12g * SECx * xSEMI)	- (w12g * SECx * xEUR)	,									
			"Base.DAO12",	w12g		- (w12g * x12g)	- (w12g * SECx * xREV)	- (w12g * SECx * xREST)	,									
			"Base.M1887",	w12g		- (w12g * x12g)	- (w12g * SECx * xLEVER)	- (w12g * SECx * xUSA)	,									
			"Base.M1208",	w12g	- (w12g * CIVx * x90)	- (w12g * x12g)	- (w12g * SECx * xREV)	- (w12g * SECx * xUSA)	,									
			"Base.M1212",	w12g	- (w12g * CIVx * x90)	- (w12g * x12g)	- (w12g * SECx * xREV)	- (w12g * SECx * xUSA)	,									
			"Base.M1216",	w12g	- (w12g * CIVx * x90)	- (w12g * x12g)	- (w12g * SECx * xREV)	- (w12g * SECx * xUSA)	,									
			"Base.AA12",	w12g	- (w12g * CIVx * x90)	- (w12g * x12g)	- (w12g * SECx * xAUTO)	- (w12g * SECx * xUSA)	,									
			"Base.CAWS",	w12g		- (w12g * x12g)	- (w12g * SECx * xAUTO)	- (w12g * SECx * xEUR)	,									
			"Base.ROYAL_SXS",	w10g		- (w10g * x10g)	- (w10g * SECx * xBREAK)	- (w10g * SECx * xEUR)	,									
			"Base.KS23",	w4g		- (w4g * x4g)	- (w4g * SECx * xPUMP)	- (w4g * SECx * xSOV)	,									
			"Base.KS23_S_Pistol",	w4g		- (w4g * x4g)	- (w4g * SECx * xPUMP)	- (w4g * SECx * xSOV)	,									
			"Base.Triple_Crown",	w12g		- (w12g * x12g)	- (w12g * SECx * xBREAK)	- (w12g * SECx * xEUR)	,									
			"Base.Moss500_20",	w20g		- (w20g * x20g)	- (w20g * SECx * xPUMP)	- (w20g * SECx * xUSA)	,									
			"Base.10855_Silver",	w20g		- (w20g * x20g)	- (w20g * SECx * xSEMI)	- (w20g * SECx * xEUR)	,									
			"Base.Colt1855",	w20g		- (w20g * x20g)	- (w20g * SECx * xREV)	- (w20g * SECx * xUSA)	,									
			"Base.TOZ106",	w20g		- (w20g * x20g)	- (w20g * SECx * xBOLT)	- (w20g * SECx * xSOV)	,									
			"Base.TOZ194_Pistol",	w12g		- (w12g * x12g)	- (w12g * SECx * xPUMP)	- (w12g * SECx * xSOV)	,									
			"Base.Saiga12_Tromix",	w12g	- (w12g * CIVx * x90)	- (w12g * x12g)	- (w12g * SECx * xAUTO)	- (w12g * SECx * xSOV)	,									
			"Base.MP133",	w12g	- (w12g * CIVx * x90)	- (w12g * x12g)	- (w12g * SECx * xPUMP)	- (w12g * SECx * xSOV)	,									
			"Base.MP133S_Pistol",	w12g	- (w12g * CIVx * x90)	- (w12g * x12g)	- (w12g * SECx * xPUMP)	- (w12g * SECx * xSOV)	,									
			"Base.KSG",	w12g	- (w12g * CIVx * x90)	- (w12g * x12g)	- (w12g * SECx * xPUMP)	- (w12g * SECx * xUSA)	,									
			"Base.KSG25",	w12g	- (w12g * CIVx * x90)	- (w12g * x12g)	- (w12g * SECx * xPUMP)	- (w12g * SECx * xUSA)	,									
			"Base.UTS15",	w12g	- (w12g * CIVx * x90)	- (w12g * x12g)	- (w12g * SECx * xPUMP)	- (w12g * SECx * xREST)	,									
			"Base.EX41_HE",	wGREN			- (wGREN * SECx * xGREN)	- (wGREN * SECx * xUSA)	,									
			"Base.Federal_HE",	wGREN			- (wGREN * SECx * xGREN)	- (wGREN * SECx * xUSA)	,									
			"Base.M32_HE",	wGREN			- (wGREN * SECx * xGREN)	- (wGREN * SECx * xUSA)	,									
			"Base.GM94_HE",	wGREN	- (wGREN * CIVx * x90)		- (wGREN * SECx * xGREN)	- (wGREN * SECx * xSOV)	,									
			"Base.K11",	wGREN	- (wGREN * CIVx * x90)	- (wGREN * SECx * xAUTO)	- (wGREN * SECx * xGREN)	- (wGREN * SECx * xKOR)	,									
			"Base.XM214",	w556		- (w556 * x556)	- (w556 * SECx * xMINI)	- (w556 * SECx * xUSA)	,									
			"Base.GAU17",	w308		- (w308 * x308)	- (w308 * SECx * xMINI)	- (w308 * SECx * xUSA)	,									
			"Base.GAU19",	wBMG		- (wBMG * xBMG)	- (wBMG * SECx * xMINI)	- (wBMG * SECx * xUSA)	,									
			"Base.TAC15",	wBOW	- (wBOW * CIVx * x90)		- (wBOW * SECx * xBOW)	- (wBOW * SECx * xUSA)	,									
			"Base.M2A1",	wFLAME			- (wFLAME * SECx * xFLAME)	- (wFLAME * SECx * xUSA)	,									
			"Base.Musk",	wFLAME	- (wFLAME * CIVx * x90)		- (wFLAME * SECx * xFLAME)	- (wFLAME * SECx * xUSA)	,									
																		
			"Base.AmmoCan30_22",	AmmoCan		* w22	- (w22 * x22)		,									
			"Base.AmmoCan30_380",	AmmoCan		* w380	- (w380 * x380)		,									
			"Base.AmmoCan30_57",	AmmoCan	 - (AmmoCan * x90)	* w57	- (w57 * x57)		,									
			"Base.AmmoCan30_9",	AmmoCan		* w9	- (w9 * x9)		,									
			"Base.AmmoCan30_38",	AmmoCan		* w357	- (w357 * x357)		,									
			"Base.AmmoCan30_357",	AmmoCan		* w357	- (w357 * x357)		,									
			"Base.AmmoCan30_45",	AmmoCan		* w45	- (w45 * x45)		,									
			"Base.AmmoCan30_44",	AmmoCan		* w44	- (w44 * x44)		,									
			"Base.AmmoCan30_45LC",	AmmoCan		* w45LC	- (w45LC * x45LC)		,									
			"Base.AmmoCan30_4570",	AmmoCan		* w4570	- (w4570 * x4570)		,									
			"Base.AmmoCan30_50MAG",	AmmoCan		* wBMG	- (wBMG * xBMG)		,									
			"Base.AmmoCan50_223",	AmmoCan		* w223	- (w223 * x223)		,									
			"Base.AmmoCan50_556",	AmmoCan		* w556	- (w556 * x556)		,									
			"Base.AmmoCan50_762x39",	AmmoCan		* w762x39	- (w762x39 * x762x39)		,									
			"Base.AmmoCan50_545x39",	AmmoCan		* w545x39	- (w545x39 * x545x39)		,									
			"Base.AmmoCan50_762x54r",	AmmoCan		* w762x54r	- (w762x54r * x762x54r)		,									
			"Base.AmmoCan50_308",	AmmoCan		* w308	- (w308 * x308)		,									
			"Base.AmmoCan50_3006",	AmmoCan		* w3006	- (w3006 * x3006)		,									
			"Base.AmmoCan50_410",	AmmoCan		* w45LC	- (w45LC * x45LC)		,									
			"Base.AmmoCan50_20",	AmmoCan		* w20g	- (w20g * x20g)		,									
			"Base.AmmoCan50_12",	AmmoCan		* w12g	- (w12g * x12g)		,									
			"Base.AmmoCan50_10",	AmmoCan		* w10g	- (w10g * x10g)		,									
			"Base.AmmoCan50_4",	AmmoCan		* w4g	- (w4g * x4g)		,									
			"Base.AmmoCan50_50",	AmmoCan		* wBMG	- (wBMG * xBMG)		,									
			"Base.AmmoCan50_HE",	AmmoCan		* wGREN	- (wGREN * xGREN)		,									
			"Base.AmmoCan50_HE",	AmmoCan		* wGREN	- (wGREN * xGREN)		,									
			"Base.AmmoCan50_INC",	AmmoCan		* wGREN	- (wGREN * xGREN)		,									
			"Base.AmmoCan50_INC",	AmmoCan		* wGREN	- (wGREN * xGREN)		,									
		},																
		dontSpawnAmmo = false,																
	},																	
																		
	ELMariachiWeapons = {								-- <<== GUITAR CASE NOT PROCEDURAL YET									
		rolls =	1	,														
		items = {																
			"Base.AR7_Fold",	10	 - (10 * x90)	- (w22 * x22)			,									
			"Base.EDM96_Fold",	20	 - (20 * x90)	- (wBMG * xBMG)			,									
			"Base.SUB2000_Fold",	10	 - (10 * x90)	- (w9 * x9)			,									
			"Base.Coachgun_Pistol",	40	 - (40 * x90)	* w4g			,									
			"Base.DT11_Pistol",	30	 - (30 * x90)	* wBMG			,									
			"Base.Commando",	20		* w45			,									
			"Base.MAC10_Fold",	20		- (w45 * x45)			,									
		},																
		dontSpawnAmmo = false,																
	},																	
}																		
MergeDistributionRecursive(ProceduralDistributions, A26ProcDistro)																		
																		
																		
if (xArmor == 0) then																		
print("ARMOR DISTRO OVERRIDE OPTION ENABLED")																		
if getActivatedMods():contains("Brita_2") then																		
print("Brita_2 MOD DETECTED")																		
Brita_2_ProcDistro = {};																		
Brita_2_ProcDistro.list = {																		
	GunStoreShelf = {		--GunStoreArmor = {															
		rolls =	GUNRollARMOR	,														
		items = {																
			"Base.Ela_Jacket",	Armor	- (Armor * xArmor)				- (Armor * CIVxLEO)	- (Armor * CIVxMIL)		,						
			"Base.Ela_Pants",	Armor	- (Armor * xArmor)				- (Armor * CIVxLEO)	- (Armor * CIVxMIL)		,						
			"Base.Killa_Jacket",	Armor	- (Armor * xArmor)							,						
			"Base.Killa_Pants",	Armor	- (Armor * xArmor)							,						
			"Base.Gorka_Jacket",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)		,						
			"Base.Gorka_Jacket2",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)		,						
			"Base.Gorka_Jacket3",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)		,						
			"Base.Gorka_Pants",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)		,						
			"Base.Gorka_Pants2",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)		,						
			"Base.Gorka_Pants3",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)		,						
			"Base.Armor_Defender",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)	- (Armor * x90)	,						
			"Base.Armor_6B13",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)	- (Armor * x90)	,						
			"Base.Suit_Chempak",	Armor	- (Armor * xArmor)				- (Armor * CIVxLEO)	- (Armor * CIVxMIL)		,						
			"Base.Hat_Ela_Hat",	Armor	- (Armor * xArmor)				- (Armor * CIVxLEO)	- (Armor * CIVxMIL)		,						
			"Base.Hat_Ela_Hat_Only",	Armor	- (Armor * xArmor)				- (Armor * CIVxLEO)	- (Armor * CIVxMIL)		,						
			"Base.Hat_Killa",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)		,						
			"Base.Hat_Killa_Visor",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)		,						
			"Base.Hat_FAST_Opscore",	Armor	- (Armor * xArmor)				- (Armor * CIVxLEO)	- (Armor * CIVxMIL)		,						
			"Base.Hat_Beret_Tactical_Only",	Armor	- (Armor * xArmor)				- (Armor * CIVxLEO)	- (Armor * CIVxMIL)		,						
			"Base.Hat_Sordin",	Armor	- (Armor * xArmor)				- (Armor * CIVxLEO)	- (Armor * CIVxMIL)		,						
			"Base.Hat_Astrocom",	Armor	- (Armor * xArmor)				- (Armor * CIVxLEO)	- (Armor * CIVxMIL)		,						
			"Base.Hat_M1_Helmet",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)		,						
			"Base.Hat_M1_Helmet_Ori",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)		,						
			"Base.Hat_Maska",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)	- (Armor * x90)	,						
			"Base.Hat_Maska_Visor",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)	- (Armor * x90)	,						
			"Base.Hat_Maska_Visor2",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)	- (Armor * x90)	,						
			"Base.Hat_Gentex_Helmet",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)		,						
			"Base.Hat_Face_Shield",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)		,						
			"Base.Hat_Helmet_Headset",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)		,						
			"Base.Hat_Sam_NV",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)		,						
			"Base.Hat_PVS15_ON",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)	- (Armor * x90)	,						
			"Base.Hat_NV18_ON",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)		,						
			"Base.Hat_FM53",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)		,						
			"Base.Hat_M50",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)		,						
			"Base.Hat_M45_GasMask",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)		,						
			"Base.Hat_MCU_GasMask",	Armor	- (Armor * xArmor)				- (Armor * CIVxLEO)	- (Armor * CIVxMIL)		,						
			"Base.Glasses_X1000",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)		,						
			"Base.Glasses_Crewman_Goggles",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)		,						
			"Base.Glasses_Napier",	Armor	- (Armor * xArmor)							,						
			"Base.Bag_Plate_Carrier",	Armor	- (Armor * xArmor)				- (Armor * CIVxLEO)	- (Armor * CIVxMIL)		,						
			"Base.Bag_Blackhawk",	Armor	- (Armor * xArmor)				- (Armor * CIVxLEO)	- (Armor * CIVxMIL)		,						
			"Base.Bag_Duty_Belt_Front",	Armor	- (Armor * xArmor)				- (Armor * CIVxLEO)	- (Armor * CIVxMIL)		,						
			"Base.Bag_ST53_Set",	Armor	- (Armor * xArmor)				- (Armor * CIVxLEO)	- (Armor * CIVxMIL)		,						
			"Base.Bag_D3M",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)		,						
			"Base.Bag_Smersh_Vest",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)	- (Armor * x90)	,						
			"Base.Bag_Tactical_Belt_Front",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)		,						
			"Base.Bag_Sniper_Hood",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)		,						
			"Base.Bag_Sniper_Pack",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)		,						
			"Base.Bag_ARVN_Rucksack",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)		,						
			"Base.Bag_SSO",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)		,						
			"Base.Bag_Radio_Pack",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)		,						
			"Base.Bag_ZIP",	Armor	- (Armor * xArmor)							,						
			"Base.Bag_Savotta",	Armor	- (Armor * xArmor)							,						
			"Base.Bag_Bush",	Armor	- (Armor * xArmor)							,						
			"Base.Bag_Hunting",	Armor	- (Armor * xArmor)							,						
			"Base.AmmoStraps",	Armor	- (Armor * xArmor)							,						
			"Base.AmmoStrap_Bullets",	Armor	- (Armor * xArmor)							,						
			"Base.AmmoStrap_Shells",	Armor	- (Armor * xArmor)							,						
			"Base.HolsterSimple",	Armor	- (Armor * xArmor)							,						
			"Base.HolsterDouble",	Armor	- (Armor * xArmor)							,						
		}																
	},																	
																		
	PoliceStorageOutfit = {		--PoliceArmor = {															
		rolls =	LEORollARMOR	,														
		items = {																
			"Base.Ela_Jacket",	Armor	- (Armor * xArmor)							,						
			"Base.Ela_Pants",	Armor	- (Armor * xArmor)							,						
			"Base.Killa_Jacket",	Armor	- (Armor * xArmor)				- (Armor * LEOxCIV)			,						
			"Base.Killa_Pants",	Armor	- (Armor * xArmor)				- (Armor * LEOxCIV)			,						
			"Base.Gorka_Jacket",	Armor	- (Armor * xArmor)					- (Armor * LEOxMIL)		,						
			"Base.Gorka_Jacket2",	Armor	- (Armor * xArmor)					- (Armor * LEOxMIL)		,						
			"Base.Gorka_Jacket3",	Armor	- (Armor * xArmor)					- (Armor * LEOxMIL)		,						
			"Base.Gorka_Pants",	Armor	- (Armor * xArmor)					- (Armor * LEOxMIL)		,						
			"Base.Gorka_Pants2",	Armor	- (Armor * xArmor)					- (Armor * LEOxMIL)		,						
			"Base.Gorka_Pants3",	Armor	- (Armor * xArmor)					- (Armor * LEOxMIL)		,						
			"Base.Armor_Defender",	Armor	- (Armor * xArmor)					- (Armor * LEOxMIL)	- (Armor * x90)	,						
			"Base.Armor_6B13",	Armor	- (Armor * xArmor)					- (Armor * LEOxMIL)	- (Armor * x90)	,						
			"Base.Suit_Chempak",	Armor	- (Armor * xArmor)							,						
			"Base.Hat_Ela_Hat",	Armor	- (Armor * xArmor)							,						
			"Base.Hat_Ela_Hat_Only",	Armor	- (Armor * xArmor)							,						
			"Base.Hat_Killa",	Armor	- (Armor * xArmor)					- (Armor * LEOxMIL)		,						
			"Base.Hat_Killa_Visor",	Armor	- (Armor * xArmor)					- (Armor * LEOxMIL)		,						
			"Base.Hat_FAST_Opscore",	Armor	- (Armor * xArmor)							,						
			"Base.Hat_Beret_Tactical_Only",	Armor	- (Armor * xArmor)							,						
			"Base.Hat_Sordin",	Armor	- (Armor * xArmor)							,						
			"Base.Hat_Astrocom",	Armor	- (Armor * xArmor)							,						
			"Base.Hat_M1_Helmet",	Armor	- (Armor * xArmor)					- (Armor * LEOxMIL)		,						
			"Base.Hat_M1_Helmet_Ori",	Armor	- (Armor * xArmor)					- (Armor * LEOxMIL)		,						
			"Base.Hat_Maska",	Armor	- (Armor * xArmor)					- (Armor * LEOxMIL)	- (Armor * x90)	,						
			"Base.Hat_Maska_Visor",	Armor	- (Armor * xArmor)					- (Armor * LEOxMIL)	- (Armor * x90)	,						
			"Base.Hat_Maska_Visor2",	Armor	- (Armor * xArmor)					- (Armor * LEOxMIL)	- (Armor * x90)	,						
			"Base.Hat_Gentex_Helmet",	Armor	- (Armor * xArmor)					- (Armor * LEOxMIL)		,						
			"Base.Hat_Face_Shield",	Armor	- (Armor * xArmor)					- (Armor * LEOxMIL)		,						
			"Base.Hat_Helmet_Headset",	Armor	- (Armor * xArmor)					- (Armor * LEOxMIL)		,						
			"Base.Hat_Sam_NV",	Armor	- (Armor * xArmor)					- (Armor * LEOxMIL)		,						
			"Base.Hat_PVS15_ON",	Armor	- (Armor * xArmor)					- (Armor * LEOxMIL)	- (Armor * x90)	,						
			"Base.Hat_NV18_ON",	Armor	- (Armor * xArmor)					- (Armor * LEOxMIL)		,						
			"Base.Hat_FM53",	Armor	- (Armor * xArmor)					- (Armor * LEOxMIL)		,						
			"Base.Hat_M50",	Armor	- (Armor * xArmor)					- (Armor * LEOxMIL)		,						
			"Base.Hat_M45_GasMask",	Armor	- (Armor * xArmor)					- (Armor * LEOxMIL)		,						
			"Base.Hat_MCU_GasMask",	Armor	- (Armor * xArmor)							,						
			"Base.Glasses_X1000",	Armor	- (Armor * xArmor)					- (Armor * LEOxMIL)		,						
			"Base.Glasses_Crewman_Goggles",	Armor	- (Armor * xArmor)					- (Armor * LEOxMIL)		,						
			"Base.Glasses_Napier",	Armor	- (Armor * xArmor)				- (Armor * LEOxCIV)			,						
			"Base.Bag_Plate_Carrier",	Armor	- (Armor * xArmor)							,						
			"Base.Bag_Blackhawk",	Armor	- (Armor * xArmor)							,						
			"Base.Bag_Duty_Belt_Front",	Armor	- (Armor * xArmor)							,						
			"Base.Bag_ST53_Set",	Armor	- (Armor * xArmor)							,						
			"Base.Bag_D3M",	Armor	- (Armor * xArmor)					- (Armor * LEOxMIL)		,						
			"Base.Bag_Smersh_Vest",	Armor	- (Armor * xArmor)					- (Armor * LEOxMIL)	- (Armor * x90)	,						
			"Base.Bag_Tactical_Belt_Front",	Armor	- (Armor * xArmor)					- (Armor * LEOxMIL)		,						
			"Base.Bag_Sniper_Hood",	Armor	- (Armor * xArmor)					- (Armor * LEOxMIL)		,						
			"Base.Bag_Sniper_Pack",	Armor	- (Armor * xArmor)					- (Armor * LEOxMIL)		,						
			"Base.Bag_ARVN_Rucksack",	Armor	- (Armor * xArmor)					- (Armor * LEOxMIL)		,						
			"Base.Bag_SSO",	Armor	- (Armor * xArmor)					- (Armor * LEOxMIL)		,						
			"Base.Bag_Radio_Pack",	Armor	- (Armor * xArmor)					- (Armor * LEOxMIL)		,						
			"Base.Bag_ZIP",	Armor	- (Armor * xArmor)				- (Armor * LEOxCIV)			,						
			"Base.Bag_Savotta",	Armor	- (Armor * xArmor)				- (Armor * LEOxCIV)			,						
			"Base.Bag_Bush",	Armor	- (Armor * xArmor)				- (Armor * LEOxCIV)			,						
			"Base.Bag_Hunting",	Armor	- (Armor * xArmor)				- (Armor * LEOxCIV)			,						
			"Base.AmmoStraps",	Armor	- (Armor * xArmor)							,						
			"Base.AmmoStrap_Bullets",	Armor	- (Armor * xArmor)							,						
			"Base.AmmoStrap_Shells",	Armor	- (Armor * xArmor)							,						
			"Base.HolsterSimple",	Armor	- (Armor * xArmor)							,						
			"Base.HolsterDouble",	Armor	- (Armor * xArmor)							,						
			"Base.Bag_Police",	5								,						
		}																
	},																	
																		
	PoliceLockers = {		--PoliceArmor = {															
		rolls =	4	,	-- << VANILLA ROLL													
		items = {																
			"Base.Bag_Duty_Belt_Front",	10	- (Armor * xArmor)							,						
			"Base.Bag_Police",	5								,						
		}																
	},																	
																		
	ArmyStorageOutfit = {		--ArmyArmor = {															
		rolls =	MILRollArmor	,														
		items = {																
			"Base.Ela_Jacket",	Armor	- (Armor * xArmor)							,						
			"Base.Ela_Pants",	Armor	- (Armor * xArmor)							,						
			"Base.Killa_Jacket",	Armor	- (Armor * xArmor)				- (Armor * MILxNON)			,						
			"Base.Killa_Pants",	Armor	- (Armor * xArmor)				- (Armor * MILxNON)			,						
			"Base.Gorka_Jacket",	Armor	- (Armor * xArmor)							,						
			"Base.Gorka_Jacket2",	Armor	- (Armor * xArmor)							,						
			"Base.Gorka_Jacket3",	Armor	- (Armor * xArmor)							,						
			"Base.Gorka_Pants",	Armor	- (Armor * xArmor)							,						
			"Base.Gorka_Pants2",	Armor	- (Armor * xArmor)							,						
			"Base.Gorka_Pants3",	Armor	- (Armor * xArmor)							,						
			"Base.Armor_Defender",	Armor	- (Armor * xArmor)						- (Armor * x90)	,						
			"Base.Armor_6B13",	Armor	- (Armor * xArmor)						- (Armor * x90)	,						
			"Base.Suit_Chempak",	Armor	- (Armor * xArmor)							,						
			"Base.Hat_Ela_Hat",	Armor	- (Armor * xArmor)							,						
			"Base.Hat_Ela_Hat_Only",	Armor	- (Armor * xArmor)							,						
			"Base.Hat_Killa",	Armor	- (Armor * xArmor)							,						
			"Base.Hat_Killa_Visor",	Armor	- (Armor * xArmor)							,						
			"Base.Hat_FAST_Opscore",	Armor	- (Armor * xArmor)							,						
			"Base.Hat_Beret_Tactical_Only",	Armor	- (Armor * xArmor)							,						
			"Base.Hat_Sordin",	Armor	- (Armor * xArmor)							,						
			"Base.Hat_Astrocom",	Armor	- (Armor * xArmor)							,						
			"Base.Hat_M1_Helmet",	Armor	- (Armor * xArmor)							,						
			"Base.Hat_M1_Helmet_Ori",	Armor	- (Armor * xArmor)							,						
			"Base.Hat_Maska",	Armor	- (Armor * xArmor)						- (Armor * x90)	,						
			"Base.Hat_Maska_Visor",	Armor	- (Armor * xArmor)						- (Armor * x90)	,						
			"Base.Hat_Maska_Visor2",	Armor	- (Armor * xArmor)						- (Armor * x90)	,						
			"Base.Hat_Gentex_Helmet",	Armor	- (Armor * xArmor)							,						
			"Base.Hat_Face_Shield",	Armor	- (Armor * xArmor)							,						
			"Base.Hat_Helmet_Headset",	Armor	- (Armor * xArmor)							,						
			"Base.Hat_Sam_NV",	Armor	- (Armor * xArmor)							,						
			"Base.Hat_PVS15_ON",	Armor	- (Armor * xArmor)						- (Armor * x90)	,						
			"Base.Hat_NV18_ON",	Armor	- (Armor * xArmor)							,						
			"Base.Hat_FM53",	Armor	- (Armor * xArmor)							,						
			"Base.Hat_M50",	Armor	- (Armor * xArmor)							,						
			"Base.Hat_M45_GasMask",	Armor	- (Armor * xArmor)							,						
			"Base.Hat_MCU_GasMask",	Armor	- (Armor * xArmor)							,						
			"Base.Glasses_X1000",	Armor	- (Armor * xArmor)							,						
			"Base.Glasses_Crewman_Goggles",	Armor	- (Armor * xArmor)							,						
			"Base.Glasses_Napier",	Armor	- (Armor * xArmor)				- (Armor * MILxNON)			,						
			"Base.Bag_Plate_Carrier",	Armor	- (Armor * xArmor)							,						
			"Base.Bag_Blackhawk",	Armor	- (Armor * xArmor)							,						
			"Base.Bag_Duty_Belt_Front",	Armor	- (Armor * xArmor)				- (Armor * MILxNON)			,						
			"Base.Bag_ST53_Set",	Armor	- (Armor * xArmor)							,						
			"Base.Bag_D3M",	Armor	- (Armor * xArmor)							,						
			"Base.Bag_Smersh_Vest",	Armor	- (Armor * xArmor)						- (Armor * x90)	,						
			"Base.Bag_Tactical_Belt_Front",	Armor	- (Armor * xArmor)							,						
			"Base.Bag_Sniper_Hood",	Armor	- (Armor * xArmor)							,						
			"Base.Bag_Sniper_Pack",	Armor	- (Armor * xArmor)							,						
			"Base.Bag_ARVN_Rucksack",	Armor	- (Armor * xArmor)							,						
			"Base.Bag_SSO",	Armor	- (Armor * xArmor)							,						
			"Base.Bag_Radio_Pack",	Armor	- (Armor * xArmor)							,						
			"Base.Bag_ZIP",	Armor	- (Armor * xArmor)				- (Armor * MILxNON)			,						
			"Base.Bag_Savotta",	Armor	- (Armor * xArmor)				- (Armor * MILxNON)			,						
			"Base.Bag_Bush",	Armor	- (Armor * xArmor)				- (Armor * MILxNON)			,						
			"Base.Bag_Hunting",	Armor	- (Armor * xArmor)				- (Armor * MILxNON)			,						
		}																
	},																	
																		
	SecurityArmor = {																	
		rolls =	SECRollARMOR	,														
		items = {																
			"Base.Ela_Jacket",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)			,						
			"Base.Ela_Pants",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)			,						
			"Base.Killa_Jacket",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)			,						
			"Base.Killa_Pants",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)			,						
			"Base.Gorka_Jacket",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)			,						
			"Base.Gorka_Jacket2",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)			,						
			"Base.Gorka_Jacket3",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)			,						
			"Base.Gorka_Pants",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)			,						
			"Base.Gorka_Pants2",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)			,						
			"Base.Gorka_Pants3",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)			,						
			"Base.Armor_Defender",	Armor	- (Armor * xArmor)						- (Armor * x90)	,						
			"Base.Armor_6B13",	Armor	- (Armor * xArmor)						- (Armor * x90)	,						
			"Base.Suit_Chempak",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)			,						
			"Base.Hat_Ela_Hat",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)			,						
			"Base.Hat_Ela_Hat_Only",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)			,						
			"Base.Hat_Killa",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)			,						
			"Base.Hat_Killa_Visor",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)			,						
			"Base.Hat_FAST_Opscore",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)			,						
			"Base.Hat_Beret_Tactical_Only",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)			,						
			"Base.Hat_Sordin",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)			,						
			"Base.Hat_Astrocom",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)			,						
			"Base.Hat_M1_Helmet",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)			,						
			"Base.Hat_M1_Helmet_Ori",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)			,						
			"Base.Hat_Maska",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)		- (Armor * x90)	,						
			"Base.Hat_Maska_Visor",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)		- (Armor * x90)	,						
			"Base.Hat_Maska_Visor2",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)		- (Armor * x90)	,						
			"Base.Hat_Gentex_Helmet",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)			,						
			"Base.Hat_Face_Shield",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)			,						
			"Base.Hat_Helmet_Headset",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)			,						
			"Base.Hat_Sam_NV",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)			,						
			"Base.Hat_PVS15_ON",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)		- (Armor * x90)	,						
			"Base.Hat_NV18_ON",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)			,						
			"Base.Hat_FM53",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)			,						
			"Base.Hat_M50",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)			,						
			"Base.Hat_M45_GasMask",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)			,						
			"Base.Hat_MCU_GasMask",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)			,						
			"Base.Glasses_X1000",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)			,						
			"Base.Glasses_Crewman_Goggles",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)			,						
			"Base.Glasses_Napier",	Armor	- (Armor * xArmor)							,						
			"Base.Bag_Plate_Carrier",	Armor	- (Armor * xArmor)							,						
			"Base.Bag_Blackhawk",	Armor	- (Armor * xArmor)							,						
			"Base.Bag_Duty_Belt_Front",	Armor	- (Armor * xArmor)							,						
			"Base.Bag_ST53_Set",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)			,						
			"Base.Bag_D3M",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)			,						
			"Base.Bag_Smersh_Vest",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)		- (Armor * x90)	,						
			"Base.Bag_Tactical_Belt_Front",	Armor	- (Armor * xArmor)							,						
			"Base.Bag_Sniper_Hood",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)			,						
			"Base.Bag_Sniper_Pack",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)			,						
			"Base.Bag_ARVN_Rucksack",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)			,						
			"Base.Bag_SSO",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)			,						
			"Base.Bag_Radio_Pack",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)			,						
			"Base.Bag_ZIP",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)			,						
			"Base.Bag_Savotta",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)			,						
			"Base.Bag_Bush",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)			,						
			"Base.Bag_Hunting",	Armor	- (Armor * xArmor)				- (Armor * CIVxMIL)			,						
			"Base.AmmoStraps",	Armor	- (Armor * xArmor)							,						
			"Base.AmmoStrap_Bullets",	Armor	- (Armor * xArmor)							,						
			"Base.AmmoStrap_Shells",	Armor	- (Armor * xArmor)							,						
			"Base.HolsterSimple",	Armor	- (Armor * xArmor)							,						
			"Base.HolsterDouble",	Armor	- (Armor * xArmor)							,						
		}																
	},																	
																		
	CampingStoreClothes = {		--HuntArmor = {															
		rolls =	HNTRollARMOR	,														
		items = {																
			"Base.Ela_Jacket",	Armor	- (Armor * xArmor)				- (Armor * CIVxLEO)	- (Armor * CIVxMIL)			,					
			"Base.Ela_Pants",	Armor	- (Armor * xArmor)				- (Armor * CIVxLEO)	- (Armor * CIVxMIL)			,					
			"Base.Killa_Jacket",	Armor	- (Armor * xArmor)								,					
			"Base.Killa_Pants",	Armor	- (Armor * xArmor)								,					
			"Base.Gorka_Jacket",	Armor	- (Armor * xArmor)								,					
			"Base.Gorka_Jacket2",	Armor	- (Armor * xArmor)								,					
			"Base.Gorka_Jacket3",	Armor	- (Armor * xArmor)								,					
			"Base.Gorka_Pants",	Armor	- (Armor * xArmor)								,					
			"Base.Gorka_Pants2",	Armor	- (Armor * xArmor)								,					
			"Base.Gorka_Pants3",	Armor	- (Armor * xArmor)								,					
			"Base.Armor_Defender",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)		- (Armor * x90)	,					
			"Base.Armor_6B13",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)		- (Armor * x90)	,					
			"Base.Suit_Chempak",	Armor	- (Armor * xArmor)				- (Armor * CIVxLEO)	- (Armor * CIVxMIL)			,					
			"Base.Hat_Ela_Hat",	Armor	- (Armor * xArmor)				- (Armor * CIVxLEO)				,					
			"Base.Hat_Ela_Hat_Only",	Armor	- (Armor * xArmor)				- (Armor * CIVxLEO)				,					
			"Base.Hat_Killa",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)			,					
			"Base.Hat_Killa_Visor",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)			,					
			"Base.Hat_FAST_Opscore",	Armor	- (Armor * xArmor)				- (Armor * CIVxLEO)	- (Armor * CIVxMIL)			,					
			"Base.Hat_Beret_Tactical_Only",	Armor	- (Armor * xArmor)				- (Armor * CIVxLEO)				,					
			"Base.Hat_Sordin",	Armor	- (Armor * xArmor)				- (Armor * CIVxLEO)	- (Armor * CIVxMIL)			,					
			"Base.Hat_Astrocom",	Armor	- (Armor * xArmor)				- (Armor * CIVxLEO)	- (Armor * CIVxMIL)			,					
			"Base.Hat_M1_Helmet",	Armor	- (Armor * xArmor)								,					
			"Base.Hat_M1_Helmet_Ori",	Armor	- (Armor * xArmor)								,					
			"Base.Hat_Maska",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)		- (Armor * x90)	,					
			"Base.Hat_Maska_Visor",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)		- (Armor * x90)	,					
			"Base.Hat_Maska_Visor2",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)		- (Armor * x90)	,					
			"Base.Hat_Gentex_Helmet",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)			,					
			"Base.Hat_Face_Shield",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)			,					
			"Base.Hat_Helmet_Headset",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)			,					
			"Base.Hat_Sam_NV",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)			,					
			"Base.Hat_PVS15_ON",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)		- (Armor * x90)	,					
			"Base.Hat_NV18_ON",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)			,					
			"Base.Hat_FM53",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)			,					
			"Base.Hat_M50",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)			,					
			"Base.Hat_M45_GasMask",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)			,					
			"Base.Hat_MCU_GasMask",	Armor	- (Armor * xArmor)				- (Armor * CIVxLEO)	- (Armor * CIVxMIL)			,					
			"Base.Glasses_X1000",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)			,					
			"Base.Glasses_Crewman_Goggles",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)			,					
			"Base.Glasses_Napier",	Armor	- (Armor * xArmor)								,					
		}																
	},																	
																		
	CampingStoreBackpacks = {		--HuntArmor = {															
		rolls =	HNTRollARMOR	,														
		items = {																
			"Base.Bag_Plate_Carrier",	Armor	- (Armor * xArmor)				- (Armor * CIVxLEO)	- (Armor * CIVxMIL)			,					
			"Base.Bag_Blackhawk",	Armor	- (Armor * xArmor)				- (Armor * CIVxLEO)	- (Armor * CIVxMIL)			,					
			"Base.Bag_Duty_Belt_Front",	Armor	- (Armor * xArmor)				- (Armor * CIVxLEO)	- (Armor * CIVxMIL)			,					
			"Base.Bag_ST53_Set",	Armor	- (Armor * xArmor)				- (Armor * CIVxLEO)	- (Armor * CIVxMIL)			,					
			"Base.Bag_D3M",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)			,					
			"Base.Bag_Smersh_Vest",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)		- (Armor * x90)	,					
			"Base.Bag_Tactical_Belt_Front",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)			,					
			"Base.Bag_Sniper_Hood",	Armor	- (Armor * xArmor)								,					
			"Base.Bag_Sniper_Pack",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)			,					
			"Base.Bag_ARVN_Rucksack",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)			,					
			"Base.Bag_SSO",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)			,					
			"Base.Bag_Radio_Pack",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)			,					
			"Base.Bag_ZIP",	Armor	- (Armor * xArmor)								,					
			"Base.Bag_Savotta",	Armor	- (Armor * xArmor)								,					
			"Base.Bag_Bush",	Armor	- (Armor * xArmor)								,					
			"Base.Bag_Hunting",	Armor	- (Armor * xArmor)								,					
		}																
	},																	
																		
	ArmySurplusOutfit = {		--SurplusArmor = {															
		rolls =	SURRollARMOR	,														
		items = {																
			"Base.Ela_Jacket",	Armor	- (Armor * xArmor)				- (Armor * CIVxLEO)	- (Armor * CIVxMIL)			,					
			"Base.Ela_Pants",	Armor	- (Armor * xArmor)				- (Armor * CIVxLEO)	- (Armor * CIVxMIL)			,					
			"Base.Killa_Jacket",	Armor	- (Armor * xArmor)								,					
			"Base.Killa_Pants",	Armor	- (Armor * xArmor)								,					
			"Base.Gorka_Jacket",	Armor	- (Armor * xArmor)								,					
			"Base.Gorka_Jacket2",	Armor	- (Armor * xArmor)								,					
			"Base.Gorka_Jacket3",	Armor	- (Armor * xArmor)								,					
			"Base.Gorka_Pants",	Armor	- (Armor * xArmor)								,					
			"Base.Gorka_Pants2",	Armor	- (Armor * xArmor)								,					
			"Base.Gorka_Pants3",	Armor	- (Armor * xArmor)								,					
			"Base.Armor_Defender",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)		- (Armor * x90)	,					
			"Base.Armor_6B13",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)		- (Armor * x90)	,					
			"Base.Suit_Chempak",	Armor	- (Armor * xArmor)				- (Armor * CIVxLEO)	- (Armor * CIVxMIL)			,					
			"Base.Hat_Ela_Hat",	Armor	- (Armor * xArmor)								,					
			"Base.Hat_Ela_Hat_Only",	Armor	- (Armor * xArmor)								,					
			"Base.Hat_Killa",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)			,					
			"Base.Hat_Killa_Visor",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)			,					
			"Base.Hat_FAST_Opscore",	Armor	- (Armor * xArmor)				- (Armor * CIVxLEO)	- (Armor * CIVxMIL)			,					
			"Base.Hat_Beret_Tactical_Only",	Armor	- (Armor * xArmor)								,					
			"Base.Hat_Sordin",	Armor	- (Armor * xArmor)				- (Armor * CIVxLEO)	- (Armor * CIVxMIL)			,					
			"Base.Hat_Astrocom",	Armor	- (Armor * xArmor)				- (Armor * CIVxLEO)	- (Armor * CIVxMIL)			,					
			"Base.Hat_M1_Helmet",	Armor	- (Armor * xArmor)								,					
			"Base.Hat_M1_Helmet_Ori",	Armor	- (Armor * xArmor)								,					
			"Base.Hat_Maska",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)		- (Armor * x90)	,					
			"Base.Hat_Maska_Visor",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)		- (Armor * x90)	,					
			"Base.Hat_Maska_Visor2",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)		- (Armor * x90)	,					
			"Base.Hat_Gentex_Helmet",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)			,					
			"Base.Hat_Face_Shield",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)			,					
			"Base.Hat_Helmet_Headset",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)			,					
			"Base.Hat_Sam_NV",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)			,					
			"Base.Hat_PVS15_ON",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)		- (Armor * x90)	,					
			"Base.Hat_NV18_ON",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)			,					
			"Base.Hat_FM53",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)			,					
			"Base.Hat_M50",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)			,					
			"Base.Hat_M45_GasMask",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)			,					
			"Base.Hat_MCU_GasMask",	Armor	- (Armor * xArmor)				- (Armor * CIVxLEO)	- (Armor * CIVxMIL)			,					
			"Base.Glasses_X1000",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)			,					
			"Base.Glasses_Crewman_Goggles",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)			,					
			"Base.Glasses_Napier",	Armor	- (Armor * xArmor)								,					
			"Base.Bag_Plate_Carrier",	Armor	- (Armor * xArmor)				- (Armor * CIVxLEO)	- (Armor * CIVxMIL)			,					
			"Base.Bag_Blackhawk",	Armor	- (Armor * xArmor)				- (Armor * CIVxLEO)	- (Armor * CIVxMIL)			,					
			"Base.Bag_Duty_Belt_Front",	Armor	- (Armor * xArmor)				- (Armor * CIVxLEO)	- (Armor * CIVxMIL)			,					
			"Base.Bag_ST53_Set",	Armor	- (Armor * xArmor)				- (Armor * CIVxLEO)	- (Armor * CIVxMIL)			,					
			"Base.Bag_D3M",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)			,					
			"Base.Bag_Smersh_Vest",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)		- (Armor * x90)	,					
			"Base.Bag_Tactical_Belt_Front",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)			,					
			"Base.Bag_Sniper_Hood",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)			,					
			"Base.Bag_Sniper_Pack",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)			,					
			"Base.Bag_ARVN_Rucksack",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)			,					
			"Base.Bag_SSO",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)			,					
			"Base.Bag_Radio_Pack",	Armor	- (Armor * xArmor)					- (Armor * CIVxMIL)			,					
			"Base.Bag_ZIP",	Armor	- (Armor * xArmor)								,					
			"Base.Bag_Savotta",	Armor	- (Armor * xArmor)								,					
			"Base.Bag_Bush",	Armor	- (Armor * xArmor)								,					
			"Base.Bag_Hunting",	Armor	- (Armor * xArmor)								,					
			"Base.AmmoStraps",	Armor	- (Armor * xArmor)							,						
			"Base.AmmoStrap_Bullets",	Armor	- (Armor * xArmor)							,						
			"Base.AmmoStrap_Shells",	Armor	- (Armor * xArmor)							,						
			"Base.HolsterSimple",	Armor	- (Armor * xArmor)							,						
			"Base.HolsterDouble",	Armor	- (Armor * xArmor)							,						
		}																
	},																	
}																		
MergeDistributionRecursive(ProceduralDistributions, Brita_2_ProcDistro)																		
print("BRITA'S ARMOR PACK INSERTED IN PROCEDURAL LISTS")																		
end																		
																		
if getActivatedMods():contains("DRK_1") then																		
print("DRK_1 MOD DETECTED")																		
DRK_1_ProcDistro = {};																		
DRK_1_ProcDistro.list = {																		
																		
	ArmyStorageOutfit = {		--ArmyArmor = {															
		rolls =	MILRollArmor	,														
		items = {																
			"Base.Hat_PASGT_Helmet",	Armor	- (Armor * xArmor)		,											
			"Base.Hat_TPASGT_Helmet",	Armor	- (Armor * xArmor)		,											
			"Base.Interceptor_Armor",	Armor	- (Armor * xArmor)		,											
			"Base.Interceptor_Armor_v",	Armor	- (Armor * xArmor)		,											
			"Base.Interceptor_Armor_s",	Armor	- (Armor * xArmor)		,											
			"Base.Marpat_Jacket_w",	Armor	- (Armor * xArmor)		,											
			"Base.Marpat_Pants_w",	Armor	- (Armor * xArmor)		,											
			"Base.Marpat_Jacket_d",	Armor	- (Armor * xArmor)		,											
			"Base.Marpat_Pants_d",	Armor	- (Armor * xArmor)		,											
			"Base.Interceptor_Pouches",	Armor	- (Armor * xArmor)		,											
			"Base.Hat_USMC_Cap_w",	Armor	- (Armor * xArmor)		,											
			"Base.Hat_USMC_Cap_d",	Armor	- (Armor * xArmor)		,											
		}																
	},																	
																		
	SecurityArmor = {																	
		rolls =	SECRollARMOR	,														
		items = {																
			"Base.Hat_PASGT_Helmet",	Armor	- (Armor * xArmor)		,											
			"Base.Hat_TPASGT_Helmet",	Armor	- (Armor * xArmor)		,											
			"Base.Interceptor_Armor",	Armor	- (Armor * xArmor)		,											
			"Base.Interceptor_Armor_v",	Armor	- (Armor * xArmor)		,											
			"Base.Interceptor_Armor_s",	Armor	- (Armor * xArmor)		,											
			"Base.Marpat_Jacket_w",	Armor	- (Armor * xArmor)		,											
			"Base.Marpat_Pants_w",	Armor	- (Armor * xArmor)		,											
			"Base.Marpat_Jacket_d",	Armor	- (Armor * xArmor)		,											
			"Base.Marpat_Pants_d",	Armor	- (Armor * xArmor)		,											
			"Base.Interceptor_Pouches",	Armor	- (Armor * xArmor)		,											
			"Base.Hat_USMC_Cap_w",	Armor	- (Armor * xArmor)		,											
			"Base.Hat_USMC_Cap_d",	Armor	- (Armor * xArmor)		,											
		}																
	},																	
																		
	ArmySurplusOutfit = {		--SurplusArmor = {															
		rolls =	SURRollARMOR	,														
		items = {																
			"Base.Hat_PASGT_Helmet",	Armor	- (Armor * xArmor)		,											
			"Base.Hat_TPASGT_Helmet",	Armor	- (Armor * xArmor)		,											
			"Base.Interceptor_Armor",	Armor	- (Armor * xArmor)		,											
			"Base.Interceptor_Armor_v",	Armor	- (Armor * xArmor)		,											
			"Base.Interceptor_Armor_s",	Armor	- (Armor * xArmor)		,											
			"Base.Marpat_Jacket_w",	Armor	- (Armor * xArmor)		,											
			"Base.Marpat_Pants_w",	Armor	- (Armor * xArmor)		,											
			"Base.Marpat_Jacket_d",	Armor	- (Armor * xArmor)		,											
			"Base.Marpat_Pants_d",	Armor	- (Armor * xArmor)		,											
			"Base.Interceptor_Pouches",	Armor	- (Armor * xArmor)		,											
			"Base.Hat_USMC_Cap_w",	Armor	- (Armor * xArmor)		,											
			"Base.Hat_USMC_Cap_d",	Armor	- (Armor * xArmor)		,											
		}																
	},																	
}																		
MergeDistributionRecursive(ProceduralDistributions, DRK_1_ProcDistro)																		
print("USMC ARMORY MOD INSERTED IN PROCEDURAL LISTS")																		
end																		
else print ("ARMOR DISTRO OVERRIDE OPTION DISABLED")																		
end																		

local distributionTable = nil				-- PRIMARY LOOT SYSTEM								
-- local distributionTable2 = nil				-- MIX GUNS IN DISPLAYS & LOCKERS								
-- local distributionTable3 = nil				-- CASE AND CANISTERS								
												
												
distributionTable = {					-- NEW LISTS ONLY							
	------------------------------------------											
	--	GUNSTORE			--							
	------------------------------------------											
	gunstore = {											
		counter = {										
			procedural = true,									
			procList = {									
			--	{name =	"GunStoreGuns"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"GunStoreParts"	,min =	1	, max =	8	,weightChance = 	80	},
				{name =	"GunStoreAmmo"	,min =	1	, max =	8	,weightChance = 	80	},
			--	{name =	"GunStoreArmor"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"GunSupplies"	,min =	0	, max =	2	,weightChance = 	20	},
			--	{name =	"GunStoreCounter"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"StoreCounterCleaning"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"StoreCounterBags"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"GunStoreShelf"	,min =	0	, max =	4	,weightChance = 	40	},
			}									
		},										
		displaycase = {										
			procedural = true,									
			procList = {									
				{name =	"GunStoreGuns"	,min =	2	, max =	10	,weightChance = 	100	},
				{name =	"GunStoreParts"	,min =	1	, max =	8	,weightChance = 	80	},
				{name =	"GunStoreAmmo"	,min =	0	, max =	6	,weightChance = 	60	},
			--	{name =	"GunStoreArmor"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"GunSupplies"	,min =	0	, max =	4	,weightChance = 	40	},
			--	{name =	"GunStoreDisplayCase"	,min =	0	, max =	0	,weightChance = 	0	},
			}									
		},										
		locker = {										
			procedural = true,									
			procList = {									
				{name =	"GunStoreGuns"	,min =	2	, max =	10	,weightChance = 	100	},
				{name =	"GunStoreParts"	,min =	0	, max =	2	,weightChance = 	20	},
				{name =	"GunStoreAmmo"	,min =	0	, max =	2	,weightChance = 	20	},
			--	{name =	"GunStoreArmor"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"GunSupplies"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"GunStoreShelf"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"GunStoreAmmunition"	,min =	0	, max =	0	,weightChance = 	0	},
			}									
		},										
		shelves = {										
			procedural = true,									
			procList = {									
			--	{name =	"GunStoreGuns"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"GunStoreParts"	,min =	1	, max =	8	,weightChance = 	80	},
				{name =	"GunStoreAmmo"	,min =	1	, max =	8	,weightChance = 	80	},
			--	{name =	"GunStoreArmor"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"GunSupplies"	,min =	2	, max =	10	,weightChance = 	100	},
				{name =	"GunStoreShelf"	,min =	0	, max =	2	,weightChance = 	20	},
			--	{name =	"GunStoreAmmunition"	,min =	0	, max =	0	,weightChance = 	0	},
			}									
		},										
		metal_shelves = {										
			procedural = true,									
			procList = {									
			--	{name =	"GunStoreGuns"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"GunStoreParts"	,min =	0	, max =	6	,weightChance = 	60	},
				{name =	"GunStoreAmmo"	,min =	2	, max =	10	,weightChance = 	100	},
			--	{name =	"GunStoreArmor"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"GunSupplies"	,min =	0	, max =	4	,weightChance = 	40	},
				{name =	"GunStoreShelf"	,min =	1	, max =	1	,weightChance = 	100	},
			--	{name =	"GunStoreAmmunition"	,min =	0	, max =	0	,weightChance = 	0	},
			}									
		},										
		crate = {										
			procedural = true,									
			procList = {									
				{name =	"GunStoreGuns"	,min =	0	, max =	6	,weightChance = 	60	},
				{name =	"GunStoreParts"	,min =	1	, max =	8	,weightChance = 	80	},
				{name =	"GunStoreAmmo"	,min =	2	, max =	10	,weightChance = 	100	},
			--	{name =	"GunStoreArmor"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"GunSupplies"	,min =	1	, max =	8	,weightChance = 	80	},
				{name =	"GunStoreShelf"	,min =	0	, max =	4	,weightChance = 	40	},
			}									
		}										
	},											
												
	gunstorestorage = {											
		counter = {										
			procedural = true,									
			procList = {									
			--	{name =	"ArmyGuns"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"ArmyAmmo"	,min =	2	, max =	10	,weightChance = 	100	},
			--	{name =	"ArmyParts"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"ArmyArmor"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"GunSupplies"	,min =	1	, max =	8	,weightChance = 	80	},
			--	{name =		,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =		,min =	0	, max =	0	,weightChance = 	0	},
			}									
		},										
		locker = {										
			procedural = true,									
			procList = {									
				{name =	"ArmyStorageGuns"	,min =	2	, max =	10	,weightChance = 	100	},
				{name =	"ArmyAmmo"	,min =	0	, max =	2	,weightChance = 	20	},
				{name =	"ArmyStorageOutfit"	,min =	1	, max =	1	,weightChance = 	80	},
			--	{name =	"ArmyGuns"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"ArmyParts"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"ArmyArmor"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"GunSupplies"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"GunStoreShelf"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"GunStoreAmmunition"	,min =	0	, max =	0	,weightChance = 	0	},
			}									
		},										
		shelves = {										
			procedural = true,									
			procList = {									
			--	{name =	"ArmyGuns"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"ArmyAmmo"	,min =	0	, max =	2	,weightChance = 	20	},
			--	{name =	"ArmyParts"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"ArmyArmor"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"GunSupplies"	,min =	2	, max =	10	,weightChance = 	100	},
			--	{name =	"GunStoreShelf"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"GunStoreAmmunition"	,min =	0	, max =	0	,weightChance = 	0	},
			}									
		},										
		metal_shelves = {										
			procedural = true,									
			procList = {									
			--	{name =	"ArmyGuns"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"ArmyAmmo"	,min =	2	, max =	10	,weightChance = 	100	},
			--	{name =	"ArmyParts"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"ArmyArmor"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"GunSupplies"	,min =	1	, max =	8	,weightChance = 	80	},
			--	{name =	"GunStoreShelf"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"GunStoreAmmunition"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"ArmyStorageGuns"	,min =	0	, max =	2	,weightChance = 	20	},
				{name =	"ArmyStorageElectronics"	,min =	0	, max =	4	,weightChance = 	40	},
				{name =	"ArmyStorageOutfit"	,min =	0	, max =	4	,weightChance = 	40	},
			}									
		},										
		crate = {										
			procedural = true,									
			procList = {									
			--	{name =	"ArmyGuns"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"ArmyAmmo"	,min =	2	, max =	10	,weightChance = 	100	},
			--	{name =	"ArmyParts"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"ArmyArmor"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"GunSupplies"	,min =	1	, max =	8	,weightChance = 	80	},
			--	{name =	"GunStoreAmmunition"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"GunStoreDisplayCase"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"ArmyStorageGuns"	,min =	0	, max =	4	,weightChance = 	40	},
				{name =	"ArmyStorageOutfit"	,min =	0	, max =	4	,weightChance = 	40	},
			}									
		}										
	},											
												
	------------------------------------------											
	--	POLICE STORAGE			--							
	------------------------------------------											
	policestorage = {											
		counter = {										
			procedural = true,									
			procList = {									
			--	{name =	"PoliceGuns"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"PoliceParts"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"PoliceAmmo"	,min =	2	, max =	10	,weightChance = 	100	},
			--	{name =	"PoliceArmor"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"GunSupplies"	,min =	0	, max =	6	,weightChance = 	60	},
			--	{name =	NONE	,min =	0	, max =	0	,weightChance = 	0	},
			}									
		},										
		locker = {										
			procedural = true,									
			procList = {									
			--	{name =	"PoliceGuns"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"PoliceParts"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"PoliceAmmo"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"PoliceArmor"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"GunSupplies"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"PoliceStorageGuns"	,min =	2	, max =	10	,weightChance = 	100	},
			--	{name =	"PoliceStorageOutfit"	,min =	0	, max =	0	,weightChance = 	0	},
			}									
		},										
		metal_shelves = {										
			procedural = true,									
			procList = {									
			--	{name =	"PoliceGuns"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"PoliceParts"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"PoliceAmmo"	,min =	2	, max =	10	,weightChance = 	100	},
			--	{name =	"PoliceArmor"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"GunSupplies"	,min =	0	, max =	2	,weightChance = 	20	},
				{name =	"PoliceStorageOutfit"	,min =	1	, max =	6	,weightChance = 	100	},
				{name =	"PoliceStorageGuns"	,min =	0	, max =	6	,weightChance = 	100	},
			}									
		},										
		filingcabinet = {										
			procedural = true,									
			procList = {									
			--	{name =	"PoliceGuns"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"PoliceParts"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"PoliceAmmo"	,min =	0	, max =	2	,weightChance = 	20	},
			--	{name =	"PoliceArmor"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"GunSupplies"	,min =	1	, max =	8	,weightChance = 	80	},
			--	{name =	NONE	,min =	0	, max =	0	,weightChance = 	0	},
			}									
		},										
		crate = {										
			procedural = true,									
			procList = {									
			--	{name =	"PoliceGuns"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"PoliceParts"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"PoliceAmmo"	,min =	2	, max =	10	,weightChance = 	100	},
			--	{name =	"PoliceArmor"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"GunSupplies"	,min =	2	, max =	10	,weightChance = 	100	},
			--	{name =	NONE	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"PoliceStorageOutfit"	,min =	0	, max =	4	,weightChance = 	40	},
			}									
		}										
	},											
												
	------------------------------------------											
	--	SECURITY			--							
	------------------------------------------											
	security = {											
		counter = {										
			procedural = true,									
			procList = {									
				{name =	"SecurityGuns"	,min =	0	, max =	2	,weightChance = 	20	},
			--	{name =	"SecurityParts"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"SecurityAmmo"	,min =	2	, max =	10	,weightChance = 	100	},
				{name =	"SecurityArmor"	,min =	0	, max =	6	,weightChance = 	60	},
				{name =	"GunSupplies"	,min =	1	, max =	8	,weightChance = 	80	},
			}									
		},										
		locker = {										
			procedural = true,									
			procList = {									
				{name =	"SecurityGuns"	,min =	2	, max =	10	,weightChance = 	100	},
			--	{name =	"SecurityParts"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"SecurityAmmo"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"SecurityArmor"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"GunSupplies"	,min =	0	, max =	2	,weightChance = 	20	},
			--	{name =	"PoliceStorageGuns"	,min =	0	, max =	0	,weightChance = 	0	},
			}									
		},										
		metal_shelves = {										
			procedural = true,									
			procList = {									
				{name =	"SecurityGuns"	,min =	0	, max =	2	,weightChance = 	20	},
			--	{name =	"SecurityParts"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"SecurityAmmo"	,min =	2	, max =	10	,weightChance = 	100	},
				{name =	"SecurityArmor"	,min =	0	, max =	2	,weightChance = 	20	},
				{name =	"GunSupplies"	,min =	0	, max =	4	,weightChance = 	40	},
			}									
		},										
		crate = {										
			procedural = true,									
			procList = {									
				{name =	"SecurityGuns"	,min =	0	, max =	2	,weightChance = 	20	},
			--	{name =	"SecurityParts"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"SecurityAmmo"	,min =	2	, max =	10	,weightChance = 	100	},
				{name =	"SecurityArmor"	,min =	0	, max =	4	,weightChance = 	40	},
				{name =	"GunSupplies"	,min =	0	, max =	6	,weightChance = 	60	},
			}									
		}										
	},											
												
	------------------------------------------											
	--	ARMY STORAGE			--							
	------------------------------------------											
	armystorage = {											
		counter = {										
			procedural = true,									
			procList = {									
			--	{name =	"ArmyGuns"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"ArmyAmmo"	,min =	2	, max =	10	,weightChance = 	100	},
			--	{name =	"ArmyParts"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"ArmyArmor"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"GunSupplies"	,min =	1	, max =	8	,weightChance = 	80	},
			--	{name =	NONE	,min =	0	, max =	0	,weightChance = 	0	},
			}									
		},										
		locker = {										
			procedural = true,									
			procList = {									
				{name =	"ArmyStorageGuns"	,min =	2	, max =	10	,weightChance = 	100	},
				{name =	"ArmyAmmo"	,min =	0	, max =	2	,weightChance = 	20	},
				{name =	"ArmyStorageOutfit"	,min =	1	, max =	1	,weightChance = 	80	},
			--	{name =	"ArmyGuns"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"ArmyParts"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"ArmyArmor"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"GunSupplies"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"GunStoreShelf"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"GunStoreAmmunition"	,min =	0	, max =	0	,weightChance = 	0	},
			}									
		},										
		metal_shelves = {										
			procedural = true,									
			procList = {									
			--	{name =	"ArmyGuns"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"ArmyAmmo"	,min =	2	, max =	10	,weightChance = 	100	},
			--	{name =	"ArmyParts"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"ArmyArmor"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"GunSupplies"	,min =	1	, max =	8	,weightChance = 	80	},
				{name =	"ArmyStorageGuns"	,min =	0	, max =	2	,weightChance = 	20	},
				{name =	"ArmyStorageElectronics"	,min =	0	, max =	4	,weightChance = 	40	},
				{name =	"ArmyStorageOutfit"	,min =	0	, max =	4	,weightChance = 	40	},
			}									
		},										
		crate = {										
			procedural = true,									
			procList = {									
			--	{name =	"ArmyGuns"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"ArmyAmmo"	,min =	2	, max =	10	,weightChance = 	100	},
			--	{name =	"ArmyParts"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"ArmyArmor"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"GunSupplies"	,min =	1	, max =	8	,weightChance = 	80	},
				{name =	"ArmyStorageGuns"	,min =	0	, max =	4	,weightChance = 	40	},
				{name =	"ArmyStorageOutfit"	,min =	0	, max =	4	,weightChance = 	40	},
			--	{name =	NONE	,min =	0	, max =	0	,weightChance = 	0	},
			}									
		}										
	},											
												
	------------------------------------------											
	--	HUNTING			--							
	------------------------------------------											
	hunting = {											
		counter = {										
			procedural = true,									
			procList = {									
				{name =	"HuntGuns"	,min =	0	, max =	2	,weightChance = 	20	},
				{name =	"HuntParts"	,min =	1	, max =	8	,weightChance = 	80	},
				{name =	"HuntAmmo"	,min =	1	, max =	8	,weightChance = 	80	},
			--	{name =	"HuntArmor"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"GunSupplies"	,min =	1	, max =	8	,weightChance = 	80	},
			--	{name =	"StoreCounterCleaning"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"StoreCounterBags"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"CampingStoreBooks"	,min =	0	, max =	6	,weightChance = 	60	},
			--	{name =	"CampingStoreLegwear"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"CampingStoreBackpacks"	,min =	0	, max =	6	,weightChance = 	60	},
			--	{name =	"CampingStoreGear"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"FishingStoreGear"	,min =	0	, max =	0	,weightChance = 	0	},
			}									
		},										
		displaycase = {										
			procedural = true,									
			procList = {									
				{name =	"HuntGuns"	,min =	2	, max =	10	,weightChance = 	100	},
				{name =	"HuntParts"	,min =	0	, max =	6	,weightChance = 	60	},
				{name =	"HuntAmmo"	,min =	0	, max =	4	,weightChance = 	40	},
			--	{name =	"HuntArmor"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"GunSupplies"	,min =	1	, max =	8	,weightChance = 	80	},
			--	{name =	"GunStoreDisplayCase"	,min =	0	, max =	0	,weightChance = 	0	},
			}									
		},										
		locker = {										
			procedural = true,									
			procList = {									
				{name =	"HuntGuns"	,min =	2	, max =	10	,weightChance = 	100	},
				{name =	"HuntParts"	,min =	0	, max =	2	,weightChance = 	20	},
			--	{name =	"HuntAmmo"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"HuntArmor"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"GunSupplies"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"GunStoreDisplayCase"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"GunStoreAmmunition"	,min =	0	, max =	0	,weightChance = 	0	},
			}									
		},										
		shelves = {										
			procedural = true,									
			procList = {									
			--	{name =	"HuntGuns"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"HuntParts"	,min =	0	, max =	6	,weightChance = 	60	},
				{name =	"HuntAmmo"	,min =	2	, max =	10	,weightChance = 	100	},
			--	{name =	"HuntArmor"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"GunSupplies"	,min =	2	, max =	10	,weightChance = 	100	},
			}									
		},										
		metal_shelves = {										
			procedural = true,									
			procList = {									
			--	{name =	"HuntGuns"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"HuntParts"	,min =	0	, max =	6	,weightChance = 	60	},
				{name =	"HuntAmmo"	,min =	2	, max =	10	,weightChance = 	100	},
			--	{name =	"HuntArmor"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"GunSupplies"	,min =	2	, max =	10	,weightChance = 	100	},
			--	{name =	"GunStoreShelf"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"GunStoreAmmunition"	,min =	0	, max =	0	,weightChance = 	0	},
			}									
		},										
		crate = {										
			procedural = true,									
			procList = {									
				{name =	"HuntGuns"	,min =	0	, max =	2	,weightChance = 	20	},
				{name =	"HuntParts"	,min =	0	, max =	4	,weightChance = 	40	},
				{name =	"HuntAmmo"	,min =	1	, max =	8	,weightChance = 	80	},
			--	{name =	"HuntArmor"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"GunSupplies"	,min =	2	, max =	10	,weightChance = 	100	},
			}									
		}										
	},											
												
	------------------------------------------											
	--	SURPLUS			--							
	------------------------------------------											
	armysurplus = {											
		counter = {										
			procedural = true,									
			procList = {									
				{name =	"SurplusGuns"	,min =	0	, max =	2	,weightChance = 	20	},
				{name =	"SurplusParts"	,min =	1	, max =	8	,weightChance = 	80	},
				{name =	"SurplusAmmo"	,min =	1	, max =	8	,weightChance = 	80	},
			--	{name =	"SurplusArmor"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"GunSupplies"	,min =	2	, max =	10	,weightChance = 	100	},
			--	{name =	"ArmySurplusHeadwear"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"StoreCounterCleaning"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"StoreCounterBags"	,min =	0	, max =	0	,weightChance = 	0	},
			}									
		},										
		displaycase = {										
			procedural = true,									
			procList = {									
				{name =	"SurplusGuns"	,min =	2	, max =	10	,weightChance = 	100	},
				{name =	"SurplusParts"	,min =	1	, max =	8	,weightChance = 	80	},
				{name =	"SurplusAmmo"	,min =	0	, max =	2	,weightChance = 	20	},
			--	{name =	"SurplusArmor"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"GunSupplies"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"ArmySurplusOutfit"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	NONE	,min =	0	, max =	0	,weightChance = 	0	},
			}									
		},										
		locker = {										
			procedural = true,									
			procList = {									
				{name =	"SurplusGuns"	,min =	2	, max =	10	,weightChance = 	100	},
				{name =	"SurplusParts"	,min =	0	, max =	2	,weightChance = 	20	},
				{name =	"SurplusAmmo"	,min =	0	, max =	2	,weightChance = 	20	},
			--	{name =	"SurplusArmor"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"GunSupplies"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	NONE	,min =	0	, max =	0	,weightChance = 	0	},
			}									
		},										
		shelves = {										
			procedural = true,									
			procList = {									
			--	{name =	"SurplusGuns"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"SurplusParts"	,min =	0	, max =	6	,weightChance = 	60	},
				{name =	"SurplusAmmo"	,min =	2	, max =	10	,weightChance = 	100	},
			--	{name =	"SurplusArmor"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"GunSupplies"	,min =	1	, max =	8	,weightChance = 	80	},
				{name =	"ArmySurplusOutfit"	,min =	0	, max =	4	,weightChance = 	40	},
			--	{name =	"ArmySurplusBackpacks"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"CampingStoreGear"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"ArmyStorageElectronics"	,min =	0	, max =	0	,weightChance = 	0	},
			}									
		},										
		metal_shelves = {										
			procedural = true,									
			procList = {									
				{name =	"SurplusGuns"	,min =	0	, max =	2	,weightChance = 	20	},
				{name =	"SurplusParts"	,min =	0	, max =	4	,weightChance = 	40	},
				{name =	"SurplusAmmo"	,min =	2	, max =	10	,weightChance = 	100	},
			--	{name =	"SurplusArmor"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"GunSupplies"	,min =	0	, max =	6	,weightChance = 	60	},
				{name =	"ArmySurplusOutfit"	,min =	0	, max =	2	,weightChance = 	20	},
			--	{name =	"ArmySurplusBackpacks"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"CampingStoreGear"	,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =	"ArmyStorageElectronics"	,min =	0	, max =	0	,weightChance = 	0	},
			}									
		},										
		crate = {										
			procedural = true,									
			procList = {									
				{name =	"SurplusGuns"	,min =	0	, max =	2	,weightChance = 	20	},
				{name =	"SurplusParts"	,min =	0	, max =	6	,weightChance = 	60	},
				{name =	"SurplusAmmo"	,min =	2	, max =	10	,weightChance = 	100	},
			--	{name =	"SurplusArmor"	,min =	0	, max =	0	,weightChance = 	0	},
				{name =	"GunSupplies"	,min =	1	, max =	8	,weightChance = 	80	},
				{name =	"ArmySurplusOutfit"	,min =	0	, max =	2	,weightChance = 	20	},
			--	{name =		,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =		,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =		,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =		,min =	0	, max =	0	,weightChance = 	0	},
			}									
		}										
	},											
												
	------------------------------------------											
	--	STORAGE UNIT			--							
	------------------------------------------											
	storageunit = {				-- <<== RANDOM LOW CHANCE							
		locker = {										
			procedural = true,									
			procList = {									
				{name =	"FirearmWeapons"	,min =	0	, max =	1	,weightChance = 	80	},
				{name =	"GunStoreParts"	,min =	0	, max =	1	,weightChance = 	20	},
			--	{name =		,min =	0	, max =	0	,weightChance = 		},
			}									
		},										
		metal_shelves = {										
			procedural = true,									
			procList = {									
				{name =	"GunStoreAmmo"	,min =	0	, max =	1	,weightChance = 	1	},
				{name =	"GunStoreParts"	,min =	0	, max =	1	,weightChance = 	1	},
				{name =	"RandomCaseAndCan"	,min =	0	, max =	1	,weightChance = 	1	},
			--	{name =		,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =		,min =	0	, max =	0	,weightChance = 	0	},
			}									
		},										
		crate = {										
			procedural = true,									
			procList = {									
				{name =	"GunStoreAmmo"	,min =	0	, max =	1	,weightChance = 	1	},
				{name =	"GunStoreParts"	,min =	0	, max =	1	,weightChance = 	1	},
				{name =	"RandomCaseAndCan"	,min =	0	, max =	1	,weightChance = 	1	},
			--	{name =		,min =	0	, max =	0	,weightChance = 	0	},
			--	{name =		,min =	0	, max =	0	,weightChance = 	0	},
			}									
		}										
	},											
												
												
	Bag_Schoolbag = {											
		rolls = 3,				-- <<<==== VANILLA DEFAULT, NO PROC METHOD, JUST ADD TO EXISTING						
		items = {										
			"Base.UmarexSS",		0.1	- (wBB * xBB)	- (wBB * CIVx * x90)	,				
			"Base.BB177Box",		1	- (wBB * xBB)		,				
			"Base.BB177Box",		0.5	- (wBB * xBB)		,				
		},										
	},											
												
	Toolbox = {											
		rolls = 1,				-- <<<==== VANILLA DEFAULT, NO PROC METHOD, JUST ADD TO EXISTING						
		items = {										
			"Base.Oil_Filter",		12			,				
			"Base.WD",		6			,				
		},										
	},											
												
	Guitarcase = {											
		rolls = 1,				-- <<<==== VANILLA DEFAULT, NO PROC METHOD, JUST ADD TO EXISTING						
		items = {										
			"Base.AR7_Fold",		0.01	- (w22 * x22)		,				
			"Base.EDM96_Fold",		0.01	- (wBMG * xBMG)	- (wBMG * CIVx * x90)	,				
			"Base.SUB2000_Fold",		0.01	- (w9 * x9)	- (w9 * CIVx * x90)	,				
			"Base.Coachgun_Pistol",		0.01	- (w12g * x12g)		,				
			"Base.DT11_Pistol",		0.01	- (w12g * x12g)		,				
			"Base.MAC10_Fold",		0.01	- (w45 * x45)		,				
			"Base.Commando",		0.01	- (w9 * x9)		,				
		},										
	},											
}												
												
table.insert(Distributions, 1, distributionTable);												
