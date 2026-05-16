#!/bin/bash

gen_hyprland() {
    cat > "$dest/hypr/theme/colors.lua" <<EOF
-- ╭─ ♪ Symphony ─╮
-- │  Generated   │
-- ╰──────────────╯
-- Theme: Omarchy $name

activeBorderColor = "rgba($(hex "$accent")aa)"

hl.config({
  general = {
    col = {
      active_border = activeBorderColor,
    },
  },
  group = {
    col = {
      border_active = activeBorderColor,
    },
  },
})
secondary = activeBorderColor
outline_variant = "rgba($(hex "$bblack")ff)"

hl.config({
  decoration = {
      shadow = {
          color = "rgba($(hex "$bg")80)",
          color_inactive = "rgba($(hex "$bg")4d)",
          offset = { 2, 2 },
          range = 20,
          render_power = 3,
      },
  },
})
EOF
}
