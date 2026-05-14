-- Symphony
-- Author: vyrx
-- Theme: Tokyo Night

activeBorderColor = "rgba(7aa2f7aa)"

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
secondary = activeBorderColor
outline_variant = "rgba(414868ff)"

-- Shadow configuration
hl.config({
	decoration = {
		shadow = {
			color = "rgba(15, 16, 30, 0.5)",
			color_inactive = "rgba(15, 16, 30, 0.3)",
			offset = { 2, 2 },
			range = 11,
			render_power = 2,
		},
	},
})
