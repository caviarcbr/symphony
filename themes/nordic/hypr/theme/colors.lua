-- Symphony
-- Author: vyrx
-- Theme: Nordic

activeBorderColor = "rgba(8fbcbbaa)"

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
outline_variant = "rgba(4c566aff)"

-- Shadow configuration
hl.config({
	decoration = {
		shadow = {
			color = "rgba(46, 52, 64, 0.5)",
			color_inactive = "rgba(46, 52, 64, 0.3)",
			offset = { 2, 2 },
			range = 11,
			render_power = 2,
		},
	},
})
