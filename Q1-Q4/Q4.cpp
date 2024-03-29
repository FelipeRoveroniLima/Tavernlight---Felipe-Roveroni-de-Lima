//  Q4 - Assume all method calls work fine. Fix the memory leak issue in below method

// The memory leak happens due the newly created player object is not deleted.

/*
void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)
{
	Player* player = g_game.getPlayerByName(recipient);
	if (!player) {
		player = new Player(nullptr);
		
		if (!IOLoginData::loadPlayerByName(player, recipient)) {
			return;
		}
	}

	Item* item = Item::CreateItem(itemId); // Create a new item object
	if (!item) {
		return;
	}

	g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);
	
	if (player->isOffline()) {
		IOLoginData::savePlayer(player);
	}
	// Ends without deleting the new player object created. This causes the memory leak issue.
}
*/


// To fix the problem its possible to either delete the new object or use the std::unique_ptr to manage the memory.
// in this case I will use the std::unique_ptr to manage the memory of the new player object.
void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)
{
	std::unique_ptr<Player> newPlayer; 					// Create a unique pointer to manage the memory of the new player object;
	Player* player = g_game.getPlayerByName(recipient); // Get the player object by name;

	// Checks if the player exists, if not create a new player object;
	if (!player) {
		newPlayer = std::make_unique<Player>(nullptr); 	// A new player is created;
		player = newPlayer.get(); 						// Get the raw pointer of the new player object;
		// Try to load the data, if not found it just returns and the unique pointer will delete the new player object.
		if (!IOLoginData::loadPlayerByName(player, recipient)) {
			return;
		}
	}

	Item* item = Item::CreateItem(itemId); // Create a new item object
	
	// Check if the item object is created successfully, if not it just returns and the unique pointer will delete the new player object.
	if (!item) {
		return;
	}

	g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT); // Add the item to the player's inbox

	// Check if the player is offline
	if (player->isOffline()) {
		IOLoginData::savePlayer(player); // Save the player data
	}
}