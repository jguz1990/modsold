local item = "Corkscrew"
if not item:contains("Base.") then item = tostring("Base." .. item) end
local item = ScriptManager.instance:getItem(item)				
if item then item:DoParam("Tags = Corkscrew") end

-- local item = "Wine"
-- if not item:contains("Base.") then item = tostring("Base." .. item) end
-- local item = ScriptManager.instance:getItem(item)				
-- if item then
	-- item:DoParam("HungerChange = 0")
	-- item:DoParam("ThirstChange = 0")
	-- item:DoParam("UnhappyChange = 0")
	-- item:DoParam("ReplaceOnUse = nil")
	-- item:DoParam("CustomContextMenu = nil")
	-- item:DoParam("EatType = nil")
-- end

-- local item = "Wine2"
-- if not item:contains("Base.") then item = tostring("Base." .. item) end
-- local item = ScriptManager.instance:getItem(item)				
-- if item then
	-- item:DoParam("HungerChange = nil")
	-- item:DoParam("ThirstChange = nil")
	-- item:DoParam("UnhappyChange = nil")
	-- item:DoParam("ReplaceOnUse = nil")
	-- item:DoParam("CustomContextMenu = nil")
	-- item:DoParam("EatType = nil")
-- end


