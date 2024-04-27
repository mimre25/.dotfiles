local telescope = require("telescope")
local telescopeConfig = require("telescope.config")

-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!**/.git/*")
local actions = require("telescope.actions")

telescope.setup({
    defaults = {
        --hidden = true,
        vimgrep_arguments = vimgrep_arguments,
        mappings = {
            i = {
                ["<C-j>"] = "move_selection_next",
                ["<C-k>"] = "move_selection_previous",
            }
        },

    },
    pickers = {
        find_files = {
            -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
            find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
        colorscheme = {
            enable_preview = true
        },
    },
})

telescope.load_extension("fzf")

local builtin = require('telescope.builtin')

-- file
vim.keymap.set('n', '<leader>pf', builtin.find_files, { desc = "builtin.find_files" })
vim.keymap.set('n', '<leader>pg', builtin.live_grep, { desc = "builtin.live_grep" })
-- vim.keymap.set('n', '<leader>pgf', builtin.git_files, {desc= "builtin.git_files"})
vim.keymap.set('n', '<leader>ps', builtin.grep_string, { desc = "builtin.grep_string" })

-- commands
vim.keymap.set('n', '<leader>pc', builtin.commands, { desc = "builtin.commands" })
vim.keymap.set('n', '<leader>pr', builtin.command_history, { desc = "builtin.command_history" })

-- lsp
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, { desc = "builtin.lsp_references" })
vim.keymap.set('n', '<leader>gi', builtin.lsp_implementations, { desc = "builtin.lsp_implementations" })

-- treesitter
vim.keymap.set('n', '<leader>sa', builtin.treesitter, { desc = "builtin.treesitter" })


vim.keymap.set('n', '<leader>vh', builtin.help_tags, { desc = "builtin.help_tags" })
