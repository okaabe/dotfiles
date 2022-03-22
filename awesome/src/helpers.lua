local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local helpers = {}

helpers.maximize = function(c)
	c.width = awful.screen.focused().geometry.width - beautiful.dock_size
	c.height = awful.screen.focused().geometry.height - 30

	c.x = beautiful.dock_size
	c.y = 30
end

helpers.colorize = function(text, color)
	return '<span foreground="' .. color .. '">' .. text .. "</span>"
end

helpers.text = function(text, foreground)
	return wibox.widget {
		markup = helpers.colorize(text, foreground or beautiful.fg_normal),
		align = "center",
		valign = "center",
		widget = wibox.widget.textbox,
	}
end

helpers.image = function(img, size, callback)
	local widget = wibox.widget {
		{
			image = img,
			resize = true,
			widget = wibox.widget.imagebox,
		},
		margins = size or 0,
		widget = wibox.container.margin,
	}

	if callback then
		widget:buttons {
			awful.button({}, 1, function()
				callback()
			end)
		}
	end

	return widget
end

helpers.rrect = function(radius)
	return function(cr, width, height)
			gears.shape.rounded_rect(cr, width, height, radius or 0)
	end
end

helpers.box = function(wid, bg, margin)
	return wibox.widget {
		{
			wid,
			bg = bg .. "80",
			widget = wibox.container.background,
			shape = helpers.rrect(dpi(5))
		},
		margins = margin or 4,
		widget = wibox.container.margin,
	}
end

return helpers
