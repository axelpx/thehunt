local filePath = 'resources/thehunt/data/'
playerDataCache = {}
playerIdentifierCache = {}
defaultPlayerData = {lvl = 1, exp = 0, loadout = {}, money = 0}

function usePlayerData(player)
	local playerIdentifier = getIdentifier(player)
	local loadedData = LoadResourceFile(GetCurrentResourceName(), "data/"..playerIdentifier..".json") or nil
	print("Processing player data...")
	if loadedData ~= nil then
		loadedData = json.decode(loadedData)
		playerDataCache[playerIdentifier] = loadedData
		TriggerClientEvent("updatePlayerData", player, loadedData)
		return loadedData
	end
	playerDataCache[playerIdentifier] = defaultPlayerData
	savePlayerData(player)
	
	return defaultPlayerData
end

function savePlayerData(player)
	local playerIdentifier = getIdentifier(player)
	SaveResourceFile(GetCurrentResourceName(), "data/"..playerIdentifier..".json", json.encode(playerDataCache[playerIdentifier]),-1)
end

function getPlayerData(player)
	local identifier = getIdentifier(player)
	if not playerDataCache[identifier] then
		playerDataCache[identifier] = defaultPlayerData
		TriggerClientEvent("updatePlayerData", player, defaultPlayerData)
		savePlayerData(player)
	end
	return playerDataCache[identifier]
end

function setPlayerData(player,data)
	local identifier = getIdentifier(player)
	for i,d in pairs(playerDataCache[identifier]) do
		for k,v in pairs(data) do
			if i == k then
				playerDataCache[identifier][i] = data[i]
			end
		end
	end
	updatePlayerData(player)
end

function updatePlayerData(player)
	local identifier = getIdentifier(player)
	if playerDataCache[identifier] then
		TriggerClientEvent("updatePlayerData", player, playerDataCache[identifier])
	else
		TriggerClientEvent("updatePlayerData", player, defaultPlayerData)
	end
end

function getIdentifier(player) -- TODO: If steamID saving gets added, change here too.
	if playerIdentifierCache[player] then
		return playerIdentifierCache[player]
	else
		return tryIdentifiers(player)["license"] 
	end
end

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(60000)
		for i,p in pairs(GetPlayers()) do
			--updatePlayerData(p)
			if tryIdentifiers(p)["license"]  then
				savePlayerData(p)
			end	
			Wait(200)
		end
	end
end)

RegisterServerEvent('playerExists')
RegisterServerEvent('playerFirstSpawn')

AddEventHandler('playerExists',function()
	usePlayerData(source)
end)

AddEventHandler('playerFirstSpawn',function(spawnInfo,source)
	usePlayerData(source)
end)