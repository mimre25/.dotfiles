local lsp = require("lsp-zero")

lsp.preset("recommended")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"ansiblels",
		"eslint",
		"html",
		"jsonls",
		"lua_ls",
		"pylsp",
		"tailwindcss",
		"ts_ls",
		"yamlls",
	},
	handlers = {
		lsp.default_setup,
		lua_ls = function()
			local lua_opts = lsp.nvim_lua_ls()
			require("lspconfig").lua_ls.setup(lua_opts)
		end,
	},
})
local lspconfig = require("lspconfig")

lspconfig.ansiblels.setup({
	ansible = {
		path = "ansible",
	},
	executionEnvironment = {
		enabled = false,
	},
	python = {
		interpreterPath = "/home/martin/micromamba/envs/ansible/bin/python",
	},
	validation = {
		enabled = false,
		lint = {
			enabled = false,
			path = "ansible-lint",
		},
	},
})
lspconfig.sqls.setup({ capabilities = capabilities })
lspconfig.marksman.setup({ capabilities = capabilities })
lspconfig.rust_analyzer.setup({ capabilities = capabilities })
lspconfig.marksman.setup({ capabilities = capabilities })
lspconfig.pylsp.setup({
	capabilities = capabilities,
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					maxLineLength = 120,
				},
			},
		},
	},
})

-- copied form jess archer
-- https://github.com/jessarcher/dotfiles/blob/ef692c35d64db2c13674dfc850a23b6acf9e8f91/nvim/lua/user/plugins/lspconfig.lua#L25
lspconfig.intelephense.setup({
	-- commands = {
	--   IntelephenseIndex = {
	--     function()
	--       vim.lsp.buf.execute_command({ command = 'intelephense.index.workspace' })
	--     end,
	--   },
	-- },
	-- on_attach = function(client, bufnr)
	-- client.server_capabilities.documentFormattingProvider = false
	-- client.server_capabilities.documentRangeFormattingProvider = false
	-- if client.server_capabilities.inlayHintProvider then
	--   vim.lsp.buf.inlay_hint(bufnr, true)
	-- end
	-- end,
	capabilities = capabilities,
})

-- lspconfig.phpactor.setup({ capabilities = capabilities })
-- lspconfig.vuels.setup({
-- 	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
-- 	capabilities = capabilities,
-- })
lspconfig.jsonls.setup({})

lspconfig.elixirls.setup({
	cmd = { "/home/martin/.local/share/nvim/mason/bin/elixir-ls" },
})

lspconfig.ts_ls.setup({
	init_options = {
		plugins = {
			{
				-- TODO: this needs to be installed manually, in the home folder, so the path would be ~/node_modules/@vue/typescript-plugin
				name = "@vue/typescript-plugin",
				location = "",
				languages = { "javascript", "typescript", "vue" },
			},
		},
	},
	filetypes = {
		"javascript",
		"typescript",
		"vue",
	},
})
lspconfig.tailwindcss.setup({})

lspconfig.pbls.setup({})
lspconfig.clangd.setup({})

lspconfig.gopls.setup({})

lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I",
	},
})

local function removeDuplicates(inputList)
	local seen = {}
	local unique = {}

	local function itemToStr(item)
		return item.filename .. item.lnum .. item.end_lnum .. item.col .. item.end_col
	end

	for _, item in ipairs(inputList["items"]) do
		if not seen[itemToStr(item)] then
			unique[#unique + 1] = item
			seen[itemToStr(item)] = true
		end
	end

	inputList["items"] = unique
	if #inputList["items"] > 1 then
		vim.fn.setqflist({}, " ", inputList)
		vim.cmd("copen")
	else
		vim.fn.setqflist({}, " ", inputList)
		vim.cmd.cfirst()
	end
end

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition({ on_list = removeDuplicates })
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<leader>vws", function()
		vim.lsp.buf.workspace_symbol()
	end, opts)
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, opts)
	vim.keymap.set("n", "<leader>vca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>vrr", function()
		vim.lsp.buf.references()
	end, opts)
	vim.keymap.set("n", "gr", function()
		vim.lsp.buf.references(nil, { on_list = removeDuplicates })
	end, opts)
	vim.keymap.set("n", "<leader>vrn", function()
		vim.lsp.buf.rename()
	end, opts)
	vim.keymap.set("i", "<C-q>", function()
		vim.lsp.buf.signature_help()
	end, opts)
	-- Show diagnostics
	vim.keymap.set("n", "<leader>e", function()
		-- need to call twice to jump into float window
		vim.diagnostic.open_float()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "<leader>Q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
end)

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
	virtual_lines = false,
})
