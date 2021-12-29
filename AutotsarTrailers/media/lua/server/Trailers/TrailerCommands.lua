
local TrailerCommands = {}
local Commands = {}

function Commands.setHeadlightsOn(playerObj, args)
	--print("Commands.setHeadlightsOn")
	local trailer = getVehicleById(args.trailer)
	trailer:setHeadlightsOn(args.on)
	local part = trailer:getPartById("HeadlightLeft")
	part:setLightActive(args.on)
end


TrailerCommands.OnClientCommand = function(module, command, playerObj, args)
	--print("TrailerCommands.OnClientCommand")
	if module == 'trailer' and Commands[command] then
		--print("trailer")
		local argStr = ''
		args = args or {}
		for k,v in pairs(args) do
			argStr = argStr..' '..k..'='..tostring(v)
		end
		--noise('received '..module..' '..command..' '..tostring(trailer)..argStr)
		Commands[command](playerObj, args)
	end
end

Events.OnClientCommand.Add(TrailerCommands.OnClientCommand)