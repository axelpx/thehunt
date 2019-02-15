Citizen.CreateThread(function()
	while true do
		Citizen.Wait(5)
		
		local speed = (GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), false))*3.6)
        -- Condition to check if the ped is in a vehicle
        if(IsPedInAnyVehicle(GetPlayerPed(-1), false)) then
            DrawSpeed(math.floor(speed))
        end

		local playerTeam = GetPlayerJetTeam()
		DrawPlayerTeam(tostring(playerTeam))
		DrawHelpBar()

		RemoveMultiplayerHudCash()

	end
end)

function DrawSpeed(content) 
    SetTextFont(1)
    SetTextProportional(0)
    SetTextScale(1.0,1.0)
    SetTextDropshadow(255, 255, 255, 255, 0)
    SetTextEdge(255, 255, 255, 255, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(content .. " KPH")
    DrawText(0.9,0.8)
end

function DrawHelpBar()
	 SetTextFont(0) -- 0-4
    SetTextScale(0.25, 0.25)-- size of text
    SetTextEntry("STRING")
    AddTextComponentString("~y~Type ~r~/help ~y~in the chat for help. ~y~Type ~r~/show ~y~in to show team selection menu.") -- text string
    DrawText( 0.001, 0.001) -- x, y of the screen
end

function DrawSpeed(content) 
    SetTextFont(1)
    SetTextProportional(0)
    SetTextScale(1.0,1.0)
    SetTextDropshadow(255, 255, 255, 255, 0)
    SetTextEdge(255, 255, 255, 255, 150)
    SetTextDropShadow()
    SetTextOutline()
    SetTextEntry("STRING")
    AddTextComponentString(content .. " KPH")
    DrawText(0.9,0.8)
end

function DrawPlayerTeam(content)
	local playerTeam = GetPlayerJetTeam()
	local teamColor = ""

	if playerTeam == "Hunters" then
		teamColor = "~r~"
  elseif playerTeam == "Runners" then
    teamColor = "~b~"
  else
    teamColor = "~c~"
	end

   	SetTextFont(1)
   	SetTextProportional(0)
   	SetTextScale(0.6,0.6)
   	SetTextDropshadow(255, 255, 255, 255, 0)
   	SetTextEdge(255, 255, 255, 255, 150)
   	SetTextDropShadow()
   	SetTextOutline()
   	SetTextEntry("STRING")
   	AddTextComponentString("Your team: " .. teamColor .. content)
   	DrawText(0.875,0.036)
end

function DrawMissonText(text, duration, drawImmediately)
	BeginTextCommandPrint("STRING")
	AddTextComponentString(text)
	EndTextCommandPrint(duration, drawImmediately)
end