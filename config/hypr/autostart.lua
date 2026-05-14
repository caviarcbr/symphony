--  █████╗ ██╗   ██╗████████╗ ██████╗ ███████╗████████╗ █████╗ ██████╗ ████████╗
-- ██╔══██╗██║   ██║╚══██╔══╝██╔═══██╗██╔════╝╚══██╔══╝██╔══██╗██╔══██╗╚══██╔══╝
-- ███████║██║   ██║   ██║   ██║   ██║███████╗   ██║   ███████║██████╔╝   ██║   
-- ██╔══██║██║   ██║   ██║   ██║   ██║╚════██║   ██║   ██╔══██║██╔══██╗   ██║   
-- ██║  ██║╚██████╔╝   ██║   ╚██████╔╝███████║   ██║   ██║  ██║██║  ██║   ██║   
-- ╚═╝  ╚═╝ ╚═════╝    ╚═╝    ╚═════╝ ╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝                     

hl.on("hyprland.start", function ()
  
  -- Slow app launch fix
  hl.exec_cmd("dbus-update-activation-environment --systemd --all")
  hl.exec_cmd("systemctl --user import-environment $(env | cut -d'=' -f1)")

  hl.exec_cmd("uwsm-app -- wl-clip-persist --clipboard regular &")
  hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
  hl.exec_cmd("uwsm-app -- wl-paste --watch cliphist store")
  hl.exec_cmd("uwsm-app -- awww-daemon")
  hl.exec_cmd("uwsm-app -- hypridle")
  hl.exec_cmd("uwsm-app -- swayosd-server")
  hl.exec_cmd("uwsm-app -- ~/.local/bin/battery-notify")
  hl.exec_cmd("uwsm-app -- kdeconnect-indicator")
  hl.exec_cmd("/usr/lib/kdeconnectd")

  -- Delay waybar to ensure Hyprland IPC is ready
  hl.exec_cmd("sleep 1 && uwsm app -- waybar")
  hl.exec_cmd("~/.local/bin/first-run")

------ --------------------- ------
------    AUTOSTART APPS     ------
------ --------------------- ------
  
  -- hl.exec_cmd("spotify-launcher")
  -- hl.exec_cmd("vesktop")


)
