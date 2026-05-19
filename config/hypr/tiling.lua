-- ████████╗██╗██╗     ██╗███╗   ██╗ ██████╗
-- ╚══██╔══╝██║██║     ██║████╗  ██║██╔════╝
--    ██║   ██║██║     ██║██╔██╗ ██║██║  ███╗
--    ██║   ██║██║     ██║██║╚██╗██║██║   ██║
--    ██║   ██║███████╗██║██║ ╚████║╚██████╔╝
--    ╚═╝   ╚═╝╚══════╝╚═╝╚═╝  ╚═══╝ ╚═════╝

-- fullscreen
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle", description = "Toggle fullscreen" }))

hl.config({
	dwindle = {
		-- pseudotile = true,
		preserve_split = true,
	},
})
-- Switch workspaces with SUPER + [0-9]
for i = 1, 10 do
	local numberkey = { 10, 11, 12, 13, 14, 15, 16, 17, 18, 19 }
	hl.bind("SUPER + code:" .. numberkey[i], hl.dsp.focus({ workspace = i }), {description = "Focus workspace"})
end

-- Move active window to a workspace with SUPER + SHIFT + [0-9]
for i = 1, 10 do
	local numberkey = { 10, 11, 12, 13, 14, 15, 16, 17, 18, 19 }
	hl.bind("SUPER + SHIFT + code:" .. numberkey[i], hl.dsp.window.move({ workspace = i }), {description = "Send window to workspace"})
end


-- Swap active window with the one next to it with SUPER + SHIFT + arrow keys
hl.bind("SUPER + SHIFT + H", hl.dsp.window.move({ direction = "left" }), {description = "Swap Window left"})
hl.bind("SUPER + SHIFT + L", hl.dsp.window.move({ direction = "right" }), {description = "Swap Window right"})
hl.bind("SUPER + SHIFT + K", hl.dsp.window.move({ direction = "up" }), {description = "Swap Window up"})
hl.bind("SUPER + SHIFT + J", hl.dsp.window.move({ direction = "down" }), {description = "Swap Window down"})

-- Move focus with SUPER + arrow keys
hl.bind("SUPER + LEFT", hl.dsp.focus({ direction = "left" }), {description = "Focus left"})
hl.bind("SUPER + RIGHT", hl.dsp.focus({ direction = "right" }), {description = "Focus right"})
hl.bind("SUPER + UP", hl.dsp.focus({ direction = "up" }), {description = "Focus up"})
hl.bind("SUPER + DOWN", hl.dsp.focus({ direction = "down" }), {description = "Focus down"})

-- Move focus with SUPER + Vim keys
hl.bind("SUPER + H", hl.dsp.focus({ direction = "left" }), {description = "Focus left"})
hl.bind("SUPER + L", hl.dsp.focus({ direction = "right" }), {description = "Focus right"})
hl.bind("SUPER + K", hl.dsp.focus({ direction = "up" }), {description = "Focus up"})
hl.bind("SUPER + J", hl.dsp.focus({ direction = "down" }), {description = "Focus down"})

-- Toogle
hl.bind("SUPER + V", hl.dsp.layout("togglesplit"), { description = "Toggle split" })

-- focus monitors
hl.bind("SUPER + bracketleft", hl.dsp.window.move({ monitor = "+1" }), {description = "Send to next monitor"})
hl.bind("SUPER + bracketright", hl.dsp.window.move({ monitor = "-1" }), {description = "Send to previous monitor"})

-- Workspace navigation
hl.bind("SUPER + CTRL + LEFT", hl.dsp.focus({ workspace = "e-1" }), {description = "Previous Workspace"}) --previous workspace
hl.bind("SUPER + CTRL + RIGHT", hl.dsp.focus({ workspace = "e+1" }), {description = "Next Workspace"}) -- next workspace

-- Resize active window
hl.bind("SUPER + code:20", hl.dsp.layout("splitratio -0.1"), { repeating = true }, {description = "Decrease split ratio"}) -- "-" key
hl.bind("SUPER + code:21", hl.dsp.layout("splitratio +0.1"), { repeating = true }, {description = "Increase split ratio"}) -- "=" key

-- Scroll through existing workspaces with SUPER + scroll
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "e+1" }), {description = "Next Workspace"}) --previous workspace
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "e-1" }), {description = "Previous Workspace"}) --previous workspace

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true }, {description = "Move window"})
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true }, {description = "Resize window"})
