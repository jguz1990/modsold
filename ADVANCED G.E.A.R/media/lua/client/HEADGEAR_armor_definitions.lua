--Body Parts List --> Foot_L, Foot_R, ForeArm_L, ForeArm_R, Groin, Hand_L, Hand_R, Head, LowerLeg_L, LowerLeg_R, MAX, Neck, Torso_Lower, Torso_Upper, UpperArm_L, UpperArm_R, UpperLeg_L, UpperLeg_R 
--Available Res Types list --> ScratchRes|DeepWoundRes|BurnRes|BulletRes|FractureRes|GlassRes|BiteRes



if(GlobalArmor == nil) then GlobalArmor = {} end

-- Helmets	
	local WorkingArmor;
	

		
	WorkingArmor = "BallisticMask";
	GlobalArmor[WorkingArmor] = {};
		--GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 60};
		GlobalArmor[WorkingArmor]["DeepWoundRes"] = {Head = 60};
		--GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 60};
		GlobalArmor[WorkingArmor]["GlassRes"] = {Head = 60};	
		GlobalArmor[WorkingArmor]["Durability"] = 60;
		GlobalArmor[WorkingArmor]["Location"] = "Head";
		GlobalArmor[WorkingArmor]["BiteRes"] = {Head = 30};
		GlobalArmor[WorkingArmor]["ScratchRes"] = {Head = 50};
		GlobalArmor[WorkingArmor]["BulletRes"] = {Head = 50};
		


