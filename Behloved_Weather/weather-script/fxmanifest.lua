fx_version 'cerulean'
game 'gta5'

author 'Behloved'
description 'Custom Weather Script using ox_lib'
version '1.0.0'

lua54 'yes' -- Enable Lua 5.4

shared_script 'shared/config.lua'

client_scripts {
    '@ox_lib/init.lua',
    'client/*.lua'
}

server_scripts {
    '@ox_lib/init.lua',
    'server/*.lua'
}

dependencies {
    'ox_lib'
}