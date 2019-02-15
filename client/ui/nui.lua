RegisterCommand("show", function()
        EnableGui(true)
        --DisplayNotification("GUI shown!")
end)

RegisterCommand("hide", function()
        EnableGui(false)
        --DisplayNotification("GUI hidden!")
end)

local guiEnabled = false

function DisplayNotification(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(true, false)
end

function PrintChatMessage(text)
    TriggerEvent('chatMessage', "[Server]", { 255, 0, 0 }, text)
end

function EnableGui(enable)
    SetNuiFocus(enable, enable)
    guiEnabled = enable

    SendNUIMessage({
        type = "enableui",
        enable = enable
    })
end

RegisterNUICallback('escape', function(data, cb)
    --DisplayNotification("GUI hidden!")
    EnableGui(false)
    cb('ok')
end)

RegisterNUICallback('joinHunters', function(data, cb)
    EnableGui(false)
    TriggerServerEvent("jointeamhunters", theTeam, GetPlayerName(PlayerId()))

    local theTeam = GetPlayerJetTeam();
    TriggerEvent("chatMessage", "[Server]", {255,0,0}, "You joined "..theTeam.."!")
    SetEntityHealth(PlayerPedId(), 0)
    cb('ok')
end)

RegisterNUICallback('joinRunners', function(data, cb)
    EnableGui(false)
    TriggerServerEvent("jointeamrunners", theTeam, GetPlayerName(PlayerId()))

    local theTeam = GetPlayerJetTeam();
    TriggerEvent("chatMessage", "[Server]", {255,0,0}, "You joined "..theTeam.."!")
    SetEntityHealth(PlayerPedId(), 0)
    cb('ok')
end)

RegisterNUICallback('autoJoin', function(data, cb)
    EnableGui(false)
    TriggerServerEvent("jointeam", false, GetPlayerName(PlayerId()))

    local theTeam = GetPlayerJetTeam();
    TriggerEvent("chatMessage", "[Server]", {255,0,0}, "You joined "..theTeam.."!")
    SetEntityHealth(PlayerPedId(), 0)
    cb('ok')
end)

Citizen.CreateThread(function()
    while true do
        if guiEnabled then
            DisableControlAction(0, 1, guiEnabled) -- LookLeftRight
            DisableControlAction(0, 2, guiEnabled) -- LookUpDown
            DisableControlAction(0, 142, guiEnabled) -- MeleeAttackAlternate
            DisableControlAction(0, 106, guiEnabled) -- VehicleMouseControlOverride
        end
        Citizen.Wait(1)
    end
end)