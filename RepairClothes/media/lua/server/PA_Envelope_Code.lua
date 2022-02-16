
function Accept_Envelope(container, item)
	-- local weight = item:getWeight()
	-- if weight > 0.1000001 then
		-- print("Too Heavy! " .. tostring(weight))
		-- return false
	-- end
	local iType = item:getType()
	-- if iType:contains("Newspaper") and not iType:contains("Article") then return false end
	return  item:getDisplayCategory()=="Money"
	or  item:getDisplayCategory()=="Cartography"
	or  item:getDisplayCategory()=="Literature"
	or  item:getDisplayCategory()=="Security"
	-- or item:getDisplayCategory()=="Key" 
	-- or item:getDisplayCategory()=="Security" 
	-- or item:getDisplayCategory()=="Junk" 
	or iType:contains("Money")
	or iType:contains("money")
	or iType:contains("card")
	or iType:contains("Card")
	or iType:contains("paper")
	or iType:contains("Paper")
	or iType:contains("badge")
	or iType:contains("Badge")
	or iType:contains("Baggie")
	or iType:contains("CasinoChip")
	or iType:contains("RubberBand")
	or iType:contains("pa_CokeBrick")
	or iType == "Meth"
	or iType == "CheapSpeed"
	or iType == "Cjill"
	or iType == "PZCF_BoosterPack"
	or (iType:contains("PZCF") and iType:contains("TGC"))
end 

function PA_Money_NothingInside(item)
	-- print("Stuff test " .. tostring(item:getType()))
	local cat = item:getCategory()
	-- print("Category " .. tostring(cat))
	if item:getCategory() == "Container" and (item:getInventory():getItems():size()) > 0 then
		print("Container " .. tostring(item:getInventory():getItems()))
		return false
	end
	-- and item:getContainer():getItems() then return false end	
	return true
end