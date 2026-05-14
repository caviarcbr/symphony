-- ██╗    ██╗██╗███╗   ██╗██████╗  ██████╗ ██╗    ██╗    ██████╗ ██╗   ██╗██╗     ███████╗███████╗
-- ██║    ██║██║████╗  ██║██╔══██╗██╔═══██╗██║    ██║    ██╔══██╗██║   ██║██║     ██╔════╝██╔════╝
-- ██║ █╗ ██║██║██╔██╗ ██║██║  ██║██║   ██║██║ █╗ ██║    ██████╔╝██║   ██║██║     █████╗  ███████╗
-- ██║███╗██║██║██║╚██╗██║██║  ██║██║   ██║██║███╗██║    ██╔══██╗██║   ██║██║     ██╔══╝  ╚════██║
-- ╚███╔███╔╝██║██║ ╚████║██████╔╝╚██████╔╝╚███╔███╔╝    ██║  ██║╚██████╔╝███████╗███████╗███████║
--  ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝╚═════╝  ╚═════╝  ╚══╝╚══╝     ╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚══════╝╚══════╝
-- https://wiki.hyprland.org/Configuring/Window-Rules/
-- Hyprland 0.55+ syntax


-- Fix some dragging issues with XWayland
hl.window_rule({
  match = {
    class = "^$",
    title = "^$",
    xwayland = true,
    float = false,
    fullscreen = false,
    pin = false,
  },
  no_focus = on,
})

-- windowrule = match:class ^$, match:title ^$, match:xwayland 1, match:float 0, match:fullscreen 0, match:pin 0, no_focus on

-- Prevent apps from auto-maximizing themselves
hl.window_rule({
  match = {
    class = ".*"
  },
  supress_event = "maximize"
})
-- windowrule = suppress_event maximize, match:class .*

-- 97% opacity when focused, 90% when unfocused
hl.window_rule({
  match = {
    class = ".*",
  },
  opacity = "0.97 0.9",
})
-- windowrule = opacity 0.97 0.9, match:class .*

-- layerrule = animation none, match:namespace selection
hl.layer_rule({
  match = {
    namespace = "selection",
  },
  no_anim = true,
})

-- Floating windows
hl.window_rule({
  match = {
    tag = "floating-window",
  },
  float = true,
})
-- windowrule = float on, match:tag floating-window
-- windowrule = center on, match:tag floating-window
-- windowrule = size 610 500, match:tag floating-window

hl.window_rule({
  match = {
    class = "(blueman-manager|localsend|Wiremix|nmgui)",
  },
  tag = "+floating-window",
})
hl.window_rule({
  match = {
    class = "(xdg-desktop-portal-gtk)",
    title = "match:title ^(Open.*Files?|Open [F|f]older.*|Save.*Files?|Save.*As|Save|All Files|.*wants to [open|save].*|[C|c]hoose.*)
",
  },
  tag = "+floating-window",
})
hl.window_rule({
  match = {
    title = "^(.*Network Manager.*)$",
  },
  tag = "+floating-window",
})
hl.window_rule({
  match = {
    title = "(webapp-install|share)",
  },
  tag = "+floating-window",
})

-- windowrule = tag +floating-window, match:class (blueman-manager|localsend|Wiremix|nmgui)
-- windowrule = tag +floating-window, match:title ^(.*Network Manager.*)$
-- windowrule = tag +floating-window, match:title (webapp-install|share)
-- windowrule = tag +floating-window, match:class (xdg-desktop-portal-gtk), match:title ^(Open.*Files?|Open [F|f]older.*|Save.*Files?|Save.*As|Save|All Files|.*wants to [open|save].*|[C|c]hoose.*)

-- Symphony TUI
hl.window_rule({
  match = {
    title = "symphony-tui",
  },
  float = true,
  center = true,
  size = "720, 580",
})
-- windowrule = float on, match:title symphony-tui
-- windowrule = center on, match:title symphony-tui
-- windowrule = size 720 580, match:title symphony-tui

-- Symphony Browse (larger for preview)
hl.window_rule({
  match = {
    title = "symphony-browse",
  },
  float = true,
  center = true,
  size = "1200, 750",
})
-- windowrule = float on, match:title symphony-browse
-- windowrule = center on, match:title symphony-browse
-- windowrule = size 1200 750, match:title symphony-browse

-- Easyeffects (music equalizer)
hl.window_rule({
  match = {
    class = "com.github.wmmm.easyeffects",
  },
  float = true,
  center = true,
  size = "950, 850",
})
-- windowrule = float on, match:class com.github.wwmm.easyeffects 
-- windowrule = center on, match:class com.github.wwmm.easyeffects 
-- windowrule = size 950 850, match:class com.github.wwmm.easyeffects

