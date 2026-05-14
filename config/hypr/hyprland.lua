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

