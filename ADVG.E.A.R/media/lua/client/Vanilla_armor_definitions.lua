--Body Parts List --> Foot_L, Foot_R, ForeArm_L, ForeArm_R, Groin, Hand_L, Hand_R, Head, LowerLeg_L, LowerLeg_R, MAX, Neck, Torso_Lower, Torso_Upper, UpperArm_L, UpperArm_R, UpperLeg_L, UpperLeg_R 
--Available Res Types list --> ScratchRes|DeepWoundRes|BurnRes|BulletRes|FractureRes|GlassRes|BiteRes

if(ItemValueTable == nil) then ItemValueTable = {}; end
-- ItemValueTable["Armor.ArmorShieldriot"] = 8.00;
-- ItemValueTable["Armor.ArmorLegarmorriot"] = 8.00;
-- ItemValueTable["Armor.ArmorArmorriot"] = 10.00;
-- ItemValueTable["Armor.ArmorArmarmorriot"] = 8.00;
-- ItemValueTable["Armor.ArmorGloveriot"] = 8.00;
-- ItemValueTable["Armor.ArmorHelmriot"] = 8.00;

ItemValueTable["Base.Hat_RiotHelmet"] = 8.00;

-- ItemValueTable["Armor.ArmorLegarmorkevlar"] = 8.00;
-- ItemValueTable["Armor.ArmorArmorkevlar"] = 10.00;
-- ItemValueTable["Armor.ArmorArmarmorkevlar"] = 8.00;
-- ItemValueTable["Armor.ArmorHelmkevlar"] = 8.00;

ItemValueTable["Base.Vest_BulletArmy"] = 10.00;
ItemValueTable["Base.Vest_BulletCivilian"] = 10.00;
ItemValueTable["Base.Vest_BulletPolice"] = 10.00;

ItemValueTable["Base.Hat_Army"] = 8.00;

-- ItemValueTable["Armor.ArmorArmarmorswat"] = 8.00;
-- ItemValueTable["Armor.ArmorHelmswat"] = 8.00;
-- ItemValueTable["Armor.ArmorLegarmorswat"] = 8.00;
-- ItemValueTable["Armor.ArmorArmorswat"] = 10.00;


if(GlobalArmor == nil) then GlobalArmor = {} end

-- Helmets	
	local WorkingArmor;
	
	WorkingArmor = "Hat_HardHat";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 60};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Head = 60};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 60};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Head = 60};	
		GlobalArmor[WorkingArmor]["Durability"] = 40;
		GlobalArmor[WorkingArmor]["Location"] = "Head";
		
	WorkingArmor = "Hat_HardHat_Miner";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 60};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Head = 60};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 60};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Head = 60};	
		GlobalArmor[WorkingArmor]["Durability"] = 40;
		GlobalArmor[WorkingArmor]["Location"] = "Head";
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 100};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 100};
		
	WorkingArmor = "WeldingMask";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 25};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Head = 25};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 25};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Head = 25};
		GlobalArmor[WorkingArmor]["BurnRes"] = {Head = 80};			
		GlobalArmor[WorkingArmor]["Durability"] = 40;
		GlobalArmor[WorkingArmor]["Location"] = "Head";
		GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 30};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 50};
		
	WorkingArmor = "Hat_HockeyHelmet";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 60};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Head = 60};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 60};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Head = 60};	
		GlobalArmor[WorkingArmor]["Durability"] = 30;
		GlobalArmor[WorkingArmor]["Location"] = "Head";
		GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 100};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 100};
		
	WorkingArmor = "Hat_FootballHelmet";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 60};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Head = 60};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 60};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Head = 60};	
		GlobalArmor[WorkingArmor]["Durability"] = 30;
		GlobalArmor[WorkingArmor]["Location"] = "Head";
		GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 100};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 100};
		
	WorkingArmor = "BicycleHelmet";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 50};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Head = 50};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 50};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Head = 50};	
		GlobalArmor[WorkingArmor]["Durability"] = 20;
		GlobalArmor[WorkingArmor]["Location"] = "Head";
		
	WorkingArmor = "Hat_CrashHelmet";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 80};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Head = 80};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 80};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Head = 80};	
		GlobalArmor[WorkingArmor]["Durability"] = 40;
		GlobalArmor[WorkingArmor]["Location"] = "Head";
		GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 100};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 100};
		
	WorkingArmor = "Hat_CrashHelmetFULL";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 80};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Head = 80};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 80};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Head = 80};	
		GlobalArmor[WorkingArmor]["Durability"] = 40;
		GlobalArmor[WorkingArmor]["Location"] = "Head";
		GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 100};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 100};
		
	WorkingArmor = "Hat_CrashHelmet_Police";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 80};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Head = 80};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 80};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Head = 80};	
		GlobalArmor[WorkingArmor]["Durability"] = 40;
		GlobalArmor[WorkingArmor]["Location"] = "Head";
		GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 100};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 100};
		
	WorkingArmor = "Hat_CrashHelmet_Stars";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 80};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Head = 80};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 80};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Head = 80};	
		GlobalArmor[WorkingArmor]["Durability"] = 40;
		GlobalArmor[WorkingArmor]["Location"] = "Head";
		GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 100};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 100};

	WorkingArmor = "Hat_Fireman";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 80};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Head = 80};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 80};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Head = 80};
		GlobalArmor[WorkingArmor]["BurnRes"] = {Head = 80};			
		GlobalArmor[WorkingArmor]["Durability"] = 80;
		GlobalArmor[WorkingArmor]["Location"] = "Head";
		GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 100};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 100};
		
	WorkingArmor = "Hat_Army";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 60};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Head = 60};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 60};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Head = 60};
		GlobalArmor[WorkingArmor]["BulletRes"] = {Head = 90};
		--GlobalArmor[WorkingArmor]["BulletRes"] = {Head = 99, Neck = 90, Torso_Upper = 99, Torso_Lower = 99, UpperArm_L = 99, UpperArm_R = 99, ForeArm_L = 99, ForeArm_R = 99, Hand_L = 99, Hand_R = 99, Groin = 99, Torso_Lower = 99, UpperLeg_L = 99, UpperLeg_R = 99, LowerLeg_L = 99, LowerLeg_R = 99, Foot_L = 99, Foot_R = 99};
		
		GlobalArmor[WorkingArmor]["Durability"] = 100;
		GlobalArmor[WorkingArmor]["Location"] = "Head";
		GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 100};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 100};
		
	WorkingArmor = "Hat_RiotHelmet";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Head = 90};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Head = 90};
		GlobalArmor[WorkingArmor]["BulletRes"] = {Head = 80};			
		GlobalArmor[WorkingArmor]["Durability"] = 80;
		GlobalArmor[WorkingArmor]["Location"] = "Head";
		GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 100};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 100};
		
