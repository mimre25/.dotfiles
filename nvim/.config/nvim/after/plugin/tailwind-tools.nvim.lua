require("tailwind-tools").setup({

	document_color = {
		enabled = false, -- can be toggled by commands
	},
})

vim.keymap.set("n", "<leader>sc", vim.cmd.TailwindColorToggle)
