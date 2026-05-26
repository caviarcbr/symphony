-- ██╗  ██╗███████╗██╗   ██╗██████╗ ██╗███╗   ██╗█████╗ ██╗███╗   ██╗ ██████╗ ███████╗
-- ██║ ██╔╝██╔════╝╚██╗ ██╔╝██╔══██╗██║████╗  ██║██╔══██╗██║████╗  ██║██╔════╝ ██╔════╝
-- █████╔╝ █████╗   ╚████╔╝ ██████╔╝██║██╔██╗ ██║██║  ██║██║██╔██╗ ██║██║  ███╗███████╗
-- ██╔═██╗ ██╔══╝    ╚██╔╝  ██╔══██╗██║██║╚██╗██║██║  ██║██║██║╚██╗██║██║   ██║╚════██║
-- ██║  ██╗███████╗   ██║   ██████╔╝██║██║ ╚████║██████╔╝██║██║ ╚████║╚██████╔╝███████║
-- ╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═════╝ ╚═╝╚═╝  ╚═══╝╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝

-- Assign apps
local terminal = "kitty"
local browser = "~/.local/bin/launch-browser"
local webapp = "~/.local/bin/launch-webapp"

-- Assign Dir
RofiDir = "~/.local/bin"
ScrDir = "~/.local/bin"

-- Apps
hl.bind("SUPER + Return", hl.dsp.exec_cmd("uwsm-app -- " .. terminal .. " --dir='$(cwd-terminal)'"), { description = "Terminal" })
hl.bind("SUPER + SHIFT + RETURN", hl.dsp.workspace.toggle_special("scratchpad"))
hl.bind("SUPER + E", hl.dsp.workspace.toggle_special("quickfiles"))
hl.bind("SUPER + B", hl.dsp.workspace.toggle_special("sysmon"))
hl.bind("SUPER + M", hl.dsp.workspace.toggle_special("quickmusic"))
hl.bind("SUPER + SHIFT + N", hl.dsp.workspace.toggle_special("wifi"))
hl.bind("SUPER + SHIFT + B", hl.dsp.workspace.toggle_special("bluetooth"))
hl.bind("SUPER + W", hl.dsp.exec_cmd(browser), { description = "Browser" })

-- WebApps
hl.bind("SUPER + Y", hl.dsp.exec_cmd(webapp .. " 'https://youtube.com'"), { description = "YouTube" })
hl.bind("SUPER + R", hl.dsp.exec_cmd(webapp .. " 'https://reddit.com'"), { description = "Reddit" })
hl.bind("SUPER + G", hl.dsp.exec_cmd(webapp .. " 'https://github.com'"), { description = "Reddit" })
hl.bind("SUPER + SHIFT + T", hl.dsp.exec_cmd(webapp .. " 'https://kick.com'"), { description = "Kick" })
hl.bind("SUPER + T", hl.dsp.exec_cmd(webapp .. " 'https://twitch.tv'"), { description = "Twitch" })

hl.bind("SUPER + N", hl.dsp.exec_cmd("swaync-client -t -sw"), { description = "Notification Centre" })

-- Close windows
hl.bind("SUPER + Q", hl.dsp.window.close())

-- Rofi
hl.bind("ALT + comma", hl.dsp.exec_cmd(RofiDir .. "/clipboard"), { Description = "clipboard" })
hl.bind("ALT + period", hl.dsp.exec_cmd(RofiDir .. "/emoji"), { description = "emoji" })
hl.bind("ALT + SPACE", hl.dsp.exec_cmd(RofiDir .. "/rofisearch"), { description = "Find" })
hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("pkill rofi || rofi -show drun"), { description = "app-launcher" })

hl.bind("SUPER + SHIFT + SPACE", hl.dsp.exec_cmd(ScrDir .. "/toggle-waybar"))
hl.bind("SUPER + CTRL + I", hl.dsp.exec_cmd(ScrDir .. "/toggle-idle"), { description = "Toggle Idle/Lock" })

-- LocalSend
hl.bind("SUPER + ALT + S", hl.dsp.exec_cmd("kitty --title share -e " .. ScrDir .. "/fileshare file"))
hl.bind("SUPER + CTRL + S", hl.dsp.exec_cmd("kitty --title share -e " .. ScrDir .. "/fileshare folder"))
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("kitty --title share -e " .. ScrDir .. "/fileshare clipboard"))