-- Gloves

	WorkingArmor = "Gloves_LeatherGloves";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Hand_L = 20, Hand_R = 20} ;
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Hand_L = 20, Hand_R = 20} ;	
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Hand_L = 20, Hand_R = 20} ;
		GlobalArmor[WorkingArmor]["GlassRes"] = {Hand_L = 20, Hand_R = 20};		
		GlobalArmor[WorkingArmor]["Durability"] = 10;	
		GlobalArmor[WorkingArmor]["Location"] = "Hands";	
		GlobalArmor[WorkingArmor]["BiteRes"] = {Hand_L = 15, Hand_R = 15};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Hand_L = 30, Hand_R = 30};

	WorkingArmor = "Gloves_LeatherGlovesBlack";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Hand_L = 20, Hand_R = 20} ;
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Hand_L = 20, Hand_R = 20} ;	
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Hand_L = 20, Hand_R = 20} ;
		GlobalArmor[WorkingArmor]["GlassRes"] = {Hand_L = 20, Hand_R = 20};		
		GlobalArmor[WorkingArmor]["Durability"] = 10;	
		GlobalArmor[WorkingArmor]["Location"] = "Hands";	
		GlobalArmor[WorkingArmor]["BiteRes"] = {Hand_L = 15, Hand_R = 15};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Hand_L = 30, Hand_R = 30};	
		
-- Arm Armor	
		
