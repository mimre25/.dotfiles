local cmp = require("cmp")

cmp.setup({
    enabled = function()
        return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt"
            or require("cmp_dap").is_dap_buffer()
    end,
})

local cmp_select = { behavior = cmp.SelectBehavior.Select }

cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    })
})
cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
    sources = {
        { name = "dap" },
    },
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline({ '/', '?' }, {
--     mapping = cmp.mapping.preset.cmdline({
--         ['<CR>'] = {
--             c = function(default)
--                 if cmp.visible() then
--                     return cmp.confirm({ select = true })
--                 end
--
--                 default()
--             end,
--         },
--         ['<C-Space>'] = cmp.mapping.complete(),
--         ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
--         ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
--     }),
    -- sources = {
    --     { name = 'buffer' }
    -- }
-- })

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
-- cmp.setup.cmdline(':', {
--     mapping = cmp.mapping.preset.cmdline({
--         ['<CR>'] = {
--             c = function(default)
--                 if cmp.visible() then
--                     return cmp.confirm({ select = true })
--                 end
--
--                 default()
--             end,
--         },
--         ['<C-Space>'] = cmp.mapping.complete(),
--         ['<C-k>'] = cmp.mapping.select_prev_item(cmp_select),
--         ['<C-j>'] = cmp.mapping.select_next_item(cmp_select),
--     }),
    -- sources = cmp.config.sources({
    --     { name = 'path' }
    -- }, {
    --     { name = 'cmdline' }
    -- })
--})
