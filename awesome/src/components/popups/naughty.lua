local naughty = require("naughty")
local awful = require("awful")
local ruled = require("ruled")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

ruled.notification.connect_signal('request::rules', function()
    -- All notifications will match this rule.
    ruled.notification.append_rule {
        rule = { },
        properties = {
            screen = awful.screen.preferred,
            implicit_timeout = 5,
        }
    }
end)

-- AwesomeWM error
naughty.connect_signal("request::display_error", function(message, startup)
    naughty.notification {
        urgency = "critical",
        title = "An error happened"..(startup and " during startup!" or "!"),
        message = message
    }
end)

naughty.config.padding = dpi(30)

naughty.config.defaults.timeout = 10
naughty.config.defaults.text = ""
naughty.config.defaults.title = "System Notification"
naughty.config.defaults.ontop = true
naughty.config.defaults.margin = 25
naughty.config.defaults.border_width = beautiful.notification_border_width or beautiful.border_width
naughty.config.defaults.position = "bottom_right"

naughty.notify({ title = "Config reloaded", message = "No errors found!", timeout = 5 })
