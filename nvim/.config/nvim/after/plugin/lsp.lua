local lsps = {
	"ansiblels",
	"eslint",
	"html",
	"jsonls",
	"lua_ls",
	"pylsp",
	"tailwindcss",
	"ts_ls",
	"yamlls",
	"intelephense",
	"ts_ls",
}

require("mason").setup({})
require("mason-lspconfig").setup({ ensure_installed = lsps })

--- copied from lsp config
vim.lsp.config("lua_ls", {
	on_init = function(client)
		if client.workspace_folders then
			local path = client.workspace_folders[1].name
			if
				path ~= vim.fn.stdpath("config")
				and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
			then
				return
			end
		end

		client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
			runtime = {
				-- Tell the language server which version of Lua you're using (most
				-- likely LuaJIT in the case of Neovim)
				version = "LuaJIT",
				-- Tell the language server how to find Lua modules same way as Neovim
				-- (see `:h lua-module-load`)
				path = {
					"lua/?.lua",
					"lua/?/init.lua",
				},
			},
			-- Make the server aware of Neovim runtime files
			workspace = {
				checkThirdParty = false,
				library = {
					vim.env.VIMRUNTIME,
					-- Depending on the usage, you might want to add additional paths
					-- here.
					-- '${3rd}/luv/library'
					-- '${3rd}/busted/library'
				},
				-- Or pull in all of 'runtimepath'.
				-- NOTE: this is a lot slower and will cause issues when working on
				-- your own configuration.
				-- See https://github.com/neovim/nvim-lspconfig/issues/3189
				-- library = {
				--   vim.api.nvim_get_runtime_file('', true),
				-- }
			},
		})
	end,
	settings = {
		Lua = {},
	},
})

vim.lsp.config("ansiblels", {
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

vim.lsp.config("pylsp", {
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

vim.lsp.config("ts_ls", {
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

vim.keymap.set("n", "gd", function()
	vim.lsp.buf.definition({ on_list = removeDuplicates })
end)
vim.keymap.set("n", "K", function()
	vim.lsp.buf.hover()
end)
vim.keymap.set("n", "<leader>vws", function()
	vim.lsp.buf.workspace_symbol()
end)
vim.keymap.set("n", "<leader>vd", function()
	vim.diagnostic.open_float()
end)
vim.keymap.set("n", "<leader>vca", function()
	vim.lsp.buf.code_action()
end)
vim.keymap.set("n", "gr", function()
	vim.lsp.buf.references(nil, { on_list = removeDuplicates })
end)
vim.keymap.set("n", "<leader>rn", function()
	vim.lsp.buf.rename()
end)
vim.keymap.set("i", "<C-q>", function()
	vim.lsp.buf.signature_help()
end)
-- Show diagnostics
vim.keymap.set("n", "<leader>e", function()
	-- need to call twice to jump into float window
	vim.diagnostic.open_float()
	vim.diagnostic.open_float()
end)
vim.keymap.set("n", "<leader>Q", "<cmd>lua vim.diagnostic.setloclist()<CR>")

vim.diagnostic.config({
	virtual_text = true,
	virtual_lines = false,
})

for _, lsp in pairs(lsps) do
	vim.lsp.enable(lsp)
end
