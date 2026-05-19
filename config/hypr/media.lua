-- ███╗   ███╗███████╗██████╗ ██╗ █████╗ 
-- ████╗ ████║██╔════╝██╔══██╗██║██╔══██╗
-- ██╔████╔██║█████╗  ██║  ██║██║███████║
-- ██║╚██╔╝██║██╔══╝  ██║  ██║██║██╔══██║
-- ██║ ╚═╝ ██║███████╗██████╔╝██║██║  ██║
-- ╚═╝     ╚═╝╚══════╝╚═════╝ ╚═╝╚═╝  ╚═╝
                                      
-- Laptop multimedia keys for volume and LCD brightness (with OSD)
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(OsdClient .. " --output-volume raise"), { repeating = true, locked = true, description = "Raise volume"} )
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(OsdClient .. " --output-volume lower"), { repeating = true, locked = true, description = "Lower volume"} )
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(OsdClient .. " --output-volume mute-toggle"), { repeating = true, locked = true, description = "Mute volume"} )
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(OsdClient .. " --input-volume mute-toggle"), { repeating = true, locked = true, description = "Mute Mic"} )
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(OsdClient .. " --brightness raise"), { repeating = true, locked = true, description = "Raise brightness"} )
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(OsdClient .. " --brightness lower"), { repeating = true, locked = true, description = "Lower brightness"} )

hl.bind("SUPER + F7", hl.dsp.exec_cmd(OsdClient .. " --output-volume raise"), { repeating = true, locked = true, description = "Raise volume"} )
hl.bind("SUPER + F6", hl.dsp.exec_cmd(OsdClient .. " --output-volume lower"), { repeating = true, locked = true, description = "Lower volume"} )
hl.bind("SUPER + F10", hl.dsp.exec_cmd(OsdClient .. " --brightness raise"), { repeating = true, locked = true, description = "Raise brightness"} )
hl.bind("SUPER + F9", hl.dsp.exec_cmd(OsdClient .. " --brightness lower"), { repeating = true, locked = true, description = "Lower brightness"} )

-- Precise 1% multimedia adjustments with Alt modifier
hl.bind("ALT + XF86AudioRaiseVolume", hl.dsp.exec_cmd(OsdClient .. " --output-volume +1"), { repeating = true, locked = true, description = "Raise volume +1"} )
hl.bind("ALT + XF86AudioLowerVolume", hl.dsp.exec_cmd(OsdClient .. " --output-volume -1"), { repeating = true, locked = true, description = "lower volume -1"} )

hl.bind("SUPER + ALT + F7", hl.dsp.exec_cmd(OsdClient .. " --output-volume +1"), { repeating = true, locked = true, description = "Raise volume +1"} )
hl.bind("SUPER + ALT + F6", hl.dsp.exec_cmd(OsdClient .. " --output-volume -1"), { repeating = true, locked = true, description = "Lower volume -1"} )

hl.bind("ALT + XF86MonBrightnessUp", hl.dsp.exec_cmd(OsdClient .. " --brightness +1"), { repeating = true, locked = true, description = "Raise brightness +1"} )
hl.bind("ALT + XF86MonBrightnessDown", hl.dsp.exec_cmd(OsdClient .. " --brightness -1"), { repeating = true, locked = true, description = "Lower brightness -1"} )

hl.bind("SUPER + ALT + F10", hl.dsp.exec_cmd(OsdClient .. " --brightness +1"), { repeating = true, locked = true, description = "Raise brightness +1"} )
hl.bind("SUPER + ALT + F9", hl.dsp.exec_cmd(OsdClient .. " --brightness -1"), { repeating = true, locked = true, description = "Lower brightness -1"} )

-- mpc
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(OsdClient .. " mpc next"), {  locked = true, description = "Next track"} )
hl.bind("XF86AudioPause", hl.dsp.exec_cmd(OsdClient .. " mpc toggle"), {  locked = true, description = "Play/Pause music"} )
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(OsdClient .. " mpc toggle"), {  locked = true, description = "Play/Pause music"} )
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(OsdClient .. " mpc prev"), {  locked = true, description = "Previous track"} )

-- Switch audio output with Super + Mute
hl.bind("SUPER + XF86AudioMute", hl.dsp.exec_cmd(ScrDir .. "/audio-switch"), {  locked = true, description = "Change Audio Output"} )


