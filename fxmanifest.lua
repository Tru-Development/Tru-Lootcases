fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'Tru-Development'
description 'Tru-Lootcases'
version '1.0.0'

ui_page 'html/index.html'

files {
    'html/index.html',
    'html/style.css',
    'html/app.js',
    'html/img/*.png',
    'html/img/items/*.png',
    'html/img/items/*.jpg',
    'html/img/items/*.webp'
}

shared_scripts {
    'config.lua',
    'shared/utils.lua'
}

client_scripts {
    'client/main.lua'
}

server_scripts {
    'server/main.lua'
}
