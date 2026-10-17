require("tailwind-tools").setup({
	-- tailwindcss server is enabled in after/plugin/lsp.lua; skip the plugin's
	-- deprecated lspconfig-based setup
	server = { override = false },

	document_color = {
		enabled = false, -- can be toggled by commands
	},
})

vim.keymap.set("n", "<leader>sc", vim.cmd.TailwindColorToggle)
