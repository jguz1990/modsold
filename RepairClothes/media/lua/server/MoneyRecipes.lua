local item = ScriptManager.instance:getItem("Base.Wallet")	
if item then 
	item:DoParam("StaticModel = Wallet")
end
local item = ScriptManager.instance:getItem("Base.Wallet2")	
if item then 
	item:DoParam("StaticModel = Wallet2")
end
local item = ScriptManager.instance:getItem("Base.Wallet3")	
if item then 
	item:DoParam("StaticModel = Wallet3")
end
local item = ScriptManager.instance:getItem("Base.Wallet4")	
if item then 
	item:DoParam("StaticModel = Wallet4")
end
local item = ScriptManager.instance:getItem("Base.Money")	
if item then 
	item:DoParam("DisplayCategory = Money")
end


function Accept_Wallet(container, item)
	local iType = item:getType()
	if iType == "Meth" or iType:contains("Baggie") then return true end
	local weight = item:getWeight()
	if weight > 0.1000001 then
		print("Too Heavy! " .. tostring(weight))
		return false
	end
	if iType:contains("Newspaper") and not iType:contains("Article") then return false end
	return  item:getDisplayCategory()=="Money"
	or  item:getDisplayCategory()=="Cartography"
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
	or iType == "Meth"
	or iType == "CheapSpeed"
	or iType == "Cjill"
	or iType == "PZCF_BoosterPack"
	or (iType:contains("PZCF") and iType:contains("TGC"))
end 


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
	or iType == "Meth"
	or iType == "CheapSpeed"
	or iType == "Cjill"
	or iType == "PZCF_BoosterPack"
	or (iType:contains("PZCF") and iType:contains("TGC"))
end 
function Bills_1_100_OnCreate(items, result, player)
	player:getInventory():AddItems("Base.1_DollarBill", 100)
end
function Bills_2_100_OnCreate(items, result, player)
	player:getInventory():AddItems("Base.2_DollarBill", 100)
end
function Bills_5_100_OnCreate(items, result, player)
	player:getInventory():AddItems("Base.5_DollarBill", 100)
end
function Bills_10_100_OnCreate(items, result, player)
	player:getInventory():AddItems("Base.10_DollarBill", 100)
end
function Bills_20_100_OnCreate(items, result, player)
	player:getInventory():AddItems("Base.20_DollarBill", 100)
end
function Bills_50_100_OnCreate(items, result, player)
	player:getInventory():AddItems("Base.50_DollarBill", 100)
end
function Bills_100_100_OnCreate(items, result, player)
	player:getInventory():AddItems("Base.100_DollarBill", 100)
end

function CountMoney_OnCreate(items, result, player)
	local maxRoll = 5
	while ZombRand(0,maxRoll) == 0 do	
	   player:getInventory():AddItem("Base.100_DollarBill");  
	end
	while ZombRand(0,maxRoll) == 0 do	
	   player:getInventory():AddItem("Base.50_DollarBill");  
	end
	while ZombRand(0,maxRoll) == 0 do	
	   player:getInventory():AddItem("Base.20_DollarBill");  
	end
	while ZombRand(0,maxRoll) == 0 do	
	   player:getInventory():AddItem("Base.10_DollarBill");  
	end
	while ZombRand(0,maxRoll) == 0 do	
	   player:getInventory():AddItem("Base.5_DollarBill");  
	end
	while ZombRand(0,maxRoll) == 0 do	
	   player:getInventory():AddItem("Base.2_DollarBill");  
	end
	while ZombRand(0,maxRoll) == 0 do	
	   player:getInventory():AddItem("Base.1_DollarBill");  
	end	
	while ZombRand(0,maxRoll) == 0 do	
	   player:getInventory():AddItem("Base.Quarter");  
	end
	while ZombRand(0,maxRoll) == 0 do	
	   player:getInventory():AddItem("Base.Dime");
	end	
	while ZombRand(0,maxRoll) == 0 do	
	   player:getInventory():AddItem("Base.Nickel");  
	end	
	while ZombRand(0,maxRoll) == 0 do	
	   player:getInventory():AddItem("Base.Penny");  
	end	
	if ZombRand(0,maxRoll) == 0 then
	   player:getInventory():AddItem("Base.RubberBand");  
	end	
	local roll = ZombRand(0,7)
	if roll == 0 then
	   player:getInventory():AddItem("Base.100_DollarBill");  	
	elseif roll == 1 then
	   player:getInventory():AddItem("Base.50_DollarBill"); 	
	elseif roll == 2 then
	   player:getInventory():AddItem("Base.20_DollarBill");    	
	elseif roll == 3 then
	   player:getInventory():AddItem("Base.10_DollarBill");  	
	elseif roll == 4 then
	   player:getInventory():AddItem("Base.5_DollarBill");  	
	elseif roll == 5 then
	   player:getInventory():AddItem("Base.2_DollarBill");  	
	elseif roll == 6 then
	   player:getInventory():AddItem("Base.1_DollarBill");  
	end
	local roll = ZombRand(0,4)	
	if roll == 0 then
	   player:getInventory():AddItem("Base.Quarter"); 	
	elseif roll == 1 then
	   player:getInventory():AddItem("Base.Dime");	
	elseif roll == 2 then
	   player:getInventory():AddItem("Base.Nickel");  	
	elseif roll == 3 then
	   player:getInventory():AddItem("Base.Penny");  	
	end
