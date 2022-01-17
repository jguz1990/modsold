EHIFTB = EHIFTB or {}

EHIFTB.Const.exclamations = {
    [1] = "none",
    [2] = "*",
    [3] = "***",
    [4] = "!",
    [5] = "!!!"
}

if ModOptions and ModOptions.getInstance then
    local function applyModOptions(updateData)
        -- CD
        EHIFTB.Options.media[0].grab = updateData.settings.options.CD_grab
        EHIFTB.Options.media[0].showTooltip = updateData.settings.options.CD_showTooltip
        -- VHS
        EHIFTB.Options.media[1].grab = updateData.settings.options.VHS_grab
        EHIFTB.Options.media[1].showTooltip = updateData.settings.options.VHS_showTooltip
        EHIFTB.Options.foundExclamation = updateData.settings.options.foundExclamation

        if EHIFTB.Options.foundExclamation == 1 then
            EHIFTB.Options.foundPrefix = ""
            EHIFTB.Options.foundSuffix = "   "
        else
            EHIFTB.Options.foundPrefix = EHIFTB.Const.exclamations[EHIFTB.Options.foundExclamation] .. " "
            EHIFTB.Options.foundSuffix = " " .. EHIFTB.Const.exclamations[EHIFTB.Options.foundExclamation] .. "   "
        end

        EHIFTB.Options.notFoundExclamation = updateData.settings.options.notFoundExclamation
        if EHIFTB.Options.notFoundExclamation == 1 then
            EHIFTB.Options.notFoundPrefix = ""
            EHIFTB.Options.notFoundSuffix = "   "
        else
            EHIFTB.Options.notFoundPrefix = EHIFTB.Const.exclamations[EHIFTB.Options.notFoundExclamation] .. " "
            EHIFTB.Options.notFoundSuffix =
                " " .. EHIFTB.Const.exclamations[EHIFTB.Options.notFoundExclamation] .. "   "
        end

        EHIFTB.Options.colorTooltipText = updateData.settings.options.colorTooltipText
        EHIFTB.Options.colorTooltipText_positive = updateData.settings.options.colorTooltipText_positive
        EHIFTB.Options.colorTooltipBorder = updateData.settings.options.colorTooltipBorder
        if
            (EHIFTB.Options.colorTooltipText or EHIFTB.Options.colorTooltipBorder) and
                not ISToolTipInv.EHIFTB_Store_render
         then
            EHIFTB.initTooltipOverride()
        elseif not EHIFTB.Options.colorText and ISToolTipInv.EHIFTB_Store_render then
        -- EHIFTB.disableTooltipOverride()
        end
    end

    local SETTINGS = {
        options_data = {
            colorTooltipText = {
                name = "Display found / not found info in color text",
                default = true,
                OnApplyMainMenu = applyModOptions,
                OnApplyInGame = applyModOptions
            },
            colorTooltipText_positive = {
                name = "Highlight found / known info with color text and border",
                default = true,
                OnApplyMainMenu = applyModOptions,
                OnApplyInGame = applyModOptions
            },
            colorTooltipBorder = {
                name = "Add color border to the tooltip box",
                default = false,
                OnApplyMainMenu = applyModOptions,
                OnApplyInGame = applyModOptions
            },
            foundExclamation = {
                default = 2,
                name = "Tooltip highlight for already found items",
                OnApplyMainMenu = applyModOptions,
                OnApplyInGame = applyModOptions
            },
            notFoundExclamation = {
                default = 3,
                name = "Tooltip highlight for not yet found items",
                OnApplyMainMenu = applyModOptions,
                OnApplyInGame = applyModOptions
            },
            VHS_grab = {
                name = "Include VHS tapes in the 'Take all not yet found' action",
                default = false,
                OnApplyMainMenu = applyModOptions,
                OnApplyInGame = applyModOptions
            },
            VHS_showTooltip = {
                name = "Show ´found - not found´ tooltip for VHS tapes",
                default = false,
                OnApplyMainMenu = applyModOptions,
                OnApplyInGame = applyModOptions
            },
            CD_grab = {
                name = "Include CDs in the 'Take all not yet found' action",
                default = false,
                OnApplyMainMenu = applyModOptions,
                OnApplyInGame = applyModOptions
            },
            CD_showTooltip = {
                name = "Show ´found - not found´ tooltip for CDs",
                default = false,
                OnApplyMainMenu = applyModOptions,
                OnApplyInGame = applyModOptions
            }
        },
        mod_id = "eggonsHaveIFoundThisBook",
        mod_shortname = "EHIFTB",
        mod_fullname = "Eggon's Have I Found This Book???"
    }

    for i, v in ipairs(EHIFTB.Const.exclamations) do
        SETTINGS.options_data.foundExclamation[i] = v
        SETTINGS.options_data.notFoundExclamation[i] = v
    end

    local optionsInstance = ModOptions:getInstance(SETTINGS)
    ModOptions:loadFile()

    Events.OnGameStart.Add(
        function()
            applyModOptions({settings = SETTINGS})
        end
    )
end
