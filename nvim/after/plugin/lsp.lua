local lsp = require("lsp-zero")

lsp.preset("recommended")

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = {
        'tsserver',
        'rust_analyzer',
        'pyright'
    },
    handlers = {
        lsp.default_setup,
        lua_ls = function()
            local lua_opts = lsp.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end,

    },
})
local lspconfig = require('lspconfig')

lspconfig.ansiblels.setup {
    ansible = {
      path = "ansible"
    },
    executionEnvironment = {
      enabled = false
    },
    python = {
      interpreterPath = "/home/martin/micromamba/envs/ansible/bin/python"
    },
    validation = {
      enabled = false,
      lint = {
        enabled = false,
        path = "ansible-lint"
      }
    }
}
lspconfig.marksman.setup {}
lspconfig.rust_analyzer.setup {}
lspconfig.marksman.setup {}
lspconfig.pylsp.setup {}
lspconfig.phpactor.setup{}
lspconfig.vuels.setup {
  filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'},
  -- on_attach = function(client, bufnr)
  --   local opts = { buffer = bufnr, remap = false }
  --
  --   vim.keymap.set("n", "gf", function()
  --       vim.api.nvim_exec("normal! yi'", false)
  --       local name = vim.fn.getreg('"')
  --       local file = name: gsub("@", "src")
  --       vim.api.nvim_command(":e "..file )
  --       end, opts)
--   end
  }
-- lspconfig.tsserver.setup{
--   init_options = {
--     plugins = {
--       {
--         name = "@vue/typescript-plugin",
--         location = "/usr/local/lib/node_modules/@vue/typescript-plugin",
--         languages = {"javascript", "typescript", "vue"},
--       },
--     },
--   },
--   filetypes = {
--     "javascript",
--     "typescript",
--     "vue",
--   },
-- }

-- lspconfig.volar.setup{
--   filetypes = {'typescript', 'javascript', 'javascriptreact', 'typescriptreact', 'vue', 'json'}
-- }
--lspconfig.pyright.setup {
--    on_attach = on_attach,
--    capabilities = capabilities,
--    settings = {
--        python = {
--            analysis = {
--                autoSearchPaths = true,
--                diagnosticMode = "workspace",
--                useLibraryCodeForTypes = true
--            }
--        }
--    }
--
--}


lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-q>", function() vim.lsp.buf.signature_help() end, opts)
    -- Show diagnostics
    vim.keymap.set('n', '<leader>e', function()
        -- need to call twice to jump into float window
            vim.diagnostic.open_float()
            vim.diagnostic.open_float()
        end,
        opts)
    vim.keymap.set('n', '<leader>Q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})
