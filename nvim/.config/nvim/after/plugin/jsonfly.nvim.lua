local lsp = require("lsp-zero")

vim.keymap.set("n", "<leader>j", function()
    if vim.bo.filetype == "" then
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(args)
                vim.lsp.buf.format()
            end,
            buffer = vim.api.nvim_get_current_buf()
        })
        vim.bo.filetype = "json"
    else
        vim.cmd("Telescope jsonfly")
    end
end)
