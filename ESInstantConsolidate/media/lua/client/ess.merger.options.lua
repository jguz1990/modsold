local tweaksOptions = {};
tweaksOptions.modOptions = {};

tweaksOptions.configOptions = {
    options_data = {
        essIC = {
            getText("UI_Off"),
            getText("UI_On"),
            getText("UI_On") .. " " .. getText("UI_mo_InstantConsolidate_Keep"),

            name = getText("UI_On") .. "/" .. getText("UI_Off"),
            tooltip = getText("UI_mo_InstantConsolidate_TT"),
            default = 2,
        },
    },
    mod_id = "ExtraSauceInstantConsolidate",
    mod_fullname = getText("UI_mo_InstantConsolidate"),
    mod_shortname = getText("UI_mo_InstantConsolidate"),
}

function tweaksOptions.getOption(infoOption)
    if (infoOption == "mergeOn") then return tweaksOptions.modOptions.options.essIC > 1 end;
    if (infoOption == "mergeKeepOn") then return tweaksOptions.modOptions.options.essIC == 3 end;
end

if ModOptions and ModOptions.getInstance then
    tweaksOptions.modOptions = ModOptions:getInstance(tweaksOptions.configOptions);
end

return tweaksOptions;