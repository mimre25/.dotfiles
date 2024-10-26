local dap = require("dap")

vim.keymap.set("n", "<F5>", function()
	require("dap").continue()
end)
vim.keymap.set("n", "<F8>", function()
	require("dap").step_over()
end)
vim.keymap.set("n", "<F7>", function()
	require("dap").step_into()
end)
vim.keymap.set("n", "<F9>", function()
	require("dap").step_out()
end)
vim.keymap.set("n", "<Leader>b", function()
	require("dap").toggle_breakpoint()
end)
vim.keymap.set("n", "<Leader>B", function()
	require("dap").set_breakpoint()
end)
vim.keymap.set("n", "<Leader>lp", function()
	require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end)
vim.keymap.set("n", "<Leader>dr", function()
	require("dap").repl.open()
end)
vim.keymap.set("n", "<Leader>dl", function()
	require("dap").run_last()
end)
vim.keymap.set({ "n", "v" }, "<Leader>dh", function()
	require("dap.ui.widgets").hover()
end)
vim.keymap.set({ "n", "v" }, "<Leader>dp", function()
	require("dap.ui.widgets").preview()
end)
vim.keymap.set("n", "<Leader>df", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.frames)
end)
vim.keymap.set("n", "<Leader>ds", function()
	local widgets = require("dap.ui.widgets")
	widgets.centered_float(widgets.scopes)
end)

dap.adapters.php = {
	type = "executable",
	command = "node",
	args = { "/home/martin/Tools/vscode-php-debug/out/phpDebug.js" },
}

dap.configurations.php = {
	{
		log = true,
		type = "php",
		request = "launch",
		name = "Listen for XDebug",
		port = 9003,
		stopOnEntry = true,
		xdebugSettings = {
			max_children = 512,
			max_data = 1024,
			max_depth = 4,
		},
		-- breakpoints = {
		--     exception = {
		--         Notice = false,
		--         Warning = false,
		--         Error = false,
		--         Exception = false,
		--         ["*"] = false,
		--     },
		-- },
	},
}
