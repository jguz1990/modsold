-- PLLGhost = {}
-- PLLGhost.GhostModeclose = true;

-- function PLLGhost.checkGhostItem(player)
	-- return player:getInventory():contains("Base.SpookySuit");
-- end
-- function PLLGhost.setGhost(player)
	-- if PLLGhost.checkGhostItem(player) then
		-- if not player:isGhostMode() then
			-- player:setGhostMode(true);
			-- if not PLLGhost.GhostModeclose then
				-- --player:Say(getText("Spooky ON"));
			-- end
		-- end
		-- if player:isGhostMode() and PLLGhost.GhostModeclose then
			-- player:setGhostMode(false);
		-- end
	-- elseif  player:isGhostMode() then
		-- player:setGhostMode(false);
		-- --player:Say(getText("Spooky OFF"));
    -- end
	
	-- PLLGhost.GhostModeclose = false;
-- end

-- Events.OnPlayerUpdate.Add(PLLGhost.setGhost);