-- ███╗   ███╗███████╗██████╗ ██╗ █████╗ 
-- ████╗ ████║██╔════╝██╔══██╗██║██╔══██╗
-- ██╔████╔██║█████╗  ██║  ██║██║███████║
-- ██║╚██╔╝██║██╔══╝  ██║  ██║██║██╔══██║
-- ██║ ╚═╝ ██║███████╗██████╔╝██║██║  ██║
-- ╚═╝     ╚═╝╚══════╝╚═════╝ ╚═╝╚═╝  ╚═╝
                                      
-- Laptop multimedia keys for volume and LCD brightness (with OSD)
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(osdclient .. " --output-volume raise"), { release = true, locked = true} )
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(osdclient .. " --output-volume lower"), { release = true, locked = true} )
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(osdclient .. " --output-volume mute-toggle"), { release = true, locked = true} )
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(osdclient .. " --input-volume mute-toggle"), { release = true, locked = true} )
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(osdclient .. " --brightness raise"), { release = true, locked = true} )
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(osdclient .. " --brightness lower"), { release = true, locked = true} )

-- Precise 1% multimedia adjustments with Alt modifier
hl.bind("ALT + XF86AudioRaiseVolume", hl.dsp.exec_cmd(osdclient .. " --output-volume +1"), { release = true, locked = true} )
hl.bind("ALT + XF86AudioLowerVolume", hl.dsp.exec_cmd(osdclient .. " --output-volume -1"), { release = true, locked = true} )
hl.bind("ALT + XF86MonBrightnessUp", hl.dsp.exec_cmd(osdclient .. " --brightness +1"), { release = true, locked = true} )
hl.bind("ALT + XF86MonBrightnessDown", hl.dsp.exec_cmd(osdclient .. " --brightness -1"), { release = true, locked = true} )

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(osdclient .. " --playerctl next"), {  locked = true} )
hl.bind("XF86AudioPause", hl.dsp.exec_cmd(osdclient .. " --playerctl play-pause"), {  locked = true} )
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(osdclient .. " --playerctl play-pause"), {  locked = true} )
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(osdclient .. " --playerctl previous"), {  locked = true} )

-- Switch audio output with Super + Mute
hl.bind("SUPER + XF86AudioMute", hl.dsp.exec_cmd(scrDir .. "/audio-switch"), {  locked = true} )

-- mpc
hl.bind("SUPER + F9", hl.dsp.exec_cmd("mpc pause"))
hl.bind("SUPER + F10", hl.dsp.exec_cmd("mpd prev"))
hl.bind("SUPER + F11", hl.dsp.exec_cmd("mpc play"))
hl.bind("SUPER + F12", hl.dsp.exec_cmd("mpc next"))

