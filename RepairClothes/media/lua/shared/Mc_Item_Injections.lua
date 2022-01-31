Events.OnGameBoot.Add(function ()
    local item_modifiers = CoxisUtil.readTXT ("MoreTrash","/media/scripts/Mc_Item_Injections.txt")
    item_modifiers = split(item_modifiers, "\n")
    local items_processed = 0
    while ( items_processed < #item_modifiers ) do
        items_processed = items_processed + 1
        local item_info = split (item_modifiers[items_processed],",")
        local item_name = ( item_info[2] .. ".")
        local item_name2 = ( item_name .. item_info[3] )
        TweakItem( item_name2, item_info[4], item_info[5]);
        end
    print ("done item injections!")
end)

function split(str, sep)
   local fields = {}
   local pattern = string.format("([^%s]+)", sep)
   str:gsub(pattern, function(c) fields[#fields+1] = c end)
   return fields
end