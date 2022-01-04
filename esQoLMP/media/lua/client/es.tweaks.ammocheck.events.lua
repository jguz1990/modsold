local esAmmoCheckMain = require("es.tweaks.ammocheck.main")
local esAmmoCheck = {};

esAmmoCheck.mouse = { down = false, tick = 0 };
function esAmmoCheck.mouseDown()
    if esAmmoCheck.mouse.down then return end
    esAmmoCheck.mouse.down = true;
    esAmmoCheck.mouse.tick = getTimestampMs();
end
function esAmmoCheck.mouseUp()
    esAmmoCheck.mouse.down = false;
    esAmmoCheck.mouse.tick = 0;
end
function esAmmoCheck.mouseShow()
    if esAmmoCheck.mouse.down and (esAmmoCheck.mouse.tick + 800) < getTimestampMs() then
        esAmmoCheckMain.printNote(esAmmoCheckMain.getCurrentWeapon());
        esAmmoCheck.mouse.tick = getTimestampMs();
    end
end

esAmmoCheck.keyboard = { down = false, tick = 0 };
function esAmmoCheck.kbDown(key)
    if esAmmoCheck.keyboard.down then return end
    if getCore():getKey("Aim") ~= key then return end
    esAmmoCheck.keyboard.down = true;
    esAmmoCheck.keyboard.tick = getTimestampMs();
end
function esAmmoCheck.kbUp()
    esAmmoCheck.keyboard.down = false;
    esAmmoCheck.keyboard.tick = 0;
end
function esAmmoCheck.kbShow(key)
    if getCore():getKey("Aim") ~= key then return end
    if esAmmoCheck.keyboard.down and (esAmmoCheck.keyboard.tick + 800) < getTimestampMs() then
        esAmmoCheckMain.printNote(esAmmoCheckMain.getCurrentWeapon());
        esAmmoCheck.keyboard.tick = getTimestampMs();
    end
end

local baseISReloadWeaponActionUpdate = ISReloadWeaponAction.update;
function ISReloadWeaponAction:update()
    baseISReloadWeaponActionUpdate(self);
    esAmmoCheckMain.printNote(self.gun);
end

local baseISReloadWeaponActionPerform = ISReloadWeaponAction.perform;
function ISReloadWeaponAction:perform()
    baseISReloadWeaponActionPerform(self);
    esAmmoCheckMain.printNote(self.gun);
end


local baseISLoadBulletsInMagazineUpdate = ISLoadBulletsInMagazine.update;
function ISLoadBulletsInMagazine:update()
    baseISLoadBulletsInMagazineUpdate(self);
    esAmmoCheckMain.printNote(self.magazine);
end

function esAmmoCheck.onShoot(player, weapon)
    if (esAmmoCheckMain.isValid(weapon)) then
        esAmmoCheckMain.printNote(weapon);
    end
end

Events.OnRightMouseDown.Add(esAmmoCheck.mouseDown);
Events.OnCustomUIKeyPressed.Add(esAmmoCheck.kbDow);

Events.OnRightMouseUp.Add(esAmmoCheck.mouseUp);
Events.OnCustomUIKeyReleased.Add(esAmmoCheck.kbUp);

Events.OnRenderTick.Add(esAmmoCheck.mouseShow)
Events.OnKeyKeepPressed.Add(esAmmoCheck.kbShow);

Events.OnPlayerAttackFinished.Add(esAmmoCheck.onShoot);