-- Torso Armor

	WorkingArmor = "HazmatSuit";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["BurnRes"] = {Head = 90, Neck = 90, Torso_Upper = 90, Torso_Lower = 90, UpperArm_L = 90, UpperArm_R = 90, ForeArm_L = 90, ForeArm_R = 90, Hand_L = 90, Hand_R = 90, Groin = 90, Torso_Lower = 90, UpperLeg_L = 90, UpperLeg_R = 90, LowerLeg_L = 90, LowerLeg_R = 90, Foot_L = 90, Foot_R = 90};			
		GlobalArmor[WorkingArmor]["Durability"] = 20;
		GlobalArmor[WorkingArmor]["Location"] = "Body";
		GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 5, Neck = 5, Torso_Upper = 5, Torso_Lower = 5, UpperArm_L = 5, UpperArm_R = 5, ForeArm_L = 5, ForeArm_R = 5, Hand_L = 5, Hand_R = 5, Groin = 5, Torso_Lower = 5, UpperLeg_L = 5, UpperLeg_R = 5, LowerLeg_L = 5, LowerLeg_R = 5, Foot_L = 5, Foot_R = 5};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 15, Neck = 15, Torso_Upper = 15, Torso_Lower = 15, UpperArm_L = 15, UpperArm_R = 51, ForeArm_L = 15, ForeArm_R = 15, Hand_L = 15, Hand_R = 15, Groin = 15, Torso_Lower = 15, UpperLeg_L = 15, UpperLeg_R = 15, LowerLeg_L = 15, LowerLeg_R = 15, Foot_L = 15, Foot_R = 15};

	WorkingArmor = "Jacket_Fireman";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 25, Torso_Upper = 25, UpperArm_L = 25, UpperArm_R = 25};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 25, Torso_Upper = 25, Torso_Lower = 25, UpperArm_L = 25, UpperArm_R = 25, ForeArm_L = 25, ForeArm_R = 25};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 25, Torso_Upper = 25, UpperArm_L = 25, UpperArm_R = 25};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 25, Torso_Upper = 25, Torso_Lower = 25, UpperArm_L = 25, UpperArm_R = 25, ForeArm_L = 25, ForeArm_R = 25};		
		GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 50, Torso_Upper = 50, Torso_Lower = 50, UpperArm_L = 50, UpperArm_R = 50, ForeArm_L = 50, ForeArm_R = 50};	
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 70, Torso_Upper = 70, Torso_Lower = 70, UpperArm_L = 70, UpperArm_R = 70, ForeArm_L = 70, ForeArm_R = 70};		
		GlobalArmor[WorkingArmor]["BurnRes"] = {Neck = 80, Torso_Upper = 80, Torso_Lower = 80, UpperArm_L = 80, UpperArm_R = 80, ForeArm_L = 80, ForeArm_R = 80};				
		GlobalArmor[WorkingArmor]["Durability"] = 80;
		GlobalArmor[WorkingArmor]["Location"] = "Body";

	WorkingArmor = "Jacket_ArmyCamoGreen";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 25, Torso_Upper = 25};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 25, Torso_Upper = 25, Torso_Lower = 25, UpperArm_L = 25, UpperArm_R = 25, ForeArm_L = 25, ForeArm_R = 25};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 25, Torso_Upper = 25};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 25, Torso_Upper = 25, Torso_Lower = 25, UpperArm_L = 25, UpperArm_R = 25, ForeArm_L = 25, ForeArm_R = 25};			
		GlobalArmor[WorkingArmor]["Durability"] = 3;
		GlobalArmor[WorkingArmor]["Location"] = "Body";
		GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 30, Torso_Upper = 30, Torso_Lower = 30, UpperArm_L = 30, UpperArm_R = 30, ForeArm_L = 30, ForeArm_R = 30};		
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 50, Torso_Upper = 50, Torso_Lower = 50, UpperArm_L = 50, UpperArm_R = 50, ForeArm_L = 50, ForeArm_R = 50};	

	WorkingArmor = "Jacket_ArmyCamoDesert";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 25, Torso_Upper = 25};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 25, Torso_Upper = 25, Torso_Lower = 25, UpperArm_L = 25, UpperArm_R = 25, ForeArm_L = 25, ForeArm_R = 25};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 25, Torso_Upper = 25};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 25, Torso_Upper = 25, Torso_Lower = 25, UpperArm_L = 25, UpperArm_R = 25, ForeArm_L = 25, ForeArm_R = 25};			
		GlobalArmor[WorkingArmor]["Durability"] = 3;
		GlobalArmor[WorkingArmor]["Location"] = "Body";
		GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 30, Torso_Upper = 30, Torso_Lower = 30, UpperArm_L = 30, UpperArm_R = 30, ForeArm_L = 30, ForeArm_R = 30};		
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 50, Torso_Upper = 50, Torso_Lower = 50, UpperArm_L = 50, UpperArm_R = 50, ForeArm_L = 50, ForeArm_R = 50};	
		
	WorkingArmor = "ArmorArmorleatherjacket";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 20, Torso_Upper = 20};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 20, Torso_Upper = 20, Torso_Lower = 20, UpperArm_L = 20, UpperArm_R = 20, ForeArm_L = 20, ForeArm_R = 20};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 20, Torso_Upper = 20};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 20, Torso_Upper = 20, Torso_Lower = 20, UpperArm_L = 20, UpperArm_R = 20, ForeArm_L = 20, ForeArm_R = 20};			
		GlobalArmor[WorkingArmor]["Durability"] = 5;	
		GlobalArmor[WorkingArmor]["Location"] = "Body";
		
	WorkingArmor = "Jacket_Black";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 20, Torso_Upper = 20};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 20, Torso_Upper = 20, Torso_Lower = 20, UpperArm_L = 20, UpperArm_R = 20, ForeArm_L = 20, ForeArm_R = 20};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 20, Torso_Upper = 20};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 20, Torso_Upper = 20, Torso_Lower = 20, UpperArm_L = 20, UpperArm_R = 20, ForeArm_L = 20, ForeArm_R = 20};			
		GlobalArmor[WorkingArmor]["Durability"] = 5;	
		GlobalArmor[WorkingArmor]["Location"] = "Body";
		GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 20, Torso_Upper = 20, Torso_Lower = 20, UpperArm_L = 20, UpperArm_R = 20, ForeArm_L = 20, ForeArm_R = 20};		
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 40, Torso_Upper = 40, Torso_Lower = 40, UpperArm_L = 40, UpperArm_R = 40, ForeArm_L = 50, ForeArm_R = 40};	

	WorkingArmor = "WeddingJacket";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 15, Torso_Upper = 15};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 15, Torso_Upper = 15, Torso_Lower = 15, UpperArm_L = 15, UpperArm_R = 15, ForeArm_L = 15, ForeArm_R = 15};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 15, Torso_Upper = 15};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 15, Torso_Upper = 15, Torso_Lower = 15, UpperArm_L = 15, UpperArm_R = 15, ForeArm_L = 15, ForeArm_R = 15};			
		GlobalArmor[WorkingArmor]["Durability"] = 2;
		GlobalArmor[WorkingArmor]["Location"] = "Body";	

	WorkingArmor = "Ghillie_Top";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 15, Torso_Upper = 15};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 15, Torso_Upper = 15, Torso_Lower = 15, UpperArm_L = 15, UpperArm_R = 15, ForeArm_L = 15, ForeArm_R = 15};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 15, Torso_Upper = 15};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 15, Torso_Upper = 15, Torso_Lower = 15, UpperArm_L = 15, UpperArm_R = 15, ForeArm_L = 15, ForeArm_R = 15};			
		GlobalArmor[WorkingArmor]["Durability"] = 2;
		GlobalArmor[WorkingArmor]["Location"] = "Body";		

	WorkingArmor = "Suit_Jacket";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 15, Torso_Upper = 15};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 15, Torso_Upper = 15, Torso_Lower = 15, UpperArm_L = 15, UpperArm_R = 15, ForeArm_L = 15, ForeArm_R = 15};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 15, Torso_Upper = 15};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 15, Torso_Upper = 15,  Torso_Lower = 15,UpperArm_L = 15, UpperArm_R = 15, ForeArm_L = 15, ForeArm_R = 15};			
		GlobalArmor[WorkingArmor]["Durability"] = 2;
		GlobalArmor[WorkingArmor]["Location"] = "Body";		

	WorkingArmor = "Jacket_Varsity";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 15, Torso_Upper = 15};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 15, Torso_Upper = 15, Torso_Lower = 15, UpperArm_L = 15, UpperArm_R = 15, ForeArm_L = 15, ForeArm_R = 15};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 15, Torso_Upper = 15};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 15, Torso_Upper = 15, Torso_Lower = 15, UpperArm_L = 15, UpperArm_R = 15, ForeArm_L = 15, ForeArm_R = 15};			
		GlobalArmor[WorkingArmor]["Durability"] = 2;
		GlobalArmor[WorkingArmor]["Location"] = "Body";		

	WorkingArmor = "JacketLong_Doctor";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 15, Torso_Upper = 15};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 15, Torso_Upper = 15, Torso_Lower = 15, UpperArm_L = 15, UpperArm_R = 15, ForeArm_L = 15, ForeArm_R = 15};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 15, Torso_Upper = 15};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 15, Torso_Upper = 15, Torso_Lower = 15, UpperArm_L = 15, UpperArm_R = 15, ForeArm_L = 15, ForeArm_R = 15};			
		GlobalArmor[WorkingArmor]["Durability"] = 2;
		GlobalArmor[WorkingArmor]["Location"] = "Body";		

	WorkingArmor = "Jacket_CoatArmy";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 15, Torso_Upper = 15};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 15, Torso_Upper = 15, Torso_Lower = 15, UpperArm_L = 15, UpperArm_R = 15, ForeArm_L = 15, ForeArm_R = 15};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 15, Torso_Upper = 15};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 15, Torso_Upper = 15, Torso_Lower = 15, UpperArm_L = 15, UpperArm_R = 15, ForeArm_L = 15, ForeArm_R = 15};			
		GlobalArmor[WorkingArmor]["Durability"] = 2;
		GlobalArmor[WorkingArmor]["Location"] = "Body";		
		
		--GlobalArmor[WorkingArmor]["BulletRes"] = {Head = 99, Neck = 90, Torso_Upper = 99, Torso_Lower = 99, UpperArm_L = 99, UpperArm_R = 99, ForeArm_L = 99, ForeArm_R = 99, Hand_L = 99, Hand_R = 99, Groin = 99, Torso_Lower = 99, UpperLeg_L = 99, UpperLeg_R = 99, LowerLeg_L = 99, LowerLeg_R = 99, Foot_L = 99, Foot_R = 99};

	WorkingArmor = "JacketLong_Random";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 15, Torso_Upper = 15};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 15, Torso_Upper = 15, Torso_Lower = 15, UpperArm_L = 15, UpperArm_R = 15, ForeArm_L = 15, ForeArm_R = 15};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 15, Torso_Upper = 15};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 15, Torso_Upper = 15, Torso_Lower = 15, UpperArm_L = 15, UpperArm_R = 15, ForeArm_L = 15, ForeArm_R = 15};			
		GlobalArmor[WorkingArmor]["Durability"] = 2;
		GlobalArmor[WorkingArmor]["Location"] = "Body";		

	WorkingArmor = "JacketLong_Santa";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 15, Torso_Upper = 15};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 15, Torso_Upper = 15, Torso_Lower = 15, UpperArm_L = 15, UpperArm_R = 15, ForeArm_L = 15, ForeArm_R = 15};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 15, Torso_Upper = 15};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 15, Torso_Upper = 15, Torso_Lower = 15, UpperArm_L = 15, UpperArm_R = 15, ForeArm_L = 15, ForeArm_R = 15};			
		GlobalArmor[WorkingArmor]["Durability"] = 2;
		GlobalArmor[WorkingArmor]["Location"] = "Body";		

	WorkingArmor = "JacketLong_SantaGreen";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 15, Torso_Upper = 15};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 15, Torso_Upper = 15, Torso_Lower = 15, UpperArm_L = 15, UpperArm_R = 15, ForeArm_L = 15, ForeArm_R = 15};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 15, Torso_Upper = 15};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 15, Torso_Upper = 15, Torso_Lower = 15, UpperArm_L = 15, UpperArm_R = 15, ForeArm_L = 15, ForeArm_R = 15};			
		GlobalArmor[WorkingArmor]["Durability"] = 2;
		GlobalArmor[WorkingArmor]["Location"] = "Body";		

	WorkingArmor = "Jacket_Chef";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 15, Torso_Upper = 15};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 15, Torso_Upper = 15, Torso_Lower = 15, UpperArm_L = 15, UpperArm_R = 15, ForeArm_L = 15, ForeArm_R = 15};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 15, Torso_Upper = 15};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 15, Torso_Upper = 15, Torso_Lower = 15, UpperArm_L = 15, UpperArm_R = 15, ForeArm_L = 15, ForeArm_R = 15};			
		GlobalArmor[WorkingArmor]["Durability"] = 2;
		GlobalArmor[WorkingArmor]["Location"] = "Body";		

	WorkingArmor = "Jacket_Padded";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 15, Torso_Upper = 15};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 15, Torso_Upper = 15, Torso_Lower = 15, UpperArm_L = 15, UpperArm_R = 15, ForeArm_L = 15, ForeArm_R = 15};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 15, Torso_Upper = 15};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 15, Torso_Upper = 15, Torso_Lower = 15, UpperArm_L = 15, UpperArm_R = 15, ForeArm_L = 15, ForeArm_R = 15};			
		GlobalArmor[WorkingArmor]["Durability"] = 2;
		GlobalArmor[WorkingArmor]["Location"] = "Body";	

	WorkingArmor = "Jacket_PaddedDOWN";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 15, Torso_Upper = 15};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 15, Torso_Upper = 15, Torso_Lower = 15, UpperArm_L = 15, UpperArm_R = 15, ForeArm_L = 15, ForeArm_R = 15};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 15, Torso_Upper = 15};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 15, Torso_Upper = 15,  Torso_Lower = 15,UpperArm_L = 15, UpperArm_R = 15, ForeArm_L = 15, ForeArm_R = 15};			
		GlobalArmor[WorkingArmor]["Durability"] = 2;
		GlobalArmor[WorkingArmor]["Location"] = "Body";	

	WorkingArmor = "Jacket_Police";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 15, Torso_Upper = 15};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 15, Torso_Upper = 15, Torso_Lower = 15, UpperArm_L = 15, UpperArm_R = 15, ForeArm_L = 15, ForeArm_R = 15};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 15, Torso_Upper = 15};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 15, Torso_Upper = 15, Torso_Lower = 15, UpperArm_L = 15, UpperArm_R = 15, ForeArm_L = 15, ForeArm_R = 15};			
		GlobalArmor[WorkingArmor]["Durability"] = 2;
		GlobalArmor[WorkingArmor]["Location"] = "Body";	

	WorkingArmor = "Jacket_Ranger";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 15, Torso_Upper = 15};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 15, Torso_Upper = 15, Torso_Lower = 15, UpperArm_L = 15, UpperArm_R = 15, ForeArm_L = 15, ForeArm_R = 15};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 15, Torso_Upper = 15};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 15, Torso_Upper = 15, Torso_Lower = 15, UpperArm_L = 15, UpperArm_R = 15, ForeArm_L = 15, ForeArm_R = 15};			
		GlobalArmor[WorkingArmor]["Durability"] = 2;
		GlobalArmor[WorkingArmor]["Location"] = "Body";	

	WorkingArmor = "Jacket_NavyBlue";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 15, Torso_Upper = 15};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 15, Torso_Upper = 15, Torso_Lower = 15, UpperArm_L = 15, UpperArm_R = 15, ForeArm_L = 15, ForeArm_R = 15};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 15, Torso_Upper = 15};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 15, Torso_Upper = 15, Torso_Lower = 15, UpperArm_L = 15, UpperArm_R = 15, ForeArm_L = 15, ForeArm_R = 15};			
		GlobalArmor[WorkingArmor]["Durability"] = 2;
		GlobalArmor[WorkingArmor]["Location"] = "Body";							

	WorkingArmor = "Vest_BulletArmy";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 90, Torso_Upper = 90, Torso_Lower = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 90, Torso_Upper = 90, Torso_Lower = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 90, Torso_Upper = 90, Torso_Lower = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 90, Torso_Upper = 90, Torso_Lower = 90};
		GlobalArmor[WorkingArmor]["BulletRes"] = {Neck = 90, Torso_Upper = 90, Torso_Lower = 90};
		GlobalArmor[WorkingArmor]["BurnRes"] = {Neck = 80, Torso_Upper = 80, Torso_Lower = 80};				
		GlobalArmor[WorkingArmor]["Durability"] = 100;
		GlobalArmor[WorkingArmor]["Location"] = "Vest";		

	WorkingArmor = "Vest_BulletCivilian";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 90, Torso_Upper = 90, Torso_Lower = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 90, Torso_Upper = 90, Torso_Lower = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 90, Torso_Upper = 90, Torso_Lower = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 90, Torso_Upper = 90, Torso_Lower = 90};
		GlobalArmor[WorkingArmor]["BulletRes"] = {Neck = 90, Torso_Upper = 90, Torso_Lower = 90};
		GlobalArmor[WorkingArmor]["BurnRes"] = {Neck = 80, Torso_Upper = 80, Torso_Lower = 80};				
		GlobalArmor[WorkingArmor]["Durability"] = 100;
		GlobalArmor[WorkingArmor]["Location"] = "Vest";		

	WorkingArmor = "Vest_BulletPolice";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 90, Torso_Upper = 90, Torso_Lower = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 90, Torso_Upper = 90, Torso_Lower = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 90, Torso_Upper = 90, Torso_Lower = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 90, Torso_Upper = 90, Torso_Lower = 90};
		GlobalArmor[WorkingArmor]["BulletRes"] = {Neck = 90, Torso_Upper = 90, Torso_Lower = 90};
		GlobalArmor[WorkingArmor]["BurnRes"] = {Neck = 80, Torso_Upper = 80, Torso_Lower = 80};				
		GlobalArmor[WorkingArmor]["Durability"] = 100;
		GlobalArmor[WorkingArmor]["Location"] = "Vest";
