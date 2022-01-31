function detect_Alarm2 (player, context, worldobjects, test)
	detect_Alarm (player, context, worldobjects, test)
end

Events.OnPreFillWorldObjectContextMenu.Add(detect_Alarm2)	