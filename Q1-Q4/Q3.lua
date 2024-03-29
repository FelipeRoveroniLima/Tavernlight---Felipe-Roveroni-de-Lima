-- Q3 - Fix or improve the name and the implementation of the below method

--[[
	function do_sth_with_PlayerParty(playerId, membername) 
		player = Player(playerId)                       -- The variable player is not declared as local but it also is redudant since it is created just to be requested in the next variable.
		local party = player:getParty()

		for k,v in pairs(party:getMembers()) do         -- The variables k and v are not descriptive and also k is a thrawaway variable so it can be a underscore "_".
			if v == Player(membername) then             -- For every member in the party, it will make unecessary request for the member name in the Player class.
				party:removeMember(Player(membername))  -- The method is calling again the object Player, which is not necessary since we will have a variable for that.
				-- The method after removing the player from the party, will continue the loop, which is not necessary.
			end
		end
	end
--]]

-- The method name makes unclear of what it does, so i've changed it to a more suitable name.
function removeMemberFromParty(playerId, memberName)
	local party  = Player(playerId):getParty()      -- Variable that will store the party of the player.
	local memberToRemove = Player(memberName)       -- Variable that will store the member to be removed from the party.

	-- in case the variable _ is not very descriptive, its possible to just use the "index" name for it.
	for _, member in pairs(party:getMembers()) do   -- Iterating over the members of the party.
		if member == memberToRemove then            -- Comparing the member with the member to be removed.
			party:removeMember(memberToRemove)      -- Removing the member from the party.
			break                                   -- Since the member was found and removed, there is no need to keep iterating.
		end
	end
end