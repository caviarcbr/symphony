





<div align="center">

![Banner](branding/banner.jpg)

**A minimal, productivity-focused Arch + Hyprland setup**

<a href="#install"><img src="https://img.shields.io/badge/Install-c4a7e7?style=for-the-badge&logoColor=1a1b26" alt="Install"/></a>&ensp;
<a href="#keybindings"><img src="https://img.shields.io/badge/Keys-9ece6a?style=for-the-badge&logoColor=1a1b26" alt="Keys"/></a>

</div>

> **This is my setup.** It's opinionated — the tools I chose because I like them. You might too, or you might not. Either way, it works.
>
> Includes prompt to set up for Nvidia GPUs.
>
> Tested on Arch (Fresh install, not fully tested on systems that already have DE/WM).

## Showcase

https://github.com/user-attachments/assets/40ec921f-ae59-4fe3-8054-e70354c4f878

---

## Install

> [!CAUTION]
> These install scripts are meant for a minimal, fresh install of Arch Linux

```bash
curl -fsSL https://raw.githubusercontent.com/caviarcbr/symphony/refs/heads/main/boot.sh | bash
```

`boot.sh` installs git and gum if needed, clones the repo, and runs the installer. Run it again anytime to update.

Manual install:

```bash
git clone https://github.com/caviarcbr/symphony ~/symphony
cd ~/symphony && ./install.sh
```

Existing configs are backed up to `~/.config/symphony/backups/` before overwriting.

---

## Usage

```bash
symphony switch          # pick a theme
symphony switch [theme]  # switch directly
symphony switch -r       # random theme
symphony list            # show available themes
symphony reload          # reapply current theme
symphony restore         # roll back from backup
symphony fresh-setup     # reclone + reinstall
symphony help            # show all commands
```

Theme picker GUI: `Super + Ctrl + Shift + Space`

---

## Keybindings

Tweak them in `config/hypr/bindings.lua`.


<details>
<summary><b>Apps</b></summary>

| Key | Action |
|-----|--------|
| `Super + Return` | Terminal |
| `Super + Space` | App Launcher |
| `Super + W` | Browser |
| `Super + E` | Yazi |
| `Super + M` | RMPC |
| `Super + B` | Btop |

</details>

<details>
<summary><b>Menus</b></summary>

| Key | Action |
|-----|--------|
| `Alt + ,` | Clipboard |
| `Alt + .` | Emoji Picker |
| `Super + Ctrl + Space` | Matugen Theme |
| `Super + Alt + Space` | Wallpaper Picker |
| `Super + Ctrl + Shift + Space` | Theme Switcher |

</details>

<details>
<summary><b>Windows</b></summary>

| Key | Action |
|-----|--------|
| `Super + Q` | Close |
| `Super + ALT + K` | Kill |
| `Super + H,J,K,L` | Focus |
| `Super + Shift + H,J,K,L` | Move |
| `Super + 1-9` | Workspace |
| `Super + Shift + 1-9` | Send to Workspace |
| `Super + F` | Fullscreen |
| `Super + V` | Toggle Split |

</details>

<details>
<summary><b>System</b></summary>

| Key | Action |
|-----|--------|
| `Super + Escape` | Power Menu |
| `Super + N` | Notifications |
| `Super + P` | Screenshot |
| `Super + CTRL + R` | Record |
| `Super + Shift + R` | Record + Mic |
| `Super + Shift + P` | Color Picker |
| `Ctrl + Alt + Space` | Random Wallpaper |
| `Super + Alt + ←/→` | Cycle Wallpapers |

</details>

---

## Components

| Component     | Tool                                                                        |
| ------------- | --------------------------------------------------------------------------- |
| Compositor    | [Hyprland](https://hyprland.org/)                                           |
| Bar           | [Waybar](https://github.com/Alexays/Waybar)                                 |
| Launcher      | [Rofi](https://github.com/lbonn/rofi)                                       |
| Terminal      | [Kitty](https://sw.kovidgoyal.net/kitty/) / [Ghostty](https://ghostty.org/) |
| Notifications | [SwayNC](https://github.com/ErikReider/SwayNotificationCenter)              |
| Lock screen   | [Hyprlock](https://github.com/hyprwm/hyprlock)                              |
| Theme engine  | [Matugen](https://github.com/InioX/matugen)                                 |
| Music         | [MPD](https://musicpd.org/) + [RMPC](https://github.com/mierak/rmpc)        |
| Visualizer    | [Cava](https://github.com/karlstav/cava)                                    |
| Editor        | [Neovim + NvChad](https://neovim.io/)                                                |
| Shell         | [Fish](https://fishshell.com/) or [zsh](https://zsh.org) + [Starship](https://starship.rs/)           |

---

## Troubleshooting


**Install failed halfway?** Re-run the failed script:

```bash
./install/packages.sh
./install/deploy.sh
./install/services.sh
```

**Theme broken?** `symphony fix` then `symphony reload`. Still broken? `symphony switch sakura`.

**Waybar missing?** Remove `xdg-desktop-portal-gnome` (keep `xdg-desktop-portal-gtk`), reboot.

**SDDM black screen?** `Ctrl+Alt+F3`, login, run `./install/post-setup.sh`.

**Want to start over?** `symphony fresh-setup` — backs up, nukes, reclones, reinstalls. Type "fresh" to confirm.

Still stuck? [Open an issue](https://github.com/caviarcbr/symphony/issues/).

---

## Credits

Learned (and borrowed) from:

- [vyrx-dev/symphony](https://github.com/vyrx-dev/symphony)
- [HyDE-Project/HyDE](https://github.com/HyDE-Project/HyDE)
- [JaKooLit/Hyprland-Dots](https://github.com/JaKooLit/Hyprland-Dots)
- [basecamp/omarchy](https://github.com/basecamp/omarchy)
- [uiriansan/SilentSDDM](https://github.com/uiriansan/SilentSDDM)
- [bjarneo/aether.nvim](https://github.com/bjarneo/aether.nvim)

---


</div>
