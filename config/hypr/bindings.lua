-- ██╗  ██╗███████╗██╗   ██╗██████╗ ██╗███╗   ██╗█████╗ ██╗███╗   ██╗ ██████╗ ███████╗
-- ██║ ██╔╝██╔════╝╚██╗ ██╔╝██╔══██╗██║████╗  ██║██╔══██╗██║████╗  ██║██╔════╝ ██╔════╝
-- █████╔╝ █████╗   ╚████╔╝ ██████╔╝██║██╔██╗ ██║██║  ██║██║██╔██╗ ██║██║  ███╗███████╗
-- ██╔═██╗ ██╔══╝    ╚██╔╝  ██╔══██╗██║██║╚██╗██║██║  ██║██║██║╚██╗██║██║   ██║╚════██║
-- ██║  ██╗███████╗   ██║   ██████╔╝██║██║ ╚████║██████╔╝██║██║ ╚████║╚██████╔╝███████║
-- ╚═╝  ╚═╝╚══════╝   ╚═╝   ╚═════╝ ╚═╝╚═╝  ╚═══╝╚═════╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝

-- Assign apps
terminal = "kitty"
browser = "~/.local/bin/launch-browser"
browser2 = "zen-browser"
webapp = "~/.local/bin/launch-webapp"
focus = "~/.local/bin/focus"
osdclient = [[swayosd-client --monitor "$(hyprctl monitors -j | jq -r '.[] | select(.focused == true).name')"]]

-- Assign Dir
rofiDir = "~/.local/bin"
scrDir = "~/.local/bin"

-- Apps
hl.bind("SUPER + Return", hl.dsp.exec_cmd("uwsm-app -- $terminal --dir="$(cwd-terminal)""))
hl.bind("SUPER + B", hl.dsp.exec_cmd(browser))
hl.bind("SUPER + E", hl.dsp.exec_cmd("uwsm app -- nautilus --new-window"))
hl.bind("SUPER + M", hl.dsp.exec_cmd(focus .. " spotify-lancher"))
hl.bind("SUPER + D", hl.dsp.exec_cmd("uwsm app --  vesktop"))
hl.bind("SUPER + O", hl.dsp.exec_cmd("obsidian"))
hl.bind("SUPER + slash", hl.dsp.exec_cmd("uwsm app -- bitwarden-desktop"))
hl.bind("SUPER + C", hl.dsp.exec_cmd("uwsm app -- zeditor"))
hl.bind("SUPER + SHIFT + D", hl.dsp.exec_cmd(terminal .. " -e lazydocker"))
hl.bind("ALT + slash", hl.dsp.exec_cmd(terminal .. " -e btop"))
hl.bind("ALT + M", hl.dsp.exec_cmd(terminal .. " -e rmpc"))
hl.bind("ALT + Q", hl.dsp.exec_cmd(terminal .. " -e yazi"))
hl.bind("ALT + N", hl.dsp.exec_cmd(terminal .. " -e nvim"))
hl.bind("SUPER + S", hl.dsp.exec_cmd(terminal .. " --class=Wiremix -e wiremix"))
hl.bind("SUPER + ALT + M", hl.dsp.exec_cmd("easyeffects"))

-- WebApps
hl.bind("SUPER + A", hl.dsp.exec_cmd(webapp .. " 'https://perplexity.ai'"))
hl.bind("SUPER + SHIFT + A", hl.dsp.exec_cmd(webapp .. " 'https://chatgpt.com'"))
hl.bind("SUPER + CTRL + A", hl.dsp.exec_cmd(webapp .. " 'https://gemini.google.com'"))
-- hl.bind("SUPER + ALT + A", hl.dsp.exec_cmd(webapp .. " 'https://grok.com'"))
hl.bind("ALT + C", hl.dsp.exec_cmd(webapp .. " 'https://calendar.google.com'"))
hl.bind("SUPER + G", hl.dsp.exec_cmd(webapp .. " 'https://github.com/vyrx-dev'"))
hl.bind("SUPER + SHIFT + G", hl.dsp.exec_cmd(webapp .. " 'https://mail.google.com/mail/u/1'"))
hl.bind("SUPER + Y", hl.dsp.exec_cmd(webapp .. " 'https://youtube.com'"))
hl.bind("SUPER + W", hl.dsp.exec_cmd(webapp .. " 'https://web.whatsapp.com'"))
hl.bind("SUPER + X", hl.dsp.exec_cmd(webapp .. " 'https://x.com'"))
hl.bind("SUPER + Z", hl.dsp.exec_cmd(webapp .. " 'https://www.linkedin.com/feed'"))
hl.bind("SUPER + T", hl.dsp.exec_cmd(webapp .. " 'https://app.todoist.com'"))
hl.bind("SUPER + BACKSLASH", hl.dsp.exec_cmd(webapp .. " 'https://devhints.io'"))

-- Tmux
hl.bind("SUPER + SHIFT + RETURN", hl.dsp.exec_cmd(terminal .. " -e tmux a"))
hl.bind("SUPER + ALT + RETURN", hl.dsp.exec_cmd(terminal .. " -e tmux new -As main"))

hl.bind("SUPER + SHIFT + N", hl.dsp.exec_cmd(rofiDir .. "/wifi"))
hl.bind("SUPER + N", hl.dsp.exec_cmd("swaync-client -t -sw"))
hl.bind("SUPER + SHIFT + I", hl.dsp.exec_cmd("kitty --title webapp-install -e $scrDir/webapp-install"))

-- Close windows
hl.bind("SUPER + Q", hl.dsp.window.close())

