RegisterCommand("help", function()
	msg("^1Avaliable command are:")
	msg("/car, /clear, /kill")
	msg("^7Press ^1'H' ^7to get weapons")
end, false)

function msg(text)
	TriggerEvent("chatMessage", "[Server]", {255,0,0}, text)
end