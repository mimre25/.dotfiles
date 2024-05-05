vim.api.nvim_create_autocmd("BufReadPost", {
    pattern = { "*" },
    callback = function(data)
        -- wanna start in first line when editing a commit message
        local is_git_commit = data.file:match(".git/COMMIT_EDITMSG$")
        if is_git_commit == nil then
            vim.api.nvim_notify(data.file, vim.log.levels.INFO, {})
            if vim.fn.line("'\"") > 1 and vim.fn.line("'\"") <= vim.fn.line("$") then
                vim.api.nvim_exec("normal! g'\"", false)
            end
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


-- everything is an ansible file if ansible is in the path

vim.api.nvim_create_autocmd("BufEnter", {
    pattern = { "**/ansible/**.yml" },
    callback = function()
        vim.cmd.setfiletype("yaml.ansible")
    end
})

vim.api.nvim_create_autocmd('TextYankPost', {
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

vim.api.nvim_create_autocmd({"BufWritePre"}, {
    pattern = "*",
    command = [[%s/\s\+$//e]],
})
