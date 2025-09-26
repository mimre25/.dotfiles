local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	"folke/lazydev.nvim",
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{
		"mimre25/tmux-telescope-picker.nvim",
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{
		"nvim-treesitter/nvim-treesitter",
		tag = "v0.10.0",
		build = function()
			local ts_update = require("nvim-treesitter.install").update({ with_sync = true })
			ts_update()
		end,
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
	{ "nvim-treesitter/nvim-treesitter-context" },
	{ "nvim-treesitter/playground" },
	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	{ "theprimeagen/refactoring.nvim" },
	{ "mbbill/undotree" },
	{ "tpope/vim-fugitive" },

	{
		"mason-org/mason.nvim",
		opts = {},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
			"neovim/nvim-lspconfig",
		},
	},
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

	-- general preview (Markdown, HTML, Asciidoc)
	{
		"brianhuster/live-preview.nvim",
		-- dependencies = {'brianhuster/autosave.nvim'}, -- Not required, but recomended for autosaving and sync scrolling
		opts = {},
	},

	-- handling diffs
	{ "akinsho/git-conflict.nvim", version = "*", config = true },

	-- laravel
	-- {
	-- 	"adalessa/laravel.nvim",
	-- 	dependencies = {
	-- 		"tpope/vim-dotenv",
	-- 		"MunifTanjim/nui.nvim",
	-- 		"nvimtools/none-ls.nvim",
	-- 		"kevinhwang91/promise-async",
	-- 	},
	-- 	cmd = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
	-- 	opts = {
	-- 		lsp_server = "intelephense",
	-- 	},
	-- 	event = { "VeryLazy" },
	-- 	config = true,
	-- },
	--
	{
		"adibhanna/laravel.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
			"nvim-lua/plenary.nvim",
		},
		-- cmd = { "Artisan", "Composer", "Laravel*" },
		-- keys = {
		--     { "<leader>la", ":Artisan<cr>", desc = "Laravel Artisan" },
		--     { "<leader>lc", ":Composer<cr>", desc = "Composer" },
		--     { "<leader>lr", ":LaravelRoute<cr>", desc = "Laravel Routes" },
		--     { "<leader>lm", ":LaravelMake<cr>", desc = "Laravel Make" },
		-- },
		event = { "VeryLazy" },
		config = function()
			require("laravel").setup()
		end,
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

	-- colorscheme
	{
		"EdenEast/nightfox.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd([[colorscheme duskfox]])
		end,
	},

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
			{ "pbogut/vim-dadbod-ssh" },
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

	-- idententation guides
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
	},

	-- laravel ide helper
	{
		"Bleksak/laravel-ide-helper.nvim",
		opts = {
			write_to_models = true,
			save_before_write = true,
			format_after_gen = true,
		},
		enabled = function()
			return vim.fn.filereadable("artisan") ~= 0
		end,
		keys = {
			{
				"<leader>lgm",
				function()
					require("laravel-ide-helper").generate_models(vim.fn.expand("%"))
				end,
				desc = "Generate Model Info for current model",
			},
			{
				"<leader>lgM",
				function()
					require("laravel-ide-helper").generate_models()
				end,
				desc = "Generate Model Info for all models",
			},
		},
	},

	-- tailwind support
	{
		"luckasRanarison/tailwind-tools.nvim",
		name = "tailwind-tools",
		build = ":UpdateRemotePlugins",
	},

	-- sql formatting
	{
		"andev0x/sql-formatter.nvim",
		ft = { "sql", "mysql", "plsql", "pgsql" },
		config = function()
			vim.g.sqlformat_command = "sql-formatter"
			vim.g.sqlformat_options = "-r -k upper"
			vim.g.sqlformat_prog = "sql-formatter"
		end,
	},
})
