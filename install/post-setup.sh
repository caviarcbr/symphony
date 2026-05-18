#!/bin/bash
#|---/ /+---------------------+---/ /|#
#|--/ /-| Symphony Dotfiles   |--/ /-|#
#|-/ /--| Post-Install Setup  |-/ /--|#
#|/ /---+---------------------+/ /---|#
set -e
SYMPHONY_DIR="${SYMPHONY_DIR:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)}"
source "$SYMPHONY_DIR/install/utils.sh"

# ╭───────────────────────────────────────────────────────────────────────╮
# │ Nvidia Setup                                                          │
# ╰───────────────────────────────────────────────────────────────────────╯

setup_nvidia() {
	command -v gum &>/dev/null || return 0
	echo
  gum confirm "Do you have an Nvidia GPU?" || return 0
  step "Setting up for Nvidia GPU"
  do_install nvidia-utils nvidia-open-dkms

  sudo tee ~/.config/hypr/hyprland.lua > /dev/null << 'HYPR_EOF'

-- ██╗  ██╗██╗   ██╗██████╗ ██████╗ ██╗      █████╗ ███╗   ██╗██████╗ 
-- ██║  ██║╚██╗ ██╔╝██╔══██╗██╔══██╗██║     ██╔══██╗████╗  ██║██╔══██╗
-- ███████║ ╚████╔╝ ██████╔╝██████╔╝██║     ███████║██╔██╗ ██║██║  ██║
-- ██╔══██║  ╚██╔╝  ██╔═══╝ ██╔══██╗██║     ██╔══██║██║╚██╗██║██║  ██║
-- ██║  ██║   ██║   ██║     ██║  ██║███████╗██║  ██║██║ ╚████║██████╔╝
-- ╚═╝  ╚═╝   ╚═╝   ╚═╝     ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ 

-- Learn how to configure Hyprland: https://wiki.hyprland.org/Configuring/

hl.on("hyprland.start", function ()
  hl.exec_cmd("hyprctl setcursor Bibata-Modern-Ice 24")
end)
require("monitors")
require("input")
require("bindings")
require("envs")
require("looknfeel")
require("autostart")
require("animations")
require("windowrules")
require("tiling")
require("media")

-- NVIDIA environment variables
hl.env("NVD_BACKEND","direct")
hl.env("LIBVA_DRIVER_NAME","nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME","nvidia")

HYPR_EOF
}

# ╭───────────────────────────────────────────────────────────────────────╮
# │ SDDM Silent Theme                                                    │
# ╰───────────────────────────────────────────────────────────────────────╯

setup_sddm() {
    pkg_installed sddm-silent-theme || return 0

    echo
    confirm "Setup minimal SDDM login screen? (sddm-silent-theme)" || return 0

    step "Configuring SDDM"

    # Write sddm.conf
    info "Writing /etc/sddm.conf (requires sudo)"
    sudo tee /etc/sddm.conf > /dev/null << 'SDDM_EOF'
[General]
InputMethod=qtvirtualkeyboard
GreeterEnvironment=QML2_IMPORT_PATH=/usr/share/sddm/themes/silent/components/,QT_IM_MODULE=qtvirtualkeyboard

[Theme]
Current=silent
SDDM_EOF

    sudo systemctl enable sddm 2>/dev/null || true
    ok "SDDM configured with silent theme"
}

# ╭───────────────────────────────────────────────────────────────────────╮
# │ Keyd — Capslock → Escape/Control                                     │
# ╰───────────────────────────────────────────────────────────────────────╯

setup_keyd() {
    pkg_installed keyd || return 0

    echo
    info "keyd can remap Capslock → Escape (tap) / Super (hold)"
    info "  This is useful for Vim — tap Caps for Esc, hold for Super"
    confirm "Enable keyd capslock remap?" || return 0

    step "Configuring keyd"

    sudo mkdir -p /etc/keyd
    sudo tee /etc/keyd/default.conf > /dev/null << 'KEYD_EOF'
[ids]

*

[main]

# Maps capslock to escape when pressed and control when held.
capslock = overload(meta, esc)

# Remaps the right alt key to capslock
rightalt = capslock
KEYD_EOF

    sudo systemctl enable keyd --now 2>/dev/null || true
    ok "keyd enabled — Capslock is now Esc/Super"
}

# ╭───────────────────────────────────────────────────────────────────────╮
# │ Run                                                                   │
# ╰───────────────────────────────────────────────────────────────────────╯

sed -i 5s/user/"$USER"/g ~/.config/btop/btop.conf
setup_nvidia
setup_sddm
setup_keyd
