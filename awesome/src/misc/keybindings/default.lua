local awful = require("awful")
local helpers = require("src.helpers")

client.connect_signal("request::default_mousebindings", function()
    awful.mouse.append_client_mousebindings({
        awful.button({ }, 1, function (c)
            c:activate { context = "mouse_click" }
        end),
        awful.button({ modkey }, 1, function (c)
            c:activate { context = "mouse_click", action = "mouse_move"  }
        end),
        awful.button({ modkey }, 3, function (c)
            c:activate { context = "mouse_click", action = "mouse_resize"}
        end),
    })
end)


client.connect_signal("request::default_keybindings", function()
    awful.keyboard.append_client_keybindings({
		awful.key {
			modifiers = { modkey },
			key = "m",
			group = "Client",
			description = "maximize",
			on_press = function(c)
                helpers.maximize(c)
			end
		},
		awful.key {
			modifiers = { modkey },
			key = "n",
			group = "Client",
			description = "minimize",
			on_press = function(c)
				c.minimized = not c.minimized
				c:raise()
			end
		},
        awful.key {
            modifiers = { modkey },
            key = "f",
            group = "Client",
            description = "toggle fullscreen",
            on_press = function(c)
                c.fullscreen = not c.fullscreen
                c:raise()
            end
        },

        awful.key {
            modifiers = { modkey, shiftkey },
            key = "w",
            group = "Client",
            description = "close",
            on_press = function(c)
                c:kill()
            end
        },

        awful.key {
            modifiers = { modkey, controlkey },
            key = "f",
            group = "Client",
            description = "toggle floating",
            on_press = awful.client.floating.toggle,
        },

        awful.key {
            modifiers = { modkey },
            key = "x",
            group = "Client",
            description = "toggle keep on top",
            on_press = function(c)
                c.ontop = not c.ontop
            end,
        },
    })
end)
