local awful = require('awful')
local gears = require('gears')
local naughty = require('naughty')
local beautiful = require('beautiful')

local apps = require('main.apps')

mod = 'Mod4'

-- General Bindings
awful.keyboard.append_global_keybindings({
    awful.key({mod, 'Control'}, 'r', awesome.restart),
    awful.key({mod, 'Shift'}, 'q', function()
        awful.spawn.with_shell(apps.powermenu)
    end),
    awful.key({mod}, 'Return', function()
        awful.spawn(apps.launcher)
    end)
})

-- Tag Bindings
awful.keyboard.append_global_keybindings({
    awful.key({mod}, 'Left', awful.tag.viewprev),
    awful.key({mod}, 'Right', awful.tag.viewnext),
    awful.key({mod}, 'Escape', awful.tag.history.restor)
})

awful.keyboard.append_global_keybindings({
    awful.key {
        modifiers = {mod},
        keygroup = 'numrow',
        group = 'tag',
        on_press = function(index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                tag:view_only()
            end
        end
    },
    awful.key {
        modifiers = {mod, 'Shift'},
        keygroup = 'numrow',
        group = 'tag',
        on_press = function(index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end
    } 
})

