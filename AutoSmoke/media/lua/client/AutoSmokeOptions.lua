require('AutoSmoke')

AutoSmoke.Options = AutoSmoke.Options or {}

AutoSmoke.Options.autoSmoking = true
AutoSmoke.Options.characterSpeaks = true
AutoSmoke.Options.buttsToAshtray = false
AutoSmoke.Options.throwAwayButts = false
AutoSmoke.Options.removeButts = false
AutoSmoke.Options.smokeButts = false
AutoSmoke.Options.reversePriority = false
AutoSmoke.Options.gumOnly = false

AutoSmoke.Options.keySmoke = {
    name = "NF Smoke",
    key = Keyboard.KEY_BACK
}

function AutoSmoke.Options.init()
    if ModOptions and ModOptions.getInstance then
        local function onModOptionsApply(optionValues)
            AutoSmoke.Options.autoSmoking = optionValues.settings.options.autoSmoking
            AutoSmoke.Options.characterSpeaks = optionValues.settings.options.characterSpeaks
            AutoSmoke.Options.buttsToAshtray = optionValues.settings.options.buttsToAshtray
            AutoSmoke.Options.throwAwayButts = optionValues.settings.options.throwAwayButts
            AutoSmoke.Options.removeButts = optionValues.settings.options.removeButts
            AutoSmoke.Options.smokeButts = optionValues.settings.options.smokeButts
            AutoSmoke.Options.reversePriority = optionValues.settings.options.reversePriority
            AutoSmoke.Options.gumOnly = optionValues.settings.options.gumOnly
        end

        ModOptions:AddKeyBinding("[Hotkeys]", AutoSmoke.Options.keySmoke)

        local SETTINGS = {
            options_data = {
                autoSmoking = {
                    name = "UI_AutoSmoke_AutoSmoking",
                    default = true,
                    OnApplyMainMenu = onModOptionsApply,
                    OnApplyInGame = onModOptionsApply,
                },
                characterSpeaks = {
                    name = "UI_AutoSmoke_CharacterSpeaks",
                    tooltip = "UI_AutoSmoke_CharacterSpeaks_Tooltip",
                    default = true,
                    OnApplyMainMenu = onModOptionsApply,
                    OnApplyInGame = onModOptionsApply,
                },
            },
            mod_id = 'AutoSmoke',
            mod_fullname = 'AutoSmoke'
        }

        AutoSmoke.activeMod.options = AutoSmoke.activeMod.options or {}

        if AutoSmoke.activeMod.options.reversePriority then
            SETTINGS.options_data.reversePriority = {
                name = getText("UI_AutoSmoke_Mod_ReversePriority", AutoSmoke.activeMod.modName),
                tooltip = "UI_AutoSmoke_Mod_ReversePriority_Tooltip",
                default = false,
                OnApplyMainMenu = onModOptionsApply,
                OnApplyInGame = onModOptionsApply,
            }
        end
        if AutoSmoke.activeMod.modId == "Smoker" then
            SETTINGS.options_data.buttsToAshtray = {
                name = getText("UI_AutoSmoke_Mod_ButtsToAshtray", AutoSmoke.activeMod.modName),
                tooltip = "UI_AutoSmoke_Mod_ButtsToAshtray_Tooltip",
                default = false,
                OnApplyMainMenu = onModOptionsApply,
                OnApplyInGame = onModOptionsApply,
            }
        end
        if AutoSmoke.activeMod.options.throwAwayButts then
            SETTINGS.options_data.throwAwayButts = {
                name = getText("UI_AutoSmoke_Mod_ThrowAwayButts", AutoSmoke.activeMod.modName),
                tooltip = "UI_AutoSmoke_Mod_ThrowAwayButts_Tooltip",
                default = false,
                OnApplyMainMenu = onModOptionsApply,
                OnApplyInGame = onModOptionsApply,
            }
            SETTINGS.options_data.removeButts = {
                name = getText("UI_AutoSmoke_Mod_RemoveButts", AutoSmoke.activeMod.modName),
                tooltip = "UI_AutoSmoke_Mod_RemoveButts_Tooltip",
                default = false,
                OnApplyMainMenu = onModOptionsApply,
                OnApplyInGame = onModOptionsApply,
            }
        end
        if AutoSmoke.activeMod.options.smokeButts then
            SETTINGS.options_data.smokeButts = {
                name = getText("UI_AutoSmoke_Mod_SmokeButts", AutoSmoke.activeMod.modName),
                tooltip = "UI_AutoSmoke_Mod_SmokeButts_Tooltip",
                default = false,
                OnApplyMainMenu = onModOptionsApply,
                OnApplyInGame = onModOptionsApply,
            }
        end
        if AutoSmoke.activeMod.options.gumOnly then
            SETTINGS.options_data.gumOnly = {
                name = getText("UI_AutoSmoke_Mod_GumOnly", AutoSmoke.activeMod.modName),
                tooltip = "UI_AutoSmoke_Mod_GumOnly_Tooltip",
                default = false,
                OnApplyMainMenu = onModOptionsApply,
                OnApplyInGame = onModOptionsApply,
            }
        end

        local optionsInstance = ModOptions:getInstance(SETTINGS)
        ModOptions:loadFile()

        local optionAutoSmoking = optionsInstance:getData("autoSmoking")
        function optionAutoSmoking:OnApply(newValue)
            AutoSmoke.Options.autoSmoking = newValue
            AutoSmoke.start()
        end

        local optionButtsToAshtray = optionsInstance:getData("buttsToAshtray")
        local optionThrowAwayButts = optionsInstance:getData("throwAwayButts")
        local optionRemoveButts = optionsInstance:getData("removeButts")
        if optionButtsToAshtray then
            function optionButtsToAshtray:onUpdate(newValue)
                if newValue then
                    if optionThrowAwayButts then optionThrowAwayButts:set(false) end
                    if optionRemoveButts then optionRemoveButts:set(false) end
                end
            end
        end
        if optionThrowAwayButts then
            function optionThrowAwayButts:onUpdate(newValue)
                if newValue then
                    if optionButtsToAshtray then optionButtsToAshtray:set(false) end
                    if optionRemoveButts then optionRemoveButts:set(false) end
                end
            end
        end
        if optionRemoveButts then
            function optionRemoveButts:onUpdate(newValue)
                if newValue then
                    if optionButtsToAshtray then optionButtsToAshtray:set(false) end
                    if optionThrowAwayButts then optionThrowAwayButts:set(false) end
                end
            end
        end

        Events.OnPreMapLoad.Add(function() onModOptionsApply({ settings = SETTINGS }) end)
    end
end