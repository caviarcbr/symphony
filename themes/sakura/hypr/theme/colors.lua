-- Symphony
-- Author: vyrx
-- Theme: Sakura

hl.config({
	general = {
		col = {
			active_border = { colors = { "rgba(e48b7aee)", "rgba(f0a19aee)" }, angle = 45 },
			inactive_border = "rgba(0a122088)",
		},
	},
})
-- Border colors
secondary = { "rgba(e48b7aee)", "rgba(f0a19aee)", angle = 45 }
outline_variant = "rgba(444444ff)"

-- Shadow configuration
hl.config({
	decoration = {
		shadow = {
			color = "rgba(100, 60, 50, 0.4)",
			color_inactive = "rgba(100, 60, 50, 0.2)",
			offset = { 2, 2 },
			range = 11,
			render_power = 2,
		},
	},
})
