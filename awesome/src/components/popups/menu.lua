local awful = require("awful")
local menubar = require("menubar")
local beautiful = require("beautiful")
local hotkeys_popup = require("awful.hotkeys_popup")
local gfs = require("gears.filesystem")

require("awful.hotkeys_popup.keys")

-- apps menu
telegram = "telegram-desktop"
browser = "qutebrowser"
appsmenu = "rofi -show drun"
-- appsmenu = "rofi -no-lazy-grab -show drun -modi drun -theme ~/.config/rofi/launchers/misc/column"

-- tools menu
shoot = "flameshot gui"
editor = "vim"
terminal = "alacritty"
editor_cmd = terminal .. " -e " .. editor
zoom = gfs.get_configuration_dir() .. "libs/zoom"
browser = "firefox"

-- system menu
reboot = "reboot"
shutdown = "poweroff"

mymainmenu = awful.menu({
    items = {
        { "Web", browser },
        { "Term", terminal },
        { "Config", function() hotkeys_popup.show_help(nil, awful.screen.focused()) end },
        { "Exit", function() awesome.quit() end }
    }
})


mylauncher = awful.widget.launcher({
    menu = mymainmenu
})

-- Menubar configuration
menubar.utils.terminal = terminal
