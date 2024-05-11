local lsp = require("lsp-zero")

vim.keymap.set("n", "<leader>j", function()
	if vim.bo.filetype == "" then
		vim.bo.filetype = "json"
		lsp.new_client({
			filetypes = "json",
			on_attach = vim.cmd("Telescope jsonfly"),
		})
	else
		vim.cmd("Telescope jsonfly")
	end
end)
