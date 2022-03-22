local awful = require("awful")
local wibox = require("wibox")
local gears = require("gears")

local helpers = require("src.helpers")
local beautiful = require("beautiful")

local dpi = beautiful.xresources.apply_dpi

-- The tasklist of the dock, in other words that's the widget that contains the clients opened.
local tasklist = function(s)
  return awful.widget.tasklist {
    screen = s,
    filter = awful.widget.tasklist.filter.currenttags,
    style = {
      shape = helpers.rrect(5),
    },
    layout = {
      spacing = 0,
      spacing_widget = {
        shape = gears.shape.rectangle,
        widget = wibox.widget.separator,
      },
      layout = wibox.layout.fixed.vertical,
    },
    widget_template = {
      {
        {
          {
            id = "icon_role",
            widget = wibox.widget.imagebox,
          },
          margins = dpi(7),
          widget = wibox.container.margin,
        },
        id = "background_role",
        widget = wibox.container.background,
      },
      margins = dpi(4),
      widget = wibox.container.margin,
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

-- Wrapper to create the dock icons
local dock_icon = function(image, app, bg, margin)
  return helpers.box(helpers.image(
    image,
    nil,
    function()
      awful.spawn(app)
    end
  ), bg or (beautiful.dock_icon_bg .. "00"), (margin or 8))
end

local left = function(s)
  local dock = awful.wibar({
    screen = s,
    position = "left",
    width = beautiful.dock_size or dpi(55),
    bg = beautiful.dock_bg .. "AA"
  })

  dock : setup {
    {
      dock_icon(beautiful.logo, appsmenu, "#BD5945", 4),
      dock_icon(beautiful.terminal_icon, terminal),
      dock_icon(beautiful.filemanager_icon, filemanager),
      spacing = dpi(3),
      layout = wibox.layout.align.vertical,
    },
    tasklist(s),
    layout = wibox.layout.align.vertical,
  }

  return dock
end

return left
