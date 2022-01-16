esQolModOptions = esQolModOptions or {};
esQolModOptions.options = esQolModOptions.options or {};
local esQoLOptions = require("es.qoloptions.main");

local tweaksOptions = {};
local modOptionsImport = {};
local modOptionsTweaks = {};

tweaksOptions.configImportedOptions = {
    options_data = {
        esQoLIC = {
            getText("IGUI_ESQ_COMMON_UI_OFF"),
            getText("IGUI_ESQ_COMMON_UI_ON"),
            getText("IGUI_ESQ_COMMON_UI_ON") .." "..getText("IGUI_mo_icKeepEmpty"),

            name = getText("IGUI_mo_esqInstantConsolidate"),
            tooltip = getText("IGUI_mo_esqInstantConsolidate_TT"),
            default = 1,
        },
        esQoLAC = {
            getText("IGUI_ESQ_COMMON_UI_OFF"),
            getText("IGUI_ESQ_COMMON_UI_ON") .. " " .. getText("IGUI_mo_ammoCheckAmmoF2"),
            getText("IGUI_ESQ_COMMON_UI_ON") .. " " .. getText("IGUI_mo_ammoCheckAmmoF3"),
            getText("IGUI_ESQ_COMMON_UI_ON") .. " " .. getText("IGUI_mo_ammoCheckAmmoF4"),
            getText("IGUI_ESQ_COMMON_UI_ON") .. " " .. getText("IGUI_mo_ammoCheckAmmoF5"),
            getText("IGUI_ESQ_COMMON_UI_ON") .. " " .. getText("IGUI_mo_ammoCheckAmmoF6"),
            getText("IGUI_ESQ_COMMON_UI_ON") .. " " .. getText("IGUI_mo_ammoCheckAmmoF7"),

            name = getText("IGUI_mo_ammoCheck"),
            tooltip = getText("IGUI_mo_ammoCheck_TT"),
            default = 1,
        },
        esQoLSac = {
            getText("IGUI_ESQ_COMMON_UI_OFF"),
            getText("IGUI_ESQ_COMMON_UI_ON"),
            getText("IGUI_ESQ_COMMON_UI_ON") .. " " .. getText("IGUI_mo_esqSacRespect"),

            name = getText("IGUI_mo_esqSac"),
            tooltip = getText("IGUI_mo_esqSac_TT"),
            default = 1,
        },
    },
    mod_id = "esQoLMP",
    mod_fullname = getText("IGUI_mo_esqImportTweaksName"),
    mod_shortname = getText("IGUI_mo_esqImportTweaksName"),
}

