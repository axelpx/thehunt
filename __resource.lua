resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

ui_page 'html/index.html'

files {
    "html/index.html",
    "html/style.css",
    "html/reset.css",
    "html/cursor.png",
    "html/listener.js"
}

server_scripts {
	"config.lua",
	"shared/util_shared.lua",
	"server/util-s.lua",
	"server/gameplay/teams-s.lua",
	"server/system/playerstats-s.lua",
	"@mysql-async/lib/MySQL.lua"
}

client_scripts {
	"config.lua",
	"shared/util_shared.lua",
	"client/ui/nui.lua",
	"client/ui/hud.lua",
	"client/ui/help-c.lua",
	"client/gameplay/teams-c.lua",
	"client/gameplay/weather-c.lua",
	"client/gameplay/gamelobby-c.lua",
	"client/gameplay/carspawns-c.lua",
	"client/system/playerstats-c.lua"
}