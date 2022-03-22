local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")

awful.keyboard.append_global_keybindings({
    awful.key {
        modifiers = { modkey },
        key = "s",
        group = "awesome",
        description = "Show help",
        on_press = hotkeys_popup.show_help,
    },
    awful.key {
        modifiers = { modkey, controlkey },
        key = "r",
        group = "awesome",
        description = "Restart awesome",
        on_press = awesome.restart,
    },
    awful.key {
        modifiers = { modkey, controlkey },
        key = "e",
        group = "awesome",
        description = "Quit awesome",
        on_press = awesome.quit,
    },
    awful.key {
        modifiers = { modkey },
        key = "Return",
        group = "Launcher",
        description = "Open terminal",
        on_press = function()
            awful.spawn(terminal)
        end,
    },
    awful.key {
        modifiers = { modkey, shiftkey },
        key = "b",
        group = "Launcher",
        description = "Open browser",
        on_press = function()
            awful.spawn(browser)
        end,
    },
    awful.key {
        modifiers = { },
        key = "Print",
        group = "Launcher",
        description = "Open flameshot gui",
        on_press = function()
            awful.spawn(shoot)
        end,
    },
    awful.key {
        modifiers = { shiftkey },
        key = "Print",
        group = "Launcher",
        description = "Take a screenshot including the pointer",
        on_press = function()
            awful.spawn("scrot -e 'mv $f ~/Pictures/Screenshots/'")
        end
    },
    awful.key {
        modifiers = { modkey },
        key = "b",
        group = "Launcher",
        description = "Boomer",
        on_press = function()
            awful.spawn(zoom)
        end,
    },
    awful.key {
        modifiers = { modkey },
        key = "d",
        group = "Launcher",
        description = "Run menubar",
        on_press = function()
           awful.spawn(appsmenu)
        end,
    },
})

-- Focus related keybindings
awful.keyboard.append_global_keybindings({
    awful.key {
        modifiers = { modkey },
        key = "j",
        group = "Client",
        description = "Focus next by index",
        on_press = function ()
            awful.client.focus.byidx( 1)
        end,
    },
    awful.key {
        modifiers = { modkey },
        key = "k",
        group = "Client",
        description = "Focus previous by index",
        on_press = function ()
            awful.client.focus.byidx(-1)
        end,
    },
    awful.key {
        modifiers = { modkey },
        key = "Tab",
        group = "Client",
        description = "Go back",
        on_press = function ()
            awful.client.focus.history.previous()
            if client.focus then
                client.focus:raise()
            end
        end,
    },
    awful.key{
        modifiers = { modkey, controlkey },
        key = "j",
        group = "Screen",
        description = "Focus next screen",
        on_press = function()
            awful.screen.focus_relative( 1)
        end,
    },
    awful.key {
        modifiers = { modkey, controlkey },
        key = "k",
        group = "Screen",
        description = "focus the previous screen",
        on_press = function()
            awful.screen.focus_relative(-1)
        end,
    },
    awful.key {
        modifiers = { modkey, controlkey },
        key = "h",
        group = "Screen",
        description = "restore minimized",
        on_press = function()
            local c = awful.client.restore()
            -- Focus restored client
                if c then
                c:activate { raise = true, context = "key.unminimize" }
            end
        end,
    },
})

-- Layout related keybindings
awful.keyboard.append_global_keybindings({
    awful.key {
        modifiers = { modkey, shiftkey },
        key = "j",
        group = "Client",
        description = "swap with next client by index",
        on_press = function()
            awful.client.swap.byidx(  1)
        end,
    },
    awful.key {
        modifiers = { modkey, shiftkey },
        key = "k",
        group = "Client",
        description = "swap with previous client by index",
        on_press = function()
            awful.client.swap.byidx( -1)
        end,
    },
    awful.key {
        modifiers = { modkey },
        key = "u",
        group = "Client",
        description = "jump to urgent client",
        on_press = awful.client.urgent.jumpto,
    },
    awful.key {
        modifiers = { modkey },
        key ="l",
        group = "Layout",
        description = "increase master width factor",
        on_press = function()
            awful.tag.incmwfact( 0.5)
        end,
    },
    awful.key {
        modifiers = { modkey },
        key = "h",
        group = "Layout",
        description = "decrease master width factor",
        on_press = function()
            awful.tag.incmwfact(-0.05)
        end,
    },
    awful.key {
        modifiers = { modkey, winkey },
        key = "l",
        group = "Layout",
        description = "increase the number of master clients",
        on_press = function()
            awful.tag.incnmaster( 1, nil, true)
        end,
    },
    awful.key {
        modifiers ={ modkey, winkey },
        key = "h",
        group = "Layout",
        description = "decrease the number of master clients",
        on_press = function()
            awful.tag.incnmaster(-1, nil, true)
        end,
    },
    awful.key {
        modifiers = { modkey, controlkey },
        key = "l",
        group = "Layout",
        description = "increase the number of columns",
        on_press = function()
            awful.tag.incncol( 1, nil, true)
        end,
    },
    awful.key {
        modifiers = { modkey, controlkey },
        key = "h",
        group = "Layout",
        description = "decrease the number of columns",
        on_press = function()
            awful.tag.incncol(-1, nil, true)
        end,
    },
    awful.key {
        modifiers = { modkey, controlkey },
        key = "Left",
        group = "Layout",
        description = "decrease master width with factor",
        on_press = function()
            awful.tag.incmwfact(-0.10)
        end
    },
    awful.key {
        modifiers = { modkey, controlkey },
        key = "Right",
        group = "Layout",
        description = "Increase master width with factor",
        on_press = function()
            awful.tag.incmwfact(0.10)
        end
    },
    awful.key {
        modifiers = { modkey, controlkey },
        key = "Up",
        group = "Layout",
        description = "Increase master height with factor",
        on_press = function()
            awful.client.incwfact(0.10)
        end
    },
    awful.key {
        modifiers = { modkey, controlkey },
        key = "Down",
        group = "Layout",
        description = "Decrease master height with factor",
        on_press = function()
            awful.client.incwfact(-0.10)
        end
    },
    awful.key {
        modifiers = { modkey },
        key = "space",
        on_press = function()
            awful.layout.inc(1)
        end
    },
    
})

-- Tags
awful.keyboard.append_global_keybindings({
    awful.key {
        modifiers   = { modkey },
        keygroup    = "numrow",
        description = "only view tag",
        group       = "tag",
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                tag:view_only()
            end
        end,
    },
    awful.key {
        modifiers   = { modkey, controlkey },
        keygroup    = "numrow",
        description = "toggle tag",
        group       = "tag",
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                awful.tag.viewtoggle(tag)
            end
        end,
    },
    awful.key {
        modifiers = { modkey, shiftkey },
        keygroup    = "numrow",
        description = "move focused client to tag",
        group       = "tag",
        on_press    = function (index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end,
    },
    awful.key {
        modifiers   = { modkey, controlkey, shiftkey },
        keygroup    = "numrow",
        description = "toggle focused client on tag",
        group       = "tag",
        on_press    = function (index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:toggle_tag(tag)
                end
            end
        end,
    },
})
