function tryIdentifiers(player)
	local identifiers = GetPlayerIdentifiers(player)
	if identifiers then
		local saveAbleIdentifier = {}
		for key,value in ipairs(identifiers) do
			local a = stringsplit(value,":")
			if a[1] == "license" then
				saveAbleIdentifier[a[1]] = a[2]
			end
		end
		if next(saveAbleIdentifier) == nil then
			print("Something went wrong while trying identifiers.")
			return false
		end
		playerIdentifierCache[player] = saveAbleIdentifier["license"]
		return saveAbleIdentifier
	end
	print("Player with ID " .. player .. " has no identifiers... WTF?")
end