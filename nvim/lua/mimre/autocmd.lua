--local group = vim.api.nvim_create_augroup("TermConfig", { clear = true })
--vim.api.nvim_create_autocmd("TermOpen", {
--    callback = function()
--        vim.opt.nu = false
--        vim.opt.relativenumber = false
--        --vim.cmd("colorscheme default")
--    end,
--    group = group
--})


vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = {"*"},
    callback = function()
        if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
            vim.api.nvim_exec("normal! g'\"",false)
        end
    end
})