-- Themes
hl.bind("SUPER + CTRL + SPACE", hl.dsp.exec_cmd(RofiDir .. "/selectWall"), { description = "Matugen Themes Apply" })
hl.bind("SUPER + ALT + SPACE", hl.dsp.exec_cmd(RofiDir .. "/wallPicker"), { description = "Wallpaper Picker" })
hl.bind("CTRL + ALT + SPACE", hl.dsp.exec_cmd(ScrDir .. "/change-theme"), { description = "Select awww wall" })
hl.bind("SUPER + CTRL + SHIFT + SPACE", hl.dsp.exec_cmd("~/symphony/install/themes/symphony switch"), { description = "Theme Switcher" })
hl.bind("SUPER + CTRL + SHIFT + BACKSPACE", hl.dsp.exec_cmd("symphony switch --random"), { description = "Random Theme" })
hl.bind("SUPER + I", hl.dsp.exec_cmd("kitty --title symphony-tui -e symphony-tui"), { description = "Symphony TUI" })
hl.bind("SUPER + ALT + I", hl.dsp.exec_cmd("kitty --title symphony-browse -e symphony browse"), { description = "Browse Themes" })

-- Current theme wallpaper cycling
hl.bind("SUPER + ALT + up", hl.dsp.exec_cmd(ScrDir .. "/cycle-wallpaper"), { description = "Theme Wallpapers" })
hl.bind("SUPER + ALT + right", hl.dsp.exec_cmd(ScrDir .. "/cycle-wallpaper next"), { description = "Next Wallpaper" })
hl.bind("SUPER + ALT + left", hl.dsp.exec_cmd(ScrDir .. "/cycle-wallpaper prev"), { description = "Previous Wallpaper" })

-- Power
hl.bind("SUPER + CTRL + L", hl.dsp.exec_cmd(ScrDir .. "/lock-screen"), { description = "Lock screen" })
hl.bind("SUPER + CTRL + up", hl.dsp.exec_cmd(ScrDir .. "/graceful-reboot"), { description = "Reboot" })
hl.bind("SUPER + ESCAPE", hl.dsp.exec_raw(RofiDir .. "/powermenu"), { description = "Power Menu" })
hl.bind("XF86PowerOff", hl.dsp.exec_cmd(RofiDir .. "/powermenu"), { locked = true }, { description = "Power Menu" })

-- Kill
hl.bind("SUPER + ALT + K", hl.dsp.exec_cmd("hyprctl kill"), { description = "Kill Application" })
-- hl.bind("SUPER + K", hl.dsp.exec_cmd(RofiDir .. "/keyhints"), { description = "Show All Keybindings" })

-- Screenshots
hl.bind("SUPER + ALT + P", hl.dsp.exec_cmd(ScrDir .. "/screenshot"), { description = "Screenshot with editing" })
hl.bind("SUPER + SHIFT + PRINT", hl.dsp.exec_cmd(ScrDir .. "/screenshot smart clipboard"), { description = "Screenshot to clipboard" })

-- Screen Recordings
hl.bind("SUPER + CTRL + R", hl.dsp.exec_cmd(ScrDir .. "/screenrecord --with-desktop-audio"), { description = "Record Screen" })
hl.bind("SUPER + SHIFT + R", hl.dsp.exec_cmd(ScrDir .. "/screenrecord --with-microphone-audio"), { description = "Record + Mic" })
hl.bind("SUPER + ALT + R", hl.dsp.exec_cmd(ScrDir .. "/screenrecord --with-desktop-audio --with-microphone-audio --with-webcam"), { description = "Record + Mic + Webcam" })

-- Conversion
hl.bind("SUPER + SHIFT + G", hl.dsp.exec_cmd(ScrDir .. "/video-to-gif"), { description = "Convert mp4 video to gif" })

-- Color picker
hl.bind("SUPER + SHIFT + P", hl.dsp.exec_cmd("pkill hyprpicker || hyprpicker -a"), { description = "Color Picker" })