-- Leg Armor

	WorkingArmor = "ArmorJeans";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Groin = 20, Torso_Lower = 20, UpperLeg_L = 20, UpperLeg_R = 20};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Groin = 20, UpperLeg_L = 20, UpperLeg_R = 20};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Groin = 20, Torso_Lower = 20, UpperLeg_L = 20, UpperLeg_R = 20};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Groin = 20, UpperLeg_L = 20, UpperLeg_R = 20};			
		GlobalArmor[WorkingArmor]["Durability"] = 1;
		GlobalArmor[WorkingArmor]["Location"] = "Legs";	

	WorkingArmor = "Ghillie_Trousers";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Groin = 20, Torso_Lower = 20, UpperLeg_L = 20, UpperLeg_R = 20};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Groin = 20, UpperLeg_L = 20, UpperLeg_R = 20};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Groin = 20, Torso_Lower = 20, UpperLeg_L = 20, UpperLeg_R = 20};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Groin = 20, UpperLeg_L = 20, UpperLeg_R = 20};			
		GlobalArmor[WorkingArmor]["Durability"] = 1;
		GlobalArmor[WorkingArmor]["Location"] = "Legs";	

	WorkingArmor = "Trousers_CamoDesert";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Groin = 20, Torso_Lower = 20, UpperLeg_L = 20, UpperLeg_R = 20};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Groin = 20, UpperLeg_L = 20, UpperLeg_R = 20};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Groin = 20, Torso_Lower = 20, UpperLeg_L = 20, UpperLeg_R = 20};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Groin = 20, UpperLeg_L = 20, UpperLeg_R = 20};			
		GlobalArmor[WorkingArmor]["Durability"] = 1;
		GlobalArmor[WorkingArmor]["Location"] = "Legs";	

	WorkingArmor = "Trousers_CamoGreen";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Groin = 20, Torso_Lower = 20, UpperLeg_L = 20, UpperLeg_R = 20};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Groin = 20, UpperLeg_L = 20, UpperLeg_R = 20};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Groin = 20, Torso_Lower = 20, UpperLeg_L = 20, UpperLeg_R = 20};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Groin = 20, UpperLeg_L = 20, UpperLeg_R = 20};			
		GlobalArmor[WorkingArmor]["Durability"] = 1;
		GlobalArmor[WorkingArmor]["Location"] = "Legs";	

	WorkingArmor = "Trousers_CamoUrban";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Groin = 20, Torso_Lower = 20, UpperLeg_L = 20, UpperLeg_R = 20};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Groin = 20, UpperLeg_L = 20, UpperLeg_R = 20};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Groin = 20, Torso_Lower = 20, UpperLeg_L = 20, UpperLeg_R = 20};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Groin = 20, UpperLeg_L = 20, UpperLeg_R = 20};			
		GlobalArmor[WorkingArmor]["Durability"] = 1;
		GlobalArmor[WorkingArmor]["Location"] = "Legs";	

	WorkingArmor = "Trousers_Denim";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Groin = 20, Torso_Lower = 20, UpperLeg_L = 20, UpperLeg_R = 20};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Groin = 20, UpperLeg_L = 20, UpperLeg_R = 20};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Groin = 20, Torso_Lower = 20, UpperLeg_L = 20, UpperLeg_R = 20};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Groin = 20, UpperLeg_L = 20, UpperLeg_R = 20};			
		GlobalArmor[WorkingArmor]["Durability"] = 1;
		GlobalArmor[WorkingArmor]["Location"] = "Legs";	

	WorkingArmor = "Trousers_Fireman";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Groin = 20, Torso_Lower = 20, UpperLeg_L = 20, UpperLeg_R = 20};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Groin = 20, Torso_Lower = 20, UpperLeg_L = 20, UpperLeg_R = 20};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Groin = 20, Torso_Lower = 20, UpperLeg_L = 20, UpperLeg_R = 20};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Groin = 20,  Torso_Lower = 20, UpperLeg_L = 20, UpperLeg_R = 20};			
		GlobalArmor[WorkingArmor]["Durability"] = 1;
		GlobalArmor[WorkingArmor]["Location"] = "Legs";	

	-- WorkingArmor = "Trousers_JeanBaggy";
	-- GlobalArmor[WorkingArmor] = 
		-- --GlobalArmor[WorkingArmor]["ScratchRes"] = {Groin = 20, Torso_Lower = 20, UpperLeg_L = 20, UpperLeg_R = 20};
		-- GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Groin = 20, UpperLeg_L = 20, UpperLeg_R = 20};
		-- --GlobalArmor[WorkingArmor]["BiteRes"] = {Groin = 20, Torso_Lower = 20, UpperLeg_L = 20, UpperLeg_R = 20};
		-- GlobalArmor[WorkingArmor]["GlassRes"] = {Groin = 20, UpperLeg_L = 20, UpperLeg_R = 20};			
		-- GlobalArmor[WorkingArmor]["Durability"] = 1;
		-- GlobalArmor[WorkingArmor]["Location"] = "Legs";	
		
	WorkingArmor = "Trousers_JeanBaggy";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Groin = 20, Torso_Lower = 20, UpperLeg_L = 20, UpperLeg_R = 20};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Groin = 20, UpperLeg_L = 20, UpperLeg_R = 20};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Groin = 20, Torso_Lower = 20, UpperLeg_L = 20, UpperLeg_R = 20};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Groin = 20, UpperLeg_L = 20, UpperLeg_R = 20};			
		GlobalArmor[WorkingArmor]["Durability"] = 1;
		GlobalArmor[WorkingArmor]["Location"] = "Legs";	

	WorkingArmor = "Trousers_Padded";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Groin = 20, UpperLeg_L = 20, UpperLeg_R = 20};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Groin = 20, UpperLeg_L = 20, UpperLeg_R = 20};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Groin = 20, UpperLeg_L = 20, UpperLeg_R = 20};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Groin = 20, UpperLeg_L = 20, UpperLeg_R = 20};			
		GlobalArmor[WorkingArmor]["Durability"] = 1;
		GlobalArmor[WorkingArmor]["Location"] = "Legs";	

	WorkingArmor = "Dungarees";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Groin = 20, Torso_Lower = 20, UpperLeg_L = 20, UpperLeg_R = 20};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Groin = 20, Torso_Lower = 20, UpperLeg_L = 20, UpperLeg_R = 20};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Groin = 10, Torso_Lower = 10, UpperLeg_L = 10, UpperLeg_R = 10};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Groin = 20, Torso_Lower = 20, UpperLeg_L = 20, UpperLeg_R = 20};			
		GlobalArmor[WorkingArmor]["Durability"] = 1;
		GlobalArmor[WorkingArmor]["Location"] = "Legs";		
		