end

function SearchWallet_OnTest(item)
	-- print("Search Test")
	local wallet = item:getModData()
	if wallet.searched == true then
		return false
	end
	return true
end
function SearchWallet_OnCreate(items, result, player)
	local item = items:get(0)
	local iType = item:getType()
	iType = (tostring(iType .. "_pa"))
	player:getInventory():AddItem(iType)
	--print("Wallet?")
	local wallet = item:getModData()
	if not wallet.searched then
		--print("Not Searched")
		wallet.searched = true
		local maxRoll = 5
		while ZombRand(0,maxRoll) == 0 do	
		   player:getInventory():AddItem("Base.CreditCard");  
		end
		while ZombRand(0,maxRoll) == 0 do	
		   player:getInventory():AddItem("Base.100_DollarBill");  
		end
		while ZombRand(0,maxRoll) == 0 do	
		   player:getInventory():AddItem("Base.50_DollarBill");  
		end
		while ZombRand(0,maxRoll) == 0 do	
		   player:getInventory():AddItem("Base.20_DollarBill");  
		end
		while ZombRand(0,maxRoll) == 0 do	
		   player:getInventory():AddItem("Base.10_DollarBill");  
		end
		while ZombRand(0,maxRoll) == 0 do	
		   player:getInventory():AddItem("Base.5_DollarBill");  
		end
		while ZombRand(0,maxRoll) == 0 do	
		   player:getInventory():AddItem("Base.2_DollarBill");  
		end
		while ZombRand(0,maxRoll) == 0 do	
		   player:getInventory():AddItem("Base.1_DollarBill");  
		end	
		if ZombRand(0,99) == 0 then	
			while ZombRand(0,maxRoll) == 0 do	
				player:getInventory():AddItem("Base.CokeBaggie");  
			end	
		   player:getInventory():AddItem("Base.CokeBaggie");  
		end	
		if ZombRand(0,99) == 0 then	
			while ZombRand(0,maxRoll) == 0 do	
				player:getInventory():AddItem("Base.Meth");  
			end	
		   player:getInventory():AddItem("Base.Meth");  
		end	
		if ZombRand(0,99) == 0 then	
			while ZombRand(0,maxRoll) == 0 do	
				player:getInventory():AddItem("Base.CheapSpeed");  
			end	
		   player:getInventory():AddItem("Base.CheapSpeed");  
		end	
	end
end
function FlipCoin_OnCreate(items, result, player)
	if ZombRand(0,2) == 0 then
		player:Say("Heads!")
	else
		player:Say("Tails!")
	end
end

DiceRolls = {

	"Zero",
	"One",
	"Two, Snake Eyes",
	"Three, Ace Deuce",
	"Four",
	"Fever Five",
	"Six",
	"Seven, Big Red",
	"Eight",
	"Nine, Nina",
	"Ten",
	"Eleven",
	"Twelve, Boxcars",
	}



function RollDice_OnCreate(items, result, player)
	player:playSound("ChatRollDice")
	local roll1 = ZombRand(1,6)
	local roll2 = ZombRand(1,6)
	--player:Say(tostring(roll1) .. " & " .. tostring(roll2) .. ", " .. tostring(roll1 + roll2) .. "!")
	player:Say(tostring(roll1) .. " & " .. tostring(roll2))
	--player:Say(tostring(roll1 + roll2) .. "!")
	player:Say(DiceRolls[(roll1 + roll2 + 1)] .. "!")
	local sq = player:getSquare()
	sq:AddWorldInventoryItem("Base.Dice", 0.0, 0.0, 0.0)
end



function UnrollBills_OnCreate(items, result, player)
	player:getInventory():AddItem("Base.RubberBand") 
end

