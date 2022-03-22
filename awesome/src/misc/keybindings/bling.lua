local awful = require("awful")
require("awful.autofocus")
local bling = require("libs.bling")

-- Bling related keybindings
awful.keyboard.append_global_keybindings({
    awful.key {
        modifiers = { modkey, shiftkey },
        key = "-",
        group = "Bling",
        description = "Remove window from tabbed mode",
        on_press = function()
            bling.module.tabbed.pop()
        end,
    },
    awful.key {
        modifiers = { modkey, shiftkey },
        key = "s",
        group = "Bling",
        description = "Iterate through tabbed windows",
        on_press = function()
            bling.module.tabbed.iter()
        end,
    },
    awful.key {
        modifiers = { modkey },
        key = "a",
        group = "Client",
        description = "Pick a client with dmenu",
        on_press = function(c)
            bling.module.tabbed.pick_with_dmenu()
        end,
    },
})
