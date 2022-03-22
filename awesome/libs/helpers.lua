-- helpers.lua
-- Functions that you use more than once and in different files would
-- be nice to define here.
local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")

local beautiful = require("beautiful")

local dpi = beautiful.xresources.apply_dpi

local helpers = {}

function helpers.handle_dpi(value, default)
    return dpi(value or default)
end

function helpers.get_titlebar_colors_by_state(c)
    if client.focus == c then
        return {
            background = (
                beautiful.titlebar_bg_focus or
                beautiful.bg_focus or
                "#FFFFFF"
            ),
            foreground = (
                beautiful.titlebar_fg_focus or
                beautiful.fg_focus or
                "#000000"
            ),
            border = beautiful.titlebar_border_focus or beautiful.border_focus
        }
    else
        return {
            background = (
                beautiful.titlebar_bg_normal or
                beautiful.bg_normal or
                "#FFFFFF"
            ),
            foreground = (
                beautiful.titlebar_fg_normal or
                beautiful.fg_normal or
                "#000000"
            ),
            border = beautiful.titlebar_border_normal or beautiful.border_normal
        }
    end
end

function helpers.box(wid, margin, padding, background, radius)
    return wibox.widget {
        {
            {
                wid,
                top = helpers.handle_dpi(padding, 5),
                bottom = helpers.handle_dpi(padding, 5),
                left = helpers.handle_dpi(padding, 5) + 5,
                right = helpers.handle_dpi(padding, 5) + 5,
                widget = wibox.container.margin,
            },
            bg = background or beautiful.widget_bg or beautiful.bg_focus or "#000000",
            shape = helpers.rrect(dpi(radius or beautiful.widget_radius or 0)),
            widget = wibox.container.background,
        },
        margins = dpi(margin or 5),
        widget = wibox.container.margin,
    }
end

function helpers.add_click_event(wid, callback)
    if (callback) then
        wid:buttons({
            awful.button({}, 1, function()
                callback()
	    end)
	})
    end

    return wid
end

-- wibox.widget.imagebox wrapper
helpers.icon = function (img, top, bottom, left, right, callback)
    return helpers.add_click_event(wibox.widget {
        {
            widget = wibox.widget.imagebox,
            image = img,
            resize = true,
        },
        top = top,
        bottom = bottom,
        left = left,
        right = right,
        widget = wibox.container.margin,
    }, callback)
end

-- Create rounded rectangle shape (in one line)
helpers.rrect = function(radius)
    return function(cr, width, height)
        gears.shape.rounded_rect(cr, width, height, radius or 0)
    end
end

helpers.rect = function(width, height)
    return function(cr)
        gears.shape.circle(cr, width, height)
    end
end

-- Create pi
helpers.pie = function(width, height, start_angle, end_angle, radius)
    return function(cr)
        gears.shape.pie(cr, width, height, start_angle, end_angle, radius)
    end
end

-- Create parallelogram
helpers.prgram = function(height, base)
    return function(cr, width)
        gears.shape.parallelogram(cr, width, height, base)
    end
end

-- Create partially rounded rect
helpers.prrect = function(radius, tl, tr, br, bl)
    return function(cr, width, height)
        gears.shape.partially_rounded_rect(cr, width, height, tl, tr, br, bl,
                                           radius)
    end
end

-- Markup helper
helpers.colorize_text = function (txt, fg)
    return "<span foreground='" .. fg .. "'>" .. txt .. "</span>"
end

helpers.vertical_pad = function (height)
    return wibox.widget {
        forced_height = height,
        layout = wibox.layout.fixed.vertical
    }
end

helpers.horizontal_pad = function (width)
    return wibox.widget {
        forced_width = width,
        layout = wibox.layout.fixed.horizontal
    }
end

helpers.add_hover_cursor = function (w, hover_cursor)
    local original_cursor = "left_ptr"

    w:connect_signal("mouse::enter", function()
        local w = _G.mouse.current_wibox
        if w then w.cursor = hover_cursor end
    end)

    w:connect_signal("mouse::leave", function()
        local w = _G.mouse.current_wibox
        if w then w.cursor = original_cursor end
    end)

    return w
end

helpers.text = function(text, foreground, align)
    return wibox.widget {
        markup = helpers.colorize_text(text, (foreground or beautiful.fg_normal)),
        align = align or "center",
        valign = align or "center",
        widget = wibox.widget.textbox,
    }
end

helpers.apply = function(wid, callback)
    callback(wid)

    return wid
end

return helpers
