local wibox = require("wibox")
local awful = require("awful")
local beautiful = require("beautiful")

local helpers = require("libs.helpers")

local dpi = beautiful.xresources.apply_dpi

-- widgets
local tasklist = require("src.components.wibar.tasklist")

local wibar = {}

function wibar.hide(s)
    s.wibar.visible = not s.wibar.visible
end


awful.screen.connect_for_each_screen(function(s)
    s.wibar = awful.wibar {
        position = beautiful.panel_position or "top",
        screen = s,
        bg = beautiful.bg_normal,
        height =  beautiful.panel_size or dpi(33), -- height = beautiful.wibar_height,
        width = s.geometry.width,
        visible = true,
        border_width = 0,
    }

    s.wibar : setup {
                {
                    layout = wibox.layout.fixed.horizontal,
                    helpers.icon(beautiful.awesome_icon, 0, 0, 10, 0, function()--on click event
                        awful.spawn(appsmenu)
                    end),
                    -- taglist(s),
                },
                {
                    {
                        tasklist(s, 5, 5),
                        width = dpi(1000),
                        widget = wibox.container.constraint,
                    },
                    left = dpi(10),
                    right = dpi(10),
                    widget = wibox.container.margin,
                },
                {
                    {
                        format = "%l:%M %P  ",
                        align = "center",
                        valign = "center",
                        widget = wibox.widget.textclock,
                    },
                    layout = wibox.layout.fixed.horizontal,
                },
                forced_height = dpi(38) - dpi(2), -- beautiful.wibar_border_width,
                widget = wibox.container.background,
                layout = wibox.layout.align.horizontal,
                --expand = "none"
    }
end)

return wibar