-- Float Steam
hl.window_rule({
  match = {
    class = "steam",
    title = "Steam",
  },
  float = true,
  center = true,
  opacity = "1 1",
  size = "1100, 700",
  idle_inhibit = "fullscreen"
})
hl.window_rule({
  match = {
    class = "Steam",
    title = "Friends list",
  },
  size = "460 800"
})
-- windowrule = float on, match:class steam
-- windowrule = center on, match:class steam, match:title Steam
-- windowrule = opacity 1 1, match:class steam
-- windowrule = size 1100 700, match:class steam, match:title Steam
-- windowrule = size 460 800, match:class steam, match:title Friends List
-- windowrule = idle_inhibit fullscreen, match:class steam

-- Screensaver
hl.window_rule({
  match = {
    class = "Screensaver",
  },
  fullscreen = true,
  float = true,
  center = true,
})
-- windowrule = fullscreen on, match:class Screensaver
-- windowrule = float on, match:class Screensaver
-- windowrule = center on, match:class Screensaver

-- Hide Bitwarden from screen share
hl.window_rule({
  match = {
    class = "^(Bitwarden)$",
  },
  no_screen_share = true,
})
-- windowrule = no_screen_share on, match:class ^(Bitwarden)$

-- Browser types
hl.window_rule({
  match = {
    class = "((google-)?[cC]hrom(e|ium)|[bB]rave-browser|[mM]icrosoft-edge|Vivaldi-stable|helium)",
  },
  tag = "+chromium-based-browser"
})
hl.window_rule({
  match = {
    class = "([fF]irefox|zen|librewolf)",
  },
  tag = "+firefox-based-browser",
})
-- windowrule = tag +chromium-based-browser, match:class ((google-)?[cC]hrom(e|ium)|[bB]rave-browser|[mM]icrosoft-edge|Vivaldi-stable|helium)
-- windowrule = tag +firefox-based-browser, match:class ([fF]irefox|zen|librewolf)

-- Force chromium-based browsers into a tile to deal with --app bug
hl.window_rule({
  match = {
    tag ="chromium-based-browser",
  },
  tile = true,
})
-- windowrule = tile on, match:tag chromium-based-browser

-- Only a subtle opacity change, but not for video sites
hl.window_rule({
  match = {
    tag ="chromium-based-browser",
  },
  opacity = "1 0.97",
})
hl.window_rule({
  match = {
    tag ="firefox-based-browser",
  },
  opacity = "1 0.97",
})
-- windowrule = opacity 1 0.97, match:tag chromium-based-browser
-- windowrule = opacity 1 0.97, match:tag firefox-based-browser

-- Some video sites should never have opacity applied
hl.window_rule({
  match = {
    initial_title = [[((?i)(?:[a-z0-9-]+\.)*youtube\.com_/|app\.zoom\.us_/wc/home)]],
  },
  opacity = "1 1",
})
-- windowrule = opacity 1.0 1.0, match:initial_title ((?i)(?:[a-z0-9-]+\.)*youtube\.com_/|app\.zoom\.us_/wc/home)

-- Webcam overlay for screen recording
-- hl.window_rule({
--   match = {
--     title = "WebcamOverlay"
--   }
-- })
-- windowrule = float on, match:title WebcamOverlay
-- windowrule = pin on, match:title WebcamOverlay
-- windowrule = no_initial_focus on, match:title WebcamOverlay
-- windowrule = no_dim on, match:title WebcamOverlay
-- windowrule = move 100%-w-40 100%-w-40, match:title WebcamOverlay -- There's a typo in the hyprland rule so 100%-w on the height param is actually correct here

-- Picture-in-picture overlays
hl.window_rule({
  match = {
    title = "(Picture.?in.?[Pp]icture)",
  },
  tag = "+pip"
})
hl.window_rule({
  match = {
    tag = "pip",
  },
  float = true,
  pin = true,
  size = "600, 338",
  keep_aspect_ratio = true,
  border_size = "0",
  opacity = "1 1",

})
-- windowrule = tag +pip, match:title (Picture.?in.?[Pp]icture)
-- windowrule = float on, match:tag pip
-- windowrule = pin on, match:tag pip
-- windowrule = size 600 338, match:tag pip
-- windowrule = keep_aspect_ratio on, match:tag pip
-- windowrule = border_size 0, match:tag pip
-- windowrule = opacity 1 1, match:tag pip
-- windowrule = move 100%-w-40 4%, match:tag pip
