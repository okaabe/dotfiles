local awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local gears = require("gears")
local helpers = require("libs.helpers")

local dpi = beautiful.xresources.apply_dpi

local function tasklist(s, margin, padding)
    return awful.widget.tasklist {
        screen = s,
        filter = awful.widget.tasklist.filter.currenttags,
        style = {
            shape = helpers.rrect(beautiful.widget_radius),
        },
        layout = {
            spacing = 0,
            spacing_widget = {
                shape  = gears.shape.rectangle,
                widget = wibox.widget.separator,
            },
            layout  = wibox.layout.fixed.horizontal
        },
        -- widget_template = {
        --     {
        --         {
        --             {
        --                 {
        --                     id = "text_role",
        --                     widget = wibox.widget.textbox,
        --                 },
        --                 width = dpi(400),
        --                 widget = wibox.container.constraint,
        --             },
        --             top = padding,
        --             bottom = padding,
        --             left = padding + 3,
        --             right = padding + 3,
        --             widget = wibox.container.margin
        --         },
        --         id = "background_role",
        --         widget = wibox.container.background,
        --     },
        --     visible = true,
        --     layout = wibox.layout.fixed.horizontal
        -- },
        widget_template = {
            {
                {
                    {
                        id = "icon_role",
                        widget = wibox.widget.imagebox,
                    },
                    margins = dpi(8),
                    widget = wibox.container.margin,
                },
                {
                    {
                        {
                            id = "text_role",
                            widget = wibox.widget.textbox,
                        },
                        width = dpi(300),
                        widget = wibox.container.constraint,
                    },
                    top = padding,
                    bottom = padding,
                    left = padding + 3,
                    right = padding + 3,
                    widget = wibox.container.margin,
                },
                nil,
                visible = true,
                layout = wibox.layout.fixed.horizontal,
            },
            id = "background_role",
            widget = wibox.container.background,
        },
        buttons = {
            awful.button({}, 1, function (c)
                if c == client.focus then
                    c.minimized = true
                else
                    c:emit_signal(
                        "request::activate",
                        "tasklist",
                        {raise = true}
                    )
                end
            end),

            awful.button({}, 3, function()
                awful.menu.client_list({ theme = { width = 250 } })
            end)
        },
     }
end

return tasklist
