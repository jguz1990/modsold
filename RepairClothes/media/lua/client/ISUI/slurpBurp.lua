function slurpBurp (player, context, worldobjects, test)
	slurpBurp2(player, context, worldobjects, test)
	-- for x in pairs(worldobjects) do
		-- if worldobjects[x].getProperties().Val("CustomName") then
			-- print(worldobjects[x].getProperties().Val("CustomName"))		
		-- end
	-- end
end



Events.OnPreFillWorldObjectContextMenu.Add(slurpBurp)	