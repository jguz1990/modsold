function RemoveArmorMod1()
	if getActivatedMods():contains("ArmorMod") then
		toggleModActive(getModInfoByID("ArmorMod"), false)
	end
end

function RemoveArmorMod2()
	if ActiveMods.getById("currentGame"):isModActive("ArmorMod") then
		ActiveMods.getById("currentGame"):removeMod("ArmorMod")
		saveGame()
		arr = getLatestSave()
		pathToSave = arr[2] .. "\\" .. arr[1]
		manipulateSavefile(pathToSave,"WriteModsDotTxt")
	end
end

Events.OnGameBoot.Add(RemoveArmorMod1)
Events.OnGameStart.Add(RemoveArmorMod2)