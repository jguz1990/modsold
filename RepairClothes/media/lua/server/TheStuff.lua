function TheStuff(food, player)
	local transmission = getSandboxOptions():getOptionByName("ZombieLore.Transmission")
	getSandboxOptions():set("ZombieLore.Transmission",1)
	local bd = player:getBodyDamage();
	bd:setInf(true);
	bd:getBodyPart(BodyPartType.Head):SetInfected(true);
	getSandboxOptions():set("ZombieLore.Transmission",transmission)
end
