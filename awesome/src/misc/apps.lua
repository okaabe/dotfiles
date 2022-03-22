local gfs = require("gears.filesystem")

require("awful.hotkeys_popup.keys")

-- apps menu
appsmenu = "rofi -show drun -theme ~/.config/rofi/launchers/misc/launchpad.rasi"

-- tools menu
shoot = "flameshot gui"
terminal = "alacritty"
zoom = gfs.get_configuration_dir() .. "libs/zoom"
browser = "chromium"
filemanager = "thunar"

-- system menu
appearance = "lxappearance"
