local awful = require("awful")

local top = require("src.components.panels.top")
local left = require("src.components.panels.left")

awful.screen.connect_for_each_screen(function(s)
  s.top_panel = top(s)
  s.left_panel = left(s)
end)
