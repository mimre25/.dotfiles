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
    pattern = { "*" },
    callback = function()
        if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
            vim.api.nvim_exec("normal! g'\"", false)
        end
    end
})

-- autocmd to go to github when using `gf` in lazy.lua
-- start
vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "*lazy.lua" },
    callback = function()
        vim.keymap.set("n", "gf", function()
            vim.api.nvim_exec('normal! yi"', false)
            local name = vim.fn.getreg('"')
            local url = "https://github.com/" .. name
            os.execute("xdg-open " .. url)
        end)
    end
})

vim.api.nvim_create_autocmd("BufLeave", {
    pattern = { "*lazy.lua" },
    callback = function()
        vim.keymap.del("n", "gf")
    end
})
-- end
-- autocmd to go to github when using `gf` in lazy.lua
