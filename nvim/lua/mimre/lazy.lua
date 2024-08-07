local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"folke/which-key.nvim",
	"folke/neodev.nvim",
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	{
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup({
				icons = false,
				-- your configuration comes here
				-- or leave it empty to  the default settings
				-- refer to the configuration section below
			})
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		tag = "v0.9.2",
		build = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	},
	{ "nvim-treesitter/playground" },
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "theprimeagen/refactoring.nvim" },
	{ "mbbill/undotree" },
	{ "tpope/vim-fugitive" },
	{ "nvim-treesitter/nvim-treesitter-context" },
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },

	{ "hrsh7th/cmp-cmdline" },
	-- Autocompletion
	--
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			{ "hrsh7th/cmp-buffer" },
			{ "hrsh7th/cmp-path" },
			{
				"saadparwaiz1/cmp_luasnip",
				dependencies = {
					"L3MON4D3/LuaSnip",
				},
			},
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-nvim-lua" },
			--
			--            -- Snippets
			--            { "L3MON4D3/LuaSnip" },
			{ "rafamadriz/friendly-snippets" },
		},
	},
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v3.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" },
			{ "williamboman/mason.nvim" },
			{ "williamboman/mason-lspconfig.nvim" },
		},
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
		end,
	},
	{ "wsdjeg/vim-fetch" },
	{ "mfussenegger/nvim-dap" },
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
	},
	{ "mfussenegger/nvim-dap-python" },
	{ "rcarriga/cmp-dap" },
	{ "folke/neodev.nvim", opts = {} },
	{ "pearofducks/ansible-vim" },

	{ "numToStr/Comment.nvim" }, -- allow commenting lines easily
	{ -- test runner
		"nvim-neotest/neotest",
		-- dir = "~/workspace/neotest",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",

			-- adapters
			"nvim-neotest/neotest-python",
			-- "olimorris/neotest-phpunit",
			{
				"mimre25/neotest-phpunit",
				branch = "sail-support",
			},
			-- { dir = "~/workspace/neotest-phpunit" },
		},
	},

	-- easily save macros
	{ "jesseleite/nvim-macroni" },

	-- 3-way diffs and what not
	{ "sindrets/diffview.nvim" },

	-- code sharing
	{ "mistricky/code-link.nvim" },

	-- startup jokes
	-- { dir = "~/workspace/joke.nvim", },
	{ "mimre25/jokes.nvim" },

	-- pretend folders are buffers
	{
		"stevearc/oil.nvim",
	},

	-- markdown preview
	{
		-- need `deno` installed unfortunately :/
		"toppair/peek.nvim",
		event = { "VeryLazy" },
		build = "deno task --quiet build:fast",
		config = function()
			local peek = require("peek")
			peek.setup({ theme = "light", app = { "firefox", "-new-window" } })
			vim.api.nvim_create_user_command("PeekOpen", peek.open, {})
			vim.api.nvim_create_user_command("MarkdownPreview", function()
				if peek.is_open() then
					peek.close()
				else
					peek.open()
				end
			end, {})
			vim.api.nvim_create_user_command("PeekClose", peek.close, {})
		end,
	},

	-- keep track of yanks
	{
		"ptdewey/yankbank-nvim",
		config = function()
			require("yankbank").setup()
		end,
	},

	-- handling diffs
	{ "akinsho/git-conflict.nvim", version = "*", config = true },

	{
		"NStefan002/screenkey.nvim",
		cmd = "Screenkey",
		version = "*",
		config = true,
		lazy = true,
	},
	-- json exploration
	{ "Myzel394/jsonfly.nvim" },

	-- laravel
	{
		"adalessa/laravel.nvim",
		dependencies = {
			"tpope/vim-dotenv",
			"MunifTanjim/nui.nvim",
			"nvimtools/none-ls.nvim",
		},
		cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
		event = { "VeryLazy" },
		config = true,
	},

	-- tets-coverage display
	{
		"andythigpen/nvim-coverage",
		-- Optional: needed for PHP when using the cobertura parser
		rocks = { "lua-xmlreader" },
		config = function()
			require("coverage").setup()
		end,
	},

	-- colorschemes
	{
		"rose-pine/neovim",
		name = "rose-pine",
	},
	{
		"folke/tokyonight.nvim",
		opts = {},
	},

	{ "catppuccin/nvim", name = "catppuccin" },
	{ "rebelot/kanagawa.nvim" },
	{
		"baliestri/aura-theme",
	},
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme duskfox]])
		end,
	},
	{ "navarasu/onedark.nvim" },

	{ "bluz71/vim-nightfly-colors", name = "nightfly" },
	{ "bluz71/vim-moonfly-colors", name = "moonfly" },

	-- enough colorschemes
	--
	--
	-- highlighting todos

	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},

	-- tmux session picker telescope
	-- {
	--     { dir = "~/workspace/tmux-telescope-plugin.nvim" }
	-- },
	{
		"mimre25/tmux-telescope-picker.nvim",
	},
	-- cheatsheet for vim commands
	{
		"doctorfree/cheatsheet.nvim",
		event = "VeryLazy",
		dependencies = {
			{ "nvim-telescope/telescope.nvim" },
			{ "nvim-lua/popup.nvim" },
			{ "nvim-lua/plenary.nvim" },
		},
		config = function()
			local ctactions = require("cheatsheet.telescope.actions")
			require("cheatsheet").setup({
				bundled_cheatsheets = {
					enabled = { "default", "lua", "markdown", "regex", "netrw", "unicode" },
					disabled = { "nerd-fonts" },
				},
				bundled_plugin_cheatsheets = {
					enabled = {
						"auto-session",
						"goto-preview",
						"octo.nvim",
						"telescope.nvim",
						"vim-easy-align",
						"vim-sandwich",
					},
					disabled = { "gitsigns" },
				},
				include_only_installed_plugins = true,
				telescope_mappings = {
					["<CR>"] = ctactions.select_or_fill_commandline,
					["<A-CR>"] = ctactions.select_or_execute,
					["<C-Y>"] = ctactions.copy_cheat_value,
					["<C-E>"] = ctactions.edit_user_cheatsheet,
				},
			})
		end,
	},
	-- databases
	{
		"kristijanhusak/vim-dadbod-ui",
		dependencies = {
			{ "tpope/vim-dadbod", lazy = true },
            { "pbogut/vim-dadbod-ssh"},
			{ "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" }, lazy = true },
		},
		cmd = {
			"DBUI",
			"DBUIToggle",
			"DBUIAddConnection",
			"DBUIFindBuffer",
		},
		init = function()
			-- Your DBUI configuration
			vim.g.db_ui_use_nerd_fonts = 1
		end,
	},
})
