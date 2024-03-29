local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
    "folke/which-key.nvim",
    "folke/neodev.nvim",
    {
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        dependencies = { "nvim-lua/plenary.nvim" }
    },

    {
        "rose-pine/neovim",
        name = "rose-pine",
        config = function()
            vim.cmd("colorscheme rose-pine")
        end
    },

    {
        "folke/trouble.nvim",
        config = function()
            require("trouble").setup {
                icons = false,
                -- your configuration comes here
                -- or leave it empty to  the default settings
                -- refer to the configuration section below
            }
        end
    },

    {
        "nvim-treesitter/nvim-treesitter",
        tag = "v0.9.1",
        build = function()
            local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
            ts_update()
        end,
    },
    { "nvim-treesitter/playground" },
    { "theprimeagen/harpoon" },
    { "theprimeagen/refactoring.nvim" },
    { "mbbill/undotree" },
    { "tpope/vim-fugitive" },
    { "nvim-treesitter/nvim-treesitter-context" },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

    { "hrsh7th/cmp-cmdline" },
    { "hrsh7th/nvim-cmp" },
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        dependencies = {
            -- LSP Support
            { "neovim/nvim-lspconfig" },
            { "williamboman/mason.nvim" },
            { "williamboman/mason-lspconfig.nvim" },
            -- Autocompletion
            --
            { "hrsh7th/nvim-cmp" },
            { "hrsh7th/cmp-buffer" },
            { "hrsh7th/cmp-path" },
            {
                "saadparwaiz1/cmp_luasnip",
                dependencies = {
                    "L3MON4D3/LuaSnip"
                }
            },
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-nvim-lua" },
            --
            --            -- Snippets
            --            { "L3MON4D3/LuaSnip" },
            { "rafamadriz/friendly-snippets" },
        }
    },

    {
        "smjonas/inc-rename.nvim",
        config = function()
            require("inc_rename").setup()
        end,
    },


    {
        "kylechui/nvim-surround",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to  defaults
            })
        end
    },
    { "wsdjeg/vim-fetch" },
    { "akinsho/toggleterm.nvim",     tag = "v2.9.0", config = true },
    { "ThePrimeagen/vim-apm" },
    { "mfussenegger/nvim-dap" },
    { "rcarriga/nvim-dap-ui" },
    { "mfussenegger/nvim-dap-python" },
    { "rcarriga/cmp-dap" },
    { "folke/neodev.nvim",           opts = {} },
    { "pearofducks/ansible-vim" },


    { "numToStr/Comment.nvim" }, -- allow commenting lines easily
    {                            -- test runner
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",

            -- adapters
            "nvim-neotest/neotest-python"
        }
    },

    -- easily save macros
    { "jesseleite/nvim-macroni" },

    -- 3-way diffs and what not
    { "sindrets/diffview.nvim" },


    -- code sharing
    { "mistricky/code-link.nvim" },

    -- startup jokes
    -- { dir = "~/workspace/joke.nvim", },
    { "mimre25/jokes.nvim"},

    -- pretend folders are buffers
    {
        "stevearc/oil.nvim",
    },
})
