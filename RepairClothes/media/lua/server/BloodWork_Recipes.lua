
function InfectedFlesh(food, player)
	local bd = player:getBodyDamage();
	bd:setInf(true);
	bd:getBodyPart(BodyPartType.Head):SetInfected(true);
end

function TestRat(items, resultItem, player)
	local player_Inventory = player:getInventory();
	local transferred_Items = {}; 
	local item;
	local zedRat = false
	local getAge = 0
	local deadRat
	for i = 0, (items:size()-1) do 
		item = items:get(i); 
		if item:getType() == "DeadRat" then
			deadRat = item
		end
		if item:getType() == "SyringeZombieBlood" then
			gnarlyRat = player_Inventory:AddItem("Base.ZombieRat"); 
			zedRat = true
			player:playSound("FemaleZombieEating");
		end
	end
	if zedRat == false then
		local oldRat = player_Inventory:AddItem(deadRat);
	end
end

function TestMouse(items, resultItem, player)
	local player_Inventory = player:getInventory();
	local transferred_Items = {}; 
	local item;
	local zedRat = false
	local getAge = 0
	local deadRat
	--print("Tainted Test")
	for i = 0, (items:size()-1) do 
		item = items:get(i); 
		if item:getType() == "DeadMouse" then
			deadRat = item
		end
		if item:getType() == "SyringeZombieBlood" then
			gnarlyRat = player_Inventory:AddItem("Base.ZombieMouse"); 
			zedRat = true
			player:playSound("FemaleZombieEating");
		end
	end
	if zedRat == false then
		local oldRat = player_Inventory:AddItem(deadRat);
	end
end

function TestRabbit(items, resultItem, player)
	local player_Inventory = player:getInventory();
	local transferred_Items = {}; 
	local item;
	local zedRat = false
	local getAge = 0
	local deadRat
	--print("Tainted Test")
	for i = 0, (items:size()-1) do 
		item = items:get(i); 
		if item:getType() == "DeadRabbit" then
			deadRat = item
		end
		if item:getType() == "SyringeZombieBlood" then
			gnarlyRat = player_Inventory:AddItem("Base.ZombieRabbit"); 
			zedRat = true
			player:playSound("FemaleZombieEating");
		end
	end
	if zedRat == false then
		local oldRat = player_Inventory:AddItem(deadRat);
	end
end

function TestSquirrel(items, resultItem, player)
	local player_Inventory = player:getInventory();
	local transferred_Items = {}; 
	local item;
	local zedRat = false
	local getAge = 0
	local deadRat
	--print("Tainted Test")
	for i = 0, (items:size()-1) do 
		item = items:get(i); 
		if item:getType() == "DeadSquirrel" then
			deadRat = item
		end
		if item:getType() == "SyringeZombieBlood" then
			gnarlyRat = player_Inventory:AddItem("Base.ZombieSquirrel"); 
			zedRat = true
			player:playSound("FemaleZombieEating");
		end
	end
	if zedRat == false then
		local oldRat = player_Inventory:AddItem(deadRat);
	end
end

function TestBird(items, resultItem, player)
	local player_Inventory = player:getInventory();
	local transferred_Items = {}; 
	local item;
	local zedRat = false
	local getAge = 0
	local deadRat
	--print("Tainted Test")
	for i = 0, (items:size()-1) do 
		item = items:get(i); 
		if item:getType() == "DeadBird" then
			deadRat = item
		end
		if item:getType() == "SyringeZombieBlood" then
			gnarlyRat = player_Inventory:AddItem("Base.ZombieBird"); 
			zedRat = true
			player:playSound("FemaleZombieEating");
		end
	end
	if zedRat == false then
		local oldRat = player_Inventory:AddItem(deadRat);
	end
end

function blood_Test(items, resultItem, player)
	local player_Inventory = player:getInventory();
	local roll = ZombRand(0,10)
	--print(tostring(roll))
	--print(tostring(player:getPerkLevel(Perks.Doctor)))
	if roll > player:getPerkLevel(Perks.Doctor) then 
		local roll2 = ZombRand(0, 2)
		--print(tostring(roll2))
		if roll2 == 0 then
			player:getBodyDamage():SetScratched(BodyPartType.UpperArm_L, true)
		else
			player:getBodyDamage():SetScratched(BodyPartType.ForeArm_L, true)
		end
		player:playSound("ZombieScratch");
	end	
	local bd = player:getBodyDamage();
	if bd:getInfectionLevel() > 0 then
		--print("TRUE")
		player_Inventory:AddItem("Base.SyringeZombieBlood")		
		resultItem:setType("SyringeZombieBlood")
	else
		player_Inventory:AddItem("Base.SyringeBlood")
	end
end

function Shoot_Blood(items, resultItem, player)
	local player_Inventory = player:getInventory();
	local roll = ZombRand(0,10)
	--print(tostring(roll))
	--print(tostring(player:getPerkLevel(Perks.Doctor)))
	if roll > player:getPerkLevel(Perks.Doctor) then 
		local roll2 = ZombRand(0, 2)
		--print(tostring(roll2))
		if roll2 == 0 then
			player:getBodyDamage():SetScratched(BodyPartType.UpperArm_L, true)
		else
			player:getBodyDamage():SetScratched(BodyPartType.ForeArm_L, true)
		end
		player:playSound("ZombieScratch");
	end
	for i = 0, (items:size()-1) do 
		item = items:get(i);
		if item:getType() == "SyringeZombieBlood" then
			local bd = player:getBodyDamage();
			bd:setInf(true);
			bd:getBodyPart(BodyPartType.Head):SetInfected(true);
		end
	end
end

