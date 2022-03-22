pcall(require, "luarocks.loader")

local awful = require("awful")
local beautiful = require("beautiful")
local gfs = require("gears.filesystem")

-- Initialize selected theme.
beautiful.init(gfs.get_configuration_dir() .. "src/colors.lua")

-- garbage collector
collectgarbage("step", 1024)
collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)

-- modifiers
modkey = "Mod4"
winkey = "Mod1"
shiftkey = "Shift"
controlkey = "Control"


-- Load external modules
awful.layout.layouts = {
    awful.layout.suit.floating,
    awful.layout.suit.tile,
    -- awful.layout.suit.max,
}

-- Define tag names
screen.connect_signal("request::desktop_decoration", function(s)
    awful.tag({"  ", "", "", "", ""}, s, awful.layout.layouts[1])
end)

-- Focus on click
client.connect_signal("focus",
    function(c)
        c.border_color = beautiful.border_focus
end)

client.connect_signal("unfocus",
    function(c)
        c.border_color = beautiful.border_normal
end)

--[[ Rounded cornes, im not using it at the moment but its cool...
client.connect_signal("manage", function(c)
    c.shape = helpers.rrect(3)
end)]]

-- Load modules
require("src")
require("libs.autostart")
