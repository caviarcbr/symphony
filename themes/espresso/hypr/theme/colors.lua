-- Symphony
-- Author: vyrx
-- Theme: Espresso

-- Warm cohesive espresso palette

-- Warm peach/cream border
activeBorderColor = "rgba(e8b89acc)"

hl.config({
	general = {
		col = {
			active_border = activeBorderColor,
		},
	},

	group = {
		col = {
			border_active = activeBorderColor,
		},
	},
})
-- Border colors
secondary = "rgba(d8a078aa)"
outline_variant = "rgba(2e2520ff)"

-- Shadow configuration
hl.config({
	decoration = {
		shadow = {
			color = "rgba(26, 21, 19, 0.5)",
			color_inactive = "rgba(26, 21, 19, 0.3)",
			offset = { 2, 2 },
			range = 11,
			render_power = 2,
		},
	},
})
