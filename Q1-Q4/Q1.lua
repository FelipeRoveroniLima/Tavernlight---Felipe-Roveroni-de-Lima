-- Q1 - Fix or improve the implementation of the below methods

--[[
local function releaseStorage(player)
	player:setStorageValue(1000, -1)
end

function onLogout(player)
	if player:getStorageValue(1000) == 1 then
		addEvent(releaseStorage, 1000, player)
	end
	return true
end
--]]
-- The original code seems pretty well implemented, but there is a small inconvenience whenever you want to make a change in the storage value.
-- The Storage Value and Delay Value are hardcoded in the function, so if you want to change it, you need to change it in the function itself which is very unpractical.
-- It would be better if the timer value was a parameter of the function, so you could change it whenever you want in a easy access position.

-- First we declare a constant to store the storage value.
local STORAGE_VALUE = 1000
local DELAY_TIME 	= 1000

local function releaseStorage(player)
	player:setStorageValue(STORAGE_VALUE, -1) 					-- Changed the hardcoded Storage Value to the constant.

    print("Storage released for player: " .. player:getName()) 	-- Added a optional print to show that the storage was sucessfully released for the player.
end

function onLogout(player)
	if player:getStorageValue(STORAGE_VALUE) == 1 then 			-- Changed the hardcoded Storage Value to the constant.
	    addEvent(releaseStorage, DELAY_TIME, player) 			-- Changed the hardcoded Delay   Value to the constant.
	end

	return true
end