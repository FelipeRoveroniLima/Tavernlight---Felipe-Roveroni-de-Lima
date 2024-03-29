-- Q2 - Fix or improve the implementation of the below method

--[[
-- This code will only print the name of the first guild it founds.
function printSmallGuildNames(memberCount)
	-- this method is supposed to print names of all guilds that have less than memberCount max members
	local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;"
	local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount))
	local guildName = result.getString("name")
	print(guildName)
end
--]]

-- So we need to iterate over all the results and print all the names of the guilds that have "< memberCount" max members.
-- Also there are some room for improvement in the code which will be explained in the following code:
function printSmallGuildNames(memberCount)
	local selectGuildQuery = "SELECT name FROM guilds WHERE max_members < %d;" 		-- Query created to get the guilds with less than the input "memberCount" members.
	local resultId = db.storeQuery(string.format(selectGuildQuery, memberCount)) 	-- Making the query to the database and storing it in the resultId.

	-- First of, we need to check if the resultId is empty or not.
	if resultId == nil then
		print("No guilds found.") 							-- If the resultId is empty, print this message and return.
		return
	else
		repeat
			local guildName = resultId.getString("name") 	-- Getting the name of the guild from the resultId.
			print(guildName) 								-- Printing the name of the guild.
		until not resultId.next(resultId) 					-- Repeat the loop until there are no more results.
	end
end