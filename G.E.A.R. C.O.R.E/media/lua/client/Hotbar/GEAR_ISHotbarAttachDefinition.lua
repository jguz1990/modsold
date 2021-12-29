require "Hotbar/ISHotbarAttachDefinition"
if not ISHotbarAttachDefinition then
    return
end
local MOD_DATA = {
    SmallBeltLeft = {
        Gear = "Gear Belt Left", 
    },
    SmallBeltRight = {
        Gear = "Gear Belt Right",
    },
}
for _,t in pairs(ISHotbarAttachDefinition) do
    if t.type and MOD_DATA[t.type] then
        for k,v in pairs(MOD_DATA[t.type]) do
            if v == 0 and t.replacement then
                t.replacement[k] = nil
            elseif t.attachments then
                t.attachments[k] = v ~= 0 and v or nil
            else
                print('ERROR: Unknown mod data option.')
            end
        end
    end
end

-- local Gear = {
    -- SmallBeltLeft = {
        -- Gear = "Gear Belt Left", 
    -- },
    -- SmallBeltRight = {
        -- Gear = "Gear Belt Right",
    -- },
-- }

-- table.insert(ISHotbarAttachDefinition, Gear);

