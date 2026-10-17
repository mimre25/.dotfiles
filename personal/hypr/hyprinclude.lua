-- Personal-specific Hyprland config, dofile'd from hyprland.lua.

-- Closing laptop = suspend - need to use "on" switch for some reason
hl.bind("switch:on:Lid Switch", hl.dsp.exec_cmd("systemctl suspend"), { locked = true })

-- Solves resolution bug
hl.env("AQ_NO_MODIFIERS", "1") -- https://github.com/hyprwm/Hyprland/issues/8758

-- Disable touchpad
hl.device({ name = "synaptics-tm3381-002", enabled = false })

hl.window_rule({
	name = "signal",
	match = { class = "(?i)signal" },
	workspace = "2",
})
hl.window_rule({
	name = "slack",
	match = { class = "(?i)slack" },
	workspace = "10",
})
