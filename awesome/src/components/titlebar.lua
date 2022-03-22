local awful = require("awful")
local wibox = require("wibox")

local beautiful = require("beautiful")
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
    position = beautiful.titlebar_position or "top",
    size = beautiful.titlebar_size or dpi(30)
  }): setup {
    {
      {
        awful.titlebar.widget.closebutton(c),
        awful.titlebar.widget.minimizebutton(c),
        awful.titlebar.widget.maximizedbutton(c),
        layout = wibox.layout.fixed.horizontal,
      },
      left = dpi(8),
      top = dpi(6),
      bottom = dpi(6),
      right = dpi(8),
      widget = wibox.container.margin,
    },
    {
      awful.titlebar.widget.titlewidget(c),
      widget = wibox.layout.fixed.horizontal,
      buttons = buttons
    },
    nil,
    layout = wibox.layout.align.horizontal,
  }
end)

client.connect_signal("property::floating", function(c)
  if c.floating then
      awful.titlebar.show(c)
  else
      awful.titlebar.hide(c)
  end
end)

client.connect_signal("manage", function(c)
  if c.floating or c.first_tag.layout.name == "floating" then
      awful.titlebar.show(c)
  else
      awful.titlebar.hide(c)
  end
end)

tag.connect_signal("property::layout", function(t)
  local clients = t:clients()
  for k,c in pairs(clients) do
      if c.floating or c.first_tag.layout.name == "floating" then
          awful.titlebar.show(c)
      else
          awful.titlebar.hide(c)
      end
  end
end)