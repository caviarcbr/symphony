-- ██╗  ██╗███████╗██╗   ██╗██████╗ ██╗███╗   ██╗█████╗ ██╗███╗   ██╗ ██████╗ ███████╗
-- ██║ ██╔╝██╔════╝╚██╗ ██╔╝██╔══██╗██║████╗  ██║██╔══██╗██║████╗  ██║██╔════╝ ██╔════╝
-- █████╔╝ █████╗   ╚████╔╝ ██████╔╝██║██╔██╗ ██║██║  ██║██║██╔██╗ ██║██║  ███╗███████╗
-- ██╔═██╗ ██╔══╝    ╚██╔╝  ██╔══██╗██║██║╚██╗██║██║  ██║██║██║╚██╗██║██║   ██║╚════██║
-- ██║  ██╗███████╗   ██║   ██████╔╝██║██║ ╚████║██████╔╝██║██║ ╚████║╚██████╔╝███████║
-- ╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═════╝ ╚═╝╚═╝  ╚═══╝╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝
--
require("modules")

-- Assign apps
local terminal = "kitty"


-- Apps
hl.bind("SUPER + Return", hl.dsp.exec_cmd("uwsm-app -- " .. terminal .. " --dir='$(cwd-terminal)'"), { description = "Terminal" })
hl.bind("SUPER + SHIFT + RETURN", hl.dsp.workspace.toggle_special("scratchpad"), { description = "Scratchpad" })
hl.bind("SUPER + E", hl.dsp.workspace.toggle_special("quickfiles"), { description = "Yazi" })
hl.bind("SUPER + B", hl.dsp.workspace.toggle_special("sysmon"), { description = "Btop" })
hl.bind("SUPER + M", hl.dsp.workspace.toggle_special("quickmusic"), { description = "RMPC" })
hl.bind("SUPER + SHIFT + N", hl.dsp.workspace.toggle_special("wifi"), { description = "Wifi Menu" })
hl.bind("SUPER + SHIFT + B", hl.dsp.workspace.toggle_special("bluetooth"), { description = "Bluetooth Menu" })



-- Browser
hl.bind("SUPER + W", function()
  browser.launch() end, { description = "Launch Browser" })



-- Private Browser Window
hl.bind("SUPER + SHIFT + W", function()
  browser.launch({"--private"}) end, { description = "Launch Browser" })



-- WebApps
hl.bind("SUPER + G", function()
  browser.webapp("https://github.com") end, { description = "Github" })

hl.bind("SUPER + Y", function()
  browser.webapp("https://youtube.com") end, { description = "Youtube" })

hl.bind("SUPER + R", function()
  browser.webapp("https://reddit.com") end, { description = "Reddit" })

hl.bind("SUPER + T", function()
  browser.webapp("https://twitch.tv") end, { description = "Twitch" })

hl.bind("SUPER + SHIFT + T", function()
  browser.webapp("https://kick.com") end, { description = "Kick" })



-- Notifications
hl.bind("SUPER + N", hl.dsp.exec_cmd("swaync-client -t -sw"), { description = "Notification Centre" })



-- Close windows
hl.bind("SUPER + Q", hl.dsp.window.close(), {description = "Close active window"})



-- Rofi
hl.bind("SUPER + SLASH", function()
  rofi.keyhints() end, { description = "Show All Keybindings" })

hl.bind("ALT + period", function()
  rofi.emoji() end, { description = "emoji" })

hl.bind("ALT + comma", function()
  rofi.clipboard() end, { description = "clipboard" })

hl.bind("ALT + SPACE", function()
  rofi.search() end, { description = "Find" })

hl.bind("SUPER + SPACE", function()
  rofi.app() end, { description = "app-launcher" })



-- Toggles
hl.bind("SUPER + SHIFT + SPACE", function()
  waybar.toggle() end)

hl.bind("SUPER + CTRL + I", function()
  idle.toggle() end)



-- LocalSend
hl.bind("SUPER + ALT + S", function()
  fileshare.file() end, {description = "Localsend File"})

hl.bind("SUPER + CTRL + S", function()
  fileshare.folder() end, {description = "Localsend Folder"})

hl.bind("SUPER + SHIFT + S", function()
  fileshare.clipboard() end, {description = "Localsend Clipboard"})



-- Themes
hl.bind("SUPER + CTRL + SPACE", function()
  rofi.theme("matugen") end, { description = "Matugen Themes Apply" })

hl.bind("SUPER + ALT + SPACE", function()
  rofi.theme("wall") end, { description = "Wallpaper Picker" })

hl.bind("CTRL + ALT + SPACE", function()
  rofi.theme("random") end, { description = "Select awww wall" })

hl.bind("SUPER + CTRL + SHIFT + SPACE", function()
  symphony.switch() end, { description = "Theme Switcher" })

hl.bind("SUPER + CTRL + SHIFT + BACKSPACE", function()
  symphony.switch("random") end, { description = "Random Theme" })

hl.bind("SUPER + I", function()
  symphony.tui() end, { description = "Symphony TUI" })

hl.bind("SUPER + ALT + I", function()
  symphony.browse() end, { description = "Browse Themes" })



-- Current theme wallpaper cycling
hl.bind("SUPER + ALT + up", function()
  wallpaper.change() end, { description = "Theme Wallpapers" })

hl.bind("SUPER + ALT + right", function()
  wallpaper.next() end, { description = "Next Wallpaper" })

hl.bind("SUPER + ALT + left", function()
  wallpaper.prev() end, { description = "Previous Wallpaper" })



-- Power
hl.bind("SUPER + CTRL + L", function()
  power.lock() end, { description = "Lock screen" })

hl.bind("SUPER + CTRL + up", function()
  power.reboot() end, { description = "Reboot" })

hl.bind("SUPER + ESCAPE", function()
  power.menu() end, {description = "Power Menu"})
  
hl.bind("XF86PowerOff", function()
  powermenu.show() end)



-- Kill
hl.bind("SUPER + ALT + K", hl.dsp.exec_cmd("hyprctl kill"), { description = "Kill Application" })



-- Screenshots
hl.bind("SUPER + ALT + P", function()
  screengrab.save() end, { description = "Screenshot with editing" })

hl.bind("SUPER + SHIFT + PRINT", function()
  screengrab.clip() end, { description = "Screenshot to clipboard" })



-- Screen Recordings
hl.bind("SUPER + CTRL + R", function()
  screenrecord.desk() end, { description = "Record Screen" })

hl.bind("SUPER + SHIFT + R", function()
  screenrecord.deskmic() end, { description = "Record + Mic" })

hl.bind("SUPER + ALT + R", function()
  screenrecord.cam() end, { description = "Record + Mic + Webcam" })



-- Color picker
hl.bind("SUPER + SHIFT + P", hl.dsp.exec_cmd("pkill hyprpicker || hyprpicker -a"), { description = "Color Picker" })



-- Open hypr configs
hl.bind("XF86HomePage", hl.dsp.exec_cmd("kitty -e yazi ~/.config/hypr"), { description = "Open Hypr Configs" })

