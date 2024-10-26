local lsp = require("lsp-zero")

lsp.preset("recommended")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {
		"tsserver",
		"rust_analyzer",
		"pyright",
        "marksman",
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

lspconfig.phpactor.setup({ capabilities = capabilities })
lspconfig.vuels.setup({
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
	capabilities = capabilities,
})
lspconfig.jsonls.setup({})
lsp.set_preferences({
	suggest_lsp_servers = false,
	sign_icons = {
		error = "E",
		warn = "W",
		hint = "H",
		info = "I",
	},
})

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
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
		vim.lsp.buf.references()
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
})
