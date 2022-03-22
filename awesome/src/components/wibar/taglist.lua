local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local dpi = require("beautiful.xresources").apply_dpi

local function taglist(s, padding)
    return awful.widget.taglist {
        screen  = s,
        filter  = awful.widget.taglist.filter.all,
        style   = {
            shape = gears.shape.rectangle,
        },
        layout   = {
            spacing = 8,
            layout  = wibox.layout.fixed.horizontal
        },
        widget_template = {
                {
                         {
                             id = 'text_role',
                             align = 'center',
                             valign = 'center',
                             widget = wibox.widget.textbox,
                         },
                         layout = wibox.layout.fixed.horizontal,
                },
                left = dpi(5),
                right = dpi(5),
                widget = wibox.container.margin
        },
        buttons = {
		awful.button({}, 1, function(t) t:view_only() end)
	}
    }
end

return taglist
