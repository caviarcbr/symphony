-- ███╗   ███╗███████╗██████╗ ██╗ █████╗ 
-- ████╗ ████║██╔════╝██╔══██╗██║██╔══██╗
-- ██╔████╔██║█████╗  ██║  ██║██║███████║
-- ██║╚██╔╝██║██╔══╝  ██║  ██║██║██╔══██║
-- ██║ ╚═╝ ██║███████╗██████╔╝██║██║  ██║
-- ╚═╝     ╚═╝╚══════╝╚═════╝ ╚═╝╚═╝  ╚═╝
                                      
-- Laptop multimedia keys for volume and LCD brightness (with OSD)
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(OsdClient .. " --output-volume raise"), { release = true, locked = true} )
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(OsdClient .. " --output-volume lower"), { release = true, locked = true} )
hl.bind("XF86AudioMute", hl.dsp.exec_cmd(OsdClient .. " --output-volume mute-toggle"), { release = true, locked = true} )
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd(OsdClient .. " --input-volume mute-toggle"), { release = true, locked = true} )
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(OsdClient .. " --brightness raise"), { release = true, locked = true} )
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(OsdClient .. " --brightness lower"), { release = true, locked = true} )

hl.bind("SUPER + F7", hl.dsp.exec_cmd(OsdClient .. " --output-volume raise"), { repeating = true, locked = true} )
hl.bind("SUPER + F6", hl.dsp.exec_cmd(OsdClient .. " --output-volume lower"), { repeating = true, locked = true} )
hl.bind("SUPER + F10", hl.dsp.exec_cmd(OsdClient .. " --brightness raise"), { repeating = true, locked = true} )
hl.bind("SUPER + F9", hl.dsp.exec_cmd(OsdClient .. " --brightness lower"), { repeating = true, locked = true} )

-- Precise 1% multimedia adjustments with Alt modifier
hl.bind("ALT + XF86AudioRaiseVolume", hl.dsp.exec_cmd(OsdClient .. " --output-volume +1"), { release = true, locked = true} )
hl.bind("ALT + XF86AudioLowerVolume", hl.dsp.exec_cmd(OsdClient .. " --output-volume -1"), { release = true, locked = true} )

hl.bind("SUPER + ALT + F7", hl.dsp.exec_cmd(OsdClient .. " --output-volume +1"), { repeating = true, locked = true} )
hl.bind("SUPER + ALT + F6", hl.dsp.exec_cmd(OsdClient .. " --output-volume -1"), { repeating = true, locked = true} )

hl.bind("ALT + XF86MonBrightnessUp", hl.dsp.exec_cmd(OsdClient .. " --brightness +1"), { release = true, locked = true} )
hl.bind("ALT + XF86MonBrightnessDown", hl.dsp.exec_cmd(OsdClient .. " --brightness -1"), { release = true, locked = true} )

hl.bind("SUPER + ALT + F10", hl.dsp.exec_cmd(OsdClient .. " --brightness +1"), { repeating = true, locked = true} )
hl.bind("SUPER + ALT + F9", hl.dsp.exec_cmd(OsdClient .. " --brightness -1"), { repeating = true, locked = true} )

-- mpc
hl.bind("XF86AudioNext", hl.dsp.exec_cmd(OsdClient .. " mpc next"), {  locked = true} )
hl.bind("XF86AudioPause", hl.dsp.exec_cmd(OsdClient .. " mpd toggle"), {  locked = true} )
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd(OsdClient .. " mpd toggle"), {  locked = true} )
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd(OsdClient .. " mpd prev"), {  locked = true} )

-- Switch audio output with Super + Mute
hl.bind("SUPER + XF86AudioMute", hl.dsp.exec_cmd(ScrDir .. "/audio-switch"), {  locked = true} )