-- Boots

	WorkingArmor = "Shoes_ArmyBoots";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Foot_L = 30, Foot_R = 3};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Foot_L = 90, Foot_R = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Foot_L = 20, Foot_R = 20};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Foot_L = 90, Foot_R = 90};		
		GlobalArmor[WorkingArmor]["Durability"] = 100;
		GlobalArmor[WorkingArmor]["Location"] = "Feet";

	WorkingArmor = "Shoes_ArmyBootsDesert";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Foot_L = 30, Foot_R = 30};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Foot_L = 90, Foot_R = 90};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Foot_L = 20, Foot_R = 20};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Foot_L = 90, Foot_R = 90};		
		GlobalArmor[WorkingArmor]["Durability"] = 100;
		GlobalArmor[WorkingArmor]["Location"] = "Feet";
		
	WorkingArmor = "Shoes_BlackBoots";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Foot_L = 20, Foot_R = 20};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Foot_L = 50, Foot_R = 50};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Foot_L = 10, Foot_R = 10};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Foot_L = 50, Foot_R = 50};		
		GlobalArmor[WorkingArmor]["Durability"] = 30;
		GlobalArmor[WorkingArmor]["Location"] = "Feet";


	WorkingArmor = "Hat_HockeyMask";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 30};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Head = 25};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 50};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Head = 25};			
		GlobalArmor[WorkingArmor]["Durability"] = 20;
		GlobalArmor[WorkingArmor]["Location"] = "Head";




		
