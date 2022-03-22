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
		        "feh",
				--"Minecraft",
				--"net-technicpack-launcher-LauncherMain",
        	--[[	"thunar",]]
		        "Lxappearance",
                "lxappearance",
	     	    --"MPlayer",
            },
            -- Note that the name property shown in xprop might be set slightly after creation of the client
            -- and the name shown there might not match defined rules here.
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
            floating = true,
        }
    }

	ruled.client.append_rule {
		id = "ontop",
		rule_any = {
			"feh",
		},
		properties = {
			ontop = true,
		}
	}

    -- Add titlebars to normal clients
    ruled.client.append_rule {
        id = "titlebars",
        rule_any = {
            type = {
                "normal",
				"dialog",
				"utility"
            },
        },
        -- except_any = {
        --     class = {
        --         "qutebrowser",
        --         -- "obsidian",
		--         "Org.gnome.Nautilus",
		--         "Gnome-control-center",
        --         "google-chrome"
        --     },
        -- },
        properties = {
            titlebars_enabled = true
        }
    }

end)
