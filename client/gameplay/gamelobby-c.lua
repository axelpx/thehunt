local startMarker = {x = -776.309, y = 320.5, z = 222.0}

function SelectTeamNotice()
	SetTextFont(4) -- 0-4
    SetTextScale(1.0,1.0)-- size of text
    SetTextEntry("STRING")
    AddTextComponentString("~y~Select your team first! Type ~r~/show~y~ in chat!") -- text string
    DrawText( 0.3, 0.4) -- x, y of the screen
end

Citizen.CreateThread(function()
	Citizen.Wait(1)
	while true do
		Wait(0)
		DrawMarker(1, startMarker.x, startMarker.y, startMarker.z, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 3.0, 3.0, 3.0, 255, 0, 0, 75, true, true, 2, false, false, false, false)

		local playerCoords = GetEntityCoords(GetPlayerPed(-1));
        local distance     = Vdist(playerCoords.x, playerCoords.y, playerCoords.z, startMarker.x, startMarker.y, startMarker.z);
        local theTeam = GetPlayerJetTeam();

		if theTeam == "Runners" and ( distance <= 2.0 ) then
            SetEntityCoords(GetPlayerPed(-1), 1121.5, -3145.1, 5.9)
        elseif theTeam == "Hunters" and ( distance <= 2.0 ) then
            SetEntityCoords(GetPlayerPed(-1), 1121.5, -3129.55, 5.9)
        elseif theTeam == "No Team" and ( distance <= 2.0 ) then
        	SelectTeamNotice()
        end
	end
end)	

            