Teams = {
	{id = 0, name = "No Team", members = {}, colour = {0,0,0,1}, points = 0, active = 0  },
	{id = 1, name = "Hunters", members = {}, colour = {255,0,0,1}, points = 0, active = 0  },
	{id = 2, name = "Runners", members = {}, colour = {0,0,255,2}, points = 0, active = 0  }
}

RegisterServerEvent("jointeam")
RegisterServerEvent("jointeamunassigned")
RegisterServerEvent("jointeamhunters")
RegisterServerEvent("jointeamrunners")
RegisterServerEvent("leaveteam")

Citizen.CreateThread(function()

	AddEventHandler("jointeam", function(teamName,PlayerName)
		local theSource = source
		local teamName = false
		if teamName then  -- did the client supply a team name?
			-- we dont actually care, auto-assignment for now
			--[[
			for i,theTeam in ipairs(Teams) do
				for theRow,theMember in ipairs(theTeam.members) do
					if theMember.name == PlayerName then
						TriggerClientEvent("LeftTeam", theMember.id, Teams[i].name)
						table.remove(Teams[i].members, theRow)
						for ti,TM in ipairs(Teams[i].members) do
							TriggerClientEvent("TeamMemberLeft", TM.id, theMember.id, theMember.name) 
						end
						TriggerClientEvent("UpdateBlips", -1 )
					end
				end
			end
			]]
		else
			local lowestIndex = 0;
			local lowestValue = false;
			for k, v in ipairs(Teams) do
			    if not lowestValue or #v.members < lowestValue or v.id ~= 0 then
			        lowestIndex = k;
			        lowestValue = #v.members;
			    end
			end
			
			teamName = Teams[lowestIndex].name
		end	
		
		for i,theTeam in pairs(Teams) do
			if theTeam.name == teamName then
				table.insert(Teams[i].members, {id = theSource,name = PlayerName})
				TriggerClientEvent("JoinedTeam", theSource, {id = Teams[i].id,name = Teams[i].name, members = Teams[i].members, colour = Teams[i].colour})
				for i,theMember in ipairs(Teams[i].members) do 
					TriggerClientEvent("TeamMemberJoined", theMember.id, PlayerName, theSource)
				end
				TriggerClientEvent("UpdateBlips", -1 )
			end
		end
	end)

	AddEventHandler("leaveteam", function(PlayerName)
		local theSource = source
		for i,theTeam in ipairs(Teams) do
			for theRow,theMember in ipairs(theTeam.members) do
				if theMember.name == PlayerName then
					TriggerClientEvent("LeftTeam", theMember.id, Teams[i].name)
					table.remove(Teams[i].members, theRow)
					for ti,TM in ipairs(Teams[i].members) do
						TriggerClientEvent("TeamMemberLeft", TM.id, theMember.id, theMember.name) 
					end
				end
			end
		end
	end)


	AddEventHandler('playerDropped', function(reason)
		local PlayerName = GetPlayerName(source)
		for i,theTeam in ipairs(Teams) do
			for theRow,theMember in ipairs(theTeam.members) do
				if theMember.name == PlayerName then
					table.remove(Teams[i].members, theRow)
					for ti,TM in ipairs(Teams[i].members) do
						TriggerClientEvent("TeamMemberLeft", TM.id, theMember.id, theMember.name) 
					end
				end
			end
		end
	end)

AddEventHandler("jointeamunassigned", function(teamName,PlayerName)
		local theSource = source
		local teamName = teamName
		if teamName ~= "No Team" then
			for i,theTeam in ipairs(Teams) do
				for theRow,theMember in ipairs(theTeam.members) do
					if theMember.name == PlayerName then
						TriggerClientEvent("LeftTeam", theMember.id, Teams[i].name)
						table.remove(Teams[i].members, theRow)
						for ti,TM in ipairs(Teams[i].members) do
							TriggerClientEvent("TeamMemberLeft", TM.id, theMember.id, theMember.name) 
						end
						TriggerClientEvent("UpdateBlips", -1 )
					end
				end
			end

			teamName = "No Team"
			
			for i,theTeam in pairs(Teams) do
				if theTeam.name == teamName then
					table.insert(Teams[i].members, {id = theSource,name = PlayerName})
					TriggerClientEvent("JoinedTeam", theSource, {id = Teams[i].id,name = Teams[i].name, members = Teams[i].members, colour = Teams[i].colour})
					for i,theMember in ipairs(Teams[i].members) do 
						TriggerClientEvent("TeamMemberJoined", theMember.id, PlayerName, theSource)
					end
					TriggerClientEvent("UpdateBlips", -1 )
				end
			end

		else

		end
	end)

	AddEventHandler("jointeamhunters", function(teamName,PlayerName)
		local theSource = source
		local teamName = teamName
		if teamName ~= "Hunters" then
			for i,theTeam in ipairs(Teams) do
				for theRow,theMember in ipairs(theTeam.members) do
					if theMember.name == PlayerName then
						TriggerClientEvent("LeftTeam", theMember.id, Teams[i].name)
						table.remove(Teams[i].members, theRow)
						for ti,TM in ipairs(Teams[i].members) do
							TriggerClientEvent("TeamMemberLeft", TM.id, theMember.id, theMember.name) 
						end
						TriggerClientEvent("UpdateBlips", -1 )
					end
				end
			end

			teamName = "Hunters"
			
			for i,theTeam in pairs(Teams) do
				if theTeam.name == teamName then
					table.insert(Teams[i].members, {id = theSource,name = PlayerName})
					TriggerClientEvent("JoinedTeam", theSource, {id = Teams[i].id,name = Teams[i].name, members = Teams[i].members, colour = Teams[i].colour})
					for i,theMember in ipairs(Teams[i].members) do 
						TriggerClientEvent("TeamMemberJoined", theMember.id, PlayerName, theSource)
					end
					TriggerClientEvent("UpdateBlips", -1 )
				end
			end
		else

		end
	end)

	AddEventHandler("jointeamrunners", function(teamName,PlayerName)
		local theSource = source
		local teamName = teamName
		if teamName ~= "Runners" then
			for i,theTeam in ipairs(Teams) do
				for theRow,theMember in ipairs(theTeam.members) do
					if theMember.name == PlayerName then
						TriggerClientEvent("LeftTeam", theMember.id, Teams[i].name)
						table.remove(Teams[i].members, theRow)
						for ti,TM in ipairs(Teams[i].members) do
							TriggerClientEvent("TeamMemberLeft", TM.id, theMember.id, theMember.name) 
						end
						TriggerClientEvent("UpdateBlips", -1 )
					end
				end
			end

			teamName = "Runners"
			
			for i,theTeam in pairs(Teams) do
				if theTeam.name == teamName then
					table.insert(Teams[i].members, {id = theSource,name = PlayerName})
					TriggerClientEvent("JoinedTeam", theSource, {id = Teams[i].id,name = Teams[i].name, members = Teams[i].members, colour = Teams[i].colour})
					for i,theMember in ipairs(Teams[i].members) do 
						TriggerClientEvent("TeamMemberJoined", theMember.id, PlayerName, theSource)
					end
					TriggerClientEvent("UpdateBlips", -1 )
				end
			end
		else

		end
	end)
end)