local dpi          = require("beautiful.xresources").apply_dpi
local gears          = require("gears")
 
local theme   = {}

-- Global font
theme.font              =  "PragmataProMonoLiga Nerd Font 12" -- "PragmataProMonoLiga Nerd Font 12"-- "Iosevka 11"
theme.font_notifs       = "PragmataProMonoLiga Nerd Font Bold 13"
theme.font_mouse_menu   = "PragmataProMonoLiga Nerd Font 12"
theme.font_hotkeys      = "PragmataProMonoLiga Nerd Font Bold 13"

-- Wibox Background
theme.bg_normal     = "#ECEDEA"
theme.bg_focus      = "#CACBC8"
theme.bg_urgent     = "#79695a"
theme.bg_minimize   = "#201e1a"

theme.bg_systray = "#CACBC8"

-- Wibox Foreground
theme.fg_normal     = "#444444"
theme.fg_focus      = "#444444"
theme.fg_urgent     = "#C6C4B9"
theme.fg_minimize   = "#85919C"

-- Windows
theme.border_width      = dpi(0)
theme.border_focus      = "#000000" -- theme.xcolor12 -- "#1F211D"
theme.border_normal     = "#000000" -- "#1F211D"
theme.useless_gap       = dpi(0)
theme.gap_single_client = true

-- mouse menu
theme.menu_height       = dpi(35)
theme.menu_width        = dpi(120)
theme.menu_font         = theme.font_mouse_menu
theme.menu_border_width = dpi(0)
theme.menu_bg_normal    = "#ECEDEA"
theme.menu_bg_focus     = "#CACBC8"
theme.menu_border_color = "#CACBC8"

-- Naughty settings
theme.notification_font         = theme.font_notifs
theme.notification_bg           = "#ECEDEA"
theme.notification_fg           = theme.fg_normal
theme.notification_icon_size    = dpi(52)
-- theme.notification_shape = helpers.rrect(3)
theme.notification_border_color = theme.border_normal

-- Bling tabbar settings
theme.tabbed_spawn_in_tab = true
theme.tabbar_size         = dpi(33)
theme.tabbar_ontop        = true
theme.tabbar_text_align   = "left"
theme.tabbar_position     = "top"
theme.tabbar_bg_normal = "#808c96"
theme.tabbar_fg_normal = "#ECEDEA"
theme.tabbar_bg_focus  = "#85919C"
theme.tabbar_fg_focus  = "#FFFFFF"
theme.tabbar_bg_focus_inactive = "#ECEDEA55"

theme.tabbar_border_inactive = "#FFFFFF"
theme.tabbar_border_normal = theme.border_normal
theme.tabbar_border_focus  = theme.tabbar_bg_focus -- theme.xcolor12


-- TITLEBAR
theme.titlebar_bg_focus  = "#85919C"
theme.titlebar_bg_normal = "#808c96"
theme.titlebar_fg_focus  = "#FFFFFF"
theme.titlebar_fg_normal = "#ECEDEA"
theme.titlebar_height    = dpi(33)
theme.titlebar_margin = dpi(10)
theme.titlebar_spacing = dpi(3)

-- Panel
theme.panel_size = dpi(30)
theme.panel_position = "top"

-- Taglist
theme.taglist_fg_focus = "#8C0023"
theme.taglist_fg_empty = "#C6C4B9"
theme.taglist_fg_occupied = "#444444"
theme.taglist_font = "PragmataProMonoLiga Nerd Font Bold 14"

-- Tasklist
theme.tasklist_bg_normal = "#ECEDEA"
theme.tasklist_bg_focus = "#CACBC8"
theme.tasklist_fg_normal = "#444444"
theme.tasklist_fg_focus = "#444444"
theme.tasklist_bg_minimize = "#ECEDEA"
theme.tasklist_fg_minimize = "#C6C4B9"

local assets = gears.filesystem.get_configuration_dir() .. "/assets"

theme.awesome_icon = assets .. "/raspberry.png"

return theme

