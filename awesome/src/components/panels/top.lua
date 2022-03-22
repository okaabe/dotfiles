local awful = require("awful")
local wibox = require("wibox")

local helpers = require("src.helpers")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local clientclass = function()
  local text = helpers.text("Tosuki", beautiful.fg_normal)

  client.connect_signal("focus", function(c)
    text.markup = helpers.colorize(c.class, beautiful.fg_normal)
  end)

  client.connect_signal("unfocus", function(c)
    text.markup = helpers.colorize("Tosuki", beautiful.fg_normal)
  end)

  return text
end

local top = function(s)
  local topPanel = awful.wibar({
    screen = s,
    position = "top",
    width = s.geometry.width,
    height = dpi(30)
  })


  topPanel : setup {
    {
      -- helpers.text("Tosuki"),
      clientclass(),
      left = dpi(10),
      widget = wibox.container.margin,
    },
    nil,
    {
      {
        {
          format = "%a %b %d, %H:%M ",
          align = "center",
          valign = "center",
          widget = wibox.widget.textclock,
        },
        layout = wibox.layout.fixed.horizontal,
      },
      right = dpi(5),
      widget = wibox.container.margin,
    },
    expand = "none",
    layout = wibox.layout.align.horizontal,
  }

  return topPanel
end

return top
