-- Symphony
-- Author: vyrx
-- Theme: Kanagawa

activeBorderColor = "rgba(7e9cd8aa)"

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
outline_variant = "rgba(54546Dff)"

-- Shadow configuration
hl.config({
	decoration = {
		shadow = {
			color = "rgba(22, 22, 29, 0.5)",
			color_inactive = "rgba(22, 22, 29, 0.3)",
			offset = { 2, 2 },
			range = 11,
			render_power = 2,
		},
	},
})
