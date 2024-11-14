require("iswap").setup({
	flash_style = false,
})

vim.keymap.set("n", "<leader>sr", vim.cmd.ISwapWithRight)
vim.keymap.set("n", "<leader>sl", vim.cmd.ISwapWithLeft)
vim.keymap.set("n", "<leader>sw", vim.cmd.ISwapWith)
