local ruled = require("ruled")

-- Rules to apply to new clients.
ruled.client.connect_signal("request::rules", function()
    -- Floating clients.
    ruled.client.append_rule {
        id = "floating",
        rule_any = {
            instance = { "copyq", "pinentry" },
            class = {
                "Arandr",
                "Blueman-manager",
                "Gpick",
                "Kruler",
                "Sxiv",
                "Tor Browser",
                "Wpa_gui",
                "veromix",
                "xtightvncviewer",
		"Lxappearance",
		"Nitrogen"
            },
            name = {
                "Event Tester",  -- xev.
            },
            role = {
                "AlarmWindow",    -- Thunderbird's calendar.
                "ConfigManager",  -- Thunderbird's about:config.
                "pop-up",         -- e.g. Google Chrome's (detached) Developer Tools.
            }
        },
        properties = {
            floating = true
        }
    }

    -- Add titlebars to normal clients
    ruled.client.append_rule {
        id = "titlebars",
        rule_any = {
            type = {
                "normal"
            },
        },
        properties = {
            titlebars_enabled = true
        }
    }

end)