-- Rofi
hl.bind("ALT + comma", hl.dsp.exec_cmd(rofiDir .. "/clipboard"))
hl.bind("ALT + period", hl.dsp.exec_cmd(rofiDir .. "/emoji"))
hl.bind("SUPER + SHIFT + M", hl.dsp.exec_cmd(rofiDir .. "/rofibeats"))
hl.bind("ALT + SPACE", hl.dsp.exec_cmd(rofiDir .. "/rofisearch"))
hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("pkill rofi || rofi -show drun"))
hl.bind("SUPER + CTRL + B", hl.dsp.exec_cmd(rofiDir .. "/power-profiles"))


hl.bind("SUPER + SHIFT + O", hl.dsp.exec_cmd(scrDir .. "/pop-window"))
hl.bind("SUPER + SHIFT + SPACE", hl.dsp.exec_cmd(scrDir .. "/toggle-waybar"))
hl.bind("SUPER + CTRL + N", hl.dsp.exec_cmd(scrDir .. "/nightlight"))
hl.bind("SUPER + CTRL + I", hl.dsp.exec_cmd(scrDir .. "/toggle-idle"))

-- LocalSend
hl.bind("SUPER + ALT + S", hl.dsp.exec_cmd("kitty --title share -e " .. scrDir .. "/fileshare file"))
hl.bind("SUPER + CTRL + S", hl.dsp.exec_cmd("kitty --title share -e " .. scrDir .. "/fileshare folder"))
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd("kitty --title share -e " .. scrDir .. "/fileshare clipboard"))

-- Themes
hl.bind("SUPER + CTRL + SPACE", hl.dsp.exec_cmd(rofiDir .. "/selectWall"))
hl.bind("SUPER + ALT + SPACE", hl.dsp.exec_cmd(rofiDir .. "/wallPicker"))
hl.bind("CTRL + ALT + SPACE", hl.dsp.exec_cmd(scrDir .. "/change-theme"))
hl.bind("SUPER + CTRL + SHIFT + SPACE", hl.dsp.exec_cmd("symphony switch"))
hl.bind("SUPER + CTRL + SHIFT + BACKSPACE", hl.dsp.exec_cmd("symphony switch --random"))
hl.bind("SUPER + I", hl.dsp.exec_cmd("kitty --title symphony-tui -e symphony-tui"))
hl.bind("SUPER + ALT + I", hl.dsp.exec_cmd("kitty --title symphony-browse -e symphony browse"))

-- Current theme wallpaper cycling
hl.bind("SUPER + ALT + up", hl.dsp.exec_cmd(scrDir .. "/cycle-wallpaper"))
hl.bind("SUPER + ALT + right", hl.dsp.exec_cmd(scrDir .. "/cycle-wallpaper next"))
hl.bind("SUPER + ALT + left", hl.dsp.exec_cmd(scrDir .. "/cycle-wallpaper prev"))

-- Power
hl.bind("SUPER + SHIFT + L", hl.dsp.exec_cmd(scrDir .. "/lock-screen"))
hl.bind("SUPER + CTRL + up", hl.dsp.exec_cmd(scrDir .. "/graceful-reboot"))
hl.bind("SUPER + BACKSPACE", hl.dsp.exec_cmd(scrDir .. "/toggle-terminal-transparency"))
hl.bind("SUPER + CTRL + BACKSPACE", hl.dsp.exec_cmd(scrDir .. "/toggle-focus"))
hl.bind("SUPER + ESCAPE", hl.dsp.exec_cmd(rofiDir .. "/powermenu"))
hl.bind("XF86PowerOff", hl.dsp.exec_cmd(rofiDir .. "/powermenu"), {locked = true})

-- Kill
hl.bind("SUPER + SHIFT + K", hl.dsp.exec_cmd("hyprctl kill"))
hl.bind("SUPER + K", hl.dsp.exec_cmd(rofiDir .. "/keyhints"))

-- Screenshots
hl.bind("SUPER + P", hl.dsp.exec_cmd(scrDir .. "/screenshot"))
hl.bind("SUPER + SHIFT + PRINT", hl.dsp.exec_cmd(scrDir .. "/screenshot smart clipboard"))

-- Screen Recordings
hl.bind("SUPER + R", hl.dsp.exec_cmd(scrDir .. "/screenrecord --with-desktop-audio"))
hl.bind("SUPER + SHIFT + R", hl.dsp.exec_cmd(scrDir .. "/screenrecord --with-microphone-audio"))
hl.bind("SUPER + ALT + R", hl.dsp.exec_cmd(scrDir .. "/screenrecord --with-desktop-audio --with-microphone-audio --with-webcam"))

-- Conversion
hl.bind("SUPER + SHIFT + G", hl.dsp.exec_cmd(scrDir .. "/video-to-gif"))

-- Color picker
hl.bind("SUPER + SHIFT + P", hl.dsp.exec_cmd("pkill hyprpicker || hyprpicker -a"))

-- Laptop Brightness adjusts (very useful for keyboard knob)
hl.bind("SUPER + ALT + XF86AudioRaiseVolume", hl.dsp.exec_cmd(osdclient .. " --brightness raise"))
hl.bind("SUPER + ALT + XF86AudioLowerVolume", hl.dsp.exec_cmd(osdclient .. " --brightness lower"))

-- External Monitor (for more options use "ddcutil capabilities")
hl.bind("SUPER + XF86AudioRaiseVolume", hl.dsp.exec_cmd("ddcutil setvcp 10 + 10"))
hl.bind("SUPER + XF86AudioLowerVolume", hl.dsp.exec_cmd("ddcutil setvcp 10 - 10"))
hl.bind("SUPER + F1", hl.dsp.exec_cmd(scrDir .. "/toggle-monitor"))

