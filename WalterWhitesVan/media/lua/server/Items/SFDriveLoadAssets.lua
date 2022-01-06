SFDriveLoadAssets = {}

---
-- This loads the textures. You can add as many
-- as you want.
function SFDriveLoadAssets.loadTextures()
	--Cars UI
    getTexture("sfvehicle_cooleroff.png");
    getTexture("sfvehicle_cooleron.png");
    getTexture("sfvehicle_ovenoff.png");
    getTexture("sfvehicle_ovenon.png");

end

Events.OnGameBoot.Add(SFDriveLoadAssets.loadTextures);
