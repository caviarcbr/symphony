-- ██╗      ██████╗  ██████╗ ██╗  ██╗       ██╗       ███████╗███████╗███████╗██╗     
-- ██║     ██╔═══██╗██╔═══██╗██║ ██╔╝       ██║       ██╔════╝██╔════╝██╔════╝██║     
-- ██║     ██║   ██║██║   ██║█████╔╝     ████████╗    █████╗  █████╗  █████╗  ██║     
-- ██║     ██║   ██║██║   ██║██╔═██╗     ██╔═██╔═╝    ██╔══╝  ██╔══╝  ██╔══╝  ██║     
-- ███████╗╚██████╔╝╚██████╔╝██║  ██╗    ██████║      ██║     ███████╗███████╗███████╗
-- ╚══════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝    ╚═════╝      ╚═╝     ╚══════╝╚══════╝╚══════╝

-- Colors from Symphony
require("~/.config/symphony/current/hypr/theme/colors.lua")

-- https://wiki.hyprland.org/Configuring/Variables/#general
hl.config({
  general = {
      gaps_in = 5,
      gaps_out = 12,
      border_size = 2,
      col.active_border = secondary,
      col.inactive_border = outline_variant,
      resize_on_border = true,

      -- Change to niri-like side-scrolling layout
      -- layout = scrolling
  },

  -- https://wiki.hyprland.org/Configuring/Variables/#decoration
  decoration = {
      rounding = 10,

      blur = {
          enabled = true,
          size = 7,
          passes = 4,
          ignore_opacity = true,
          noise = 0.0117,
          contrast = 0.8916,
          brightness = 0.8172,
          xray = false,
          popups = true,
      }
  }
  misc {
      disable_hyprland_logo = true,
      -- force_default_wallpaper = 0,  # Disables anime mascot wallpapers
      disable_splash_rendering  = true,
      focus_on_activate = true,
      anr_missed_pings = 3,
      on_focus_under_fullscreen = 1,
  }
})
-- App launcher
hl.layer_rule({
  match = {
    namespace = "rofi",
  },
  blur = true,
  ignore_alpha = 0,
  animation = "slide bottom"
})

hl.layer_rule({
  match = {
    namespace = "waybar",
  },
  blur = true,
  ignore_alpha = 0,
})

hl.layer_rule({
  match = {
    namespace = "swayosd",
  },
  blur = true,
  ignore_alpha = 0,
})

hl.layer_rule({
  match = {
    namespace = "swaync-control-center",
  },
  blur = true,
  ignore_alpha = 0,
  ignore_alpha = 0.5,
  animation = "slide right"
})

hl.layer_rule({
  match = {
    namespace = "swaync-notification-window",
  },
  blur = true,
  ignore_alpha = 0,
  ignore_alpha = 0.5,
})


-- Style Gum confirm to match terminal theme
hl.env("GUM_CONFIRM_PROMPT_FOREGROUND","6") -- Cyan
hl.env("GUM_CONFIRM_SELECTED_FOREGROUND","0") -- Black
hl.env("GUM_CONFIRM_SELECTED_BACKGROUND","2") -- Green
hl.env("GUM_CONFIRM_UNSELECTED_FOREGROUND","0") -- Black
hl.env("GUM_CONFIRM_UNSELECTED_BACKGROUND","8") -- Dark Grey

