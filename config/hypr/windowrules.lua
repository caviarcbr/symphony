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

-- Prevent apps from auto-maximizing themselves
hl.window_rule({
  match = {
    class = ".*"
  },
  suppress_event = "maximize"
})

-- 97% opacity when focused, 90% when unfocused
hl.window_rule({
  match = {
    class = ".*",
  },
  opacity = "0.97 0.9",
})

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

hl.window_rule({
  match = {
    class = "(blueman-manager|localsend|Wiremix|nmgui)",
  },
  tag = "+floating-window",
})

hl.window_rule({
  match = {
    class = "(xdg-desktop-portal-gtk)",
    title = [[match:title ^(Open.*Files?|Open [F|f]older.*|Save.*Files?|Save.*As|Save|All Files|.*wants to [open|save].*|[C|c]hoose.*)
    ]],
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
hl.window_rule({
  match = {
    tag = "floating-window",
  },
  size = "800 600"
})

-- Symphony TUI
hl.window_rule({
  match = {
    title = "symphony-tui",
  },
  float = true,
  center = true,
  size = "720 580",
})

-- Symphony Browse (larger for preview)
hl.window_rule({
  match = {
    title = "symphony-browse",
  },
  float = true,
  center = true,
  size = "1200 750",
})

-- Easyeffects (music equalizer)
hl.window_rule({
  match = {
    class = "com.github.wmmm.easyeffects",
  },
  float = true,
  center = true,
  size = "950 850",
})

-- Float Steam
hl.window_rule({
  match = {
    class = "steam",
    title = "Steam",
  },
  float = true,
  center = true,
  opacity = "1 1",
  size = "1100 700",
  idle_inhibit = "fullscreen"
})
hl.window_rule({
  match = {
    class = "Steam",
    title = "Friends list",
  },
  size = "460 800"
})

-- Screensaver
hl.window_rule({
  match = {
    class = "Screensaver",
  },
  fullscreen = true,
  float = true,
  center = true,
})

-- Hide Bitwarden from screen share
hl.window_rule({
  match = {
    class = "^(Bitwarden)$",
  },
  no_screen_share = true,
})

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

-- Force chromium-based browsers into a tile to deal with --app bug
hl.window_rule({
  match = {
    tag ="chromium-based-browser",
  },
  tile = true,
})

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

-- Some video sites should never have opacity applied
hl.window_rule({
  match = {
    initial_title = [[((?i)(?:[a-z0-9-]+\.)*youtube\.com_/|app\.zoom\.us_/wc/home)]],
  },
  opacity = "1 1",
})

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
  size = "600 338",
  keep_aspect_ratio = true,
  border_size = 0,
  opacity = "1 1",
})

-- Picture and Video
hl.window_rule({
  match = {
    class = "feh",
  },
  size = "1280 720",
  float = true,
  center = true,
})
hl.window_rule({
  match = {
    class = "mpv",
  },
  size = "1280 720",
  float = true,
  center = true,
})

-- Special Workspaces
hl.workspace_rule({ workspace = "special:scratchpad", on_created_empty = "kitty --title scratchpad" })
hl.window_rule({
	match = {
		title = "scratchpad",
	},
	float = true,
	center = true,
	size = "850 600",
})
hl.workspace_rule({ workspace = "special:sysmon", on_created_empty = "kitty --title sysmon -e btop" })
hl.window_rule({
	match = {
		title = "sysmon",
	},
	float = true,
	center = true,
	size = "850 600",
})
hl.workspace_rule({ workspace = "special:quickfiles", on_created_empty = "kitty --title quickfiles -e yazi" })
hl.window_rule({
	match = {
		title = "quickfiles",
	},
	float = true,
	center = true,
	size = "850 600",
})
hl.workspace_rule({ workspace = "special:quickmusic", on_created_empty = "kitty --title quickmusic -e rmpc" })
hl.window_rule({
	match = {
		title = "quickmusic",
	},
	float = true,
	center = true,
	size = "850 600",
})
hl.workspace_rule({ workspace = "special:wifi", on_created_empty = "kitty --title wlctl -e wlctl" })
hl.window_rule({
	match = {
		title = "wlctl",
	},
	float = true,
	center = true,
	size = "870 550",
})
hl.workspace_rule({ workspace = "special:bluetooth", on_created_empty = "kitty --title bluetooth -e bluetui" })
hl.window_rule({
	match = {
		title = "bluetooth",
	},
	float = true,
	center = true,
	size = "870 550",
})
