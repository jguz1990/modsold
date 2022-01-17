-- HARDCORE RELOADING MOD FOR REFERENCE ONLY

--[[
can_fire = true

function ISInsertMagazine:addRackingAfter()
	return
end

function ISReloadWeaponAction:addRackingAfter()
	return
end

function ISReloadWeaponAction.stopAfterEject()
	return true
end

ISReloadWeaponAction.addRacking = function(player, gun)
	return
end

function allowFiring()
	can_fire = true
end

function ISReloadWeaponAction.canFireSemi()
	return can_fire
end

function ISReloadWeaponAction.noLongerCanFire()
	can_fire = false
end

Events.OnMouseUp.Add(allowFiring);

]]