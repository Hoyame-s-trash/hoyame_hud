fx_version 'adamant'
game 'gta5'

author 'hoyame - https://discord.gg/a2kX9SNf5g'
description 'hoyame_hud'
version '1.0'

ui_page 'html/ui.html'

files {
	'html/ui.html',
	'html/css/app.css',
	'html/css/grid.css',
	'html/js/main.js',
	'html/fonts/*'
}

client_scripts {
	'config.lua',
    'client.lua' 
}

server_scripts {
	'server.lua'
}