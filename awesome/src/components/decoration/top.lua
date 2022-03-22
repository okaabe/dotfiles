local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")

local helpers = require("libs.helpers")

local dpi = beautiful.xresources.apply_dpi

client.connect_signal("request::titlebars", function(c)
    local buttons = {
	awful.button({}, 1, function()
	    client.focus = c
	    c:raise()
	    awful.mouse.client.move(c)
	end),
	awful.button({}, 3, function()
	   client.focus = c
	   c:raise()
	   awful.mouse.client.resize(c)
	end)
    }

    awful.titlebar(c, {
	    position = "top",
        size = beautiful.titlebar_height or dpi(30),
	    ontop = true,
    }): setup {
        {
            buttons = buttons,
            layout = wibox.layout.fixed.horizontal,
        },
        {
            {
                helpers.text(string.lower(c.class or c.name), beautiful.titlebar_fg_focus),
                spacing = dpi(8),
		        buttons = buttons,
                layout = wibox.layout.fixed.horizontal,
            },
            left   = (beautiful.titlebar_margin or dpi(5)) + 5,
            widget = wibox.container.margin,
        },
	    {
            {
                helpers.add_click_event(helpers.text("", beautiful.titlebar_fg_focus), function()
                    c.maximized = not c.maximized
                end),
                helpers.add_click_event(helpers.text("", beautiful.titlebar_fg_focus), function()
                    c:kill()
                end),
                spacing = dpi(10),
                layout = wibox.layout.fixed.horizontal,
            },
            right = (beautiful.titlebar_margin or dpi(5)) + 5,
            widget = wibox.container.margin,
        },
        expand = "none",
        
        layout = wibox.layout.align.horizontal,
    }
end)
