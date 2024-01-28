vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : yank & put to/from clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])
vim.keymap.set({ "n", "v" }, "<leader>P", [["+P]])
vim.keymap.set({ "n", "v" }, "<leader>pu", [[I<CR><ESC>k"+P]])
vim.keymap.set({ "n", "v" }, "<leader>pd", [[A<CR><ESC>"+P]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

--vim.keymap.set("n", "<leader><leader>", function()
--    vim.cmd("so")
--end)


-- mine
-- go back
vim.keymap.set("n", "b", "<C-o>")
-- remap ESC in terminal to CTRL-\
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>")

----- == mapped in toggleterm == -----
-- open terminal below
--vim.keymap.set("n", "<leader>t", ":rightbelow split term://zsh <enter> :resize 15 <enter>i")
-- close terminal on Ctrl+d
-- vim.keymap.set("t", "<C-D>", "<C-D><C-\\><C-n><C-W>q>")
----- == mapped in toggleterm == -----


-- reload nvim config
vim.keymap.set("n", "<leader> <leader> <leader>", function()
    vim.cmd("so ~/nvim/init.lua")
end)




-- resize windows
vim.keymap.set("n", "<M-l>", ":vertical resize +3<CR>")
vim.keymap.set("n", "<M-h>", ":vertical resize -3<CR>")
vim.keymap.set("n", "<M-j>",  ":resize +3<CR>")
vim.keymap.set("n", "<M-k>", ":resize -3<CR>")


-- move in insert mode
vim.keymap.set("i", "<C-J>", "<C-o>j")
vim.keymap.set("i", "<C-K>", "<C-o>k")
vim.keymap.set("i", "<C-H>", "<C-o>h")
vim.keymap.set("i", "<C-L>", "<C-o>l")


