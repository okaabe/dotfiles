pcall(require, "luarocks.loader")

local awful = require("awful")
local beautiful = require("beautiful")
local gfs = require("gears.filesystem")

-- Initialize selected theme.
beautiful.init(gfs.get_configuration_dir() .. "src/theme.lua")

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
    awful.layout.suit.tile,
    awful.layout.suit.floating,
	awful.layout.suit.max,
}

-- Define tag names
screen.connect_signal("request::desktop_decoration", function(s)
    awful.tag({"1", "2"}, s, awful.layout.layouts[2])
end)

-- Load modules
require("src")
require("libs.autostart")
