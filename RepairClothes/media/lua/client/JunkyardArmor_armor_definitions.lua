--Body Parts List --> Foot_L, Foot_R, ForeArm_L, ForeArm_R, Groin, Hand_L, Hand_R, Head, LowerLeg_L, LowerLeg_R, MAX, Neck, Torso_Lower, Torso_Upper, UpperArm_L, UpperArm_R, UpperLeg_L, UpperLeg_R 
--Available Res Types list --> ScratchRes|DeepWoundRes|BurnRes|BulletRes|FractureRes|GlassRes|BiteRes

if(GlobalArmor == nil) then GlobalArmor = {} end
	
	local WorkingArmor;	
		
	WorkingArmor = "BucketHelmet";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 50, Neck = 50};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Head = 50, Neck = 50};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 50, Neck = 50};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Head = 50, Neck = 50};
		GlobalArmor[WorkingArmor]["BulletRes"] = {Head = 25, Neck = 25};			
		GlobalArmor[WorkingArmor]["Durability"] = 50;
		GlobalArmor[WorkingArmor]["Location"] = "Head";
		
	WorkingArmor = "BurlapBracers";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Hand_L = 25, Hand_R = 25, ForeArm_L = 25, ForeArm_R = 25};	
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Hand_L = 5, Hand_R = 5, ForeArm_L = 5, ForeArm_R = 5};	
		GlobalArmor[WorkingArmor]["BiteRes"] = {Hand_L = 5, Hand_R = 5, ForeArm_L = 5, ForeArm_R = 5};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Hand_L = 25, Hand_R = 25, ForeArm_L = 25, ForeArm_R = 25};			
		GlobalArmor[WorkingArmor]["Durability"] = 25;
		GlobalArmor[WorkingArmor]["Location"] = "LowerArms";
		
	WorkingArmor = "LooseSackMask";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 25, Neck = 25};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Head = 25, Neck = 25};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 5, Neck = 5};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Head = 25, Neck = 25};	
		GlobalArmor[WorkingArmor]["Durability"] = 25;
		GlobalArmor[WorkingArmor]["Location"] = "Head";	
		
	WorkingArmor = "TightSackMask";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 25, Neck = 25};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Head = 25, Neck = 25};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 5, Neck = 5};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Head = 25, Neck = 25};	
		GlobalArmor[WorkingArmor]["Durability"] = 25;
		GlobalArmor[WorkingArmor]["Location"] = "Head";	
		
	WorkingArmor = "RoadsignBracers";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Hand_L = 50, Hand_R = 50, ForeArm_L = 50, ForeArm_R = 50};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Hand_L = 50, Hand_R = 50, ForeArm_L = 50, ForeArm_R = 50};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Hand_L = 50, Hand_R = 50, ForeArm_L = 50, ForeArm_R = 50};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Hand_L = 50, Hand_R = 50, ForeArm_L = 50, ForeArm_R = 50};
		GlobalArmor[WorkingArmor]["BulletRes"] = {Hand_L = 25, Hand_R = 25, ForeArm_L = 25, ForeArm_R = 25};
		GlobalArmor[WorkingArmor]["FractureRes"] = {Hand_L = 25, Hand_R = 25, ForeArm_L = 25, ForeArm_R = 25};			
		GlobalArmor[WorkingArmor]["Durability"] = 50;
		GlobalArmor[WorkingArmor]["Location"] = "LowerArms";	

	WorkingArmor = "RoadsignGreaves";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {UpperLeg_L = 45, UpperLeg_R = 45, LowerLeg_L = 45, LowerLeg_R = 45};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {UpperLeg_L = 90, UpperLeg_R = 90, LowerLeg_L = 45, LowerLeg_R = 45};
		GlobalArmor[WorkingArmor]["BiteRes"] = {UpperLeg_L = 45, UpperLeg_R = 45, LowerLeg_L = 45, LowerLeg_R = 45};
		GlobalArmor[WorkingArmor]["BulletRes"] = {UpperLeg_L = 25, UpperLeg_R = 25, LowerLeg_L = 25, LowerLeg_R = 25};
		GlobalArmor[WorkingArmor]["GlassRes"] = {UpperLeg_L = 45, UpperLeg_R = 45, LowerLeg_L = 45, LowerLeg_R = 45};
		GlobalArmor[WorkingArmor]["FractureRes"] = {UpperLeg_L = 25, UpperLeg_R = 25, LowerLeg_L = 25, LowerLeg_R = 25};			
		GlobalArmor[WorkingArmor]["Durability"] = 90;	
		GlobalArmor[WorkingArmor]["Location"] = "Legs";	
		
	WorkingArmor = "RoadsignCuirass";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Torso_Lower = 50, Torso_Upper = 50};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Torso_Lower = 50, Torso_Upper = 50};
		GlobalArmor[WorkingArmor]["BiteRes"] = {Torso_Lower = 50, Torso_Upper = 50};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Torso_Lower = 50, Torso_Upper = 50};
		GlobalArmor[WorkingArmor]["BulletRes"] = {Torso_Lower = 25, Torso_Upper = 25};	
		GlobalArmor[WorkingArmor]["FractureRes"] = {Torso_Lower = 25, Torso_Upper = 25};			
		GlobalArmor[WorkingArmor]["Durability"] = 50;
		GlobalArmor[WorkingArmor]["Location"] = "Body";		

	WorkingArmor = "TireGreaves";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {UpperLeg_L = 45, UpperLeg_R = 45, LowerLeg_L = 45, LowerLeg_R = 45};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {UpperLeg_L = 90, UpperLeg_R = 90, LowerLeg_L = 45, LowerLeg_R = 45};
		GlobalArmor[WorkingArmor]["BiteRes"] = {UpperLeg_L = 45, UpperLeg_R = 45, LowerLeg_L = 45, LowerLeg_R = 45};
		GlobalArmor[WorkingArmor]["BulletRes"] = {UpperLeg_L = 25, UpperLeg_R = 25, LowerLeg_L = 25, LowerLeg_R = 25};
		GlobalArmor[WorkingArmor]["GlassRes"] = {UpperLeg_L = 45, UpperLeg_R = 45, LowerLeg_L = 45, LowerLeg_R = 45};
		GlobalArmor[WorkingArmor]["FractureRes"] = {UpperLeg_L = 25, UpperLeg_R = 25, LowerLeg_L = 25, LowerLeg_R = 25};			
		GlobalArmor[WorkingArmor]["Durability"] = 90;	
		GlobalArmor[WorkingArmor]["Location"] = "Legs";	

	WorkingArmor = "TirePauldrons";
	GlobalArmor[WorkingArmor] = {};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {UpperArm_L = 50, UpperArm_R = 50};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {UpperArm_L = 50, UpperArm_R = 50};
		GlobalArmor[WorkingArmor]["BiteRes"] = {UpperArm_L = 50, UpperArm_R = 50};
		GlobalArmor[WorkingArmor]["GlassRes"] = {UpperArm_L = 50, UpperArm_R = 50};
		GlobalArmor[WorkingArmor]["BulletRes"] = {UpperArm_L = 25, UpperArm_R = 25};
		GlobalArmor[WorkingArmor]["FractureRes"] = {UpperArm_L = 25, UpperArm_R = 25};			
		GlobalArmor[WorkingArmor]["Durability"] = 50;
		GlobalArmor[WorkingArmor]["Location"] = "UpperArms";	
		

