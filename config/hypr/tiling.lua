-- ████████╗██╗██╗     ██╗███╗   ██╗ ██████╗
-- ╚══██╔══╝██║██║     ██║████╗  ██║██╔════╝
--    ██║   ██║██║     ██║██╔██╗ ██║██║  ███╗
--    ██║   ██║██║     ██║██║╚██╗██║██║   ██║
--    ██║   ██║███████╗██║██║ ╚████║╚██████╔╝
--    ╚═╝   ╚═╝╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝

-- fullscreen
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))

hl.config({
	dwindle = {
		-- pseudotile = true,
		preserve_split = true,
	},
})
-- Switch workspaces with SUPER + [0-9]
for i = 1, 10 do
	local numberkey = { 10, 11, 12, 13, 14, 15, 16, 17, 18, 19 }
	hl.bind("SUPER + code:" .. numberkey[i], hl.dsp.focus({ workspace = i }))
end

-- Move active window to a workspace with SUPER + SHIFT + [0-9]
for i = 1, 10 do
	local numberkey = { 10, 11, 12, 13, 14, 15, 16, 17, 18, 19 }
	hl.bind("SUPER + SHIFT + code:" .. numberkey[i], hl.dsp.window.move({ workspace = i }))
end


-- Swap active window with the one next to it with SUPER + SHIFT + arrow keys
hl.bind("SUPER + SHIFT + H", hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER + SHIFT + L", hl.dsp.window.move({ direction = "right" }))
hl.bind("SUPER + SHIFT + K", hl.dsp.window.move({ direction = "up" }))
hl.bind("SUPER + SHIFT + J", hl.dsp.window.move({ direction = "down" }))

-- Move focus with SUPER + arrow keys
hl.bind("SUPER + LEFT", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + RIGHT", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + UP", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + DOWN", hl.dsp.focus({ direction = "down" }))

-- Move focus with SUPER + Vim keys
hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }))

-- Toogle
hl.bind("SUPER + V", hl.dsp.layout("togglesplit"), { description = "Toggle split" })

-- focus monitors
hl.bind("SUPER + bracketleft", hl.dsp.window.move({ monitor = "+1" }))
hl.bind("SUPER + bracketright", hl.dsp.window.move({ monitor = "-1" }))

-- Workspace navigation
hl.bind("SUPER + CTRL + LEFT", hl.dsp.focus({ workspace = "e-1" })) --previous workspace
hl.bind("SUPER + CTRL + RIGHT", hl.dsp.focus({ workspace = "e+1" })) -- next workspace

-- Resize active window
hl.bind("SUPER + code:20", hl.dsp.layout("splitratio -0.1"), { repeating = true })
hl.bind("SUPER + code:21", hl.dsp.layout("splitratio +0.1"), { repeating = true })

-- Scroll through existing workspaces with SUPER + scroll
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" })) --previous workspace
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" })) --previous workspace

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })
