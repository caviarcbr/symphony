-- Symphony
-- Author: vyrx
-- Theme: Forest

-- focus window color (border)

-- Border colors
secondary = "rgb(4a7a4a)"
outline_variant = "rgba(3a5a3aff)"

-- Shadow configuration

hl.config({
	general = {
		col = {
			active_border = "rgba(70cf6caa)",
		},
	},
	decoration = {
		shadow = {
			enabled = true,
			color = "rgba(26, 40, 26, 0.4)",
			color_inactive = "rgba(26, 40, 26, 0.2)",
			offset = { 2, 2 },
			range = 11,
			render_power = 2,
		},
	},
})