tweaksOptions.configOptions = {
    options_data = {
        esQoLDrier = {
            getText("IGUI_ESQ_COMMON_UI_OFF"),
            getText("IGUI_ESQ_COMMON_UI_ON"),

            name = getText("IGUI_mo_esqDrier"),
            tooltip = getText("IGUI_mo_esqDrier_TT"),
            default = 1,
        },
        esQoLDieter = {
            getText("IGUI_ESQ_COMMON_UI_OFF"),
            getText("IGUI_ESQ_COMMON_UI_ON"),

            name = getText("IGUI_mo_esqDieter"),
            tooltip = getText("IGUI_mo_esqDieter_TT"),
            default = 1,
        },
        esQoLVitaMax = {
            getText("IGUI_ESQ_COMMON_UI_OFF"),
            getText("IGUI_ESQ_COMMON_UI_ON") .. " " .. getText("IGUI_mo_esqVitaMaxPills30"),
            getText("IGUI_ESQ_COMMON_UI_ON") .. " " .. getText("IGUI_mo_esqVitaMaxPills15"),

            name = getText("IGUI_mo_esqVitaMax"),
            tooltip = getText("IGUI_mo_esqVitaMax_TT"),
            default = 1,
        },
        esQoLCarHood = {
            getText("IGUI_ESQ_COMMON_UI_OFF"),
            getText("IGUI_ESQ_COMMON_UI_ON"),

            name = getText("IGUI_mo_esqCarHood"),
            tooltip = getText("IGUI_mo_esqCarHood_TT"),
            default = 1,
        },
        esQoLCorpseMerge = {
            getText("IGUI_ESQ_COMMON_UI_OFF"),
            getText("IGUI_ESQ_COMMON_UI_ON"),
            getText("IGUI_ESQ_COMMON_UI_ON") .. " " .. getText("IGUI_mo_esdSortLootA1"),
            getText("IGUI_ESQ_COMMON_UI_ON") .. " " .. getText("IGUI_mo_esdSortLootA2"),
            getText("IGUI_ESQ_COMMON_UI_ON") .. " " .. getText("IGUI_mo_esdSortLootA3"),

            name = getText("IGUI_mo_esdSortLoot"),
            tooltip = getText("IGUI_mo_esdSortLoot_TT"),
            default = 1,
        },
        esQoLMetals = {
            getText("IGUI_ESQ_COMMON_UI_OFF"),
            getText("IGUI_ESQ_COMMON_UI_ON"),

            name = getText("IGUI_mo_esdMetals"),
            tooltip = getText("IGUI_mo_esdMetals_tt"),
            default = 1,
        },
        esQoLTrashCars = {
            getText("IGUI_ESQ_COMMON_UI_OFF"),
            getText("IGUI_ESQ_COMMON_UI_ON"),

            name = getText("IGUI_mo_esdTrashCars"),
            tooltip = getText("IGUI_mo_esdTrashCars_tt"),
            default = 1,
        },
        esQoLPowders = {
            getText("IGUI_ESQ_COMMON_UI_OFF"),
            getText("IGUI_ESQ_COMMON_UI_ON"),

            name = getText("IGUI_mo_esdGunPowders"),
            tooltip = getText("IGUI_mo_esdGunPowders_tt"),
            default = 1,
        },
        esQoLSorter = {
            getText("IGUI_ESQ_COMMON_UI_OFF"),
            getText("IGUI_ESQ_COMMON_UI_ON"),
            getText("IGUI_ESQ_COMMON_UI_ON") .. " " .. getText("IGUI_ESS_MANUAL_SORT"),

            name = getText("IGUI_ESS_MENU"),
            tooltip = getText("IGUI_ESS_MENU_TT"),
            default = 1,
        },
        esQoLAutoEquip = {
            getText("IGUI_ESQ_COMMON_UI_OFF"),
            getText("IGUI_ESQ_COMMON_UI_ON") .. " " .. getText("IGUI_mo_aeSameType"),
            getText("IGUI_ESQ_COMMON_UI_ON") .. " " .. getText("IGUI_mo_aeSameWeapon"),

            name = getText("IGUI_mo_esqAutoEquip"),
            tooltip = getText("IGUI_mo_esqAutoEquip_TT"),
            default = 1,
        },
        esQoLDropOnBreak = {
            getText("IGUI_ESQ_COMMON_UI_OFF"),
            getText("IGUI_ESQ_COMMON_UI_ON"),

            name = getText("IGUI_mo_aeDropOnBreak"),
            tooltip = getText("IGUI_mo_aeDropOnBreak_TT"),
            default = 1,
        },
        esQoLFixer = {
            getText("IGUI_ESQ_COMMON_UI_OFF"),
            getText("IGUI_ESQ_COMMON_UI_ON"),

            name = getText("IGUI_mo_fixer"),
            tooltip = getText("IGUI_mo_fixer_TT"),
            default = 1,
        },
        esQoLFixerRanged = {
            getText("IGUI_ESQ_COMMON_UI_OFF"),
            getText("IGUI_ESQ_COMMON_UI_ON"),

            name = getText("IGUI_mo_fixerRanged"),
            tooltip = getText("IGUI_mo_fixerRanged_TT"),
            default = 1,
        },
        esQoLFixerAmmo = {
            getText("IGUI_ESQ_COMMON_UI_OFF"),
            getText("IGUI_ESQ_COMMON_UI_ON"),

            name = getText("IGUI_mo_fixerAmmo"),
            tooltip = getText("IGUI_mo_fixerAmmo_TT"),
            default = 1,
        },
        esQoLForceEquip = {
            getText("IGUI_ESQ_COMMON_UI_OFF"),
            getText("IGUI_ESQ_COMMON_UI_ON"),

            name = getText("IGUI_mo_esqForceEquip"),
            tooltip = getText("IGUI_mo_esqForceEquip_TT"),
            default = 1,
        },
    },
    mod_id = "esQoLMP",
    mod_fullname = getText("IGUI_mo_esqTweaksName"),
    mod_shortname = getText("IGUI_mo_esqTweaksName"),
}

