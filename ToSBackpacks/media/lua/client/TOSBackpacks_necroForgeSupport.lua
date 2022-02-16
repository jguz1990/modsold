Events.OnGameStart.Add( function ()
	print ("Adding TOSBackpacks to NecroForge");
	if NecroList then
		if NecroList.Items.Small then	
		else
			NecroList.Items.Small = {"Misc.", nil, nil, "ToS Small Bag", "TOSBackpacks.Small", "Item_Small", nil, nil, nil};
		end
		if NecroList.Items.Medium then	
		else
			NecroList.Items.Medium = {"Misc.", nil, nil, "ToS Medium Bag", "TOSBackpacks.Medium", "Item_Medium", nil, nil, nil};
		end
		if NecroList.Items.Big then	
		else
			NecroList.Items.Big = {"Misc.", nil, nil, "ToS Big Bag", "TOSBackpacks.Big", "Item_Big", nil, nil, nil};
		end
		if NecroList.Items.Huge then	
		else
			NecroList.Items.Huge = {"Misc.", nil, nil, "ToS Huge Bag", "TOSBackpacks.Huge", "Item_Huge", nil, nil, nil};
		end
	end
end)