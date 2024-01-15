local toggleterm = require("toggleterm")
toggleterm.setup({
    hide_numbers = true,
    start_in_insert = true,
    persist_mode = false,

})

vim.keymap.set("n", "<leader>tt", ":ToggleTerm <enter>")
vim.keymap.set("n", "<leader>tp", ":TermExec cmd='ipython --no-autoindent' go_back=0 <enter>")
vim.keymap.set("t", "<C-D>", "<C-\\><C-n> :ToggleTerm <enter>")


vim.keymap.set("v", "<space>sl", function()
    toggleterm.send_lines_to_terminal("single_line", false, { args = vim.v.count })
end)
vim.keymap.set("v", "<space>sb", function()
    toggleterm.send_lines_to_terminal("visual_lines", false, { args = vim.v.count })
end)
vim.keymap.set("v", "<space>ss", function()
    toggleterm.send_lines_to_terminal("visual_selection", false, { args = vim.v.count })
end)
