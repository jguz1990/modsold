--Body Parts List --> Foot_L, Foot_R, ForeArm_L, ForeArm_R, Groin, Hand_L, Hand_R, Head, LowerLeg_L, LowerLeg_R, MAX, Neck, Torso_Lower, Torso_Upper, UpperArm_L, UpperArm_R, UpperLeg_L, UpperLeg_R 
--Available Res Types list --> ScratchRes|DeepWoundRes|BurnRes|BulletRes|FractureRes|GlassRes|BiteRes

if(GlobalArmor == nil) then GlobalArmor = {} end
	
	local WorkingArmor;	

	WorkingArmor = "Vest_BulletEMS";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 90, Torso_Upper = 90, Torso_Lower = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 90, Torso_Upper = 90, Torso_Lower = 90};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 90, Torso_Upper = 90, Torso_Lower = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 90, Torso_Upper = 90, Torso_Lower = 90};
		GlobalArmor[WorkingArmor]["BulletRes"] = {Neck = 90, Torso_Upper = 90, Torso_Lower = 90};
		GlobalArmor[WorkingArmor]["BurnRes"] = {Neck = 80, Torso_Upper = 80, Torso_Lower = 80};				
		GlobalArmor[WorkingArmor]["Durability"] = 100;
		GlobalArmor[WorkingArmor]["Location"] = "Vest";	
		
	WorkingArmor = "Vest_BulletFire";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 90, Torso_Upper = 90, Torso_Lower = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 90, Torso_Upper = 90, Torso_Lower = 90};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 90, Torso_Upper = 90, Torso_Lower = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 90, Torso_Upper = 90, Torso_Lower = 90};
		GlobalArmor[WorkingArmor]["BulletRes"] = {Neck = 90, Torso_Upper = 90, Torso_Lower = 90};
		GlobalArmor[WorkingArmor]["BurnRes"] = {Neck = 80, Torso_Upper = 80, Torso_Lower = 80};				
		GlobalArmor[WorkingArmor]["Durability"] = 100;
		GlobalArmor[WorkingArmor]["Location"] = "Vest";	
		
	WorkingArmor = "Vest_BulletPress";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Neck = 90, Torso_Upper = 90, Torso_Lower = 90};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Neck = 90, Torso_Upper = 90, Torso_Lower = 90};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Neck = 90, Torso_Upper = 90, Torso_Lower = 90};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Neck = 90, Torso_Upper = 90, Torso_Lower = 90};
		GlobalArmor[WorkingArmor]["BulletRes"] = {Neck = 90, Torso_Upper = 90, Torso_Lower = 90};
		GlobalArmor[WorkingArmor]["BurnRes"] = {Neck = 80, Torso_Upper = 80, Torso_Lower = 80};				
		GlobalArmor[WorkingArmor]["Durability"] = 100;
		GlobalArmor[WorkingArmor]["Location"] = "Vest";		


		

