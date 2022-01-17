function Compass_context (player, context, items)
	--print("TESTING!!!!!!!!!!!!!!!!!!!!!!!!")
	 Compass_context2 (player, context, items)	
	end
	
Events.OnPreFillInventoryObjectContextMenu.Add(Compass_context)