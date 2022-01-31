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

