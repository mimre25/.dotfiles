-- Work-specific Hyprland config, dofile'd from hyprland.lua.

-- Closing laptop = suspend - need to use "on" switch for some reason
hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("systemctl suspend"), { locked = true })

-- Safe those damn eyes while at work
hl.on("hyprland.start", function()
	hl.exec_cmd("safeeyes")
end)

hl.window_rule({
	name = "slack",
	match = { class = "(?i)slack" },
	workspace = "2",
})
hl.window_rule({
	name = "signal",
	match = { class = "(?i)signal" },
	workspace = "10",
})
