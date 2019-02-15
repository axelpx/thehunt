playerData = {rank = 1, exp = 0, loadout = {}, money = Settings.DefaultMoney}

RegisterNetEvent('updatePlayerDB')
RegisterNetEvent('teleportPlayer')

money = 0;
AddEventHandler('playerSpawned',function(spawnInfo)
	print("Player spawned! Spawn info: " .. tostring(spawnInfo))
	TriggerServerEvent('playerSpawned',spawnInfo)
	UpdateTeamMembers()
	Citizen.Wait(100)
	playerName = GetPlayerName(playerID)
end)

AddEventHandler('updatePlayerDB',function(data)
	playerData = data
end)

AddEventHandler('teleportPlayer',function(x,y,z)
	SetEntityCoords(GetPlayerPed(-1),x,y,z)
end)

Citizen.CreateThread(function()
	TriggerServerEvent("playerExists")
end)

--[[
TriggerServerEvent("spawnPlayer", source)

RegisterNetEvent("outputDBEntry")
AddEventHandler("outputDBEntry", function(argument)
    TriggerEvent("chatMessage", "[server]", {255,255,0}, "Got last entry: " .. argument .. " from DB.")
end)]]--