-- Shields
		
	-- WorkingArmor = "ArmorShieldriot";
	-- GlobalArmor[WorkingArmor] = {};
		-- GlobalArmor[WorkingArmor]["ScratchRes"] = {Hand_L = 90, ForeArm_L = 90, UpperArm_L = 90, Torso_Upper = 90, Torso_Lower = 90, Groin = 90, UpperLeg_L = 90, LowerLeg_L = 90};
		-- GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Hand_L = 90, ForeArm_L = 90, UpperArm_L = 90, Torso_Upper = 90, Torso_Lower = 90, Groin = 90, UpperLeg_L = 90, LowerLeg_L = 90};	
		-- GlobalArmor[WorkingArmor]["BiteRes"] = {Hand_L = 90, ForeArm_L = 90, UpperArm_L = 90, Torso_Upper = 90, Torso_Lower = 90, Groin = 90, UpperLeg_L = 90, LowerLeg_L = 90};
		-- GlobalArmor[WorkingArmor]["BulletRes"] = {Hand_L = 90, ForeArm_L = 90, UpperArm_L = 90, Torso_Upper = 90, Torso_Lower = 90, Groin = 90, UpperLeg_L = 90, LowerLeg_L = 90};			
		-- GlobalArmor[WorkingArmor]["Durability"] = 80;
		-- GlobalArmor[WorkingArmor]["Location"] = "Shield";