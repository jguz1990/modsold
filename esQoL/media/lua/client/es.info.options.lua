local infoOptions = {};
infoOptions.modOptions = {};

infoOptions.configOptions = {
    options_data = {
        esQoLHealthInfo = {
            getText("IGUI_ESQ_COMMON_UI_OFF"),
            getText("IGUI_ESQ_COMMON_UI_ON"),

            name = getText("IGUI_mo_esqHealthInfo"),
            tooltip = getText("IGUI_mo_esqHealthInfo_TT"),
            default = 1,
        },
        esQoLDrainableInfo = {
            getText("IGUI_ESQ_COMMON_UI_OFF"),
            getText("IGUI_ESQ_COMMON_UI_ON"),

            name = getText("IGUI_mo_esqDrainableInfo"),
            tooltip = getText("IGUI_mo_esqDrainableInfo_TT"),
            default = 1,
        },
        esQoLWIMelee = {
            getText("IGUI_ESQ_COMMON_UI_OFF"),
            getText("IGUI_ESQ_COMMON_UI_ON") .." "..getText("IGUI_mo_esqInfo_TT_E"),
            getText("IGUI_ESQ_COMMON_UI_ON") .." "..getText("IGUI_mo_esqInfo_TT_S"),
            getText("IGUI_ESQ_COMMON_UI_ON") .." "..getText("IGUI_mo_esqInfo_TT_O"),

            name = getText("IGUI_mo_esqWeaponInfoMelee"),
            tooltip = getText("IGUI_mo_esqWeaponInfoMelee_TT"),
            default = 1,
        },
        esQoLWIRanged = {
            getText("IGUI_ESQ_COMMON_UI_OFF"),
            getText("IGUI_ESQ_COMMON_UI_ON") .." "..getText("IGUI_mo_esqInfo_TT_E"),
            getText("IGUI_ESQ_COMMON_UI_ON") .." "..getText("IGUI_mo_esqInfo_TT_S"),
            getText("IGUI_ESQ_COMMON_UI_ON") .." "..getText("IGUI_mo_esqInfo_TT_O"),

            name = getText("IGUI_mo_esqWeaponInfoRanged"),
            tooltip = getText("IGUI_mo_esqWeaponInfoRanged_TT"),
            default = 1,
        },
        esQoLWIParts = {
            getText("IGUI_ESQ_COMMON_UI_OFF"),
            getText("IGUI_ESQ_COMMON_UI_ON") .." "..getText("IGUI_mo_esqInfo_TT_E"),
            getText("IGUI_ESQ_COMMON_UI_ON") .." "..getText("IGUI_mo_esqInfo_TT_S"),
            getText("IGUI_ESQ_COMMON_UI_ON") .." "..getText("IGUI_mo_esqInfo_TT_O"),

            name = getText("IGUI_mo_esqWeaponInfoParts"),
            tooltip = getText("IGUI_mo_esqWeaponInfoParts_TT"),
            default = 1,
        },
        esQoLClothingInfo = {
            getText("IGUI_ESQ_COMMON_UI_OFF"),
            getText("IGUI_ESQ_COMMON_UI_ON") .." "..getText("IGUI_mo_esqInfo_TT_E"),
            getText("IGUI_ESQ_COMMON_UI_ON") .." "..getText("IGUI_mo_esqInfo_TT_S"),
            getText("IGUI_ESQ_COMMON_UI_ON") .." "..getText("IGUI_mo_esqInfo_TT_O"),

            name = getText("IGUI_mo_esqClothingInfo"),
            tooltip = getText("IGUI_mo_esqClothingInfo_TT"),
            default = 1,
        },
        esQoLBookInfo = {
            getText("IGUI_ESQ_COMMON_UI_OFF"),
            getText("IGUI_ESQ_COMMON_UI_ON"),

            name = getText("IGUI_mo_book"),
            tooltip = getText("IGUI_mo_book_TT"),
            default = 1,
        },
        esQoLCarSpaceInfo = {
            getText("IGUI_ESQ_COMMON_UI_OFF"),
            getText("IGUI_ESQ_COMMON_UI_ON"),

            name = getText("IGUI_mo_carSpace"),
            tooltip = getText("IGUI_mo_carSpace_TT"),
            default = 1,
        },
    },
    mod_id = "esQoL",
    mod_fullname = getText("IGUI_mo_esqInfoName"),
    mod_shortname = getText("IGUI_mo_esqInfoName"),
}

function infoOptions.getOption(infoOption)
    if (infoOption == "drainOn") then return infoOptions.modOptions.options.esQoLDrainableInfo == 2 end;
    if (infoOption == "healthOn") then return infoOptions.modOptions.options.esQoLHealthInfo == 2 end;
    if (infoOption == "meleeOn") then return infoOptions.modOptions.options.esQoLWIMelee > 1 end;
    if (infoOption == "meleeCardinal") then
        if (infoOptions.modOptions.options.esQoLWIMelee == 2) then return "E" end;
        if (infoOptions.modOptions.options.esQoLWIMelee == 3) then return "S" end;
        if (infoOptions.modOptions.options.esQoLWIMelee == 4) then return "O" end;
    end
    if (infoOption == "rangedOn") then return infoOptions.modOptions.options.esQoLWIRanged > 1 end;
    if (infoOption == "rangedCardinal") then
        if (infoOptions.modOptions.options.esQoLWIRanged == 2) then return "E" end;
        if (infoOptions.modOptions.options.esQoLWIRanged == 3) then return "S" end;
        if (infoOptions.modOptions.options.esQoLWIRanged == 4) then return "O" end;
    end
    if (infoOption == "partsOn") then return infoOptions.modOptions.options.esQoLWIParts > 1 end;
    if (infoOption == "partsCardinal") then
        if (infoOptions.modOptions.options.esQoLWIParts == 2) then return "E" end;
        if (infoOptions.modOptions.options.esQoLWIParts == 3) then return "S" end;
        if (infoOptions.modOptions.options.esQoLWIParts == 4) then return "O" end;
    end
    if (infoOption == "booksOn") then return infoOptions.modOptions.options.esQoLBookInfo > 1 end;
    if (infoOption == "carSpaceOn") then return infoOptions.modOptions.options.esQoLCarSpaceInfo > 1 end;
    if (infoOption == "clotheOn") then return infoOptions.modOptions.options.esQoLClothingInfo > 1 end;
    if (infoOption == "clotheCardinal") then
        if (infoOptions.modOptions.options.esQoLClothingInfo == 2) then return "E" end;
        if (infoOptions.modOptions.options.esQoLClothingInfo == 3) then return "S" end;
        if (infoOptions.modOptions.options.esQoLClothingInfo == 4) then return "O" end;
    end
end

if ModOptions and ModOptions.getInstance then
    infoOptions.modOptions = ModOptions:getInstance(infoOptions.configOptions);
end

return infoOptions;