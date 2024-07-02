fx_version 'cerulean'
game 'gta5'

name 'displayInfo'
author 'syukuri'
description 'Display of reality date and time and player ID.'
version 'v1.0.1'

server_script {
    'server/server.lua',
    'config.lua',
}

client_scripts {
    'client/client.lua',
    'config.lua',
}

ui_page "html/index.html"

files {
    "html/index.html",
    "html/css/style.css",
    "html/js/script.js",
}