function tweaksOptions.getOption(infoOption)
    if (getPlayer() and esQoLOptions.isMP and not esQoLOptions.isAdmin(getPlayer())) then
        local settings = esQoLOptions.getSettings(getPlayer());
        if not settings then return false end;
        esQolModOptions.options = settings;
    end
    if (esQolModOptions == nil) then return false end;

    if (infoOption == "mergeOn") then return esQolModOptions.options.esQoLIC > 1 end;
    if (infoOption == "mergeKeepOn") then return esQolModOptions.options.esQoLIC == 3 end;
    if (infoOption == "ammoCheckOn") then return esQolModOptions.options.esQoLAC > 1 end;
    if (infoOption == "ammoCheckFormat") then return esQolModOptions.options.esQoLAC end;
    if (infoOption == "sacOn") then return esQolModOptions.options.esQoLSac > 1 end;
    if (infoOption == "sacIgnore") then return esQolModOptions.options.esQoLSac == 3 end;

    if (infoOption == "drierOn") then return esQolModOptions.options.esQoLDrier > 1 end;
    if (infoOption == "dieterOn") then return esQolModOptions.options.esQoLDieter > 1 end;
    if (infoOption == "vitamaxOn") then return esQolModOptions.options.esQoLVitaMax > 1 end;
    if (infoOption == "vitamaxFast") then return esQolModOptions.options.esQoLVitaMax == 3 end;
    if (infoOption == "carhoodOn") then return esQolModOptions.options.esQoLCarHood > 1 end;
    if (infoOption == "corpseMergeOn") then return esQolModOptions.options.esQoLCorpseMerge > 1 end;
    if (infoOption == "corpseMergeArrow") then
        if (esQolModOptions.options.esQoLCorpseMerge == 3) then return 10 end;
        if (esQolModOptions.options.esQoLCorpseMerge == 4) then return 20 end;
        if (esQolModOptions.options.esQoLCorpseMerge == 5) then return 30 end;
        return nil;
    end
    if (infoOption == "metalOn") then return esQolModOptions.options.esQoLMetals > 1 end;
    if (infoOption == "wreckOn") then return esQolModOptions.options.esQoLTrashCars > 1 end;
    if (infoOption == "gunpowderOn") then return esQolModOptions.options.esQoLPowders > 1 end;
    if (infoOption == "sorterOn") then return esQolModOptions.options.esQoLSorter > 1 end;
    if (infoOption == "sorterManualOn") then return esQolModOptions.options.esQoLSorter == 3 end;
    if (infoOption == "autoEquipOn") then return esQolModOptions.options.esQoLAutoEquip > 1 end;
    if (infoOption == "autoEquipSameType") then return esQolModOptions.options.esQoLAutoEquip == 2 end;
    if (infoOption == "autoEquipSameWeapon") then return esQolModOptions.options.esQoLAutoEquip == 3 end;
    if (infoOption == "DropOnBreakOn") then return esQolModOptions.options.esQoLDropOnBreak > 1 end;
    if (infoOption == "fixerOn") then return esQolModOptions.options.esQoLFixer > 1 end;

    if (infoOption == "fixerRangeOn") then return esQolModOptions.options.esQoLFixerRanged > 1 end;
    if (infoOption == "fixerAmmoOn") then return esQolModOptions.options.esQoLFixerAmmo > 1 end;
    if (infoOption == "forceEquipOn") then return esQolModOptions.options.esQoLForceEquip > 1 end;
end

local function refreshGlobal()
    for k, v in pairs(modOptionsImport.options) do
        esQolModOptions.options[k] = v;
    end
    for k, v in pairs(modOptionsTweaks.options) do
        esQolModOptions.options[k] = v;
    end
    if (getPlayer() and esQoLOptions.isMP and esQoLOptions.isAdmin(getPlayer()) and esQolModOptions.options.esQoLMPInfo > 1) then
        esQoLOptions.setSettings();
    end;
    --print(esQoLOptions.isMP(),":",esQoLOptions.isAdmin(),":",esQolModOptions.options.esQoLMPInfo)
end

if ModOptions and ModOptions.getInstance then
    local importSettings = tweaksOptions.configImportedOptions;
    if (esQoLOptions.isMP) then
        importSettings.options_data["esQoLMPInfo"] = {
            getText("IGUI_ESQ_COMMON_UI_OFF"),
            getText("IGUI_ESQ_COMMON_UI_ON"),

            name = "Create MP Settings",
            tooltip = "Send QoL Settings to all players",
            default = 1,
        };
    end

    for k, v in pairs(importSettings.options_data) do
        importSettings.options_data[k]["OnApplyInGame"] = refreshGlobal;
    end
    for k, v in pairs(tweaksOptions.configOptions.options_data) do
        tweaksOptions.configOptions.options_data[k]["OnApplyInGame"] = refreshGlobal;
    end

    modOptionsImport = ModOptions:getInstance(importSettings);
    modOptionsTweaks = ModOptions:getInstance(tweaksOptions.configOptions);
    ModOptions:loadFile();
    refreshGlobal();
end

return tweaksOptions;