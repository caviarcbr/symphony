<div align="center">

![Banner](branding/banner.jpg)

**A minimal, productivity-focused Arch + Hyprland setup**

<a href="#install"><img src="https://img.shields.io/badge/Install-c4a7e7?style=for-the-badge&logoColor=1a1b26" alt="Install"/></a>&ensp;
<a href="#keybindings"><img src="https://img.shields.io/badge/Keys-9ece6a?style=for-the-badge&logoColor=1a1b26" alt="Keys"/></a>

</div>

> **This is my setup.** It's opinionated — the tools I chose because I like them. You might too, or you might not. Either way, it works.
>
> Built for **NVIDIA GPUs**, but will work with AMD/Intel as well with minor adjustments.
>
> Tested on Arch (recommended to install on fresh install of Vanilla Arch).

## Showcase

https://github.com/user-attachments/assets/8f59ff8d-90ab-4a0c-a2d6-9346307f5de1

---

## Install

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
symphony switch sakura   # switch directly
symphony switch -r       # random theme
symphony list            # show available themes
symphony reload          # reapply current theme
symphony update          # pull latest + redeploy
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
| `Super + R` | Record |
| `Super + Shift + R` | Record + Mic |
| `Super + Shift + P` | Color Picker |
| `Ctrl + Alt + Space` | Random Wallpaper |
| `Super + Alt + ←/→` | Cycle Wallpapers |

</details>

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
